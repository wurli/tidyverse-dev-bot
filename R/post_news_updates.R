post_news_updates <- function(x, token = NULL) {
  
  force(x)
  
  if (length(x) == 0) {
    cli_alert_info("Nothing to post!")
    return(invisible(x))
  }

  token <- token %||% tidyverse_dev_bot_twitter_token()
  
  cli_h2("Posting tweets")
  
  threads <- x |> 
    group_split(package, tweet_id) |> 
    map(pull, tweet)
  
  n_posted <- 0L
  
  for (thread in threads) {
    
    res <- tryCatch(
      post_thread(thread, token),
      error = function(e) {
        cli_warn(c(
          "Posting failed",
          i = "Failure on thread {paste(thread, collapse = '\n\n')}",
          i = "Original error: {paste(e$message, e$body)}"
        ))
        FALSE
      }
    )
    
    if (isFALSE(res)) break
    
    n_posted <- n_posted + 1L
    
  }
  
  cli_alert_success(
    "{.val {n_posted}}/{.val {length(threads)}} threads posted successfully"
  )
  
  invisible(TRUE)
  
}

# Note that in the event that the refresh token ever stops working (for whatever reason - this 
# approach doesn't feel robust at all), You can generate a new refresh token like this. NB,
# this will require you to manually confirm access in the browser:
# token <- rtweet::rtweet_oauth2(
#   client = rtweet::rtweet_client(
#     client_id = Sys.getenv("TWITTER_CLIENT_ID"),
#     client_secret = Sys.getenv("TWITTER_CLIENT_SECRET"),
#     app = "tidyverse-dev-bot"
#   )
# )
# 
# token$refresh_token
tidyverse_dev_bot_twitter_token <- function(client_id = Sys.getenv("TWITTER_CLIENT_ID"),
                                            client_secret = Sys.getenv("TWITTER_CLIENT_SECRET"),
                                            encryption_key_env_var = "ENCRYPTION_KEY",
                                            refresh_token_path = "refresh-token.rds") {
  
  client <- rtweet::rtweet_client(
    client_id = client_id,
    client_secret = client_secret,
    app = "tidyverse-dev-bot"
  )
  
  # Have to use this internal function because refreshing updates the refresh 
  # token, causing httr2::oauth_flow_refresh() to error. Instead, using the
  # internal function, we can capture the new refresh token and use it to 
  # overwrite the old one.
  token <- httr2:::token_refresh(
    client = client,
    refresh_token = httr2::secret_read_rds(
      refresh_token_path, 
      key = encryption_key_env_var
    )
  )
  
  cli::cli_alert("Overwriting the refresh token {.path {refresh_token_path}}")
  
  httr2::secret_write_rds(
    token$refresh_token,
    path = refresh_token_path,
    key = encryption_key_env_var
  )
  
  token
  
}

post_thread <- function(x, token) {
  
  # First bit of a tweet (for cli alerts)
  first <- function(x) {
    x <- x |> str_replace_all("\n+", " / ") 
    first_chars(x[1], 60, always_dots = length(x) > 1)
  }
  
  # Post nothing
  if (length(x) == 0) {
    cli_warn("Not posting anything")
    return(invisible(x))
  }
  
  # Post a single tweet - not a thread
  if (length(x) == 1) {
    try_post(status = x, token = token)
    cli_alert_success("Tweet posted successfully! {.emph {first(x)}}")
    return(invisible(x))
  }
  
  # Post a thread
  x |> 
    reduce(.init = NULL, .f = function(status_id, tweet) {
      next_id <- if (is.null(status_id)) {
        try_post(status = tweet, token = token)
      } else {
        try_post(
          status = tweet, token = token, 
          reply = list(in_reply_to_tweet_id = status_id)
        )
      }
      Sys.sleep(1) # API doesn't like things to be too quick
      next_id
    })
  
  cli_alert_success(
    "Thread of {.val {length(x)}} tweets posted successfully! {.emph {first(x)}}"
  )
  
  invisible(x)
  
}

try_post <- function(status, token, ..., .tries = 3) {
  
  for (i in seq_len(.tries)) {
    
    res <- tryCatch(
      {
        tweet_id <- rtweet::tweet_post(status, token = token, ...)$id
        TRUE
      },
      error = function(e) e$message
    )
    
    if (isTRUE(res)) {
      break
    }
    
  }
  
  if (!isTRUE(res)) {
    # {cli} strings shouldn't start with a dot
    n_tries <- .tries
    cli_abort(c(
      "Could not post tweet after {.val {n_tries}} tries",
      i = "Here's the error: {res}"
    ))
  }
  
  tweet_id
  
}

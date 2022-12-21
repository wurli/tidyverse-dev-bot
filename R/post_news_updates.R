post_news_updates <- function(x) {
  
  force(x)
  
  if (length(x) == 0) {
    cli_alert_info("Nothing to post!")
    return(invisible(x))
  }
  
  cli_h2("Posting tweets")
  
  threads <- x |> 
    group_split(package, tweet_id) 
  
  n_posted <- 0L
  
  for (thread in threads) {
    
    res <- tryCatch(
      post_thread(thread),
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

post_thread <- function(x) {
  
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
    try_post(status = x)
    cli_alert_success("Tweet posted successfully! {.emph {first(x)}}")
    return(invisible(x))
  }
  
  # Post a thread
  x |> 
    reduce(.init = NULL, .f = function(status_id, tweet) {
      try_post(status = tweet, in_reply_to_status_id = status_id)
      next_id <- last_status_id()
      Sys.sleep(1) # API doesn't like things to be too quick
      next_id
    })
  
  cli_alert_success(
    "Thread of {.val {length(x)}} tweets posted successfully! {.emph {first(x)}}"
  )
  
  invisible(x)
  
}

try_post <- function(status, ..., .tries = 3) {
  
  for (i in seq_len(.tries)) {
    
    res <- tryCatch(
      {
        suppressMessages(rtweet::post_tweet(status, ...))
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
  
  invisible(TRUE)
  
}


last_status_id <- function() {
  
  id <- rtweet::get_my_timeline(n = 1)$id_str
  
  n <- length(id)
  
  if (n != 1) {
    cli_warn(c(
      "Non-unique status ids returned",
      i = "Expected 1; got {.val {n}}",
      i = "Returned ids: {.val {id}}"
    ))
  }
  
  id
  
}


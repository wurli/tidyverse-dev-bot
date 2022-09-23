make_tweets <- function(x) {
  x |> 
    imap(function(bullets, pkg) {
      bullets |> 
        map(~ make_tweet(.x$text, .x$children %||% character(), pkg))
    })
}



make_tweet <- function(bullet, sub_bullets = character(), package) {
  
  sections <- list(
    header = tibble(
      text = paste0("{", package, "} update:\n"),
      order = 0L,
      chars = nchar(text)
    ),
    main = tibble(
      text = bullet,
      order = 1L,
      chars = nchar(text)
    ),
    subs = tibble(
      text = subbullets_to_vec(sub_bullets),
      order = seq_along(sub_bullets) + 1L,
      chars = nchar(text)
    ),
    footer = tibble(
      text = paste0("\n\n", news_urls(.package = package, .for_humans = TRUE)),
      order = length(sub_bullets) + 2L,
      chars = .tweet_url_length
    )
  )
  
  tweet_try_single(sections) %||%
    tweet_try_thread(sections)
  
}

tweet_try_single <- function(sections) {
  
  if (nrow(sections$subs) > 0) {
    sections$subs <- sections$subs |> 
      summarise(
        text = paste(text, collapse = ""),
        order = min(order),
        chars = nchar(text)
      )
  }
  
  sections <- bind_rows(sections)
  
  if (sum(sections$chars) > .max_tweet_length) {
    return(NULL)
  } 
  
  sections |> 
    pull(text) |> 
    paste(collapse = "") |> 
    as_glue()
  
}

tweet_try_thread <- function(sections) {
  
  if (nrow(sections$subs) > 0) {
    sections$subs <- sections$subs |> 
      summarise(
        text = paste(text, collapse = ""),
        order = min(order),
        chars = nchar(text)
      )
  }
  
  sections |> 
    bind_rows() |> 
    pull(text) |> 
    paste(collapse = "") |> 
    glue::as_glue()
  
}


subbullets_to_vec <- function(x, syms = c("*", "-", ">")) {
  
  if (length(x) == 0) {
    return(character())
  }
  
  collapse <- function(x, indent = 1) {
    
    indent <<- indent
    
    prefix <- paste0(
      strrep(" ", 2 * (indent - 1)),
      syms[((indent - 1) %% length(syms)) + 1]
    )
    
    subs <- x$children
    
    c(
      paste0(prefix, x$text),
      if (!is.null(subs)) collapse(subs, indent + 1)
    )
    
  }
  
  out <- collapse(x)
  
  if (indent > 1) {
    cli::cli_alert_info("Max indent: {indent}")
  }
  
  outf
  
}

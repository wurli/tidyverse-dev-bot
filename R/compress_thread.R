
compress_thread <- function(x, is_codeblock = NULL, main_sep = "\n\n", 
                            extra_space = 7) {
  
  is_codeblock <- is_codeblock %||% rep(FALSE, length(x))
  
  reduce2(x, is_codeblock, .init = NULL, .f = function(accum, x, is_codeblock) {
    fully_compressed <- head(accum, -1)
    x_prev <- tail(accum, 1)
    new <- compress_two_tweets(x_prev, x, is_codeblock, extra_space = extra_space)
    c(fully_compressed, head(new, -1), tail(new, 1))
  })
  
}

# compress_two_tweets(
#   "A short tweet of 25 chars.",
#   paste(
#     "This second tweet should have a first sentence which will fit into the",
#     "same tweet as the first. This sentence will also fit into the first tweet.",
#     "However the third sentence of the tweet would overflow, because it is",
#     "very very very long, so the function will put it into the next tweet",
#     "thereby providing nice, readable breaks for the readers"
#   )
# )
# 
# compress_two_tweets(
#   "A short tweet of 25 chars.",
#   paste(
#     "```",
#     "This second tweet should have a first sentence which will fit into the",
#     "same tweet as the first. This sentence will also fit into the first tweet.",
#     "However the third sentence of the tweet would overflow, because it is",
#     "very very very long, so the function will put it into the next tweet",
#     "thereby providing nice, readable breaks for the readers",
#     "```",
#     sep = "\n"
#   ),
#   x2_is_code = TRUE
# )
compress_two_tweets <- function(x1, x2, x2_is_code = FALSE, main_sep = "\n\n", extra_space = 7) {
  
  if (length(x1) == 0) {
    return(x2)
  }
  
  if (length(x2) == 0) {
    return(x1)
  }
  
  pad <- strrep("x", extra_space)
  valid <- function(x) x |> paste0(pad) |> tweet_is_valid()
  
  x1_valid <- valid(x1)
  x2_valid <- valid(x2)
  
  # If x1 or x2 are too big to fit into a single tweet, break em up
  extra_before <- NULL
  extra_after <- NULL
  
  if (!x1_valid) {
    parts <- chop_up_tweet(x1, is_code = FALSE, padding = extra_space)
    extra_before <- head(parts, -1)
    x1 <- tail(parts, 1)
  }
  
  if (!x2_valid) {
    parts <- chop_up_tweet(x2, is_code = x2_is_code, padding = extra_space)
    extra_after <- tail(parts, -1)
    x2 <- head(parts, 1)
  }
  
  # Split code blocks at linebreaks, but don't chop off fence blocks. 
  # Split normal text by full-stops
  chunk_split   <- if (x2_is_code) "(?<!```)\n(?!```)" else "\\. "
  chunk_combine <- if (x2_is_code) "\n" else ". "
  free_space    <- max(.max_tweet_length - tweet_length(x1) - extra_space, 0)
  
  # If x2 is code it's better to keep it all in one tweet. If x1 takes up more
  # than 50% of a tweet, and if x2 is a valid tweet on its own, give it its own
  # tweet.
  if (x2_is_code && (free_space / .max_tweet_length) > 0.5) {
    if (x2_valid) {
      return(c(x1, x2))
    }
  }
  
  # To separate 'main' chunks of text
  combine <- main_sep
  
  go <- is_segmentable(x2, width = free_space, split = chunk_split) 
  
  # Recursively add bits of the second chunk to the first, and stop when
  # the first is no longer a valid tweet
  while(go) {
    
    if (length(x2) == 0) {
      break
    }
    
    parts <- x2 |> 
      str_segment1(
        padding = extra_space,
        split = chunk_split,
        combine = chunk_combine,
        n_splits = 1
      ) 
    
    x1_new <- paste(c(x1, parts[1]), collapse = combine)
    
    # From now on, use the 'combine' used within chunks, not to separate chunks
    combine <- chunk_combine
    go <- valid(x1_new)
    
    if (go) {
      x1 <- x1_new
      x2 <- tail(parts, -1)
    }
    
  }
  
  c(extra_before, x1, x2, extra_after)
  
}

chop_up_tweet <- function(x, is_code = FALSE, padding = 7, width = .max_tweet_length - padding) {
  
  if (is_code) {
    splits <- c("(?<!```)\n(?!```)")
    collapse <- "\n"
  } else {
    splits <- c("\n\n", "\n", "(?<=\\.) ", " ")
    collapse <- c("\n\n", "\n", " ", " ")
  }
  
  for (i in seq_along(splits)) {
    
    out <- str_segment1(x, padding = padding, split = splits[i], combine = collapse[i]) 
    
    valid <- tweet_is_valid(out, padding) 
    
    if (all(valid)) {
      return(out)
    }
    
  }
  
  cli_abort(c(
    "Could not break text into valid tweets",
    i = "Using {.arg is_code} = {.val {is_code}} and {.arg width} = {.val {width}}",
    i = "Check {.emph {x}}",
    i = "Invalid segment{?s}: {.emph {out[!valid]}}"
  ))
  
}

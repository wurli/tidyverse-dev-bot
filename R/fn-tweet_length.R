# Uses the javascript library made available by twitter
tweet_info <- function(x, attr = NULL) {
  out <- map(x, ~ .ct$call("twttr.txt.parseTweet", .x))
  if (is.null(attr)) return(out)
  mapper <- if (attr == "valid") map_lgl else map_int
  mapper(out, attr)
}

tweet_is_valid <- function(x) {
  tweet_info(x, "valid")
}

tweet_length <- function(x) {
  tweet_info(x, "weightedLength")
}

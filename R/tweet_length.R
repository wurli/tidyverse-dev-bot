# Uses the javascript library made available by twitter
# Also requires:
# library(V8)
# .ct <- v8()
# .ct$source("twitter-text/js/pkg/twitter-text-3.1.0.min.js")
tweet_info <- function(x, attr = NULL) {
  out <- map(x, ~ .ct$call("twttr.txt.parseTweet", .x))
  if (is.null(attr)) return(out)
  mapper <- if (attr == "valid") map_lgl else map_int
  mapper(out, attr)
}

tweet_is_valid <- function(x, pad = NULL) {
  pad <- strrep("x", pad %||% 0)
  x <- paste0(pad, x)
  tweet_info(x, "valid")
}

tweet_length <- function(x) {
  tweet_info(x, "weightedLength")
}

# Load twitter-text library
.ct <- V8::v8()
.ct$source("twitter-text-3.1.0.min.js")
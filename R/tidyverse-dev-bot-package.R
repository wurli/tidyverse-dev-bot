#' @keywords internal
"_PACKAGE"

# Set up twitter bot auth
rtweet::auth_as(rtweet::rtweet_bot(
  api_key       = Sys.getenv("TWITTER_API_KEY"),
  api_secret    = Sys.getenv("TWITTER_API_SECRET"),
  access_token  = Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret = Sys.getenv("TWITTER_ACCESS_SECRET")
))

# Tweet validation is performed by the `twitter-text` library. however
# this is useful when working out where to put line/tweet breaks
.max_tweet_length <- 280

## usethis namespace: start
#' @import rlang
#' @import dplyr
#' @import cli
#' @importFrom glue glue
## usethis namespace: end
NULL

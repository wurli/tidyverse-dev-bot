.onLoad <- function(libName, pkgName) {
  
  rtweet::auth_as(rtweet::rtweet_bot(
    api_key       = Sys.getenv("TWITTER_API_KEY"),
    api_secret    = Sys.getenv("TWITTER_API_SECRET"),
    access_token  = Sys.getenv("TWITTER_ACCESS_TOKEN"),
    access_secret = Sys.getenv("TWITTER_ACCESS_SECRET")
  ))
  
}
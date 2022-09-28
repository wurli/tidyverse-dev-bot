library(tidyverse)
library(glue)
library(V8) # For JS library to get tweet length
library(rtweet)


cat("working dir:", getwd(), "\n\n")
cat("Files:\n")
print(list.files())

# Load twitter-text library
.ct <- v8()
.ct$source("twitter-text/pkg/twitter-text-3.1.0.min.js")

# Tweet validation is performed by the `twitter-text` library. however
# this is useful when working out where to put line/tweet breaks
.max_tweet_length <- 280

# Set up twitter bot auth
rtweet::auth_as(rtweet::rtweet_bot(
  api_key       = Sys.getenv("TWITTER_API_KEY"),
  api_secret    = Sys.getenv("TWITTER_API_SECRET"),
  access_token  = Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret = Sys.getenv("TWITTER_ACCESS_SECRET")
))

# Load functions
list.files("R", full.names = TRUE) |> 
  walk(source)

# Throw a notification
cli::cli_h1("Tweeting news updates")

# Run *all* the stuff
news_urls() |> 
  pull_news_files(include_old = FALSE, overwrite = TRUE) |> 
  annotate_news_files() |> 
  get_news_data() |> 
  remove_old_bullets(overwrite = TRUE) |> 
  make_tweets() |> 
  post_news_updates()

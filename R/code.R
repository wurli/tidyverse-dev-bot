library(tidyverse)
library(glue)
library(V8) # For JS library to get tweet length

# Load twitter-text library
.ct <- v8()
.ct$source("twitter-text/js/pkg/twitter-text-3.1.0.min.js")

# Tweet validation is performed by the `twitter-text` library. however
# this is useful when working out where to put line/tweet breaks
.max_tweet_length <- 280

# Load functions
list.files("R", "^fn-", full.names = TRUE) |> 
  walk(source)

tweets <- news_urls(fake_package = "NEWS.md") |> 
  pull_news_files(include_old = T, overwrite = F) |> 
  annotate_news_files() |> 
  get_news_data() |> 
  remove_old_bullets(overwrite = T) |> 
  make_tweets()


rtweet::rtweet_bot(

)

rtweet::post_tweet(
  "This is a test tweet"
)
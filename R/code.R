library(tidyverse)
library(glue)

.max_tweet_length <- 280L
.tweet_url_length <- 23L

list.files("R", "^fn-", full.names = TRUE) |> 
  walk(source)

# TODO: Fix lua filter so that bullets are annotated correctly, i.e. using
# a for-loop. This is messing things up, particularly when bullets include
# code blocks

# urls                  <- news_urls(fake_package = "NEWS.md")
# news_files            <- pull_news_files(urls, include_old = T)
# news_files_annotated  <- annotate_news_files(news_files)
# news_data             <- get_news_data(news_files_annotated)
# new_bullets           <- remove_old_bullets(news_data, overwrite = F)
# new_bullets_formatted <- format_bullets(new_bullets)

new_bullets_formatted <- news_urls(fake_package = "NEWS.md", .package = "rlang") |> 
  pull_news_files(include_old = T) |> 
  annotate_news_files() |> 
  get_news_data() |> 
  remove_old_bullets(overwrite = F) |> 
  format_bullets()

formatted <- news_data |> 
  format_bullets() 

x <- formatted |> 
  make_tweets()

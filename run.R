# list.files("R", pattern = "\\.[rR]$", full.names = T) |> 
#   walk(source)

# -- Load Functions ------------------------------------------------------------
pkgload::load_all()

# -- Throw a notification ------------------------------------------------------
cli_h1("Posting news updates")

# -- Run *all* the stuff -------------------------------------------------------

# 1. Get URLS for NEWS.md files on GitHub
urls <- news_urls()
  
# 2. Download NEWS.md files, and return paths to the ones which have been 
#    updated since the last run
updated_news_files <- urls |> 
  pull_news_files(include_old = FALSE, update_cache = TRUE) 
  
# 3. Use pandoc to apply annotations to the news files delimiting different
#    bullet points
annotated_news_files <- updated_news_files |> 
  annotate_news_files(dir = "news-files-annotated") 
  
# 5. Make sure we don't post more than n updates per package. This is to
#    avoid spamming
annotated_news_files_short <- annotated_news_files |> 
  limit_update_sizes(n = 10)  
  
# 6. Exclude bullets which have already been posted
bullets_to_post <- annotated_news_files_short |> 
  remove_old_bullets(overwrite = TRUE) 
  
# 7. Turn bullet points into tweets
tweets <- bullets_to_post |> 
  make_tweets() 
  
# 8. Post using {rtweet}
tweets |> 
  post_news_updates()

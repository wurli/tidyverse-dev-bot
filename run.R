# list.files("R", pattern = "\\.[rR]$", full.names = T) |> 
#   walk(source)

# -- Load Functions ------------------------------------------------------------
pkgload::load_all()

# -- Throw a notification ------------------------------------------------------
cli_h1("Posting news updates")

# -- Run *all* the stuff -------------------------------------------------------

# 1. Get URLS for NEWS.md files on GitHub
news_urls() |> 
  
  # 2. Download NEWS.md files, and return paths to the ones which have been 
  # updated since the last run
  pull_news_files(include_old = FALSE, overwrite_cache = TRUE) |> 
  
  # 3. Use pandoc to apply annotations to the news files delimiting different
  # bullet points
  annotate_news_files(dir = "news-files-annotated") |> 
  
  # 5. Make sure we don't post more than n updates per package. This is to
  # avoid spamming
  limit_update_sizes(n = 10) |> 
  
  # Exclude bullets which have already been posted
  remove_old_bullets(overwrite = TRUE) |> 
  
  # Turn bullet points into tweets
  make_tweets() |> 
  
  # Post using {rtweet}
  post_news_updates()

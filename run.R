# list.files("R", pattern = "\\.[rR]$", full.names = T) |> 
#   walk(source)

# Load Functions
pkgload::load_all()

# Throw a notification
cli_h1("Tweeting news updates")

# Run *all* the stuff
news_urls() |> 
  pull_news_files(include_old = FALSE, overwrite = TRUE) |> 
  annotate_news_files() |> 
  get_news_data() |> 
  limit_update_sizes(n = 10) |> 
  remove_old_bullets(overwrite = TRUE) |> 
  make_tweets() |> 
  post_news_updates()

pull_news_files <- function(urls, 
                            dir = "news-files", 
                            hashes = "hashes.rds", 
                            include_old = FALSE) {
  
  hash_loc    <- file.path(dir, hashes)
  prev_hashes <- if (file.exists(hash_loc)) read_rds(file.path(dir, hashes)) else list()
  
  # For notifications
  force(urls)
  
  stopifnot(!is.null(names(urls)))
  
  # Use pandoc to convert the docs directly from the URL
  out <- urls |> 
    imap(function(url, pkg) {
      
      news <- tryCatch(
        read_file(url),
        error = function(e) {
          cli::cli_warn(c(
            "Could not read news for package {.pkg {pkg}}",
            i = "Here's the error: {e$message}"
          ))
          NULL
        }
      ) 
      
      if (is.null(news)) {
        return(NULL)
      }
      
      hash <- rlang::hash(news)
      
      file <- glue("{dir}/{pkg}.md")
      
      if (identical(hash, prev_hashes[[pkg]])) {
        cli::cli_alert_info("No changes to news for package {.pkg {pkg}}")
        return(if (include_old) file else NULL)
      }
      
      cli::cli_alert_warning("Caching news file for package {.pkg {pkg}}")
      
      # Sorry
      prev_hashes[[pkg]] <<- hash
      
      write_file(news, file)
      
      file
      
    }) |> 
    compact() 
  
  write_rds(prev_hashes, hash_loc)
  
  out
  
}
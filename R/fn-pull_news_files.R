#' Read NEWS.md files for tidyverse pkgs
#'
#' This function uses pandoc to read and parse NEWS.md files for tidyverse
#' packages. A custom lua filter is used to add annotations indicating lines
#' where individual bullets and bullet lists begin/end.
#'
#' @param urls A named list - names indicate packages and values indicate URLs
#'   to NEWS.md files
#' @param dir The directory to write the files to
#'
#' @return A named list of filepaths to the created documents
pull_news_files <- function(urls, dir = "news-files") {
  
  # For notifications
  force(urls)
  
  stopifnot(!is.null(names(urls)))
  
  # Use pandoc to convert the docs directly from the URL
  urls |> 
    imap(function(url, pkg) {
      
      cli::cli_alert_info("Reading/formatting package {.pkg {pkg}}")
      
      file <- glue("{dir}/{pkg}.md")
      
      res <- tryCatch(
        {
          system2(
            "pandoc", c("-o", file, url, "--lua-filter annotate-bullets.lua"),
            stdout = TRUE
          )
          TRUE
        },
        warning = function(w) {
          cli::cli_alert_warning("Failed to read/format package {.pkg {pkg}}")
          cli::cli_warn(c(
            "Failed to read/format package {.pkg {pkg}}",
            i = paste0("Original error:\n", w$message)
          ))
          NULL
        }
      )
      
      if (isTRUE(res)) file else NULL
      
    }) |> 
    compact()
  
}

#' Read NEWS.md files for tidyverse pkgs
#'
#' This function uses pandoc to read and parse NEWS.md files for tidyverse
#' packages. A custom lua filter is used to add annotations indicating lines
#' where individual bullets and bullet lists begin/end.
#'
#' @param files A named list - names indicate packages and values indicate 
#'   filepaths of NEWS.md files
#' @param dir The directory to write the files to
#'
#' @return A named list of filepaths to the created documents
annotate_news_files <- function(files, dir = "news-files-annotated", quiet = TRUE) {
  
  # For notifications
  force(files)
  
  cli_h2("Adding annotations to news data for easier parsing")
  
  stopifnot(!is.null(names(files)))
  
  # Use pandoc to convert the docs directly from the URL
  files |> 
    imap(function(path, pkg) {
      
      cli_alert("Annotating news file for package {.pkg {pkg}}")
      
      file <- glue("{dir}/{pkg}.md")
      
      res <- tryCatch(
        system2(
          "pandoc", c("-o", file, path, "--lua-filter annotate-bullets.lua"),
          stdout = TRUE
        ),
        warning = function(w) {
          cli_alert_warning("Could not annotate news file for package {.pkg {pkg}}")
          cli_warn(c(
            "Failed to annotate news file for package {.pkg {pkg}}",
            i = paste0("Original error:\n", w$message)
          ))
          NULL
        }
      )
      
      if (is.null(res)) {
        return(NULL)
      }
      
      if (!quiet) cat_line(res)
      
      file
      
    }) |> 
    compact()
  
}

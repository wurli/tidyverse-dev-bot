#' Read NEWS.md files for tidyverse pkgs
#'
#' This function uses pandoc to read and parse NEWS.md files for tidyverse
#' packages. A custom lua filter is used to add annotations indicating lines
#' where individual bullets and bullet lists begin/end.
#'
#' @param files A named list - names indicate packages and values indicate 
#'   filepaths of NEWS.md files
#' @param dir The directory to write the files to. If `NULL`, a temporary
#'   directory will be used, and the results will be returned as a 
#'   named list.
#' @param lua_filter The Lua filter used to annotate NEWS bullets
#'
#' @return A named list of filepaths to the created documents
annotate_news_files <- function(files = list.files("news-files", "\\.md$", full.names = TRUE), 
                                dir = NULL, 
                                quiet = TRUE,
                                lua_filter = project_file("annotate-bullets.lua")) {
  
  files <- set_names(files, ~ . |> basename() |> str_remove("\\.[^.]+$"))
  file_exists <- map_lgl(files, file.exists) 
  
  if (!all(file_exists)) {
    cli_abort(c(
      "Could not find file(s)",
      i = "Check {.val {unlist(files)[!file_exists]}}"
    ))
  }
  
  return_text <- is.null(dir)
  
  if (return_text) {
    dir <- tempfile("annotated_readmes")
    dir.create(dir)
    on.exit(unlink(dir))
  }
  
  cli_h2("Adding annotations to news data for easier parsing")
  
  annotated_readme_locs <- files |> 
    imap(function(path, pkg) {
      
      cli_alert("Annotating news file for package {.pkg {pkg}}")
      
      file <- glue("{dir}/{pkg}.md")
      
      res <- tryCatch(
        system2(
          "pandoc", c("-o", file, path, paste("--lua-filter", lua_filter)),
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
  
  if (!return_text) {
    return(annotated_readme_locs)
  }
  
  map(annotated_readme_locs, readr::read_lines)
  
}

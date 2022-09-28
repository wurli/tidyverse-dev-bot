news_urls <- function(..., .package = NULL, .for_humans = FALSE) {
  
  if (is.null(.package)) {
    cli::cli_h2("Getting URLs to {.code NEWS.md} files")
  }
  
  # Commented code can be used to dynamically produce `org`. It's hard-coded
  # for clarity and consistency.
  
  # pkgs <- tidyverse_packages()
  # 
  # urls <- pkgs |> 
  #   set_names() |> 
  #   map(utils::packageDescription) |> 
  #   map(~ paste(c(.x$URL, .x$BugReports), collapse = ", ")) |> 
  #   map(strsplit, ",\\s*") |> 
  #   map(1) |> 
  #   map(str_remove_all, "#readme$") |>  
  #   map(str_remove_all, "/issues$") |> 
  #   map(unique) |> 
  #   map(str_subset, "github") |> 
  #   map(str_subset, "github\\.io", negate = TRUE) |> 
  #   imap(str_subset) 
  # 
  # orgs <- urls %>% 
  #   imap(function(url, pkg) {
  #     url |> 
  #       str_remove(glue("/{pkg}$")) |> 
  #       str_extract(glue("(?<=/)[^/]+$"))
  #   })
  
  orgs <- list(
    broom         = "tidymodels", 
    cli           = "r-lib", 
    crayon        = "r-lib", 
    dbplyr        = "tidyverse", 
    dplyr         = "tidyverse", 
    dtplyr        = "tidyverse",
    forcats       = "tidyverse", 
    ggplot2       = "tidyverse",
    googledrive   = "tidyverse", 
    googlesheets4 = "tidyverse", 
    haven         = "tidyverse", 
    hms           = "tidyverse", 
    httr          = "r-lib", 
    # jsonlite      = "jeroen", # Uses NEWS (not .md) and master instead of main
    lubridate     = "tidyverse",
    magrittr      = "tidyverse", 
    modelr        = "tidyverse", 
    pillar        = "r-lib", 
    purrr         = "tidyverse", 
    readr         = "tidyverse", 
    readxl        = "tidyverse",
    reprex        = "tidyverse", 
    rlang         = "r-lib", 
    rstudioapi    = "rstudio", 
    rvest         = "tidyverse", 
    stringr       = "tidyverse", 
    tibble        = "tidyverse", 
    tidyr         = "tidyverse", 
    xml2          = "r-lib", 
    tidyverse     = "tidyverse"
  )
  
  url_pattern <- if (.for_humans) {
    "https://github.com/{org}/{pkg}/blob/main/NEWS.md"
  } else {
    "https://raw.githubusercontent.com/{org}/{pkg}/main/NEWS.md"
  }
  
  out <- orgs |> 
    imap(function(org, pkg) unclass(glue(url_pattern))) |> 
    c(list(...))
  
  if (is.null(.package)) out else out[.package]
  
}
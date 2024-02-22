news_urls <- function(..., .package = NULL, .for_humans = FALSE) {
  
  if (is.null(.package)) {
    cli_h2("Getting URLs for {.code NEWS.md} files")
  }
   
  pkgs <- tibble::tribble(
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Tidyverse
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ~pkg,            ~repo,        ~org,  ~branch,
               "blob",           "blob", "tidyverse",   "main",
             "dbplyr",         "dbplyr", "tidyverse",   "main",
              "dplyr",          "dplyr", "tidyverse",   "main",
             "dtplyr",         "dtplyr", "tidyverse",   "main",
              "dsbox",          "dsbox", "tidyverse",   "main",
            "forcats",        "forcats", "tidyverse",   "main",
               "funs",           "funs", "tidyverse",   "main",
            "ggplot2",        "ggplot2", "tidyverse",   "main",
        "googledrive",    "googledrive", "tidyverse",   "main",
      "googlesheets4",  "googlesheets4", "tidyverse",   "main",
              "haven",          "haven", "tidyverse",   "main",
                "hms",            "hms", "tidyverse",   "main",
          "lubridate",      "lubridate", "tidyverse",   "main",
           "magrittr",       "magrittr", "tidyverse",   "main",
             "modelr",         "modelr", "tidyverse",   "main",
         "multidplyr",     "multidplyr", "tidyverse",   "main",
       "nycflights13",   "nycflights13", "tidyverse",   "main",
             "pillar",         "pillar",     "r-lib",   "main",
              "purrr",          "purrr", "tidyverse",   "main",
              "readr",          "readr", "tidyverse",   "main",
             "readxl",         "readxl", "tidyverse",   "main",
             "reprex",         "reprex", "tidyverse",   "main",
              "rlang",          "rlang",     "r-lib",   "main",
         "rstudioapi",     "rstudioapi",   "rstudio",   "main",
              "rvest",          "rvest", "tidyverse",   "main",
            "stringr",        "stringr", "tidyverse",   "main",
             "tibble",         "tibble", "tidyverse",   "main",
              "tidyr",          "tidyr", "tidyverse",   "main",
          "tidyverse",      "tidyverse", "tidyverse",   "main",
              "vroom",          "vroom", "tidyverse",   "main",
               "xml2",           "xml2",     "r-lib",   "main",
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # r-lib / infrastructure 
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          "available",      "available",     "r-lib",   "main",
              "bench",          "bench",     "r-lib",   "main",
              "callr",          "callr",     "r-lib",   "main",
                "cli",            "cli",     "r-lib",   "main",
              "clock",          "clock",     "r-lib",   "main",
         "conflicted",     "conflicted",     "r-lib",   "main",
            "debugme",        "debugme",     "r-lib",   "main",
               "desc",           "desc",     "r-lib",   "main",
           "devtools",       "devtools",     "r-lib",   "main",
         "diffviewer",     "diffviewer",     "r-lib",   "main",
            "fastmap",        "fastmap",     "r-lib",   "main",
                 "fs",             "fs",     "r-lib",   "main",
             "gargle",         "gargle",     "r-lib",   "main",
                 "gh",             "gh",     "r-lib",   "main",
           "gitcreds",       "gitcreds",     "r-lib",   "main",
             "gmailr",         "gmailr",     "r-lib",   "main",
               "httr",           "httr",     "r-lib",   "main",
              "httr2",          "httr2",     "r-lib",   "main",
          "lifecycle",      "lifecycle",     "r-lib",   "main",
              "lintr",          "lintr",     "r-lib",   "main",
            "memoise",        "memoise",     "r-lib",   "main",
            "mockery",        "mockery",     "r-lib",   "main",
                "pak",            "pak",     "r-lib",   "main",
            "pkgdown",        "pkgdown",     "r-lib",   "main",
         "prettycode",     "prettycode",     "r-lib",   "main",
        "prettyunits",    "prettyunits",     "r-lib",   "main",
                 "R6",             "R6",     "r-lib",   "main",
               "ragg",           "ragg",     "r-lib",   "main",
          "rcmdcheck",      "rcmdcheck",     "r-lib",   "main",
            "remotes",        "remotes",     "r-lib",   "main",
                "rex",            "rex",     "r-lib",   "main",
           "roxygen2",       "roxygen2",     "r-lib",   "main",
             "scales",         "scales",     "r-lib",   "main",
        "sessioninfo",    "sessioninfo",     "r-lib",   "main",
             "slider",         "slider",     "r-lib",   "main",
             "styler",         "styler",     "r-lib",   "main",
           "testthat",       "testthat",     "r-lib",   "main",
         "tidyselect",     "tidyselect",     "r-lib",   "main",
            "usethis",        "usethis",     "r-lib",   "main",
              "vctrs",          "vctrs",     "r-lib",   "main",
              "waldo",          "waldo",     "r-lib",   "main",
              "withr",          "withr",     "r-lib",   "main",
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # RStudio / Posit 
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "blastula",       "blastula",   "rstudio", "master",
              "bslib",          "bslib",   "rstudio",   "main",
           "chromote",       "chromote",   "rstudio",   "main",
            "cloudml",        "cloudml",   "rstudio",   "main",
             "config",         "config",   "rstudio",   "main",
          "crosstalk",      "crosstalk",   "rstudio",   "main",
                 "DT",             "DT",   "rstudio",   "main",
      "flexdashboard",  "flexdashboard",   "rstudio",   "main",
        "fontawesome",    "fontawesome",   "rstudio",   "main",
                 "gt",             "gt",   "rstudio", "master",
          "htmltools",      "htmltools",   "rstudio",   "main",
              "keras",          "keras",   "rstudio",   "main",
            "leaflet",        "leaflet",   "rstudio",   "main",
            "nomnoml",        "nomnoml",   "rstudio",   "main",
             "pins-r",         "pins-r",   "rstudio",   "main",
            "plumber",        "plumber",   "rstudio",   "main",
         "pointblank",     "pointblank",   "rstudio",   "main",
               "pool",           "pool",   "rstudio",   "main",
            "profvis",        "profvis",   "rstudio",   "main",
           "promises",       "promises",   "rstudio",   "main",
               "r2d3",           "r2d3",   "rstudio",   "main",
           "reactlog",       "reactlog",   "rstudio",   "main",
               "renv",           "renv",   "rstudio",   "main",
         "reticulate",     "reticulate",   "rstudio",   "main",
          "rmarkdown",      "rmarkdown",   "rstudio",   "main",
          "rsconnect",      "rsconnect",   "rstudio",   "main",
         "rstudioapi",     "rstudioapi",   "rstudio",   "main",
              "shiny",          "shiny",   "rstudio",   "main",
     "shinydashboard", "shinydashboard",   "rstudio",   "main",
         "shinytest2",     "shinytest2",   "rstudio",   "main",
      "shinyuieditor",  "shinyuieditor",   "rstudio",   "main",
      "shinyvalidate",  "shinyvalidate",   "rstudio",   "main",
           "sortable",       "sortable",   "rstudio",   "main",
         "tensorflow",     "tensorflow",   "rstudio",   "main",
           "thematic",       "thematic",   "rstudio",   "main",
            "vetiver",      "vetiver-r",   "rstudio",   "main",
           "webshot2",       "webshot2",   "rstudio",   "main",
  )
  
  url_pattern <- if (.for_humans) {
    "https://github.com/{org}/{repo}/blob/{branch}/NEWS.md"
  } else {
    "https://raw.githubusercontent.com/{org}/{repo}/{branch}/NEWS.md"
  }
  
  out <- pkgs |>
    mutate(url = unclass(glue(url_pattern))) |>
    pull(url, pkg) |>
    as.list()
  
  if (is.null(.package)) out else out[.package]
  
}

# Helper to get all the packages for an organisation
get_org_pkgs <- function(org, n_repos) {
  resps <- seq_len(ceiling(n_repos / 100)) |> # Pages to get (100 pkgs/page)
    map(
      \(page) httr2::request(glue("https://api.github.com/orgs/{org}/repos")) |>
        httr2::req_url_query(per_page = 100, page = page) |>
        httr2::req_perform() |>
        httr2::resp_body_json()
    ) |>
    list_flatten()
  
  check_repo_files_exist <- function(repo, files) {
    urls <- glue("https://raw.githubusercontent.com/{org}/{repo}/HEAD/{files}")
    files <- map(urls, safely(~ readLines(url(.), warn = FALSE))) |>
      map("result") |>
      compact()
    length(files) == length(urls)
  }
  
  pkgs <- resps |> 
    keep(~ !.$archived) |>
    map_chr("name") |>
    set_names() |>
    keep(check_repo_files_exist, c("DESCRIPTION", "NEWS.md")) |>
    names() |>
    sort()
  
  out <- pkgs |>
    map(\(pkg) list(
      pkg = pkg, 
      org = org, 
      branch = resps |> 
        keep(\(r) r$name == pkg) |> 
        map_chr("default_branch")
    ))
  
  out
}


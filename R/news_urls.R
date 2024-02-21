news_urls <- function(..., .package = NULL, .for_humans = FALSE) {
  
  if (is.null(.package)) {
    cli_h2("Getting URLs for {.code NEWS.md} files")
  }
   
  pkgs <- list(
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Tidyverse
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    list(pkg = "blob"         , org = "tidyverse" , branch = "main"),
    list(pkg = "dbplyr"       , org = "tidyverse" , branch = "main"),
    list(pkg = "dplyr"        , org = "tidyverse" , branch = "main"),
    list(pkg = "dtplyr"       , org = "tidyverse" , branch = "main"),
    list(pkg = "dsbox"        , org = "tidyverse" , branch = "main"),
    list(pkg = "forcats"      , org = "tidyverse" , branch = "main"),
    list(pkg = "funs"         , org = "tidyverse" , branch = "main"),
    list(pkg = "ggplot2"      , org = "tidyverse" , branch = "main"),
    list(pkg = "googledrive"  , org = "tidyverse" , branch = "main"),
    list(pkg = "googlesheets4", org = "tidyverse" , branch = "main"),
    list(pkg = "haven"        , org = "tidyverse" , branch = "main"),
    list(pkg = "hms"          , org = "tidyverse" , branch = "main"),
    list(pkg = "lubridate"    , org = "tidyverse" , branch = "main"),
    list(pkg = "magrittr"     , org = "tidyverse" , branch = "main"),
    list(pkg = "modelr"       , org = "tidyverse" , branch = "main"),
    list(pkg = "multidplyr"   , org = "tidyverse" , branch = "main"),
    list(pkg = "nycflights13" , org = "tidyverse" , branch = "main"),
    list(pkg = "pillar"       , org = "r-lib"     , branch = "main"),
    list(pkg = "purrr"        , org = "tidyverse" , branch = "main"),
    list(pkg = "readr"        , org = "tidyverse" , branch = "main"),
    list(pkg = "readxl"       , org = "tidyverse" , branch = "main"),
    list(pkg = "reprex"       , org = "tidyverse" , branch = "main"),
    list(pkg = "rlang"        , org = "r-lib"     , branch = "main"),
    list(pkg = "rstudioapi"   , org = "rstudio"   , branch = "main"),
    list(pkg = "rvest"        , org = "tidyverse" , branch = "main"),
    list(pkg = "stringr"      , org = "tidyverse" , branch = "main"),
    list(pkg = "tibble"       , org = "tidyverse" , branch = "main"),
    list(pkg = "tidyr"        , org = "tidyverse" , branch = "main"),
    list(pkg = "tidyverse"    , org = "tidyverse" , branch = "main"),
    list(pkg = "vroom"        , org = "tidyverse" , branch = "main"),
    list(pkg = "xml2"         , org = "r-lib"     , branch = "main"),
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # R infrastructure
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # list(pkg = "ansistrings"  , org = "r-lib"     , branch = "master"), # Archived
    list(pkg = "archive"      , org = "r-lib"     , branch = "main"),
    list(pkg = "asciicast"    , org = "r-lib"     , branch = "main"),
    list(pkg = "available"    , org = "r-lib"     , branch = "main"),
    list(pkg = "backports"    , org = "r-lib"     , branch = "main"),
    list(pkg = "bench"        , org = "r-lib"     , branch = "main"),
    list(pkg = "brio"         , org = "r-lib"     , branch = "main"),
    list(pkg = "cachem"       , org = "r-lib"     , branch = "main"),
    list(pkg = "callr"        , org = "r-lib"     , branch = "main"),
    list(pkg = "carrier"      , org = "r-lib"     , branch = "main"),
    list(pkg = "cereal"       , org = "r-lib"     , branch = "main"),
    list(pkg = "cleancall"    , org = "r-lib"     , branch = "main"),
    list(pkg = "cli"          , org = "r-lib"     , branch = "main"),
    # list(pkg = "cliapp"       , org = "r-lib"     , branch = "main"), # Superseded by cli
    list(pkg = "clisymbols"   , org = "r-lib"     , branch = "main"),
    list(pkg = "clock"        , org = "r-lib"     , branch = "main"),
    # list(pkg = "conf"         , org = "r-lib"     , branch = "master"), # Archived
    list(pkg = "conflicted"   , org = "r-lib"     , branch = "main"),
    list(pkg = "coro"         , org = "r-lib"     , branch = "main"),
    list(pkg = "covr"         , org = "r-lib"     , branch = "main"),
    list(pkg = "cpp11"        , org = "r-lib"     , branch = "main"),
    list(pkg = "crancache"    , org = "r-lib"     , branch = "main"),
    # list(pkg = "crayon"       , org = "r-lib"     , branch = "main"), # Superseded by cli
    list(pkg = "debugme"      , org = "r-lib"     , branch = "main"),
    list(pkg = "decor"        , org = "r-lib"     , branch = "main"),
    list(pkg = "desc"         , org = "r-lib"     , branch = "main"),
    # list(pkg = "devoid"       , org = "r-lib"     , branch = "main"), # Very rarely updated
    list(pkg = "devtools"     , org = "r-lib"     , branch = "main"),
    list(pkg = "diffviewer"   , org = "r-lib"     , branch = "main"),
    list(pkg = "downlit"      , org = "r-lib"     , branch = "main"),
    # list(pkg = "ellipsis"     , org = "r-lib"     , branch = "main"), # Superseded by rlang
    list(pkg = "evaluate"     , org = "r-lib"     , branch = "main"),
    list(pkg = "fastmap"      , org = "r-lib"     , branch = "main"),
    list(pkg = "filelock"     , org = "r-lib"     , branch = "main"),
    list(pkg = "fs"           , org = "r-lib"     , branch = "main"),
    list(pkg = "gargle"       , org = "r-lib"     , branch = "main"),
    list(pkg = "generics"     , org = "r-lib"     , branch = "main"),
    list(pkg = "gh"           , org = "r-lib"     , branch = "main"),
    list(pkg = "gitcreds"     , org = "r-lib"     , branch = "main"),
    list(pkg = "gmailr"       , org = "r-lib"     , branch = "main"),
    list(pkg = "gtable"       , org = "r-lib"     , branch = "main"),
    list(pkg = "here"         , org = "r-lib"     , branch = "main"),
    list(pkg = "httr"         , org = "r-lib"     , branch = "main"),
    list(pkg = "httr2"        , org = "r-lib"     , branch = "main"),
    # list(pkg = "httrmock"     , org = "r-lib"     , branch = "master"), # Archived
    list(pkg = "isoband"      , org = "r-lib"     , branch = "main"),
    list(pkg = "keyring"      , org = "r-lib"     , branch = "main"),
    list(pkg = "later"        , org = "r-lib"     , branch = "main"),
    list(pkg = "lifecycle"    , org = "r-lib"     , branch = "main"),
    list(pkg = "lintr"        , org = "r-lib"     , branch = "main"),
    # list(pkg = "liteq"        , org = "r-lib"     , branch = "main"), # Probably too technical
    # list(pkg = "lobstr"       , org = "r-lib"     , branch = "main"), # Superseded by rlang
    list(pkg = "meltr"        , org = "r-lib"     , branch = "main"),
    list(pkg = "memoise"      , org = "r-lib"     , branch = "main"),
    list(pkg = "memtools"     , org = "r-lib"     , branch = "main"),
    list(pkg = "mockery"      , org = "r-lib"     , branch = "main"),
    list(pkg = "oskeyring"    , org = "r-lib"     , branch = "main"),
    # list(pkg = "osname"       , org = "r-lib"     , branch = "master"), # Archived
    list(pkg = "pak"          , org = "r-lib"     , branch = "main"),
    list(pkg = "pingr"        , org = "r-lib"     , branch = "main"),
    # list(pkg = "pkgapi"       , org = "r-lib"     , branch = "main"), # Unreleased
    list(pkg = "pkgbuild"     , org = "r-lib"     , branch = "main"),
    list(pkg = "pkgcache"     , org = "r-lib"     , branch = "main"),
    list(pkg = "pkgdepends"   , org = "r-lib"     , branch = "main"),
    list(pkg = "pkgdown"      , org = "r-lib"     , branch = "main"),
    list(pkg = "pkgload"      , org = "r-lib"     , branch = "main"),
    list(pkg = "prettycode"   , org = "r-lib"     , branch = "main"),
    list(pkg = "prettyunits"  , org = "r-lib"     , branch = "main"),
    list(pkg = "processx"     , org = "r-lib"     , branch = "main"),
    list(pkg = "progress"     , org = "r-lib"     , branch = "main"),
    list(pkg = "ps"           , org = "r-lib"     , branch = "main"),
    list(pkg = "R6"           , org = "r-lib"     , branch = "main"),
    list(pkg = "ragg"         , org = "r-lib"     , branch = "main"),
    list(pkg = "rappdirs"     , org = "r-lib"     , branch = "main"),
    list(pkg = "rcmdcheck"    , org = "r-lib"     , branch = "main"),
    list(pkg = "rematch2"     , org = "r-lib"     , branch = "main"),
    list(pkg = "remotes"      , org = "r-lib"     , branch = "main"),
    list(pkg = "revdepcheck"  , org = "r-lib"     , branch = "main"),
    list(pkg = "rex"          , org = "r-lib"     , branch = "main"),
    list(pkg = "roxygen2"     , org = "r-lib"     , branch = "main"),
    list(pkg = "roxygen2md"   , org = "r-lib"     , branch = "main"),
    list(pkg = "rprojroot"    , org = "r-lib"     , branch = "main"),
    # list(pkg = "rray"         , org = "r-lib"     , branch = "main"), # Seemingly no longer updated
    list(pkg = "scales"       , org = "r-lib"     , branch = "main"),
    list(pkg = "sessioninfo"  , org = "r-lib"     , branch = "main"),
    list(pkg = "showimage"    , org = "r-lib"     , branch = "main"),
    list(pkg = "slider"       , org = "r-lib"     , branch = "main"),
    # list(pkg = "sloop"        , org = "r-lib"     , branch = "main"), # Seemingly no longer updated
    list(pkg = "styler"       , org = "r-lib"     , branch = "main"),
    list(pkg = "svglite"      , org = "r-lib"     , branch = "main"),
    list(pkg = "systemfonts"  , org = "r-lib"     , branch = "main"),
    # list(pkg = "tar"          , org = "r-lib"     , branch = "master"), # Archived
    list(pkg = "testthat"     , org = "r-lib"     , branch = "main"),
    list(pkg = "textshaping"  , org = "r-lib"     , branch = "main"),
    list(pkg = "tidyselect"   , org = "r-lib"     , branch = "main"),
    # list(pkg = "tracer"       , org = "r-lib"     , branch = "main"), # Archived
    # list(pkg = "tzdb"         , org = "r-lib"     , branch = "main"), # Probably too technical
    # list(pkg = "urlchecker"   , org = "r-lib"     , branch = "main"), # Probably too technical
    list(pkg = "usethis"      , org = "r-lib"     , branch = "main"),
    list(pkg = "vctrs"        , org = "r-lib"     , branch = "main"),
    list(pkg = "vdiffr"       , org = "r-lib"     , branch = "main"),
    list(pkg = "waldo"        , org = "r-lib"     , branch = "main"),
    list(pkg = "webfakes"     , org = "r-lib"     , branch = "main"),
    list(pkg = "whoami"       , org = "r-lib"     , branch = "main"),
    list(pkg = "withr"        , org = "r-lib"     , branch = "main"),
    list(pkg = "xmlparsedata" , org = "r-lib"     , branch = "main"),
    # list(pkg = "xopen"        , org = "r-lib"     , branch = "main"), # Very rarely updated
    list(pkg = "ymlthis"      , org = "r-lib"     , branch = "main"),
    list(pkg = "zeallot"      , org = "r-lib"     , branch = "main"),
    list(pkg = "zip"          , org = "r-lib"     , branch = "main")
  ) 

  
  url_pattern <- if (.for_humans) {
    "https://github.com/{org}/{pkg}/blob/{branch}/NEWS.md"
  } else {
    "https://raw.githubusercontent.com/{org}/{pkg}/{branch}/NEWS.md"
  }
  
  out        <- map(pkgs, with, unclass(glue(url_pattern)))
  names(out) <- map_chr(pkgs, "pkg")
  
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


library(tidyverse)
library(glue)

pkgs <- tidyverse_packages()

urls <- pkgs |> 
  set_names() |> 
  map(utils::packageDescription) |> 
  map(~ paste(c(.x$URL, .x$BugReports), collapse = ", ")) |> 
  map(strsplit, ",\\s*") |> 
  map(1) |> 
  map(str_remove_all, "#readme$") |>  
  map(str_remove_all, "/issues$") |> 
  map(unique) |> 
  map(str_subset, "github") |> 
  map(str_subset, "github\\.io", negate = TRUE) |> 
  imap(str_subset) 

walk(urls, function(u) {
  
  system2("git", c("submodule", "add", u, "submodules"))
  
})
  
stopifnot(map_lgl(urls, ~ length(.) == 1))

news_urls        <- glue("https://raw.githubusercontent.com/tidyverse/{pkgs}/main/NEWS.md")
names(news_urls) <- pkgs

updates <- news_urls %>% 
  map( ~ tryCatch(
    read_file(.x),
    error = function(e) if (grepl("error 404", e$message)) NULL else stop(e)
  )) %>% 
  compact()

updates %>% 
  
  # Get bullets which are under first header only
  map(function(x) {
    x                     <- str_split(x, "\n")[[1]]
    is_header             <- str_detect(x, "^\\s*#\\s")
    is_under_first_header <- cumsum(is_header) <= 1
    x                     <- x[is_under_first_header]
    paste(x, collapse = "\n")
  }) %>%
  
  # Split text into individual bullets
  map(~ str_split(., "\n(?=([*-]\\s+)|(#+\\s+))")[[1]]) %>% 
  
  # Construct a tibble of bullets with headings
  map(function(x) {
    tibble(
      Text = x %>% 
        str_replace_all("(?<![\n {0,20}]) +", " ") %>% 
        str_subset("^[*-]") %>%              # Remove everything except bullets
        str_subset("^$", negate = TRUE)      # Remove empty entries
    )
  }) %>% 
  bind_rows(.id = "Package")


chomp <- function(e, level = 1) {
  
  if (!is.list(e)) {
    return(tibble(content = as.character(e)))
  }
  
  if (is.null(names(e))) {
    return(map_dfr(e, chomp, level))
  }
  
  if ("t" %in% names(e)) {
    out <- chomp(e$c, level + 1) %>% 
      mutate("tag_{level}" := e$t, .before = 1)
    
    return(out)
  }
  
  chomp(e$c, level + 1)
  
}

json <- jsonlite::read_json("quarto-filter-test.json")

json$blocks %>% 
  chomp() %>% 
  select(sort(colnames(.))) %>% 
  relocate(content, .after = last_col()) %>% 
  filter(
    if_any(starts_with("tag"), ~ . %in% c("Str", "CodeBlock", "Code")),
    content != ""
  ) %>% 
  print(n = Inf)

json$blocks[[1]]

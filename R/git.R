stopifnot(map_lgl(urls, ~ length(.) == 1))

all(pkgs %in% list.files("submodules"))

git <- function(..., .repo = NULL, .quiet = TRUE) {
  
  out <- system2("git", c(
    if (!is.null(.repo)) glue("--work-tree={.repo}"),
    ...
  ), stdout = TRUE)
  
  out <- as_glue(paste(out, collapse = "\n"))
  if (!.quiet) cat(out)
  out
  
}

list.files("submodules", full.names = TRUE)[1:3] |>
  set_names(basename) |> 
  map(function(submodule) {
    
    git("fetch", .repo = submodule)
    status <- git("status", "README.md", .repo = submodule)
    
    if (str_detect(status, "Your branch is up to date")) {
      return(NULL)
    }
    
    git("pull", .repo = submodule)
    
  })
cat_ol <- function(x) {
  nums <- sprintf("%2.f. ", seq_along(x))
  
  x <- x |> 
    strsplit("\n") |> 
    map_chr(
      ~ .x |> 
        map_chr(~ paste(collapse = "\n", stringi::stri_wrap(
          ., 70, normalise = FALSE, simplify = TRUE
        ))) |> 
        paste(collapse = "\n")
    ) 
  
  x <- str_replace_all(x, "\n", "\n    ")
  x <- paste0(nums, x)
  
  cat(x, sep = "\n")
}
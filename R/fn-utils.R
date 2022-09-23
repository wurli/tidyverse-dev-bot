`%or%` <- function(x, y) if (length(x) == 0) y else x 

# `str_wrap()` which breaks strings into substrings and preserves original 
# linebreaks
str_wrap_vec <- function(x, width = 220) {
  
  # Random unicode character to remember where original linebreaks were
  proxy_break <- "\U9F46"
  
  text |> 
    str_replace_all("\n", proxy_break) |> 
    str_wrap(width) |> 
    str_split("\n") |> 
    pluck(1) |> 
    str_replace_all(proxy_break, "\n") |> 
    map(nchar)
  
}

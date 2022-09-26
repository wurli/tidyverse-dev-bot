`%or%` <- function(x, y) if (length(x) == 0) y else x 

# `str_wrap()` which breaks strings into substrings and preserves original 
# linebreaks
str_segment <- function(x, width = 220, split = "\n", combine = split, 
                        link_bad_splits = "...") {
  
  x |> 
    str_split(split) |> 
    map(function(pieces) {
      
      out <- NULL
      segment <- NULL
      
      for (p in pieces) {
        
        if (nchar(p) > width) {
          
          cli::cli_warn(c(
            "Could not neatly partition string into {.val {width}}-length segments",
            i = "Check {.emph {p}}"
          ))
          
          width <- width - 6
          
          n_parts <- (nchar(p) %/% width) + 1
          
          p <- seq_len(n_parts) |> 
            map_chr(~ substr(p, ((.x - 1) * width) + 1, .x * width))
          
          dots <- rep(link_bad_splits, length(p) - 1)
          p <- paste0(c("", dots), p, c(dots, ""))
          
          out <- c(out, segment, p)
          segment <- NULL
          
          break
          
        }
        
        new_segment <- paste(c(segment, p), collapse = combine)
        
        if (nchar(new_segment) > width) {
          out <- c(out, segment)
          segment <- p
        } else {
          segment <- new_segment
        }
        
      }
      
      paste0(c(out, segment), combine)
      
    })
  
}

`%or%` <- function(x, y) if (length(x) == 0) y else x 

str_segment1 <- function(x, ...) {
  stopifnot(length(x) <= 1)
  str_segment(x, ...)[[1]]
}

# `str_wrap()` which breaks strings into substrings and preserves original 
# linebreaks
str_segment <- function(x, 
                        width = 220, 
                        split = "\n", 
                        combine = split, 
                        link_bad_splits = "...",
                        strict = FALSE,
                        n_splits = Inf) {
  
  n_splits <- max(n_splits, 0)
  
  x |> 
    str_split(split) |> 
    map(function(pieces) {
      
      # For each set of segments, reduce to get a vector of parts with 
      # nchar() <= width
      pieces |> 
        reduce(.init = NULL, .f = function(out, piece) {
          
          if (length(out) >= n_splits - 1) {
            return(c(
              head(out, n_splits),
              paste(c(tail(out, -n_splits), piece), collapse = combine)
            ))
          }
          
          # If a 'piece' doesn't fit, split wherever and add `link_bad_splits`,
          # e.g. "..."
          if (nchar(piece) > width) {
            
            warner <- if (strict) cli::cli_abort else cli::cli_warn
            
            warner(c(
              "Could not neatly partition string into segments of length {.val {width}}",
              i = "Check {.emph {piece}}"
            ))
            
            parts <- str_segment(piece, max(width - 6, 1), "")[[1]]
            
            ellipses <- rep(link_bad_splits, length(parts) - 1)
            parts <- paste0(c("", ellipses), parts, c(ellipses, ""))
            
            return(c(out, parts))
            
          }
          
          completed <- head(out, -1)
          prev <- tail(out, 1)
          new <- paste(c(prev, piece), collapse = combine)
          
          if (nchar(new) <= width) c(completed, new) else c(completed, prev, piece)
          
        })
      
    })
  
}


#' is_segmentable("hello there!", width = 5, split = " ")
#' is_segmentable("hello there!", width = 5, split = " ", first_only = FALSE)
is_segmentable <- function(x, width = 220, split = "\n", first_only = TRUE) {
  
  x <- strsplit(x, split)
  
  if (first_only) {
    x <- map(x, head, 1)
  }
  
  map_lgl(x, ~ all(nchar(.) <= width))
}

# for (p in pieces) {
#   
#   if (nchar(p) > width) {
#     
#     cli::cli_warn(c(
#       "Could not neatly partition string into {.val {width}}-length segments",
#       i = "Check {.emph {p}}"
#     ))
#     
#     width <- width - 6
#     
#     n_parts <- (nchar(p) %/% width) + 1
#     
#     p <- seq_len(n_parts) |> 
#       map_chr(~ substr(p, ((.x - 1) * width) + 1, .x * width))
#     
#     dots <- rep(link_bad_splits, length(p) - 1)
#     p <- paste0(c("", dots), p, c(dots, ""))
#     
#     out <- c(out, segment, p)
#     segment <- NULL
#     
#     out_attrs <<- list(bad = TRUE)
#     
#     break
#     
#   }
#   
#   new_segment <- paste(c(segment, p), collapse = combine)
#   
#   if (nchar(new_segment) > width) {
#     out <- c(out, segment)
#     segment <- p
#   } else {
#     segment <- new_segment
#   }
#   
# }
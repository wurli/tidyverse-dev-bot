`%or%` <- function(x, y) if (length(x) == 0) y else x 

str_segment1 <- function(x, ...) {
  stopifnot(length(x) <= 1)
  if (length(x) == 0) character() else str_segment(x, ...)[[1]]
}

# `str_wrap()` which breaks strings into substrings and preserves original 
# linebreaks
str_segment <- function(x, 
                        padding = 7, 
                        split = "\n", 
                        combine = split, 
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
          
          # Early return if we've already split enough times
          if (length(out) >= n_splits - 1) {
            return(c(
              head(out, n_splits),
              paste(
                c(tail(out, -n_splits), piece), 
                collapse = combine
              )
            ))
          }
          
          # If a 'piece' doesn't fit, return it as-is (dealt with elsewhere)
          if (!tweet_is_valid(piece, padding)) {
            if (strict) {
              cli_abort(c(
                "Could not break string into segments of width <= {.val {width}} ",
                i = "Splitting strings based on delimiter {.val {split}}",
                i = "Check string {.emph {piece}}"
              ))
            }
            return(c(out, piece))
          }
          
          completed <- head(out, -1)
          prev <- tail(out, 1)
          new <- paste(c(prev, piece), collapse = combine)
          
          if (tweet_is_valid(new, padding)) {
            c(completed, new) 
          } else {
            c(completed, prev, piece)
          }
          
        })
      
    })
  
}


#' is_segmentable("hello there!", width = 5, split = " ")
#' is_segmentable("hello there!", width = 5, split = " ", first_only = FALSE)
is_segmentable <- function(x, width = 220, split = "\n", first_only = TRUE) {
  
  x <- str_split(x, split)
  
  if (first_only) {
    x <- map(x, head, 1)
  }
  
  map_lgl(x, ~ all(nchar(.) <= width))
}

first_chars <- function(x, n = 60, dots = "...", always_dots = FALSE) {
  
  if (nchar(x) > n) {
    n <- n - nchar(dots)
  } else if (!always_dots) {
    dots <- ""
  }
  
  paste0(substr(x, 1, n), dots)
  
}

# dput_styled <- function(x, ...) {
#   con <- textConnection("out", "w")
#   dput(x, con, ...)
#   close(con)
#   out <- out |> styler::style_text()
#   cat_line(out)
#   invisible(out)
# }

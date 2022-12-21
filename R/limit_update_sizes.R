limit_update_sizes <- function(x, n = 10, by_package = TRUE) {
  
  if (nrow(x) == 0) {
    return(tibble())
  }
  
  if (by_package) {
    x <- x |> 
      group_by(package)
  }
  
  x |> 
    arrange(package, bullet_id, section_id) |> 
    slice_min(bullet_id, n = n) |> 
    ungroup()
  
}
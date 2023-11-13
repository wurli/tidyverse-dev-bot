limit_update_sizes <- function(x, n = 10, by_package = TRUE) {
  
  if (nrow(x) == 0) {
    return(tibble())
  }
  
  if (by_package) {
    x <- x |> 
      group_by(package)
  }
  
  out <- x |> 
    arrange(package, bullet_id, section_id) |> 
    slice_min(bullet_id, n = n) |> 
    ungroup()
  
  n_discarded <- x |> 
    anti_join(out, by = c("package", "bullet_id")) |> 
    distinct(package, bullet_id) |> 
    nrow()
  
  if (n_discarded > 0L) {
    cli_alert("Discarding {.val {n_discarded}} bullets to avoid spamming")
  }
  
  out
  
}
remove_old_bullets <- function(x, file = "last_refresh_data.csv", overwrite = TRUE) {
  
  # For notifications
  force(x)
  
  cli::cli_alert("Reading {.file {file}}")
  prev <- read_csv(file, show_col_types = FALSE)
  
  # by <- c("package", "bullets_level", "text", "parent_text")
  # 
  # out <- rows_delete(
  #   x = x, 
  #   y = prev |> select(all_of(by)), 
  #   by = by,
  #   unmatched = "ignore"
  # )
  # 
  # msg_text <- out |> 
  #   count(package) |> 
  #   rowwise() |> 
  #   mutate(text = cli::format_inline("{.val {n}} from {.pkg {package}}")) |> 
  #   ungroup() |> 
  #   pull(text)
  # 
  # cli::cli_alert_info("New updates found: {msg_text}")
  
  if (overwrite) {
    cli::cli_alert("Overwriting {.file {file}} with new data")
    write_csv(x, "last_refresh_data.csv")
  }
  
  out
  
  
}
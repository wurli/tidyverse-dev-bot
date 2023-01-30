remove_old_bullets <- function(x, file = "last_refresh_data.csv", overwrite = TRUE) {
  
  # Sometimes, for a particular bullet id, `text` will be a vector of length >
  # 1. If rows are deleted only based on the value of `text`, this can lead to a
  # small chunk of a tweet getting omitted, e.g. if a typo is corrected in the
  # NEWS.md file. To avoid this, we just hash the whole `text` vector for that
  # bullet and use the hash to delete rows. This means that if only a tiny
  # part of a tweet changes, the whole thing will be posted again, even if it's
  # a long thread.
  x <- x |> 
    with_groups(
      c(package, bullet_id),
      mutate,
      bullet_hash = hash(text),
      .before = text
    )
  
  cli_h2("Discarding text which has already been posted")
  
  if (nrow(x) == 0) {
    return(tibble())
  }
  
  by <- c("package", "bullet_id", "bullet_hash", "text")
  
  prev <- get_prev_bullets(file, pattern = select(x, all_of(by)))
  prev_rows <- nrow(prev)
  
  # Makes development easier - check that cols are the same and maybe overwrite
  # if not
  if (!identical(colnames(prev), by)) {
    
    stopifnot(interactive())
    
    choice <- menu(
      title = paste0(
        "Old data has different columns to new data. Do you want to overwrite?\n",
        "Old:", paste(colnames(prev), collapse = ", "), "\n",
        "New:", paste(by, collapse = ", ")
      ),
      choices = c("Overwrite", "Stop")
    )
    
    if (choice == 2) stop()
    
    write_csv(x, "last_refresh_data.csv")
    return(x)
    
  }
  
  # If a new package is present, treat those bullets as if they've already
  # been tweeted - i.e. just add them to the cache. Future *new* bullets
  # will then be tweeted as normal
  for (pkg in unique(x$package)) {
    
    if (!pkg %in% prev$package) {
      
      cli_alert_info("New package {.pkg {pkg}} detected - these bullets will be cached but not tweeted")
      
      prev <- rows_insert(
        x = prev,
        y = x |> select(all_of(by)) |> filter(package == pkg),
        by = by
      )
      
    }
    
  }
  
  out <- rows_delete(
    x = x,
    y = prev |> select(all_of(by)),
    by = by,
    unmatched = "ignore"
  )

  remove_old_bullets_summary_message(out)
  
  if (!overwrite) {
    cli_alert_warning("Not overwriting {.file {file}} with new data")
  } else {
    already_tweeted <- rows_insert(
      x = prev,
      y = x |> select(all_of(by)),
      by = by,
      conflict = "ignore"
    )
    
    n <- nrow(already_tweeted) - prev_rows
    cli_alert("Adding {.val {n}} new rows to {.file {file}}")
    write_csv(already_tweeted, file)
  } 
  
  out |> 
    select(-bullet_hash)
  
}

remove_old_bullets_summary_message <- function(x) {
  if (nrow(x) == 0) {
    cli_alert_info("No new updates found")
  } else {
    msg_text <- x |>
      count(package) |>
      rowwise() |>
      mutate(text = format_inline("{.val {n}} from {.pkg {package}}")) |>
      ungroup() |>
      pull(text)
    
    cli_alert_info("New updates found: {msg_text}") 
  }
}

get_prev_bullets <- function(file, pattern) {
  
  if (!file.exists(file)) {
    cli_alert("Creating new file {.file {file}}")
    x <- pattern |> filter(FALSE)
    readr::write_csv(x, file)
    return(x)
  }
  
  cli_alert("Reading {.file {file}}")
  readr::read_csv(
    file,
    col_types = readr::cols(
      package     = readr::col_character(),
      bullet_id   = readr::col_integer(),
      bullet_hash = readr::col_character(),
      text        = readr::col_character()
    )
  ) 
  
}

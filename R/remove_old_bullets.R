#' Discard bullets which have already been posted 
#'
#' 1. Takes the new news updates to be posted (a data frame containing bullets)
#' 2. Creates a hash for each bullet point - sub-bullets will be given the same 
#'    hash as their parent bullet
#' 3. Removes bullets from the input dataset if they're present in a CSV of
#'    previously posted bullets
#' 4. Adds the new bullets to post to the list of previously posted bullets, 
#'    and overwrites the CSV
#'
#' @param new_updates A data frame holding the full NEWS.md files for packages 
#'   which have recently received an update
#' @param prev_update_file The name of a file containing previously posted
#'   updates as a CSV
#' @param overwrite_prev_updates Whether to overwrite `prev_updates_file`
#'
#' @return
#' @export
#'
#' @examples
remove_old_bullets <- function(new_updates, 
                               prev_updates_file = "previous_updates.csv", 
                               overwrite_prev_updates = TRUE) {
  
  if (nrow(x) == 0) {
    return(tibble())
  }
  
  cli_h2("Discarding text which has already been posted")
  
  # Sometimes, for a particular bullet id, `text` will be a vector of length >
  # 1. If rows are deleted only based on the value of `text`, this can lead to a
  # small chunk of a tweet getting omitted, e.g. if a typo is corrected in the
  # NEWS.md file. To avoid this, we just hash the whole `text` vector for that
  # bullet and use the hash to delete rows. This means that if only a tiny
  # part of a tweet changes, the whole thing will be posted again, even if it's
  # a long thread.
  new_updates <- new_updates |> 
    mutate(
      .by = c(package, bullet_id),
      bullet_hash = hash(text),
      .before = text
    )
  
  by <- c("package", "bullet_id", "bullet_hash", "text")
  
  prev_updates <- get_prev_bullets(prev_updates_file, template = select(new_updates, all_of(by)))
  prev_rows <- nrow(prev_updates)
  
  check_previous_update_format_unchanged(prev_updates, by, new_updates)
  
  # If a new package is present, treat those bullets as if they've already
  # been tweeted - i.e. just add them to the cache. Future *new* bullets
  # will then be tweeted as normal
  prev_updates <- prev_updates |> 
    insert_new_packages(new_updates)
  
  out <- rows_delete(
    x = new_updates,
    y = prev_updates |> select(all_of(by)),
    by = by,
    unmatched = "ignore"
  )

  remove_old_bullets_summary_message(out)
  
  if (overwrite_prev_updates) {
    already_tweeted <- rows_insert(
      x = prev_updates,
      y = new_updates |> select(all_of(by)),
      by = by,
      conflict = "ignore"
    )
    
    n <- nrow(already_tweeted) - prev_rows
    cli_alert("Adding {.val {n}} new rows to {.file {prev_updates_file}}")
    write_csv(already_tweeted, prev_updates_file)
  } 
  
  out |> 
    select(-bullet_hash)
  
}

# Makes development easier - check that cols are the same and maybe overwrite
# if not. This should generally not get run.
check_previous_update_format_unchanged <- function(prev_update, by, x) {
  if (!identical(colnames(prev_update), by)) {
    
    stopifnot(interactive())
    
    choice <- menu(
      title = paste0(
        "Old data has different columns to new data. Do you want to overwrite?\n",
        "Old:", paste(colnames(prev_update), collapse = ", "), "\n",
        "New:", paste(by, collapse = ", ")
      ),
      choices = c("Overwrite", "Stop")
    )
    
    if (choice == 2) stop()
    
    write_csv(x, "last_refresh_data.csv")
    
    stop("Please re-run the pipeline")
    
  }
}

insert_new_packages <- function(old_updates, new_updates) {
  new_package_updates <- new_updates |> 
    anti_join(old_updates, by = "package")
  
  if (nrow(new_package_updates) > 0L) {
    new_pkgs <- unique(new_package_updates$package)
    cli_alert_info("New package(s) {.pkg {new_pkgs}} detected - these bullets will be cached but not tweeted")
    
    old_updates <- old_updates |> 
      rows_insert(
        new_package_updates |> select(all_of(by)),
        by = by
      )
  }
  
  old_updates
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

get_prev_bullets <- function(file, template) {
  
  if (!file.exists(file)) {
    cli_alert("Creating new file {.file {file}}")
    x <- template |> filter(FALSE)
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

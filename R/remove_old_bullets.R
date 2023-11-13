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
 
  by <- c("package", "bullet_id", "text")
  
  prev_updates <- get_prev_bullets(prev_updates_file, template = select(new_updates, all_of(by)))
  prev_rows <- nrow(prev_updates)
  
  # If a new package is present, treat those bullets as if they've already
  # been tweeted - i.e. just add them to the cache. Future *new* bullets
  # will then be tweeted as normal. This allows me to add new packages to
  # the bot without posting the whole history.
  prev_updates <- prev_updates |> 
    insert_new_packages(new_updates)
  
  bullets_to_post <- new_updates |> 
    remove_previously_posted_bullets(prev_updates)

  remove_old_bullets_summary_message(bullets_to_post)
  
  if (overwrite_prev_updates) {
    already_tweeted <- rows_insert(
      x = prev_updates,
      y = bullets_to_post |> select(all_of(by)),
      by = by,
      conflict = "ignore"
    )
    
    n <- nrow(already_tweeted) - prev_rows
    cli_alert("Adding {.val {n}} new rows to {.file {prev_updates_file}}")
    write_csv(already_tweeted, prev_updates_file)
  } 
  
  bullets_to_post
  
}

#' Exclude updates already posted
#'
#' Sometimes, before a release, a NEWS file goes through polishing, and many
#' bullets may receive small updates, e.g. rewording or typo fixes. In other
#' cases, particularly long or complex bullets may undergo several iterations of
#' minor changes. This function aims to exclude these, as well as those which
#' are exact matches to previously posted updates, in an effort to reduce bursts
#' of tweets at such times which may amount to spamming.
#'
#' @param new_updates,prev_updates Data frames of new / old updates
#' @param similarity_cutoff New bullets which have a similarity greater or 
#'   equal to this cutoff with any previously posted bullets from the same 
#'   package will be excluded. Similarity is calculated using 
#'   `stringdist::stringsimmatrix(method = "hamming")`. 
#'
#' @return A data frame
remove_previously_posted_bullets <- function(new_updates, prev_updates, similarity_cutoff = 0.85) {
  
  # Sub-bullets collapsed because we want similarity to be calculated per-tweet,
  # not per-bullet
  new_updates_collapsed <- new_updates |> 
    summarise(
      text = paste(text, collapse = "\n"),
      .by = c(package, bullet_id)
    )
  
  prev_updates_collapsed <- prev_updates |> 
    summarise(
      text = paste(text, collapse = "\n"),
      .by = c(package, bullet_id)
    )
  
  comparison <- new_updates_collapsed |> 
    nest_by(pkg = package, .key = "data") |> 
    
    # Iterate over packages because we don't care if updates are similar to
    # previous updates from other packages
    pmap(function(pkg, data) {
      prev_bullets <- prev_updates_collapsed |> 
        filter(package == pkg) |>
        pull(text)
      
      stringdist <- stringdist::stringsimmatrix(
        data$text, prev_bullets,
        method = "hamming"
      )
      
      tibble(
        data,
        similarity = apply(stringdist, 1, max),
        # most_similar = prev_bullets[apply(stringdist, 1, which.max)]
      )
    }) |> 
    bind_rows()
  
  n_almost_the_same <- comparison |> 
    filter(similarity_cutoff < similarity, similarity < 1) |> 
    nrow()
  
  if (n_almost_the_same > 0L) {
    cli_alert("Not posting {.val {n_almost_the_same}} bullets which are very similar to previous tweets")
  }
  
  new_updates |> 
    anti_join(
      comparison |> filter(similarity < similarity_cutoff),
      by = c("package", "bullet_id")
    )
  
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
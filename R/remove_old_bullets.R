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
#' @param overwrite_prev_updates Whether to overwrite `prev_updates`
#' @inheritParams remove_previously_posted_bullets
#' @inheritParams stringdist::stringsimmatrix
#'
#' @return
#' @export
#'
#' @examples
remove_old_bullets <- function(new_updates, 
                               prev_updates = "previous_updates.csv", 
                               overwrite_prev_updates = TRUE,
                               similarity_cutoff = 0.95,
                               method = c(
                                 "jaccard", "osa", "lv", "dl", "lcs", "qgram", 
                                 "cosine", "jw", "soundex"
                               )) {
  
  if (nrow(new_updates) == 0) {
    return(tibble())
  }
  
  cli_h2("Discarding text which has already been posted")
  
  method <- match.arg(method)
  
  prev_updates_data <- get_prev_bullets(prev_updates)
  prev_rows <- nrow(prev_updates_data)
  
  # If a new package is present, treat those bullets as if they've already
  # been tweeted - i.e. just add them to the cache. Future *new* bullets
  # will then be tweeted as normal. This allows me to add new packages to
  # the bot without posting the whole history.
  prev_updates_data <- prev_updates_data |> 
    insert_new_packages(new_updates)
  
  bullets_to_post <- new_updates |> 
    remove_previously_posted_bullets(
      prev_updates_data, 
      similarity_cutoff = similarity_cutoff,
      method = method
    )

  remove_old_bullets_summary_message(bullets_to_post)
  
  if (overwrite_prev_updates) {
    stopifnot(
      is.character(prev_updates),
      length(prev_updates) == 1L
    )
    
    already_tweeted <- rows_insert(
      prev_updates_data, 
      bullets_to_post |> select(package, bullet_id, text),
      by = c("package", "bullet_id", "text"),
      conflict = "ignore"
    )
    
    n <- nrow(already_tweeted) - prev_rows
    cli_alert("Adding {.val {n}} new rows to previous updates database")
    write_csv(already_tweeted, prev_updates)
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
#' @param ... Passed to [stringdist::stringsimmatrix()]
#'
#' @return A data frame
remove_previously_posted_bullets <- function(new_updates, 
                                             prev_updates = get_prev_bullets(), 
                                             similarity_cutoff = .95, 
                                             method = "jaccard", 
                                             ..., 
                                             debug = FALSE) {
  
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
        method = method,
        ...
      )
      
      tibble(
        data,
        similarity = apply(stringdist, 1, max),
        most_similar = if (debug) prev_bullets[apply(stringdist, 1, which.max)]
      )
    }) |> 
    bind_rows() |>
    mutate(
      flag_new = similarity <= similarity_cutoff,
      flag_probably_old = similarity_cutoff < similarity & similarity < 1
    )
  
  if (debug) {
    return(comparison)
  }
  
  n_almost_the_same <- comparison |> 
    filter(flag_probably_old) |> 
    nrow()
  
  if (n_almost_the_same > 0L) {
    cli_alert("Not posting {.val {n_almost_the_same}} bullets which are very similar to previous tweets")
  }
  
  new_updates |> 
    semi_join(
      comparison |> filter(flag_new),
      by = c("package", "bullet_id")
    )
  
}

insert_new_packages <- function(old_updates, new_updates) {
  new_package_updates <- new_updates |> 
    anti_join(old_updates, by = "package")
  
  if (nrow(new_package_updates) > 0L) {
    new_pkgs <- unique(new_package_updates$package)
    cli_alert_info("New package(s) {.pkg {new_pkgs}} detected - these bullets will be cached but not tweeted")
    
    old_updates <- old_updates |> 
      bind_rows(new_package_updates)
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

get_prev_bullets <- function(x = "previous_updates.csv") {
  
  if (is.data.frame(x)) {
    return(x)
  }
  
  if (!file.exists(x)) {
    cli_alert("Creating new file {.file {x}}")
    updates <- tibble(package = character(), bullet_id = character(), text = character())
    readr::write_csv(updates, x)
    return(updates)
  }
  
  cli_alert("Reading {.file {x}}")
  readr::read_csv(
    x,
    col_types = readr::cols(
      package     = readr::col_character(),
      bullet_id   = readr::col_character(),
      text        = readr::col_character()
    )
  ) 
}

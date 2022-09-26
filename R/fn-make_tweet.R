make_tweets <- function(x) {
  x |>
    group_by(package, bullet_id) |>
    summarise(
      tweet = list(make_tweet(
        text,
        is_codeblock = is_codeblock,
        package = cur_group()$package
      )),
      .groups = "drop"
    )
}

make_tweet <- function(x, is_codeblock, package) {
  
  header <- paste0("{", package, "} update:")
  footer <- paste0(news_urls(.package = package, .for_humans = TRUE))
  
  # 1. Try a single tweet
  tweet <- paste(c(header, x, footer), collapse = "\n\n")
  is_valid <- tweet_info(tweet, "valid")
  if (is_valid) {
    cli::cli_alert_info("Single tweet (not a thread)")
    return(tweet)
  }
  
  # 2. Try a thread
  out <- compress_thread(
    x = c(header, x, footer),
    is_codeblock = c(FALSE, is_codeblock, FALSE), 
    extra_space = 7
  ) 
  
  len <- length(out)
  
  cli::cli_alert_info("Thread of {.val {len}} tweets")
  
  out <- imap_chr(out, function(x, i) {
    
    if (i == 1) {
      str_replace(x, "\n", paste0("\n(1/", len, ")\n"))
    } else {
      paste0("(", i, "/", len, ")\n", x)
    }
    
  })
 
  out 
  
}

# test_make_tweet(has_codeblock = T, has_subbullets = T)

test_make_tweet <- function(...) {
  tweet <- get_tweet(...)
  do.call(make_tweet, tweet)
}

get_tweet <- function(x = new_bullets_formatted, i = 1, has_codeblock = NULL, has_subbullets = NULL) {
  
  # x <- filter(x, ...)
  
  if (isTRUE(has_codeblock)) {
    x <- x |> 
      with_groups(c(package, bullet_id), filter, any(is_codeblock))
  }
  
  if (isTRUE(has_subbullets)) {
    x <- x |> 
      with_groups(c(package, bullet_id), filter, n() > 1 & any(grepl("^\\* ", text)))
  }
  
  x <- x |> 
    with_groups(c(package, bullet_id), mutate, row = cur_group_id()) |> 
    filter(row == i) 
  
  stopifnot(nrow(x) > 0)
  
  list(x = x$text, is_codeblock = x$is_codeblock, package = unique(x$package))
}

# Get some test data x
if (FALSE) {
  small <- structure(
    list(
      package = c("dplyr", "dplyr", "dplyr", "dplyr", 
                  "dplyr", "dplyr", "dplyr", "dplyr", "dplyr", "dplyr", "dplyr", 
                  "dplyr", "dplyr", "dplyr", "dplyr", "dplyr", "dplyr", "dplyr", 
                  "dplyr", "dplyr"), 
      bullets_level = c(1L, 1L, 1L, 1L, 2L, 2L, 
                        1L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L), 
      bullet_id = c(1, 2, 3, 52, 52, 52, 55, 55, 55, 55, 305, 306, 307, 307, 308, 308, 
                    309, 309, 310, 310), 
      section_id = c(1L, 2L, 3L, 52L, 53L, 54L, 
                     55L, 56L, 57L, 58L, 307L, 308L, 309L, 310L, 311L, 312L, 313L, 
                     314L, 315L, 316L), 
      is_codeblock = c(FALSE, FALSE, FALSE, FALSE, 
                       FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
                       TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE), 
      text = c("Using 1 column matrices in `filter()` is now deprecated (#6091).", 
               "Warnings emitted inside `mutate()` and variants are now collected and stashed away. Run the new `last_dplyr_warnings()` function to see the warnings emitted within dplyr verbs during the last top-level command. This fixes performance issues when thousands of warnings are emitted with rowwise and grouped data frames (#6005, #6236).", 
               "`group_by_prepare()` loses the `caller_env` argument. It was rarely used and it is no longer needed (#6444).", 
               "`na_if()` has been rewritten to utilize vctrs. This comes with the following improvements (#6329):", 
               "* It now casts `y` to the type of `x` before comparing them, which makes it clearer that this function is type and size stable on `x`. In particular, this means that you can no longer do `na_if(<tibble>, 0)`, which previously accidentally allowed you to replace any instance of `0` across every column of the tibble with `NA`. `na_if()` was never intended to work this way, and this is considered off-label usage.", 
               "* You can now replace `NaN` values in `x` with `NA` through `na_if(x, NaN)`.", 
               "`first()`, `last()`, and `nth()` have been rewritten to use vctrs. This comes with the following improvements (#6331):", 
               "* When used on a data frame, these functions now return a single row rather than a single column. This is more consistent with the vctrs principle that a data frame is generally treated as a vector of rows.", 
               "* The `default` is no longer \"guessed\", and will always automatically be set to a missing value appropriate for the type of `x`.", 
               "* Fractional values of `n` are no longer truncated to integers, and will now cause an error. For example, `nth(x, n = 2)` is fine, but `nth(x, n = 2.5)` is now an error.", 
               "`last_col()` is re-exported from tidyselect (#3584).", "`group_trim()` drops unused levels of factors that are used as grouping variables.", 
               "`nest_join()` creates a list column of the matching rows. `nest_join()` + `tidyr::unnest()` is equivalent to `inner_join` (#3570).", 
               "```\nband_members %>% \n  nest_join(band_instruments)\n```", 
               "`group_nest()` is similar to `tidyr::nest()` but focusing on the variables to nest by instead of the nested columns.", 
               "```\nstarwars %>%\n  group_by(species, homeworld) %>% \n  group_nest()\n\nstarwars %>%\n  group_nest(species, homeworld)\n```", 
               "`group_split()` is similar to `base::split()` but operating on existing groups when applied to a grouped data frame, or subject to the data mask on ungrouped data frames", 
               "```\nstarwars %>%\n  group_by(species, homeworld) %>%   \n  group_split()\n\nstarwars %>%\n  group_split(species, homeworld)\n```", 
               "`group_map()` and `group_walk()` are purrr-like functions to iterate on groups of a grouped data frame, jointly identified by the data subset (exposed as `.x`) and the data key (a one row tibble, exposed as `.y`). `group_map()` returns a grouped data frame that combines the results of the function, `group_walk()` is only used for side effects and returns its input invisibly.", 
               "```\nmtcars %>%\n  group_by(cyl) %>%\n  group_map(~ head(.x, 2L))\n```"), 
      parent_text = c(NA, NA, NA, NA, "`na_if()` has been rewritten to utilize vctrs. This comes with the following improvements (#6329):", 
                      "`na_if()` has been rewritten to utilize vctrs. This comes with the following improvements (#6329):", 
                      NA, "`first()`, `last()`, and `nth()` have been rewritten to use vctrs. This comes with the following improvements (#6331):", 
                      "`first()`, `last()`, and `nth()` have been rewritten to use vctrs. This comes with the following improvements (#6331):", 
                      "`first()`, `last()`, and `nth()` have been rewritten to use vctrs. This comes with the following improvements (#6331):", 
                      NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
    ), 
    row.names = c(NA, -20L), 
    class = c("tbl_df", "tbl", "data.frame")
  )
}

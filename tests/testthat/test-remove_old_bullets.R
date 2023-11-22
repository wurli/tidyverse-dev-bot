test_that("removing old bullets works", {
  
  test_pkgs <- c("ggplot2", "dplyr")
  
  prev_news_df <- here::here(glue("tests/testthat/news-prev-{test_pkgs}.md")) |>
    set_names(test_pkgs) |> 
    annotate_news_files(dir = NULL) |> 
    get_news_data(text = _) |> 
    cli_silence()
  
  curr_news_df <- here::here(glue("tests/testthat/news-curr-{test_pkgs}.md")) |>
    set_names(test_pkgs) |> 
    annotate_news_files(dir = NULL) |> 
    get_news_data(text = _) |> 
    cli_silence()
  
  output <- curr_news_df |> 
    remove_previously_posted_bullets(
      prev_news_df, 
      method = "jaccard", 
      similarity_cutoff = 0.95,
      debug = TRUE
    ) |> 
    cli_silence()
  
  expect_snapshot(
    output |> 
      filter(flag_new) |> 
      reframe(.by = package, text = list(text)) |> 
      pwalk(function(package, text) {
        cli_h1("New updates from {package}")
        cat_line(text)
        cat_line("\n\n\n")
      })
  )
  
  expect_snapshot(
    output |> 
      filter(flag_probably_old) |> 
      select(update = text, most_similar_prev_update = most_similar) |> 
      as.list() |> 
      purrr::list_transpose() |> 
      purrr::walk(function(x) {
        cli_h1("Update")
        cat_line(x[1])
        cli_h1("Most similar previous update")
        cat_line(x[2])
        cat_line("\n\n\n")
      })
  )
  
})

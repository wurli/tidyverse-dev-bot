test_that("Parsing news data works", {
  
  news_data <- annotate_news_files(list(testpkg = "news-sample.md")) |> 
    get_news_data(text = _) |> 
    cli_silence()
  
  news_data_readable <- news_data |> 
    mutate(
      title = sprintf(
        "Section %02.f; bullet %02.f; level %02.f",
        section_id, bullet_id, bullets_level
      )
    ) |> 
    select(title, text) |> 
    nest_by(title) |>
    pull(data, title) |> 
    map(pull, text) 
  
  expect_snapshot(
    iwalk(news_data_readable, function(x, y) {
      cat(paste("--", y, "---------------------------\n"))
      cat_ol(x)
    })
  )
  
})

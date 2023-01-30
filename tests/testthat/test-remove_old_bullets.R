test_that("Removing old bullets works", {
  
  dir <- tempfile("test-removing-old-bullets")
  dir.create(dir)
  
  first_update_data <- list(testpkg = "tests/testthat/news-sample-outdated.md") |>
    annotate_news_files() |>
    get_news_data(text = _) |> 
    cli_silence()
  
  first_update_data |> 
    remove_old_bullets(file.path(dir, "last-refresh-data.csv")) |> 
    cli_silence()
  
  second_update_data_original <- list(testpkg = "tests/testthat/news-sample.md") |>
    annotate_news_files() |>
    get_news_data(text = _) |> 
    cli_silence()
  
  second_update_data_filtered <- second_update_data_original |> 
    remove_old_bullets(file.path(dir, "last-refresh-data.csv")) |> 
    cli_silence()
  
  news_data_readable <- second_update_data_filtered |> 
    mutate(
      title = sprintf(
        "Bullet %02.f; section %02.f; level %02.f",
        bullet_id, section_id, bullets_level
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

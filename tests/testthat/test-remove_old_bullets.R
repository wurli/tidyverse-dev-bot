test_that("Removing old bullets works", {
  
  # Running test will create a new csv of 'previous updates', so create a
  # temp dir in which to do this
  dir <- tempfile("test-removing-old-bullets")
  dir.create(dir)
  
  # 1. This is the 'initial' bunch of updates
  first_update_data <- list(testpkg = "news-sample-outdated.md") |>
    annotate_news_files() |>
    get_news_data(text = _) |> 
    cli_silence()
  
  # 2. This step creates the 'previous updates' csv
  first_update_data |> 
    remove_old_bullets(file.path(dir, "last-refresh-data.csv")) |> 
    cli_silence()
  
  # 3. This is the subsequent bumch of updates
  second_update_data_original <- list(testpkg = "news-sample.md") |>
    annotate_news_files() |>
    get_news_data(text = _) |> 
    cli_silence()
  
  # 4. Try removing bullets already 'posted' in 2.
  second_update_data_filtered <- second_update_data_original |> 
    remove_old_bullets(file.path(dir, "last-refresh-data.csv")) |> 
    cli_silence()
  
  # 5. Check that the new bullets to be posted are what they should be
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

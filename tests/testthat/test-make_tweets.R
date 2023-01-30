test_that("Final tweets are okay", {
  
  tweets <- list(testpkg = "news-sample.md") |>
    annotate_news_files() |>
    get_news_data(text = _) |>
    make_tweets() |> 
    cli_silence()
  
  text <- tweets |> 
    nest_by(tweet_id) |> 
    pull(data, tweet_id) |> 
    map(pull, tweet)
  
  expect_snapshot(
    iwalk(text, function(x, y) {
      cat(paste("--", y, "----------------------------------\n"))
      cat_ol(x)
    })
  )
  
})

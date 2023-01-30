test_that("Lua annotation works", {
  
  annotated <- list(testpkg = "news-sample.md") |> 
    annotate_news_files() |> 
    pluck(1) |> 
    paste(collapse = "\n") |> 
    cli_silence()
  
  expect_snapshot(cat(annotated))
  
})

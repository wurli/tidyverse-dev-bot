test_that("The lua filter works", {
  
  lua_filter <- project_file("annotate-bullets.lua")
  test_file  <- "news-sample.md"
  
  expect_snapshot(
    cat_line(system2(
      "pandoc", c(test_file, "-t markdown", paste("--lua-filter", lua_filter)),
      stdout = TRUE
    ))
  )
  
})

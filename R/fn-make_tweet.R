# new_bullets_formatted |> 
#   group_by(package, bullet_id) |> 
#   summarise(
#     tweet = list(make_tweet(
#       text, 
#       is_codeblock = is_codeblock,
#       package = cur_group()$package
#     )),
#     .groups = "drop"
#   )

make_tweet <- function(x, is_codeblock, package) {
  
  sections <- list(
    header = tibble(
      text = paste0("{", package, "} update:\n"),
      order = 0L,
      chars = nchar(text)
    ),
    body = tibble(
      text = x,
      is_codeblock = is_codeblock,
      order = seq_along(x),
      chars = nchar(text)
    ),
    footer = tibble(
      text = paste0("\n\n", news_urls(.package = package, .for_humans = TRUE)),
      order = length(x) + 1L,
      chars = .tweet_url_length
    )
  )
  
}
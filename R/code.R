library(tidyverse)
library(glue)

list.files("R", "^fn-", full.names = TRUE) |> 
  walk(source)

new_bullets <- news_urls(fake_package = "NEWS.md") |> 
  pull_news_files() |> 
  get_news_data() |> 
  remove_old_bullets(overwrite = F)

format_bullets <- function(x) {
  
  x <- x |> 
    mutate(
      has_parent = !is.na(parent_id),
      has_children = bullet_id %in% parent_id, 
      .before = 1
    )
  
  max_depth <- max(x$bullets_level)
  
  out <- list()
  
  get_bullets <- function(depth = 1, parent = NULL) {
   
    b <- x |> 
      filter(
        bullets_level == depth,
        if (!is.null(parent)) parent_id == parent else TRUE
      ) |> 
      select(text, has_children, bullet_id)
    
    b |> 
      pmap(function(text, has_children, bullet_id) {
        
        if (!has_children) {
          return(list(text = text))
        }
        
        list(text = text, children = get_bullets(depth + 1, parent = bullet_id))
        
      }) |> 
      set_names(~ paste0("b", seq_along(.)))
     
  }
  
  get_bullets()
  
}

get_news_data <- function(files = list.files("news-files", full.names = TRUE)) {
  
  # For notifications
  force(files)
  
  if (is.null(names(files))) {
    files <- files |> 
      set_names(basename) |> 
      set_names(str_remove, "\\.md$") 
  }
  
  bullets_data <- files |> 
    map(read_lines) |> 
    map(function(text) {
      
      out <- tibble(text = text) |> 
        
        # Add cols showing start/end lines for lists of bullets and 
        # individual bullets. Also give each bullet a unique id
        mutate(
          bullets_start = str_detect(text, "!begin-bullets-\\d+!"),
          bullets_end   = str_detect(text, "!end-bullets-\\d+!"),
          bullets_level = cumsum(bullets_start) - cumsum(bullets_end),
          bullet_start  = lag(str_detect(text, "!begin-bullet!"), default = FALSE),
          bullet_end    = str_detect(text, "!end-bullet!"),
          is_bullet     = as.logical(cumsum(bullet_start) - cumsum(bullet_end)) & bullets_level > 0,
          bullet_id     = cumsum(bullet_start) + ifelse(is_bullet, 0, NA)
        ) |> 
        
        # Remove helpers and any non-tweet text, e.g. headings etc
        filter(is_bullet) |> 
        select(-ends_with(c("start", "end")), -is_bullet) |>
        
        # Collapse so each bullet occupies a single row
        group_by(bullets_level, bullet_id) |> 
        summarise(
          text = text |> 
            str_c(collapse = "\n") |> 
            str_squish(),
          .groups = "drop"
        ) |> 
        arrange(bullet_id) |> 
        
        # Add a column which, for each sequence of sub-bullets, indicates the
        # bullet which the sub-bullets are related to
        mutate(
          parent_id = map2_int(bullets_level, row_number(), function(b, r) {
            rows <- row_number()
            as.integer(bullet_id[max(rows[rows < r & bullets_level == b - 1] %or% NA_real_)])
          }),
          .before = 1
        )
      
      # Adding parent text is useful for identifying bullets when working out
      # what hasn't been tweeted yet
      out |> 
        left_join(
          out |> select(bullet_id, parent_text = text),
          by = c("parent_id" = "bullet_id")
        )
      
    }) |> 
    
    bind_rows(.id = "package")
  
}
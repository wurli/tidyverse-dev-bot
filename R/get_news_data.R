get_news_data <- function(files = list.files("news-files-annotated", full.names = TRUE)) {
  
  # For notifications
  force(files)
  
  cli_h2("Formatting news as a tidy dataframe")
  
  if (length(files) == 0) {
    return(tibble())
  }
  
  if (is.null(names(files))) {
    files <- files |> 
      set_names(basename) |> 
      set_names(str_remove, "\\.md$") 
  }
  
  bullets_data <- files |> 
    map(read_lines) |> 
    imap(news_to_df) |> 
    bind_rows(.id = "package")
  
}


# news_to_df(read_lines("test.md"))
news_to_df <- function(text, pkg, bullet_syms = c("\U2022", "\U2023", "\U2043")) {
  
  cli_alert("Formatting {.file NEWS.md} as a dataset for package {.pkg {pkg}}")
  
  # Annotations which delimit bullet lists, bullets and code blocks
  ann <- list(
    bullets_start   = "!begin-bullets-\\d+!",
    bullets_end     = "!end-bullets-\\d+!",
    bullet_start    = "!begin-bullet!",
    bullet_end      = "!end-bullet!",
    codeblock_start = "!begin-codeblock!",
    codeblock_end   = "!end-codeblock!"
  )
  
  # out <- tibble(text = text) |> 
  out <- tibble(text = text) |> 
    
    # Helper columns derived from annotations added by the lua filter
    mutate(
      bullets_start   = str_detect(text, ann$bullets_start),
      bullets_end     = str_detect(text, ann$bullets_end),
      bullets_level   = cumsum(bullets_start) - cumsum(bullets_end),
      bullet_start    = lag(str_detect(text, ann$bullet_start), default = FALSE),
      bullet_end      = str_detect(text, ann$bullet_end),
      is_bullet       = as.logical(cumsum(bullet_start) - cumsum(bullet_end)),
      bullet_id       = cumsum(bullet_start) + ifelse(is_bullet, 0, NA),
      codeblock_start = lag(str_detect(text, ann$codeblock_start), default = FALSE),
      codeblock_end   = lead(str_detect(text, ann$codeblock_end), 1, default = FALSE),
      is_codeblock    = as.logical(cumsum(codeblock_start) - cumsum(codeblock_end)),
      codeblock_id    = ifelse(is_codeblock, cumsum(codeblock_start), NA),
      is_annotation   = str_detect(text, paste(ann, collapse = "|")),
      order           = row_number(),
      section_id      = cumsum(bullet_start) + cumsum(codeblock_start)
    ) |> 
    
    # Remove helpers and any non-tweet text, e.g. headings etc
    filter(
      is_bullet, 
      !is_annotation,
      !str_squish(text) %in% c("```", "``` r", "``` {r}")
    ) |> 
    select(-c(ends_with(c("start", "end")), is_bullet, is_annotation)) |> 
    
    # Collapse so each chunk of text occupies a single row. Bullets may still
    # be spread across multiple rows if they include code blocks
    group_by(bullets_level, bullet_id, codeblock_id, is_codeblock, section_id) |> 
    summarise(
      across(text, function(text) {
        
        # Non-code sections can just be squished together
        if (!any(is_codeblock)) {
          return(str_squish(paste(text, collapse = "\n")))
        }
        
        # Get the level of indentation for the whole code block so it can
        # be removed to save precious chars
        indents <- text |> 
          str_subset("^\\s*$", negate = TRUE) |> 
          str_extract("^ *") |> 
          str_length() |> 
          min()
        
        # Remove indentation
        text <- str_remove(text, paste0("^", str_dup(" ", indents)))
        
        # Add fence ticks and collapse to a single string
        paste0("```\n", paste(text, collapse = "\n"), "\n```")
        
      }),
      order = min(order),
      .groups = "drop"
    ) |> 
    arrange(order) |> 
    
    # Remove any blank lines (which aren't code)
    filter(is_codeblock | !str_detect(text, "^\\s*$")) |> 
    
    # Add bullet symbols where bullets level > 1. Bullets are never really
    # nested more than one level, but it's nice to handle those cases.
    with_groups(
      bullet_id, mutate, text = ifelse(
        bullets_level > 1 & row_number() == 1,
        paste(bullet_syms[((bullets_level - 2) %% length(bullet_syms)) + 1], text),
        text
      )
    ) |> 
    
    # Replace @ with @+nbsp so github users don't show as twitter users.
    # Also give sub-bullets the same id as their 'parent'. Also add a column
    # indicating what the text of the `parent` bullet says. This is useful for
    # checking whether a bullet has already been tweeted.
    mutate(
      text = text |> str_replace_all("@", "@\U200B"),
      bullet_id = ifelse(bullets_level > 1, NA, bullet_id),
      parent_text = ifelse(bullets_level > 1, NA_character_, text),
    ) |> 
    fill(bullet_id, parent_text, .direction = "down") |> 
    mutate(parent_text = ifelse(bullets_level == 1, NA_character_, parent_text)) |> 
    
    select(bullets_level, bullet_id, section_id, is_codeblock, text, parent_text)
  
}

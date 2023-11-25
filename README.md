# Tidyverse News Twitter Bot

This bot scrapes updates about tidyverse packages from GitHub and posts
them to twitter.

-   You can find the bot at
    [\@tidyverse_news](https://twitter.com/tidyverse_news)

-   This bot is maintained by [\@_wurli](https://twitter.com/_wurli)

## How does it work?

1.  `NEWS.md` files are scraped from GitHub for all the packages listed
    by `tidyverse::tidyverse_packages()`

2.  Annotations are applied to these files using pandoc with a custom
    Lua filter. Annotations indicate where bullets begin and end so that
    tweets can be grouped together sensibly.

3.  This data is transformed using R to give individual tweets or
    threads where bullets would otherwise overflow. The
    [twitter-text](https://github.com/twitter/twitter-text) javascript
    library is used here to test whether tweets are valid or not.

4.  Updates which have already been posted are excluded by checking against 
    a CSV database. Updates don't have to exactly match previously posted ones -
    if they're very similar to previously posted updates, they won't get posted
    again.

5.  Tweets are posted using the {rtweet} package

6.  This is run by sourcing `run.R` once every hour using GitHub
    Actions

## Why?

If you use R a lot it's interesting to see what features are in the
works for popular packages. I also wanted to learn more about twitter
bots and GitHub actions, so this seemed like a good learning exercise.

## Packages

The bot currently posts updates to the following packages:

<!-- 
news_urls(.for_humans = TRUE) |> 
  iwalk(function(x, y) {
      x <- str_remove(x, "/blob.+")
      cat_line(glue("*  [{y}]({x})"))
  })
-->

*  [broom](https://github.com/tidymodels/broom)
*  [cli](https://github.com/r-lib/cli)
*  [crayon](https://github.com/r-lib/crayon)
*  [dbplyr](https://github.com/tidyverse/dbplyr)
*  [dplyr](https://github.com/tidyverse/dplyr)
*  [dtplyr](https://github.com/tidyverse/dtplyr)
*  [forcats](https://github.com/tidyverse/forcats)
*  [ggplot2](https://github.com/tidyverse/ggplot2)
*  [googledrive](https://github.com/tidyverse/googledrive)
*  [googlesheets4](https://github.com/tidyverse/googlesheets4)
*  [haven](https://github.com/tidyverse/haven)
*  [hms](https://github.com/tidyverse/hms)
*  [httr](https://github.com/r-lib/httr)
*  [httr2](https://github.com/r-lib/httr2)
*  [lubridate](https://github.com/tidyverse/lubridate)
*  [magrittr](https://github.com/tidyverse/magrittr)
*  [modelr](https://github.com/tidyverse/modelr)
*  [pillar](https://github.com/r-lib/pillar)
*  [purrr](https://github.com/tidyverse/purrr)
*  [readr](https://github.com/tidyverse/readr)
*  [readxl](https://github.com/tidyverse/readxl)
*  [reprex](https://github.com/tidyverse/reprex)
*  [rlang](https://github.com/r-lib/rlang)
*  [rstudioapi](https://github.com/rstudio/rstudioapi)
*  [rvest](https://github.com/tidyverse/rvest)
*  [stringr](https://github.com/tidyverse/stringr)
*  [tibble](https://github.com/tidyverse/tibble)
*  [tidyr](https://github.com/tidyverse/tidyr)
*  [tidyverse](https://github.com/tidyverse/tidyverse)
*  [xml2](https://github.com/r-lib/xml2)

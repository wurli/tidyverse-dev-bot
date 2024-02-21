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

This is all automated using GitHub Actions, which simply sources `run.R` once every hour. 

## Why?

If you use R a lot it's interesting to see what features are in the
works for popular packages. I also wanted to learn more about twitter
bots and GitHub actions, so this seemed like a good learning exercise.

## Packages

The bot currently posts updates to the following packages:

<!-- 
urls <- news_urls(.for_humans = TRUE)

urls[sort(names(urls))] |>
  iwalk(function(x, y) {
      x <- str_remove(x, "/blob.+")
      cat_line(glue("*  [{y}]({x})"))
  })
-->

*  [available](https://github.com/r-lib/available)
*  [bench](https://github.com/r-lib/bench)
*  [blob](https://github.com/tidyverse)
*  [callr](https://github.com/r-lib/callr)
*  [cli](https://github.com/r-lib/cli)
*  [clock](https://github.com/r-lib/clock)
*  [conflicted](https://github.com/r-lib/conflicted)
*  [dbplyr](https://github.com/tidyverse/dbplyr)
*  [debugme](https://github.com/r-lib/debugme)
*  [desc](https://github.com/r-lib/desc)
*  [devtools](https://github.com/r-lib/devtools)
*  [diffviewer](https://github.com/r-lib/diffviewer)
*  [dplyr](https://github.com/tidyverse/dplyr)
*  [dsbox](https://github.com/tidyverse/dsbox)
*  [dtplyr](https://github.com/tidyverse/dtplyr)
*  [fastmap](https://github.com/r-lib/fastmap)
*  [forcats](https://github.com/tidyverse/forcats)
*  [fs](https://github.com/r-lib/fs)
*  [funs](https://github.com/tidyverse/funs)
*  [gargle](https://github.com/r-lib/gargle)
*  [ggplot2](https://github.com/tidyverse/ggplot2)
*  [gh](https://github.com/r-lib/gh)
*  [gitcreds](https://github.com/r-lib/gitcreds)
*  [gmailr](https://github.com/r-lib/gmailr)
*  [googledrive](https://github.com/tidyverse/googledrive)
*  [googlesheets4](https://github.com/tidyverse/googlesheets4)
*  [haven](https://github.com/tidyverse/haven)
*  [hms](https://github.com/tidyverse/hms)
*  [httr](https://github.com/r-lib/httr)
*  [httr2](https://github.com/r-lib/httr2)
*  [lifecycle](https://github.com/r-lib/lifecycle)
*  [lintr](https://github.com/r-lib/lintr)
*  [lubridate](https://github.com/tidyverse/lubridate)
*  [magrittr](https://github.com/tidyverse/magrittr)
*  [memoise](https://github.com/r-lib/memoise)
*  [mockery](https://github.com/r-lib/mockery)
*  [modelr](https://github.com/tidyverse/modelr)
*  [multidplyr](https://github.com/tidyverse/multidplyr)
*  [nycflights13](https://github.com/tidyverse/nycflights13)
*  [pak](https://github.com/r-lib/pak)
*  [pillar](https://github.com/r-lib/pillar)
*  [pkgdown](https://github.com/r-lib/pkgdown)
*  [prettycode](https://github.com/r-lib/prettycode)
*  [prettyunits](https://github.com/r-lib/prettyunits)
*  [purrr](https://github.com/tidyverse/purrr)
*  [R6](https://github.com/r-lib/R6)
*  [ragg](https://github.com/r-lib/ragg)
*  [rcmdcheck](https://github.com/r-lib/rcmdcheck)
*  [readr](https://github.com/tidyverse/readr)
*  [readxl](https://github.com/tidyverse/readxl)
*  [remotes](https://github.com/r-lib/remotes)
*  [reprex](https://github.com/tidyverse/reprex)
*  [rex](https://github.com/r-lib/rex)
*  [rlang](https://github.com/r-lib/rlang)
*  [roxygen2](https://github.com/r-lib/roxygen2)
*  [rstudioapi](https://github.com/rstudio/rstudioapi)
*  [rvest](https://github.com/tidyverse/rvest)
*  [scales](https://github.com/r-lib/scales)
*  [sessioninfo](https://github.com/r-lib/sessioninfo)
*  [slider](https://github.com/r-lib/slider)
*  [stringr](https://github.com/tidyverse/stringr)
*  [styler](https://github.com/r-lib/styler)
*  [testthat](https://github.com/r-lib/testthat)
*  [tibble](https://github.com/tidyverse/tibble)
*  [tidyr](https://github.com/tidyverse/tidyr)
*  [tidyselect](https://github.com/r-lib/tidyselect)
*  [tidyverse](https://github.com/tidyverse/tidyverse)
*  [usethis](https://github.com/r-lib/usethis)
*  [vctrs](https://github.com/r-lib/vctrs)
*  [vroom](https://github.com/tidyverse/vroom)
*  [waldo](https://github.com/r-lib/waldo)
*  [withr](https://github.com/r-lib/withr)
*  [xml2](https://github.com/r-lib/xml2)

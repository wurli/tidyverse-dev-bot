# Tidyverse News Twitter Bot

This bot scrapes updates about tidyverse packages from GitHub and posts them to 
twitter.

* You can find the bot at (@tidyverse_updates)[https://twitter.com/tidyverse_news]

* This bot is maintained by (@_wurli)[https://twitter.com/_wurli]

## How does it work?

1. `NEWS.md` files are scraped from GitHub for all the packages listed by
   `tidyverse::tidyverse_packages()`

2. Annotations are applied to these files using pandoc with a custom lua filter.
   Annotations indicate where bullets begin and end so that tweets can be
   grouped together sensibly. 
   
3. This data is transformed using R to give individual tweets or threads where
   bullets would otherwise overflow. The (twitter-text)[https://github.com/twitter/twitter-text]
   javascript library is used here to test whether tweets are valid or not.
   
4. Tweets are posted using the {rtweet} package

5. This is run every 3 hours using GitHub Actions

## Why?

If you use R a lot it's interesting to see what features are in the works for
popular packages. I also wanted to learn more about twitter bots and GitHub
actions, so this seemed like a good learning exercise. 

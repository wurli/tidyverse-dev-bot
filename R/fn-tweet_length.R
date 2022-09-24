# Uses the javascript library made available by twitter
tweet_length <- function(x) {
  x |> 
    map(~ .ct$call("twttr.txt.parseTweet", .x)) |> 
    map_int("weightedLength")
}

Sys.getenv("PANDOC_READER_OPTIONS") -> x

readr::write_lines(x, "r-json.json")

cat(x)
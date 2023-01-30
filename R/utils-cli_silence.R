cli_silence <- function(expr) {
  cli::cli_fmt(
    out <- expr
  )
  out
}
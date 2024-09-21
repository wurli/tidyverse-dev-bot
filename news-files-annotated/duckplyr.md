```{=html}
<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->
```
# duckplyr 0.4.1.9003 (2024-08-20)

## Features

!begin-bullets-1!

-   !begin-bullet!
    Detect functions from the duckplyr package (#246).

    !end-bullet!
-   !begin-bullet!
    New `duckplyr_execute()` to execute configuration queries against
    the default duckdb connection (#39, #165, #227).

    !end-bullet!
-   !begin-bullet!
    `as_duckplyr_tibble()` supports dbplyr connections to a duckdb
    database (#86, #211, #226).

    !end-bullet!

!end-bullets-1!

## Continuous integration

!begin-bullets-2!

-   !begin-bullet!
    Avoid failures if artifact is missing.

    !end-bullet!
-   !begin-bullet!
    Store SHA as artifact.

    !end-bullet!
-   !begin-bullet!
    Move towards external status updates.

    !end-bullet!
-   !begin-bullet!
    Tweak status workflow.

    !end-bullet!
-   !begin-bullet!
    Use token.

    !end-bullet!
-   !begin-bullet!
    Add external workflow to update commit statuses.

    !end-bullet!
-   !begin-bullet!
    Avoid manually installing package for pkgdown (#245).

    !end-bullet!
-   !begin-bullet!
    Fix fledge (#243).

    !end-bullet!
-   !begin-bullet!
    Use proper remote repo (#241).

    !end-bullet!
-   !begin-bullet!
    Add permissions to fledge workflow (#238).

    !end-bullet!
-   !begin-bullet!
    Fix tests without suggested packages (#236).

    !end-bullet!
-   !begin-bullet!
    Add permissions to fledge workflow (#235).

    !end-bullet!
-   !begin-bullet!
    Add permissions to fledge workflow (#234).

    !end-bullet!
-   !begin-bullet!
    Add input to fledge workflow (#233).

    !end-bullet!
-   !begin-bullet!
    Use proper token for fledge (#232).

    !end-bullet!
-   !begin-bullet!
    Fix fledge workflow (#231).

    !end-bullet!
-   !begin-bullet!
    Bump version via PR (#230).

    !end-bullet!
-   !begin-bullet!
    Sync with duckdb.

    !end-bullet!

!end-bullets-2!

# duckplyr 0.4.1.9002 (2024-08-16)

## Documentation

!begin-bullets-3!

-   !begin-bullet!
    Move to tidyverse (#225).
    !end-bullet!

!end-bullets-3!

# duckplyr 0.4.1.9001 (2024-07-13)

!begin-bullets-4!

-   !begin-bullet!
    Merge branch 'cran-0.4.1'.
    !end-bullet!

!end-bullets-4!

# duckplyr 0.4.1.9000 (2024-07-12)

!begin-bullets-5!

-   !begin-bullet!
    Merge branch 'cran-0.4.1'.
    !end-bullet!

!end-bullets-5!

# duckplyr 0.4.1 (2024-07-11)

## Features

!begin-bullets-6!

-   !begin-bullet!
    `df_from_file()` and related functions support multiple files (#194,
    #195), show a clear error message for non-string `path` arguments
    (#182), and create a tibble by default (#177).
    !end-bullet!
-   !begin-bullet!
    New `as_duckplyr_tibble()` to convert a data frame to a duckplyr
    tibble (#177).
    !end-bullet!
-   !begin-bullet!
    Support descending sort for character and other non-numeric data
    (@toppyy, #92, #175).
    !end-bullet!
-   !begin-bullet!
    Avoid setting memory limit (#193).
    !end-bullet!
-   !begin-bullet!
    Check compatibility of join columns (#168, #185).
    !end-bullet!
-   !begin-bullet!
    Explicitly list supported functions, add contributing guide, add
    analysis scripts for GitHub activity data (#179).
    !end-bullet!

!end-bullets-6!

## Documentation

!begin-bullets-7!

-   !begin-bullet!
    Add contributing guide (#179).
    !end-bullet!
-   !begin-bullet!
    Show a startup message at package load if telemetry is not
    configured (#188, #198).
    !end-bullet!
-   !begin-bullet!
    `?df_from_file` shows how to read multiple files (#181, #186) and
    how to specify CSV column types (#140, #189), and is shown correctly
    in reference index (#173, #190).
    !end-bullet!
-   !begin-bullet!
    Discuss dbplyr in README (#145, #191).
    !end-bullet!
-   !begin-bullet!
    Add analysis scripts for GitHub activity data (#179).
    !end-bullet!

!end-bullets-7!

# duckplyr 0.4.0 (2024-05-21)

## Features

!begin-bullets-8!

-   !begin-bullet!
    Use built-in rfuns extension to implement equality and inequality
    operators, improve translation for `as.integer()`, `NA` and `%in%`
    (#83, #154, #148, #155, #159, #160).
    !end-bullet!
-   !begin-bullet!
    Reexport non-deprecated dplyr functions (#144, #163).
    !end-bullet!
-   !begin-bullet!
    `library(duckplyr)` calls `methods_overwrite()` (#164).
    !end-bullet!
-   !begin-bullet!
    Only allow constant patterns in `grepl()`.
    !end-bullet!
-   !begin-bullet!
    Explicitly reject calls with named arguments for now.
    !end-bullet!
-   !begin-bullet!
    Reduce default memory limit to 1 GB.
    !end-bullet!

!end-bullets-8!

## Bug fixes

!begin-bullets-9!

-   !begin-bullet!
    Stricter type checks in the set operations `intersect()`,
    `setdiff()`, `symdiff()`, `union()`, and `union_all()` (#169).
    !end-bullet!
-   !begin-bullet!
    Distinguish between constant `NA` and those used in an expression
    (#157).
    !end-bullet!
-   !begin-bullet!
    `head(-1)` forwards to the default implementation (#131, #156).
    !end-bullet!
-   !begin-bullet!
    Fix cli syntax for internal error message (#151).
    !end-bullet!
-   !begin-bullet!
    More careful detection of row names in data frame.
    !end-bullet!
-   !begin-bullet!
    Always check roundtrip for timestamp columns.
    !end-bullet!
-   !begin-bullet!
    `left_join()` and other join functions call `auto_copy()`.
    !end-bullet!
-   !begin-bullet!
    Only reset expression depth if it has been set before.
    !end-bullet!
-   !begin-bullet!
    Require fallback if the result contains duplicate column names when
    ignoring case.
    !end-bullet!
-   !begin-bullet!
    `row_number()` returns integer.
    !end-bullet!
-   !begin-bullet!
    `is.na(NaN)` is `TRUE`.
    !end-bullet!
-   !begin-bullet!
    `summarise(count = n(), count = n())` creates only one column named
    `count`.
    !end-bullet!
-   !begin-bullet!
    Correct wording in instructions for enabling fallback logging
    (@TimTaylor, #141).
    !end-bullet!

!end-bullets-9!

## Chore

!begin-bullets-10!

-   !begin-bullet!
    Remove styler dependency (#137, #138).
    !end-bullet!
-   !begin-bullet!
    Avoid error from stats collection.
    !end-bullet!

!end-bullets-10!

## Documentation

!begin-bullets-11!

-   !begin-bullet!
    Mention wildcards to read multiple files in `?df_from_file`
    (@andreranza, #133, #134).
    !end-bullet!

!end-bullets-11!

## Testing

!begin-bullets-12!

-   !begin-bullet!
    Reenable tests that now run successfully (#166).
    !end-bullet!
-   !begin-bullet!
    Synchronize tests (#153).
    !end-bullet!
-   !begin-bullet!
    Test that `vec_ptype()` does not materialize (#149).
    !end-bullet!
-   !begin-bullet!
    Improve telemetry tests.
    !end-bullet!
-   !begin-bullet!
    Promote equality checks to `expect_identical()` to capture
    differences between doubles and integers.
    !end-bullet!

!end-bullets-12!

# duckplyr 0.3.2 (2024-03-17)

## Bug fixes

!begin-bullets-13!

-   !begin-bullet!
    Run autoupload in function so that it will be checked by static
    analysis (#122).
    !end-bullet!

!end-bullets-13!

## Features

!begin-bullets-14!

-   !begin-bullet!
    New `df_to_parquet()` to write to Parquet, new convenience functions
    `df_from_csv()`, `duckdb_df_from_csv()`, `df_from_parquet()` and
    `duckdb_df_from_parquet()` (#87, #89, #96, #128).
    !end-bullet!

!end-bullets-14!

# duckplyr 0.3.1 (2024-03-08)

## Bug fixes

!begin-bullets-15!

-   !begin-bullet!
    Forbid reuse of new columns created in `summarise()` (#72, #106).
    !end-bullet!
-   !begin-bullet!
    `summarise()` no longer restores subclass.
    !end-bullet!
-   !begin-bullet!
    Disambiguate computation of `log10()` and `log()`.
    !end-bullet!
-   !begin-bullet!
    Fix division by zero for positive and negative numbers.
    !end-bullet!

!end-bullets-15!

## Features

!begin-bullets-16!

-   !begin-bullet!
    New `fallback_sitrep()` and related functionality for collecting
    telemetry data (#102, #107, #110, #111, #115). No data is collected
    by default, only a message is displayed once per session and then
    every eight hours. Opt in or opt out by setting environment
    variables.
    !end-bullet!
-   !begin-bullet!
    Implement `group_by()` and other methods to collect fallback
    information (#94, #104, #105).
    !end-bullet!
-   !begin-bullet!
    Set memory limit and temporary directory for duckdb.
    !end-bullet!
-   !begin-bullet!
    Implement `suppressWarnings()` as the identity function.
    !end-bullet!
-   !begin-bullet!
    Prefer `cli::cli_abort()` over `stop()` or `rlang::abort()` (#114).
    !end-bullet!
-   !begin-bullet!
    Translate `.data$a` and `.env$a`.
    !end-bullet!
-   !begin-bullet!
    Strict checks for column class, only supporting `integer`,
    `numeric`, `logical`, `Date`, `POSIXct`, and `difftime` for now.
    !end-bullet!
-   !begin-bullet!
    If the environment variable `DUCKPLYR_METHODS_OVERWRITE` is set to
    `TRUE`, loading duckplyr automatically calls `methods_overwrite()`.
    !end-bullet!

!end-bullets-16!

## Internal

!begin-bullets-17!

-   !begin-bullet!
    Better duckdb tests.
    !end-bullet!
-   !begin-bullet!
    Use standalone purrr for dplyr compatibility.
    !end-bullet!

!end-bullets-17!

## Testing

!begin-bullets-18!

-   !begin-bullet!
    Add tests for correct base of `log()` and `log10()`.
    !end-bullet!

!end-bullets-18!

## Documentation

!begin-bullets-19!

-   !begin-bullet!
    `methods_overwrite()` and `methods_restore()` show a message.
    !end-bullet!

!end-bullets-19!

# duckplyr 0.3.0 (2023-12-10)

## Bug fixes

!begin-bullets-20!

-   !begin-bullet!
    `grepl(x = NA)` gives correct results.
    !end-bullet!
-   !begin-bullet!
    Fix `auto_copy()` for non-data-frame input.
    !end-bullet!
-   !begin-bullet!
    Add output order preservation for filters.
    !end-bullet!
-   !begin-bullet!
    `distinct()` now preserves order in corner cases (#77, #78).
    !end-bullet!
-   !begin-bullet!
    Consistent computation of `log(0)` and `log(-1)` (#75, #76).
    !end-bullet!

!end-bullets-20!

## Features

!begin-bullets-21!

-   !begin-bullet!
    Only allow constants in `mutate()` that are actually representable
    in duckdb (#73).
    !end-bullet!
-   !begin-bullet!
    Avoid translating `ifelse()`, support `if_else()` (#79).
    !end-bullet!

!end-bullets-21!

## Documentation

!begin-bullets-22!

-   !begin-bullet!
    Separate and explain the new relational examples (@wibeasley, #84).
    !end-bullet!

!end-bullets-22!

## Testing

!begin-bullets-23!

-   !begin-bullet!
    Add test that TPC-H queries can be processed.
    !end-bullet!

!end-bullets-23!

## Chore

!begin-bullets-24!

-   !begin-bullet!
    Sync with dplyr 1.1.4 (#82).
    !end-bullet!
-   !begin-bullet!
    Remove `dplyr_reconstruct()` method (#48).
    !end-bullet!
-   !begin-bullet!
    Render README.
    !end-bullet!
-   !begin-bullet!
    Fix code generated by `meta_replay()`.
    !end-bullet!
-   !begin-bullet!
    Bump constructive dependency.
    !end-bullet!
-   !begin-bullet!
    Fix output order for `arrange()` in case of ties.
    !end-bullet!
-   !begin-bullet!
    Update duckdb tests.
    !end-bullet!
-   !begin-bullet!
    Only implement newer `slice_sample()`, not `sample_n()` or
    `sample_frac()` (#74).
    !end-bullet!
-   !begin-bullet!
    Sync generated files (#71).
    !end-bullet!

!end-bullets-24!

# duckplyr 0.2.3 (2023-11-08)

## Performance

!begin-bullets-25!

-   !begin-bullet!
    Join using `IS NOT DISTINCT FROM` for faster execution
    (duckdb/duckdb-r#41, #68).
    !end-bullet!

!end-bullets-25!

## Documentation

!begin-bullets-26!

-   !begin-bullet!
    Add stability to README output (@maelle, #62, #65).
    !end-bullet!

!end-bullets-26!

# duckplyr 0.2.2 (2023-10-16)

## Bug fixes

!begin-bullets-27!

-   !begin-bullet!
    `summarise()` keeps `"duckplyr_df"` class (#63, #64).

    !end-bullet!
-   !begin-bullet!
    Fix compatibility with duckdb \>= 0.9.1.

    !end-bullet!

!end-bullets-27!

## Chore

!begin-bullets-28!

-   !begin-bullet!
    Skip tests that give different output on dev tidyselect.

    !end-bullet!
-   !begin-bullet!
    Import `utils::globalVariables()`.

    !end-bullet!

!end-bullets-28!

## Documentation

!begin-bullets-29!

-   !begin-bullet!
    Small README improvements (@maelle, #34, #57).

    !end-bullet!
-   !begin-bullet!
    Fix 301 in README.

    !end-bullet!

!end-bullets-29!

# duckplyr 0.2.1 (2023-09-16)

!begin-bullets-30!

-   !begin-bullet!
    Improve documentation.

    !end-bullet!
-   !begin-bullet!
    Work around problem with `dplyr_reconstruct()` in R 4.3.

    !end-bullet!
-   !begin-bullet!
    Rename `duckdb_from_file()` to `df_from_file()`.

    !end-bullet!
-   !begin-bullet!
    Unexport private `duckdb_rel_from_df()`, `rel_from_df()`,
    `wrap_df()` and `wrap_integer()`.

    !end-bullet!
-   !begin-bullet!
    Reexport `%>%` and `tibble()`.

    !end-bullet!

!end-bullets-30!

# duckplyr 0.2.0 (2023-09-10)

!begin-bullets-31!

-   !begin-bullet!
    Implement relational API for DuckDB.
    !end-bullet!

!end-bullets-31!

# duckplyr 0.1.0 (2023-07-03)

## Bug fixes

!begin-bullets-32!

-   !begin-bullet!
    Fix examples.
    !end-bullet!

!end-bullets-32!

## Chore

!begin-bullets-33!

-   !begin-bullet!
    Add CRAN install instructions.
    !end-bullet!
-   !begin-bullet!
    Satisfy `R CMD check`.
    !end-bullet!
-   !begin-bullet!
    Document argument.
    !end-bullet!
-   !begin-bullet!
    Error on NOTE.
    !end-bullet!
-   !begin-bullet!
    Remove `relexpr_window()` for now.
    !end-bullet!

!end-bullets-33!

## Documentation

!begin-bullets-34!

-   !begin-bullet!
    Clean up reference.
    !end-bullet!

!end-bullets-34!

## Uncategorized

Initial version, exporting: - `new_relational()` to construct objects of
class `"relational"` - Generics `rel_aggregate()`, `rel_distinct()`,
`rel_filter()`, `rel_join()`, `rel_limit()`, `rel_names()`,
`rel_order()`, `rel_project()`, `rel_set_diff()`, `rel_set_intersect()`,
`rel_set_symdiff()`, `rel_to_df()`, `rel_union_all()` - `new_relexpr()`
to construct objects of class `"relational_relexpr"` - Expression
builders `relexpr_constant()`, `relexpr_function()`,
`relexpr_reference()`, `relexpr_set_alias()`, `relexpr_window()`

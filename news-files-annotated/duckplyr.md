```{=html}
<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->
```
# duckplyr 1.0.1.9012 (2025-04-18)

## Bug fixes

!begin-bullets-1!

-   !begin-bullet!
    Set functions like `union()` no longer trigger materialization
    (#654, #692).
    !end-bullet!

!end-bullets-1!

## Features

!begin-bullets-2!

-   !begin-bullet!
    Remove experimental flag (#682, #695).
    !end-bullet!

!end-bullets-2!

## Documentation

!begin-bullets-3!

-   !begin-bullet!
    Move package.
    !end-bullet!

!end-bullets-3!

# duckplyr 1.0.1.9011 (2025-04-17)

## Features

!begin-bullets-4!

-   !begin-bullet!
    Register `has_children` and `has_viewer` methods for Positron
    (#678).
    !end-bullet!

!end-bullets-4!

## Documentation

!begin-bullets-5!

-   !begin-bullet!
    Add Posit's ROR ID (#592).
    !end-bullet!

!end-bullets-5!

# duckplyr 1.0.1.9010 (2025-04-12)

## Features

!begin-bullets-6!

-   !begin-bullet!
    Passthrough of functions prefixed with `dd$`, e.g., `dd$ROW()` will
    be translated as DuckDB's `ROW()` function (#658).

    !end-bullet!
-   !begin-bullet!
    New `as_tbl()` to convert to a dbplyr tbl object (#634, #685).

    !end-bullet!

!end-bullets-6!

## Chore

!begin-bullets-7!

-   !begin-bullet!
    Remove space at EOL.

    !end-bullet!
-   !begin-bullet!
    Bump required version of pillar.

    !end-bullet!

!end-bullets-7!

## Documentation

!begin-bullets-8!

-   !begin-bullet!
    Add `vignette("duckdb")` (#690).

    !end-bullet!
-   !begin-bullet!
    Add experimental badge.

    !end-bullet!

!end-bullets-8!

# duckplyr 1.0.1.9009 (2025-04-11)

## Documentation

!begin-bullets-9!

-   !begin-bullet!
    Verbose `conflict_prefer()` (#667, #684).
    !end-bullet!

!end-bullets-9!

# duckplyr 1.0.1.9008 (2025-04-10)

## Documentation

!begin-bullets-10!

-   !begin-bullet!
    Typos + clarification edits to "large" vignette
    (@mine-cetinkaya-rundel, #665).
    !end-bullet!

!end-bullets-10!

## Testing

!begin-bullets-11!

-   !begin-bullet!
    Snapshot updates for rcc-smoke (null) (#675).
    !end-bullet!

!end-bullets-11!

# duckplyr 1.0.1.9007 (2025-04-02)

## Features

!begin-bullets-12!

-   !begin-bullet!
    Register Ark methods for Positron's Variables Pane (@DavisVaughan,
    #661).
    !end-bullet!

!end-bullets-12!

# duckplyr 1.0.1.9006 (2025-03-27)

## Features

!begin-bullets-13!

-   !begin-bullet!
    Implement `n_distinct()` as macro with support for `na.rm = TRUE`
    (@joakimlinde, #572, #655).
    !end-bullet!

!end-bullets-13!

## Chore

!begin-bullets-14!

-   !begin-bullet!
    Use roxyglobals from CRAN rather than GitHub (@andreranza, #659).

    !end-bullet!
-   !begin-bullet!
    Space at EOL.

    !end-bullet!

!end-bullets-14!

## Documentation

!begin-bullets-15!

-   !begin-bullet!
    Recommend `pak::pak()`.
    !end-bullet!

!end-bullets-15!

# duckplyr 1.0.1.9005 (2025-03-12)

## Features

!begin-bullets-16!

-   !begin-bullet!
    Translate `dplyr::coalesce()`.
    !end-bullet!

!end-bullets-16!

## Chore

!begin-bullets-17!

-   !begin-bullet!
    Bring tools and patch up to date (@joakimlinde, #647).
    !end-bullet!

!end-bullets-17!

# duckplyr 1.0.1.9004 (2025-03-11)

## Chore

!begin-bullets-18!

-   !begin-bullet!
    Internal `rel_to_df()` needs `prudence` argument (#644).
    !end-bullet!

!end-bullets-18!

# duckplyr 1.0.1.9003 (2025-03-10)

## Bug fixes

!begin-bullets-19!

-   !begin-bullet!
    Joins no longer materialize the input data when the package is used
    with `methods_overwrite()` or `library(duckplyr)` (#641).
    !end-bullet!

!end-bullets-19!

## Features

!begin-bullets-20!

-   !begin-bullet!
    `compute()` does not have a fallback, failures are reported to the
    client (#637).

    !end-bullet!
-   !begin-bullet!
    Implement `slice_head()` (#640).

    !end-bullet!

!end-bullets-20!

## Chore

!begin-bullets-21!

-   !begin-bullet!
    Fix sync scripts and add reproducible code (#639).
    !end-bullet!

!end-bullets-21!

# duckplyr 1.0.1.9002 (2025-03-09)

## Chore

!begin-bullets-22!

-   !begin-bullet!
    Check loadability of extensino in test (#636).
    !end-bullet!

!end-bullets-22!

# duckplyr 1.0.1.9001 (2025-02-28)

## fledge

!begin-bullets-23!

-   !begin-bullet!
    CRAN release v1.0.1 (#624).
    !end-bullet!

!end-bullets-23!

# duckplyr 1.0.1.9000 (2025-02-22)

## Bug fixes

!begin-bullets-24!

-   !begin-bullet!
    Correct formatting for controlled fallbacks with
    `Sys.setenv(DUCKPLYR_FALLBACK_INFO = TRUE)`.
    !end-bullet!

!end-bullets-24!

# duckplyr 1.0.1 (2025-02-21)

## Bug fixes

!begin-bullets-25!

-   !begin-bullet!
    Check if extensions can be loaded before running examples and
    vignettes (#620).

    !end-bullet!
-   !begin-bullet!
    Show source of error if data frame cannot be converted to duck frame
    (#614).

    !end-bullet!
-   !begin-bullet!
    Correct formatting for controlled fallbacks with
    `Sys.setenv(DUCKPLYR_FALLBACK_INFO = TRUE)`

    !end-bullet!

!end-bullets-25!

## Chore

!begin-bullets-26!

-   !begin-bullet!
    Require duckdb \>= 1.2.0 (#619).

    !end-bullet!
-   !begin-bullet!
    Break this version with duckdb 2.0.0 (#623).

    !end-bullet!

!end-bullets-26!

## Documentation

!begin-bullets-27!

-   !begin-bullet!
    Separate `?compute_parquet` and `?compute_csv` (#610, #622).

    !end-bullet!
-   !begin-bullet!
    Italicize book title in README (@wibeasley, #607).

    !end-bullet!
-   !begin-bullet!
    Fix typo in `filter(.by = ...)` error message (@maelle, #611).

    !end-bullet!
-   !begin-bullet!
    Fix link in documentation (#600, #601).

    !end-bullet!

!end-bullets-27!

# duckplyr 1.0.0 (2025-02-02)

## Features

### Large data

!begin-bullets-28!

-   !begin-bullet!
    Improved support for handling large data from files and S3:
    ingestion with `read_parquet_duckdb()` and others, and
    materialization with `as_duckdb_tibble()`, `compute.duckplyr_df()`
    and `compute_file()`. See `vignette("large")` for details.

    !end-bullet!
-   !begin-bullet!
    Control automatic materialization of duckplyr frames with the new
    `prudence` argument to `as_duckdb_tibble()`, `duckdb_tibble()`,
    `compute.duckplyr_df()` and `compute_file()`. See
    `vignette("prudence")` for details.

    !end-bullet!

!end-bullets-28!

### New functions

!begin-bullets-29!

-   !begin-bullet!
    `read_csv_duckdb()` and others, deprecating `duckplyr_df_from_csv()`
    and `df_from_csv()` (#210, #396, #459).

    !end-bullet!
-   !begin-bullet!
    `read_sql_duckdb()` (experimental) to run SQL queries against the
    default DuckDB connection and return the result as a duckplyr frame
    (duckdb/duckdb-r#32, #397).

    !end-bullet!
-   !begin-bullet!
    `db_exec()` to execute configuration queries against the default
    duckdb connection (#39, #165, #227, #404, #459).

    !end-bullet!
-   !begin-bullet!
    `duckdb_tibble()` (#382, #457).

    !end-bullet!
-   !begin-bullet!
    `as_duckdb_tibble()`, replaces `as_duckplyr_tibble()` and
    `as_duckplyr_df()` (#383, #457) and supports dbplyr connections to a
    duckdb database (#86, #211, #226).

    !end-bullet!
-   !begin-bullet!
    `compute_parquet()` and `compute_csv()`, implement
    `compute.duckplyr_df()` (#409, #430).

    !end-bullet!
-   !begin-bullet!
    `fallback_config()` to create a configuration file for the settings
    that do not affect behavior (#216, #426).

    !end-bullet!
-   !begin-bullet!
    `is_duckdb_tibble()`, deprecates `is_duckplyr_df()` (#391, #392).

    !end-bullet!
-   !begin-bullet!
    `last_rel()` to retrieve the last relation object used in
    materialization (#209, #375).

    !end-bullet!
-   !begin-bullet!
    Add `"prudent_duckplyr_df"` class that stops automatic
    materialization and requires `collect()` (#381, #390).

    !end-bullet!

!end-bullets-29!

### Translations

!begin-bullets-30!

-   !begin-bullet!
    Partial support for `across()` in `mutate()` and `summarise()`
    (#296, #306, #318, @lionel-, @DavisVaughan).

    !end-bullet!
-   !begin-bullet!
    Implement `na.rm` handling for `sum()`, `min()`, `max()`, `any()`
    and `all()`, with fallback for window functions (#205, #566).

    !end-bullet!
-   !begin-bullet!
    Add support for `sub()` and `gsub()` (@toppyy, #420).

    !end-bullet!
-   !begin-bullet!
    Handle `dplyr::desc()` (#550).

    !end-bullet!
-   !begin-bullet!
    Avoid forwarding `is.na()` to `is.nan()` to support non-numeric
    data, avoid checking roundtrip for timestamp data (#482).

    !end-bullet!
-   !begin-bullet!
    Correctly handle missing values in `if_else()`.

    !end-bullet!
-   !begin-bullet!
    Limit number of items that can be handled with `%in%` (#319).

    !end-bullet!
-   !begin-bullet!
    `duckdb_tibble()` checks if columns can be represented in DuckDB
    (#537).

    !end-bullet!
-   !begin-bullet!
    Fall back to dplyr when passing `multiple` with joins (#323).

    !end-bullet!

!end-bullets-30!

### Error messages

!begin-bullets-31!

-   !begin-bullet!
    Improve fallback error message by explicitly materializing (#432,
    #456).

    !end-bullet!
-   !begin-bullet!
    Point to the native CSV reader if encountering data frames read with
    readr (#127, #469).

    !end-bullet!
-   !begin-bullet!
    Improve `as_duckdb_tibble()` error message for invalid `x` (@maelle,
    #339).

    !end-bullet!

!end-bullets-31!

### Behavior

!begin-bullets-32!

-   !begin-bullet!
    Depend on dplyr instead of reexporting all generics (#405). Nothing
    changes for users in scripts. When using duckplyr in a package, you
    now also need to import dplyr.

    !end-bullet!
-   !begin-bullet!
    Fallback logging is now on by default, can be disabled with
    configuration (#422).

    !end-bullet!
-   !begin-bullet!
    The default DuckDB connection is now based on a file, the location
    defaults to a subdirectory of `tempdir()` and can be controlled with
    the `DUCKPLYR_TEMP_DIR` environment variable (#439, #448, #561).

    !end-bullet!
-   !begin-bullet!
    `collect()` returns a tibble (#438, #447).

    !end-bullet!
-   !begin-bullet!
    `explain()` returns the input, invisibly (#331).

    !end-bullet!

!end-bullets-32!

## Bug fixes

!begin-bullets-33!

-   !begin-bullet!
    Compute ptype only for join columns in a safe way without
    materialization, not for the entire data frame (#289).

    !end-bullet!
-   !begin-bullet!
    Internal `expr_scrub()` (used for telemetry) can handle
    function-definitions (@toppyy, #268, #271).

    !end-bullet!
-   !begin-bullet!
    Harden telemetry code against invalid arguments (#321).

    !end-bullet!

!end-bullets-33!

## Documentation

!begin-bullets-34!

-   !begin-bullet!
    New articles: `vignette("large")`, `vignette("prudence")`,
    `vignette("fallback")`, `vignette("limits")`,
    `vignette("developers")`, `vignette("telemetry")` (#207, #504).

    !end-bullet!
-   !begin-bullet!
    New `flights_df()` used instead of `palmerpenguins::penguins`
    (#408).

    !end-bullet!
-   !begin-bullet!
    Move to the tidyverse GitHub organization, new repository URL
    https://github.com/tidyverse/duckplyr/ (#225).

    !end-bullet!
-   !begin-bullet!
    Avoid base pipe in examples for compatibility with R 4.0.0 (#463,
    #466).

    !end-bullet!

!end-bullets-34!

## Performance

!begin-bullets-35!

-   !begin-bullet!
    Comparison expressions are translated in a way that allows them to
    be pushed down to Parquet (@toppyy, #270).

    !end-bullet!
-   !begin-bullet!
    Printing a duckplyr frame no longer materializes (#255, #378).

    !end-bullet!
-   !begin-bullet!
    Prefer `vctrs::new_data_frame()` over `tibble()` (#500).

    !end-bullet!

!end-bullets-35!

# duckplyr 0.4.1 (2024-07-11)

## Features

!begin-bullets-36!

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

!end-bullets-36!

## Documentation

!begin-bullets-37!

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

!end-bullets-37!

# duckplyr 0.4.0 (2024-05-21)

## Features

!begin-bullets-38!

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

!end-bullets-38!

## Bug fixes

!begin-bullets-39!

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

!end-bullets-39!

## Chore

!begin-bullets-40!

-   !begin-bullet!
    Remove styler dependency (#137, #138).
    !end-bullet!
-   !begin-bullet!
    Avoid error from stats collection.
    !end-bullet!

!end-bullets-40!

## Documentation

!begin-bullets-41!

-   !begin-bullet!
    Mention wildcards to read multiple files in `?df_from_file`
    (@andreranza, #133, #134).
    !end-bullet!

!end-bullets-41!

## Testing

!begin-bullets-42!

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

!end-bullets-42!

# duckplyr 0.3.2 (2024-03-17)

## Bug fixes

!begin-bullets-43!

-   !begin-bullet!
    Run autoupload in function so that it will be checked by static
    analysis (#122).
    !end-bullet!

!end-bullets-43!

## Features

!begin-bullets-44!

-   !begin-bullet!
    New `df_to_parquet()` to write to Parquet, new convenience functions
    `df_from_csv()`, `duckdb_df_from_csv()`, `df_from_parquet()` and
    `duckdb_df_from_parquet()` (#87, #89, #96, #128).
    !end-bullet!

!end-bullets-44!

# duckplyr 0.3.1 (2024-03-08)

## Bug fixes

!begin-bullets-45!

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

!end-bullets-45!

## Features

!begin-bullets-46!

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

!end-bullets-46!

## Internal

!begin-bullets-47!

-   !begin-bullet!
    Better duckdb tests.
    !end-bullet!
-   !begin-bullet!
    Use standalone purrr for dplyr compatibility.
    !end-bullet!

!end-bullets-47!

## Testing

!begin-bullets-48!

-   !begin-bullet!
    Add tests for correct base of `log()` and `log10()`.
    !end-bullet!

!end-bullets-48!

## Documentation

!begin-bullets-49!

-   !begin-bullet!
    `methods_overwrite()` and `methods_restore()` show a message.
    !end-bullet!

!end-bullets-49!

# duckplyr 0.3.0 (2023-12-10)

## Bug fixes

!begin-bullets-50!

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

!end-bullets-50!

## Features

!begin-bullets-51!

-   !begin-bullet!
    Only allow constants in `mutate()` that are actually representable
    in duckdb (#73).
    !end-bullet!
-   !begin-bullet!
    Avoid translating `ifelse()`, support `if_else()` (#79).
    !end-bullet!

!end-bullets-51!

## Documentation

!begin-bullets-52!

-   !begin-bullet!
    Separate and explain the new relational examples (@wibeasley, #84).
    !end-bullet!

!end-bullets-52!

## Testing

!begin-bullets-53!

-   !begin-bullet!
    Add test that TPC-H queries can be processed.
    !end-bullet!

!end-bullets-53!

## Chore

!begin-bullets-54!

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

!end-bullets-54!

# duckplyr 0.2.3 (2023-11-08)

## Performance

!begin-bullets-55!

-   !begin-bullet!
    Join using `IS NOT DISTINCT FROM` for faster execution
    (duckdb/duckdb-r#41, #68).
    !end-bullet!

!end-bullets-55!

## Documentation

!begin-bullets-56!

-   !begin-bullet!
    Add stability to README output (@maelle, #62, #65).
    !end-bullet!

!end-bullets-56!

# duckplyr 0.2.2 (2023-10-16)

## Bug fixes

!begin-bullets-57!

-   !begin-bullet!
    `summarise()` keeps `"duckplyr_df"` class (#63, #64).

    !end-bullet!
-   !begin-bullet!
    Fix compatibility with duckdb \>= 0.9.1.

    !end-bullet!

!end-bullets-57!

## Chore

!begin-bullets-58!

-   !begin-bullet!
    Skip tests that give different output on dev tidyselect.

    !end-bullet!
-   !begin-bullet!
    Import `utils::globalVariables()`.

    !end-bullet!

!end-bullets-58!

## Documentation

!begin-bullets-59!

-   !begin-bullet!
    Small README improvements (@maelle, #34, #57).

    !end-bullet!
-   !begin-bullet!
    Fix 301 in README.

    !end-bullet!

!end-bullets-59!

# duckplyr 0.2.1 (2023-09-16)

!begin-bullets-60!

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

!end-bullets-60!

# duckplyr 0.2.0 (2023-09-10)

!begin-bullets-61!

-   !begin-bullet!
    Implement relational API for DuckDB.
    !end-bullet!

!end-bullets-61!

# duckplyr 0.1.0 (2023-07-03)

## Bug fixes

!begin-bullets-62!

-   !begin-bullet!
    Fix examples.
    !end-bullet!

!end-bullets-62!

## Chore

!begin-bullets-63!

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

!end-bullets-63!

## Documentation

!begin-bullets-64!

-   !begin-bullet!
    Clean up reference.
    !end-bullet!

!end-bullets-64!

## Uncategorized

Initial version, exporting: - `new_relational()` to construct objects of
class `"relational"` - Generics `rel_aggregate()`, `rel_distinct()`,
`rel_filter()`, `rel_join()`, `rel_limit()`, `rel_names()`,
`rel_order()`, `rel_project()`, `rel_set_diff()`, `rel_set_intersect()`,
`rel_set_symdiff()`, `rel_to_df()`, `rel_union_all()` - `new_relexpr()`
to construct objects of class `"relational_relexpr"` - Expression
builders `relexpr_constant()`, `relexpr_function()`,
`relexpr_reference()`, `relexpr_set_alias()`, `relexpr_window()`

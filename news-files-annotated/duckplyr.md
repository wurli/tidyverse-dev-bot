```{=html}
<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->
```
# duckplyr 0.99.99.9902 (2024-12-18)

## Features

!begin-bullets-1!

-   !begin-bullet!
    New `duck_exec()`, replaces `duckplyr_execute()` (#404).
    !end-bullet!

!end-bullets-1!

## Chore

!begin-bullets-2!

-   !begin-bullet!
    IDE.
    !end-bullet!

!end-bullets-2!

# duckplyr 0.99.99.9901 (2024-12-17)

## Features

!begin-bullets-3!

-   !begin-bullet!
    New `duck_sql()` (duckdb/duckdb-r#32, #397).

    !end-bullet!
-   !begin-bullet!
    New `duckparquet()`, `duckcsv()`, `duckjson()` and `duckfile()`,
    deprecating `duckplyr_df_from_*()` and `df_from_*()` functions
    (#210, #396).

    !end-bullet!
-   !begin-bullet!
    Deprecate `is_duckplyr_df()` (#392).

    !end-bullet!
-   !begin-bullet!
    New `is_ducktbl()` (#391).

    !end-bullet!
-   !begin-bullet!
    Add `"lazy_duckplyr_df"` class that requires `collect()` (#381,
    #390).

    !end-bullet!

!end-bullets-3!

## Chore

!begin-bullets-4!

-   !begin-bullet!
    Tweak `as_ducktbl()` for dbplyr lazy tables (#395).
    !end-bullet!

!end-bullets-4!

## Documentation

!begin-bullets-5!

-   !begin-bullet!
    Add item in checklist when adding a new translation (@maelle, #399).

    !end-bullet!
-   !begin-bullet!
    Add link to DuckDB configuration (#174, #398).

    !end-bullet!

!end-bullets-5!

# duckplyr 0.99.99.9900 (2024-12-16)

## Features

!begin-bullets-6!

-   !begin-bullet!
    New `duck_sql()` (duckdb/duckdb-r#32, #397).

    !end-bullet!
-   !begin-bullet!
    New `duckparquet()`, `duckcsv()`, `duckjson()` and `duckfile()`,
    deprecating `duckplyr_df_from_*()` and `df_from_*()` functions
    (#210, #396).

    !end-bullet!
-   !begin-bullet!
    Deprecate `is_duckplyr_df()` (#392).

    !end-bullet!
-   !begin-bullet!
    New `is_ducktbl()` (#391).

    !end-bullet!
-   !begin-bullet!
    Add `"lazy_duckplyr_df"` class that requires `collect()` (#381,
    #390).

    !end-bullet!
-   !begin-bullet!
    Use `as_duckplyr_df_impl()` in verbs (#386).

    !end-bullet!
-   !begin-bullet!
    Use `as_ducktbl()` in touchstone script (#385).

    !end-bullet!
-   !begin-bullet!
    New `as_ducktbl()`, replaces `as_duckplyr_tibble()` and
    `as_duckplyr_df()` (#383).

    !end-bullet!
-   !begin-bullet!
    New `ducktbl()` (#382).

    !end-bullet!
-   !begin-bullet!
    New `last_rel()` to retrieve the last relation object used in
    materialization (#209, #375).

    !end-bullet!
-   !begin-bullet!
    Improve `as_duckplyr_df()` error message for invalid `.data`
    (@maelle, #339).

    !end-bullet!

!end-bullets-6!

## Chore

!begin-bullets-7!

-   !begin-bullet!
    Tweak `as_ducktbl()` for dbplyr lazy tables (#395).

    !end-bullet!
-   !begin-bullet!
    Fix comment in touchstone script (#387).

    !end-bullet!
-   !begin-bullet!
    Use `as_duckplyr_df_impl()` in generated code (#384).

    !end-bullet!
-   !begin-bullet!
    Legacy duckdb script.

    !end-bullet!
-   !begin-bullet!
    Add read-only markers for overwrite + restore.

    !end-bullet!
-   !begin-bullet!
    Cleanup (#377).

    !end-bullet!
-   !begin-bullet!
    Avoid `"duckdb.materialize_message"` option (#376).

    !end-bullet!
-   !begin-bullet!
    Update TPCH outputs to account for data changes in duckdb 0.8.0
    (#294).

    !end-bullet!
-   !begin-bullet!
    Sync.

    !end-bullet!
-   !begin-bullet!
    Bump duckdb dependency.

    !end-bullet!

!end-bullets-7!

## Continuous integration

!begin-bullets-8!

-   !begin-bullet!
    Avoid failure in fledge workflow if no changes (#368).
    !end-bullet!

!end-bullets-8!

## Documentation

!begin-bullets-9!

-   !begin-bullet!
    Add link to DuckDB configuration (#174, #398).

    !end-bullet!
-   !begin-bullet!
    Fix rendering in vanilla session.

    !end-bullet!
-   !begin-bullet!
    Add vignette about missing parts (@maelle, #218, #371).

    !end-bullet!
-   !begin-bullet!
    Refactor README (@maelle, #208, #334, #370).

    !end-bullet!
-   !begin-bullet!
    Tweak method and behavior (#373).

    !end-bullet!
-   !begin-bullet!
    Add manual pages for dplyr methods (@maelle, #214, #359).

    !end-bullet!

!end-bullets-9!

## Performance

!begin-bullets-10!

-   !begin-bullet!
    Printing a duckplyr frame no longer materializes (#255, #378).

    !end-bullet!
-   !begin-bullet!
    Comparison expressions are translated in a way that allows them to
    be pushed down to Parquet (@toppyy, #270).

    !end-bullet!

!end-bullets-10!

## Testing

!begin-bullets-11!

-   !begin-bullet!
    Use `ducktbl()` in tests (#388).

    !end-bullet!
-   !begin-bullet!
    Avoid `as_duckplyr_df()` (#389).

    !end-bullet!
-   !begin-bullet!
    Skip test that requires dplyr \> 1.1.4.

    !end-bullet!
-   !begin-bullet!
    Add snapshot test for conversion error in `as_duckplyr_df()`.

    !end-bullet!

!end-bullets-11!

# duckplyr 0.4.1.9007 (2024-12-16)

## Features

!begin-bullets-12!

-   !begin-bullet!
    Use `as_duckplyr_df_impl()` in verbs (#386).

    !end-bullet!
-   !begin-bullet!
    Use `as_ducktbl()` in touchstone script (#385).

    !end-bullet!
-   !begin-bullet!
    New `as_ducktbl()`, replaces `as_duckplyr_tibble()` and
    `as_duckplyr_df()` (#383).

    !end-bullet!
-   !begin-bullet!
    New `ducktbl()` (#382).

    !end-bullet!

!end-bullets-12!

## Chore

!begin-bullets-13!

-   !begin-bullet!
    Fix comment in touchstone script (#387).

    !end-bullet!
-   !begin-bullet!
    Use `as_duckplyr_df_impl()` in generated code (#384).

    !end-bullet!
-   !begin-bullet!
    Legacy duckdb script.

    !end-bullet!

!end-bullets-13!

## Performance

!begin-bullets-14!

-   !begin-bullet!
    Printing a duckplyr frame no longer materializes (#255, #378).
    !end-bullet!

!end-bullets-14!

## Testing

!begin-bullets-15!

-   !begin-bullet!
    Use `ducktbl()` in tests (#388).

    !end-bullet!
-   !begin-bullet!
    Avoid `as_duckplyr_df()` (#389).

    !end-bullet!
-   !begin-bullet!
    Skip test that requires dplyr \> 1.1.4.

    !end-bullet!

!end-bullets-15!

# duckplyr 0.4.1.9006 (2024-12-15)

## Features

!begin-bullets-16!

-   !begin-bullet!
    New `last_rel()` to retrieve the last relation object used in
    materialization (#209, #375).

    !end-bullet!
-   !begin-bullet!
    Improve `as_duckplyr_df()` error message for invalid `.data`
    (@maelle, #339).

    !end-bullet!

!end-bullets-16!

## Chore

!begin-bullets-17!

-   !begin-bullet!
    Add read-only markers for overwrite + restore.

    !end-bullet!
-   !begin-bullet!
    Cleanup (#377).

    !end-bullet!
-   !begin-bullet!
    Avoid `"duckdb.materialize_message"` option (#376).

    !end-bullet!
-   !begin-bullet!
    Update TPCH outputs to account for data changes in duckdb 0.8.0
    (#294).

    !end-bullet!
-   !begin-bullet!
    Sync.

    !end-bullet!

!end-bullets-17!

## Documentation

!begin-bullets-18!

-   !begin-bullet!
    Fix rendering in vanilla session.

    !end-bullet!
-   !begin-bullet!
    Add vignette about missing parts (@maelle, #218, #371).

    !end-bullet!
-   !begin-bullet!
    Refactor README (@maelle, #208, #334, #370).

    !end-bullet!

!end-bullets-18!

## Performance

!begin-bullets-19!

-   !begin-bullet!
    Comparison expressions are translated in a way that allows them to
    be pushed down to Parquet (@toppyy, #270).
    !end-bullet!

!end-bullets-19!

## Testing

!begin-bullets-20!

-   !begin-bullet!
    Add snapshot test for conversion error in `as_duckplyr_df()`.
    !end-bullet!

!end-bullets-20!

# duckplyr 0.4.1.9005 (2024-12-14)

## Chore

!begin-bullets-21!

-   !begin-bullet!
    Bump duckdb dependency.
    !end-bullet!

!end-bullets-21!

## Documentation

!begin-bullets-22!

-   !begin-bullet!
    Tweak method and behavior (#373).

    !end-bullet!
-   !begin-bullet!
    Add manual pages for dplyr methods (@maelle, #214, #359).

    !end-bullet!

!end-bullets-22!

# duckplyr 0.4.1.9004 (2024-12-09)

## Bug fixes

!begin-bullets-23!

-   !begin-bullet!
    `check_duplicate_names()` (#317).

    !end-bullet!
-   !begin-bullet!
    Check perfect roundtrip for constants again (#307).

    !end-bullet!
-   !begin-bullet!
    Correctly handle missing values in `if_else()`.

    !end-bullet!
-   !begin-bullet!
    Use relational operators from the rfuns extension as aliases, not as
    macros (#291).

    !end-bullet!
-   !begin-bullet!
    Compute ptype only for join columns in a safe way without
    materialization, not for the entire data frame (#289).

    !end-bullet!
-   !begin-bullet!
    Edge case for `count()` (#282).

    !end-bullet!
-   !begin-bullet!
    Attaching duckplyr via `library()` overwrites all dplyr methods
    again (#217, #276).

    !end-bullet!
-   !begin-bullet!
    `expr_scrub()` can handle function-definitions (@toppyy, #268,
    #271).

    !end-bullet!

!end-bullets-23!

## Features

!begin-bullets-24!

-   !begin-bullet!
    `mutate()` constructs intermediate data frames for each new variable
    (#332).

    !end-bullet!
-   !begin-bullet!
    Harden telemetry code against invalid arguments (#321).

    !end-bullet!
-   !begin-bullet!
    `across()` tweaks (#318).

    !end-bullet!
-   !begin-bullet!
    Fall back to dplyr when passing `multiple` with joins (#323).

    !end-bullet!
-   !begin-bullet!
    Limit number of items that can be handled with `%in%` (#319).

    !end-bullet!
-   !begin-bullet!
    Use Ubuntu noble for touchstone (#314).

    !end-bullet!
-   !begin-bullet!
    Enable touchstone (#313).

    !end-bullet!
-   !begin-bullet!
    Use touchstone for continuous benchmarking (#311).

    !end-bullet!
-   !begin-bullet!
    More complete `across()` (#306).

    !end-bullet!
-   !begin-bullet!
    Add more tests from dplyr (#305).

    !end-bullet!
-   !begin-bullet!
    Partial support for `across()` in `mutate()` and `summarise()`
    (#296).

    !end-bullet!
-   !begin-bullet!
    Rely on duckdb to check const feasibility (#293).

    !end-bullet!
-   !begin-bullet!
    Allow R 4.0 (#285).

    !end-bullet!
-   !begin-bullet!
    Avoid resetting expression depth, now in duckdb (#280).

    !end-bullet!
-   !begin-bullet!
    Record and replay functionality now includes the top-level function
    being called (#273).

    !end-bullet!
-   !begin-bullet!
    Set the `duckdb.materialize_message` option on load only if not
    previously specified (@stefanlinner, #220).

    !end-bullet!

!end-bullets-24!

## Chore

!begin-bullets-25!

-   !begin-bullet!
    Configure IDE.

    !end-bullet!
-   !begin-bullet!
    Add lifecycle badges (#350, #353).

    !end-bullet!
-   !begin-bullet!
    Comment design choice.

    !end-bullet!
-   !begin-bullet!
    `explain()` returns the input, invisibly (#331).

    !end-bullet!
-   !begin-bullet!
    Sync (#329).

    !end-bullet!
-   !begin-bullet!
    Nicer fallback error when function cannot be translated (#324).

    !end-bullet!
-   !begin-bullet!
    Fix glue syntax.

    !end-bullet!
-   !begin-bullet!
    Tweak workflow (#316).

    !end-bullet!
-   !begin-bullet!
    Test touchstone (#315).

    !end-bullet!
-   !begin-bullet!
    Avoid copying copy.

    !end-bullet!
-   !begin-bullet!
    Sync tests with dplyr dev version (#304).

    !end-bullet!
-   !begin-bullet!
    Update snapshots.

    !end-bullet!
-   !begin-bullet!
    Fix sync (#290).

    !end-bullet!
-   !begin-bullet!
    Apply styler (#281).

    !end-bullet!
-   !begin-bullet!
    Sync patches (#277).

    !end-bullet!
-   !begin-bullet!
    Fix typo.

    !end-bullet!
-   !begin-bullet!
    Sync docs.

    !end-bullet!
-   !begin-bullet!
    Sync docs branch (#266).

    !end-bullet!

!end-bullets-25!

## Continuous integration

!begin-bullets-26!

-   !begin-bullet!
    Avoid failure in fledge workflow if no changes (#368).

    !end-bullet!
-   !begin-bullet!
    Fetch tags for fledge workflow to avoid unnecessary NEWS entries
    (#366).

    !end-bullet!
-   !begin-bullet!
    Use styler PR (#362).

    !end-bullet!
-   !begin-bullet!
    Run in Ubuntu Noble to support r-universe binaries (#352).

    !end-bullet!
-   !begin-bullet!
    Correctly detect branch protection (#345).

    !end-bullet!
-   !begin-bullet!
    Use stable pak (#344).

    !end-bullet!
-   !begin-bullet!
    Latest changes (#328).

    !end-bullet!
-   !begin-bullet!
    Revert to status workflow (#326).

    !end-bullet!
-   !begin-bullet!
    Trigger run (#288).

    !end-bullet!
-   !begin-bullet!
    Trigger run (#287).

    !end-bullet!
-   !begin-bullet!
    Updates from duckdb (#286).

    !end-bullet!
-   !begin-bullet!
    Install local package for pkgdown builds (#258).

    !end-bullet!
-   !begin-bullet!
    Fix condition for fledge workflow (#248).

    !end-bullet!
-   !begin-bullet!
    Use curl.

    !end-bullet!
-   !begin-bullet!
    Use gh to download artifact.

    !end-bullet!
-   !begin-bullet!
    Don't need to unzip artifact.

    !end-bullet!
-   !begin-bullet!
    Restrict commit again to own PRs.

    !end-bullet!

!end-bullets-26!

## Documentation

!begin-bullets-27!

-   !begin-bullet!
    Avoid `\code{}` (#340, #354).

    !end-bullet!
-   !begin-bullet!
    Include section on code generation in contributing guide (#24,
    #348).

    !end-bullet!
-   !begin-bullet!
    Update README.

    !end-bullet!
-   !begin-bullet!
    Sync.

    !end-bullet!
-   !begin-bullet!
    Sync.

    !end-bullet!
-   !begin-bullet!
    Sync.

    !end-bullet!
-   !begin-bullet!
    Move logo.

    !end-bullet!
-   !begin-bullet!
    Need file, not link, for logo on GitHub.

    !end-bullet!
-   !begin-bullet!
    Fix logo on GitHub.

    !end-bullet!
-   !begin-bullet!
    Use downlit only for GitHub README (#262).

    !end-bullet!
-   !begin-bullet!
    Add logo to README (@luisDVA, #259).

    !end-bullet!
-   !begin-bullet!
    Fix cut-and-paste typo (@joakimlinde, #240).

    !end-bullet!
-   !begin-bullet!
    Enable plausible (#250, #251).

    !end-bullet!
-   !begin-bullet!
    Use new URL for pkgdown (#247).

    !end-bullet!

!end-bullets-27!

## Testing

!begin-bullets-28!

-   !begin-bullet!
    Snapshot updates for rcc-smoke (null) (#356).

    !end-bullet!
-   !begin-bullet!
    Add snapshot instead of output (#346).

    !end-bullet!
-   !begin-bullet!
    Snapshot updates for rcc-smoke (null) (#302).

    !end-bullet!
-   !begin-bullet!
    Test telemetry code (#275).

    !end-bullet!
-   !begin-bullet!
    Adapt tests to duckdb release candidate (#261).

    !end-bullet!

!end-bullets-28!

# duckplyr 0.4.1.9003 (2024-08-20)

## Features

!begin-bullets-29!

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

!end-bullets-29!

## Continuous integration

!begin-bullets-30!

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

!end-bullets-30!

# duckplyr 0.4.1.9002 (2024-08-16)

## Documentation

!begin-bullets-31!

-   !begin-bullet!
    Move to tidyverse (#225).
    !end-bullet!

!end-bullets-31!

# duckplyr 0.4.1.9001 (2024-07-13)

!begin-bullets-32!

-   !begin-bullet!
    Merge branch 'cran-0.4.1'.
    !end-bullet!

!end-bullets-32!

# duckplyr 0.4.1.9000 (2024-07-12)

!begin-bullets-33!

-   !begin-bullet!
    Merge branch 'cran-0.4.1'.
    !end-bullet!

!end-bullets-33!

# duckplyr 0.4.1 (2024-07-11)

## Features

!begin-bullets-34!

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

!end-bullets-34!

## Documentation

!begin-bullets-35!

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

!end-bullets-35!

# duckplyr 0.4.0 (2024-05-21)

## Features

!begin-bullets-36!

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

!end-bullets-36!

## Bug fixes

!begin-bullets-37!

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

!end-bullets-37!

## Chore

!begin-bullets-38!

-   !begin-bullet!
    Remove styler dependency (#137, #138).
    !end-bullet!
-   !begin-bullet!
    Avoid error from stats collection.
    !end-bullet!

!end-bullets-38!

## Documentation

!begin-bullets-39!

-   !begin-bullet!
    Mention wildcards to read multiple files in `?df_from_file`
    (@andreranza, #133, #134).
    !end-bullet!

!end-bullets-39!

## Testing

!begin-bullets-40!

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

!end-bullets-40!

# duckplyr 0.3.2 (2024-03-17)

## Bug fixes

!begin-bullets-41!

-   !begin-bullet!
    Run autoupload in function so that it will be checked by static
    analysis (#122).
    !end-bullet!

!end-bullets-41!

## Features

!begin-bullets-42!

-   !begin-bullet!
    New `df_to_parquet()` to write to Parquet, new convenience functions
    `df_from_csv()`, `duckdb_df_from_csv()`, `df_from_parquet()` and
    `duckdb_df_from_parquet()` (#87, #89, #96, #128).
    !end-bullet!

!end-bullets-42!

# duckplyr 0.3.1 (2024-03-08)

## Bug fixes

!begin-bullets-43!

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

!end-bullets-43!

## Features

!begin-bullets-44!

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

!end-bullets-44!

## Internal

!begin-bullets-45!

-   !begin-bullet!
    Better duckdb tests.
    !end-bullet!
-   !begin-bullet!
    Use standalone purrr for dplyr compatibility.
    !end-bullet!

!end-bullets-45!

## Testing

!begin-bullets-46!

-   !begin-bullet!
    Add tests for correct base of `log()` and `log10()`.
    !end-bullet!

!end-bullets-46!

## Documentation

!begin-bullets-47!

-   !begin-bullet!
    `methods_overwrite()` and `methods_restore()` show a message.
    !end-bullet!

!end-bullets-47!

# duckplyr 0.3.0 (2023-12-10)

## Bug fixes

!begin-bullets-48!

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

!end-bullets-48!

## Features

!begin-bullets-49!

-   !begin-bullet!
    Only allow constants in `mutate()` that are actually representable
    in duckdb (#73).
    !end-bullet!
-   !begin-bullet!
    Avoid translating `ifelse()`, support `if_else()` (#79).
    !end-bullet!

!end-bullets-49!

## Documentation

!begin-bullets-50!

-   !begin-bullet!
    Separate and explain the new relational examples (@wibeasley, #84).
    !end-bullet!

!end-bullets-50!

## Testing

!begin-bullets-51!

-   !begin-bullet!
    Add test that TPC-H queries can be processed.
    !end-bullet!

!end-bullets-51!

## Chore

!begin-bullets-52!

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

!end-bullets-52!

# duckplyr 0.2.3 (2023-11-08)

## Performance

!begin-bullets-53!

-   !begin-bullet!
    Join using `IS NOT DISTINCT FROM` for faster execution
    (duckdb/duckdb-r#41, #68).
    !end-bullet!

!end-bullets-53!

## Documentation

!begin-bullets-54!

-   !begin-bullet!
    Add stability to README output (@maelle, #62, #65).
    !end-bullet!

!end-bullets-54!

# duckplyr 0.2.2 (2023-10-16)

## Bug fixes

!begin-bullets-55!

-   !begin-bullet!
    `summarise()` keeps `"duckplyr_df"` class (#63, #64).

    !end-bullet!
-   !begin-bullet!
    Fix compatibility with duckdb \>= 0.9.1.

    !end-bullet!

!end-bullets-55!

## Chore

!begin-bullets-56!

-   !begin-bullet!
    Skip tests that give different output on dev tidyselect.

    !end-bullet!
-   !begin-bullet!
    Import `utils::globalVariables()`.

    !end-bullet!

!end-bullets-56!

## Documentation

!begin-bullets-57!

-   !begin-bullet!
    Small README improvements (@maelle, #34, #57).

    !end-bullet!
-   !begin-bullet!
    Fix 301 in README.

    !end-bullet!

!end-bullets-57!

# duckplyr 0.2.1 (2023-09-16)

!begin-bullets-58!

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

!end-bullets-58!

# duckplyr 0.2.0 (2023-09-10)

!begin-bullets-59!

-   !begin-bullet!
    Implement relational API for DuckDB.
    !end-bullet!

!end-bullets-59!

# duckplyr 0.1.0 (2023-07-03)

## Bug fixes

!begin-bullets-60!

-   !begin-bullet!
    Fix examples.
    !end-bullet!

!end-bullets-60!

## Chore

!begin-bullets-61!

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

!end-bullets-61!

## Documentation

!begin-bullets-62!

-   !begin-bullet!
    Clean up reference.
    !end-bullet!

!end-bullets-62!

## Uncategorized

Initial version, exporting: - `new_relational()` to construct objects of
class `"relational"` - Generics `rel_aggregate()`, `rel_distinct()`,
`rel_filter()`, `rel_join()`, `rel_limit()`, `rel_names()`,
`rel_order()`, `rel_project()`, `rel_set_diff()`, `rel_set_intersect()`,
`rel_set_symdiff()`, `rel_to_df()`, `rel_union_all()` - `new_relexpr()`
to construct objects of class `"relational_relexpr"` - Expression
builders `relexpr_constant()`, `relexpr_function()`,
`relexpr_reference()`, `relexpr_set_alias()`, `relexpr_window()`

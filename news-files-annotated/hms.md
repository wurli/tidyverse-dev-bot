```{=html}
<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->
```
# hms 1.1.3.9011

## Bug fixes

!begin-bullets-1!

-   !begin-bullet!
    Sub-second value parsing accurately (@eitsupi, #127, #128).
    !end-bullet!

!end-bullets-1!

## Continuous integration

!begin-bullets-2!

-   !begin-bullet!
    Use larger retry count for lock-threads workflow (#152).

    !end-bullet!
-   !begin-bullet!
    Ignore errors when removing pkg-config on macOS (#142).

    !end-bullet!
-   !begin-bullet!
    Explicit permissions (#140).

    !end-bullet!
-   !begin-bullet!
    Use styler from main branch (#138).

    !end-bullet!
-   !begin-bullet!
    Need to install R on Ubuntu 24.04 (#136).

    !end-bullet!
-   !begin-bullet!
    Use Ubuntu 24.04 and styler PR (#134).

    !end-bullet!
-   !begin-bullet!
    Correctly detect branch protection (#130).

    !end-bullet!

!end-bullets-2!

## Uncategorized

!begin-bullets-3!

-   !begin-bullet!
    PLACEHOLDER https://github.com/tidyverse/hms/pull/16 (#16).
    !end-bullet!

!end-bullets-3!

# hms 1.1.3.9010

## Continuous integration

!begin-bullets-4!

-   !begin-bullet!
    Use stable pak (#129).
    !end-bullet!

!end-bullets-4!

# hms 1.1.3.9009

## Continuous integration

!begin-bullets-5!

-   !begin-bullet!
    Trigger run (#126).

    !begin-bullets-6!
    -   !begin-bullet!
        ci: Trigger run

        !end-bullet!
    -   !begin-bullet!
        ci: Latest changes

        !end-bullet!

    !end-bullets-6!
    !end-bullet!

!end-bullets-5!

# hms 1.1.3.9008

## Continuous integration

!begin-bullets-7!

-   !begin-bullet!
    Trigger run (#124).

    !end-bullet!
-   !begin-bullet!
    Use pkgdown branch (#123).

    !begin-bullets-8!
    -   !begin-bullet!
        ci: Use pkgdown branch

        !end-bullet!
    -   !begin-bullet!
        ci: Updates from duckdb

        !end-bullet!

    !end-bullets-8!
    !end-bullet!

!end-bullets-7!

# hms 1.1.3.9007

## Continuous integration

!begin-bullets-9!

-   !begin-bullet!
    Install via R CMD INSTALL ., not pak (#122).

    !begin-bullets-10!
    -   !begin-bullet!
        ci: Install via R CMD INSTALL ., not pak

        !end-bullet!
    -   !begin-bullet!
        ci: Bump version of upload-artifact action

        !end-bullet!

    !end-bullets-10!
    !end-bullet!

!end-bullets-9!

# hms 1.1.3.9006

## Chore

!begin-bullets-11!

-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/hms/actions/runs/10425483161

    !end-bullet!
-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/hms/actions/runs/10200113283

    !end-bullet!
-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/hms/actions/runs/9728444063

    !end-bullet!
-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/hms/actions/runs/9691617778

    !end-bullet!

!end-bullets-11!

## Continuous integration

!begin-bullets-12!

-   !begin-bullet!
    Install local package for pkgdown builds.

    !end-bullet!
-   !begin-bullet!
    Improve support for protected branches with fledge.

    !end-bullet!
-   !begin-bullet!
    Improve support for protected branches, without fledge.

    !end-bullet!
-   !begin-bullet!
    Sync with latest developments.

    !end-bullet!
-   !begin-bullet!
    Use v2 instead of master.

    !end-bullet!
-   !begin-bullet!
    Inline action.

    !end-bullet!
-   !begin-bullet!
    Use dev roxygen2 and decor.

    !end-bullet!
-   !begin-bullet!
    Fix on Windows, tweak lock workflow.

    !end-bullet!
-   !begin-bullet!
    Avoid checking bashisms on Windows.

    !end-bullet!
-   !begin-bullet!
    Better commit message.

    !end-bullet!
-   !begin-bullet!
    Bump versions, better default, consume custom matrix.

    !end-bullet!
-   !begin-bullet!
    Recent updates.

    !end-bullet!

!end-bullets-12!

# hms 1.1.3.9005

!begin-bullets-13!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-13!

# hms 1.1.3.9004

!begin-bullets-14!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-14!

# hms 1.1.3.9003

!begin-bullets-15!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-15!

# hms 1.1.3.9002

!begin-bullets-16!

-   !begin-bullet!
    Merged cran-1.1.3 into main.
    !end-bullet!

!end-bullets-16!

# hms 1.1.3.9001

!begin-bullets-17!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-17!

# hms 1.1.3.9000

## Bug fixes

!begin-bullets-18!

-   !begin-bullet!
    Fix method consistency, checked by R-devel.
    !end-bullet!

!end-bullets-18!

## Chore

!begin-bullets-19!

-   !begin-bullet!
    Use rlang instead of ellipsis (#106).
    !end-bullet!

!end-bullets-19!

# hms 1.1.3

## Bug fixes

!begin-bullets-20!

-   !begin-bullet!
    Fix method consistency, checked by R-devel.
    !end-bullet!

!end-bullets-20!

## Internal

!begin-bullets-21!

-   !begin-bullet!
    Use rlang instead of ellipsis (#106).
    !end-bullet!

!end-bullets-21!

# hms 1.1.2

!begin-bullets-22!

-   !begin-bullet!
    Re-rendered documentation for compatibility with R-devel.
    !end-bullet!

!end-bullets-22!

# hms 1.1.1

!begin-bullets-23!

-   !begin-bullet!
    Avoid blanket import for lifecycle package for compatibility with
    upcoming rlang.
    !end-bullet!
-   !begin-bullet!
    Establish compatibility with development version of testthat (#101,
    @lionel-).
    !end-bullet!

!end-bullets-23!

# hms 1.1.0

## Breaking changes

!begin-bullets-24!

-   !begin-bullet!
    `"hms"` objects no longer have a common type with `character` and
    `numeric`. Combining such values previously threw a warning, now
    throws an error (#94).
    !end-bullet!
-   !begin-bullet!
    `vec_cast()` and `as_hms()` throw error instead of a warning if
    input can't be parsed (#68).
    !end-bullet!

!end-bullets-24!

## Features

!begin-bullets-25!

-   !begin-bullet!
    New `unique.hms()` method (#98, @joethorley).
    !end-bullet!
-   !begin-bullet!
    `as_hms()` is a generic again (#81).
    !end-bullet!

!end-bullets-25!

## Internal

!begin-bullets-26!

-   !begin-bullet!
    Avoid `LazyData` in `DESCRIPTION`.
    !end-bullet!
-   !begin-bullet!
    Bump required versions of ellipsis and vctrs to avoid warning during
    package load.
    !end-bullet!
-   !begin-bullet!
    Using lifecycle package (#94).
    !end-bullet!

!end-bullets-26!

# hms 1.0.0

## Life cycle

!begin-bullets-27!

-   !begin-bullet!
    hms is now marked as "stable".
    !end-bullet!

!end-bullets-27!

## Breaking changes

!begin-bullets-28!

-   !begin-bullet!
    `"hms"` objects no longer have a common type with `character` and
    `numeric`. Combining such values previously threw a warning, now
    throws an error (#94).
    !end-bullet!
-   !begin-bullet!
    `vec_cast()` and `as_hms()` now throw error instead of a warning if
    input can't be parsed (#68).
    !end-bullet!

!end-bullets-28!

## Features

!begin-bullets-29!

-   !begin-bullet!
    `as_hms()` is a generic again (#81).
    !end-bullet!
-   !begin-bullet!
    `round_hms()` and `trunc_hms()` gain `digits` argument (#78,
    @hglanz).
    !end-bullet!

!end-bullets-29!

## Bug fixes

!begin-bullets-30!

-   !begin-bullet!
    `as_hms()` and `vec_cast()` now correctly treat objects of class
    `"difftime"` with `integer` mode (#84).
    !end-bullet!

!end-bullets-30!

## Internal

!begin-bullets-31!

-   !begin-bullet!
    Using lifecycle package (#94).
    !end-bullet!
-   !begin-bullet!
    hms has been re-licensed as MIT (#86).
    !end-bullet!

!end-bullets-31!

# hms 0.5.3

!begin-bullets-32!

-   !begin-bullet!
    Use `vec_default_ptype2()`, remove `vec_ptype2.hms.unspecified()`
    (#80, @romainfrancois).
    !end-bullet!
-   !begin-bullet!
    `vec_ptype2.hms.default()` forwards to `vec_default_ptype2()` for
    compatibility with vctrs 0.2.1.
    !end-bullet!
-   !begin-bullet!
    Remove `as.data.frame.hms()`, handeld by vctrs.
    !end-bullet!

!end-bullets-32!

# hms 0.5.2.9000

!begin-bullets-33!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-33!

# hms 0.5.2

!begin-bullets-34!

-   !begin-bullet!
    Work around parsing error that occurs on DST changeover dates
    (https://bugs.r-project.org/bugzilla/show_bug.cgi?id=16764).
    !end-bullet!

!end-bullets-34!

# hms 0.5.1

!begin-bullets-35!

-   !begin-bullet!
    Lossy casts from `character` vectors to `hms` now also trigger a
    warning if the cast succeeds in the first element of the vector but
    fails for other elements.
    !end-bullet!

!end-bullets-35!

# hms 0.5.0

## Breaking changes

!begin-bullets-36!

-   !begin-bullet!
    Now based on vctrs \>= 0.2.0 (#61). This adds support for
    `vec_cast()` and `vec_ptype2()`. Some operations (such as subset
    assignment) are now stricter. The `new_hms()` constructor permits
    safe construction of `hms` objects from a numeric vector.

    !end-bullet!
-   !begin-bullet!
    The new `is_hms()` deprecates the existing `is.hms()`. `as.hms()` is
    deprecated in favor of `vec_cast()` or the new `as_hms()` (which is
    just a thin wrapper around `vec_cast()`).

    !end-bullet!

!end-bullets-36!

## Printing

!begin-bullets-37!

-   !begin-bullet!
    Always show seconds in a pillar if they are different from zero
    (#54).

    !end-bullet!
-   !begin-bullet!
    Values with nonzero hours, seconds and split-seconds are now
    displayed correctly in tibbles (#56), even with a very small
    distance to the full second (#64).

    !end-bullet!

!end-bullets-37!

## Internal

!begin-bullets-38!

-   !begin-bullet!
    Don't test colored output on CRAN.
    !end-bullet!
-   !begin-bullet!
    Correct reference link on r4ds (#58, @evanhaldane).
    !end-bullet!

!end-bullets-38!

# hms 0.4.2

!begin-bullets-39!

-   !begin-bullet!
    Adapted tests to pillar 1.2.1.
    !end-bullet!

!end-bullets-39!

# hms 0.4.1

!begin-bullets-40!

-   !begin-bullet!
    Preserve `NA` when converting to `character` (#51, @jeroen).
    !end-bullet!
-   !begin-bullet!
    Adapted tests to pillar 1.1.0.
    !end-bullet!

!end-bullets-40!

# hms 0.4.0

## Breaking changes

!begin-bullets-41!

-   !begin-bullet!
    `as.hms.POSIXt()` now defaults to the current time zone, the
    previous default was `"UTC"` and can be restored by calling
    `pkgconfig::set_config("hms::default_tz", "UTC")`.
    !end-bullet!

!end-bullets-41!

## New features

!begin-bullets-42!

-   !begin-bullet!
    Pillar support, will display `hms` columns in tibbles in color on
    terminals that support it (#43).
    !end-bullet!
-   !begin-bullet!
    New `round_hms()` and `trunc_hms()` for rounding or truncating to a
    given multiple of seconds (#31).
    !end-bullet!
-   !begin-bullet!
    New `parse_hms()` and `parse_hm()` to parse strings in "HH:MM:SS"
    and "HH:MM" formats (#30).
    !end-bullet!
-   !begin-bullet!
    `as.hms.POSIXt()` gains `tz` argument, default `"UTC"` (#28).
    !end-bullet!
-   !begin-bullet!
    `as.hms.character()` and `parse_hms()` accept fractional seconds
    (#33).
    !end-bullet!

!end-bullets-42!

## Bug fixes

!begin-bullets-43!

-   !begin-bullet!
    `hms()` now works correctly if all four components (days, hours,
    minutes, seconds) are passed (#49).
    !end-bullet!
-   !begin-bullet!
    `hms()` creates a zero-length object of class `hms` that prints as
    `"hms()"`.
    !end-bullet!
-   !begin-bullet!
    `hms(integer())` and `as.hms(integer())` both work and are identical
    to `hms()`.
    !end-bullet!
-   !begin-bullet!
    Values with durations of over 10000 hours are now printed correctly
    (#48).
    !end-bullet!
-   !begin-bullet!
    `c()` now returns a hms (#41, @qgeissmann).
    !end-bullet!

!end-bullets-43!

## Documentation and error messages

!begin-bullets-44!

-   !begin-bullet!
    Fix and enhance examples in `?hms`.
    !end-bullet!
-   !begin-bullet!
    Documentation is in Markdown format now.
    !end-bullet!
-   !begin-bullet!
    Improved error message if calling `hms()` with a character argument
    (#29).
    !end-bullet!

!end-bullets-44!

# hms 0.3

!begin-bullets-45!

-   !begin-bullet!
    Fix `lubridate` test for compatibility with 1.6.0 (#23, @vspinu).
    !end-bullet!
-   !begin-bullet!
    NA values are formatted as `NA` (#22).
    !end-bullet!

!end-bullets-45!

# hms 0.2

Minor fixes and improvements.

!begin-bullets-46!

-   !begin-bullet!
    Subsetting keeps `hms` class (#16).
    !end-bullet!
-   !begin-bullet!
    `format.hms()` right-justifies the output by padding with spaces
    from the left, `as.character.hms()` remains unchanged.
    !end-bullet!
-   !begin-bullet!
    Times larger than 24 hours or with split seconds are now formatted
    correctly (#12, #13).
    !end-bullet!
-   !begin-bullet!
    Sub-second part is printed with up to six digits, for even smaller
    values trailing zeros are shown (#17).
    !end-bullet!

!end-bullets-46!

# hms 0.1

First CRAN release.

!begin-bullets-47!

-   !begin-bullet!
    Values are stored as a numeric vector that contains the number of
    seconds since midnight.
    !begin-bullets-48!
    -   !begin-bullet!
        Inherits from `difftime` class.
        !end-bullet!
    -   !begin-bullet!
        Updating units is a no-op, anything different from `"secs"`
        issues a warning.
        !end-bullet!

    !end-bullets-48!
    !end-bullet!
-   !begin-bullet!
    Supports construction from time values, coercion to and from various
    data types, and formatting.
    !begin-bullets-49!
    -   !begin-bullet!
        Conversion from numeric treats input as seconds.
        !end-bullet!
    -   !begin-bullet!
        Negative times are formatted with a leading `-`.
        !end-bullet!

    !end-bullets-49!
    !end-bullet!
-   !begin-bullet!
    Can be used as a regular column in a data frame.
    !end-bullet!
-   !begin-bullet!
    Full test coverage.
    !begin-bullets-50!
    -   !begin-bullet!
        Test for arithmetic with `Date`, `POSIXt` and `hms` classes.
        !end-bullet!
    -   !begin-bullet!
        Test basic compatibility with `lubridate` package (#5).
        !end-bullet!

    !end-bullets-50!
    !end-bullet!
-   !begin-bullet!
    Interface:
    !begin-bullets-51!
    -   !begin-bullet!
        `hms()` (with rigorous argument checks)
        !end-bullet!
    -   !begin-bullet!
        `as.hms()` for `character`, `numeric`, `POSIXct` and `POSIXlt`
        !end-bullet!
    -   !begin-bullet!
        `as.xxx.hms()` for `character`, `numeric` (implicitly),
        `POSIXct` and `POSIXlt`
        !end-bullet!
    -   !begin-bullet!
        `is.hms()`
        !end-bullet!
    -   !begin-bullet!
        `as.data.frame.hms()` (forwards to `as.data.frame.difftime()`)
        !end-bullet!
    -   !begin-bullet!
        `format.hms()`
        !end-bullet!
    -   !begin-bullet!
        `print.hms()` (returns unchanged input invisibly)
        !end-bullet!

    !end-bullets-51!
    !end-bullet!

!end-bullets-47!

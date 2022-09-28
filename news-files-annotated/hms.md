```{=html}
<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->
```
# hms 1.1.2.9000

!begin-bullets-1!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-1!

# hms 1.1.2

!begin-bullets-2!

-   !begin-bullet!
    Re-rendered documentation for compatibility with R-devel.
    !end-bullet!

!end-bullets-2!

# hms 1.1.1

!begin-bullets-3!

-   !begin-bullet!
    Avoid blanket import for lifecycle package for compatibility with
    upcoming rlang.
    !end-bullet!
-   !begin-bullet!
    Establish compatibility with development version of testthat (#101,
    @lionel-).
    !end-bullet!

!end-bullets-3!

# hms 1.1.0

## Breaking changes

!begin-bullets-4!

-   !begin-bullet!
    `"hms"` objects no longer have a common type with `character` and
    `numeric`. Combining such values previously threw a warning, now
    throws an error (#94).
    !end-bullet!
-   !begin-bullet!
    `vec_cast()` and `as_hms()` throw error instead of a warning if
    input can't be parsed (#68).
    !end-bullet!

!end-bullets-4!

## Features

!begin-bullets-5!

-   !begin-bullet!
    New `unique.hms()` method (#98, @joethorley).
    !end-bullet!
-   !begin-bullet!
    `as_hms()` is a generic again (#81).
    !end-bullet!

!end-bullets-5!

## Internal

!begin-bullets-6!

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

!end-bullets-6!

# hms 1.0.0

## Life cycle

!begin-bullets-7!

-   !begin-bullet!
    hms is now marked as "stable".
    !end-bullet!

!end-bullets-7!

## Breaking changes

!begin-bullets-8!

-   !begin-bullet!
    `"hms"` objects no longer have a common type with `character` and
    `numeric`. Combining such values previously threw a warning, now
    throws an error (#94).
    !end-bullet!
-   !begin-bullet!
    `vec_cast()` and `as_hms()` now throw error instead of a warning if
    input can't be parsed (#68).
    !end-bullet!

!end-bullets-8!

## Features

!begin-bullets-9!

-   !begin-bullet!
    `as_hms()` is a generic again (#81).
    !end-bullet!
-   !begin-bullet!
    `round_hms()` and `trunc_hms()` gain `digits` argument (#78,
    @hglanz).
    !end-bullet!

!end-bullets-9!

## Bug fixes

!begin-bullets-10!

-   !begin-bullet!
    `as_hms()` and `vec_cast()` now correctly treat objects of class
    `"difftime"` with `integer` mode (#84).
    !end-bullet!

!end-bullets-10!

## Internal

!begin-bullets-11!

-   !begin-bullet!
    Using lifecycle package (#94).
    !end-bullet!
-   !begin-bullet!
    hms has been re-licensed as MIT (#86).
    !end-bullet!

!end-bullets-11!

# hms 0.5.3

!begin-bullets-12!

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

!end-bullets-12!

# hms 0.5.2.9000

!begin-bullets-13!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-13!

# hms 0.5.2

!begin-bullets-14!

-   !begin-bullet!
    Work around parsing error that occurs on DST changeover dates
    (https://bugs.r-project.org/bugzilla/show_bug.cgi?id=16764).
    !end-bullet!

!end-bullets-14!

# hms 0.5.1

!begin-bullets-15!

-   !begin-bullet!
    Lossy casts from `character` vectors to `hms` now also trigger a
    warning if the cast succeeds in the first element of the vector but
    fails for other elements.
    !end-bullet!

!end-bullets-15!

# hms 0.5.0

## Breaking changes

!begin-bullets-16!

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

!end-bullets-16!

## Printing

!begin-bullets-17!

-   !begin-bullet!
    Always show seconds in a pillar if they are different from zero
    (#54).

    !end-bullet!
-   !begin-bullet!
    Values with nonzero hours, seconds and split-seconds are now
    displayed correctly in tibbles (#56), even with a very small
    distance to the full second (#64).

    !end-bullet!

!end-bullets-17!

## Internal

!begin-bullets-18!

-   !begin-bullet!
    Don't test colored output on CRAN.
    !end-bullet!
-   !begin-bullet!
    Correct reference link on r4ds (#58, @evanhaldane).
    !end-bullet!

!end-bullets-18!

# hms 0.4.2

!begin-bullets-19!

-   !begin-bullet!
    Adapted tests to pillar 1.2.1.
    !end-bullet!

!end-bullets-19!

# hms 0.4.1

!begin-bullets-20!

-   !begin-bullet!
    Preserve `NA` when converting to `character` (#51, @jeroen).
    !end-bullet!
-   !begin-bullet!
    Adapted tests to pillar 1.1.0.
    !end-bullet!

!end-bullets-20!

# hms 0.4.0

## Breaking changes

!begin-bullets-21!

-   !begin-bullet!
    `as.hms.POSIXt()` now defaults to the current time zone, the
    previous default was `"UTC"` and can be restored by calling
    `pkgconfig::set_config("hms::default_tz", "UTC")`.
    !end-bullet!

!end-bullets-21!

## New features

!begin-bullets-22!

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

!end-bullets-22!

## Bug fixes

!begin-bullets-23!

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

!end-bullets-23!

## Documentation and error messages

!begin-bullets-24!

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

!end-bullets-24!

# hms 0.3

!begin-bullets-25!

-   !begin-bullet!
    Fix `lubridate` test for compatibility with 1.6.0 (#23, @vspinu).
    !end-bullet!
-   !begin-bullet!
    NA values are formatted as `NA` (#22).
    !end-bullet!

!end-bullets-25!

# hms 0.2

Minor fixes and improvements.

!begin-bullets-26!

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

!end-bullets-26!

# hms 0.1

First CRAN release.

!begin-bullets-27!

-   !begin-bullet!
    Values are stored as a numeric vector that contains the number of
    seconds since midnight.
    !begin-bullets-28!
    -   !begin-bullet!
        Inherits from `difftime` class.
        !end-bullet!
    -   !begin-bullet!
        Updating units is a no-op, anything different from `"secs"`
        issues a warning.
        !end-bullet!

    !end-bullets-28!
    !end-bullet!
-   !begin-bullet!
    Supports construction from time values, coercion to and from various
    data types, and formatting.
    !begin-bullets-29!
    -   !begin-bullet!
        Conversion from numeric treats input as seconds.
        !end-bullet!
    -   !begin-bullet!
        Negative times are formatted with a leading `-`.
        !end-bullet!

    !end-bullets-29!
    !end-bullet!
-   !begin-bullet!
    Can be used as a regular column in a data frame.
    !end-bullet!
-   !begin-bullet!
    Full test coverage.
    !begin-bullets-30!
    -   !begin-bullet!
        Test for arithmetic with `Date`, `POSIXt` and `hms` classes.
        !end-bullet!
    -   !begin-bullet!
        Test basic compatibility with `lubridate` package (#5).
        !end-bullet!

    !end-bullets-30!
    !end-bullet!
-   !begin-bullet!
    Interface:
    !begin-bullets-31!
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

    !end-bullets-31!
    !end-bullet!

!end-bullets-27!

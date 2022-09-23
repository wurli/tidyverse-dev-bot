```{=html}
<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->
```
# hms 1.1.2.9000

!begin-bullets-1!

-   Internal changes only.

!end-bullets-1!

# hms 1.1.2

!begin-bullets-2!

-   Re-rendered documentation for compatibility with R-devel.

!end-bullets-2!

# hms 1.1.1

!begin-bullets-3!

-   Avoid blanket import for lifecycle package for compatibility with
    upcoming rlang.
-   Establish compatibility with development version of testthat (#101,
    @lionel-).

!end-bullets-3!

# hms 1.1.0

## Breaking changes

!begin-bullets-4!

-   `"hms"` objects no longer have a common type with `character` and
    `numeric`. Combining such values previously threw a warning, now
    throws an error (#94).
-   `vec_cast()` and `as_hms()` throw error instead of a warning if
    input can't be parsed (#68).

!end-bullets-4!

## Features

!begin-bullets-5!

-   New `unique.hms()` method (#98, @joethorley).
-   `as_hms()` is a generic again (#81).

!end-bullets-5!

## Internal

!begin-bullets-6!

-   Avoid `LazyData` in `DESCRIPTION`.
-   Bump required versions of ellipsis and vctrs to avoid warning during
    package load.
-   Using lifecycle package (#94).

!end-bullets-6!

# hms 1.0.0

## Life cycle

!begin-bullets-7!

-   hms is now marked as "stable".

!end-bullets-7!

## Breaking changes

!begin-bullets-8!

-   `"hms"` objects no longer have a common type with `character` and
    `numeric`. Combining such values previously threw a warning, now
    throws an error (#94).
-   `vec_cast()` and `as_hms()` now throw error instead of a warning if
    input can't be parsed (#68).

!end-bullets-8!

## Features

!begin-bullets-9!

-   `as_hms()` is a generic again (#81).
-   `round_hms()` and `trunc_hms()` gain `digits` argument (#78,
    @hglanz).

!end-bullets-9!

## Bug fixes

!begin-bullets-10!

-   `as_hms()` and `vec_cast()` now correctly treat objects of class
    `"difftime"` with `integer` mode (#84).

!end-bullets-10!

## Internal

!begin-bullets-11!

-   Using lifecycle package (#94).
-   hms has been re-licensed as MIT (#86).

!end-bullets-11!

# hms 0.5.3

!begin-bullets-12!

-   Use `vec_default_ptype2()`, remove `vec_ptype2.hms.unspecified()`
    (#80, @romainfrancois).
-   `vec_ptype2.hms.default()` forwards to `vec_default_ptype2()` for
    compatibility with vctrs 0.2.1.
-   Remove `as.data.frame.hms()`, handeld by vctrs.

!end-bullets-12!

# hms 0.5.2.9000

!begin-bullets-13!

-   Internal changes only.

!end-bullets-13!

# hms 0.5.2

!begin-bullets-14!

-   Work around parsing error that occurs on DST changeover dates
    (https://bugs.r-project.org/bugzilla/show_bug.cgi?id=16764).

!end-bullets-14!

# hms 0.5.1

!begin-bullets-15!

-   Lossy casts from `character` vectors to `hms` now also trigger a
    warning if the cast succeeds in the first element of the vector but
    fails for other elements.

!end-bullets-15!

# hms 0.5.0

## Breaking changes

!begin-bullets-16!

-   Now based on vctrs \>= 0.2.0 (#61). This adds support for
    `vec_cast()` and `vec_ptype2()`. Some operations (such as subset
    assignment) are now stricter. The `new_hms()` constructor permits
    safe construction of `hms` objects from a numeric vector.

-   The new `is_hms()` deprecates the existing `is.hms()`. `as.hms()` is
    deprecated in favor of `vec_cast()` or the new `as_hms()` (which is
    just a thin wrapper around `vec_cast()`).

!end-bullets-16!

## Printing

!begin-bullets-17!

-   Always show seconds in a pillar if they are different from zero
    (#54).

-   Values with nonzero hours, seconds and split-seconds are now
    displayed correctly in tibbles (#56), even with a very small
    distance to the full second (#64).

!end-bullets-17!

## Internal

!begin-bullets-18!

-   Don't test colored output on CRAN.
-   Correct reference link on r4ds (#58, @evanhaldane).

!end-bullets-18!

# hms 0.4.2

!begin-bullets-19!

-   Adapted tests to pillar 1.2.1.

!end-bullets-19!

# hms 0.4.1

!begin-bullets-20!

-   Preserve `NA` when converting to `character` (#51, @jeroen).
-   Adapted tests to pillar 1.1.0.

!end-bullets-20!

# hms 0.4.0

## Breaking changes

!begin-bullets-21!

-   `as.hms.POSIXt()` now defaults to the current time zone, the
    previous default was `"UTC"` and can be restored by calling
    `pkgconfig::set_config("hms::default_tz", "UTC")`.

!end-bullets-21!

## New features

!begin-bullets-22!

-   Pillar support, will display `hms` columns in tibbles in color on
    terminals that support it (#43).
-   New `round_hms()` and `trunc_hms()` for rounding or truncating to a
    given multiple of seconds (#31).
-   New `parse_hms()` and `parse_hm()` to parse strings in "HH:MM:SS"
    and "HH:MM" formats (#30).
-   `as.hms.POSIXt()` gains `tz` argument, default `"UTC"` (#28).
-   `as.hms.character()` and `parse_hms()` accept fractional seconds
    (#33).

!end-bullets-22!

## Bug fixes

!begin-bullets-23!

-   `hms()` now works correctly if all four components (days, hours,
    minutes, seconds) are passed (#49).
-   `hms()` creates a zero-length object of class `hms` that prints as
    `"hms()"`.
-   `hms(integer())` and `as.hms(integer())` both work and are identical
    to `hms()`.
-   Values with durations of over 10000 hours are now printed correctly
    (#48).
-   `c()` now returns a hms (#41, @qgeissmann).

!end-bullets-23!

## Documentation and error messages

!begin-bullets-24!

-   Fix and enhance examples in `?hms`.
-   Documentation is in Markdown format now.
-   Improved error message if calling `hms()` with a character argument
    (#29).

!end-bullets-24!

# hms 0.3

!begin-bullets-25!

-   Fix `lubridate` test for compatibility with 1.6.0 (#23, @vspinu).
-   NA values are formatted as `NA` (#22).

!end-bullets-25!

# hms 0.2

Minor fixes and improvements.

!begin-bullets-26!

-   Subsetting keeps `hms` class (#16).
-   `format.hms()` right-justifies the output by padding with spaces
    from the left, `as.character.hms()` remains unchanged.
-   Times larger than 24 hours or with split seconds are now formatted
    correctly (#12, #13).
-   Sub-second part is printed with up to six digits, for even smaller
    values trailing zeros are shown (#17).

!end-bullets-26!

# hms 0.1

First CRAN release.

!begin-bullets-27!

-   Values are stored as a numeric vector that contains the number of
    seconds since midnight.
    !begin-bullets-28!
    -   Inherits from `difftime` class.
    -   Updating units is a no-op, anything different from `"secs"`
        issues a warning.

    !end-bullets-28!
-   Supports construction from time values, coercion to and from various
    data types, and formatting.
    !begin-bullets-29!
    -   Conversion from numeric treats input as seconds.
    -   Negative times are formatted with a leading `-`.

    !end-bullets-29!
-   Can be used as a regular column in a data frame.
-   Full test coverage.
    !begin-bullets-30!
    -   Test for arithmetic with `Date`, `POSIXt` and `hms` classes.
    -   Test basic compatibility with `lubridate` package (#5).

    !end-bullets-30!
-   Interface:
    !begin-bullets-31!
    -   `hms()` (with rigorous argument checks)
    -   `as.hms()` for `character`, `numeric`, `POSIXct` and `POSIXlt`
    -   `as.xxx.hms()` for `character`, `numeric` (implicitly),
        `POSIXct` and `POSIXlt`
    -   `is.hms()`
    -   `as.data.frame.hms()` (forwards to `as.data.frame.difftime()`)
    -   `format.hms()`
    -   `print.hms()` (returns unchanged input invisibly)

    !end-bullets-31!

!end-bullets-27!

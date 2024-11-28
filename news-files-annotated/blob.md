```{=html}
<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->
```
# blob 1.2.4.9013 (2024-11-28)

## Continuous integration

!begin-bullets-1!

-   !begin-bullet!
    Ignore errors when removing pkg-config on macOS (#41).
    !end-bullet!

!end-bullets-1!

# blob 1.2.4.9012 (2024-11-27)

## Continuous integration

!begin-bullets-2!

-   !begin-bullet!
    Explicit permissions (#40).
    !end-bullet!

!end-bullets-2!

# blob 1.2.4.9011 (2024-11-26)

## Continuous integration

!begin-bullets-3!

-   !begin-bullet!
    Use styler from main branch (#39).
    !end-bullet!

!end-bullets-3!

# blob 1.2.4.9010 (2024-11-25)

## Continuous integration

!begin-bullets-4!

-   !begin-bullet!
    Need to install R on Ubuntu 24.04 (#38).

    !end-bullet!
-   !begin-bullet!
    Use Ubuntu 24.04 and styler PR (#36).

    !end-bullet!

!end-bullets-4!

# blob 1.2.4.9009 (2024-11-22)

## Continuous integration

!begin-bullets-5!

-   !begin-bullet!
    Correctly detect branch protection (#35).
    !end-bullet!

!end-bullets-5!

# blob 1.2.4.9008 (2024-11-18)

## Continuous integration

!begin-bullets-6!

-   !begin-bullet!
    Use stable pak (#34).
    !end-bullet!

!end-bullets-6!

# blob 1.2.4.9007 (2024-11-11)

## Continuous integration

!begin-bullets-7!

-   !begin-bullet!
    Trigger run (#33).

    !begin-bullets-8!
    -   !begin-bullet!
        ci: Trigger run

        !end-bullet!
    -   !begin-bullet!
        ci: Latest changes

        !end-bullet!

    !end-bullets-8!
    !end-bullet!

!end-bullets-7!

# blob 1.2.4.9006 (2024-10-28)

## Continuous integration

!begin-bullets-9!

-   !begin-bullet!
    Trigger run (#32).

    !end-bullet!
-   !begin-bullet!
    Use pkgdown branch (#31).

    !begin-bullets-10!
    -   !begin-bullet!
        ci: Use pkgdown branch

        !end-bullet!
    -   !begin-bullet!
        ci: Updates from duckdb

        !end-bullet!

    !end-bullets-10!
    !end-bullet!

!end-bullets-9!

# blob 1.2.4.9005 (2024-09-15)

## Continuous integration

!begin-bullets-11!

-   !begin-bullet!
    Install via R CMD INSTALL ., not pak (#30).

    !begin-bullets-12!
    -   !begin-bullet!
        ci: Install via R CMD INSTALL ., not pak

        !end-bullet!
    -   !begin-bullet!
        ci: Bump version of upload-artifact action

        !end-bullet!

    !end-bullets-12!
    !end-bullet!

!end-bullets-11!

# blob 1.2.4.9004 (2024-08-31)

## Chore

!begin-bullets-13!

-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/blob/actions/runs/10425482785

    !end-bullet!
-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/blob/actions/runs/10200111385

    !end-bullet!
-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/blob/actions/runs/9728444615

    !end-bullet!
-   !begin-bullet!
    Auto-update from GitHub Actions.

    Run: https://github.com/tidyverse/blob/actions/runs/9691616480

    !end-bullet!

!end-bullets-13!

## Continuous integration

!begin-bullets-14!

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

!end-bullets-14!

# blob 1.2.4.9003 (2023-10-09)

!begin-bullets-15!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-15!

# blob 1.2.4.9002 (2023-03-24)

!begin-bullets-16!

-   !begin-bullet!
    Merged cran-1.2.4 into main.
    !end-bullet!

!end-bullets-16!

# blob 1.2.4.9001 (2023-03-23)

!begin-bullets-17!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-17!

# blob 1.2.4.9000 (2023-03-17)

## Bug fixes

!begin-bullets-18!

-   !begin-bullet!
    Fix argument consistency between S3 generics and methods.
    !end-bullet!

!end-bullets-18!

## Chore

!begin-bullets-19!

-   !begin-bullet!
    Change maintainer e-mail.
    !end-bullet!

!end-bullets-19!

# blob 1.2.4 (2023-03-17)

## Bug fixes

!begin-bullets-20!

-   !begin-bullet!
    Fix argument consistency between S3 generics and methods.
    !end-bullet!

!end-bullets-20!

# blob 1.2.3 (2022-04-10)

!begin-bullets-21!

-   !begin-bullet!
    `as_blob(NA_character_)` returns a missing `blob` instead of
    `as_blob("NA")` (#26, @michaelchirico).
    !end-bullet!

!end-bullets-21!

# blob 1.2.2 (2021-07-23)

!begin-bullets-22!

-   !begin-bullet!
    Moved to "stable" lifecycle stage.
    !end-bullet!
-   !begin-bullet!
    Remove `is_vector_s3()` (#19).
    !end-bullet!

!end-bullets-22!

# blob 1.2.1

!begin-bullets-23!

-   !begin-bullet!
    Inline prettyunits.
    !end-bullet!
-   !begin-bullet!
    `vec_ptype2.hms.default()` forwards to `vec_default_ptype2()` for
    compatibility with vctrs 0.2.1.
    !end-bullet!

!end-bullets-23!

# blob 1.2.0

## Breaking changes

!begin-bullets-24!

-   !begin-bullet!
    The `blob` class is now based on `list_of(raw())` from the vctrs
    package (#11). This adds support for `vec_cast()` and
    `vec_ptype2()`. Some operations (such as subset assignment) are now
    stricter. The `new_blob()` constructor permits safe and fast
    construction of `blob` objects from a list, and `validate_blob()`
    checks an existing object for conformity with the rules.

    !end-bullet!
-   !begin-bullet!
    The new `is_blob()` deprecates the existing `is.blob()`. `as.blob()`
    is deprecated in favor of `vec_cast()` or the new `as_blob()` (which
    is just a thin wrapper around `vec_cast()`).

    !end-bullet!
-   !begin-bullet!
    Indexing a vector of blobs out of bounds now raises an error. Use
    `NA` as index to create a `NULL` blob.

    !end-bullet!

!end-bullets-24!

# blob 1.1.1 (2018-03-24)

!begin-bullets-25!

-   !begin-bullet!
    Now suggesting *pillar* instead of importing *tibble*, and using
    colored formatting with the *prettyunits* package with `B` instead
    of `b` as units (#7, #9).

    !end-bullet!
-   !begin-bullet!
    The blob class can now be used for S4 dispatch.

    !end-bullet!
-   !begin-bullet!
    Calling `c()` on blob objects returns a blob.

    !end-bullet!

!end-bullets-25!

# blob 1.1.0 (2017-06-17)

!begin-bullets-26!

-   !begin-bullet!
    New maintainer: Kirill Müller.

    !end-bullet!
-   !begin-bullet!
    Added `as.blob.blob()`and `as.data.frame.blob()` methods (#3).

    !end-bullet!
-   !begin-bullet!
    Size of very large blobs is displayed correctly.

    !end-bullet!

!end-bullets-26!

# blob 1.0.0

!begin-bullets-27!

-   !begin-bullet!
    Initial release.
    !end-bullet!

!end-bullets-27!

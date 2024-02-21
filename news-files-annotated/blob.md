```{=html}
<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->
```
# blob 1.2.4.9003 (2023-10-09)

!begin-bullets-1!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-1!

# blob 1.2.4.9002 (2023-03-24)

!begin-bullets-2!

-   !begin-bullet!
    Merged cran-1.2.4 into main.
    !end-bullet!

!end-bullets-2!

# blob 1.2.4.9001 (2023-03-23)

!begin-bullets-3!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-3!

# blob 1.2.4.9000 (2023-03-17)

## Bug fixes

!begin-bullets-4!

-   !begin-bullet!
    Fix argument consistency between S3 generics and methods.
    !end-bullet!

!end-bullets-4!

## Chore

!begin-bullets-5!

-   !begin-bullet!
    Change maintainer e-mail.
    !end-bullet!

!end-bullets-5!

# blob 1.2.4 (2023-03-17)

## Bug fixes

!begin-bullets-6!

-   !begin-bullet!
    Fix argument consistency between S3 generics and methods.
    !end-bullet!

!end-bullets-6!

# blob 1.2.3 (2022-04-10)

!begin-bullets-7!

-   !begin-bullet!
    `as_blob(NA_character_)` returns a missing `blob` instead of
    `as_blob("NA")` (#26, @michaelchirico).
    !end-bullet!

!end-bullets-7!

# blob 1.2.2 (2021-07-23)

!begin-bullets-8!

-   !begin-bullet!
    Moved to "stable" lifecycle stage.
    !end-bullet!
-   !begin-bullet!
    Remove `is_vector_s3()` (#19).
    !end-bullet!

!end-bullets-8!

# blob 1.2.1

!begin-bullets-9!

-   !begin-bullet!
    Inline prettyunits.
    !end-bullet!
-   !begin-bullet!
    `vec_ptype2.hms.default()` forwards to `vec_default_ptype2()` for
    compatibility with vctrs 0.2.1.
    !end-bullet!

!end-bullets-9!

# blob 1.2.0

## Breaking changes

!begin-bullets-10!

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

!end-bullets-10!

# blob 1.1.1 (2018-03-24)

!begin-bullets-11!

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

!end-bullets-11!

# blob 1.1.0 (2017-06-17)

!begin-bullets-12!

-   !begin-bullet!
    New maintainer: Kirill Müller.

    !end-bullet!
-   !begin-bullet!
    Added `as.blob.blob()`and `as.data.frame.blob()` methods (#3).

    !end-bullet!
-   !begin-bullet!
    Size of very large blobs is displayed correctly.

    !end-bullet!

!end-bullets-12!

# blob 1.0.0

!begin-bullets-13!

-   !begin-bullet!
    Initial release.
    !end-bullet!

!end-bullets-13!

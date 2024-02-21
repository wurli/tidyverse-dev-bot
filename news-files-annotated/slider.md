# slider (development version)

# slider 0.3.1

!begin-bullets-1!

-   !begin-bullet!
    Fixed tests that failed under valgrind due to `NA` vs `NaN`
    peculiarities (#198).

    !end-bullet!
-   !begin-bullet!
    Bumped required versions of vctrs, cli, and rlang to their current
    CRAN versions.

    !end-bullet!
-   !begin-bullet!
    Bumped required R version to \>= 3.6.0.

    !end-bullet!

!end-bullets-1!

# slider 0.3.0

!begin-bullets-2!

-   !begin-bullet!
    Improved reported error calls and error messages throughout the
    package, and switched from glue to cli (#168, #188).

    !end-bullet!
-   !begin-bullet!
    Index (`.i`) types that aren't explicitly understood by vctrs are
    now handled slightly better (#182).

    !end-bullet!
-   !begin-bullet!
    The `slide_index_*()` and `hop_index_*()` families now use
    `vctrs::vec_rank()` internally to compute a dense rank, which should
    be a little faster than the previous home grown approach (#177).

    !end-bullet!
-   !begin-bullet!
    New `slider_plus()` and `slider_minus()` developer facing helpers
    that allow package authors to register custom double dispatch
    methods to override the default computation of `.i - .before` and
    `.i + .after` when generating index bounds internally. This is
    intended to allow the clock and almanac packages to register methods
    so their custom types can be used natively in slider (#91).

    !end-bullet!
-   !begin-bullet!
    Removed ellipsis in favor of using the equivalent functions in rlang
    (#185).

    !end-bullet!
-   !begin-bullet!
    Removed `R_forceAndCall()` fallback now that R \>=3.4.0 is required
    (#172).

    !end-bullet!
-   !begin-bullet!
    Fixed `-Wstrict-prototypes` warnings as requested by CRAN (#173).

    !end-bullet!
-   !begin-bullet!
    Bumped minimal version of R to \>=3.4.0 to align with tidyverse
    standards.

    !end-bullet!
-   !begin-bullet!
    Bumped minimal version of rlang to \>=1.0.6 and vctrs to \>=0.5.0
    (#165, #174).

    !end-bullet!
-   !begin-bullet!
    Fixed redirecting URLs.

    !end-bullet!

!end-bullets-2!

# slider 0.2.2

!begin-bullets-3!

-   !begin-bullet!
    Updated internal usage of `vec_order()` to prepare for a breaking
    change in vctrs (#153).
    !end-bullet!

!end-bullets-3!

# slider 0.2.1

!begin-bullets-4!

-   !begin-bullet!
    Fixed a C alignment issue detected by CRAN's USBAN machine related
    to allocating vectors of `long double`.

    !end-bullet!
-   !begin-bullet!
    Fixed a test that relied too strongly on the size of the C type,
    `long double`, which can vary across platforms (#147).

    !end-bullet!
-   !begin-bullet!
    Fixed an out of sync vignette entry (#148).

    !end-bullet!

!end-bullets-4!

# slider 0.2.0

!begin-bullets-5!

-   !begin-bullet!
    New family of very fast specialized sliding functions:

    !begin-bullets-6!
    -   !begin-bullet!
        `slide_sum()`, `slide_index_sum()`: for rolling sums

        !end-bullet!
    -   !begin-bullet!
        `slide_mean()`, `slide_index_mean()`: for rolling averages

        !end-bullet!
    -   !begin-bullet!
        `slide_prod()`, `slide_index_prod()`: for rolling products

        !end-bullet!
    -   !begin-bullet!
        `slide_min()`, `slide_index_min()`: for rolling minimums

        !end-bullet!
    -   !begin-bullet!
        `slide_max()`, `slide_index_max()`: for rolling maximums

        !end-bullet!
    -   !begin-bullet!
        `slide_any()`, `slide_index_any()`: for rolling any

        !end-bullet!
    -   !begin-bullet!
        `slide_all()`, `slide_index_all()`: for rolling all

        !end-bullet!

    !end-bullets-6!
    !end-bullet!
-   !begin-bullet!
    The `slide_index_*()` family now allows `.before` and `.after` to be
    functions of 1 argument (the index) that compute the boundaries of
    the sliding window. This can be extremely useful when the default,
    which computes `.i - .before` and `.i + .after`, is not applicable
    or correct for your needs. One use case is to set
    `.before = ~.x %m-% months(1)` rather than `.before = months(1)` to
    perform a 1 month rolling window in a way that won't generate `NA`
    values on invalid dates (like 1 month before 2019-03-31) (#139).

    !end-bullet!
-   !begin-bullet!
    The `slide_index_*()` family has undergone some internal changes to
    make it more compatible with custom vctrs classes that could be
    provided as the index (`.i`), such as the date-time classes in the
    clock package (#133, #130).

    !end-bullet!
-   !begin-bullet!
    For the `slide_index_*()` family, it is now required that
    `.i - .before` and `.i + .after` be castable to `.i` by
    `vctrs::vec_cast()`. Similarly, for the `hop_index_*()` family,
    `.starts` and `.stops` must both be castable to `.i` (#132).

    !end-bullet!
-   !begin-bullet!
    New vignette, `vignette("tsibble")`, explaining how to transition
    from tsibble to slider (#128).

    !end-bullet!
-   !begin-bullet!
    `vignette("rowwise")` has been updated to use `cur_data()` from
    dplyr 1.0.0, which makes it significantly easier to do rolling
    operations on data frames (like rolling regressions) using slider in
    a dplyr pipeline.

    !end-bullet!

!end-bullets-5!

# slider 0.1.5

!begin-bullets-7!

-   !begin-bullet!
    `slide_period()` and friends have slightly better handling of size
    zero input when `.complete = TRUE` (#111).

    !end-bullet!
-   !begin-bullet!
    Better error messages for `NA` input with `.before`, `.after`,
    `.step` and `.complete` have been added (#110).

    !end-bullet!
-   !begin-bullet!
    A few instances of possibly unsafe C protection usage have been
    fixed (#112).

    !end-bullet!
-   !begin-bullet!
    Tests have been updated to use only numeric values in the
    `vctrs::new_date()` constructor (#113).

    !end-bullet!

!end-bullets-7!

# slider 0.1.4

!begin-bullets-8!

-   !begin-bullet!
    As a followup to a change in slider 0.1.3, edge cases with size zero
    input in `hop()` have also been fixed.

    !end-bullet!
-   !begin-bullet!
    C code has been refactored to be less reliant on vctrs internals.

    !end-bullet!

!end-bullets-8!

# slider 0.1.3

!begin-bullets-9!

-   !begin-bullet!
    Updated to stay compatible with vctrs 0.3.0.

    !end-bullet!
-   !begin-bullet!
    A few edge cases with size zero input in the index functions have
    been fixed.

    !end-bullet!
-   !begin-bullet!
    The default for the `.names_to` argument of `*_dfr()` variants has
    been updated to `rlang::zap()` to match the default of the function
    it is passed on to, `vctrs::vec_rbind()`.

    !end-bullet!
-   !begin-bullet!
    All `*_vec()` variants now maintain size stability when
    auto-simplifying (i.e. when `.ptype = NULL`) (#78, #93).

    !end-bullet!
-   !begin-bullet!
    `hop()` and its variants no longer place the names of `.x` on the
    output. Because there is no *size* guarantee on the output, the size
    of `.x` can be different than the size of the output, meaning that
    the names might not line up. This also affects `slide_period()`,
    which is implemented using a `hop()` variant (#75).

    !end-bullet!
-   !begin-bullet!
    With data frames containing row names, `slide()` and its variants
    now copy those row names onto the output. This is an implicit
    benefit from vctrs gaining better support for data frame row names.

    !end-bullet!

!end-bullets-9!

# slider 0.1.2

!begin-bullets-10!

-   !begin-bullet!
    Updated to stay compatible with the latest version of vctrs.
    !end-bullet!

!end-bullets-10!

# slider 0.1.1

!begin-bullets-11!

-   !begin-bullet!
    Fixed a "multiple definition" C issue when compiling with gcc10.
    !end-bullet!

!end-bullets-11!

# slider 0.1.0

!begin-bullets-12!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-12!

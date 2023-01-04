# forcats (development version)

!begin-bullets-1!

-   !begin-bullet!
    `fct_relevel()`, `fct_cross()`, and `fct_expand()` now error if you
    name the arguments in `...` since those names are ignored and your
    code probably doesn't do what you think it does (#319).

    !end-bullet!
-   !begin-bullet!
    `fct_expand()` gains an `after` argument so that you can choose
    where the new levels are placed (#138).

    !end-bullet!
-   !begin-bullet!
    `fct_infreq()` gains the ability to weight by another variable using
    the `w` argument (#261).

    !end-bullet!
-   !begin-bullet!
    `fct_inorder()` now works when not all levels appear in the data
    (#262).

    !end-bullet!
-   !begin-bullet!
    `fct_unique()` now captures implicit missing values if present
    (#293).

    !end-bullet!
-   !begin-bullet!
    `fct_other()` no longer generates a warning if no levels are
    replaced with other (#265).

    !end-bullet!

!end-bullets-1!

# forcats 0.5.2

!begin-bullets-2!

-   !begin-bullet!
    New `fct()` which works like `factor()` but errors if values of `x`
    are not included in the levels specification (#299)

    !end-bullet!
-   !begin-bullet!
    `first2()` and `last2()` now ignore missing values in both `x` and
    `y` (#303).

    !end-bullet!
-   !begin-bullet!
    Error messages are more informative.

    !end-bullet!

!end-bullets-2!

# forcats 0.5.1

!begin-bullets-3!

-   !begin-bullet!
    Re-license as MIT (#277).

    !end-bullet!
-   !begin-bullet!
    `fct_lump_n()` no longer uses a partial argument name
    (@malcolmbarrett, #276).

    !end-bullet!

!end-bullets-3!

# forcats 0.5.0

!begin-bullets-4!

-   !begin-bullet!
    `as_factor()` gains a logical method that always returns a factor
    with levels "FALSE" and "TRUE" (#185).

    !end-bullet!
-   !begin-bullet!
    `fct_c()`, `fct_collapse()` and `fct_recode()` are now explicitly
    documented as using [dynamic
    dots](https://rlang.r-lib.org/reference/dyn-dots.html) (@labouz,
    #234).

    !end-bullet!
-   !begin-bullet!
    `fct_collapse()` now accepts a `other_level` argument, to allow a
    user-specified `Other` level (@gtm19, #194). It now correctly
    collapses factors when `other_level` is not `NULL` (#172), and makes
    `"Other"` the last level (#202) (@gtm19, #172 & #202)

    !end-bullet!
-   !begin-bullet!
    `fct_count()` no longer converts implicit NAs into explicit NAs
    (#151).

    !end-bullet!
-   !begin-bullet!
    `fct_inseq()` behaves more robustly when factor levels aren't all
    numbers (#221).

    !end-bullet!
-   !begin-bullet!
    `fct_lump()` has been split up into three new functions:
    `fct_lump_prop()`, `fct_lump_n()`, and `fct_lump_lowfreq()`.
    (@jonocarroll, #167, #142). All `fct_lump_()` functions check their
    inputs more carefully (@robinson_es, #169)

    !end-bullet!
-   !begin-bullet!
    `fct_reorder2()` gains a helper function `first2()`, that sorts `.y`
    by the first value of `.x` (@jtr13).

    !end-bullet!

!end-bullets-4!

# forcats 0.4.0

## New features

!begin-bullets-5!

-   !begin-bullet!
    `fct_collapse()` gains a `group_other` argument to allow you to
    group all un-named levels into `"Other"`. (#100, @AmeliaMN)

    !end-bullet!
-   !begin-bullet!
    `fct_cross()` creates a new factor containing the combined levels
    from two or more input factors, similar to `base::interaction`
    (@tslumley, #136)

    !end-bullet!
-   !begin-bullet!
    `fct_inseq()` reorders labels in numeric order, if possible (#145,
    @kbodwin).

    !end-bullet!
-   !begin-bullet!
    `fct_lump_min()` preserves levels that appear at least `min` times
    (can also be used with the `w` weighted argument) (@robinsones,
    #142).

    !end-bullet!
-   !begin-bullet!
    `fct_match()` performs validated matching, providing a safer
    alternative to `f %in% c("x", "y")` which silently returns `FALSE`
    if `"x"` or `"y"` are not levels of `f` (e.g. because of a typo)
    (#126, @jonocarroll).

    !end-bullet!
-   !begin-bullet!
    `fct_relevel()` can now level factors using a function that is
    passed the current levels (#117).

    !end-bullet!
-   !begin-bullet!
    `as_factor()` now has a numeric method. By default, orders factors
    in numeric order, unlike the other methods which default to order of
    appearance. (#145, @kbodwin)

    !end-bullet!

!end-bullets-5!

## Minor bug fixes and improvements

!begin-bullets-6!

-   !begin-bullet!
    `fct_count()` gains a parameter to also compute the proportion
    (@zhiiiyang, #146).

    !end-bullet!
-   !begin-bullet!
    `fct_lump()` now does not change the label if no lumping occurs
    (@zhiiiyang, #130).

    !end-bullet!
-   !begin-bullet!
    `fct_relabel()` now accepts character input.

    !end-bullet!
-   !begin-bullet!
    `fct_reorder()` and `fct_reorder2()` no longer require that the
    summary function return a numeric vector of length 1; instead it can
    return any orderable vector of length 1 (#147).

    !end-bullet!
-   !begin-bullet!
    `fct_reorder()`, `fct_reorder2()` and `as_factor()` now use the
    ellipsis package to warn if you pass in named components to `...`
    (#174).

    !end-bullet!

!end-bullets-6!

# forcats 0.3.0

## API changes

!begin-bullets-7!

-   !begin-bullet!
    `fct_c()` now requires explicit splicing with `!!!` if you have a
    list of factors that you want to combine. This is consistent with an
    emerging standards for handling `...` throughout the tidyverse.

    !end-bullet!
-   !begin-bullet!
    `fct_reorder()` and `fct_reorder2()` have renamed `fun` to `.fun` to
    avoid spurious matching of named arguments.

    !end-bullet!

!end-bullets-7!

## New features

!begin-bullets-8!

-   !begin-bullet!
    All functions that take `...` use "tidy" dots: this means that you
    use can `!!!` to splice in a list of values, and trailing empty
    arguments are automatically removed. Additionally, all other
    arguments gain a `.` prefix in order to avoid unhelpful matching of
    named arguments (#110).

    !end-bullet!
-   !begin-bullet!
    `fct_lump()` gains `w` argument (#70, @wilkox) to weight value
    frequencies before lumping them together (#68).

    !end-bullet!

!end-bullets-8!

## Improvements to NA handling

!begin-bullets-9!

-   !begin-bullet!
    `as_factor()` and `fct_inorder()` accept NA levels (#98).

    !end-bullet!
-   !begin-bullet!
    `fct_explicit_na()` also replaces NAs encoded in levels.

    !end-bullet!
-   !begin-bullet!
    `fct_lump()` correctly accounts for `NA` values in input (#41)

    !end-bullet!
-   !begin-bullet!
    `lvls_revalue()` preserves NA levels.

    !end-bullet!

!end-bullets-9!

## Minor improvements and bug fixes

!begin-bullets-10!

-   !begin-bullet!
    Test coverage increased from 80% to 99%.

    !end-bullet!
-   !begin-bullet!
    `fct_drop()` now preserves attributes (#83).

    !end-bullet!
-   !begin-bullet!
    `fct_expand()` and `lvls_expand()` now also take character vectors
    (#99).

    !end-bullet!
-   !begin-bullet!
    `fct_relabel()` now accepts objects coercible to functions by
    `rlang::as_function` (#91, @alistaire47)

    !end-bullet!

!end-bullets-10!

# forcats 0.2.0

## New functions

!begin-bullets-11!

-   !begin-bullet!
    `as_factor()` which works like `as.factor()` but orders levels by
    appearance to avoid differences between locales (#39).

    !end-bullet!
-   !begin-bullet!
    `fct_other()` makes it easier to convert selected levels to "other"
    (#40)

    !end-bullet!
-   !begin-bullet!
    `fct_relabel()` allows programmatic relabeling of levels (#50,
    @krlmlr).

    !end-bullet!

!end-bullets-11!

## Minor improvements and bug fixes

!begin-bullets-12!

-   !begin-bullet!
    `fct_c()` can take either a list of factors or individual factors
    (#42).

    !end-bullet!
-   !begin-bullet!
    `fct_drop()` gains `only` argument to restrict which levels are
    dropped (#69) and no longer adds `NA` level if not present (#52).

    !end-bullet!
-   !begin-bullet!
    `fct_recode()` is now checks that each new value is of length 1
    (#56).

    !end-bullet!
-   !begin-bullet!
    `fct_relevel()` gains `after` argument so you can also move levels
    to the end (or any other position you like) (#29).

    !end-bullet!
-   !begin-bullet!
    `lvls_reorder()`, `fct_inorder()`, and `fct_infreq()` gain an
    `ordered` argument, allowing you to override the existing "ordered"
    status (#54).

    !end-bullet!

!end-bullets-12!

# forcats 0.1.1

!begin-bullets-13!

-   !begin-bullet!
    Minor fixes for R CMD check

    !end-bullet!
-   !begin-bullet!
    Add package docs

    !end-bullet!

!end-bullets-13!

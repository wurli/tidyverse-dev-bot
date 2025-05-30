# haven (development version)

# haven 2.5.5

!begin-bullets-1!

-   !begin-bullet!
    Updated ReadStat to fix stricter gcc diagnostics.
    !end-bullet!

!end-bullets-1!

# haven 2.5.4

!begin-bullets-2!

-   !begin-bullet!
    Fix for upcoming R-devel change.
    !end-bullet!

!end-bullets-2!

# haven 2.5.3

!begin-bullets-3!

-   !begin-bullet!
    Fix for upcoming R-devel change.
    !end-bullet!

!end-bullets-3!

# haven 2.5.2

!begin-bullets-4!

-   !begin-bullet!
    Updated to ReadStat 1.1.9.

    !begin-bullets-5!
    -   !begin-bullet!
        Fix various SAS catalog file reading bugs (#529, #653, #680,
        #696, #705).
        !end-bullet!
    -   !begin-bullet!
        Increase maximum SAS page file size to 16MiB (#697).
        !end-bullet!
    -   !begin-bullet!
        Ignore invalid SAV timestamp strings (#683).
        !end-bullet!
    -   !begin-bullet!
        Fix compiler warnings (#707).
        !end-bullet!

    !end-bullets-5!
    !end-bullet!
-   !begin-bullet!
    The experimental `write_sas()` function has been deprecated (#224).
    The sas7bdat file format is complex and undocumented, and as such
    writing SAS files is not officially supported by ReadStat.
    `write_xpt()` should be used instead - it produces files in the SAS
    transport format, which has limitations but will be reliably read by
    SAS.

    !end-bullet!
-   !begin-bullet!
    `write_*()` functions gain a new `adjust_tz` argument to allow more
    control over time zone conversion for date-time variables (#702).
    Thanks to @jmobrien for the detailed issue and feedback.

    Stata, SPSS and SAS do not have a concept of time zone. Since haven
    2.4.0 date-time values in non-UTC time zones are implicitly
    converted when writing to ensure the time displayed in
    Stata/SPSS/SAS will match the time displayed to the user in R (see
    #555). This is the behaviour when `adjust_tz = TRUE` (the default).
    Although this is in line with general user expectations it can cause
    issues when the time zone is important, for e.g. when looking at
    differences between time points, since the underlying numeric data
    is changed to preserve the displayed time. Use `adjust_tz = FALSE`
    to write the time as the corresponding UTC value, which will appear
    different to the user but preserves the underlying numeric data.

    !end-bullet!
-   !begin-bullet!
    `write_*()` functions previously returned the data frame with minor
    alterations made to date-time variables. These functions now
    invisibly return the original input data frame unchanged (@jmobrien,
    #702).

    !end-bullet!
-   !begin-bullet!
    Fix bug in string variable width calculation that treated `NA`
    values as width

    2.  `NA` values are now treated as blanks for width calculations
        (#699).

    !end-bullet!

!end-bullets-4!

# haven 2.5.1

!begin-bullets-6!

-   !begin-bullet!
    All `labelled()` vectors now have left-aligned column headers when
    printing in tibbles for better alignment with labels (#676).

    !end-bullet!
-   !begin-bullet!
    `write_*()` now accept functions as well as strings in the
    `.name_repair` argument in line with the documentation. Previously
    they only supported string values (#684).

    !end-bullet!
-   !begin-bullet!
    `write_sav()` variable name validation no longer treats all
    non-ASCII characters as invalid (#689).

    !end-bullet!

!end-bullets-6!

# haven 2.5.0

## New author

!begin-bullets-7!

-   !begin-bullet!
    @gorcha is now a haven author in recognition of his significant and
    sustained contributions.
    !end-bullet!

!end-bullets-7!

## File writing improvements

!begin-bullets-8!

-   !begin-bullet!
    All `write_` functions can now write custom variable widths by
    setting the `width` attribute (#650).

    !end-bullet!
-   !begin-bullet!
    When writing files, the minimum width for character variables is
    now 1. This fixes issues with statistical software reading blank
    character variables with width 0 (#650).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` now uses strL when strings are too long to be stored
    in an str# variable (#437). strL is used when strings are longer
    than 2045 characters by default, which matches Stata's behaviour,
    but this can be reduced with the `strl_threshold` argument.

    !end-bullet!
-   !begin-bullet!
    `write_xpt()` can now write dataset labels with the `label`
    argument, which defaults to the `label` attribute of the input data
    frame, if present (#562).

    !end-bullet!
-   !begin-bullet!
    `write_sav()` now checks for case-insensitive duplicate variable
    names (@juansebastianl, #641) and verifies that variable names are
    valid SPSS variables.

    !end-bullet!
-   !begin-bullet!
    The `compress` argument for `write_sav()` now supports all 3 SPSS
    compression modes specified as a character string - "byte", "none"
    and "zsav" (#614). `TRUE` and `FALSE` can be used for backwards
    compatibility, and correspond to the "zsav" and "none" options
    respectively.

    !end-bullet!
-   !begin-bullet!
    `write_sav()` successfully writes user missing values and ranges for
    `labelled()` integer vectors (#596).

    !end-bullet!
-   !begin-bullet!
    POSIXct and POSIXlt values with no time component
    (e.g. "2010-01-01") were being converted to `NA` when attempting to
    convert the output timezone to UTC. These now output successfully
    (#634).

    !end-bullet!
-   !begin-bullet!
    Fix bug in output timezone conversion that was causing variable
    labels and other variable attributes to disappear (#624).

    !end-bullet!

!end-bullets-8!

## Other improvements and fixes

!begin-bullets-9!

-   !begin-bullet!
    Updated to ReadStat 1.1.8 RC.

    !begin-bullets-10!
    -   !begin-bullet!
        Fix bug when writing formats to XPT files (#650).
        !end-bullet!
    -   !begin-bullet!
        Fix off by one error in indexing for strL variables (#437).
        !end-bullet!

    !end-bullets-10!
    !end-bullet!
-   !begin-bullet!
    `labelled()` vectors now throw a warning when combining two vectors
    with conflicting labels (#667).

    !end-bullet!
-   !begin-bullet!
    `zap_labels()` gains a `user_na` argument to control whether
    user-defined missing values are converted to `NA` or left as is
    (#638).

    !end-bullet!
-   !begin-bullet!
    vctrs casting and coercion generics now do less work when working
    with two identical `labelled()` vectors. This significantly improves
    performance when working with `labelled()` vectors in grouped data
    frames (#658).

    !end-bullet!
-   !begin-bullet!
    Errors and warnings now use `cli_abort()` and `cli_warning()`
    (#661).

    !end-bullet!

!end-bullets-9!

## Dependency changes

!begin-bullets-11!

-   !begin-bullet!
    R 3.4 is now the minimum supported version, in line with tidyverse
    policy.

    !end-bullet!
-   !begin-bullet!
    cli \>= 3.0.0 has been added to Imports to support new error
    messaging.

    !end-bullet!
-   !begin-bullet!
    lifecycle has been added to Imports, and is now used to manage
    deprecations.

    !end-bullet!

!end-bullets-11!

# haven 2.4.3

!begin-bullets-12!

-   !begin-bullet!
    Fix build failure on Solaris.
    !end-bullet!

!end-bullets-12!

# haven 2.4.2

!begin-bullets-13!

-   !begin-bullet!
    Updated to ReadStat 1.1.7 RC (#620).

    !end-bullet!
-   !begin-bullet!
    `read_dta()` no longer crashes if it sees StrL variables with
    missing values (@gorcha, #594, #600, #608).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` now correctly handles "labelled"-class numeric
    (double) variables that don't have value labels (@jmobrien, #606,
    #609).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` now allows variable names up to 32 characters (@sbae,
    #605).

    !end-bullet!
-   !begin-bullet!
    Can now correctly combine `labelled_spss()` with identical labels
    (@gorcha, #599).

    !end-bullet!

!end-bullets-13!

# haven 2.4.1

!begin-bullets-14!

-   !begin-bullet!
    Fix buglet when combining `labelled()` with identical labels.
    !end-bullet!

!end-bullets-14!

# haven 2.4.0

## New features

!begin-bullets-15!

-   !begin-bullet!
    `labelled_spss()` gains full vctrs support thanks to the hard work
    of @gorcha (#527, #534, #538, #557). This means that they should now
    work seamlessly in dplyr 1.0.0, tidyr 1.0.0 and other packages that
    use vctrs.

    !end-bullet!
-   !begin-bullet!
    `labelled()` vectors are more permissive when concatenating; output
    labels will be a combination of the left-hand and the right-hand
    side, preferring values assigned to the left-hand side (#543).

    !end-bullet!
-   !begin-bullet!
    Date-times are no longer forced to UTC, but instead converted to the
    equivalent UTC (#555). This should ensure that you see the same
    date-time in R and in Stata/SPSS/SAS.

    !end-bullet!

!end-bullets-15!

## Minor improvements and bug fixes

!begin-bullets-16!

-   !begin-bullet!
    Updated to ReadStat 1.1.5. Most importantly this includes support
    for SAS binary compression.

    !end-bullet!
-   !begin-bullet!
    `as_factor(levels = "values")` preserves values of unlabelled
    elements (#570).

    !end-bullet!
-   !begin-bullet!
    `labelled_spss()` is a little stricter: it prevents `na_range` and
    `na_value` from containing missing values, and ensures that
    `na_range` is in the correct order (#574).

    !end-bullet!
-   !begin-bullet!
    `read_spss()` now reads NA values and ranges of character variables
    (#409).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` now correctly writes tagged NAs (including tagged NAs
    in labels) (#583) and once again validates length of variables names
    (#485).

    !end-bullet!
-   !begin-bullet!
    `write_*()` now validate file and variable metadata with ReadStat.
    This should prevent many invalid files from being written (#408).
    Additionally, validation failures now provide more details about the
    source of the problem (e.g. the column name of the problem) (#463).

    !end-bullet!
-   !begin-bullet!
    `write_sav(compress = FALSE)` now uses SPSS bytecode compression
    instead of the rarely-used uncompressed mode. `compress = TRUE`
    continues to use the newer (and not universally supported, but more
    compact) zlib format (@oliverbock, #544).

    !end-bullet!

!end-bullets-16!

# haven 2.3.1

!begin-bullets-17!

-   !begin-bullet!
    Add missing methods so `median()`, `quantile()` and `summary()` work
    once more (#520).

    !end-bullet!
-   !begin-bullet!
    Add missing cast methods (#522).

    !end-bullet!

!end-bullets-17!

# haven 2.3.0

!begin-bullets-18!

-   !begin-bullet!
    `labelled()` gains the necessary support to work seemlessly in dplyr
    1.0.0, tidyr 1.0.0, and other packages that use vctrs (@mikmart,
    #496).

    !end-bullet!
-   !begin-bullet!
    `labelled()` vectors now explicitly inherit from the corresponding
    base types (e.g. integer, double, or character) (#509).

    !end-bullet!
-   !begin-bullet!
    ReadStat update, including `read_sas()` supports for "any" encoding
    (#482), and fixes for compiler warnings.

    !end-bullet!

!end-bullets-18!

# haven 2.2.0

## Partial reading

Thanks to the hard work of @mikmart, all `read_*()` functions gain three
new arguments that allow you to read in only part of a large file:

!begin-bullets-19!

-   !begin-bullet!
    `col_select`: selects columns to read with a tidyselect interface
    (#248).
    !end-bullet!
-   !begin-bullet!
    `skip`: skips rows before reading data (#370).
    !end-bullet!
-   !begin-bullet!
    `n_max`: limits the number of rows to read.
    !end-bullet!

!end-bullets-19!

This also brings with it a deprecation: `cols_only` in `read_sas()` has
been deprecated in favour of the new `col_select` argument.

## Minor improvements and bug fixes

!begin-bullets-20!

-   !begin-bullet!
    `as_factor()` allows non-unique labels when `levels = "label"`. This
    fixes a particularly annoying printing bug (#424, @gergness)

    !end-bullet!
-   !begin-bullet!
    `read_sas()` now supports (IS\|E\|B)8601(DT\|DA\|TM) date/time
    formats (@mikmart).

    !end-bullet!
-   !begin-bullet!
    All `write_` functions gain a `.name_repair` argument that controls
    what happens when the input dataset has repeated column names
    (#436).

    !end-bullet!
-   !begin-bullet!
    All `write_` functions can now write labelled vectors with `NULL`
    labels (#442).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` can now write dataset labels with the `label`
    argument, which defaults to the `label` attribute of the input data
    frame, if present (@gorcha, #449).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` works better with Stata 15, thanks to updated ReadStat
    (#461)

    !end-bullet!

!end-bullets-20!

# haven 2.1.1

!begin-bullets-21!

-   !begin-bullet!
    Fixes for R CMD check
    !end-bullet!

!end-bullets-21!

# haven 2.1.0

## Improved labelling

`labelled` objects get pretty printing that shows the labels and NA
values when inside of a `tbl_df`. Turn this behaviour off with behavior
using `option(haven.show_pillar_labels = FALSE)` (#340, @gergness).

`labelled()` and `labelled_spss()` now allow `NULL` labels. This makes
both classes more flexible, allowing you to use them for their other
attributes (#219).

`labelled()` tests that value labels are unique (@larmarange, #364)

## Minor improvements and bug fixes

!begin-bullets-22!

-   !begin-bullet!
    `as_factor()`:

    !begin-bullets-23!
    -   !begin-bullet!
        Is faster when input doesn't contain any missing values
        (@hughparsonage).
        !end-bullet!
    -   !begin-bullet!
        Added `labelled` method for backward compatbility (#414).
        !end-bullet!
    -   !begin-bullet!
        `data.frame` method now correctly passes `...` along (#407,
        @zkamvar).
        !end-bullet!

    !end-bullets-23!
    !end-bullet!
-   !begin-bullet!
    `write_dta()` now checks that the labelled values are integers, not
    the values themselves (#401).

    !end-bullet!
-   !begin-bullet!
    Updated to latest ReadStat from @evanmiller:

    !begin-bullets-24!
    -   !begin-bullet!
        `read_por()` can now read files from SPSS 25 (#412)
        !end-bullet!
    -   !begin-bullet!
        `read_por()` now uses base-30 instead of base-10 for the
        exponent (#413)
        !end-bullet!
    -   !begin-bullet!
        `read_sas()` can read zero column file (#420)
        !end-bullet!
    -   !begin-bullet!
        `read_sav()` reads long strings (#381)
        !end-bullet!
    -   !begin-bullet!
        `read_sav()` has greater memory limit allowing it to read more
        labels (#418)
        !end-bullet!
    -   !begin-bullet!
        `read_spss()` reads long variable labels (#422)
        !end-bullet!
    -   !begin-bullet!
        `write_sav()` no longer creates incorrect column names when
        \>10k columns (#410)
        !end-bullet!
    -   !begin-bullet!
        `write_sav()` no longer crashes when writing long label names
        (#395)
        !end-bullet!

    !end-bullets-24!
    !end-bullet!

!end-bullets-22!

# haven 2.0.0

## BREAKING CHANGES

!begin-bullets-25!

-   !begin-bullet!
    `labelled()` and `labelled_spss()` now produce objects with class
    "haven_labelled" and "haven_labelled_spss". Previously, the
    "labelled" class name clashed with the labelled class defined by
    Hmisc (#329).

    Unfortunately I couldn't come up with a way to fix this problem
    except to change the class name; it seems reasonable that haven
    should be the one to change names given that Hmisc has been around
    much longer. This will require some changes to packages that use
    haven, but shouldn't affect user code.

    !end-bullet!

!end-bullets-25!

## Minor improvements

!begin-bullets-26!

-   !begin-bullet!
    `labelled()` and `labelled_spss()` now support adding the `label`
    attribute to the resulting object. The `label` is a short,
    human-readable description of the object, and is now also used when
    printing, and can be easily removed using the new `zap_label()`
    function. (#362, @huftis)

    Previously, the `label` attribute was supported both when reading
    and writing SPSS files, but it was not possible to actually create
    objects in R having the `label` attribute using the constructors
    `labelled()` or `labelled_spss()`.

    !end-bullet!

!end-bullets-26!

# haven 1.1.2

!begin-bullets-27!

-   !begin-bullet!
    haven can read and write non-ASCII paths in R 3.5 (#371).

    !end-bullet!
-   !begin-bullet!
    `labelled_spss` objects preserve their attributes when subsetted
    (#360, @gergness).

    !end-bullet!
-   !begin-bullet!
    `read_sav()` gains an `encoding` argument to override the encoding
    stored in the file (#305). `read_sav()` can now read `.zsav` files
    (#338).

    !end-bullet!
-   !begin-bullet!
    `write_*()` functions now invisibly return the input data frame (as
    documented) (#349, @austensen).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` allows non-ASCII variable labels for version 14 and
    above (#383). It also uses a less strict check for integers so that
    a labelled double containing only integer values can written (#343).

    !end-bullet!
-   !begin-bullet!
    `write_sav()` produces `.zsav` files when `compress = TRUE` (#338).

    !end-bullet!
-   !begin-bullet!
    `write_xpt()` can now set the "member" name, which defaults to the
    file name san extension (#328).

    !end-bullet!
-   !begin-bullet!
    Update to latest readstat.

    !begin-bullets-28!
    -   !begin-bullet!
        Fixes out of memory error (#342)
        !end-bullet!
    -   !begin-bullet!
        Now supports reading and writing stata 15 files (#339)
        !end-bullet!
    -   !begin-bullet!
        Negative integer labelled values were tagged as missing (#367)
        !end-bullet!

    !end-bullets-28!
    !end-bullet!
-   !begin-bullet!
    Fix for when `as_factor()` with option `levels="labels"` is used on
    tagged NAs (#340, @gergness)

    !end-bullet!

!end-bullets-27!

# haven 1.1.1

!begin-bullets-29!

-   !begin-bullet!
    Update to latest readstat. Includes:

    !begin-bullets-30!
    -   !begin-bullet!
        SPSS: empty charater columns now read as character (#311)
        !end-bullet!
    -   !begin-bullet!
        SPSS: now write long strings (#266)
        !end-bullet!
    -   !begin-bullet!
        Stata: reorder labelled vectors on write (#327)
        !end-bullet!
    -   !begin-bullet!
        State: `encoding` now affects value labels (#325)
        !end-bullet!
    -   !begin-bullet!
        SAS: can now write wide/long rows (#272, #335).
        !end-bullet!
    -   !begin-bullet!
        SAS: can now handle Windows Vietnamese character set (#336)
        !end-bullet!

    !end-bullets-30!
    !end-bullet!
-   !begin-bullet!
    `read_por()` and `read_xpt()` now correctly preserve attributes if
    output needs to be reallocated (which is typical behaviour) (#313)

    !end-bullet!
-   !begin-bullet!
    `read_sas()` recognises date/times format with trailing separator
    and width specifications (#324)

    !end-bullet!
-   !begin-bullet!
    `read_sas()` gains a `catalog_encoding` argument so you can
    independently specify encoding of data and catalog (#312)

    !end-bullet!
-   !begin-bullet!
    `write_*()` correctly measures lengths of non-ASCII labels (#258):
    this fixes the cryptic error "A provided string value was longer
    than the available storage size of the specified column."

    !end-bullet!
-   !begin-bullet!
    `write_dta()` now checks for bad labels in all columns, not just the
    first (#326).

    !end-bullet!
-   !begin-bullet!
    `write_sav()` no longer fails on empty factors or factors with an
    `NA` level (#301) and writes out more metadata for `labelled_spss`
    vectors (#334).

    !end-bullet!

!end-bullets-29!

# haven 1.1.0

!begin-bullets-31!

-   !begin-bullet!
    Update to latest readstat. Includes:

    !begin-bullets-32!
    -   !begin-bullet!
        SAS: support Win baltic code page (#231)
        !end-bullet!
    -   !begin-bullet!
        SAS: better error messages instead of crashes (#234, #270)
        !end-bullet!
    -   !begin-bullet!
        SAS: fix "unable to read error" (#271)
        !end-bullet!
    -   !begin-bullet!
        SPSS: support uppercase time stamps (#230)
        !end-bullet!
    -   !begin-bullet!
        SPSS: fixes for 252-255 byte strings (#226)
        !end-bullet!
    -   !begin-bullet!
        SPSS: fixes for 0 byte strings (#245)
        !end-bullet!

    !end-bullets-32!
    !end-bullet!
-   !begin-bullet!
    Share `as_factor()` with forcats package (#256)

    !end-bullet!
-   !begin-bullet!
    `read_sav()` once again correctly returns system defined missings as
    `NA` (rather than `NaN`) (#223). `read_sav()` and `write_sav()`
    preserve SPSS's display widths (@ecortens).

    !end-bullet!
-   !begin-bullet!
    `read_sas()` gains experimental `cols_only` argument to only read in
    specified columns (#248).

    !end-bullet!
-   !begin-bullet!
    tibbles are created with `tibble::as_tibble()`, rather than by
    "hand" (#229).

    !end-bullet!
-   !begin-bullet!
    `write_sav()` checks that factors don't have levels with \>120
    characters (#262)

    !end-bullet!
-   !begin-bullet!
    `write_dta()` no longer checks that all value labels are at most 32
    characters (since this is not a restriction of dta files) (#239).

    !end-bullet!
-   !begin-bullet!
    All write methds now check that you're trying to write a data frame
    (#287).

    !end-bullet!
-   !begin-bullet!
    Add support for reading (`read_xpt()`) and writing (`write_xpt()`)
    SAS transport files.

    !end-bullet!
-   !begin-bullet!
    `write_*` functions turn ordered factors into labelled vectors
    (#285)

    !end-bullet!

!end-bullets-31!

# haven 1.0.0

!begin-bullets-33!

-   !begin-bullet!
    The ReadStat library is stored in a subdirectory of `src` (#209,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Import tibble so that tibbles are printed consistently (#154,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Update to latest ReadStat (#65). Includes:

    !begin-bullets-34!
    -   !begin-bullet!
        Support for binary (aka Ross) compression for SAS (#31).
        !end-bullet!
    -   !begin-bullet!
        Support extended ASCII encoding for Stata (#71).
        !end-bullet!
    -   !begin-bullet!
        Support for Stata 14 files (#75, #212).
        !end-bullet!
    -   !begin-bullet!
        Support for SPSS value labels with more than 8 characters
        (#157).
        !end-bullet!
    -   !begin-bullet!
        More likely to get an error when attempting to create an invalid
        output file (#171).
        !end-bullet!

    !end-bullets-34!
    !end-bullet!
-   !begin-bullet!
    Added support for reading and writing variable formats. Similarly to
    to variable labels, formats are stored as an attribute on the
    vector. Use `zap_formats()` if you want to remove these attributes.
    (@gorcha, #119, #123).

    !end-bullet!
-   !begin-bullet!
    Added support for reading file "label" and "notes". These are not
    currently printed, but are stored in the attributes if you need to
    access them (#186).

    !end-bullet!
-   !begin-bullet!
    Added support for "tagged" missing values (in Stata these are called
    "extended" and in SAS these are called "special") which carry an
    extra byte of information: a character label from "a" to "z". The
    downside of this change is that all integer columns are now
    converted to doubles, to support the encoding of the tag in the
    payload of a NaN.

    !end-bullet!
-   !begin-bullet!
    New `labelled_spss()` is a subclass of `labelled()` that can model
    user missing values from SPSS. These can either be a set of distinct
    values, or for numeric vectors, a range. `zap_labels()` strips
    labels, and replaces user-defined missing values with `NA`. New
    `zap_missing()` just replaces user-defined missing values with `NA`.

    `labelled_spss()` is potentially dangerous to work with in R because
    base functions don't know about `labelled_spss()` functions so will
    return the wrong result in the presence of user-defined missing
    values. For this reason, they will only be created by `read_spss()`
    when `user_na = TRUE` (normally user-defined missings are converted
    to NA).

    !end-bullet!
-   !begin-bullet!
    `as_factor()` no longer drops the `label` attribute (variable label)
    when used (#177, @itsdalmo).

    !end-bullet!
-   !begin-bullet!
    Using `as_factor()` with `levels = "default` or `levels = "both"`
    preserves unused labels (implicit missing) when converting (#172,
    @itsdalmo). Labels (and the resulting factor levels) are always
    sorted by values.

    !end-bullet!
-   !begin-bullet!
    `as_factor()` gains a new `levels = "default"` mechanism. This uses
    the labels where present, and otherwise uses the labels. This is now
    the default, as it seems to map better to the semantics of labelled
    values in other statistical packages (#81). You can also use
    `levels = "both"` to combine the value and the label into a single
    string (#82). It also gains a method for data frames, so you can
    easily convert every labelled column to a factor in one function
    call.

    !end-bullet!
-   !begin-bullet!
    New `vignette("semantics", package = "haven")` discusses the
    semantics of missing values and labelling in SAS, SPSS, and Stata,
    and how they are translated into R.

    !end-bullet!
-   !begin-bullet!
    Support for `hms()` has been moved into the hms package (#162). Time
    varibles now have class `c("hms", "difftime")` and a `units`
    attribute with value "secs" (#162).

    !end-bullet!
-   !begin-bullet!
    `labelled()` is less strict with its checks: you can mix double and
    integer value and labels (#86, #110, @lionel-), and `is.labelled()`
    is now exported (#124). Putting a labelled vector in a data frame
    now generates the correct column name (#193).

    !end-bullet!
-   !begin-bullet!
    `read_dta()` now recognises "%d" and custom date types (#80, #130).
    It also gains an encoding parameter which you can use to override
    the default encoding. This is particularly useful for Stata 13 and
    below which did not store the encoding used in the file (#163).

    !end-bullet!
-   !begin-bullet!
    `read_por()` now actually works (#35).

    !end-bullet!
-   !begin-bullet!
    `read_sav()` now correctly recognises EDATE and JDATE formats as
    dates (#72). Variables with format DATE, ADATE, EDATE, JDATE or
    SDATE are imported as `Date` variables instead of `POSIXct`. You can
    now set `user_na = TRUE` to preserve user defined missing values:
    they will be given class `labelled_spss`.

    !end-bullet!
-   !begin-bullet!
    `read_dta()`, `read_sas()`, and `read_sav()` have a better test for
    missing string values (#79). They can all read from connections and
    compressed files (@lionel-, #109)

    !end-bullet!
-   !begin-bullet!
    `read_sas()` gains an encoding parameter to overide the encoding
    stored in the file if it is incorrect (#176). It gets better
    argument names (#214).

    !end-bullet!
-   !begin-bullet!
    Added `type_sum()` method for labelled objects so they print nicely
    in tibbles.

    !end-bullet!
-   !begin-bullet!
    `write_dta()` now verifies that variable names are valid Stata
    variables (#132), and throws an error if you attempt to save a
    labelled vector that is not an integer (#144). You can choose which
    `version` of Stata's file format to output (#217).

    !end-bullet!
-   !begin-bullet!
    New `write_sas()` allows you to write data frames out to `sas7bdat`
    files. This is still somewhat experimental.

    !end-bullet!
-   !begin-bullet!
    `write_sav()` writes hms variables to SPSS time variables, and the
    "measure" type is set for each variable (#133).

    !end-bullet!
-   !begin-bullet!
    `write_dta()` and `write_sav()` support writing date and date/times
    (#25, #139, #145). Labelled values are always converted to UTF-8
    before being written out (#87). Infinite values are now converted to
    missing values since SPSS and Stata don't support them (#149). Both
    use a better test for missing values (#70).

    !end-bullet!
-   !begin-bullet!
    `zap_labels()` has been completely overhauled. It now works
    (@markriseley, #69), and only drops label attributes; it no longer
    replaces labelled values with `NA`s. It also gains a data frame
    method that zaps the labels from every column.

    !end-bullet!
-   !begin-bullet!
    `print.labelled()` and `print.labelled_spss()` now display the type.

    !end-bullet!

!end-bullets-33!

# haven 0.2.0

!begin-bullets-35!

-   !begin-bullet!
    fixed a bug in `as_factor.labelled`, which generated `<NA>`{=html}'s
    and wrong labels for integer labels.

    !end-bullet!
-   !begin-bullet!
    `zap_labels()` now leaves unlabelled vectors unchanged, making it
    easier to apply to all columns.

    !end-bullet!
-   !begin-bullet!
    `write_dta()` and `write_sav()` take more care to always write
    output as UTF-8 (#36)

    !end-bullet!
-   !begin-bullet!
    `write_dta()` and `write_sav()` won't crash if you give them invalid
    paths, and you can now use `~` to refer to your home directory
    (#37).

    !end-bullet!
-   !begin-bullet!
    Byte variables are now correctly read into integers (not strings,
    #45), and missing values are captured correctly (#43).

    !end-bullet!
-   !begin-bullet!
    Added `read_stata()` as alias to `read_dta()` (#52).

    !end-bullet!
-   !begin-bullet!
    `read_spss()` uses extension to automatically choose between
    `read_sav()` and `read_por()` (#53)

    !end-bullet!
-   !begin-bullet!
    Updates from ReadStat. Including fixes for various parsing bugs,
    more encodings, and better support for large files.

    !end-bullet!
-   !begin-bullet!
    hms objects deal better with missings when printing.

    !end-bullet!
-   !begin-bullet!
    Fixed bug causing labels for numeric variables to be read in as
    integers and associated error:
    `` Error: `x` and `labels` must be same type ``

    !end-bullet!

!end-bullets-35!

# haven 0.1.1

!begin-bullets-36!

-   !begin-bullet!
    Fixed memory initialisation problems found by valgrind.
    !end-bullet!

!end-bullets-36!

```{=html}
<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->
```
# pillar 1.8.1.9006

!begin-bullets-1!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-1!

# pillar 1.8.1.9005

!begin-bullets-2!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-2!

# pillar 1.8.1.9004

## Bug fixes

!begin-bullets-3!

-   !begin-bullet!
    Avoid warning with S4 character classes (tidyverse/tibble#1367,
    #625).
    !end-bullet!

!end-bullets-3!

# pillar 1.8.1.9003

## Bug fixes

!begin-bullets-4!

-   !begin-bullet!
    Show colnames() hint only when needed (tidyverse/tibble#1488, #622).
    !end-bullet!

!end-bullets-4!

# pillar 1.8.1.9002

## Features

!begin-bullets-5!

-   !begin-bullet!
    Use bullets to format details (#582, #617).

    !end-bullet!
-   !begin-bullet!
    The default for `pillar.min_title_chars` has been bumped up to 20
    characters so that title truncuation only affects very long
    variables (#582, #620).

    !end-bullet!

!end-bullets-5!

# pillar 1.8.1.9001

## Bug fixes

!begin-bullets-6!

-   !begin-bullet!
    Fix printing of very small numbers (#615, #619).
    !end-bullet!

!end-bullets-6!

## Chore

!begin-bullets-7!

-   !begin-bullet!
    Use constructors in `vec_cast()` (#587).

    !end-bullet!
-   !begin-bullet!
    Require vctrs \>= 0.5.0

    !end-bullet!

!end-bullets-7!

## Documentation

!begin-bullets-8!

-   !begin-bullet!
    Polish `?pillar_options` (#583).
    !end-bullet!

!end-bullets-8!

# pillar 1.8.1.9000

!begin-bullets-9!

-   !begin-bullet!
    Internal changes only.
    !end-bullet!

!end-bullets-9!

# pillar 1.8.1

## Features

!begin-bullets-10!

-   !begin-bullet!
    New `pillar.advice` option to turn off advice in the footer, see
    `?pillar_options`. Now off by default in non-interactive mode
    (#577).
    !end-bullet!

!end-bullets-10!

# pillar 1.8.0

## Display

!begin-bullets-11!

-   !begin-bullet!
    Column names that are abbreviated in the header gain a footnote and
    are printed in full in the footer (#483), after the extra columns
    (#548). If a column name in the header is abbreviated, all backticks
    are removed (#525). The new `"pillar.superdigit_sep"` option that
    determines the string used to separate footnote from column name in
    the footer (#553).

    !end-bullet!
-   !begin-bullet!
    The default value of the `pillar.min_title_width` option is changed
    to 5. This means that effectively the width of a pillar is decided
    only by the data. Use `options(pillar.min_title_width = 15)` to
    restore the previous default, see also `?pillar_options` for details
    (#531).

    !end-bullet!
-   !begin-bullet!
    Offer advice in the footer on how to print all columns or rows
    (#567).

    !end-bullet!
-   !begin-bullet!
    Avoid aligning `NA` inside quotes for very short character vectors
    (#562).

    !end-bullet!

!end-bullets-11!

## Features

!begin-bullets-12!

-   !begin-bullet!
    Pick up `"pillar_focus"` attribute on printing to define focus
    columns (#549).

    !end-bullet!
-   !begin-bullet!
    New `ctl_new_rowid_pillar()` generic and default method for
    customizing the appearance of row IDs (#260, #550, @nbenn).

    !end-bullet!

!end-bullets-12!

## Bug fixes

!begin-bullets-13!

-   !begin-bullet!
    Fix printing of `Surv` and `Surv2` objects (#561).

    !end-bullet!
-   !begin-bullet!
    Fix wording for corner case `max_extra_cols = 1` (#535).

    !end-bullet!
-   !begin-bullet!
    Remove excess underlines for `bit64::integer64()` data of different
    magnitude (#517, #529).

    !end-bullet!

!end-bullets-13!

## Documentation

!begin-bullets-14!

-   !begin-bullet!
    `ctl_new_pillar_list()` is documented on a separate help page
    (#516).

    !end-bullet!
-   !begin-bullet!
    Remove outdated detail in `?tbl_sum` (@IndrajeetPatil, #565).

    !end-bullet!

!end-bullets-14!

## Chore

!begin-bullets-15!

-   !begin-bullet!
    Drop crayon dependency (#559).

    !end-bullet!
-   !begin-bullet!
    Import ellipsis from rlang (#554).

    !end-bullet!
-   !begin-bullet!
    Skip test that requires lubridate if it's not installed (#505,
    @MichaelChirico).

    !end-bullet!

!end-bullets-15!

## API

!begin-bullets-16!

-   !begin-bullet!
    Soft-deprecate `colonnade()`, `squeeze()` and `extra_cols()` (#496).

    !end-bullet!
-   !begin-bullet!
    Require rlang 1.0.1 (#512).

    !end-bullet!

!end-bullets-16!

# pillar 1.7.0

## Breaking changes

!begin-bullets-17!

-   !begin-bullet!
    `colonnade()` is now soft-deprecated (#485).
    !end-bullet!
-   !begin-bullet!
    `expect_known_display()` and `is_vector_s3()` are now deprecated
    (#460, #501).
    !end-bullet!
-   !begin-bullet!
    `new_pillar()` deprecates `extra` argument (#497).
    !end-bullet!

!end-bullets-17!

## Features

!begin-bullets-18!

-   !begin-bullet!
    Focus columns specified via the `focus` argument to
    `tbl_format_setup()` are kept in their original place and shown with
    the maximum width and with the "type" component underlined (#465).
    !end-bullet!

!end-bullets-18!

## Bug fixes

!begin-bullets-19!

-   !begin-bullet!
    Update `s3_register()` to use new implementation from rlang, this
    fixes CRAN checks related to `scale_type()` (#462).
    !end-bullet!

!end-bullets-19!

## Internal

!begin-bullets-20!

-   !begin-bullet!
    Single pillars constructed with `pillar()` use only as much width as
    required when printing (#484).
    !end-bullet!

!end-bullets-20!

# pillar 1.6.5

## Breaking changes

!begin-bullets-21!

-   !begin-bullet!
    New `ctl_new_pillar_list()`, supersedes `ctl_new_compound_pillar()`
    (#433).
    !end-bullet!

!end-bullets-21!

## Features

!begin-bullets-22!

-   !begin-bullet!
    If some but not all sub-columns of a data frame or matrix column are
    shown, the names and types of the remaining columns are displayed in
    the footer (#365, #444).
    !end-bullet!
-   !begin-bullet!
    `num(fixed_exponent = ...)` is now represented with the fixed
    exponent in the pillar header, and in the title in ggplot2 (#307).
    !end-bullet!
-   !begin-bullet!
    `tbl_format_setup()` gains `focus` argument that expects a character
    vector of column names. Focus columns are moved to the front and
    separated from the main columns by a subtle vertical line (#384).
    !end-bullet!
-   !begin-bullet!
    New `scale_x_num()` and `scale_y_num()`. If a column created with
    `num()` is used in a ggplot, the x and y scale will be formatted
    automatically according to to the specification (#400, #404).
    !end-bullet!
-   !begin-bullet!
    List columns omit size information if horizontal space is
    insufficient (#392).
    !end-bullet!
-   !begin-bullet!
    If the column title of a backticked column is abbreviated, the
    trailing backtick is still printed (#391).
    !end-bullet!
-   !begin-bullet!
    `new_pillar_shaft_simple()` gains `short_formatted` argument that
    contains the data to be used if horizontal space is insufficient
    (#389).
    !end-bullet!
-   !begin-bullet!
    Default `obj_sum()` method returns abbreviation in attribute of
    return value (#390).
    !end-bullet!

!end-bullets-22!

## Bug fixes

!begin-bullets-23!

-   !begin-bullet!
    Extra columns in footer show backticks again if they are
    non-syntactic (#393).
    !end-bullet!
-   !begin-bullet!
    Fixed some cases for combinations of printed width and
    `getOption("width")` (#432).
    !end-bullet!
-   !begin-bullet!
    Fix support for `nanotime::nanotime()` classes (#378, #380).
    !end-bullet!

!end-bullets-23!

## Documentation

!begin-bullets-24!

-   !begin-bullet!
    `?num` and `?char` now point to tibble (#382).
    !end-bullet!

!end-bullets-24!

## Internal

!begin-bullets-25!

-   !begin-bullet!
    Use eager registration via `NAMESPACE` for own methods for classes
    from other packages.
    !end-bullet!
-   !begin-bullet!
    Reworked formatting routine, now using a visitor-based approach with
    in-order iteration over all pillars. The only visible changes are
    that usage of free space (in the case of limited space) has slightly
    improved (#435).
    !end-bullet!
-   !begin-bullet!
    Prepared removal of dependency on the crayon package (#233, #406).
    !end-bullet!
-   !begin-bullet!
    Use snapshot variants, requires testthat \>= 3.1.1 (#387).
    !end-bullet!
-   !begin-bullet!
    Replace internal `"pillar_vertical"` class with `glue::as_glue()`
    (#279).
    !end-bullet!

!end-bullets-25!

# pillar 1.6.4

## Bug fixes

!begin-bullets-26!

-   !begin-bullet!
    Fix printing for some tibbles where a fixed-width column is followed
    by a column with variable width (#366).
    !end-bullet!
-   !begin-bullet!
    Avoid nested backtick blocks in vignette.
    !end-bullet!

!end-bullets-26!

## Breaking changes

!begin-bullets-27!

-   !begin-bullet!
    `num()` requires an integerish `digits` argument (#362).
    !end-bullet!

!end-bullets-27!

## Documentation

!begin-bullets-28!

-   !begin-bullet!
    Link to tibble vignettes and documentation pages.
    !end-bullet!

!end-bullets-28!

# pillar 1.6.3

!begin-bullets-29!

-   !begin-bullet!
    Avoid blanket import for lifecycle package for compatibility with
    upcoming rlang (#368, @romainfrancois).
    !end-bullet!

!end-bullets-29!

# pillar 1.6.2

## Options

!begin-bullets-30!

-   !begin-bullet!
    Options `pillar.print_max`, `pillar.print_min`, `pillar.width` and
    `pillar.max_extra_cols` are now queried before the corresponding
    `tibble.` or `dplyr.` options are consulted, the latter will be
    soft-deprecated in pillar v2.0.0 (#353).
    !end-bullet!
-   !begin-bullet!
    New `pillar.bidi` option. When active, control characters are
    inserted to improve display of data with right-to-left text (#333).
    !end-bullet!
-   !begin-bullet!
    The new `pillar.max_footer_lines` option (default: 7) allows
    controlling the maximum number of footer lines shown. It is applied
    in addition to the existing `tibble.max_extra_cols` option (#263).
    !end-bullet!

!end-bullets-30!

## Formatting

!begin-bullets-31!

-   !begin-bullet!
    If a column doesn't make use of all horizontal width offered to it,
    the excess width is distributed over other columns (#331).
    !end-bullet!
-   !begin-bullet!
    Improved allocation of free space in multi-tier tables with
    `getOption("tibble.width") > getOption("width")` (#344).
    !end-bullet!
-   !begin-bullet!
    All pillars are shown with their true horizontal extent,
    irrespective of the indicated `width`. This simplifies the
    implementation of custom `pillar_shaft()` methods (#347).
    !end-bullet!

!end-bullets-31!

## Features

!begin-bullets-32!

-   !begin-bullet!
    `num()` gains `extra_sigfig` argument to automatically show more
    significant figures for numbers of the same magnitude with subtle
    differences (#97).
    !end-bullet!
-   !begin-bullet!
    `print.tbl()` and `format.tbl()` support the `max_extra_cols` and
    `max_footer_lines` arguments that override the corresponding options
    (#360).
    !end-bullet!
-   !begin-bullet!
    `print.tbl()` and `format.tbl()` maps the now deprecated `n_extra`
    argument to `max_extra_cols` for consistency (#360).
    !end-bullet!

!end-bullets-32!

## Bug fixes

!begin-bullets-33!

-   !begin-bullet!
    Avoid mangling of duplicate column names in footer (#332).
    !end-bullet!
-   !begin-bullet!
    Fix warning with zero of type `bit64::integer64()` (#319).
    !end-bullet!

!end-bullets-33!

## Documentation

!begin-bullets-34!

-   !begin-bullet!
    All package options are now documented in `?pillar_options` (#339).
    !end-bullet!
-   !begin-bullet!
    `obj_sum()` no longer calls `type_sum()` for vectors since pillar
    v1.6.1, this is now documented (#321).
    !end-bullet!
-   !begin-bullet!
    Fix documentation on usage of `vctrs::vec_proxy()` and
    `vctrs::vec_restore()` (#322).
    !end-bullet!

!end-bullets-34!

## Internal

!begin-bullets-35!

-   !begin-bullet!
    Using `attr(exact = TRUE)` everywhere.
    !end-bullet!
-   !begin-bullet!
    `is_vector_s3()` is no longer generic (#181).
    !end-bullet!
-   !begin-bullet!
    Fix internal logic around `vec_proxy()` and `vec_restore()` (#316).
    !end-bullet!

!end-bullets-35!

# pillar 1.6.1

!begin-bullets-36!

-   !begin-bullet!
    Bump required versions of ellipsis and vctrs to avoid warning during
    package load.
    !end-bullet!
-   !begin-bullet!
    `obj_sum()` no longer includes shape twice (#315).
    !end-bullet!

!end-bullets-36!

# pillar 1.6.0

## Features

!begin-bullets-37!

-   !begin-bullet!
    New `num()` and `char()` offer a flexible way to customize the
    display of numeric and character columns (#191, #84).
    !end-bullet!
-   !begin-bullet!
    New `"pillar.max_dec_width"` option (#308).
    !end-bullet!
-   !begin-bullet!
    New `format_type_sum.AsIs()` avoids the need to implement your own
    `format_type_sum()` method (#286).
    !end-bullet!
-   !begin-bullet!
    `align()` gains `space` argument to control the character used for
    filling (#285).
    !end-bullet!
-   !begin-bullet!
    Numbers in scientific and decimal notation are formatted with the
    same rules regarding significant or decimal digits (#297).
    !end-bullet!

!end-bullets-37!

## Bug fixes

!begin-bullets-38!

-   !begin-bullet!
    Load the debugme package only if the `DEBUGME` environment variable
    is set.
    !end-bullet!
-   !begin-bullet!
    More accurate detection if the decimal dot is necessary, and how
    many digits to show after the decimal dot (#298).
    !end-bullet!
-   !begin-bullet!
    Use display width instead of number of characters when truncating
    character columns.
    !end-bullet!

!end-bullets-38!

## Documentation

!begin-bullets-39!

-   !begin-bullet!
    New `vignette("numbers")` and `vignette("digits")` (#308).
    !end-bullet!

!end-bullets-39!

## Internal

!begin-bullets-40!

-   !begin-bullet!
    Compatibility with vctrs 0.3.7 (#291).
    !end-bullet!
-   !begin-bullet!
    `format.pillar_shaft_simple()` requires `"na"` attribute and no
    longer defaults to `pillar_na()` (#273).
    !end-bullet!

!end-bullets-40!

# pillar 1.5.1

## Features

!begin-bullets-41!

-   !begin-bullet!
    New `format_glimpse()` (#177).
    !end-bullet!

!end-bullets-41!

## Bug fixes

!begin-bullets-42!

-   !begin-bullet!
    Color and formatting can now be reliably turned off by setting the
    `"cli.num_colors"` option to 1 (#269).
    !end-bullet!

!end-bullets-42!

## Documentation

!begin-bullets-43!

-   !begin-bullet!
    Add examples for new functions (#264).
    !end-bullet!
-   !begin-bullet!
    Fix lifecycle badges everywhere.
    !end-bullet!

!end-bullets-43!

# pillar 1.5.0

## Breaking changes

!begin-bullets-44!

-   !begin-bullet!
    `obj_sum()` now always returns a string. `pillar_shaft.list()`
    iterates over its elements and calls `obj_sum()` for each (#137).

    !end-bullet!
-   !begin-bullet!
    Breaking: `print.pillar()` and `print.pillar_ornament()` now show
    `<pillar>` `<pillar_ornament>` in the first line (#227, #228).

    !end-bullet!
-   !begin-bullet!
    pillar has been re-licensed as MIT (#215).

    !end-bullet!

!end-bullets-44!

## Extensibility

!begin-bullets-45!

-   !begin-bullet!
    New `size_sum()` generic (#239).

    !end-bullet!
-   !begin-bullet!
    New `ctl_new_pillar()` and `ctl_new_compound_pillar()` used via
    `print.tbl()`, `format.tbl()` and `tbl_format_setup.tbl()` (#230).

    !end-bullet!
-   !begin-bullet!
    New `new_pillar()` low-level constructor (#230).

    !end-bullet!
-   !begin-bullet!
    New `new_pillar_component()` and `pillar_component()` (#230).

    !end-bullet!
-   !begin-bullet!
    New articles `vignette("extending")` and `vignette("printing")`
    (#251).

    !end-bullet!

!end-bullets-45!

## Formatting

!begin-bullets-46!

-   !begin-bullet!
    All printing code has been moved from tibble to pillar (#179),
    including `glimpse()` (#234). This concentrates the printing code in
    one package and allows for better extensibility.

    !end-bullet!
-   !begin-bullet!
    New experimental generics `tbl_format_setup()`,
    `tbl_format_header()`, `tbl_format_body()` and `tbl_format_footer()`
    (#179).

    !end-bullet!
-   !begin-bullet!
    Move definition of `tbl_sum()` to this package (#179).

    !end-bullet!
-   !begin-bullet!
    Improve formatting for `"Surv"` and `"Surv2"` classes from the
    survival package (#199).

    !end-bullet!
-   !begin-bullet!
    Vectors of the `vctrs_unspecified()` class are formatted better
    (#256).

    !end-bullet!
-   !begin-bullet!
    Arrays are now formatted by showing only their first slice (#142).

    !end-bullet!
-   !begin-bullet!
    Avoid wrapping extra column names with spaces (#254).

    !end-bullet!

!end-bullets-46!

## Internal

!begin-bullets-47!

-   !begin-bullet!
    Now using debugme to simplify understand the complex control flow,
    see `vignette("debugme")` (#248).

    !end-bullet!
-   !begin-bullet!
    New `format.pillar_ornament()` (#228).

    !end-bullet!
-   !begin-bullet!
    Using testthat 3e (#218).

    !end-bullet!
-   !begin-bullet!
    Avoid pillar.bold option in most tests (#216).

    !end-bullet!
-   !begin-bullet!
    Change internal storage format for `colonnade()` and `extra_cols()`
    (#204).

    !end-bullet!

!end-bullets-47!

# pillar 1.4.7

!begin-bullets-48!

-   !begin-bullet!
    Adapt to changed environment on CRAN's Solaris machine.
    !end-bullet!

!end-bullets-48!

# pillar 1.4.6

!begin-bullets-49!

-   !begin-bullet!
    Restore compatibility with R 3.2.
    !end-bullet!

!end-bullets-49!

# pillar 1.4.5

## Features

!begin-bullets-50!

-   !begin-bullet!
    New `pillar.min_chars` option allows controlling the minimum number
    of characters shown for a character column (#178, @statsmaths).

    !end-bullet!
-   !begin-bullet!
    `bit64::integer64()` columns are now formatted the same way as
    numeric columns (#175).

    !end-bullet!
-   !begin-bullet!
    New `align()` to support easy alignment of strings within a
    character vector (existing function exported by @davidchall, #185).

    !end-bullet!

!end-bullets-50!

## Technical

!begin-bullets-51!

-   !begin-bullet!
    `pillar_shaft()`, `format_type_sum()` and `extra_cols()` issue a
    warning if dots are unused.

    !end-bullet!
-   !begin-bullet!
    `new_pillar_title()` and `new_pillar_type()` warn if `...` is not
    empty.

    !end-bullet!

!end-bullets-51!

## Internal

!begin-bullets-52!

-   !begin-bullet!
    Use lifecycle package.

    !end-bullet!
-   !begin-bullet!
    Remove compatibility code for R \< 3.3.

    !end-bullet!

!end-bullets-52!

# pillar 1.4.4

!begin-bullets-53!

-   !begin-bullet!
    `obj_sum()` uses `vctrs::vec_size()` internally.

    !end-bullet!
-   !begin-bullet!
    `is_vector_s3.default()` is soft-deprecated and no longer used.
    Please ensure that `vctrs::vec_is()` is `TRUE` for your class.

    !end-bullet!
-   !begin-bullet!
    Rely on vctrs for type abbreviations.

    !end-bullet!

!end-bullets-53!

# pillar 1.4.3

!begin-bullets-54!

-   !begin-bullet!
    `new_pillar_shaft_simple()` gains `na` argument to control
    appearance of `NA` values.

    !end-bullet!
-   !begin-bullet!
    String columns are quoted if at least one value needs quotes (#171).

    !end-bullet!
-   !begin-bullet!
    Apply subtle style to `list_of` columns (#172).

    !end-bullet!
-   !begin-bullet!
    Fix formatting if mantissa is very close to 1 (#174).

    !end-bullet!
-   !begin-bullet!
    Use `as.character()` instead of `as_character()`.

    !end-bullet!
-   !begin-bullet!
    Remove compatibility with testthat \< 2.0.0.

    !end-bullet!

!end-bullets-54!

# pillar 1.4.2

!begin-bullets-55!

-   !begin-bullet!
    List columns are shown with their perceived dimensions, which may be
    different from those stored in the `"dim"` attribute. Regression
    introduced in 1.4.0 (#167).

    !end-bullet!
-   !begin-bullet!
    Add ellipsis to `vec_ptype_abbr()` method.

    !end-bullet!

!end-bullets-55!

# pillar 1.4.1

!begin-bullets-56!

-   !begin-bullet!
    More careful specification of minimum package versions for the
    dependencies (#165).
    !end-bullet!
-   !begin-bullet!
    Fix `type_sum.vctrs_vctr()` that also led to a NOTE in
    `R CMD check`.
    !end-bullet!
-   !begin-bullet!
    Resolve `vec_is()` at runtime instead of during `.onLoad()` (#163,
    @lionel-).
    !end-bullet!
-   !begin-bullet!
    Implement methods for vctrs objects.
    !end-bullet!

!end-bullets-56!

# pillar 1.4.0

## Breaking changes

!begin-bullets-57!

-   !begin-bullet!
    `type_sum()` forwards to `vctrs::vec_ptype_abbr()` (#134). This
    makes sure that `list_of` columns (for values of the same type) are
    properly displayed. The value returned for `factor` and `complex`
    remains unchanged, because this will change in vctrs.
    !end-bullet!
-   !begin-bullet!
    The `class` argument to `new_pillar_shaft()` deprecates the existing
    `subclass` argument. Passing a `subclass` argument leads to a
    warning once per session (#157).
    !end-bullet!

!end-bullets-57!

## Output

!begin-bullets-58!

-   !begin-bullet!
    Removed extra space for pillars with a negative value of lower
    magnitude than the largest positive value (example: -1 and 23).
    !end-bullet!
-   !begin-bullet!
    0-col tibble and matrix columns are now formatted with a capital
    containing `[,0]` and an empty shaft (#149).
    !end-bullet!

!end-bullets-58!

## Performance

!begin-bullets-59!

-   !begin-bullet!
    `squeeze()` is now faster (because the width computation in
    `pillar_shaft.numeric()` now uses more arithmetics instead of string
    concatenation). Further speedups may require implementation of
    crucial parts in C (#147).
    !end-bullet!
-   !begin-bullet!
    Styling output is faster: an expensive check for availability of
    colored output is carried out only once per call to `colonnade()`,
    and styling is implemented manually (#133, @jimhester).
    !end-bullet!

!end-bullets-59!

## Internal

!begin-bullets-60!

-   !begin-bullet!
    All internal S3 classes have the `pillar_` prefix (#156).
    !end-bullet!
-   !begin-bullet!
    Only check native output on Windows, due to subtle differences when
    running on Linux in a latin1 locale.
    !end-bullet!

!end-bullets-60!

# pillar 1.3.1

## Bug fixes

!begin-bullets-61!

-   !begin-bullet!
    Fix off-by-one error in distribution of empty space (#141).
    !end-bullet!

!end-bullets-61!

## Visible changes

!begin-bullets-62!

-   !begin-bullet!
    `NA` in names is no longer escaped with backticks.
    !end-bullet!
-   !begin-bullet!
    Don't add quotes for pillars formatted with their `format()` method
    (tidyverse/tibble#448).
    !end-bullet!

!end-bullets-62!

## Internal changes

!begin-bullets-63!

-   !begin-bullet!
    Update base type abbrevs to rlang 0.3.0 (#140, @lionel-).
    !end-bullet!
-   !begin-bullet!
    Tests work again in a 256-color terminal (#129).
    !end-bullet!

!end-bullets-63!

# pillar 1.3.0

## Visible changes

!begin-bullets-64!

-   !begin-bullet!
    Unknown data types are formatted using `format()`, not
    `as.character()` (#120).

    !end-bullet!
-   !begin-bullet!
    Multi-tier colonnades can always fill the last tier, even if the
    width isn't a proper multiple of `getOption("width")`. (Example:
    `options(width = 80, tibble.width = 200)` will print a wide tibble
    in three tiers, each 80 characters wide, with a total width of 240
    characters.)

    !end-bullet!
-   !begin-bullet!
    Fixed mixed formatting (showing some pillars with maximum, and some
    with minimum width). If a pillar's minimum width is smaller than
    `getOption("width")`, it is shown nevertheless, abbreviated with
    dots if necessary.

    !end-bullet!

!end-bullets-64!

## Interface changes

!begin-bullets-65!

-   !begin-bullet!
    `format_type_sum()` gains `width` argument (#73).
    !end-bullet!

!end-bullets-65!

## Performance improvements

!begin-bullets-66!

-   !begin-bullet!
    Printing large multi-tier colonnades is much faster, the code that
    distributes pillars over tiers uses a much simpler and much faster
    algorithm (tidyverse/tibble#422).

    !end-bullet!
-   !begin-bullet!
    Printing is now faster overall, because less work is done for
    formatting in "subtle" style (gray of a fixed level), and because
    `fansi::strip_sgr()` is used instead of `crayon::strip_style()`.

    !end-bullet!
-   !begin-bullet!
    Slightly faster printing of colonnades by reusing an intermediate
    result.

    !end-bullet!

!end-bullets-66!

## Internal

!begin-bullets-67!

-   !begin-bullet!
    `pillar()` no longer adds backticks if `title` is non-syntactic.

    !end-bullet!
-   !begin-bullet!
    `colonnade()` supports data frames and matrices. When printing, each
    sub-column is shown individually, using a title that resembles the
    syntax used to access it. Also supports recursively nested data
    frames (with data frame or matrix columns).

    !end-bullet!
-   !begin-bullet!
    Added fuzz tests for character colonnades of varying widths.

    !end-bullet!
-   !begin-bullet!
    Use `fansi::substr_ctl()` in favor of `crayon::col_substr()`.

    !end-bullet!

!end-bullets-67!

# pillar 1.2.3

!begin-bullets-68!

-   !begin-bullet!
    Eliminate CRAN check warning about undeclared withr dependency.
    !end-bullet!
-   !begin-bullet!
    More defensive test to address CRAN check failures on Solaris.
    !end-bullet!
-   !begin-bullet!
    `colonnade()` now handles pillars named `"sep"` (#115).
    !end-bullet!
-   !begin-bullet!
    `pillar_shaft.character()` gains `min_width` argument.
    !end-bullet!

!end-bullets-68!

# pillar 1.2.2

!begin-bullets-69!

-   !begin-bullet!
    Whole numbers are printed without a decimal dot again. Numbers that
    are the result of a whole number divided by a power of 10 (subject
    to a tolerance to account for floating-point imprecision) are shown
    without trailing decimal zeros, even if these zeros are significant
    according to the `pillar.sigfig` option (#105).
    !end-bullet!
-   !begin-bullet!
    New `new_pillar_title()` and `new_pillar_type()` to support
    consistent output in `glimpse()` (#31).
    !end-bullet!
-   !begin-bullet!
    New `format_type_sum()` generic that allows overriding the
    formatting of the type summary in the capital (#73).
    !end-bullet!
-   !begin-bullet!
    The `digits.secs` option is respected when computing the width for
    date-time values (#102).
    !end-bullet!

!end-bullets-69!

# pillar 1.2.1

## Display

!begin-bullets-70!

-   !begin-bullet!
    Turned off using subtle style for digits that are considered
    insignificant. Negative numbers are shown all red. Set the new
    option `pillar.subtle_num` to `TRUE` to turn it on again (default:
    `FALSE`).
    !end-bullet!
-   !begin-bullet!
    The negation sign is printed next to the number again (#91).
    !end-bullet!
-   !begin-bullet!
    Scientific notation uses regular digits again for exponents (#90).
    !end-bullet!
-   !begin-bullet!
    Groups of three digits are now underlined, starting with the fourth
    before/after the decimal point. This gives a better idea of the
    order of magnitude of the numbers (#78).
    !end-bullet!
-   !begin-bullet!
    Logical columns are displayed as `TRUE` and `FALSE` again (#95).
    !end-bullet!
-   !begin-bullet!
    The decimal dot is now always printed for numbers of type `numeric`.
    Trailing zeros are not shown anymore if all displayed numbers are
    whole numbers (#62).
    !end-bullet!
-   !begin-bullet!
    Decimal values longer than 13 characters always print in scientific
    notation.
    !end-bullet!

!end-bullets-70!

## Bug fixes

!begin-bullets-71!

-   !begin-bullet!
    Numeric values with a `"class"` attribute (e.g., `Duration` from
    lubridate) are now formatted using `format()` if the
    `pillar_shaft()` method is not implemented for that class (#88).
    !end-bullet!
-   !begin-bullet!
    Very small numbers (like `1e-310`) are now printed correctly
    (tidyverse/tibble#377).
    !end-bullet!
-   !begin-bullet!
    Fix representation of right-hand side for
    `getOption("pillar.sigfig") >= 6` (tidyverse/tibble#380).
    !end-bullet!
-   !begin-bullet!
    Fix computation of significant figures for numbers with absolute
    value \>= 1 (#98).
    !end-bullet!

!end-bullets-71!

## New functions

!begin-bullets-72!

-   !begin-bullet!
    New styling helper `style_subtle_num()`, formatting depends on the
    `pillar.subtle_num` option.
    !end-bullet!

!end-bullets-72!

# pillar 1.1.0

!begin-bullets-73!

-   !begin-bullet!
    `NA` values are now shown in plain red, without changing the
    background color (#70).
    !end-bullet!
-   !begin-bullet!
    New options to control the output, with defaults that match the
    current behavior unless stated otherwise:
    !begin-bullets-74!
    -   !begin-bullet!
        `pillar.sigfig` to control the number of significant digits, for
        highlighting and truncation (#72),
        !end-bullet!
    -   !begin-bullet!
        `pillar.subtle` to specify if insignificant digits should be
        printed in gray (#72),
        !end-bullet!
    -   !begin-bullet!
        `pillar.neg` to specify if negative digits should be printed in
        red,
        !end-bullet!
    -   !begin-bullet!
        `pillar.bold` to specify if column headers should be printed in
        bold (default: `FALSE`, #76),
        !end-bullet!
    -   !begin-bullet!
        `pillar.min_title_chars` to specify the minimum number of
        characters to display for each column name (default: 15
        characters, #75).
        !end-bullet!

    !end-bullets-74!
    !end-bullet!
-   !begin-bullet!
    Shortened abbreviations for types: complex: cplx -\> cpl, function:
    fun -\> fn, factor: fctr -\> fct (#71).
    !end-bullet!
-   !begin-bullet!
    Date columns now show sub-seconds if the `digits.secs` option is set
    (#74).
    !end-bullet!
-   !begin-bullet!
    Very wide tibbles now print faster (#85).
    !end-bullet!

!end-bullets-73!

# pillar 1.0.1

!begin-bullets-75!

-   !begin-bullet!
    Work around failing CRAN tests on Windows.
    !end-bullet!

!end-bullets-75!

# pillar 1.0.0

Initial release.

## User functions

!begin-codeblock!

    pillar(x, title = NULL, width = NULL, ...)
    colonnade(x, has_row_id = TRUE, width = NULL, ...)
    squeeze(x, width = NULL, ...)

!end-codeblock!

## Functions for implementers of data types

!begin-codeblock!

    new_pillar_shaft_simple(formatted, ..., width = NULL, align = "left", min_width = NULL, na_indent = 0L)
    new_pillar_shaft(x, ..., width, min_width = width, subclass)
    new_ornament(x, width = NULL, align = NULL)
    get_extent(x)
    get_max_extent(x)

!end-codeblock!

## Utilities

!begin-codeblock!

    dim_desc(x)
    style_na(x)
    style_neg(x)
    style_num(x, negative, significant = rep_along(x, TRUE))
    style_subtle(x)

!end-codeblock!

## Testing helper

!begin-codeblock!

    expect_known_display(object, file, ..., width = 80L, crayon = TRUE)

!end-codeblock!

## Own S3 methods

!begin-codeblock!

    pillar_shaft(x, ...) # AsIs, Date, POSIXt, character, default, list, logical, numeric
    type_sum(x) # AsIs, Date, POSIXct, data.frame, default, difftime, factor, ordered
    is_vector_s3(x) # Date, POSIXct, data.frame, default, difftime, factor, ordered
    obj_sum(x) # AsIs, POSIXlt, default, list
    extra_cols(x, ...) # squeezed_colonnade

!end-codeblock!

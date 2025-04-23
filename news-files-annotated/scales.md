# scales (development version)

!begin-bullets-1!

-   !begin-bullet!
    Range training now supports custom classes. Continuous classes
    require a `range()` method that returns numeric values. Discrete
    classes require a `levels()` method (and optionally a `droplevels()`
    method) (#480).
    !end-bullet!
-   !begin-bullet!
    New `label_glue()` labelling function for interpolated strings
    (#457).
    !end-bullet!
-   !begin-bullet!
    `fullseq()` and by extension `breaks_width()` can now deal with
    unsorted ranges (#435).
    !end-bullet!
-   !begin-bullet!
    New `label_date_short(leading)` argument to replace leading zeroes
    (#442)
    !end-bullet!
-   !begin-bullet!
    `breaks_pretty()` will return the input limit when it has no range
    (#446)
    !end-bullet!
-   !begin-bullet!
    `breaks_exp()` now provides more sensible breaks for the exponential
    transform
    !end-bullet!
-   !begin-bullet!
    `transform_exp()` now has more sensible breaks, available in
    `breaks_exp()` (@teunbrand, #405).
    !end-bullet!
-   !begin-bullet!
    The scales package now keeps track of known palettes. These can be
    retrieved using `get_palette()` or registered using `set_palette()`
    (#396).
    !end-bullet!
-   !begin-bullet!
    `label_log()` has a `signed` argument for displaying negative
    numbers (@teunbrand, #421).
    !end-bullet!
-   !begin-bullet!
    New `label_dictionary()` for named lookup of labels (#458).
    !end-bullet!
-   !begin-bullet!
    New function `compose_label()` to chain together label formatting
    functions (#462)
    !end-bullet!
-   !begin-bullet!
    Palette function now have classes, attributes and coercion methods
    (@teunbrand, #426).
    !end-bullet!
-   !begin-bullet!
    Added colour manipulation functions: `col_shift()`,
    `col_saturate()`, `col_darker()`, `col_lighter()` and `col_mix()`
    (@teunbrand, #423)
    !end-bullet!
-   !begin-bullet!
    `label_date_short()` gains `tz` and `locale` argument (#478)
    !end-bullet!

!end-bullets-1!

# scales 1.3.0

## Better type support

!begin-bullets-2!

-   !begin-bullet!
    `rescale(I(x), ...)` and `rescale_mid(I(x), ...)` return `I(x)`
    unaltered (@teunbrand, #403).
    !end-bullet!
-   !begin-bullet!
    Add a rescale method for `difftime` objects (#382)
    !end-bullet!
-   !begin-bullet!
    Add better support for `difftime` objects. `label_timespan()` adds
    functionality for adding correct unit suffix to timespan data,
    `breaks_timespan()` adds functionality for finding pleasant
    breakpoints across the various bases in time units, while
    `transform_timespan()` wraps it all together and provides an
    alternative to `transform_hms()` (#212)
    !end-bullet!

!end-bullets-2!

## Ranges

!begin-bullets-3!

-   !begin-bullet!
    `train_continuous()` coerces `new` to numeric before calculating
    range (@teunbrand, #369).
    !end-bullet!
-   !begin-bullet!
    Training on factor data no longer sorts the range after multiple
    training passes if the new `fct` argument of `train_discrete()` is
    used (#383)
    !end-bullet!
-   !begin-bullet!
    The `DiscreteRange` class now keeps track on whether it has been
    trained on factor data.
    !end-bullet!
-   !begin-bullet!
    Attempt to make the sort behavior of the range consistent for
    character vectors during training. Mixing of character and factor
    data will make the factor level order take precedence no matter if
    the training starts with a charactor vector
    !end-bullet!

!end-bullets-3!

## Transformations

!begin-bullets-4!

-   !begin-bullet!
    Transformation function have been renamed to `transform_*`-prefixed
    names instead of `*_trans`-suffixed names. This allows for a better
    tab-completion search of transformations. The S3 class of
    transformations has been renamed from `"trans"` to `"transform"`.
    `new_transform()` replaces `trans_new()` and `trim_to_domain()`
    replaces `trans_range()`. All old functions are kept for posterity.
    !end-bullet!
-   !begin-bullet!
    `transform_sqrt()` no longer returns an inverse for values outside
    of its domain (#214)
    !end-bullet!
-   !begin-bullet!
    Add an inverse (area) hyperbolic sine transformation
    `transform_asinh()`, which provides a logarithm-like transformation
    of a space, but which accommodates negative values (#297)
    !end-bullet!
-   !begin-bullet!
    Correct the domain calculation for `transform_compose()` (@mjskay,
    #408).
    !end-bullet!
-   !begin-bullet!
    Transformation objects can optionally include the derivatives of the
    transform and the inverse transform (@mjskay, #322).
    !end-bullet!

!end-bullets-4!

## Misc

!begin-bullets-5!

-   !begin-bullet!
    The `scale_cut` argument in `number()` now works as advertised for
    values below the lowest cut value (#346)
    !end-bullet!
-   !begin-bullet!
    `scale_cut` will now choose a more appropriate cut in the case of
    the first cut creating an irrational-ish number.
    !end-bullet!
-   !begin-bullet!
    Added a new option to the `style_positive` argument in `label_*()`
    functions. Setting this to `"space"` will add a figure space in
    front of the number to make it easier to align positive and negative
    values as figure space takes up the same amount of space as `-`
    (#366)
    !end-bullet!
-   !begin-bullet!
    `label_dollar()` has been superseeded by `label_currency()` for
    clarity (#344)
    !end-bullet!
-   !begin-bullet!
    Palette functions now have the `pal_`-prefix. The old
    `_pal`-suffixed versions are kept for backward compatibility.
    !end-bullet!

!end-bullets-5!

# scales 1.2.1

!begin-bullets-6!

-   !begin-bullet!
    Re-document to fix HTML issues in `.Rd`.
    !end-bullet!

!end-bullets-6!

# scales 1.2.0

## New features

!begin-bullets-7!

-   !begin-bullet!
    `label_number()`:

    !begin-bullets-8!
    -   !begin-bullet!
        New `style_positive` and `style_negative` argument control how
        positive and negative numbers are styled (#249, #262).

        !end-bullet!
    -   !begin-bullet!
        The `prefix` comes after the negative sign, rather than before
        it, yielding (e.g) the correct `-$1` instead of `$-1`.

        !end-bullet!
    -   !begin-bullet!
        New `scale_cut` argument enables independent scaling of
        different parts of the range. This is useful in `label_dollar()`
        to support scaling of large numbers by suffix (e.g. "M" for
        million, "B" for billion). It can be used with
        `cut_short_scale()` when billion = thousand million and
        `cut_long_scale()` when billion = million million (initial
        implementation provided by @davidchall). Additionally, the
        accuracy is now computed per scale category, so rescaled values
        can have different numbers of decimal places (#339).

        !end-bullet!
    -   !begin-bullet!
        `label_number_si()` is deprecated because it previously used
        short scale abbreviations instead of the correct SI prefixes.
        You can mimic the previous results with
        `label_number(scale_cut = cut_scale_short())` or get real SI
        labels with `label_number(scale_cut = cut_SI("m"))` (#339, with
        help from @davidchall).

        !end-bullet!

    !end-bullets-8!
    !end-bullet!
-   !begin-bullet!
    `label_bytes()` now correctly accounts for the `scale` argument when
    choosing auto units (@davidchall, #235).

    !end-bullet!
-   !begin-bullet!
    `label_date()` and `label_time()` gain a `locale` argument that
    allows you to set the locale used to generate day and month names
    (#309).

    !end-bullet!
-   !begin-bullet!
    New `label_log()` displays the base and a superscript exponent, for
    use with logarithmic axes (@davidchall, #312).

    !end-bullet!
-   !begin-bullet!
    New `compose_trans()` allows arbitrary composition of transformers.
    This is mostly easily achieved by passing a character vector
    whenever you might previously have passed the name of a single
    transformer. For example,
    `scale_y_continuous(trans = c("log10", "reverse"))` will create a
    reverse log-10 scale (#287).

    !end-bullet!

!end-bullets-7!

## Bug fixes and minor improvements

!begin-bullets-9!

-   !begin-bullet!
    `breaks_width()` now supports units like `"3 months"` in the
    `offset` argument.

    !end-bullet!
-   !begin-bullet!
    `col_quantile()` no longer errors if data is sufficiently skewed
    that we can't generate the requested number of unique colours
    (#294).

    !end-bullet!
-   !begin-bullet!
    `dollar(negative_parens)` is deprecated in favour of
    `style_negative = "parens"`.

    !end-bullet!
-   !begin-bullet!
    `hue_pal()` respects `h.start` once again (#288).

    !end-bullet!
-   !begin-bullet!
    `label_number_auto()` correctly formats single numbers that are
    greater than 1e+06 without an error (@karawoo, #321)

    !end-bullet!
-   !begin-bullet!
    `manual_pal()` now always returns an unnamed colour vector, which is
    easy to use with `ggplot2::discrete_scale()` (@yutannihilation,
    #284).

    !end-bullet!
-   !begin-bullet!
    `time_trans()` and `date_trans()` have `domains` of the correct type
    so that they can be transformed without error (#298).

    !end-bullet!
-   !begin-bullet!
    Internal `precision()`, used when `accuracy = NULL`, now avoids
    displaying unnecessary digits (@davidchall, #304).

    !end-bullet!

!end-bullets-9!

# scales 1.1.1

!begin-bullets-10!

-   !begin-bullet!
    `breaks_width()` now handles `difftime`/`hms` objects
    (@bhogan-mitre, #244).

    !end-bullet!
-   !begin-bullet!
    `hue_pal()` now correctly inverts color palettes when
    `direction = -1` (@dpseidel, #252).

    !end-bullet!
-   !begin-bullet!
    Internal `precision()`, used when `accuracy = NULL`, now does a
    better job when duplicate values are present (@teunbrand, #251). It
    also does a better job when there's a mix of finite and non-finite
    values (#257).

    !end-bullet!
-   !begin-bullet!
    New `oob_keep()` to keep data outside range, allowing for
    zoom-limits when `oob_keep` is used as `oob` argument in scales.
    Existing out of bounds functions have been renamed with the
    `oob_`-prefix to indicate their role (@teunbrand, #255).

    !end-bullet!
-   !begin-bullet!
    `ordinal_french()` gains `plural` and `gender` arguments (@stephLH,
    #256).

    !end-bullet!

!end-bullets-10!

# scales 1.1.0

!begin-bullets-11!

-   !begin-bullet!
    Axis breaks and labels have a new naming scheme: functions that
    generate breaks from limits are called `breaks_`; functions that
    generate labels from breaks are called `labels_` (#226).

    !end-bullet!
-   !begin-bullet!
    All breaks and labels examples have been overhauled to use new
    `demo_continuous()`, `demo_discrete()`, and `demo_log10()`, so you
    can see how to use scales functions with ggplot2.

    !end-bullet!

!end-bullets-11!

## Labels

!begin-bullets-12!

-   !begin-bullet!
    All label functions preserve names (#202) and keep `NA`s as `NA`s
    instead of trying to convert to `"NA"` (@clauswilke, #187).

    !end-bullet!
-   !begin-bullet!
    New `label_bytes()` replaces `number_bytes_format()` with a more
    convenient interface. It takes a single `unit` argument which can
    either be an SI unit (e.g. "kB"), a binary unit (e.g. "kIB"), or an
    automatic unit (either "auto_si" or "auto_binary").

    It always uses "B" as the symbol for bytes (#174), and checks that
    `units` are valid. Additionally, auto units are now used to
    determine the symbol separately for each value (@mikmart):

    !begin-codeblock!
    ``` r
    label_bytes("auto_binary")(1024^(1:3))
    #> [1] "1 kiB" "1 MiB" "1 GiB"
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    New `label_date_short()` creates labels for a date axis that only
    show the components of the date that have changed since the previous
    label. For example, if you have Jan 10, Jan 20, Jan 30, and Feb 1,
    `label_date_short()` will use labels Jan 10, 20, 30, Feb 1 (#209).

    !end-bullet!
-   !begin-bullet!
    `label_dollar()` now correctly formats negative numbers as (e.g.)
    -\$200 (#216).

    !end-bullet!
-   !begin-bullet!
    `label_math()` now returns an expression vector, and doesn't coerce
    inputs to names.

    !end-bullet!
-   !begin-bullet!
    `label_number()` takes `scale` into account when computing
    `accuracy`, if not supplied. This means that `label_percent()`
    should have better default accuracy in many cases (#192).

    !end-bullet!
-   !begin-bullet!
    `label_number()` now picks the accuracy automatically by default.
    The underlying heuristic has been improved to use the distance
    between adjacent breaks (rather than the total range of the break).

    !end-bullet!
-   !begin-bullet!
    New `label_number_auto()` automatically picks between
    `number_format()` and `scientific_format()` based on the range of
    the input. It should produce nice output over a very wide range of
    inputs (@paleolimbot, #208).

    !end-bullet!
-   !begin-bullet!
    New `label_number_si()` formats numeric vectors with limited SI
    units. Individual values are scaled and labelled with abbreviations
    "K", "M", "B", or "T" dependent on magnitude (@dpseidel, #83).

    !end-bullet!
-   !begin-bullet!
    `label_parse()` now generates an expression object that can be used
    to display formatted labels in ggplot2 (@agila5, #203).

    !end-bullet!
-   !begin-bullet!
    `label_pvalue()` now reports values close to 1 (as determined by
    `accuracy`) as (e.g.) "\>0.99". You can control the prefixes used
    with the new `prefix` argument (#213).

    !end-bullet!

!end-bullets-12!

## Breaks

!begin-bullets-13!

-   !begin-bullet!
    The built in breaks functions now returns a function that takes both
    a range and a desired number of breaks, making it possible to
    overwrite the defaults number of desired breaks given in the
    constructor call (@thomasp85).

    !end-bullet!
-   !begin-bullet!
    `breaks_log()` has nicer behaviour when there are no finite inputs
    (#210). It also provides usable breaks even with very small ranges
    (@billdenney, #168)

    !end-bullet!
-   !begin-bullet!
    New `breaks_width()` which allows you to specify a fixed distance
    between breaks (along with optional offset).

    !end-bullet!

!end-bullets-13!

## Transformations

!begin-bullets-14!

-   !begin-bullet!
    New `yj_trans()` implements the Yeo-Johnson transformation
    (@zamorarr, #196)

    !end-bullet!
-   !begin-bullet!
    `trans` objects gets methods for `plot()` and `lines()`, and all
    numeric transformations get an example showing the transformation.

    !end-bullet!
-   !begin-bullet!
    `boxcox_trans()` no longer throws an error when given NA values
    (@sflippl, #181).

    !end-bullet!

!end-bullets-14!

## Other bug fixes and minor improvements

!begin-bullets-15!

-   !begin-bullet!
    scales now uses the farver package for colour manipulation instead
    of a combination of grDevices and hand-rolled C++ code (#223).

    !end-bullet!
-   !begin-bullet!
    `alpha()` now preserves element names (@wibeasley, #195)

    !end-bullet!
-   !begin-bullet!
    `ContinuousRange` and `DiscreteRange` methods now properly inherit
    and are fully mutable (@dpseidel).

    !end-bullet!
-   !begin-bullet!
    `col_numeric()`, `col_bin()`, `col_quantile()`, and `col_factor()`
    now support viridis colors. Just pass a palette name (`"magma"`,
    `"inferno"`, `"plasma"`, or `"viridis"`) as the `palette` argument
    (@jcheng5, #191).

    !end-bullet!
-   !begin-bullet!
    `col_numeric()`, `col_bin()`, `col_quantile()`, and `col_factor()`
    now have a `reverse` parameter, to apply color palettes in the
    opposite of their usual order (i.e. high-to-low instead of
    low-to-high) (@jcheng5, #191).

    !end-bullet!
-   !begin-bullet!
    `col_bin()` and `col_quantile()` now take a `right` argument, which
    is passed to `base::cut()`; it indicates whether the bin/quantile
    intervals should be closed on the right (and open on the left), or
    vice versa (@jcheng5, #191).

    !end-bullet!
-   !begin-bullet!
    `col_factor()` now tries to avoid interpolating qualitative
    RColorBrewer palettes. Instead, it attempts to assign a palette
    color to each factor level. Interpolation will still be used if
    there are more factor levels than available colors, and a warning
    will be emitted in that case (@jcheng5, #191).

    !end-bullet!
-   !begin-bullet!
    `dichromat_pal()` documentation now builds without requiring
    suggested `dichromat` package to be installed (@dpseidel, #172).

    !end-bullet!
-   !begin-bullet!
    `date_breaks()` now supports subsecond intervals (@dpseidel, #85).

    !end-bullet!

!end-bullets-15!

# scales 1.0.0

## New Features

### Formatters

!begin-bullets-16!

-   !begin-bullet!
    `comma_format()`, `percent_format()` and `unit_format()` gain new
    arguments: `accuracy`, `scale`, `prefix`, `suffix`, `decimal.mark`,
    `big.mark` (@larmarange, #146).

    !end-bullet!
-   !begin-bullet!
    `dollar_format()` gains new arguments: `accuracy`, `scale`,
    `decimal.mark`, `trim` (@larmarange, #148).

    !end-bullet!
-   !begin-bullet!
    New `number_bytes_format()` and `number_bytes()` format numeric
    vectors into byte measurements (@hrbrmstr, @dpseidel).

    !end-bullet!
-   !begin-bullet!
    New `number_format()` provides a generic formatter for numbers
    (@larmarange, #142).

    !end-bullet!
-   !begin-bullet!
    New `pvalue_format()` formats p-values (@larmarange, #145).

    !end-bullet!
-   !begin-bullet!
    `ordinal_format()` gains new arguments: `prefix`, `suffix`,
    `big.mark`, `rules`; rules for French and Spanish are also provided
    (@larmarange, #149).

    !end-bullet!
-   !begin-bullet!
    `scientific_format()` gains new arguments: `scale`, `prefix`,
    `suffix`, `decimal.mark`, `trim` (@larmarange, #147).

    !end-bullet!
-   !begin-bullet!
    New `time_format()` formats `POSIXt` and `hms` objects (@dpseidel,
    #88).

    !end-bullet!

!end-bullets-16!

### Transformations & breaks

!begin-bullets-17!

-   !begin-bullet!
    `boxcox_trans()` is now invertible for `x >= 0` and requires
    positive values. A new argument `offset` allows specification of
    both type-1 and type-2 Box-Cox transformations (@dpseidel, #103).

    !end-bullet!
-   !begin-bullet!
    `log_breaks()` returns integer multiples of integer powers of base
    when finer breaks are needed (@ThierryO, #117).

    !end-bullet!
-   !begin-bullet!
    New function `modulus_trans()` implements the modulus transformation
    for positive and negative values (@dpseidel).

    !end-bullet!
-   !begin-bullet!
    New `pseudo_log_trans()` for transforming numerics into a signed
    logarithmic scale with a smooth transition to a linear scale around
    0 (@lepennec, #106).

    !end-bullet!

!end-bullets-17!

## Minor bug fixes and improvements

!begin-bullets-18!

-   !begin-bullet!
    scales functions now work as expected when it is used inside a for
    loop. In previous package versions if a scales function was used
    with variable custom parameters inside a for loop, some of the
    parameters were not evaluated until the end of the loop, due to how
    R lazy evaluation works (@zeehio, #81).

    !end-bullet!
-   !begin-bullet!
    `colour_ramp()` now uses `alpha = TRUE` by default (@clauswilke,
    #108).

    !end-bullet!
-   !begin-bullet!
    `date_breaks()` now supports subsecond intervals (@dpseidel, #85).

    !end-bullet!
-   !begin-bullet!
    Removes `dichromat` and `plyr` dependencies. `dichromat` is now
    suggested (@dpseidel, #118).

    !end-bullet!
-   !begin-bullet!
    `expand_range()` arguments `mul` and `add` now affect scales with a
    range of 0 (@dpseidel, ggplot2-2281).

    !end-bullet!
-   !begin-bullet!
    `extended_breaks()` now allows user specification of the
    `labeling::extended()` argument `only.loose` to permit more flexible
    breaks specification (@dpseidel, #99).

    !end-bullet!
-   !begin-bullet!
    New `rescale()` and `rescale_mid()` methods support `dist` objects
    (@zeehio, #105).

    !end-bullet!
-   !begin-bullet!
    `rescale_mid()` now properly handles NAs (@foo-bar-baz-qux, #104).

    !end-bullet!

!end-bullets-18!

# scales 0.5.0

!begin-bullets-19!

-   !begin-bullet!
    New function `regular_minor_breaks()` calculates minor breaks as a
    property of the transformation (@karawoo).

    !end-bullet!
-   !begin-bullet!
    Adds `viridis_pal()` for creating palettes with color maps from the
    viridisLite package (@karawoo).

    !end-bullet!
-   !begin-bullet!
    Switched from reference classes to R6 (#96).

    !end-bullet!
-   !begin-bullet!
    `rescale()` and `rescale_mid()` are now S3 generics, and work with
    `numeric`, `Date`, `POSIXct`, `POSIXlt` and `bit64::integer64`
    objects (@zeehio, #74).

    !end-bullet!

!end-bullets-19!

# scales 0.4.1

!begin-bullets-20!

-   !begin-bullet!
    `extended_breaks()` no longer fails on pathological inputs.

    !end-bullet!
-   !begin-bullet!
    New `hms_trans()` for transforming hms time vectors.

    !end-bullet!
-   !begin-bullet!
    `train_discrete()` gets a new `na.rm` argument which controls
    whether `NA`s are preserved or dropped.

    !end-bullet!

!end-bullets-20!

# scales 0.4.0

!begin-bullets-21!

-   !begin-bullet!
    Switched from `NEWS` to `NEWS.md`.

    !end-bullet!
-   !begin-bullet!
    `manual_pal()` produces a warning if n is greater than the number of
    values in the palette (@jrnold, #68).

    !end-bullet!
-   !begin-bullet!
    `precision(0)` now returns 1, which means `percent(0)` now returns
    0% (#50).

    !end-bullet!
-   !begin-bullet!
    `scale_continuous()` uses a more correct check for numeric values.

    !end-bullet!
-   !begin-bullet!
    NaN is correctly recognised as a missing value by the gradient
    palettes (ggplot2-1482).

    !end-bullet!

!end-bullets-21!

# scales 0.3.0

!begin-bullets-22!

-   !begin-bullet!
    `rescale()` preserves missing values in input when the range of `x`
    is (effectively) 0 (ggplot2-985).

    !end-bullet!
-   !begin-bullet!
    Continuous colour palettes now use `colour_ramp()` instead of
    `colorRamp()`. This only supports interpolation in Lab colour space,
    but is hundreds of times faster.

    !end-bullet!

!end-bullets-22!

# scales 0.2.5

## Improved formatting functions

!begin-bullets-23!

-   !begin-bullet!
    `date_format()` gains an option to specify time zone (#51).

    !end-bullet!
-   !begin-bullet!
    `dollar_format()` is now more flexible and can add either prefixes
    or suffixes for different currencies (#53). It gains a
    `negative_parens` argument to show negative values as `($100)` and
    now passes missing values through unchanged (@dougmitarotonda, #40).

    !end-bullet!
-   !begin-bullet!
    New `ordinal_format()` generates ordinal numbers (1st, 2nd, etc)
    (@aaronwolen, #55).

    !end-bullet!
-   !begin-bullet!
    New `unit_format()` makes it easier to add units to labels,
    optionally scaling (@ThierryO, #46).

    !end-bullet!
-   !begin-bullet!
    New `wrap_format()` function to wrap character vectors to a desired
    width. (@jimhester, #37).

    !end-bullet!

!end-bullets-23!

## New colour scaling functions

!begin-bullets-24!

-   !begin-bullet!
    New color scaling functions `col_numeric()`, `col_bin()`,
    `col_quantile()`, and `col_factor()`. These functions provide
    concise ways to map continuous or categorical values to color
    spectra.

    !end-bullet!
-   !begin-bullet!
    New `colour_ramp()` function for performing color interpolation in
    the CIELAB color space (like `grDevices::colorRamp(space = 'Lab')`,
    but much faster).

    !end-bullet!

!end-bullets-24!

## Other bug fixes and minor improvements

!begin-bullets-25!

-   !begin-bullet!
    `boxcox_trans()` returns correct value when p is close to zero
    (#31).

    !end-bullet!
-   !begin-bullet!
    `dollar()` and `percent()` both correctly return a zero length
    string for zero length input (@BrianDiggs, #35).

    !end-bullet!
-   !begin-bullet!
    `brewer_pal()` gains a `direction` argument to easily invert the
    order of colours (@jiho, #36).

    !end-bullet!
-   !begin-bullet!
    `show_col()` has additional options to showcase colors better
    (@jiho, #52).

    !end-bullet!
-   !begin-bullet!
    Relaxed tolerance in `zero_range()` to `.Machine$double.eps * 1000`
    (#33).

    !end-bullet!

!end-bullets-25!

# scales 0.2.4

!begin-bullets-26!

-   !begin-bullet!
    Eliminate stringr dependency.

    !end-bullet!
-   !begin-bullet!
    Fix outstanding errors in R CMD check.

    !end-bullet!

!end-bullets-26!

# scales 0.2.3

!begin-bullets-27!

-   !begin-bullet!
    `floor_time()` calls `to_time()`, but that function was moved into a
    function so it was no longer available in the scales namespace. Now
    `floor_time()` has its own copy of that function (Thanks to Stefan
    Novak).

    !end-bullet!
-   !begin-bullet!
    Color palettes generated by `brewer_pal()` no longer give warnings
    when fewer than 3 colors are requested (@wch).

    !end-bullet!
-   !begin-bullet!
    `abs_area()` and `rescale_max()` functions have been added, for
    scaling the area of points to be proportional to their value. These
    are used by `scale_size_area()` in ggplot2.

    !end-bullet!

!end-bullets-27!

# scales 0.2.2

!begin-bullets-28!

-   !begin-bullet!
    `zero_range()` has improved behaviour thanks to Brian Diggs.

    !end-bullet!
-   !begin-bullet!
    `brewer_pal()` complains if you give it an incorrect palette type.
    (Fixes #15, thanks to Jean-Olivier Irisson).

    !end-bullet!
-   !begin-bullet!
    `shape_pal()` warns if asked for more than 6 values. (Fixes #16,
    thanks to Jean-Olivier Irisson).

    !end-bullet!
-   !begin-bullet!
    `time_trans()` gains an optional argument `tz` to specify the time
    zone to use for the times. If not specified, it will be guess from
    the first input with a non-null time zone.

    !end-bullet!
-   !begin-bullet!
    `date_trans()` and `time_trans()` now check that their inputs are of
    the correct type. This prevents ggplot2 scales from silently giving
    incorrect outputs when given incorrect inputs.

    !end-bullet!
-   !begin-bullet!
    Change the default breaks algorithm for `cbreaks()` and
    `trans_new()`. Previously it was `pretty_breaks()`, and now it's
    `extended_breaks()`, which uses the `extended()` algorithm from the
    labeling package.

    !end-bullet!
-   !begin-bullet!
    fixed namespace problem with `fullseq()`.

    !end-bullet!

!end-bullets-28!

# scales 0.2.1

!begin-bullets-29!

-   !begin-bullet!
    `suppressWarnings` from `train_continuous()` so zero-row or all
    infinite data frames don't potentially cause problems.

    !end-bullet!
-   !begin-bullet!
    check for zero-length colour in `gradient_n_pal()`.

    !end-bullet!
-   !begin-bullet!
    added `extended_breaks()` which implements an extension to
    Wilkinson's labelling approach, as implemented in the `labeling`
    package. This should generally produce nicer breaks than
    `pretty_breaks()`.

    !end-bullet!
-   !begin-bullet!
    `alpha()` can now preserve existing alpha values if `alpha()` is
    missing.

    !end-bullet!
-   !begin-bullet!
    `log_breaks()` always gives breaks evenly spaced on the log scale,
    never evenly spaced on the data scale. This will result in really
    bad breaks for some ranges (e.g 0.5-0.6), but you probably shouldn't
    be using log scales in that situation anyway.

    !end-bullet!

!end-bullets-29!

# scales 0.2.0

!begin-bullets-30!

-   !begin-bullet!
    `censor()` and `squish()` gain `only.finite` argument and default to
    operating only on finite values. This is needed for ggplot2, and
    reflects the use of Inf and -Inf as special values.

    !end-bullet!
-   !begin-bullet!
    `bounds` functions now `force` evaluation of range to avoid bug with
    S3 method dispatch inside primitive functions (e.g. `[`).

    !end-bullet!
-   !begin-bullet!
    Simplified algorithm for `discrete_range()` that is robust to
    `stringsAsFactors` global option. Now, the order of a factor will
    only be preserved if the full factor is the first object seen, and
    all subsequent inputs are subsets of the levels of the original
    factor.

    !end-bullet!
-   !begin-bullet!
    `scientific()` ensures output is always in scientific format and off
    the specified number of significant digits. `comma()` ensures output
    is never in scientific format (Fixes #7).

    !end-bullet!
-   !begin-bullet!
    Another tweak to `zero_range()` to better detect when a range has
    zero length (Fixes #6).

    !end-bullet!

!end-bullets-30!

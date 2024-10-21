# waldo (development version)

!begin-bullets-1!

-   !begin-bullet!
    `compare()` now gives informative errors if you misspecify the
    argument types (#181)
    !end-bullet!
-   !begin-bullet!
    waldo gains basic support for S7 objects (#200).
    !end-bullet!
-   !begin-bullet!
    `as_map()` now preserves attributes (#185).
    !end-bullet!
-   !begin-bullet!
    `compare()` can now distinguish between objects that differ only in
    the value of their S4 bit (#189).
    !end-bullet!
-   !begin-bullet!
    Double comparisons now always display one more digit than the
    absolute minimum necessary (#141).
    !end-bullet!
-   !begin-bullet!
    waldo no longer imports tibble and rematch2 (@olivroy, #196).
    !end-bullet!
-   !begin-bullet!
    waldo now requires R 4.0.0.
    !end-bullet!

!end-bullets-1!

# waldo 0.5.3

!begin-bullets-2!

-   !begin-bullet!
    waldo no longer imports fansi (@olivroy, #192).
    !end-bullet!

!end-bullets-2!

# waldo 0.5.2

!begin-bullets-3!

-   !begin-bullet!
    Fixes for upcoming R-devel changes.
    !end-bullet!

!end-bullets-3!

# waldo 0.5.1

!begin-bullets-4!

-   !begin-bullet!
    Tolerance is also taken into account when displaying differences
    (#173).

    !end-bullet!
-   !begin-bullet!
    `NA_real_` and `NaN` are only treated as non-equal when tolerance is
    non-null. That means that `testthat::expect_equal(NaN, NA_real_)`
    will pass but `testthat::expect_identical(NaN, NA_real_)` will fail
    (#174).

    !end-bullet!

!end-bullets-4!

# waldo 0.5.0

!begin-bullets-5!

-   !begin-bullet!
    You can opt-out of quoting strings with `quote_strings = FALSE`
    (#145).

    !end-bullet!
-   !begin-bullet!
    Improvements to missing value handling:

    !begin-bullets-6!
    -   !begin-bullet!
        `NA_character_` and `"NA"` are no longer treated as equal
        (#162).

        !end-bullet!
    -   !begin-bullet!
        `NA_real_` and `NaN` are no longer treated as equal (@sorhawell,
        #150).

        !end-bullet!
    -   !begin-bullet!
        Leading and trailing `NA`s are no longer omitted from output
        when the lengths of `x` and `y` are unequal (#109).

        !end-bullet!

    !end-bullets-6!
    !end-bullet!
-   !begin-bullet!
    The `balanced` attribute used by some `POSIXlt` objects in R 4.3 and
    greater is now ignored (#160).

    !end-bullet!
-   !begin-bullet!
    3d (and greater) numeric arrays no longer cause an error (#148).

    !end-bullet!
-   !begin-bullet!
    Support for complex numbers is improved (#146).

    !end-bullet!
-   !begin-bullet!
    `ignore_attr = "class"` now works for more types of input (#143).

    !end-bullet!

!end-bullets-5!

# waldo 0.4.0

!begin-bullets-7!

-   !begin-bullet!
    Atomic S3 classes with format methods now use those methods when
    displaying comparisons (#98). If the printed representation is the
    same, they fallback to displaying the underlying data.

    !end-bullet!
-   !begin-bullet!
    Rowwise data frame comparisons are now much much faster (#116), and
    respect the `max_diffs` argument (@krlmlr, #110).

    !end-bullet!
-   !begin-bullet!
    Unnamed environments now compare by value, not by reference (i.e. if
    two environments contain the same values, they compare the same,
    even if they're different environments) (#127). Environments that
    contain self-references are handled correctly (#117). Differences
    between pairs of environments are only ever reported once.

    !end-bullet!
-   !begin-bullet!
    In the unlikely event that you have bare CHARSXP objects, waldo now
    handles them (#121).

    !end-bullet!
-   !begin-bullet!
    S4 objects are labelled with their class, not all superclasses
    (#125).

    !end-bullet!
-   !begin-bullet!
    `compare_proxy()` ignores the `"index"` attribute for data tables
    (@krlmlr, #107), and works again for `RProtoBuf` objects
    (@MichaelChirico, #119)

    !end-bullet!
-   !begin-bullet!
    Infinite values can be compared with a tolerance (@dmurdoch, #122).

    !end-bullet!

!end-bullets-7!

# waldo 0.3.1

!begin-bullets-8!

-   !begin-bullet!
    `compare()`ing data frames now works independently of
    `option(max.print)` (#105).

    !end-bullet!
-   !begin-bullet!
    Fixed regression when comparing vectors with missing values (#102).

    !end-bullet!

!end-bullets-8!

# waldo 0.3.0

!begin-bullets-9!

-   !begin-bullet!
    `compare()` is now considerably faster when comparing complex
    objects that don't have any differences (thanks to strategic use of
    `identical()`) (#86).

    !end-bullet!
-   !begin-bullet!
    `compare()` gains two improvements to low-level diffs:

    !begin-bullets-10!
    -   !begin-bullet!
        Structurally identical data frames (#78) and numeric matrices
        (#76) gain a row-by-row diff that makes it easier to see where
        exactly values differ.

        !end-bullet!
    -   !begin-bullet!
        An element-by-element diff will be automatically used if it's
        shorter than the "smart" diff. This improves diff quality when
        comparing two vectors that aren't really related (#68).

        !end-bullet!

    !end-bullets-10!
    !end-bullet!
-   !begin-bullet!
    `compare()` gains a `list_as_map` argument thanks to an idea from
    @dmurdoch. It allows you to compare the behaviour of two lists when
    they are used to connect names to values (i.e. the list is operating
    as a map or dictionary). It removes `NULL`s and sorts named
    components (#72).

    !end-bullet!
-   !begin-bullet!
    The objects involved in `compare()` (as opposed to the caller of
    `compare()`) gained much greater ability to control the comparison.

    !begin-bullets-11!
    -   !begin-bullet!
        Objects can now contain a `waldo_opts` attribute, a list with
        the same names and valid values as the arguments to `compare()`,
        which overrides the default comparisons (@dmurdoch).

        !end-bullet!
    -   !begin-bullet!
        `compare_proxy()` is now called earlier (before type comparison)
        making it more flexible (#65).

        !end-bullet!
    -   !begin-bullet!
        `compare_proxy()` gains a second argument, `path`, used to
        report how the proxy changed the object. This makes it easier to
        see when and how a proxy is used (#73).

        !end-bullet!
    -   !begin-bullet!
        Proxies now exist for comparing RProtoBuf objects, converting
        them to proto text format (#82, @michaelquinn32).

        !end-bullet!

    !end-bullets-11!
    !end-bullet!
-   !begin-bullet!
    Comparing a list with symbol to a list without that element no
    longer errors (@mgirlich, #79).

    !end-bullet!

!end-bullets-9!

# waldo 0.2.5

!begin-bullets-12!

-   !begin-bullet!
    On platforms without UTF-8 support, strings that differ only in
    their encoding are now correctly considered to be identical (#66).
    !end-bullet!

!end-bullets-12!

# waldo 0.2.4

!begin-bullets-13!

-   !begin-bullet!
    Additional arguments to `compare()` generate a more informative
    warning (#58).

    !end-bullet!
-   !begin-bullet!
    Numbers use a better algorithm for picking the number of decimal
    places to show (#63).

    !end-bullet!
-   !begin-bullet!
    ASTs with identical deparsed strings now show exactly how the AST
    differs. Source references are now more comprehensively stripped
    using `rlang::zap_srcrefs()`

    !end-bullet!
-   !begin-bullet!
    S3 objects now show the base type, and no longer fails when the
    types are incompatible.

    !end-bullet!

!end-bullets-13!

# waldo 0.2.3

!begin-bullets-14!

-   !begin-bullet!
    `compare()` gains a new `max_diffs` argument that allows you to
    control the maximum number of differences shown. Set
    `max_diffs = Inf` to see all differences (#49)

    !end-bullet!
-   !begin-bullet!
    Logical vectors fall back to element-by-element comparison in more
    cases (#51).

    !end-bullet!
-   !begin-bullet!
    Long-form diff no longer confuses additions and deletions (#52,
    @krlmlr).

    !end-bullet!

!end-bullets-14!

# waldo 0.2.2

!begin-bullets-15!

-   !begin-bullet!
    Handle S4 objects that have attributes that are not slots.

    !end-bullet!
-   !begin-bullet!
    Additions are now coloured blue and deletions yellow (instead of the
    opposite).

    !end-bullet!

!end-bullets-15!

# waldo 0.2.1

!begin-bullets-16!

-   !begin-bullet!
    `compare()` now labels output as `old` and `new`, since that's the
    most natural way to use it.

    !end-bullet!
-   !begin-bullet!
    `compare()` can selectively ignore attributes by providing vector to
    `ignore_attr` (#45).

    !end-bullet!
-   !begin-bullet!
    `print()` method gets `n` argument to allow explicitly specifying
    number of differences to show (@mnazarov).

    !end-bullet!
-   !begin-bullet!
    Improvements to comparison display:

    !begin-bullets-17!
    -   !begin-bullet!
        Zero length vectors compare robustly (#39)

        !end-bullet!
    -   !begin-bullet!
        Line-by-line comparisons show modifications as deletion then
        addition, rather than addition then deletion (#44).

        !end-bullet!
    -   !begin-bullet!
        Differences between numeric vectors are more robust,
        particularly in the presence of missing values (#43). The number
        of digits selected has also been slightly improved so that
        you're more likely to get exactly the number of digits needed.

        !end-bullet!

    !end-bullets-17!
    !end-bullet!

!end-bullets-16!

# waldo 0.2.0

!begin-bullets-18!

-   !begin-bullet!
    All objects: class (#26) and names (#31) are ignored when ignoring
    attributes.

    !end-bullet!
-   !begin-bullet!
    Numeric and logical vectors: clearer display of differences. Numbers
    are right-aligned, and we show the numbers not the differences.

    !end-bullet!
-   !begin-bullet!
    Character vectors: a trailing newline is no longer ignored (#37).

    !end-bullet!
-   !begin-bullet!
    Lists: all elements of the unnamed lists are compared, not just the
    last! (#32)

    !end-bullet!
-   !begin-bullet!
    Lists: unclassed prior to comparison (#21).

    !end-bullet!
-   !begin-bullet!
    Data frames: The internal representation of row names is no longer
    used; instead we use the same result of `rownames()` (#23).

    !end-bullet!
-   !begin-bullet!
    Environments: New `ignore_formula_env` and `ignore_function_env`
    arguments to ignore formula and function environments for
    compatibility with `all.equal()` (#24).

    !end-bullet!
-   !begin-bullet!
    Expression objects: can now be compared (#29).

    !end-bullet!
-   !begin-bullet!
    Calls: srcrefs and attributes are ignored.

    !end-bullet!

!end-bullets-18!

------------------------------------------------------------------------

!begin-bullets-19!

-   !begin-bullet!
    `compare_proxy()` is now exported so that you can provide methods if
    your objects need special handling (particularly needed for objects
    that contain external pointers) (#22).

    !end-bullet!
-   !begin-bullet!
    Fixed a partial argument name in `as.list()`.

    !end-bullet!

!end-bullets-19!

# waldo 0.1.0

!begin-bullets-20!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-20!

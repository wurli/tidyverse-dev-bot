# dplyr (development version)

!begin-bullets-1!

-   !begin-bullet!
    `bind_rows()` now replaces empty (or `NA`) element names in a list
    with its numeric index while preserving existing names (#7719,
    @Meghansaha).

    !end-bullet!
-   !begin-bullet!
    New `slice_sample()` example showing how to use it to shuffle rows
    (#7707, @Hzanib).

    !end-bullet!
-   !begin-bullet!
    Updated `across()` examples to include an example using
    `everything()` (#7621, @JBrandenburg02).

    !end-bullet!
-   !begin-bullet!
    Clarified how `slice_min()` and `slice_max()` work in the
    introduction vignette (#7717, @ccani007).

    !end-bullet!
-   !begin-bullet!
    `reframe()` has moved from experimental to stable (#7713,
    @VisruthSK).

    !end-bullet!
-   !begin-bullet!
    The base pipe is now used throughout the documentation (#7711).

    !end-bullet!
-   !begin-bullet!
    R \>=4.1.0 is now required, in line with the tidyverse standard of
    supporting the previous 5 minor releases of R (#7711).

    !end-bullet!
-   !begin-bullet!
    `case_when()` now throws a better error if one of the conditions is
    an array (#6862, @ilovemane).

    !end-bullet!
-   !begin-bullet!
    `between()` gains a new `ptype` argument, allowing users to specify
    the desired output type. This is particularly useful for ordered
    factors and other complex types where the default common type
    behavior might not be ideal (#6906, @JamesHWade).

    !end-bullet!
-   !begin-bullet!
    Fixed an edge case when coercing data frames to matrices (#7004).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where duckplyr's ALTREP data frames were being
    materialized early due to internal usage of `ncol()` (#7049).

    !end-bullet!
-   !begin-bullet!
    `if_any()` and `if_all()` are now fully consistent with `any()` and
    `all()`. In particular, when called with empty inputs `if_any()`
    returns `FALSE` and `if_all()` returns `TRUE` (#7059, @jrwinget).

    !end-bullet!

!end-bullets-1!

# dplyr 1.1.4

!begin-bullets-2!

-   !begin-bullet!
    `join_by()` now allows its helper functions to be namespaced with
    `dplyr::`, like `join_by(dplyr::between(x, lower, upper))` (#6838).

    !end-bullet!
-   !begin-bullet!
    `left_join()` and friends now return a specialized error message if
    they detect that your join would return more rows than dplyr can
    handle (#6912).

    !end-bullet!
-   !begin-bullet!
    `slice_*()` now throw the correct error if you forget to name `n`
    while also prefixing the call with `dplyr::` (#6946).

    !end-bullet!
-   !begin-bullet!
    `dplyr_reconstruct()`'s default method has been rewritten to avoid
    materializing duckplyr queries too early (#6947).

    !end-bullet!
-   !begin-bullet!
    Updated the `storms` data to include 2022 data (#6937, @steveharoz).

    !end-bullet!
-   !begin-bullet!
    Updated the `starwars` data to use a new API, because the old one is
    defunct. There are very minor changes to the data itself (#6938,
    @steveharoz).

    !end-bullet!

!end-bullets-2!

# dplyr 1.1.3

!begin-bullets-3!

-   !begin-bullet!
    `mutate_each()` and `summarise_each()` now throw correct deprecation
    messages (#6869).

    !end-bullet!
-   !begin-bullet!
    `setequal()` now requires the input data frames to be compatible,
    similar to the other set methods like `setdiff()` or `intersect()`
    (#6786).

    !end-bullet!

!end-bullets-3!

# dplyr 1.1.2

!begin-bullets-4!

-   !begin-bullet!
    `count()` better documents that it has a `.drop` argument (#6820).

    !end-bullet!
-   !begin-bullet!
    Fixed tests to maintain compatibility with the next version of waldo
    (#6823).

    !end-bullet!
-   !begin-bullet!
    Joins better handle key columns will all `NA`s (#6804).

    !end-bullet!

!end-bullets-4!

# dplyr 1.1.1

!begin-bullets-5!

-   !begin-bullet!
    Mutating joins now warn about multiple matches much less often. At a
    high level, a warning was previously being thrown when a one-to-many
    or many-to-many relationship was detected between the keys of `x`
    and `y`, but is now only thrown for a many-to-many relationship,
    which is much rarer and much more dangerous than one-to-many because
    it can result in a Cartesian explosion in the number of rows
    returned from the join (#6731, #6717).

    We've accomplished this in two steps:

    !begin-bullets-6!
    -   !begin-bullet!
        `multiple` now defaults to `"all"`, and the options of `"error"`
        and `"warning"` are now deprecated in favor of using
        `relationship` (see below). We are using an accelerated
        deprecation process for these two options because they've only
        been available for a few weeks, and `relationship` is a clearly
        superior alternative.

        !end-bullet!
    -   !begin-bullet!
        The mutating joins gain a new `relationship` argument, allowing
        you to optionally enforce one of the following relationship
        constraints between the keys of `x` and `y`: `"one-to-one"`,
        `"one-to-many"`, `"many-to-one"`, or `"many-to-many"`.

        For example, `"many-to-one"` enforces that each row in `x` can
        match at most 1 row in `y`. If a row in `x` matches \>1 rows in
        `y`, an error is thrown. This option serves as the replacement
        for `multiple = "error"`.

        The default behavior of `relationship` doesn't assume that there
        is any relationship between `x` and `y`. However, for equality
        joins it will check for the presence of a many-to-many
        relationship, and will warn if it detects one.

        !end-bullet!

    !end-bullets-6!
    This change unfortunately does mean that if you have set
    `multiple = "all"` to avoid a warning and you happened to be doing a
    many-to-many style join, then you will need to replace
    `multiple = "all"` with `relationship = "many-to-many"` to silence
    the new warning, but we believe this should be rare since
    many-to-many relationships are fairly uncommon.

    !end-bullet!
-   !begin-bullet!
    Fixed a major performance regression in `case_when()`. It is still a
    little slower than in dplyr 1.0.10, but we plan to improve this
    further in the future (#6674).

    !end-bullet!
-   !begin-bullet!
    Fixed a performance regression related to `nth()`, `first()`, and
    `last()` (#6682).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where expressions involving infix operators had an
    abnormally large amount of overhead (#6681).

    !end-bullet!
-   !begin-bullet!
    `group_data()` on ungrouped data frames is faster (#6736).

    !end-bullet!
-   !begin-bullet!
    `n()` is a little faster when there are many groups (#6727).

    !end-bullet!
-   !begin-bullet!
    `pick()` now returns a 1 row, 0 column tibble when `...` evaluates
    to an empty selection. This makes it more compatible with tidyverse
    recycling rules in some edge cases (#6685).

    !end-bullet!
-   !begin-bullet!
    `if_else()` and `case_when()` again accept logical conditions that
    have attributes (#6678).

    !end-bullet!
-   !begin-bullet!
    `arrange()` can once again sort the `numeric_version` type from base
    R (#6680).

    !end-bullet!
-   !begin-bullet!
    `slice_sample()` now works when the input has a column named
    `replace`. `slice_min()` and `slice_max()` now work when the input
    has columns named `na_rm` or `with_ties` (#6725).

    !end-bullet!
-   !begin-bullet!
    `nth()` now errors informatively if `n` is `NA` (#6682).

    !end-bullet!
-   !begin-bullet!
    Joins now throw a more informative error when `y` doesn't have the
    same source as `x` (#6798).

    !end-bullet!
-   !begin-bullet!
    All major dplyr verbs now throw an informative error message if the
    input data frame contains a column named `NA` or `""` (#6758).

    !end-bullet!
-   !begin-bullet!
    Deprecation warnings thrown by `filter()` now mention the correct
    package where the problem originated from (#6679).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where using `<-` within a grouped `mutate()` or
    `summarise()` could cross contaminate other groups (#6666).

    !end-bullet!
-   !begin-bullet!
    The compatibility vignette has been replaced with a more general
    vignette on using dplyr in packages, `vignette("in-packages")`
    (#6702).

    !end-bullet!
-   !begin-bullet!
    The developer documentation in `?dplyr_extending` has been refreshed
    and brought up to date with all changes made in 1.1.0 (#6695).

    !end-bullet!
-   !begin-bullet!
    `rename_with()` now includes an example of using
    `paste0(recycle0 = TRUE)` to correctly handle empty selections
    (#6688).

    !end-bullet!
-   !begin-bullet!
    R \>=3.5.0 is now explicitly required. This is in line with the
    tidyverse policy of supporting the 5 most recent versions of R.

    !end-bullet!

!end-bullets-5!

# dplyr 1.1.0

## New features

!begin-bullets-7!

-   !begin-bullet!
    `.by`/`by` is an experimental alternative to `group_by()` that
    supports per-operation grouping for `mutate()`, `summarise()`,
    `filter()`, and the `slice()` family (#6528).

    Rather than:

    !begin-codeblock!
        starwars %>%
          group_by(species, homeworld) %>%
          summarise(mean_height = mean(height))

    !end-codeblock!
    You can now write:

    !begin-codeblock!
        starwars %>%
          summarise(
            mean_height = mean(height),
            .by = c(species, homeworld)
          )

    !end-codeblock!
    The most useful reason to do this is because `.by` only affects a
    single operation. In the example above, an ungrouped data frame went
    into the `summarise()` call, so an ungrouped data frame will come
    out; with `.by`, you never need to remember to `ungroup()`
    afterwards and you never need to use the `.groups` argument.

    Additionally, using `summarise()` with `.by` will never sort the
    results by the group key, unlike with `group_by()`. Instead, the
    results are returned using the existing ordering of the groups from
    the original data. We feel this is more predictable, better
    maintains any ordering you might have already applied with a
    previous call to `arrange()`, and provides a way to maintain the
    current ordering without having to resort to factors.

    This feature was inspired by data.table, where the equivalent syntax
    looks like:

    !begin-codeblock!
        starwars[, .(mean_height = mean(height)), by = .(species, homeworld)]

    !end-codeblock!
    `with_groups()` is superseded in favor of `.by` (#6582).

    !end-bullet!
-   !begin-bullet!
    `reframe()` is a new experimental verb that creates a new data frame
    by applying functions to columns of an existing data frame. It is
    very similar to `summarise()`, with two big differences:

    !begin-bullets-8!
    -   !begin-bullet!
        `reframe()` can return an arbitrary number of rows per group,
        while `summarise()` reduces each group down to a single row.

        !end-bullet!
    -   !begin-bullet!
        `reframe()` always returns an ungrouped data frame, while
        `summarise()` might return a grouped or rowwise data frame,
        depending on the scenario.

        !end-bullet!

    !end-bullets-8!
    `reframe()` has been added in response to valid concern from the
    community that allowing `summarise()` to return any number of rows
    per group increases the chance for accidental bugs. We still feel
    that this is a powerful technique, and is a principled replacement
    for `do()`, so we have moved these features to `reframe()` (#6382).

    !end-bullet!
-   !begin-bullet!
    `group_by()` now uses a new algorithm for computing groups. It is
    often faster than the previous approach (especially when there are
    many groups), and in most cases there should be no changes. The one
    exception is with character vectors, see the C locale news bullet
    below for more details (#4406, #6297).

    !end-bullet!
-   !begin-bullet!
    `arrange()` now uses a faster algorithm for sorting character
    vectors, which is heavily inspired by data.table's `forder()`. See
    the C locale news bullet below for more details (#4962).

    !end-bullet!
-   !begin-bullet!
    Joins have been completely overhauled to enable more flexible join
    operations and provide more tools for quality control. Many of these
    changes are inspired by data.table's join syntax (#5914, #5661,
    #5413, #2240).

    !begin-bullets-9!
    -   !begin-bullet!
        A *join specification* can now be created through `join_by()`.
        This allows you to specify both the left and right hand side of
        a join using unquoted column names, such as
        `join_by(sale_date == commercial_date)`. Join specifications can
        be supplied to any `*_join()` function as the `by` argument.

        !end-bullet!
    -   !begin-bullet!
        Join specifications allow for new types of joins:

        !begin-bullets-10!
        -   !begin-bullet!
            Equality joins: The most common join, specified by `==`. For
            example, `join_by(sale_date == commercial_date)`.

            !end-bullet!
        -   !begin-bullet!
            Inequality joins: For joining on inequalities, i.e.`>=`,
            `>`, `<`, and `<=`. For example, use
            `join_by(sale_date >= commercial_date)` to find every
            commercial that aired before a particular sale.

            !end-bullet!
        -   !begin-bullet!
            Rolling joins: For "rolling" the closest match forward or
            backwards when there isn't an exact match, specified by
            using the rolling helper, `closest()`. For example,
            `join_by(closest(sale_date >= commercial_date))` to find
            only the most recent commercial that aired before a
            particular sale.

            !end-bullet!
        -   !begin-bullet!
            Overlap joins: For detecting overlaps between sets of
            columns, specified by using one of the overlap helpers:
            `between()`, `within()`, or `overlaps()`. For example, use
            `join_by(between(commercial_date, sale_date_lower, sale_date))`
            to find commercials that aired before a particular sale, as
            long as they occurred after some lower bound, such as 40
            days before the sale was made.

            !end-bullet!

        !end-bullets-10!
        Note that you cannot use arbitrary expressions in the join
        conditions, like `join_by(sale_date - 40 >= commercial_date)`.
        Instead, use `mutate()` to create a new column containing the
        result of `sale_date - 40` and refer to that by name in
        `join_by()`.

        !end-bullet!
    -   !begin-bullet!
        `multiple` is a new argument for controlling what happens when a
        row in `x` matches multiple rows in `y`. For equality joins and
        rolling joins, where this is usually surprising, this defaults
        to signalling a `"warning"`, but still returns all of the
        matches. For inequality joins, where multiple matches are
        usually expected, this defaults to returning `"all"` of the
        matches. You can also return only the `"first"` or `"last"`
        match, `"any"` of the matches, or you can `"error"`.

        !end-bullet!
    -   !begin-bullet!
        `keep` now defaults to `NULL` rather than `FALSE`. `NULL`
        implies `keep = FALSE` for equality conditions, but
        `keep = TRUE` for inequality conditions, since you generally
        want to preserve both sides of an inequality join.

        !end-bullet!
    -   !begin-bullet!
        `unmatched` is a new argument for controlling what happens when
        a row would be dropped because it doesn't have a match. For
        backwards compatibility, the default is `"drop"`, but you can
        also choose to `"error"` if dropped rows would be surprising.

        !end-bullet!

    !end-bullets-9!
    !end-bullet!
-   !begin-bullet!
    `across()` gains an experimental `.unpack` argument to optionally
    unpack (as in, `tidyr::unpack()`) data frames returned by functions
    in `.fns` (#6360).

    !end-bullet!
-   !begin-bullet!
    `consecutive_id()` for creating groups based on contiguous runs of
    the same values, like `data.table::rleid()` (#1534).

    !end-bullet!
-   !begin-bullet!
    `case_match()` is a "vectorised switch" variant of `case_when()`
    that matches on values rather than logical expressions. It is like a
    SQL "simple" `CASE WHEN` statement, whereas `case_when()` is like a
    SQL "searched" `CASE WHEN` statement (#6328).

    !end-bullet!
-   !begin-bullet!
    `cross_join()` is a more explicit and slightly more correct
    replacement for using `by = character()` during a join (#6604).

    !end-bullet!
-   !begin-bullet!
    `pick()` makes it easy to access a subset of columns from the
    current group. `pick()` is intended as a replacement for
    `across(.fns = NULL)`, `cur_data()`, and `cur_data_all()`. We feel
    that `pick()` is a much more evocative name when you are just trying
    to select a subset of columns from your data (#6204).

    !end-bullet!
-   !begin-bullet!
    `symdiff()` computes the symmetric difference (#4811).

    !end-bullet!

!end-bullets-7!

## Lifecycle changes

### Breaking changes

!begin-bullets-11!

-   !begin-bullet!
    `arrange()` and `group_by()` now use the C locale, not the system
    locale, when ordering or grouping character vectors. This brings
    *substantial* performance improvements, increases reproducibility
    across R sessions, makes dplyr more consistent with data.table, and
    we believe it should affect little existing code. If it does affect
    your code, you can use `options(dplyr.legacy_locale = TRUE)` to
    quickly revert to the previous behavior. However, in general, we
    instead recommend that you use the new `.locale` argument to
    precisely specify the desired locale. For a full explanation please
    read the associated grouping and ordering tidyups.

    !end-bullet!
-   !begin-bullet!
    `bench_tbls()`, `compare_tbls()`, `compare_tbls2()`, `eval_tbls()`,
    `eval_tbls2()`, `location()` and `changes()`, deprecated in 1.0.0,
    are now defunct (#6387).

    !end-bullet!
-   !begin-bullet!
    `frame_data()`, `data_frame_()`, `lst_()` and `tbl_sum()` are no
    longer re-exported from tibble (#6276, #6277, #6278, #6284).

    !end-bullet!
-   !begin-bullet!
    `select_vars()`, `rename_vars()`, `select_var()` and
    `current_vars()`, deprecated in 0.8.4, are now defunct (#6387).

    !end-bullet!

!end-bullets-11!

### Newly deprecated

!begin-bullets-12!

-   !begin-bullet!
    `across()`, `c_across()`, `if_any()`, and `if_all()` now require the
    `.cols` and `.fns` arguments. In general, we now recommend that you
    use `pick()` instead of an empty `across()` call or `across()` with
    no `.fns` (e.g. `across(c(x, y))`. (#6523).

    !begin-bullets-13!
    -   !begin-bullet!
        Relying on the previous default of `.cols = everything()` is
        deprecated. We have skipped the soft-deprecation stage in this
        case, because indirect usage of `across()` and friends in this
        way is rare.

        !end-bullet!
    -   !begin-bullet!
        Relying on the previous default of `.fns = NULL` is not yet
        formally soft-deprecated, because there was no good alternative
        until now, but it is discouraged and will be soft-deprecated in
        the next minor release.

        !end-bullet!

    !end-bullets-13!
    !end-bullet!
-   !begin-bullet!
    Passing `...` to `across()` is soft-deprecated because it's
    ambiguous when those arguments are evaluated. Now, instead of (e.g.)
    `across(a:b, mean, na.rm = TRUE)` you should write
    `across(a:b, ~ mean(.x, na.rm = TRUE))` (#6073).

    !end-bullet!
-   !begin-bullet!
    `all_equal()` is deprecated. We've advised against it for some time,
    and we explicitly recommend you use `all.equal()`, manually
    reordering the rows and columns as needed (#6324).

    !end-bullet!
-   !begin-bullet!
    `cur_data()` and `cur_data_all()` are soft-deprecated in favour of
    `pick()` (#6204).

    !end-bullet!
-   !begin-bullet!
    Using `by = character()` to perform a cross join is now
    soft-deprecated in favor of `cross_join()` (#6604).

    !end-bullet!
-   !begin-bullet!
    `filter()`ing with a 1-column matrix is deprecated (#6091).

    !end-bullet!
-   !begin-bullet!
    `progress_estimate()` is deprecated for all uses (#6387).

    !end-bullet!
-   !begin-bullet!
    Using `summarise()` to produce a 0 or \>1 row "summary" is
    deprecated in favor of the new `reframe()`. See the NEWS bullet
    about `reframe()` for more details (#6382).

    !end-bullet!
-   !begin-bullet!
    All functions deprecated in 1.0.0 (released April 2020) and earlier
    now warn every time you use them (#6387). This includes `combine()`,
    `src_local()`, `src_mysql()`, `src_postgres()`, `src_sqlite()`,
    `rename_vars_()`, `select_vars_()`, `summarise_each_()`,
    `mutate_each_()`, `as.tbl()`, `tbl_df()`, and a handful of older
    arguments. They are likely to be made defunct in the next major
    version (but not before mid 2024).

    !end-bullet!
-   !begin-bullet!
    `slice()`ing with a 1-column matrix is deprecated.

    !end-bullet!

!end-bullets-12!

### Newly superseded

!begin-bullets-14!

-   !begin-bullet!
    `recode()` is superseded in favour of `case_match()` (#6433).

    !end-bullet!
-   !begin-bullet!
    `recode_factor()` is superseded. We don't have a direct replacement
    for it yet, but we plan to add one to forcats. In the meantime you
    can often use `case_match(.ptype = factor(levels = ))` instead
    (#6433).

    !end-bullet!
-   !begin-bullet!
    `transmute()` is superseded in favour of `mutate(.keep = "none")`
    (#6414).

    !end-bullet!

!end-bullets-14!

### Newly stable

!begin-bullets-15!

-   !begin-bullet!
    The `.keep`, `.before`, and `.after` arguments to `mutate()` have
    moved from experimental to stable.

    !end-bullet!
-   !begin-bullet!
    The `rows_*()` family of functions have moved from experimental to
    stable.

    !end-bullet!

!end-bullets-15!

## vctrs

Many of dplyr's vector functions have been rewritten to make use of the
vctrs package, bringing greater consistency and improved performance.

!begin-bullets-16!

-   !begin-bullet!
    `between()` can now work with all vector types, not just numeric and
    date-time. Additionally, `left` and `right` can now also be vectors
    (with the same length as `x`), and `x`, `left`, and `right` are cast
    to the common type before the comparison is made (#6183, #6260,
    #6478).

    !end-bullet!
-   !begin-bullet!
    `case_when()` (#5106):

    !begin-bullets-17!
    -   !begin-bullet!
        Has a new `.default` argument that is intended to replace usage
        of `TRUE ~ default_value` as a more explicit and readable way to
        specify a default value. In the future, we will deprecate the
        unsafe recycling of the LHS inputs that allows `TRUE ~` to work,
        so we encourage you to switch to using `.default`.

        !end-bullet!
    -   !begin-bullet!
        No longer requires exact matching of the types of RHS values.
        For example, the following no longer requires you to use
        `NA_character_`.

        !begin-codeblock!
            x <- c("little", "unknown", "small", "missing", "large")

            case_when(
              x %in% c("little", "small") ~ "one",
              x %in% c("big", "large") ~ "two",
              x %in% c("missing", "unknown") ~ NA
            )

        !end-codeblock!
        !end-bullet!
    -   !begin-bullet!
        Supports a larger variety of RHS value types. For example, you
        can use a data frame to create multiple columns at once.

        !end-bullet!
    -   !begin-bullet!
        Has new `.ptype` and `.size` arguments which allow you to
        enforce a particular output type and size.

        !end-bullet!
    -   !begin-bullet!
        Has a better error when types or lengths were incompatible
        (#6261, #6206).

        !end-bullet!

    !end-bullets-17!
    !end-bullet!
-   !begin-bullet!
    `coalesce()` (#6265):

    !begin-bullets-18!
    -   !begin-bullet!
        Discards `NULL` inputs up front.

        !end-bullet!
    -   !begin-bullet!
        No longer iterates over the columns of data frame input.
        Instead, a row is now only coalesced if it is entirely missing,
        which is consistent with `vctrs::vec_detect_missing()` and
        greatly simplifies the implementation.

        !end-bullet!
    -   !begin-bullet!
        Has new `.ptype` and `.size` arguments which allow you to
        enforce a particular output type and size.

        !end-bullet!

    !end-bullets-18!
    !end-bullet!
-   !begin-bullet!
    `first()`, `last()`, and `nth()` (#6331):

    !begin-bullets-19!
    -   !begin-bullet!
        When used on a data frame, these functions now return a single
        row rather than a single column. This is more consistent with
        the vctrs principle that a data frame is generally treated as a
        vector of rows.

        !end-bullet!
    -   !begin-bullet!
        The `default` is no longer "guessed", and will always
        automatically be set to a missing value appropriate for the type
        of `x`.

        !end-bullet!
    -   !begin-bullet!
        Error if `n` is not an integer. `nth(x, n = 2)` is fine, but
        `nth(x, n = 2.5)` is now an error.

        !end-bullet!
    -   !begin-bullet!
        No longer support indexing into scalar objects, like `<lm>` or
        scalar S4 objects (#6670).

        !end-bullet!

    !end-bullets-19!
    Additionally, they have all gained an `na_rm` argument since they
    are summary functions (#6242, with contributions from @tnederlof).

    !end-bullet!
-   !begin-bullet!
    `if_else()` gains most of the same benefits as `case_when()`. In
    particular, `if_else()` now takes the common type of `true`,
    `false`, and `missing` to determine the output type, meaning that
    you can now reliably use `NA`, rather than `NA_character_` and
    friends (#6243).

    `if_else()` also no longer allows you to supply `NULL` for either
    `true` or `false`, which was an undocumented usage that we consider
    to be off-label, because `true` and `false` are intended to be (and
    documented to be) vector inputs (#6730).

    !end-bullet!
-   !begin-bullet!
    `na_if()` (#6329) now casts `y` to the type of `x` before
    comparison, which makes it clearer that this function is type and
    size stable on `x`. In particular, this means that you can no longer
    do `na_if(<tibble>, 0)`, which previously accidentally allowed you
    to replace any instance of `0` across every column of the tibble
    with `NA`. `na_if()` was never intended to work this way, and this
    is considered off-label usage.

    You can also now replace `NaN` values in `x` with `na_if(x, NaN)`.

    !end-bullet!
-   !begin-bullet!
    `lag()` and `lead()` now cast `default` to the type of `x`, rather
    than taking the common type. This ensures that these functions are
    type stable on `x` (#6330).

    !end-bullet!
-   !begin-bullet!
    `row_number()`, `min_rank()`, `dense_rank()`, `ntile()`,
    `cume_dist()`, and `percent_rank()` are faster and work for more
    types. You can now rank by multiple columns by supplying a data
    frame (#6428).

    !end-bullet!
-   !begin-bullet!
    `with_order()` now checks that the size of `order_by` is the same
    size as `x`, and now works correctly when `order_by` is a data frame
    (#6334).

    !end-bullet!

!end-bullets-16!

## Minor improvements and bug fixes

!begin-bullets-20!

-   !begin-bullet!
    Fixed an issue with latest rlang that caused internal tools (such as
    `mask$eval_all_summarise()`) to be mentioned in error messages
    (#6308).

    !end-bullet!
-   !begin-bullet!
    Warnings are enriched with contextualised information in
    `summarise()` and `filter()` just like they have been in `mutate()`
    and `arrange()`.

    !end-bullet!
-   !begin-bullet!
    Joins now reference the correct column in `y` when a type error is
    thrown while joining on two columns with different names (#6465).

    !end-bullet!
-   !begin-bullet!
    Joins on very wide tables are no longer bottlenecked by the
    application of `suffix` (#6642).

    !end-bullet!
-   !begin-bullet!
    `*_join()` now error if you supply them with additional arguments
    that aren't used (#6228).

    !end-bullet!
-   !begin-bullet!
    `across()` used without functions inside a rowwise-data frame no
    longer generates an invalid data frame (#6264).

    !end-bullet!
-   !begin-bullet!
    Anonymous functions supplied with `function()` and `\()` are now
    inlined by `across()` if possible, which slightly improves
    performance and makes possible further optimisations in the future.

    !end-bullet!
-   !begin-bullet!
    Functions supplied to `across()` are no longer masked by columns
    (#6545). For instance, `across(1:2, mean)` will now work as expected
    even if there is a column called `mean`.

    !end-bullet!
-   !begin-bullet!
    `across()` will now error when supplied `...` without a `.fns`
    argument (#6638).

    !end-bullet!
-   !begin-bullet!
    `arrange()` now correctly ignores `NULL` inputs (#6193).

    !end-bullet!
-   !begin-bullet!
    `arrange()` now works correctly when `across()` calls are used as
    the 2nd (or more) ordering expression (#6495).

    !end-bullet!
-   !begin-bullet!
    `arrange(df, mydesc::desc(x))` works correctly when mydesc
    re-exports `dplyr::desc()` (#6231).

    !end-bullet!
-   !begin-bullet!
    `c_across()` now evaluates `all_of()` correctly and no longer allows
    you to accidentally select grouping variables (#6522).

    !end-bullet!
-   !begin-bullet!
    `c_across()` now throws a more informative error if you try to
    rename during column selection (#6522).

    !end-bullet!
-   !begin-bullet!
    dplyr no longer provides `count()` and `tally()` methods for
    `tbl_sql`. These methods have been accidentally overriding the
    `tbl_lazy` methods that dbplyr provides, which has resulted in
    issues with the grouping structure of the output (#6338,
    tidyverse/dbplyr#940).

    !end-bullet!
-   !begin-bullet!
    `cur_group()` now works correctly with zero row grouped data frames
    (#6304).

    !end-bullet!
-   !begin-bullet!
    `desc()` gives a useful error message if you give it a non-vector
    (#6028).

    !end-bullet!
-   !begin-bullet!
    `distinct()` now retains attributes of bare data frames (#6318).

    !end-bullet!
-   !begin-bullet!
    `distinct()` returns columns ordered the way you request, not the
    same as the input data (#6156).

    !end-bullet!
-   !begin-bullet!
    Error messages in `group_by()`, `distinct()`, `tally()`, and
    `count()` are now more relevant (#6139).

    !end-bullet!
-   !begin-bullet!
    `group_by_prepare()` loses the `caller_env` argument. It was rarely
    used and it is no longer needed (#6444).

    !end-bullet!
-   !begin-bullet!
    `group_walk()` gains an explicit `.keep` argument (#6530).

    !end-bullet!
-   !begin-bullet!
    Warnings emitted inside `mutate()` and variants are now collected
    and stashed away. Run the new `last_dplyr_warnings()` function to
    see the warnings emitted within dplyr verbs during the last
    top-level command.

    This fixes performance issues when thousands of warnings are emitted
    with rowwise and grouped data frames (#6005, #6236).

    !end-bullet!
-   !begin-bullet!
    `mutate()` behaves a little better with 0-row rowwise inputs
    (#6303).

    !end-bullet!
-   !begin-bullet!
    A rowwise `mutate()` now automatically unlists list-columns
    containing length 1 vectors (#6302).

    !end-bullet!
-   !begin-bullet!
    `nest_join()` has gained the `na_matches` argument that all other
    joins have.

    !end-bullet!
-   !begin-bullet!
    `nest_join()` now preserves the type of `y` (#6295).

    !end-bullet!
-   !begin-bullet!
    `n_distinct()` now errors if you don't give it any input (#6535).

    !end-bullet!
-   !begin-bullet!
    `nth()`, `first()`, `last()`, and `with_order()` now sort character
    `order_by` vectors in the C locale. Using character vectors for
    `order_by` is rare, so we expect this to have little practical
    impact (#6451).

    !end-bullet!
-   !begin-bullet!
    `ntile()` now requires `n` to be a single positive integer.

    !end-bullet!
-   !begin-bullet!
    `relocate()` now works correctly with empty data frames and when
    `.before` or `.after` result in empty selections (#6167).

    !end-bullet!
-   !begin-bullet!
    `relocate()` no longer drops attributes of bare data frames (#6341).

    !end-bullet!
-   !begin-bullet!
    `relocate()` now retains the last name change when a single column
    is renamed multiple times while it is being moved. This better
    matches the behavior of `rename()` (#6209, with help from @eutwt).

    !end-bullet!
-   !begin-bullet!
    `rename()` now contains examples of using `all_of()` and `any_of()`
    to rename using a named character vector (#6644).

    !end-bullet!
-   !begin-bullet!
    `rename_with()` now disallows renaming in the `.cols` tidy-selection
    (#6561).

    !end-bullet!
-   !begin-bullet!
    `rename_with()` now checks that the result of `.fn` is the right
    type and size (#6561).

    !end-bullet!
-   !begin-bullet!
    `rows_insert()` now checks that `y` contains the `by` columns
    (#6652).

    !end-bullet!
-   !begin-bullet!
    `setequal()` ignores differences between freely coercible types
    (e.g. integer and double) (#6114) and ignores duplicated rows
    (#6057).

    !end-bullet!
-   !begin-bullet!
    `slice()` helpers again produce output equivalent to
    `slice(.data, 0)` when the `n` or `prop` argument is 0, fixing a bug
    introduced in the previous version (@eutwt, #6184).

    !end-bullet!
-   !begin-bullet!
    `slice()` with no inputs now returns 0 rows. This is mostly for
    theoretical consistency (#6573).

    !end-bullet!
-   !begin-bullet!
    `slice()` now errors if any expressions in `...` are named. This
    helps avoid accidentally misspelling an optional argument, such as
    `.by` (#6554).

    !end-bullet!
-   !begin-bullet!
    `slice_*()` now requires `n` to be an integer.

    !end-bullet!
-   !begin-bullet!
    `slice_*()` generics now perform argument validation. This should
    make methods more consistent and simpler to implement (#6361).

    !end-bullet!
-   !begin-bullet!
    `slice_min()` and `slice_max()` can `order_by` multiple variables if
    you supply them as a data.frame or tibble (#6176).

    !end-bullet!
-   !begin-bullet!
    `slice_min()` and `slice_max()` now consistently include missing
    values in the result if necessary (i.e. there aren't enough
    non-missing values to reach the `n` or `prop` you have selected). If
    you don't want missing values to be included at all, set
    `na_rm = TRUE` (#6177).

    !end-bullet!
-   !begin-bullet!
    `slice_sample()` now accepts negative `n` and `prop` values (#6402).

    !end-bullet!
-   !begin-bullet!
    `slice_sample()` returns a data frame or group with the same number
    of rows as the input when `replace = FALSE` and `n` is larger than
    the number of rows or `prop` is larger than 1. This reverts a change
    made in 1.0.8, returning to the behavior of 1.0.7 (#6185)

    !end-bullet!
-   !begin-bullet!
    `slice_sample()` now gives a more informative error when
    `replace = FALSE` and the number of rows requested in the sample
    exceeds the number of rows in the data (#6271).

    !end-bullet!
-   !begin-bullet!
    `storms` has been updated to include 2021 data and some missing
    storms that were omitted due to an error (@steveharoz, #6320).

    !end-bullet!
-   !begin-bullet!
    `summarise()` now correctly recycles named 0-column data frames
    (#6509).

    !end-bullet!
-   !begin-bullet!
    `union_all()`, like `union()`, now requires that data frames be
    compatible: i.e. they have the same columns, and the columns have
    compatible types.

    !end-bullet!
-   !begin-bullet!
    `where()` is re-exported from tidyselect (#6597).

    !end-bullet!

!end-bullets-20!

# dplyr 1.0.10

Hot patch release to resolve R CMD check failures.

# dplyr 1.0.9

!begin-bullets-21!

-   !begin-bullet!
    New `rows_append()` which works like `rows_insert()` but ignores
    keys and allows you to insert arbitrary rows with a guarantee that
    the type of `x` won't change (#6249, thanks to @krlmlr for the
    implementation and @mgirlich for the idea).

    !end-bullet!
-   !begin-bullet!
    The `rows_*()` functions no longer require that the key values in
    `x` uniquely identify each row. Additionally, `rows_insert()` and
    `rows_delete()` no longer require that the key values in `y`
    uniquely identify each row. Relaxing this restriction should make
    these functions more practically useful for data frames, and
    alternative backends can enforce this in other ways as needed
    (i.e. through primary keys) (#5553).

    !end-bullet!
-   !begin-bullet!
    `rows_insert()` gained a new `conflict` argument allowing you
    greater control over rows in `y` with keys that conflict with keys
    in `x`. A conflict arises if a key in `y` already exists in `x`. By
    default, a conflict results in an error, but you can now also
    `"ignore"` these `y` rows. This is very similar to the
    `ON CONFLICT DO NOTHING` command from SQL (#5588, with helpful
    additions from @mgirlich and @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `rows_update()`, `rows_patch()`, and `rows_delete()` gained a new
    `unmatched` argument allowing you greater control over rows in `y`
    with keys that are unmatched by the keys in `x`. By default, an
    unmatched key results in an error, but you can now also `"ignore"`
    these `y` rows (#5984, #5699).

    !end-bullet!
-   !begin-bullet!
    `rows_delete()` no longer requires that the columns of `y` be a
    strict subset of `x`. Only the columns specified through `by` will
    be utilized from `y`, all others will be dropped with a message.

    !end-bullet!
-   !begin-bullet!
    The `rows_*()` functions now always retain the column types of `x`.
    This behavior was documented, but previously wasn't being applied
    correctly (#6240).

    !end-bullet!
-   !begin-bullet!
    The `rows_*()` functions now fail elegantly if `y` is a zero column
    data frame and `by` isn't specified (#6179).

    !end-bullet!

!end-bullets-21!

# dplyr 1.0.8

!begin-bullets-22!

-   !begin-bullet!
    Better display of error messages thanks to rlang 1.0.0.

    !end-bullet!
-   !begin-bullet!
    `mutate(.keep = "none")` is no longer identical to `transmute()`.
    `transmute()` has not been changed, and completely ignores the
    column ordering of the existing data, instead relying on the
    ordering of expressions supplied through `...`.
    `mutate(.keep = "none")` has been changed to ensure that
    pre-existing columns are never moved, which aligns more closely with
    the other `.keep` options (#6086).

    !end-bullet!
-   !begin-bullet!
    `filter()` forbids matrix results (#5973) and warns about data frame
    results, especially data frames created from `across()` with a hint
    to use `if_any()` or `if_all()`.

    !end-bullet!
-   !begin-bullet!
    `slice()` helpers (`slice_head()`, `slice_tail()`, `slice_min()`,
    `slice_max()`) now accept negative values for `n` and `prop`
    (#5961).

    !end-bullet!
-   !begin-bullet!
    `slice()` now indicates which group produces an error (#5931).

    !end-bullet!
-   !begin-bullet!
    `cur_data()` and `cur_data_all()` don't simplify list columns in
    rowwise data frames (#5901).

    !end-bullet!
-   !begin-bullet!
    dplyr now uses `rlang::check_installed()` to prompt you whether to
    install required packages that are missing.

    !end-bullet!
-   !begin-bullet!
    `storms` data updated to 2020 (@steveharoz, #5899).

    !end-bullet!
-   !begin-bullet!
    `coalesce()` accepts 1-D arrays (#5557).

    !end-bullet!
-   !begin-bullet!
    The deprecated `trunc_mat()` is no longer reexported from dplyr
    (#6141).

    !end-bullet!

!end-bullets-22!

# dplyr 1.0.7

!begin-bullets-23!

-   !begin-bullet!
    `across()` uses the formula environment when inlining them (#5886).

    !end-bullet!
-   !begin-bullet!
    `summarise.rowwise_df()` is quiet when the result is ungrouped
    (#5875).

    !end-bullet!
-   !begin-bullet!
    `c_across()` and `across()` key deparsing not confused by long calls
    (#5883).

    !end-bullet!
-   !begin-bullet!
    `across()` handles named selections (#5207).

    !end-bullet!

!end-bullets-23!

# dplyr 1.0.6

!begin-bullets-24!

-   !begin-bullet!
    `add_count()` is now generic (#5837).

    !end-bullet!
-   !begin-bullet!
    `if_any()` and `if_all()` abort when a predicate is mistakingly used
    as `.cols=` (#5732).

    !end-bullet!
-   !begin-bullet!
    Multiple calls to `if_any()` and/or `if_all()` in the same
    expression are now properly disambiguated (#5782).

    !end-bullet!
-   !begin-bullet!
    `filter()` now inlines `if_any()` and `if_all()` expressions. This
    greatly improves performance with grouped data frames.

    !end-bullet!
-   !begin-bullet!
    Fixed behaviour of `...` in top-level `across()` calls (#5813,
    #5832).

    !end-bullet!
-   !begin-bullet!
    `across()` now inlines lambda-formulas. This is slightly more
    performant and will allow more optimisations in the future.

    !end-bullet!
-   !begin-bullet!
    Fixed issue in `bind_rows()` causing lists to be incorrectly
    transformed as data frames (#5417, #5749).

    !end-bullet!
-   !begin-bullet!
    `select()` no longer creates duplicate variables when renaming a
    variable to the same name as a grouping variable (#5841).

    !end-bullet!
-   !begin-bullet!
    `dplyr_col_select()` keeps attributes for bare data frames (#5294,
    #5831).

    !end-bullet!
-   !begin-bullet!
    Fixed quosure handling in `dplyr::group_by()` that caused issues
    with extra arguments (tidyverse/lubridate#959).

    !end-bullet!
-   !begin-bullet!
    Removed the `name` argument from the `compute()` generic (@ianmcook,
    #5783).

    !end-bullet!
-   !begin-bullet!
    row-wise data frames of 0 rows and list columns are supported again
    (#5804).

    !end-bullet!

!end-bullets-24!

# dplyr 1.0.5

!begin-bullets-25!

-   !begin-bullet!
    Fixed edge case of `slice_sample()` when `weight_by=` is used and
    there 0 rows (#5729).

    !end-bullet!
-   !begin-bullet!
    `across()` can again use columns in functions defined inline
    (#5734).

    !end-bullet!
-   !begin-bullet!
    Using testthat 3rd edition.

    !end-bullet!
-   !begin-bullet!
    Fixed bugs introduced in `across()` in previous version (#5765).

    !end-bullet!
-   !begin-bullet!
    `group_by()` keeps attributes unrelated to the grouping (#5760).

    !end-bullet!
-   !begin-bullet!
    The `.cols=` argument of `if_any()` and `if_all()` defaults to
    `everything()`.

    !end-bullet!

!end-bullets-25!

# dplyr 1.0.4

!begin-bullets-26!

-   !begin-bullet!
    Improved performance for `across()`. This makes
    `summarise(across())` and `mutate(across())` perform as well as the
    superseded colwise equivalents (#5697).

    !end-bullet!
-   !begin-bullet!
    New functions `if_any()` and `if_all()` (#4770, #5713).

    !end-bullet!
-   !begin-bullet!
    `summarise()` silently ignores NULL results (#5708).

    !end-bullet!
-   !begin-bullet!
    Fixed a performance regression in `mutate()` when warnings occur
    once per group (#5675). We no longer instrument warnings with
    debugging information when `mutate()` is called within
    `suppressWarnings()`.

    !end-bullet!

!end-bullets-26!

# dplyr 1.0.3

!begin-bullets-27!

-   !begin-bullet!
    `summarise()` no longer informs when the result is ungrouped
    (#5633).

    !end-bullet!
-   !begin-bullet!
    `group_by(.drop = FALSE)` preserves ordered factors (@brianrice2,
    #5545).

    !end-bullet!
-   !begin-bullet!
    `count()` and `tally()` are now generic.

    !end-bullet!
-   !begin-bullet!
    Removed default fallbacks to lazyeval methods; this will yield
    better error messages when you call a dplyr function with the wrong
    input, and is part of our long term plan to remove the deprecated
    lazyeval interface.

    !end-bullet!
-   !begin-bullet!
    `inner_join()` gains a `keep` parameter for consistency with the
    other mutating joins (@patrickbarks, #5581).

    !end-bullet!
-   !begin-bullet!
    Improved performance with many columns, with a dynamic data mask
    using active bindings and lazy chops (#5017).

    !end-bullet!
-   !begin-bullet!
    `mutate()` and friends preserves row names in data frames once more
    (#5418).

    !end-bullet!
-   !begin-bullet!
    `group_by()` uses the ungrouped data for the implicit mutate step
    (#5598). You might have to define an `ungroup()` method for custom
    classes. For example, see https://github.com/hadley/cubelyr/pull/3.

    !end-bullet!
-   !begin-bullet!
    `relocate()` can rename columns it relocates (#5569).

    !end-bullet!
-   !begin-bullet!
    `distinct()` and `group_by()` have better error messages when the
    mutate step fails (#5060).

    !end-bullet!
-   !begin-bullet!
    Clarify that `between()` is not vectorised (#5493).

    !end-bullet!
-   !begin-bullet!
    Fixed `across()` issue where data frame columns would could not be
    referred to with `all_of()` in the nested case (`mutate()` within
    `mutate()`) (#5498).

    !end-bullet!
-   !begin-bullet!
    `across()` handles data frames with 0 columns (#5523).

    !end-bullet!
-   !begin-bullet!
    `mutate()` always keeps grouping variables, unconditional to
    `.keep=` (#5582).

    !end-bullet!
-   !begin-bullet!
    dplyr now depends on R 3.3.0

    !end-bullet!

!end-bullets-27!

# dplyr 1.0.2

!begin-bullets-28!

-   !begin-bullet!
    Fixed `across()` issue where data frame columns would mask objects
    referred to from `all_of()` (#5460).

    !end-bullet!
-   !begin-bullet!
    `bind_cols()` gains a `.name_repair` argument, passed to
    `vctrs::vec_cbind()` (#5451)

    !end-bullet!
-   !begin-bullet!
    `summarise(.groups = "rowwise")` makes a rowwise data frame even if
    the input data is not grouped (#5422).

    !end-bullet!

!end-bullets-28!

# dplyr 1.0.1

!begin-bullets-29!

-   !begin-bullet!
    New function `cur_data_all()` similar to `cur_data()` but includes
    the grouping variables (#5342).

    !end-bullet!
-   !begin-bullet!
    `count()` and `tally()` no longer automatically weights by column
    `n` if present (#5298). dplyr 1.0.0 introduced this behaviour
    because of Hadley's faulty memory. Historically `tally()`
    automatically weighted and `count()` did not, but this behaviour was
    accidentally changed in 0.8.2 (#4408) so that neither automatically
    weighted by `n`. Since 0.8.2 is almost a year old, and the
    automatically weighting behaviour was a little confusing anyway,
    we've removed it from both `count()` and `tally()`.

    Use of `wt = n()` is now deprecated; now just omit the `wt`
    argument.

    !end-bullet!
-   !begin-bullet!
    `coalesce()` now supports data frames correctly (#5326).

    !end-bullet!
-   !begin-bullet!
    `cummean()` no longer has off-by-one indexing problem (@cropgen,
    #5287).

    !end-bullet!
-   !begin-bullet!
    The call stack is preserved on error. This makes it possible to
    `recover()` into problematic code called from dplyr verbs (#5308).

    !end-bullet!

!end-bullets-29!

# dplyr 1.0.0

## Breaking changes

!begin-bullets-30!

-   !begin-bullet!
    `bind_cols()` no longer converts to a tibble, returns a data frame
    if the input is a data frame.

    !end-bullet!
-   !begin-bullet!
    `bind_rows()`, `*_join()`, `summarise()` and `mutate()` use vctrs
    coercion rules. There are two main user facing changes:

    !begin-bullets-31!
    -   !begin-bullet!
        Combining factor and character vectors silently creates a
        character vector; previously it created a character vector with
        a warning.

        !end-bullet!
    -   !begin-bullet!
        Combining multiple factors creates a factor with combined
        levels; previously it created a character vector with a warning.

        !end-bullet!

    !end-bullets-31!
    !end-bullet!
-   !begin-bullet!
    `bind_rows()` and other functions use vctrs name repair, see
    `?vctrs::vec_as_names`.

    !end-bullet!
-   !begin-bullet!
    `all.equal.tbl_df()` removed.

    !begin-bullets-32!
    -   !begin-bullet!
        Data frames, tibbles and grouped data frames are no longer
        considered equal, even if the data is the same.

        !end-bullet!
    -   !begin-bullet!
        Equality checks for data frames no longer ignore row order or
        groupings.

        !end-bullet!
    -   !begin-bullet!
        `expect_equal()` uses `all.equal()` internally. When comparing
        data frames, tests that used to pass may now fail.

        !end-bullet!

    !end-bullets-32!
    !end-bullet!
-   !begin-bullet!
    `distinct()` keeps the original column order.

    !end-bullet!
-   !begin-bullet!
    `distinct()` on missing columns now raises an error, it has been a
    compatibility warning for a long time.

    !end-bullet!
-   !begin-bullet!
    `group_modify()` puts the grouping variable to the front.

    !end-bullet!
-   !begin-bullet!
    `n()` and `row_number()` can no longer be called directly when dplyr
    is not loaded, and this now generates an error:
    `dplyr::mutate(mtcars, x = n())`.

    Fix by prefixing with `dplyr::` as in
    `dplyr::mutate(mtcars, x = dplyr::n())`

    !end-bullet!
-   !begin-bullet!
    The old data format for `grouped_df` is no longer supported. This
    may affect you if you have serialized grouped data frames to disk,
    e.g. with `saveRDS()` or when using knitr caching.

    !end-bullet!
-   !begin-bullet!
    `lead()` and `lag()` are stricter about their inputs.

    !end-bullet!
-   !begin-bullet!
    Extending data frames requires that the extra class or classes are
    added first, not last. Having the extra class at the end causes some
    vctrs operations to fail with a message like:

    !begin-codeblock!
        Input must be a vector, not a `<data.frame/...>` object

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `right_join()` no longer sorts the rows of the resulting tibble
    according to the order of the RHS `by` argument in tibble `y`.

    !end-bullet!

!end-bullets-30!

## New features

!begin-bullets-33!

-   !begin-bullet!
    The `cur_` functions (`cur_data()`, `cur_group()`, `cur_group_id()`,
    `cur_group_rows()`) provide a full set of options to you access
    information about the "current" group in dplyr verbs. They are
    inspired by data.table's `.SD`, `.GRP`, `.BY`, and `.I`.

    !end-bullet!
-   !begin-bullet!
    The `rows_` functions (`rows_insert()`, `rows_update()`,
    `rows_upsert()`, `rows_patch()`, `rows_delete()`) provide a new API
    to insert and delete rows from a second data frame or table. Support
    for updating mutable backends is planned (#4654).

    !end-bullet!
-   !begin-bullet!
    `mutate()` and `summarise()` create multiple columns from a single
    expression if you return a data frame (#2326).

    !end-bullet!
-   !begin-bullet!
    `select()` and `rename()` use the latest version of the tidyselect
    interface. Practically, this means that you can now combine
    selections using Boolean logic (i.e. `!`, `&` and `|`), and use
    predicate functions with `where()` (e.g. `where(is.character)`) to
    select variables by type (#4680). It also makes it possible to use
    `select()` and `rename()` to repair data frames with duplicated
    names (#4615) and prevents you from accidentally introducing
    duplicate names (#4643). This also means that dplyr now re-exports
    `any_of()` and `all_of()` (#5036).

    !end-bullet!
-   !begin-bullet!
    `slice()` gains a new set of helpers:

    !begin-bullets-34!
    -   !begin-bullet!
        `slice_head()` and `slice_tail()` select the first and last
        rows, like `head()` and `tail()`, but return `n` rows *per
        group*.

        !end-bullet!
    -   !begin-bullet!
        `slice_sample()` randomly selects rows, taking over from
        `sample_frac()` and `sample_n()`.

        !end-bullet!
    -   !begin-bullet!
        `slice_min()` and `slice_max()` select the rows with the minimum
        or maximum values of a variable, taking over from the confusing
        `top_n()`.

        !end-bullet!

    !end-bullets-34!
    !end-bullet!
-   !begin-bullet!
    `summarise()` can create summaries of greater than length 1 if you
    use a summary function that returns multiple values.

    !end-bullet!
-   !begin-bullet!
    `summarise()` gains a `.groups=` argument to control the grouping
    structure.

    !end-bullet!
-   !begin-bullet!
    New `relocate()` verb makes it easy to move columns around within a
    data frame (#4598).

    !end-bullet!
-   !begin-bullet!
    New `rename_with()` is designed specifically for the purpose of
    renaming selected columns with a function (#4771).

    !end-bullet!
-   !begin-bullet!
    `ungroup()` can now selectively remove grouping variables (#3760).

    !end-bullet!
-   !begin-bullet!
    `pull()` can now return named vectors by specifying an additional
    column name (@ilarischeinin, #4102).

    !end-bullet!

!end-bullets-33!

## Experimental features

!begin-bullets-35!

-   !begin-bullet!
    `mutate()` (for data frames only), gains experimental new arguments
    `.before` and `.after` that allow you to control where the new
    columns are placed (#2047).

    !end-bullet!
-   !begin-bullet!
    `mutate()` (for data frames only), gains an experimental new
    argument called `.keep` that allows you to control which variables
    are kept from the input `.data`. `.keep = "all"` is the default; it
    keeps all variables. `.keep = "none"` retains no input variables
    (except for grouping keys), so behaves like `transmute()`.
    `.keep = "unused"` keeps only variables not used to make new
    columns. `.keep = "used"` keeps only the input variables used to
    create new columns; it's useful for double checking your work
    (#3721).

    !end-bullet!
-   !begin-bullet!
    New, experimental, `with_groups()` makes it easy to temporarily
    group or ungroup (#4711).

    !end-bullet!

!end-bullets-35!

## across()

!begin-bullets-36!

-   !begin-bullet!
    New function `across()` that can be used inside `summarise()`,
    `mutate()`, and other verbs to apply a function (or a set of
    functions) to a selection of columns. See `vignette("colwise")` for
    more details.

    !end-bullet!
-   !begin-bullet!
    New function `c_across()` that can be used inside `summarise()` and
    `mutate()` in row-wise data frames to easily (e.g.) compute a
    row-wise mean of all numeric variables. See `vignette("rowwise")`
    for more details.

    !end-bullet!

!end-bullets-36!

## rowwise()

!begin-bullets-37!

-   !begin-bullet!
    `rowwise()` is no longer questioning; we now understand that it's an
    important tool when you don't have vectorised code. It now also
    allows you to specify additional variables that should be preserved
    in the output when summarising (#4723). The rowwise-ness is
    preserved by all operations; you need to explicit drop it with
    `as_tibble()` or `group_by()`.

    !end-bullet!
-   !begin-bullet!
    New, experimental, `nest_by()`. It has the same interface as
    `group_by()`, but returns a rowwise data frame of grouping keys,
    supplemental with a list-column of data frames containing the rest
    of the data.

    !end-bullet!

!end-bullets-37!

## vctrs

!begin-bullets-38!

-   !begin-bullet!
    The implementation of all dplyr verbs have been changed to use
    primitives provided by the vctrs package. This makes it easier to
    add support for new types of vector, radically simplifies the
    implementation, and makes all dplyr verbs more consistent.

    !end-bullet!
-   !begin-bullet!
    The place where you are mostly likely to be impacted by the coercion
    changes is when working with factors in joins or grouped mutates:
    now when combining factors with different levels, dplyr creates a
    new factor with the union of the levels. This matches base R more
    closely, and while perhaps strictly less correct, is much more
    convenient.

    !end-bullet!
-   !begin-bullet!
    dplyr dropped its two heaviest dependencies: Rcpp and BH. This
    should make it considerably easier and faster to build from source.

    !end-bullet!
-   !begin-bullet!
    The implementation of all verbs has been carefully thought through.
    This mostly makes implementation simpler but should hopefully
    increase consistency, and also makes it easier to adapt to dplyr to
    new data structures in the new future. Pragmatically, the biggest
    difference for most people will be that each verb documents its
    return value in terms of rows, columns, groups, and data frame
    attributes.

    !end-bullet!
-   !begin-bullet!
    Row names are now preserved when working with data frames.

    !end-bullet!

!end-bullets-38!

## Grouping

!begin-bullets-39!

-   !begin-bullet!
    `group_by()` uses hashing from the `vctrs` package.

    !end-bullet!
-   !begin-bullet!
    Grouped data frames now have `names<-`, `[[<-`, `[<-` and `$<-`
    methods that re-generate the underlying grouping. Note that
    modifying grouping variables in multiple steps
    (i.e. `df$grp1 <- 1; df$grp2 <- 1`) will be inefficient since the
    data frame will be regrouped after each modification.

    !end-bullet!
-   !begin-bullet!
    `[.grouped_df` now regroups to respect any grouping columns that
    have been removed (#4708).

    !end-bullet!
-   !begin-bullet!
    `mutate()` and `summarise()` can now modify grouping variables
    (#4709).

    !end-bullet!
-   !begin-bullet!
    `group_modify()` works with additional arguments (@billdenney and
    @cderv, #4509)

    !end-bullet!
-   !begin-bullet!
    `group_by()` does not create an arbitrary NA group when grouping by
    factors with `drop = TRUE` (#4460).

    !end-bullet!

!end-bullets-39!

## Lifecycle changes

!begin-bullets-40!

-   !begin-bullet!
    All deprecations now use the lifecycle, that means by default you'll
    only see a deprecation warning once per session, and you can control
    with `options(lifecycle_verbosity = x)` where `x` is one of NULL,
    "quiet", "warning", and "error".
    !end-bullet!

!end-bullets-40!

### Removed

!begin-bullets-41!

-   !begin-bullet!
    `id()`, deprecated in dplyr 0.5.0, is now defunct.

    !end-bullet!
-   !begin-bullet!
    `failwith()`, deprecated in dplyr 0.7.0, is now defunct.

    !end-bullet!
-   !begin-bullet!
    `tbl_cube()` and `nasa` have been pulled out into a separate cubelyr
    package (#4429).

    !end-bullet!
-   !begin-bullet!
    `rbind_all()` and `rbind_list()` have been removed (@bjungbogati,
    #4430).

    !end-bullet!
-   !begin-bullet!
    `dr_dplyr()` has been removed as it is no longer needed (#4433,
    @smwindecker).

    !end-bullet!

!end-bullets-41!

### Deprecated

!begin-bullets-42!

-   !begin-bullet!
    Use of pkgconfig for setting `na_matches` argument to join functions
    is now deprecated (#4914). This was rarely used, and I'm now
    confident that the default is correct for R.

    !end-bullet!
-   !begin-bullet!
    In `add_count()`, the `drop` argument has been deprecated because it
    didn't actually affect the output.

    !end-bullet!
-   !begin-bullet!
    `add_rownames()`: please use `tibble::rownames_to_column()` instead.

    !end-bullet!
-   !begin-bullet!
    `as.tbl()` and `tbl_df()`: please use `as_tibble()` instead.

    !end-bullet!
-   !begin-bullet!
    `bench_tbls()`, `compare_tbls()`, `compare_tbls2()`, `eval_tbls()`
    and `eval_tbls2()` are now deprecated. That were only used in a
    handful of packages, and we now believe that you're better off
    performing comparisons more directly (#4675).

    !end-bullet!
-   !begin-bullet!
    `combine()`: please use `vctrs::vec_c()` instead.

    !end-bullet!
-   !begin-bullet!
    `funs()`: please use `list()` instead.

    !end-bullet!
-   !begin-bullet!
    `group_by(add = )`: please use `.add` instead.

    !end-bullet!
-   !begin-bullet!
    `group_by(.dots = )`/`group_by_prepare(.dots = )`: please use `!!!`
    instead (#4734).

    !end-bullet!
-   !begin-bullet!
    The use of zero-arg `group_indices()` to retrieve the group id for
    the "current" group is deprecated; instead use `cur_group_id()`.

    !end-bullet!
-   !begin-bullet!
    Passing arguments to `group_keys()` or `group_indices()` to change
    the grouping has been deprecated, instead do grouping first
    yourself.

    !end-bullet!
-   !begin-bullet!
    `location()` and `changes()`: please use `lobstr::ref()` instead.

    !end-bullet!
-   !begin-bullet!
    `progress_estimated()` is soft deprecated; it's not the
    responsibility of dplyr to provide progress bars (#4935).

    !end-bullet!
-   !begin-bullet!
    `src_local()` has been deprecated; it was part of an approach to
    testing dplyr backends that didn't pan out.

    !end-bullet!
-   !begin-bullet!
    `src_mysql()`, `src_postgres()`, and `src_sqlite()` has been
    deprecated. We've recommended against them for some time. Instead
    please use the approach described at https://dbplyr.tidyverse.org/.

    !end-bullet!
-   !begin-bullet!
    `select_vars()`, `rename_vars()`, `select_var()`, `current_vars()`
    are now deprecated (@perezp44, #4432)

    !end-bullet!

!end-bullets-42!

### Superseded

!begin-bullets-43!

-   !begin-bullet!
    The scoped helpers (all functions ending in `_if`, `_at`, or `_all`)
    have been superseded by `across()`. This dramatically reduces the
    API surface for dplyr, while at the same providing providing a more
    flexible and less error-prone interface (#4769).

    `rename_*()` and `select_*()` have been superseded by
    `rename_with()`.

    !end-bullet!
-   !begin-bullet!
    `do()` is superseded in favour of `summarise()`.

    !end-bullet!
-   !begin-bullet!
    `sample_n()` and `sample_frac()` have been superseded by
    `slice_sample()`. See `?sample_n` for details about why, and for
    examples converting from old to new usage.

    !end-bullet!
-   !begin-bullet!
    `top_n()` has been superseded by`slice_min()`/`slice_max()`. See
    `?top_n` for details about why, and how to convert old to new usage
    (#4494).

    !end-bullet!

!end-bullets-43!

### Questioning

!begin-bullets-44!

-   !begin-bullet!
    `all_equal()` is questioning; it solves a problem that no longer
    seems important.
    !end-bullet!

!end-bullets-44!

### Stable

!begin-bullets-45!

-   !begin-bullet!
    `rowwise()` is no longer questioning.
    !end-bullet!

!end-bullets-45!

## Documentation improvements

!begin-bullets-46!

-   !begin-bullet!
    New `vignette("base")` which describes how dplyr verbs relate to the
    base R equivalents (@sastoudt, #4755)

    !end-bullet!
-   !begin-bullet!
    New `vignette("grouping")` gives more details about how dplyr verbs
    change when applied to grouped data frames (#4779, @MikeKSmith).

    !end-bullet!
-   !begin-bullet!
    `vignette("programming")` has been completely rewritten to reflect
    our latest vocabulary, the most recent rlang features, and our
    current recommendations. It should now be substantially easier to
    program with dplyr.

    !end-bullet!

!end-bullets-46!

## Minor improvements and bug fixes

!begin-bullets-47!

-   !begin-bullet!
    dplyr now has a rudimentary, experimental, and stop-gap, extension
    mechanism documented in `?dplyr_extending`

    !end-bullet!
-   !begin-bullet!
    dplyr no longer provides a `all.equal.tbl_df()` method. It never
    should have done so in the first place because it owns neither the
    generic nor the class. It also provided a problematic implementation
    because, by default, it ignored the order of the rows and the
    columns which is usually important. This is likely to cause new test
    failures in downstream packages; but on the whole we believe those
    failures to either reflect unexpected behaviour or tests that need
    to be strengthened (#2751).

    !end-bullet!
-   !begin-bullet!
    `coalesce()` now uses vctrs recycling and common type coercion rules
    (#5186).

    !end-bullet!
-   !begin-bullet!
    `count()` and `add_count()` do a better job of preserving input
    class and attributes (#4086).

    !end-bullet!
-   !begin-bullet!
    `distinct()` errors if you request it use variables that don't exist
    (this was previously a warning) (#4656).

    !end-bullet!
-   !begin-bullet!
    `filter()`, `mutate()` and `summarise()` get better error messages.

    !end-bullet!
-   !begin-bullet!
    `filter()` handles data frame results when all columns are logical
    vectors by reducing them with `&` (#4678). In particular this means
    `across()` can be used in `filter()`.

    !end-bullet!
-   !begin-bullet!
    `left_join()`, `right_join()`, and `full_join()` gain a `keep`
    argument so that you can optionally choose to keep both sets of join
    keys (#4589). This is useful when you want to figure out which rows
    were missing from either side.

    !end-bullet!
-   !begin-bullet!
    Join functions can now perform a cross-join by specifying
    `by = character()` (#4206.)

    !end-bullet!
-   !begin-bullet!
    `groups()` now returns `list()` for ungrouped data; previously it
    returned `NULL` which was type-unstable (when there are groups it
    returns a list of symbols).

    !end-bullet!
-   !begin-bullet!
    The first argument of `group_map()`, `group_modify()` and
    `group_walk()` has been changed to `.data` for consistency with
    other generics.

    !end-bullet!
-   !begin-bullet!
    `group_keys.rowwise_df()` gives a 0 column data frame with `n()`
    rows.

    !end-bullet!
-   !begin-bullet!
    `group_map()` is now a generic (#4576).

    !end-bullet!
-   !begin-bullet!
    `group_by(..., .add = TRUE)` replaces `group_by(..., add = TRUE)`,
    with a deprecation message. The old argument name was a mistake
    because it prevents you from creating a new grouping var called
    `add` and it violates our naming conventions (#4137).

    !end-bullet!
-   !begin-bullet!
    `intersect()`, `union()`, `setdiff()` and `setequal()` generics are
    now imported from the generics package. This reduces a conflict with
    lubridate.

    !end-bullet!
-   !begin-bullet!
    `order_by()` gives an informative hint if you accidentally call it
    instead of `arrange()` #3357.

    !end-bullet!
-   !begin-bullet!
    `tally()` and `count()` now message if the default output `name`
    (n), already exists in the data frame. To quiet the message, you'll
    need to supply an explicit `name` (#4284). You can override the
    default weighting to using a constant by setting `wt = 1`.

    !end-bullet!
-   !begin-bullet!
    `starwars` dataset now does a better job of separating biological
    sex from gender identity. The previous `gender` column has been
    renamed to `sex`, since it actually describes the individual's
    biological sex. A new `gender` column encodes the actual gender
    identity using other information about the Star Wars universe
    (@MeganBeckett, #4456).

    !end-bullet!
-   !begin-bullet!
    `src_tbls()` accepts `...` arguments (#4485, @ianmcook). This could
    be a breaking change for some dplyr backend packages that implement
    `src_tbls()`.

    !end-bullet!
-   !begin-bullet!
    Better performance for extracting slices of factors and ordered
    factors (#4501).

    !end-bullet!
-   !begin-bullet!
    `rename_at()` and `rename_all()` call the function with a simple
    character vector, not a `dplyr_sel_vars` (#4459).

    !end-bullet!
-   !begin-bullet!
    `ntile()` is now more consistent with database implementations if
    the buckets have irregular size (#4495).

    !end-bullet!

!end-bullets-47!

# dplyr 0.8.5 (2020-03-07)

!begin-bullets-48!

-   !begin-bullet!
    Maintenance release for compatibility with R-devel.
    !end-bullet!

!end-bullets-48!

# dplyr 0.8.4 (2020-01-30)

!begin-bullets-49!

-   !begin-bullet!
    Adapt tests to changes in dependent packages.
    !end-bullet!

!end-bullets-49!

# dplyr 0.8.3 (2019-07-04)

!begin-bullets-50!

-   !begin-bullet!
    Fixed performance regression introduced in version 0.8.2 (#4458).
    !end-bullet!

!end-bullets-50!

# dplyr 0.8.2 (2019-06-28)

## New functions

!begin-bullets-51!

-   !begin-bullet!
    `top_frac(data, proportion)` is a shorthand for
    `top_n(data, proportion * n())` (#4017).
    !end-bullet!

!end-bullets-51!

## colwise changes

!begin-bullets-52!

-   !begin-bullet!
    Using quosures in colwise verbs is deprecated (#4330).

    !end-bullet!
-   !begin-bullet!
    Updated `distinct_if()`, `distinct_at()` and `distinct_all()` to
    include `.keep_all` argument (@beansrowning, #4343).

    !end-bullet!
-   !begin-bullet!
    `rename_at()` handles empty selection (#4324).

    !end-bullet!
-   !begin-bullet!
    `*_if()` functions correctly handle columns with special names
    (#4380).

    !end-bullet!
-   !begin-bullet!
    colwise functions support constants in formulas (#4374).

    !end-bullet!

!end-bullets-52!

## Hybrid evaluation changes

!begin-bullets-53!

-   !begin-bullet!
    hybrid rank functions correctly handle NA (#4427).

    !end-bullet!
-   !begin-bullet!
    `first()`, `last()` and `nth()` hybrid version handles factors
    (#4295).

    !end-bullet!

!end-bullets-53!

## Minor changes

!begin-bullets-54!

-   !begin-bullet!
    `top_n()` quotes its `n` argument, `n` no longer needs to be
    constant for all groups (#4017).

    !end-bullet!
-   !begin-bullet!
    `tbl_vars()` keeps information on grouping columns by returning a
    `dplyr_sel_vars` object (#4106).

    !end-bullet!
-   !begin-bullet!
    `group_split()` always sets the `ptype` attribute, which make it
    more robust in the case where there are 0 groups.

    !end-bullet!
-   !begin-bullet!
    `group_map()` and `group_modify()` work in the 0 group edge case
    (#4421)

    !end-bullet!
-   !begin-bullet!
    `select.list()` method added so that `select()` does not dispatch on
    lists (#4279).

    !end-bullet!
-   !begin-bullet!
    `view()` is reexported from tibble (#4423).

    !end-bullet!
-   !begin-bullet!
    `group_by()` puts NA groups last in character vectors (#4227).

    !end-bullet!
-   !begin-bullet!
    `arrange()` handles integer64 objects (#4366).

    !end-bullet!
-   !begin-bullet!
    `summarise()` correctly resolves summarised list columns (#4349).

    !end-bullet!

!end-bullets-54!

# dplyr 0.8.1 (2019-05-14)

## Breaking changes

!begin-bullets-55!

-   !begin-bullet!
    `group_modify()` is the new name of the function previously known as
    `group_map()`
    !end-bullet!

!end-bullets-55!

## New functions

!begin-bullets-56!

-   !begin-bullet!
    `group_map()` now only calls the function on each group and return a
    list.

    !end-bullet!
-   !begin-bullet!
    `group_by_drop_default()`, previously known as
    `dplyr:::group_drops()` is exported (#4245).

    !end-bullet!

!end-bullets-56!

## Minor changes

!begin-bullets-57!

-   !begin-bullet!
    Lists of formulas passed to colwise verbs are now automatically
    named.

    !end-bullet!
-   !begin-bullet!
    `group_by()` does a shallow copy even in the no groups case (#4221).

    !end-bullet!
-   !begin-bullet!
    Fixed `mutate()` on rowwise data frames with 0 rows (#4224).

    !end-bullet!
-   !begin-bullet!
    Fixed handling of bare formulas in colwise verbs (#4183).

    !end-bullet!
-   !begin-bullet!
    Fixed performance of `n_distinct()` (#4202).

    !end-bullet!
-   !begin-bullet!
    `group_indices()` now ignores empty groups by default for
    `data.frame`, which is consistent with the default of `group_by()`
    (@yutannihilation, #4208).

    !end-bullet!
-   !begin-bullet!
    Fixed integer overflow in hybrid `ntile()` (#4186).

    !end-bullet!
-   !begin-bullet!
    colwise functions `summarise_at()` ... can rename vars in the case
    of multiple functions (#4180).

    !end-bullet!
-   !begin-bullet!
    `select_if()` and `rename_if()` handle logical vector predicate
    (#4213).

    !end-bullet!
-   !begin-bullet!
    hybrid `min()` and `max()` cast to integer when possible (#4258).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` correctly handles the cases where there are multiple
    consecutive `NULL` (#4296).

    !end-bullet!
-   !begin-bullet!
    Support for R 3.1.\* has been dropped. The minimal R version
    supported is now 3.2.0.
    https://www.tidyverse.org/articles/2019/04/r-version-support/

    !end-bullet!
-   !begin-bullet!
    `rename_at()` handles empty selection (#4324).

    !end-bullet!

!end-bullets-57!

# dplyr 0.8.0.1 (2019-02-15)

!begin-bullets-58!

-   !begin-bullet!
    Fixed integer C/C++ division, forced released by CRAN (#4185).
    !end-bullet!

!end-bullets-58!

# dplyr 0.8.0 (2019-02-14)

## Breaking changes

!begin-bullets-59!

-   !begin-bullet!
    The error `could not find function "n"` or the warning
    `` Calling `n()` without importing or prefixing it is deprecated, use `dplyr::n()` ``

    indicates when functions like `n()`, `row_number()`, ... are not
    imported or prefixed.

    The easiest fix is to import dplyr with `import(dplyr)` in your
    `NAMESPACE` or `#' @import dplyr` in a roxygen comment,
    alternatively such functions can be imported selectively as any
    other function with `importFrom(dplyr, n)` in the `NAMESPACE` or
    `#' @importFrom dplyr n` in a roxygen comment. The third option is
    to prefix them, i.e. use `dplyr::n()`

    !end-bullet!
-   !begin-bullet!
    If you see `checking S3 generic/method consistency` in R CMD check
    for your package, note that :

    !begin-bullets-60!
    -   !begin-bullet!
        `sample_n()` and `sample_frac()` have gained `...`
        !end-bullet!
    -   !begin-bullet!
        `filter()` and `slice()` have gained `.preserve`
        !end-bullet!
    -   !begin-bullet!
        `group_by()` has gained `.drop`
        !end-bullet!

    !end-bullets-60!
    !end-bullet!
-   !begin-bullet!
    `` Error: `.data` is a corrupt grouped_df, ... `` signals code that
    makes wrong assumptions about the internals of a grouped data frame.

    !end-bullet!

!end-bullets-59!

## New functions

!begin-bullets-61!

-   !begin-bullet!
    New selection helpers `group_cols()`. It can be called in selection
    contexts such as `select()` and matches the grouping variables of
    grouped tibbles.

    !end-bullet!
-   !begin-bullet!
    `last_col()` is re-exported from tidyselect (#3584).

    !end-bullet!
-   !begin-bullet!
    `group_trim()` drops unused levels of factors that are used as
    grouping variables.

    !end-bullet!
-   !begin-bullet!
    `nest_join()` creates a list column of the matching rows.
    `nest_join()` + `tidyr::unnest()` is equivalent to `inner_join`
    (#3570).

    !begin-codeblock!
    ``` r
    band_members %>%
      nest_join(band_instruments)
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `group_nest()` is similar to `tidyr::nest()` but focusing on the
    variables to nest by instead of the nested columns.

    !begin-codeblock!
    ``` r
    starwars %>%
      group_by(species, homeworld) %>%
      group_nest()

    starwars %>%
      group_nest(species, homeworld)
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `group_split()` is similar to `base::split()` but operating on
    existing groups when applied to a grouped data frame, or subject to
    the data mask on ungrouped data frames

    !begin-codeblock!
    ``` r
    starwars %>%
      group_by(species, homeworld) %>%
      group_split()

    starwars %>%
      group_split(species, homeworld)
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `group_map()` and `group_walk()` are purrr-like functions to iterate
    on groups of a grouped data frame, jointly identified by the data
    subset (exposed as `.x`) and the data key (a one row tibble, exposed
    as `.y`). `group_map()` returns a grouped data frame that combines
    the results of the function, `group_walk()` is only used for side
    effects and returns its input invisibly.

    !begin-codeblock!
    ``` r
    mtcars %>%
      group_by(cyl) %>%
      group_map(~ head(.x, 2L))
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `distinct_prepare()`, previously known as `distinct_vars()` is
    exported. This is mostly useful for alternative backends
    (e.g. `dbplyr`).

    !end-bullet!

!end-bullets-61!

## Major changes

!begin-bullets-62!

-   !begin-bullet!
    `group_by()` gains the `.drop` argument. When set to `FALSE` the
    groups are generated based on factor levels, hence some groups may
    be empty (#341).

    !begin-codeblock!
    ``` r
    # 3 groups
    tibble(
      x = 1:2,
      f = factor(c("a", "b"), levels = c("a", "b", "c"))
    ) %>%
      group_by(f, .drop = FALSE)

    # the order of the grouping variables matter
    df <- tibble(
      x = c(1,2,1,2),
      f = factor(c("a", "b", "a", "b"), levels = c("a", "b", "c"))
    )
    df %>% group_by(f, x, .drop = FALSE)
    df %>% group_by(x, f, .drop = FALSE)
    ```

    !end-codeblock!
    The default behaviour drops the empty groups as in the previous
    versions.

    !begin-codeblock!
    ``` r
    tibble(
        x = 1:2,
        f = factor(c("a", "b"), levels = c("a", "b", "c"))
      ) %>%
        group_by(f)
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `filter()` and `slice()` gain a `.preserve` argument to control
    which groups it should keep. The default `filter(.preserve = FALSE)`
    recalculates the grouping structure based on the resulting data,
    otherwise it is kept as is.

    !begin-codeblock!
    ``` r
    df <- tibble(
      x = c(1,2,1,2),
      f = factor(c("a", "b", "a", "b"), levels = c("a", "b", "c"))
    ) %>%
      group_by(x, f, .drop = FALSE)

    df %>% filter(x == 1)
    df %>% filter(x == 1, .preserve = TRUE)
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    The notion of lazily grouped data frames have disappeared. All dplyr
    verbs now recalculate immediately the grouping structure, and
    respect the levels of factors.

    !end-bullet!
-   !begin-bullet!
    Subsets of columns now properly dispatch to the `[` or `[[` method
    when the column is an object (a vector with a class) instead of
    making assumptions on how the column should be handled. The `[`
    method must handle integer indices, including `NA_integer_`,
    i.e. `x[NA_integer_]` should produce a vector of the same class as
    `x` with whatever represents a missing value.

    !end-bullet!

!end-bullets-62!

## Minor changes

!begin-bullets-63!

-   !begin-bullet!
    `tally()` works correctly on non-data frame table sources such as
    `tbl_sql` (#3075).

    !end-bullet!
-   !begin-bullet!
    `sample_n()` and `sample_frac()` can use `n()` (#3527)

    !end-bullet!
-   !begin-bullet!
    `distinct()` respects the order of the variables provided (#3195,
    @foo-bar-baz-qux) and handles the 0 rows and 0 columns special case
    (#2954).

    !end-bullet!
-   !begin-bullet!
    `combine()` uses tidy dots (#3407).

    !end-bullet!
-   !begin-bullet!
    `group_indices()` can be used without argument in expressions in
    verbs (#1185).

    !end-bullet!
-   !begin-bullet!
    Using `mutate_all()`, `transmute_all()`, `mutate_if()` and
    `transmute_if()` with grouped tibbles now informs you that the
    grouping variables are ignored. In the case of the `_all()` verbs,
    the message invites you to use `mutate_at(df, vars(-group_cols()))`
    (or the equivalent `transmute_at()` call) instead if you'd like to
    make it explicit in your code that the operation is not applied on
    the grouping variables.

    !end-bullet!
-   !begin-bullet!
    Scoped variants of `arrange()` respect the `.by_group` argument
    (#3504).

    !end-bullet!
-   !begin-bullet!
    `first()` and `last()` hybrid functions fall back to R evaluation
    when given no arguments (#3589).

    !end-bullet!
-   !begin-bullet!
    `mutate()` removes a column when the expression evaluates to `NULL`
    for all groups (#2945).

    !end-bullet!
-   !begin-bullet!
    grouped data frames support `[, drop = TRUE]` (#3714).

    !end-bullet!
-   !begin-bullet!
    New low-level constructor `new_grouped_df()` and validator
    `validate_grouped_df` (#3837).

    !end-bullet!
-   !begin-bullet!
    `glimpse()` prints group information on grouped tibbles (#3384).

    !end-bullet!
-   !begin-bullet!
    `sample_n()` and `sample_frac()` gain `...` (#2888).

    !end-bullet!
-   !begin-bullet!
    Scoped filter variants now support functions and purrr-like lambdas:

    !begin-codeblock!
    ``` r
    mtcars %>% filter_at(vars(hp, vs), ~ . %% 2 == 0)
    ```

    !end-codeblock!
    !end-bullet!

!end-bullets-63!

## Lifecycle

!begin-bullets-64!

-   !begin-bullet!
    `do()`, `rowwise()` and `combine()` are questioning (#3494).

    !end-bullet!
-   !begin-bullet!
    `funs()` is soft-deprecated and will start issuing warnings in a
    future version.

    !end-bullet!

!end-bullets-64!

## Changes to column wise functions

!begin-bullets-65!

-   !begin-bullet!
    Scoped variants for `distinct()`: `distinct_at()`, `distinct_if()`,
    `distinct_all()` (#2948).

    !end-bullet!
-   !begin-bullet!
    `summarise_at()` excludes the grouping variables (#3613).

    !end-bullet!
-   !begin-bullet!
    `mutate_all()`, `mutate_at()`, `summarise_all()` and
    `summarise_at()` handle utf-8 names (#2967).

    !end-bullet!

!end-bullets-65!

## Performance

!begin-bullets-66!

-   !begin-bullet!
    R expressions that cannot be handled with native code are now
    evaluated with unwind-protection when available (on R 3.5 and
    later). This improves the performance of dplyr on data frames with
    many groups (and hence many expressions to evaluate). We benchmarked
    that computing a grouped average is consistently twice as fast with
    unwind-protection enabled.

    Unwind-protection also makes dplyr more robust in corner cases
    because it ensures the C++ destructors are correctly called in all
    circumstances (debugger exit, captured condition, restart
    invocation).

    !end-bullet!
-   !begin-bullet!
    `sample_n()` and `sample_frac()` gain `...` (#2888).

    !end-bullet!
-   !begin-bullet!
    Improved performance for wide tibbles (#3335).

    !end-bullet!
-   !begin-bullet!
    Faster hybrid `sum()`, `mean()`, `var()` and `sd()` for logical
    vectors (#3189).

    !end-bullet!
-   !begin-bullet!
    Hybrid version of `sum(na.rm = FALSE)` exits early when there are
    missing values. This considerably improves performance when there
    are missing values early in the vector (#3288).

    !end-bullet!
-   !begin-bullet!
    `group_by()` does not trigger the additional `mutate()` on simple
    uses of the `.data` pronoun (#3533).

    !end-bullet!

!end-bullets-66!

## Internal

!begin-bullets-67!

-   !begin-bullet!
    The grouping metadata of grouped data frame has been reorganized in
    a single tidy tibble, that can be accessed with the new
    `group_data()` function. The grouping tibble consists of one column
    per grouping variable, followed by a list column of the (1-based)
    indices of the groups. The new `group_rows()` function retrieves
    that list of indices (#3489).

    !begin-codeblock!
    ``` r
    # the grouping metadata, as a tibble
    group_by(starwars, homeworld) %>%
      group_data()

    # the indices
    group_by(starwars, homeworld) %>%
      group_data() %>%
      pull(.rows)

    group_by(starwars, homeworld) %>%
      group_rows()
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Hybrid evaluation has been completely redesigned for better
    performance and stability.

    !end-bullet!

!end-bullets-67!

## Documentation

!begin-bullets-68!

-   !begin-bullet!
    Add documentation example for moving variable to back in `?select`
    (#3051).

    !end-bullet!
-   !begin-bullet!
    column wise functions are better documented, in particular
    explaining when grouping variables are included as part of the
    selection.

    !end-bullet!

!end-bullets-68!

### Deprecated and defunct functions

!begin-bullets-69!

-   !begin-bullet!
    `mutate_each()` and `summarise_each()` are deprecated.
    !end-bullet!

!end-bullets-69!

# dplyr 0.7.6

!begin-bullets-70!

-   !begin-bullet!
    `exprs()` is no longer exported to avoid conflicts with
    `Biobase::exprs()` (#3638).

    !end-bullet!
-   !begin-bullet!
    The MASS package is explicitly suggested to fix CRAN warnings on
    R-devel (#3657).

    !end-bullet!
-   !begin-bullet!
    Set operations like `intersect()` and `setdiff()` reconstruct groups
    metadata (#3587) and keep the order of the rows (#3839).

    !end-bullet!
-   !begin-bullet!
    Using namespaced calls to `base::sort()` and `base::unique()` from
    C++ code to avoid ambiguities when these functions are overridden
    (#3644).

    !end-bullet!
-   !begin-bullet!
    Fix rchk errors (#3693).

    !end-bullet!

!end-bullets-70!

# dplyr 0.7.5 (2018-04-14)

## Breaking changes for package developers

!begin-bullets-71!

-   !begin-bullet!
    The major change in this version is that dplyr now depends on the
    selecting backend of the tidyselect package. If you have been
    linking to `dplyr::select_helpers` documentation topic, you should
    update the link to point to `tidyselect::select_helpers`.

    !end-bullet!
-   !begin-bullet!
    Another change that causes warnings in packages is that dplyr now
    exports the `exprs()` function. This causes a collision with
    `Biobase::exprs()`. Either import functions from dplyr selectively
    rather than in bulk, or do not import `Biobase::exprs()` and refer
    to it with a namespace qualifier.

    !end-bullet!

!end-bullets-71!

## Bug fixes

!begin-bullets-72!

-   !begin-bullet!
    `distinct(data, "string")` now returns a one-row data frame again.
    (The previous behavior was to return the data unchanged.)

    !end-bullet!
-   !begin-bullet!
    `do()` operations with more than one named argument can access `.`
    (#2998).

    !end-bullet!
-   !begin-bullet!
    Reindexing grouped data frames (e.g. after `filter()` or
    `..._join()`) never updates the `"class"` attribute. This also
    avoids unintended updates to the original object (#3438).

    !end-bullet!
-   !begin-bullet!
    Fixed rare column name clash in `..._join()` with non-join columns
    of the same name in both tables (#3266).

    !end-bullet!
-   !begin-bullet!
    Fix `ntile()` and `row_number()` ordering to use the
    locale-dependent ordering functions in R when dealing with character
    vectors, rather than always using the C-locale ordering function in
    C (#2792, @foo-bar-baz-qux).

    !end-bullet!
-   !begin-bullet!
    Summaries of summaries (such as `summarise(b = sum(a), c = sum(b))`)
    are now computed using standard evaluation for simplicity and
    correctness, but slightly slower (#3233).

    !end-bullet!
-   !begin-bullet!
    Fixed `summarise()` for empty data frames with zero columns (#3071).

    !end-bullet!

!end-bullets-72!

## Major changes

!begin-bullets-73!

-   !begin-bullet!
    `enexpr()`, `expr()`, `exprs()`, `sym()` and `syms()` are now
    exported. `sym()` and `syms()` construct symbols from strings or
    character vectors. The `expr()` variants are equivalent to `quo()`,
    `quos()` and `enquo()` but return simple expressions rather than
    quosures. They support quasiquotation.

    !end-bullet!
-   !begin-bullet!
    dplyr now depends on the new tidyselect package to power `select()`,
    `rename()`, `pull()` and their variants (#2896). Consequently
    `select_vars()`, `select_var()` and `rename_vars()` are
    soft-deprecated and will start issuing warnings in a future version.

    Following the switch to tidyselect, `select()` and `rename()` fully
    support character vectors. You can now unquote variables like this:

    !begin-codeblock!
        vars <- c("disp", "cyl")
        select(mtcars, !! vars)
        select(mtcars, -(!! vars))

    !end-codeblock!
    Note that this only works in selecting functions because in other
    contexts strings and character vectors are ambiguous. For instance
    strings are a valid input in mutating operations and
    `mutate(df, "foo")` creates a new column by recycling "foo" to the
    number of rows.

    !end-bullet!

!end-bullets-73!

## Minor changes

!begin-bullets-74!

-   !begin-bullet!
    Support for raw vector columns in `arrange()`, `group_by()`,
    `mutate()`, `summarise()` and `..._join()` (minimal `raw` x `raw`
    support initially) (#1803).

    !end-bullet!
-   !begin-bullet!
    `bind_cols()` handles unnamed list (#3402).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` works around corrupt columns that have the object bit
    set while having no class attribute (#3349).

    !end-bullet!
-   !begin-bullet!
    `combine()` returns `logical()` when all inputs are `NULL` (or when
    there are no inputs) (#3365, @zeehio).

    !end-bullet!
-   !begin-bullet!
    `distinct()` now supports renaming columns (#3234).

    !end-bullet!
-   !begin-bullet!
    Hybrid evaluation simplifies `dplyr::foo()` to `foo()` (#3309).
    Hybrid functions can now be masked by regular R functions to turn
    off hybrid evaluation (#3255). The hybrid evaluator finds functions
    from dplyr even if dplyr is not attached (#3456).

    !end-bullet!
-   !begin-bullet!
    In `mutate()` it is now illegal to use `data.frame` in the rhs
    (#3298).

    !end-bullet!
-   !begin-bullet!
    Support `!!!` in `recode_factor()` (#3390).

    !end-bullet!
-   !begin-bullet!
    `row_number()` works on empty subsets (#3454).

    !end-bullet!
-   !begin-bullet!
    `select()` and `vars()` now treat `NULL` as empty inputs (#3023).

    !end-bullet!
-   !begin-bullet!
    Scoped select and rename functions (`select_all()`, `rename_if()`
    etc.) now work with grouped data frames, adapting the grouping as
    necessary (#2947, #3410). `group_by_at()` can group by an existing
    grouping variable (#3351). `arrange_at()` can use grouping variables
    (#3332).

    !end-bullet!
-   !begin-bullet!
    `slice()` no longer enforce tibble classes when input is a simple
    `data.frame`, and ignores 0 (#3297, #3313).

    !end-bullet!
-   !begin-bullet!
    `transmute()` no longer prints a message when including a group
    variable.

    !end-bullet!

!end-bullets-74!

## Documentation

!begin-bullets-75!

-   !begin-bullet!
    Improved documentation for `funs()` (#3094) and set operations
    (e.g. `union()`) (#3238, @edublancas).
    !end-bullet!

!end-bullets-75!

## Error messages

!begin-bullets-76!

-   !begin-bullet!
    Better error message if dbplyr is not installed when accessing
    database backends (#3225).

    !end-bullet!
-   !begin-bullet!
    `arrange()` fails gracefully on `data.frame` columns (#3153).

    !end-bullet!
-   !begin-bullet!
    Corrected error message when calling `cbind()` with an object of
    wrong length (#3085).

    !end-bullet!
-   !begin-bullet!
    Add warning with explanation to `distinct()` if any of the selected
    columns are of type `list` (#3088, @foo-bar-baz-qux), or when used
    on unknown columns (#2867, @foo-bar-baz-qux).

    !end-bullet!
-   !begin-bullet!
    Show clear error message for bad arguments to `funs()` (#3368).

    !end-bullet!
-   !begin-bullet!
    Better error message in `..._join()` when joining data frames with
    duplicate or `NA` column names. Joining such data frames with a
    semi- or anti-join now gives a warning, which may be converted to an
    error in future versions (#3243, #3417).

    !end-bullet!
-   !begin-bullet!
    Dedicated error message when trying to use columns of the `Interval`
    or `Period` classes (#2568).

    !end-bullet!
-   !begin-bullet!
    Added an `.onDetach()` hook that allows for plyr to be loaded and
    attached without the warning message that says functions in dplyr
    will be masked, since dplyr is no longer attached (#3359,
    @jwnorman).

    !end-bullet!

!end-bullets-76!

## Performance

!begin-bullets-77!

-   !begin-bullet!
    `sample_n()` and `sample_frac()` on grouped data frame are now
    faster especially for those with large number of groups (#3193,
    @saurfang).
    !end-bullet!

!end-bullets-77!

## Internal

!begin-bullets-78!

-   !begin-bullet!
    Compute variable names for joins in R (#3430).

    !end-bullet!
-   !begin-bullet!
    Bumped Rcpp dependency to 0.12.15 to avoid imperfect detection of
    `NA` values in hybrid evaluation fixed in RcppCore/Rcpp#790 (#2919).

    !end-bullet!
-   !begin-bullet!
    Avoid cleaning the data mask, a temporary environment used to
    evaluate expressions. If the environment, in which e.g. a `mutate()`
    expression is evaluated, is preserved until after the operation,
    accessing variables from that environment now gives a warning but
    still returns `NULL` (#3318).

    !end-bullet!

!end-bullets-78!

# dplyr 0.7.4

!begin-bullets-79!

-   !begin-bullet!
    Fix recent Fedora and ASAN check errors (#3098).

    !end-bullet!
-   !begin-bullet!
    Avoid dependency on Rcpp 0.12.10 (#3106).

    !end-bullet!

!end-bullets-79!

# dplyr 0.7.3

!begin-bullets-80!

-   !begin-bullet!
    Fixed protection error that occurred when creating a character
    column using grouped `mutate()` (#2971).

    !end-bullet!
-   !begin-bullet!
    Fixed a rare problem with accessing variable values in `summarise()`
    when all groups have size one (#3050).

    !end-bullet!
-   !begin-bullet!
    `distinct()` now throws an error when used on unknown columns
    (#2867, @foo-bar-baz-qux).

    !end-bullet!
-   !begin-bullet!
    Fixed rare out-of-bounds memory write in `slice()` when negative
    indices beyond the number of rows were involved (#3073).

    !end-bullet!
-   !begin-bullet!
    `select()`, `rename()` and `summarise()` no longer change the
    grouped vars of the original data (#3038).

    !end-bullet!
-   !begin-bullet!
    `nth(default = var)`, `first(default = var)` and
    `last(default = var)` fall back to standard evaluation in a grouped
    operation instead of triggering an error (#3045).

    !end-bullet!
-   !begin-bullet!
    `case_when()` now works if all LHS are atomic (#2909), or when LHS
    or RHS values are zero-length vectors (#3048).

    !end-bullet!
-   !begin-bullet!
    `case_when()` accepts `NA` on the LHS (#2927).

    !end-bullet!
-   !begin-bullet!
    Semi- and anti-joins now preserve the order of left-hand-side data
    frame (#3089).

    !end-bullet!
-   !begin-bullet!
    Improved error message for invalid list arguments to `bind_rows()`
    (#3068).

    !end-bullet!
-   !begin-bullet!
    Grouping by character vectors is now faster (#2204).

    !end-bullet!
-   !begin-bullet!
    Fixed a crash that occurred when an unexpected input was supplied to
    the `call` argument of `order_by()` (#3065).

    !end-bullet!

!end-bullets-80!

# dplyr 0.7.2

!begin-bullets-81!

-   !begin-bullet!
    Move build-time vs. run-time checks out of `.onLoad()` and into
    `dr_dplyr()`.
    !end-bullet!

!end-bullets-81!

# dplyr 0.7.1

!begin-bullets-82!

-   !begin-bullet!
    Use new versions of bindrcpp and glue to avoid protection problems.
    Avoid wrapping arguments to internal error functions (#2877). Fix
    two protection mistakes found by rchk (#2868).

    !end-bullet!
-   !begin-bullet!
    Fix C++ error that caused compilation to fail on mac cran (#2862)

    !end-bullet!
-   !begin-bullet!
    Fix undefined behaviour in `between()`, where `NA_REAL` were
    assigned instead of `NA_LOGICAL`. (#2855, @zeehio)

    !end-bullet!
-   !begin-bullet!
    `top_n()` now executes operations lazily for compatibility with
    database backends (#2848).

    !end-bullet!
-   !begin-bullet!
    Reuse of new variables created in ungrouped `mutate()` possible
    again, regression introduced in dplyr 0.7.0 (#2869).

    !end-bullet!
-   !begin-bullet!
    Quosured symbols do not prevent hybrid handling anymore. This should
    fix many performance issues introduced with tidyeval (#2822).

    !end-bullet!

!end-bullets-82!

# dplyr 0.7.0

## New data, functions, and features

!begin-bullets-83!

-   !begin-bullet!
    Five new datasets provide some interesting built-in datasets to
    demonstrate dplyr verbs (#2094):

    !begin-bullets-84!
    -   !begin-bullet!
        `starwars` dataset about starwars characters; has list columns
        !end-bullet!
    -   !begin-bullet!
        `storms` has the trajectories of \~200 tropical storms
        !end-bullet!
    -   !begin-bullet!
        `band_members`, `band_instruments` and `band_instruments2` has
        some simple data to demonstrate joins.
        !end-bullet!

    !end-bullets-84!
    !end-bullet!
-   !begin-bullet!
    New `add_count()` and `add_tally()` for adding an `n` column within
    groups (#2078, @dgrtwo).

    !end-bullet!
-   !begin-bullet!
    `arrange()` for grouped data frames gains a `.by_group` argument so
    you can choose to sort by groups if you want to (defaults to
    `FALSE`) (#2318)

    !end-bullet!
-   !begin-bullet!
    New `pull()` generic for extracting a single column either by name
    or position (either from the left or the right). Thanks to
    @paulponcet for the idea (#2054).

    This verb is powered with the new `select_var()` internal helper,
    which is exported as well. It is like `select_vars()` but returns a
    single variable.

    !end-bullet!
-   !begin-bullet!
    `as_tibble()` is re-exported from tibble. This is the recommend way
    to create tibbles from existing data frames. `tbl_df()` has been
    softly deprecated. `tribble()` is now imported from tibble (#2336,
    @chrMongeau); this is now preferred to `frame_data()`.

    !end-bullet!

!end-bullets-83!

## Deprecated and defunct

!begin-bullets-85!

-   !begin-bullet!
    dplyr no longer messages that you need dtplyr to work with
    data.table (#2489).

    !end-bullet!
-   !begin-bullet!
    Long deprecated `regroup()`, `mutate_each_q()` and
    `summarise_each_q()` functions have been removed.

    !end-bullet!
-   !begin-bullet!
    Deprecated `failwith()`. I'm not even sure why it was here.

    !end-bullet!
-   !begin-bullet!
    Soft-deprecated `mutate_each()` and `summarise_each()`, these
    functions print a message which will be changed to a warning in the
    next release.

    !end-bullet!
-   !begin-bullet!
    The `.env` argument to `sample_n()` and `sample_frac()` is defunct,
    passing a value to this argument print a message which will be
    changed to a warning in the next release.

    !end-bullet!

!end-bullets-85!

## Databases

This version of dplyr includes some major changes to how database
connections work. By and large, you should be able to continue using
your existing dplyr database code without modification, but there are
two big changes that you should be aware of:

!begin-bullets-86!

-   !begin-bullet!
    Almost all database related code has been moved out of dplyr and
    into a new package, dbplyr. This makes dplyr simpler, and will make
    it easier to release fixes for bugs that only affect databases.
    `src_mysql()`, `src_postgres()`, and `src_sqlite()` will still live
    dplyr so your existing code continues to work.

    !end-bullet!
-   !begin-bullet!
    It is no longer necessary to create a remote "src". Instead you can
    work directly with the database connection returned by DBI. This
    reflects the maturity of the DBI ecosystem. Thanks largely to the
    work of Kirill Muller (funded by the R Consortium) DBI backends are
    now much more consistent, comprehensive, and easier to use. That
    means that there's no longer a need for a layer in between you and
    DBI.

    !end-bullet!

!end-bullets-86!

You can continue to use `src_mysql()`, `src_postgres()`, and
`src_sqlite()`, but I recommend a new style that makes the connection to
DBI more clear:

!begin-codeblock!

``` r
library(dplyr)

con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
DBI::dbWriteTable(con, "mtcars", mtcars)

mtcars2 <- tbl(con, "mtcars")
mtcars2
```

!end-codeblock!

This is particularly useful if you want to perform non-SELECT queries as
you can do whatever you want with `DBI::dbGetQuery()` and
`DBI::dbExecute()`.

If you've implemented a database backend for dplyr, please read the
backend news to see what's changed from your perspective (not much). If
you want to ensure your package works with both the current and previous
version of dplyr, see `wrap_dbplyr_obj()` for helpers.

## UTF-8

!begin-bullets-87!

-   !begin-bullet!
    Internally, column names are always represented as character
    vectors, and not as language symbols, to avoid encoding problems on
    Windows (#1950, #2387, #2388).

    !end-bullet!
-   !begin-bullet!
    Error messages and explanations of data frame inequality are now
    encoded in UTF-8, also on Windows (#2441).

    !end-bullet!
-   !begin-bullet!
    Joins now always reencode character columns to UTF-8 if necessary.
    This gives a nice speedup, because now pointer comparison can be
    used instead of string comparison, but relies on a proper encoding
    tag for all strings (#2514).

    !end-bullet!
-   !begin-bullet!
    Fixed problems when joining factor or character encodings with a mix
    of native and UTF-8 encoded values (#1885, #2118, #2271, #2451).

    !end-bullet!
-   !begin-bullet!
    Fix `group_by()` for data frames that have UTF-8 encoded names
    (#2284, #2382).

    !end-bullet!
-   !begin-bullet!
    New `group_vars()` generic that returns the grouping as character
    vector, to avoid the potentially lossy conversion to language
    symbols. The list returned by `group_by_prepare()` now has a new
    `group_names` component (#1950, #2384).

    !end-bullet!

!end-bullets-87!

## Colwise functions

!begin-bullets-88!

-   !begin-bullet!
    `rename()`, `select()`, `group_by()`, `filter()`, `arrange()` and
    `transmute()` now have scoped variants (verbs suffixed with `_if()`,
    `_at()` and `_all()`). Like `mutate_all()`, `summarise_if()`, etc,
    these variants apply an operation to a selection of variables.

    !end-bullet!
-   !begin-bullet!
    The scoped verbs taking predicates (`mutate_if()`, `summarise_if()`,
    etc) now support S3 objects and lazy tables. S3 objects should
    implement methods for `length()`, `[[` and `tbl_vars()`. For lazy
    tables, the first 100 rows are collected and the predicate is
    applied on this subset of the data. This is robust for the common
    case of checking the type of a column (#2129).

    !end-bullet!
-   !begin-bullet!
    Summarise and mutate colwise functions pass `...` on to the
    manipulation functions.

    !end-bullet!
-   !begin-bullet!
    The performance of colwise verbs like `mutate_all()` is now back to
    where it was in `mutate_each()`.

    !end-bullet!
-   !begin-bullet!
    `funs()` has better handling of namespaced functions (#2089).

    !end-bullet!
-   !begin-bullet!
    Fix issue with `mutate_if()` and `summarise_if()` when a predicate
    function returns a vector of `FALSE` (#1989, #2009, #2011).

    !end-bullet!

!end-bullets-88!

## Tidyeval

dplyr has a new approach to non-standard evaluation (NSE) called
tidyeval. It is described in detail in `vignette("programming")` but, in
brief, gives you the ability to interpolate values in contexts where
dplyr usually works with expressions:

!begin-codeblock!

``` {r}
my_var <- quo(homeworld)

starwars %>%
  group_by(!!my_var) %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)
```

!end-codeblock!

This means that the underscored version of each main verb is no longer
needed, and so these functions have been deprecated (but remain around
for backward compatibility).

!begin-bullets-89!

-   !begin-bullet!
    `order_by()`, `top_n()`, `sample_n()` and `sample_frac()` now use
    tidyeval to capture their arguments by expression. This makes it
    possible to use unquoting idioms (see `vignette("programming")`) and
    fixes scoping issues (#2297).

    !end-bullet!
-   !begin-bullet!
    Most verbs taking dots now ignore the last argument if empty. This
    makes it easier to copy lines of code without having to worry about
    deleting trailing commas (#1039).

    !end-bullet!
-   !begin-bullet!
    \[API\] The new `.data` and `.env` environments can be used inside
    all verbs that operate on data: `.data$column_name` accesses the
    column `column_name`, whereas `.env$var` accesses the external
    variable `var`. Columns or external variables named `.data` or
    `.env` are shadowed, use `.data$...` and/or `.env$...` to access
    them. (`.data` implements strict matching also for the `$` operator
    (#2591).)

    The `column()` and `global()` functions have been removed. They were
    never documented officially. Use the new `.data` and `.env`
    environments instead.

    !end-bullet!
-   !begin-bullet!
    Expressions in verbs are now interpreted correctly in many cases
    that failed before (e.g., use of `$`, `case_when()`, nonstandard
    evaluation, ...). These expressions are now evaluated in a specially
    constructed temporary environment that retrieves column data on
    demand with the help of the `bindrcpp` package (#2190). This
    temporary environment poses restrictions on assignments using `<-`
    inside verbs. To prevent leaking of broken bindings, the temporary
    environment is cleared after the evaluation (#2435).

    !end-bullet!

!end-bullets-89!

## Verbs

### Joins

!begin-bullets-90!

-   !begin-bullet!
    \[API\] `xxx_join.tbl_df(na_matches = "never")` treats all `NA`
    values as different from each other (and from any other value), so
    that they never match. This corresponds to the behavior of joins for
    database sources, and of database joins in general. To match `NA`
    values, pass `na_matches = "na"` to the join verbs; this is only
    supported for data frames. The default is `na_matches = "na"`, kept
    for the sake of compatibility to v0.5.0. It can be tweaked by
    calling `pkgconfig::set_config("dplyr::na_matches", "na")` (#2033).

    !end-bullet!
-   !begin-bullet!
    `common_by()` gets a better error message for unexpected inputs
    (#2091)

    !end-bullet!
-   !begin-bullet!
    Fix groups when joining grouped data frames with duplicate columns
    (#2330, #2334, @davidkretch).

    !end-bullet!
-   !begin-bullet!
    One of the two join suffixes can now be an empty string, dplyr no
    longer hangs (#2228, #2445).

    !end-bullet!
-   !begin-bullet!
    Anti- and semi-joins warn if factor levels are inconsistent (#2741).

    !end-bullet!
-   !begin-bullet!
    Warnings about join column inconsistencies now contain the column
    names (#2728).

    !end-bullet!

!end-bullets-90!

### Select

!begin-bullets-91!

-   !begin-bullet!
    For selecting variables, the first selector decides if it's an
    inclusive selection (i.e., the initial column list is empty), or an
    exclusive selection (i.e., the initial column list contains all
    columns). This means that
    `select(mtcars, contains("am"), contains("FOO"), contains("vs"))`
    now returns again both `am` and `vs` columns like in dplyr 0.4.3
    (#2275, #2289, @r2evans).

    !end-bullet!
-   !begin-bullet!
    Select helpers now throw an error if called when no variables have
    been set (#2452)

    !end-bullet!
-   !begin-bullet!
    Helper functions in `select()` (and related verbs) are now evaluated
    in a context where column names do not exist (#2184).

    !end-bullet!
-   !begin-bullet!
    `select()` (and the internal function `select_vars()`) now support
    column names in addition to column positions. As a result,
    expressions like `select(mtcars, "cyl")` are now allowed.

    !end-bullet!

!end-bullets-91!

### Other

!begin-bullets-92!

-   !begin-bullet!
    `recode()`, `case_when()` and `coalesce()` now support splicing of
    arguments with rlang's `!!!` operator.

    !end-bullet!
-   !begin-bullet!
    `count()` now preserves the grouping of its input (#2021).

    !end-bullet!
-   !begin-bullet!
    `distinct()` no longer duplicates variables (#2001).

    !end-bullet!
-   !begin-bullet!
    Empty `distinct()` with a grouped data frame works the same way as
    an empty `distinct()` on an ungrouped data frame, namely it uses all
    variables (#2476).

    !end-bullet!
-   !begin-bullet!
    `copy_to()` now returns its output invisibly (since you're often
    just calling for the side-effect).

    !end-bullet!
-   !begin-bullet!
    `filter()` and `lag()` throw informative error if used with ts
    objects (#2219)

    !end-bullet!
-   !begin-bullet!
    `mutate()` recycles list columns of length 1 (#2171).

    !end-bullet!
-   !begin-bullet!
    `mutate()` gives better error message when attempting to add a
    non-vector column (#2319), or attempting to remove a column with
    `NULL` (#2187, #2439).

    !end-bullet!
-   !begin-bullet!
    `summarise()` now correctly evaluates newly created factors (#2217),
    and can create ordered factors (#2200).

    !end-bullet!
-   !begin-bullet!
    Ungrouped `summarise()` uses summary variables correctly (#2404,
    #2453).

    !end-bullet!
-   !begin-bullet!
    Grouped `summarise()` no longer converts character `NA` to empty
    strings (#1839).

    !end-bullet!

!end-bullets-92!

## Combining and comparing

!begin-bullets-93!

-   !begin-bullet!
    `all_equal()` now reports multiple problems as a character vector
    (#1819, #2442).

    !end-bullet!
-   !begin-bullet!
    `all_equal()` checks that factor levels are equal (#2440, #2442).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` and `bind_cols()` give an error for database tables
    (#2373).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` works correctly with `NULL` arguments and an `.id`
    argument (#2056), and also for zero-column data frames (#2175).

    !end-bullet!
-   !begin-bullet!
    Breaking change: `bind_rows()` and `combine()` are more strict when
    coercing. Logical values are no longer coerced to integer and
    numeric. Date, POSIXct and other integer or double-based classes are
    no longer coerced to integer or double as there is chance of
    attributes or information being lost (#2209, @zeehio).

    !end-bullet!
-   !begin-bullet!
    `bind_cols()` now calls `tibble::repair_names()` to ensure that all
    names are unique (#2248).

    !end-bullet!
-   !begin-bullet!
    `bind_cols()` handles empty argument list (#2048).

    !end-bullet!
-   !begin-bullet!
    `bind_cols()` better handles `NULL` inputs (#2303, #2443).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` explicitly rejects columns containing data frames
    (#2015, #2446).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` and `bind_cols()` now accept vectors. They are treated
    as rows by the former and columns by the latter. Rows require inner
    names like `c(col1 = 1, col2 = 2)`, while columns require outer
    names: `col1 = c(1, 2)`. Lists are still treated as data frames but
    can be spliced explicitly with `!!!`, e.g. `bind_rows(!!! x)`
    (#1676).

    !end-bullet!
-   !begin-bullet!
    `rbind_list()` and `rbind_all()` now call `.Deprecated()`, they will
    be removed in the next CRAN release. Please use `bind_rows()`
    instead.

    !end-bullet!
-   !begin-bullet!
    `combine()` accepts `NA` values (#2203, @zeehio)

    !end-bullet!
-   !begin-bullet!
    `combine()` and `bind_rows()` with character and factor types now
    always warn about the coercion to character (#2317, @zeehio)

    !end-bullet!
-   !begin-bullet!
    `combine()` and `bind_rows()` accept `difftime` objects.

    !end-bullet!
-   !begin-bullet!
    `mutate` coerces results from grouped dataframes accepting
    combinable data types (such as `integer` and `numeric`). (#1892,
    @zeehio)

    !end-bullet!

!end-bullets-93!

## Vector functions

!begin-bullets-94!

-   !begin-bullet!
    `%in%` gets new hybrid handler (#126).

    !end-bullet!
-   !begin-bullet!
    `between()` returns NA if `left` or `right` is `NA` (fixes #2562).

    !end-bullet!
-   !begin-bullet!
    `case_when()` supports `NA` values (#2000, @tjmahr).

    !end-bullet!
-   !begin-bullet!
    `first()`, `last()`, and `nth()` have better default values for
    factor, Dates, POSIXct, and data frame inputs (#2029).

    !end-bullet!
-   !begin-bullet!
    Fixed segmentation faults in hybrid evaluation of `first()`,
    `last()`, `nth()`, `lead()`, and `lag()`. These functions now always
    fall back to the R implementation if called with arguments that the
    hybrid evaluator cannot handle (#948, #1980).

    !end-bullet!
-   !begin-bullet!
    `n_distinct()` gets larger hash tables given slightly better
    performance (#977).

    !end-bullet!
-   !begin-bullet!
    `nth()` and `ntile()` are more careful about proper data types of
    their return values (#2306).

    !end-bullet!
-   !begin-bullet!
    `ntile()` ignores `NA` when computing group membership (#2564).

    !end-bullet!
-   !begin-bullet!
    `lag()` enforces integer `n` (#2162, @kevinushey).

    !end-bullet!
-   !begin-bullet!
    hybrid `min()` and `max()` now always return a `numeric` and work
    correctly in edge cases (empty input, all `NA`, ...) (#2305, #2436).

    !end-bullet!
-   !begin-bullet!
    `min_rank("string")` no longer segfaults in hybrid evaluation
    (#2279, #2444).

    !end-bullet!
-   !begin-bullet!
    `recode()` can now recode a factor to other types (#2268)

    !end-bullet!
-   !begin-bullet!
    `recode()` gains `.dots` argument to support passing replacements as
    list (#2110, @jlegewie).

    !end-bullet!

!end-bullets-94!

## Other minor changes and bug fixes

!begin-bullets-95!

-   !begin-bullet!
    Many error messages are more helpful by referring to a column name
    or a position in the argument list (#2448).

    !end-bullet!
-   !begin-bullet!
    New `is_grouped_df()` alias to `is.grouped_df()`.

    !end-bullet!
-   !begin-bullet!
    `tbl_vars()` now has a `group_vars` argument set to `TRUE` by
    default. If `FALSE`, group variables are not returned.

    !end-bullet!
-   !begin-bullet!
    Fixed segmentation fault after calling `rename()` on an invalid
    grouped data frame (#2031).

    !end-bullet!
-   !begin-bullet!
    `rename_vars()` gains a `strict` argument to control if an error is
    thrown when you try and rename a variable that doesn't exist.

    !end-bullet!
-   !begin-bullet!
    Fixed undefined behavior for `slice()` on a zero-column data frame
    (#2490).

    !end-bullet!
-   !begin-bullet!
    Fixed very rare case of false match during join (#2515).

    !end-bullet!
-   !begin-bullet!
    Restricted workaround for `match()` to R 3.3.0. (#1858).

    !end-bullet!
-   !begin-bullet!
    dplyr now warns on load when the version of R or Rcpp during
    installation is different to the currently installed version
    (#2514).

    !end-bullet!
-   !begin-bullet!
    Fixed improper reuse of attributes when creating a list column in
    `summarise()` and perhaps `mutate()` (#2231).

    !end-bullet!
-   !begin-bullet!
    `mutate()` and `summarise()` always strip the `names` attribute from
    new or updated columns, even for ungrouped operations (#1689).

    !end-bullet!
-   !begin-bullet!
    Fixed rare error that could lead to a segmentation fault in
    `all_equal(ignore_col_order = FALSE)` (#2502).

    !end-bullet!
-   !begin-bullet!
    The "dim" and "dimnames" attributes are always stripped when copying
    a vector (#1918, #2049).

    !end-bullet!
-   !begin-bullet!
    `grouped_df` and `rowwise` are registered officially as S3 classes.
    This makes them easier to use with S4 (#2276, @joranE, #2789).

    !end-bullet!
-   !begin-bullet!
    All operations that return tibbles now include the `"tbl"` class.
    This is important for correct printing with tibble 1.3.1 (#2789).

    !end-bullet!
-   !begin-bullet!
    Makeflags uses PKG_CPPFLAGS for defining preprocessor macros.

    !end-bullet!
-   !begin-bullet!
    astyle formatting for C++ code, tested but not changed as part of
    the tests (#2086, #2103).

    !end-bullet!
-   !begin-bullet!
    Update RStudio project settings to install tests (#1952).

    !end-bullet!
-   !begin-bullet!
    Using `Rcpp::interfaces()` to register C callable interfaces, and
    registering all native exported functions via `R_registerRoutines()`
    and `useDynLib(.registration = TRUE)` (#2146).

    !end-bullet!
-   !begin-bullet!
    Formatting of grouped data frames now works by overriding the
    `tbl_sum()` generic instead of `print()`. This means that the output
    is more consistent with tibble, and that `format()` is now supported
    also for SQL sources (#2781).

    !end-bullet!

!end-bullets-95!

# dplyr 0.5.0

## Breaking changes

### Existing functions

!begin-bullets-96!

-   !begin-bullet!
    `arrange()` once again ignores grouping (#1206).

    !end-bullet!
-   !begin-bullet!
    `distinct()` now only keeps the distinct variables. If you want to
    return all variables (using the first row for non-distinct values)
    use `.keep_all = TRUE` (#1110). For SQL sources, `.keep_all = FALSE`
    is implemented using `GROUP BY`, and `.keep_all = TRUE` raises an
    error (#1937, #1942, @krlmlr). (The default behaviour of using all
    variables when none are specified remains - this note only applies
    if you select some variables).

    !end-bullet!
-   !begin-bullet!
    The select helper functions `starts_with()`, `ends_with()` etc are
    now real exported functions. This means that you'll need to import
    those functions if you're using from a package where dplyr is not
    attached. i.e. `dplyr::select(mtcars, starts_with("m"))` used to
    work, but now you'll need
    `dplyr::select(mtcars, dplyr::starts_with("m"))`.

    !end-bullet!

!end-bullets-96!

### Deprecated and defunct functions

!begin-bullets-97!

-   !begin-bullet!
    The long deprecated `chain()`, `chain_q()` and `%.%` have been
    removed. Please use `%>%` instead.

    !end-bullet!
-   !begin-bullet!
    `id()` has been deprecated. Please use `group_indices()` instead
    (#808).

    !end-bullet!
-   !begin-bullet!
    `rbind_all()` and `rbind_list()` are formally deprecated. Please use
    `bind_rows()` instead (#803).

    !end-bullet!
-   !begin-bullet!
    Outdated benchmarking demos have been removed (#1487).

    !end-bullet!
-   !begin-bullet!
    Code related to starting and signalling clusters has been moved out
    to multidplyr.

    !end-bullet!

!end-bullets-97!

## New functions

!begin-bullets-98!

-   !begin-bullet!
    `coalesce()` finds the first non-missing value from a set of
    vectors. (#1666, thanks to @krlmlr for initial implementation).

    !end-bullet!
-   !begin-bullet!
    `case_when()` is a general vectorised if + else if (#631).

    !end-bullet!
-   !begin-bullet!
    `if_else()` is a vectorised if statement: it's a stricter
    (type-safe), faster, and more predictable version of `ifelse()`. In
    SQL it is translated to a `CASE` statement.

    !end-bullet!
-   !begin-bullet!
    `na_if()` makes it easy to replace a certain value with an `NA`
    (#1707). In SQL it is translated to `NULL_IF`.

    !end-bullet!
-   !begin-bullet!
    `near(x, y)` is a helper for `abs(x - y) < tol` (#1607).

    !end-bullet!
-   !begin-bullet!
    `recode()` is vectorised equivalent to `switch()` (#1710).

    !end-bullet!
-   !begin-bullet!
    `union_all()` method. Maps to `UNION ALL` for SQL sources,
    `bind_rows()` for data frames/tbl_dfs, and `combine()` for vectors
    (#1045).

    !end-bullet!
-   !begin-bullet!
    A new family of functions replace `summarise_each()` and
    `mutate_each()` (which will thus be deprecated in a future release).
    `summarise_all()` and `mutate_all()` apply a function to all columns
    while `summarise_at()` and `mutate_at()` operate on a subset of
    columns. These columns are selected with either a character vector
    of columns names, a numeric vector of column positions, or a column
    specification with `select()` semantics generated by the new
    `columns()` helper. In addition, `summarise_if()` and `mutate_if()`
    take a predicate function or a logical vector (these verbs currently
    require local sources). All these functions can now take ordinary
    functions instead of a list of functions generated by `funs()`
    (though this is only useful for local sources). (#1845, @lionel-)

    !end-bullet!
-   !begin-bullet!
    `select_if()` lets you select columns with a predicate function.
    Only compatible with local sources. (#497, #1569, @lionel-)

    !end-bullet!

!end-bullets-98!

## Local backends

### dtplyr

All data table related code has been separated out in to a new dtplyr
package. This decouples the development of the data.table interface from
the development of the dplyr package. If both data.table and dplyr are
loaded, you'll get a message reminding you to load dtplyr.

### Tibble

Functions related to the creation and coercion of `tbl_df`s, now live in
their own package: tibble. See `vignette("tibble")` for more details.

!begin-bullets-99!

-   !begin-bullet!
    `$` and `[[` methods that never do partial matching (#1504), and
    throw an error if the variable does not exist.

    !end-bullet!
-   !begin-bullet!
    `all_equal()` allows to compare data frames ignoring row and column
    order, and optionally ignoring minor differences in type (e.g. int
    vs. double) (#821). The test handles the case where the df has 0
    columns (#1506). The test fails fails when convert is `FALSE` and
    types don't match (#1484).

    !end-bullet!
-   !begin-bullet!
    `all_equal()` shows better error message when comparing raw values
    or when types are incompatible and `convert = TRUE` (#1820,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `add_row()` makes it easy to add a new row to data frame (#1021)

    !end-bullet!
-   !begin-bullet!
    `as_data_frame()` is now an S3 generic with methods for lists (the
    old `as_data_frame()`), data frames (trivial), and matrices (with
    efficient C++ implementation) (#876). It no longer strips
    subclasses.

    !end-bullet!
-   !begin-bullet!
    The internals of `data_frame()` and `as_data_frame()` have been
    aligned, so `as_data_frame()` will now automatically recycle
    length-1 vectors. Both functions give more informative error
    messages if you attempting to create an invalid data frame. You can
    no longer create a data frame with duplicated names (#820). Both
    check for `POSIXlt` columns, and tell you to use `POSIXct` instead
    (#813).

    !end-bullet!
-   !begin-bullet!
    `frame_data()` properly constructs rectangular tables (#1377,
    @kevinushey), and supports list-cols.

    !end-bullet!
-   !begin-bullet!
    `glimpse()` is now a generic. The default method dispatches to
    `str()` (#1325). It now (invisibly) returns its first argument
    (#1570).

    !end-bullet!
-   !begin-bullet!
    `lst()` and `lst_()` which create lists in the same way that
    `data_frame()` and `data_frame_()` create data frames (#1290).

    !end-bullet!
-   !begin-bullet!
    `print.tbl_df()` is considerably faster if you have very wide data
    frames. It will now also only list the first 100 additional
    variables not already on screen - control this with the new
    `n_extra` parameter to `print()` (#1161). When printing a grouped
    data frame the number of groups is now printed with thousands
    separators (#1398). The type of list columns is correctly printed
    (#1379)

    !end-bullet!
-   !begin-bullet!
    Package includes `setOldClass(c("tbl_df", "tbl", "data.frame"))` to
    help with S4 dispatch (#969).

    !end-bullet!
-   !begin-bullet!
    `tbl_df` automatically generates column names (#1606).

    !end-bullet!

!end-bullets-99!

### tbl_cube

!begin-bullets-100!

-   !begin-bullet!
    new `as_data_frame.tbl_cube()` (#1563, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `tbl_cube`s are now constructed correctly from data frames,
    duplicate dimension values are detected, missing dimension values
    are filled with `NA`. The construction from data frames now guesses
    the measure variables by default, and allows specification of
    dimension and/or measure variables (#1568, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Swap order of `dim_names` and `met_name` arguments in `as.tbl_cube`
    (for `array`, `table` and `matrix`) for consistency with `tbl_cube`
    and `as.tbl_cube.data.frame`. Also, the `met_name` argument to
    `as.tbl_cube.table` now defaults to `"Freq"` for consistency with
    `as.data.frame.table` (@krlmlr, #1374).

    !end-bullet!

!end-bullets-100!

## Remote backends

!begin-bullets-101!

-   !begin-bullet!
    `as_data_frame()` on SQL sources now returns all rows (#1752, #1821,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `compute()` gets new parameters `indexes` and `unique_indexes` that
    make it easier to add indexes (#1499, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `db_explain()` gains a default method for DBIConnections (#1177).

    !end-bullet!
-   !begin-bullet!
    The backend testing system has been improved. This lead to the
    removal of `temp_srcs()`. In the unlikely event that you were using
    this function, you can instead use `test_register_src()`,
    `test_load()`, and `test_frame()`.

    !end-bullet!
-   !begin-bullet!
    You can now use `right_join()` and `full_join()` with remote tables
    (#1172).

    !end-bullet!

!end-bullets-101!

### SQLite

!begin-bullets-102!

-   !begin-bullet!
    `src_memdb()` is a session-local in-memory SQLite database.
    `memdb_frame()` works like `data_frame()`, but creates a new table
    in that database.

    !end-bullet!
-   !begin-bullet!
    `src_sqlite()` now uses a stricter quoting character, `` ` ``,
    instead of `"`. SQLite "helpfully" will convert `"x"` into a string
    if there is no identifier called x in the current scope (#1426).

    !end-bullet!
-   !begin-bullet!
    `src_sqlite()` throws errors if you try and use it with window
    functions (#907).

    !end-bullet!

!end-bullets-102!

### SQL translation

!begin-bullets-103!

-   !begin-bullet!
    `filter.tbl_sql()` now puts parens around each argument (#934).

    !end-bullet!
-   !begin-bullet!
    Unary `-` is better translated (#1002).

    !end-bullet!
-   !begin-bullet!
    `escape.POSIXt()` method makes it easier to use date times. The date
    is rendered in ISO 8601 format in UTC, which should work in most
    databases (#857).

    !end-bullet!
-   !begin-bullet!
    `is.na()` gets a missing space (#1695).

    !end-bullet!
-   !begin-bullet!
    `if`, `is.na()`, and `is.null()` get extra parens to make precedence
    more clear (#1695).

    !end-bullet!
-   !begin-bullet!
    `pmin()` and `pmax()` are translated to `MIN()` and `MAX()` (#1711).

    !end-bullet!
-   !begin-bullet!
    Window functions:

    !begin-bullets-104!
    -   !begin-bullet!
        Work on ungrouped data (#1061).

        !end-bullet!
    -   !begin-bullet!
        Warning if order is not set on cumulative window functions.

        !end-bullet!
    -   !begin-bullet!
        Multiple partitions or ordering variables in windowed functions
        no longer generate extra parentheses, so should work for more
        databases (#1060)

        !end-bullet!

    !end-bullets-104!
    !end-bullet!

!end-bullets-103!

### Internals

This version includes an almost total rewrite of how dplyr verbs are
translated into SQL. Previously, I used a rather ad-hoc approach, which
tried to guess when a new subquery was needed. Unfortunately this
approach was fraught with bugs, so in this version I've implemented a
much richer internal data model. Now there is a three step process:

1.  When applied to a `tbl_lazy`, each dplyr verb captures its inputs
    and stores in a `op` (short for operation) object.

2.  `sql_build()` iterates through the operations building to build up
    an object that represents a SQL query. These objects are convenient
    for testing as they are lists, and are backend agnostics.

3.  `sql_render()` iterates through the queries and generates the SQL,
    using generics (like `sql_select()`) that can vary based on the
    backend.

In the short-term, this increased abstraction is likely to lead to some
minor performance decreases, but the chance of dplyr generating correct
SQL is much much higher. In the long-term, these abstractions will make
it possible to write a query optimiser/compiler in dplyr, which would
make it possible to generate much more succinct queries.

If you have written a dplyr backend, you'll need to make some minor
changes to your package:

!begin-bullets-105!

-   !begin-bullet!
    `sql_join()` has been considerably simplified - it is now only
    responsible for generating the join query, not for generating the
    intermediate selects that rename the variable. Similarly for
    `sql_semi_join()`. If you've provided new methods in your backend,
    you'll need to rewrite.

    !end-bullet!
-   !begin-bullet!
    `select_query()` gains a distinct argument which is used for
    generating queries for `distinct()`. It loses the `offset` argument
    which was never used (and hence never tested).

    !end-bullet!
-   !begin-bullet!
    `src_translate_env()` has been replaced by `sql_translate_env()`
    which should have methods for the connection object.

    !end-bullet!

!end-bullets-105!

There were two other tweaks to the exported API, but these are less
likely to affect anyone.

!begin-bullets-106!

-   !begin-bullet!
    `translate_sql()` and `partial_eval()` got a new API: now use
    connection + variable names, rather than a `tbl`. This makes testing
    considerably easier. `translate_sql_q()` has been renamed to
    `translate_sql_()`.

    !end-bullet!
-   !begin-bullet!
    Also note that the sql generation generics now have a default
    method, instead methods for DBIConnection and NULL.

    !end-bullet!

!end-bullets-106!

## Minor improvements and bug fixes

### Single table verbs

!begin-bullets-107!

-   !begin-bullet!
    Avoiding segfaults in presence of `raw` columns (#1803, #1817,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `arrange()` fails gracefully on list columns (#1489) and matrices
    (#1870, #1945, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `count()` now adds additional grouping variables, rather than
    overriding existing (#1703). `tally()` and `count()` can now count a
    variable called `n` (#1633). Weighted `count()`/`tally()` ignore
    `NA`s (#1145).

    !end-bullet!
-   !begin-bullet!
    The progress bar in `do()` is now updated at most 20 times per
    second, avoiding unnecessary redraws (#1734, @mkuhn)

    !end-bullet!
-   !begin-bullet!
    `distinct()` doesn't crash when given a 0-column data frame (#1437).

    !end-bullet!
-   !begin-bullet!
    `filter()` throws an error if you supply an named arguments. This is
    usually a type: `filter(df, x = 1)` instead of `filter(df, x == 1)`
    (#1529).

    !end-bullet!
-   !begin-bullet!
    `summarise()` correctly coerces factors with different levels
    (#1678), handles min/max of already summarised variable (#1622), and
    supports data frames as columns (#1425).

    !end-bullet!
-   !begin-bullet!
    `select()` now informs you that it adds missing grouping variables
    (#1511). It works even if the grouping variable has a non-syntactic
    name (#1138). Negating a failed match
    (e.g. `select(mtcars, -contains("x"))`) returns all columns, instead
    of no columns (#1176)

    The `select()` helpers are now exported and have their own
    documentation (#1410). `one_of()` gives a useful error message if
    variables names are not found in data frame (#1407).

    !end-bullet!
-   !begin-bullet!
    The naming behaviour of `summarise_each()` and `mutate_each()` has
    been tweaked so that you can force inclusion of both the function
    and the variable name:
    `summarise_each(mtcars, funs(mean = mean), everything())` (#442).

    !end-bullet!
-   !begin-bullet!
    `mutate()` handles factors that are all `NA` (#1645), or have
    different levels in different groups (#1414). It disambiguates `NA`
    and `NaN` (#1448), and silently promotes groups that only contain
    `NA` (#1463). It deep copies data in list columns (#1643), and
    correctly fails on incompatible columns (#1641). `mutate()` on a
    grouped data no longer groups grouping attributes (#1120).
    `rowwise()` mutate gives expected results (#1381).

    !end-bullet!
-   !begin-bullet!
    `one_of()` tolerates unknown variables in `vars`, but warns (#1848,
    @jennybc).

    !end-bullet!
-   !begin-bullet!
    `print.grouped_df()` passes on `...` to `print()` (#1893).

    !end-bullet!
-   !begin-bullet!
    `slice()` correctly handles grouped attributes (#1405).

    !end-bullet!
-   !begin-bullet!
    `ungroup()` generic gains `...` (#922).

    !end-bullet!

!end-bullets-107!

### Dual table verbs

!begin-bullets-108!

-   !begin-bullet!
    `bind_cols()` matches the behaviour of `bind_rows()` and ignores
    `NULL` inputs (#1148). It also handles `POSIXct`s with integer base
    type (#1402).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` handles 0-length named lists (#1515), promotes factors
    to characters (#1538), and warns when binding factor and character
    (#1485). bind_rows()\` is more flexible in the way it can accept
    data frames, lists, list of data frames, and list of lists (#1389).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` rejects `POSIXlt` columns (#1875, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Both `bind_cols()` and `bind_rows()` infer classes and grouping
    information from the first data frame (#1692).

    !end-bullet!
-   !begin-bullet!
    `rbind()` and `cbind()` get `grouped_df()` methods that make it
    harder to create corrupt data frames (#1385). You should still
    prefer `bind_rows()` and `bind_cols()`.

    !end-bullet!
-   !begin-bullet!
    Joins now use correct class when joining on `POSIXct` columns
    (#1582, @joel23888), and consider time zones (#819). Joins handle a
    `by` that is empty (#1496), or has duplicates (#1192). Suffixes grow
    progressively to avoid creating repeated column names (#1460). Joins
    on string columns should be substantially faster (#1386). Extra
    attributes are ok if they are identical (#1636). Joins work correct
    when factor levels not equal (#1712, #1559). Anti- and semi-joins
    give correct result when by variable is a factor (#1571), but warn
    if factor levels are inconsistent (#2741). A clear error message is
    given for joins where an explicit `by` contains unavailable columns
    (#1928, #1932). Warnings about join column inconsistencies now
    contain the column names (#2728).

    !end-bullet!
-   !begin-bullet!
    `inner_join()`, `left_join()`, `right_join()`, and `full_join()`
    gain a `suffix` argument which allows you to control what suffix
    duplicated variable names receive (#1296).

    !end-bullet!
-   !begin-bullet!
    Set operations (`intersect()`, `union()` etc) respect coercion rules
    (#799). `setdiff()` handles factors with `NA` levels (#1526).

    !end-bullet!
-   !begin-bullet!
    There were a number of fixes to enable joining of data frames that
    don't have the same encoding of column names (#1513), including
    working around bug 16885 regarding `match()` in R 3.3.0 (#1806,
    #1810, @krlmlr).

    !end-bullet!

!end-bullets-108!

### Vector functions

!begin-bullets-109!

-   !begin-bullet!
    `combine()` silently drops `NULL` inputs (#1596).

    !end-bullet!
-   !begin-bullet!
    Hybrid `cummean()` is more stable against floating point errors
    (#1387).

    !end-bullet!
-   !begin-bullet!
    Hybrid `lead()` and `lag()` received a considerable overhaul. They
    are more careful about more complicated expressions (#1588), and
    falls back more readily to pure R evaluation (#1411). They behave
    correctly in `summarise()` (#1434). and handle default values for
    string columns.

    !end-bullet!
-   !begin-bullet!
    Hybrid `min()` and `max()` handle empty sets (#1481).

    !end-bullet!
-   !begin-bullet!
    `n_distinct()` uses multiple arguments for data frames (#1084),
    falls back to R evaluation when needed (#1657), reverting decision
    made in (#567). Passing no arguments gives an error (#1957, #1959,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `nth()` now supports negative indices to select from end,
    e.g. `nth(x, -2)` selects the 2nd value from the end of `x` (#1584).

    !end-bullet!
-   !begin-bullet!
    `top_n()` can now also select bottom `n` values by passing a
    negative value to `n` (#1008, #1352).

    !end-bullet!
-   !begin-bullet!
    Hybrid evaluation leaves formulas untouched (#1447).

    !end-bullet!

!end-bullets-109!

# dplyr 0.4.3

## Improved encoding support

Until now, dplyr's support for non-UTF8 encodings has been rather shaky.
This release brings a number of improvement to fix these problems: it's
probably not perfect, but should be a lot better than the previously
version. This includes fixes to `arrange()` (#1280), `bind_rows()`
(#1265), `distinct()` (#1179), and joins (#1315). `print.tbl_df()` also
received a fix for strings with invalid encodings (#851).

## Other minor improvements and bug fixes

!begin-bullets-110!

-   !begin-bullet!
    `frame_data()` provides a means for constructing `data_frame`s using
    a simple row-wise language. (#1358, @kevinushey)

    !end-bullet!
-   !begin-bullet!
    `all.equal()` no longer runs all outputs together (#1130).

    !end-bullet!
-   !begin-bullet!
    `as_data_frame()` gives better error message with NA column names
    (#1101).

    !end-bullet!
-   !begin-bullet!
    `[.tbl_df` is more careful about subsetting column names (#1245).

    !end-bullet!
-   !begin-bullet!
    `arrange()` and `mutate()` work on empty data frames (#1142).

    !end-bullet!
-   !begin-bullet!
    `arrange()`, `filter()`, `slice()`, and `summarise()` preserve data
    frame meta attributes (#1064).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` and `bind_cols()` accept lists (#1104): during initial
    data cleaning you no longer need to convert lists to data frames,
    but can instead feed them to `bind_rows()` directly.

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` gains a `.id` argument. When supplied, it creates a
    new column that gives the name of each data frame (#1337, @lionel-).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` respects the `ordered` attribute of factors (#1112),
    and does better at comparing `POSIXct`s (#1125). The `tz` attribute
    is ignored when determining if two `POSIXct` vectors are comparable.
    If the `tz` of all inputs is the same, it's used, otherwise its set
    to `UTC`.

    !end-bullet!
-   !begin-bullet!
    `data_frame()` always produces a `tbl_df` (#1151, @kevinushey)

    !end-bullet!
-   !begin-bullet!
    `filter(x, TRUE, TRUE)` now just returns `x` (#1210), it doesn't
    internally modify the first argument (#971), and it now works with
    rowwise data (#1099). It once again works with data tables (#906).

    !end-bullet!
-   !begin-bullet!
    `glimpse()` also prints out the number of variables in addition to
    the number of observations (@ilarischeinin, #988).

    !end-bullet!
-   !begin-bullet!
    Joins handles matrix columns better (#1230), and can join `Date`
    objects with heterogeneous representations (some `Date`s are
    integers, while other are numeric). This also improves `all.equal()`
    (#1204).

    !end-bullet!
-   !begin-bullet!
    Fixed `percent_rank()` and `cume_dist()` so that missing values no
    longer affect denominator (#1132).

    !end-bullet!
-   !begin-bullet!
    `print.tbl_df()` now displays the class for all variables, not just
    those that don't fit on the screen (#1276). It also displays
    duplicated column names correctly (#1159).

    !end-bullet!
-   !begin-bullet!
    `print.grouped_df()` now tells you how many groups there are.

    !end-bullet!
-   !begin-bullet!
    `mutate()` can set to `NULL` the first column (used to segfault,
    #1329) and it better protects intermediary results (avoiding random
    segfaults, #1231).

    !end-bullet!
-   !begin-bullet!
    `mutate()` on grouped data handles the special case where for the
    first few groups, the result consists of a `logical` vector with
    only `NA`. This can happen when the condition of an `ifelse` is an
    all `NA` logical vector (#958).

    !end-bullet!
-   !begin-bullet!
    `mutate.rowwise_df()` handles factors (#886) and correctly handles
    0-row inputs (#1300).

    !end-bullet!
-   !begin-bullet!
    `n_distinct()` gains an `na_rm` argument (#1052).

    !end-bullet!
-   !begin-bullet!
    The `Progress` bar used by `do()` now respects global option
    `dplyr.show_progress` (default is TRUE) so you can turn it off
    globally (@jimhester #1264, #1226).

    !end-bullet!
-   !begin-bullet!
    `summarise()` handles expressions that returning heterogenous
    outputs, e.g. `median()`, which that sometimes returns an integer,
    and other times a numeric (#893).

    !end-bullet!
-   !begin-bullet!
    `slice()` silently drops columns corresponding to an NA (#1235).

    !end-bullet!
-   !begin-bullet!
    `ungroup.rowwise_df()` gives a `tbl_df` (#936).

    !end-bullet!
-   !begin-bullet!
    More explicit duplicated column name error message (#996).

    !end-bullet!
-   !begin-bullet!
    When "," is already being used as the decimal point
    (`getOption("OutDec")`), use "." as the thousands separator when
    printing out formatted numbers (@ilarischeinin, #988).

    !end-bullet!

!end-bullets-110!

## Databases

!begin-bullets-111!

-   !begin-bullet!
    `db_query_fields.SQLiteConnection` uses `build_sql` rather than
    `paste0` (#926, @NikNakk)

    !end-bullet!
-   !begin-bullet!
    Improved handling of `log()` (#1330).

    !end-bullet!
-   !begin-bullet!
    `n_distinct(x)` is translated to `COUNT(DISTINCT(x))` (@skparkes,
    #873).

    !end-bullet!
-   !begin-bullet!
    `print(n = Inf)` now works for remote sources (#1310).

    !end-bullet!

!end-bullets-111!

## Hybrid evaluation

!begin-bullets-112!

-   !begin-bullet!
    Hybrid evaluation does not take place for objects with a class
    (#1237).

    !end-bullet!
-   !begin-bullet!
    Improved `$` handling (#1134).

    !end-bullet!
-   !begin-bullet!
    Simplified code for `lead()` and `lag()` and make sure they work
    properly on factors (#955). Both respect the `default` argument
    (#915).

    !end-bullet!
-   !begin-bullet!
    `mutate` can set to `NULL` the first column (used to segfault,
    #1329).

    !end-bullet!
-   !begin-bullet!
    `filter` on grouped data handles indices correctly (#880).

    !end-bullet!
-   !begin-bullet!
    `sum()` issues a warning about integer overflow (#1108).

    !end-bullet!

!end-bullets-112!

# dplyr 0.4.2

This is a minor release containing fixes for a number of crashes and
issues identified by R CMD CHECK. There is one new "feature": dplyr no
longer complains about unrecognised attributes, and instead just copies
them over to the output.

!begin-bullets-113!

-   !begin-bullet!
    `lag()` and `lead()` for grouped data were confused about indices
    and therefore produced wrong results (#925, #937). `lag()` once
    again overrides `lag()` instead of just the default method
    `lag.default()`. This is necessary due to changes in R CMD check. To
    use the lag function provided by another package, use `pkg::lag`.

    !end-bullet!
-   !begin-bullet!
    Fixed a number of memory issues identified by valgrind.

    !end-bullet!
-   !begin-bullet!
    Improved performance when working with large number of columns
    (#879).

    !end-bullet!
-   !begin-bullet!
    Lists-cols that contain data frames now print a slightly nicer
    summary (#1147)

    !end-bullet!
-   !begin-bullet!
    Set operations give more useful error message on incompatible data
    frames (#903).

    !end-bullet!
-   !begin-bullet!
    `all.equal()` gives the correct result when `ignore_row_order` is
    `TRUE` (#1065) and `all.equal()` correctly handles character missing
    values (#1095).

    !end-bullet!
-   !begin-bullet!
    `bind_cols()` always produces a `tbl_df` (#779).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` gains a test for a form of data frame corruption
    (#1074).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` and `summarise()` now handles complex columns (#933).

    !end-bullet!
-   !begin-bullet!
    Workaround for using the constructor of `DataFrame` on an
    unprotected object (#998)

    !end-bullet!
-   !begin-bullet!
    Improved performance when working with large number of columns
    (#879).

    !end-bullet!

!end-bullets-113!

# dplyr 0.4.1

!begin-bullets-114!

-   !begin-bullet!
    Don't assume that RPostgreSQL is available.
    !end-bullet!

!end-bullets-114!

# dplyr 0.4.0

## New features

!begin-bullets-115!

-   !begin-bullet!
    `add_rownames()` turns row names into an explicit variable (#639).

    !end-bullet!
-   !begin-bullet!
    `as_data_frame()` efficiently coerces a list into a data frame
    (#749).

    !end-bullet!
-   !begin-bullet!
    `bind_rows()` and `bind_cols()` efficiently bind a list of data
    frames by row or column. `combine()` applies the same coercion rules
    to vectors (it works like `c()` or `unlist()` but is consistent with
    the `bind_rows()` rules).

    !end-bullet!
-   !begin-bullet!
    `right_join()` (include all rows in `y`, and matching rows in `x`)
    and `full_join()` (include all rows in `x` and `y`) complete the
    family of mutating joins (#96).

    !end-bullet!
-   !begin-bullet!
    `group_indices()` computes a unique integer id for each group
    (#771). It can be called on a grouped_df without any arguments or on
    a data frame with same arguments as `group_by()`.

    !end-bullet!

!end-bullets-115!

## New vignettes

!begin-bullets-116!

-   !begin-bullet!
    `vignette("data_frames")` describes dplyr functions that make it
    easier and faster to create and coerce data frames. It subsumes the
    old `memory` vignette.

    !end-bullet!
-   !begin-bullet!
    `vignette("two-table")` describes how two-table verbs work in dplyr.

    !end-bullet!

!end-bullets-116!

## Minor improvements

!begin-bullets-117!

-   !begin-bullet!
    `data_frame()` (and `as_data_frame()` & `tbl_df()`) now explicitly
    forbid columns that are data frames or matrices (#775). All columns
    must be either a 1d atomic vector or a 1d list.

    !end-bullet!
-   !begin-bullet!
    `do()` uses lazyeval to correctly evaluate its arguments in the
    correct environment (#744), and new `do_()` is the SE equivalent of
    `do()` (#718). You can modify grouped data in place: this is
    probably a bad idea but it's sometimes convenient (#737). `do()` on
    grouped data tables now passes in all columns (not all columns
    except grouping vars) (#735, thanks to @kismsu). `do()` with
    database tables no longer potentially includes grouping variables
    twice (#673). Finally, `do()` gives more consistent outputs when
    there are no rows or no groups (#625).

    !end-bullet!
-   !begin-bullet!
    `first()` and `last()` preserve factors, dates and times (#509).

    !end-bullet!
-   !begin-bullet!
    Overhaul of single table verbs for data.table backend. They now all
    use a consistent (and simpler) code base. This ensures that (e.g.)
    `n()` now works in all verbs (#579).

    !end-bullet!
-   !begin-bullet!
    In `*_join()`, you can now name only those variables that are
    different between the two tables,
    e.g. `inner_join(x, y, c("a", "b", "c" = "d"))` (#682). If non-join
    columns are the same, dplyr will add `.x` and `.y` suffixes to
    distinguish the source (#655).

    !end-bullet!
-   !begin-bullet!
    `mutate()` handles complex vectors (#436) and forbids `POSIXlt`
    results (instead of crashing) (#670).

    !end-bullet!
-   !begin-bullet!
    `select()` now implements a more sophisticated algorithm so if
    you're doing multiples includes and excludes with and without names,
    you're more likely to get what you expect (#644). You'll also get a
    better error message if you supply an input that doesn't resolve to
    an integer column position (#643).

    !end-bullet!
-   !begin-bullet!
    Printing has received a number of small tweaks. All `print()`
    methods invisibly return their input so you can interleave `print()`
    statements into a pipeline to see interim results. `print()` will
    column names of 0 row data frames (#652), and will never print more
    20 rows (i.e. `options(dplyr.print_max)` is now 20), not 100 (#710).
    Row names are no never printed since no dplyr method is guaranteed
    to preserve them (#669).

    `glimpse()` prints the number of observations (#692)

    `type_sum()` gains a data frame method.

    !end-bullet!
-   !begin-bullet!
    `summarise()` handles list output columns (#832)

    !end-bullet!
-   !begin-bullet!
    `slice()` works for data tables (#717). Documentation clarifies that
    slice can't work with relational databases, and the examples show
    how to achieve the same results using `filter()` (#720).

    !end-bullet!
-   !begin-bullet!
    dplyr now requires RSQLite \>= 1.0. This shouldn't affect your code
    in any way (except that RSQLite now doesn't need to be attached) but
    does simplify the internals (#622).

    !end-bullet!
-   !begin-bullet!
    Functions that need to combine multiple results into a single column
    (e.g. `join()`, `bind_rows()` and `summarise()`) are more careful
    about coercion.

    Joining factors with the same levels in the same order preserves the
    original levels (#675). Joining factors with non-identical levels
    generates a warning and coerces to character (#684). Joining a
    character to a factor (or vice versa) generates a warning and
    coerces to character. Avoid these warnings by ensuring your data is
    compatible before joining.

    `rbind_list()` will throw an error if you attempt to combine an
    integer and factor (#751). `rbind()`ing a column full of `NA`s is
    allowed and just collects the appropriate missing value for the
    column type being collected (#493).

    `summarise()` is more careful about `NA`, e.g. the decision on the
    result type will be delayed until the first non NA value is returned
    (#599). It will complain about loss of precision coercions, which
    can happen for expressions that return integers for some groups and
    a doubles for others (#599).

    !end-bullet!
-   !begin-bullet!
    A number of functions gained new or improved hybrid handlers:
    `first()`, `last()`, `nth()` (#626), `lead()` & `lag()` (#683),
    `%in%` (#126). That means when you use these functions in a dplyr
    verb, we handle them in C++, rather than calling back to R, and
    hence improving performance.

    Hybrid `min_rank()` correctly handles `NaN` values (#726). Hybrid
    implementation of `nth()` falls back to R evaluation when `n` is not
    a length one integer or numeric, e.g. when it's an expression
    (#734).

    Hybrid `dense_rank()`, `min_rank()`, `cume_dist()`, `ntile()`,
    `row_number()` and `percent_rank()` now preserve NAs (#774)

    !end-bullet!
-   !begin-bullet!
    `filter` returns its input when it has no rows or no columns (#782).

    !end-bullet!
-   !begin-bullet!
    Join functions keep attributes (e.g. time zone information) from the
    left argument for `POSIXct` and `Date` objects (#819), and only only
    warn once about each incompatibility (#798).

    !end-bullet!

!end-bullets-117!

## Bug fixes

!begin-bullets-118!

-   !begin-bullet!
    `[.tbl_df` correctly computes row names for 0-column data frames,
    avoiding problems with xtable (#656). `[.grouped_df` will silently
    drop grouping if you don't include the grouping columns (#733).

    !end-bullet!
-   !begin-bullet!
    `data_frame()` now acts correctly if the first argument is a vector
    to be recycled. (#680 thanks @jimhester)

    !end-bullet!
-   !begin-bullet!
    `filter.data.table()` works if the table has a variable called "V1"
    (#615).

    !end-bullet!
-   !begin-bullet!
    `*_join()` keeps columns in original order (#684). Joining a factor
    to a character vector doesn't segfault (#688). `*_join` functions
    can now deal with multiple encodings (#769), and correctly name
    results (#855).

    !end-bullet!
-   !begin-bullet!
    `*_join.data.table()` works when data.table isn't attached (#786).

    !end-bullet!
-   !begin-bullet!
    `group_by()` on a data table preserves original order of the rows
    (#623). `group_by()` supports variables with more than 39 characters
    thanks to a fix in lazyeval (#705). It gives meaningful error
    message when a variable is not found in the data frame (#716).

    !end-bullet!
-   !begin-bullet!
    `grouped_df()` requires `vars` to be a list of symbols (#665).

    !end-bullet!
-   !begin-bullet!
    `min(.,na.rm = TRUE)` works with `Date`s built on numeric vectors
    (#755).

    !end-bullet!
-   !begin-bullet!
    `rename_()` generic gets missing `.dots` argument (#708).

    !end-bullet!
-   !begin-bullet!
    `row_number()`, `min_rank()`, `percent_rank()`, `dense_rank()`,
    `ntile()` and `cume_dist()` handle data frames with 0 rows (#762).
    They all preserve missing values (#774). `row_number()` doesn't
    segfault when giving an external variable with the wrong number of
    variables (#781).

    !end-bullet!
-   !begin-bullet!
    `group_indices` handles the edge case when there are no variables
    (#867).

    !end-bullet!
-   !begin-bullet!
    Removed bogus `NAs introduced by coercion to integer range` on
    32-bit Windows (#2708).

    !end-bullet!

!end-bullets-118!

# dplyr 0.3.0.1

!begin-bullets-119!

-   !begin-bullet!
    Fixed problem with test script on Windows.
    !end-bullet!

!end-bullets-119!

# dplyr 0.3

## New functions

!begin-bullets-120!

-   !begin-bullet!
    `between()` vector function efficiently determines if numeric values
    fall in a range, and is translated to special form for SQL (#503).

    !end-bullet!
-   !begin-bullet!
    `count()` makes it even easier to do (weighted) counts (#358).

    !end-bullet!
-   !begin-bullet!
    `data_frame()` by @kevinushey is a nicer way of creating data
    frames. It never coerces column types (no more
    `stringsAsFactors = FALSE`!), never munges column names, and never
    adds row names. You can use previously defined columns to compute
    new columns (#376).

    !end-bullet!
-   !begin-bullet!
    `distinct()` returns distinct (unique) rows of a tbl (#97). Supply
    additional variables to return the first row for each unique
    combination of variables.

    !end-bullet!
-   !begin-bullet!
    Set operations, `intersect()`, `union()` and `setdiff()` now have
    methods for data frames, data tables and SQL database tables (#93).
    They pass their arguments down to the base functions, which will
    ensure they raise errors if you pass in two many arguments.

    !end-bullet!
-   !begin-bullet!
    Joins (e.g. `left_join()`, `inner_join()`, `semi_join()`,
    `anti_join()`) now allow you to join on different variables in `x`
    and `y` tables by supplying a named vector to `by`. For example,
    `by = c("a" = "b")` joins `x.a` to `y.b`.

    !end-bullet!
-   !begin-bullet!
    `n_groups()` function tells you how many groups in a tbl. It returns
    1 for ungrouped data. (#477)

    !end-bullet!
-   !begin-bullet!
    `transmute()` works like `mutate()` but drops all variables that you
    didn't explicitly refer to (#302).

    !end-bullet!
-   !begin-bullet!
    `rename()` makes it easy to rename variables - it works similarly to
    `select()` but it preserves columns that you didn't otherwise touch.

    !end-bullet!
-   !begin-bullet!
    `slice()` allows you to selecting rows by position (#226). It
    includes positive integers, drops negative integers and you can use
    expression like `n()`.

    !end-bullet!

!end-bullets-120!

## Programming with dplyr (non-standard evaluation)

!begin-bullets-121!

-   !begin-bullet!
    You can now program with dplyr - every function that does
    non-standard evaluation (NSE) has a standard evaluation (SE) version
    ending in `_`. This is powered by the new lazyeval package which
    provides all the tools needed to implement NSE consistently and
    correctly.

    !end-bullet!
-   !begin-bullet!
    See `vignette("nse")` for full details.

    !end-bullet!
-   !begin-bullet!
    `regroup()` is deprecated. Please use the more flexible
    `group_by_()` instead.

    !end-bullet!
-   !begin-bullet!
    `summarise_each_q()` and `mutate_each_q()` are deprecated. Please
    use `summarise_each_()` and `mutate_each_()` instead.

    !end-bullet!
-   !begin-bullet!
    `funs_q` has been replaced with `funs_`.

    !end-bullet!

!end-bullets-121!

## Removed and deprecated features

!begin-bullets-122!

-   !begin-bullet!
    `%.%` has been deprecated: please use `%>%` instead. `chain()` is
    defunct. (#518)

    !end-bullet!
-   !begin-bullet!
    `filter.numeric()` removed. Need to figure out how to reimplement
    with new lazy eval system.

    !end-bullet!
-   !begin-bullet!
    The `Progress` refclass is no longer exported to avoid conflicts
    with shiny. Instead use `progress_estimated()` (#535).

    !end-bullet!
-   !begin-bullet!
    `src_monetdb()` is now implemented in MonetDB.R, not dplyr.

    !end-bullet!
-   !begin-bullet!
    `show_sql()` and `explain_sql()` and matching global options
    `dplyr.show_sql` and `dplyr.explain_sql` have been removed. Instead
    use `show_query()` and `explain()`.

    !end-bullet!

!end-bullets-122!

## Minor improvements and bug fixes

!begin-bullets-123!

-   !begin-bullet!
    Main verbs now have individual documentation pages (#519).

    !end-bullet!
-   !begin-bullet!
    `%>%` is simply re-exported from magrittr, instead of creating a
    local copy (#496, thanks to @jimhester)

    !end-bullet!
-   !begin-bullet!
    Examples now use `nycflights13` instead of `hflights` because it the
    variables have better names and there are a few interlinked tables
    (#562). `Lahman` and `nycflights13` are (once again) suggested
    packages. This means many examples will not work unless you
    explicitly install them with
    `install.packages(c("Lahman", "nycflights13"))` (#508). dplyr now
    depends on Lahman 3.0.1. A number of examples have been updated to
    reflect modified field names (#586).

    !end-bullet!
-   !begin-bullet!
    `do()` now displays the progress bar only when used in interactive
    prompts and not when knitting (#428, @jimhester).

    !end-bullet!
-   !begin-bullet!
    `glimpse()` now prints a trailing new line (#590).

    !end-bullet!
-   !begin-bullet!
    `group_by()` has more consistent behaviour when grouping by
    constants: it creates a new column with that value (#410). It
    renames grouping variables (#410). The first argument is now `.data`
    so you can create new groups with name x (#534).

    !end-bullet!
-   !begin-bullet!
    Now instead of overriding `lag()`, dplyr overrides `lag.default()`,
    which should avoid clobbering lag methods added by other packages.
    (#277).

    !end-bullet!
-   !begin-bullet!
    `mutate(data, a = NULL)` removes the variable `a` from the returned
    dataset (#462).

    !end-bullet!
-   !begin-bullet!
    `trunc_mat()` and hence `print.tbl_df()` and friends gets a `width`
    argument to control the default output width. Set
    `options(dplyr.width = Inf)` to always show all columns (#589).

    !end-bullet!
-   !begin-bullet!
    `select()` gains `one_of()` selector: this allows you to select
    variables provided by a character vector (#396). It fails
    immediately if you give an empty pattern to `starts_with()`,
    `ends_with()`, `contains()` or `matches()` (#481, @leondutoit).
    Fixed buglet in `select()` so that you can now create variables
    called `val` (#564).

    !end-bullet!
-   !begin-bullet!
    Switched from RC to R6.

    !end-bullet!
-   !begin-bullet!
    `tally()` and `top_n()` work consistently: neither accidentally
    evaluates the `wt` param. (#426, @mnel)

    !end-bullet!
-   !begin-bullet!
    `rename` handles grouped data (#640).

    !end-bullet!

!end-bullets-123!

## Minor improvements and bug fixes by backend

### Databases

!begin-bullets-124!

-   !begin-bullet!
    Correct SQL generation for `paste()` when used with the collapse
    parameter targeting a Postgres database. (@rbdixon, #1357)

    !end-bullet!
-   !begin-bullet!
    The db backend system has been completely overhauled in order to
    make it possible to add backends in other packages, and to support a
    much wider range of databases. See `vignette("new-sql-backend")` for
    instruction on how to create your own (#568).

    !end-bullet!
-   !begin-bullet!
    `src_mysql()` gains a method for `explain()`.

    !end-bullet!
-   !begin-bullet!
    When `mutate()` creates a new variable that uses a window function,
    automatically wrap the result in a subquery (#484).

    !end-bullet!
-   !begin-bullet!
    Correct SQL generation for `first()` and `last()` (#531).

    !end-bullet!
-   !begin-bullet!
    `order_by()` now works in conjunction with window functions in
    databases that support them.

    !end-bullet!

!end-bullets-124!

### Data frames/`tbl_df`

!begin-bullets-125!

-   !begin-bullet!
    All verbs now understand how to work with `difftime()` (#390) and
    `AsIs` (#453) objects. They all check that colnames are unique
    (#483), and are more robust when columns are not present (#348,
    #569, #600).

    !end-bullet!
-   !begin-bullet!
    Hybrid evaluation bugs fixed:

    !begin-bullets-126!
    -   !begin-bullet!
        Call substitution stopped too early when a sub expression
        contained a `$` (#502).

        !end-bullet!
    -   !begin-bullet!
        Handle `::` and `:::` (#412).

        !end-bullet!
    -   !begin-bullet!
        `cumany()` and `cumall()` properly handle `NA` (#408).

        !end-bullet!
    -   !begin-bullet!
        `nth()` now correctly preserve the class when using dates, times
        and factors (#509).

        !end-bullet!
    -   !begin-bullet!
        no longer substitutes within `order_by()` because `order_by()`
        needs to do its own NSE (#169).

        !end-bullet!

    !end-bullets-126!
    !end-bullet!
-   !begin-bullet!
    `[.tbl_df` always returns a tbl_df (i.e. `drop = FALSE` is the
    default) (#587, #610). `[.grouped_df` preserves important output
    attributes (#398).

    !end-bullet!
-   !begin-bullet!
    `arrange()` keeps the grouping structure of grouped data (#491,
    #605), and preserves input classes (#563).

    !end-bullet!
-   !begin-bullet!
    `contains()` accidentally matched regular expressions, now it passes
    `fixed = TRUE` to `grep()` (#608).

    !end-bullet!
-   !begin-bullet!
    `filter()` asserts all variables are white listed (#566).

    !end-bullet!
-   !begin-bullet!
    `mutate()` makes a `rowwise_df` when given a `rowwise_df` (#463).

    !end-bullet!
-   !begin-bullet!
    `rbind_all()` creates `tbl_df` objects instead of raw `data.frame`s.

    !end-bullet!
-   !begin-bullet!
    If `select()` doesn't match any variables, it returns a 0-column
    data frame, instead of the original (#498). It no longer fails when
    if some columns are not named (#492)

    !end-bullet!
-   !begin-bullet!
    `sample_n()` and `sample_frac()` methods for data.frames exported.
    (#405, @alyst)

    !end-bullet!
-   !begin-bullet!
    A grouped data frame may have 0 groups (#486). Grouped df objects
    gain some basic validity checking, which should prevent some crashes
    related to corrupt `grouped_df` objects made by `rbind()` (#606).

    !end-bullet!
-   !begin-bullet!
    More coherence when joining columns of compatible but different
    types, e.g. when joining a character vector and a factor (#455), or
    a numeric and integer (#450)

    !end-bullet!
-   !begin-bullet!
    `mutate()` works for on zero-row grouped data frame, and with list
    columns (#555).

    !end-bullet!
-   !begin-bullet!
    `LazySubset` was confused about input data size (#452).

    !end-bullet!
-   !begin-bullet!
    Internal `n_distinct()` is stricter about its inputs: it requires
    one symbol which must be from the data frame (#567).

    !end-bullet!
-   !begin-bullet!
    `rbind_*()` handle data frames with 0 rows (#597). They fill
    character vector columns with `NA` instead of blanks (#595). They
    work with list columns (#463).

    !end-bullet!
-   !begin-bullet!
    Improved handling of encoding for column names (#636).

    !end-bullet!
-   !begin-bullet!
    Improved handling of hybrid evaluation re \$ and @ (#645).

    !end-bullet!

!end-bullets-125!

### Data tables

!begin-bullets-127!

-   !begin-bullet!
    Fix major omission in `tbl_dt()` and `grouped_dt()` methods - I was
    accidentally doing a deep copy on every result :(

    !end-bullet!
-   !begin-bullet!
    `summarise()` and `group_by()` now retain over-allocation when
    working with data.tables (#475, @arunsrinivasan).

    !end-bullet!
-   !begin-bullet!
    joining two data.tables now correctly dispatches to data table
    methods, and result is a data table (#470)

    !end-bullet!

!end-bullets-127!

### Cubes

!begin-bullets-128!

-   !begin-bullet!
    `summarise.tbl_cube()` works with single grouping variable (#480).
    !end-bullet!

!end-bullets-128!

# dplyr 0.2

## Piping

dplyr now imports `%>%` from magrittr (#330). I recommend that you use
this instead of `%.%` because it is easier to type (since you can hold
down the shift key) and is more flexible. With you `%>%`, you can
control which argument on the RHS receives the LHS by using the pronoun
`.`. This makes `%>%` more useful with base R functions because they
don't always take the data frame as the first argument. For example you
could pipe `mtcars` to `xtabs()` with:

!begin-codeblock!

    mtcars %>% xtabs( ~ cyl + vs, data = .)

!end-codeblock!

Thanks to @smbache for the excellent magrittr package. dplyr only
provides `%>%` from magrittr, but it contains many other useful
functions. To use them, load `magrittr` explicitly: `library(magrittr)`.
For more details, see `vignette("magrittr")`.

`%.%` will be deprecated in a future version of dplyr, but it won't
happen for a while. I've also deprecated `chain()` to encourage a single
style of dplyr usage: please use `%>%` instead.

## Do

`do()` has been completely overhauled. There are now two ways to use it,
either with multiple named arguments or a single unnamed arguments.
`group_by()` + `do()` is equivalent to `plyr::dlply`, except it always
returns a data frame.

If you use named arguments, each argument becomes a list-variable in the
output. A list-variable can contain any arbitrary R object so it's
particularly well suited for storing models.

!begin-codeblock!

    library(dplyr)
    models <- mtcars %>% group_by(cyl) %>% do(lm = lm(mpg ~ wt, data = .))
    models %>% summarise(rsq = summary(lm)$r.squared)

!end-codeblock!

If you use an unnamed argument, the result should be a data frame. This
allows you to apply arbitrary functions to each group.

!begin-codeblock!

    mtcars %>% group_by(cyl) %>% do(head(., 1))

!end-codeblock!

Note the use of the `.` pronoun to refer to the data in the current
group.

`do()` also has an automatic progress bar. It appears if the computation
takes longer than 5 seconds and lets you know (approximately) how much
longer the job will take to complete.

## New verbs

dplyr 0.2 adds three new verbs:

!begin-bullets-129!

-   !begin-bullet!
    `glimpse()` makes it possible to see all the columns in a tbl,
    displaying as much data for each variable as can be fit on a single
    line.

    !end-bullet!
-   !begin-bullet!
    `sample_n()` randomly samples a fixed number of rows from a tbl;
    `sample_frac()` randomly samples a fixed fraction of rows. Only
    works for local data frames and data tables (#202).

    !end-bullet!
-   !begin-bullet!
    `summarise_each()` and `mutate_each()` make it easy to apply one or
    more functions to multiple columns in a tbl (#178).

    !end-bullet!

!end-bullets-129!

## Minor improvements

!begin-bullets-130!

-   !begin-bullet!
    If you load plyr after dplyr, you'll get a message suggesting that
    you load plyr first (#347).

    !end-bullet!
-   !begin-bullet!
    `as.tbl_cube()` gains a method for matrices (#359, @paulstaab)

    !end-bullet!
-   !begin-bullet!
    `compute()` gains `temporary` argument so you can control whether
    the results are temporary or permanent (#382, @cpsievert)

    !end-bullet!
-   !begin-bullet!
    `group_by()` now defaults to `add = FALSE` so that it sets the
    grouping variables rather than adding to the existing list. I think
    this is how most people expected `group_by` to work anyway, so it's
    unlikely to cause problems (#385).

    !end-bullet!
-   !begin-bullet!
    Support for MonetDB tables with `src_monetdb()` (#8, thanks to
    @hannesmuehleisen).

    !end-bullet!
-   !begin-bullet!
    New vignettes:

    !begin-bullets-131!
    -   !begin-bullet!
        `memory` vignette which discusses how dplyr minimises memory
        usage for local data frames (#198).

        !end-bullet!
    -   !begin-bullet!
        `new-sql-backend` vignette which discusses how to add a new SQL
        backend/source to dplyr.

        !end-bullet!

    !end-bullets-131!
    !end-bullet!
-   !begin-bullet!
    `changes()` output more clearly distinguishes which columns were
    added or deleted.

    !end-bullet!
-   !begin-bullet!
    `explain()` is now generic.

    !end-bullet!
-   !begin-bullet!
    dplyr is more careful when setting the keys of data tables, so it
    never accidentally modifies an object that it doesn't own. It also
    avoids unnecessary key setting which negatively affected
    performance. (#193, #255).

    !end-bullet!
-   !begin-bullet!
    `print()` methods for `tbl_df`, `tbl_dt` and `tbl_sql` gain `n`
    argument to control the number of rows printed (#362). They also
    works better when you have columns containing lists of complex
    objects.

    !end-bullet!
-   !begin-bullet!
    `row_number()` can be called without arguments, in which case it
    returns the same as `1:n()` (#303).

    !end-bullet!
-   !begin-bullet!
    `"comment"` attribute is allowed (white listed) as well as names
    (#346).

    !end-bullet!
-   !begin-bullet!
    hybrid versions of `min`, `max`, `mean`, `var`, `sd` and `sum`
    handle the `na.rm` argument (#168). This should yield substantial
    performance improvements for those functions.

    !end-bullet!
-   !begin-bullet!
    Special case for call to `arrange()` on a grouped data frame with no
    arguments. (#369)

    !end-bullet!

!end-bullets-130!

## Bug fixes

!begin-bullets-132!

-   !begin-bullet!
    Code adapted to Rcpp \> 0.11.1

    !end-bullet!
-   !begin-bullet!
    internal `DataDots` class protects against missing variables in
    verbs (#314), including the case where `...` is missing. (#338)

    !end-bullet!
-   !begin-bullet!
    `all.equal.data.frame` from base is no longer bypassed. we now have
    `all.equal.tbl_df` and `all.equal.tbl_dt` methods (#332).

    !end-bullet!
-   !begin-bullet!
    `arrange()` correctly handles NA in numeric vectors (#331) and 0 row
    data frames (#289).

    !end-bullet!
-   !begin-bullet!
    `copy_to.src_mysql()` now works on windows (#323)

    !end-bullet!
-   !begin-bullet!
    `*_join()` doesn't reorder column names (#324).

    !end-bullet!
-   !begin-bullet!
    `rbind_all()` is stricter and only accepts list of data frames
    (#288)

    !end-bullet!
-   !begin-bullet!
    `rbind_*` propagates time zone information for `POSIXct` columns
    (#298).

    !end-bullet!
-   !begin-bullet!
    `rbind_*` is less strict about type promotion. The numeric
    `Collecter` allows collection of integer and logical vectors. The
    integer `Collecter` also collects logical values (#321).

    !end-bullet!
-   !begin-bullet!
    internal `sum` correctly handles integer (under/over)flow (#308).

    !end-bullet!
-   !begin-bullet!
    `summarise()` checks consistency of outputs (#300) and drops `names`
    attribute of output columns (#357).

    !end-bullet!
-   !begin-bullet!
    join functions throw error instead of crashing when there are no
    common variables between the data frames, and also give a better
    error message when only one data frame has a by variable (#371).

    !end-bullet!
-   !begin-bullet!
    `top_n()` returns `n` rows instead of `n - 1` (@leondutoit, #367).

    !end-bullet!
-   !begin-bullet!
    SQL translation always evaluates subsetting operators (`$`, `[`,
    `[[`) locally. (#318).

    !end-bullet!
-   !begin-bullet!
    `select()` now renames variables in remote sql tbls (#317) and
    implicitly adds grouping variables (#170).

    !end-bullet!
-   !begin-bullet!
    internal `grouped_df_impl` function errors if there are no variables
    to group by (#398).

    !end-bullet!
-   !begin-bullet!
    `n_distinct` did not treat NA correctly in the numeric case #384.

    !end-bullet!
-   !begin-bullet!
    Some compiler warnings triggered by -Wall or -pedantic have been
    eliminated.

    !end-bullet!
-   !begin-bullet!
    `group_by` only creates one group for NA (#401).

    !end-bullet!
-   !begin-bullet!
    Hybrid evaluator did not evaluate expression in correct environment
    (#403).

    !end-bullet!

!end-bullets-132!

# dplyr 0.1.3

## Bug fixes

!begin-bullets-133!

-   !begin-bullet!
    `select()` actually renames columns in a data table (#284).

    !end-bullet!
-   !begin-bullet!
    `rbind_all()` and `rbind_list()` now handle missing values in
    factors (#279).

    !end-bullet!
-   !begin-bullet!
    SQL joins now work better if names duplicated in both x and y tables
    (#310).

    !end-bullet!
-   !begin-bullet!
    Builds against Rcpp 0.11.1

    !end-bullet!
-   !begin-bullet!
    `select()` correctly works with the vars attribute (#309).

    !end-bullet!
-   !begin-bullet!
    Internal code is stricter when deciding if a data frame is grouped
    (#308): this avoids a number of situations which previously caused
    problems.

    !end-bullet!
-   !begin-bullet!
    More data frame joins work with missing values in keys (#306).

    !end-bullet!

!end-bullets-133!

# dplyr 0.1.2

## New features

!begin-bullets-134!

-   !begin-bullet!
    `select()` is substantially more powerful. You can use named
    arguments to rename existing variables, and new functions
    `starts_with()`, `ends_with()`, `contains()`, `matches()` and
    `num_range()` to select variables based on their names. It now also
    makes a shallow copy, substantially reducing its memory impact
    (#158, #172, #192, #232).

    !end-bullet!
-   !begin-bullet!
    `summarize()` added as alias for `summarise()` for people from
    countries that don't don't spell things correctly ;) (#245)

    !end-bullet!

!end-bullets-134!

## Bug fixes

!begin-bullets-135!

-   !begin-bullet!
    `filter()` now fails when given anything other than a logical
    vector, and correctly handles missing values (#249).
    `filter.numeric()` proxies `stats::filter()` so you can continue to
    use `filter()` function with numeric inputs (#264).

    !end-bullet!
-   !begin-bullet!
    `summarise()` correctly uses newly created variables (#259).

    !end-bullet!
-   !begin-bullet!
    `mutate()` correctly propagates attributes (#265) and
    `mutate.data.frame()` correctly mutates the same variable repeatedly
    (#243).

    !end-bullet!
-   !begin-bullet!
    `lead()` and `lag()` preserve attributes, so they now work with
    dates, times and factors (#166).

    !end-bullet!
-   !begin-bullet!
    `n()` never accepts arguments (#223).

    !end-bullet!
-   !begin-bullet!
    `row_number()` gives correct results (#227).

    !end-bullet!
-   !begin-bullet!
    `rbind_all()` silently ignores data frames with 0 rows or 0 columns
    (#274).

    !end-bullet!
-   !begin-bullet!
    `group_by()` orders the result (#242). It also checks that columns
    are of supported types (#233, #276).

    !end-bullet!
-   !begin-bullet!
    The hybrid evaluator did not handle some expressions correctly, for
    example in `if(n() > 5) 1 else 2` the subexpression `n()` was not
    substituted correctly. It also correctly processes `$` (#278).

    !end-bullet!
-   !begin-bullet!
    `arrange()` checks that all columns are of supported types (#266).
    It also handles list columns (#282).

    !end-bullet!
-   !begin-bullet!
    Working towards Solaris compatibility.

    !end-bullet!
-   !begin-bullet!
    Benchmarking vignette temporarily disabled due to microbenchmark
    problems reported by BDR.

    !end-bullet!

!end-bullets-135!

# dplyr 0.1.1

## Improvements

!begin-bullets-136!

-   !begin-bullet!
    new `location()` and `changes()` functions which provide more
    information about how data frames are stored in memory so that you
    can see what gets copied.

    !end-bullet!
-   !begin-bullet!
    renamed `explain_tbl()` to `explain()` (#182).

    !end-bullet!
-   !begin-bullet!
    `tally()` gains `sort` argument to sort output so highest counts
    come first (#173).

    !end-bullet!
-   !begin-bullet!
    `ungroup.grouped_df()`, `tbl_df()`, `as.data.frame.tbl_df()` now
    only make shallow copies of their inputs (#191).

    !end-bullet!
-   !begin-bullet!
    The `benchmark-baseball` vignette now contains fairer (including
    grouping times) comparisons with `data.table`. (#222)

    !end-bullet!

!end-bullets-136!

## Bug fixes

!begin-bullets-137!

-   !begin-bullet!
    `filter()` (#221) and `summarise()` (#194) correctly propagate
    attributes.

    !end-bullet!
-   !begin-bullet!
    `summarise()` throws an error when asked to summarise an unknown
    variable instead of crashing (#208).

    !end-bullet!
-   !begin-bullet!
    `group_by()` handles factors with missing values (#183).

    !end-bullet!
-   !begin-bullet!
    `filter()` handles scalar results (#217) and better handles scoping,
    e.g. `filter(., variable)` where `variable` is defined in the
    function that calls `filter`. It also handles `T` and `F` as aliases
    to `TRUE` and `FALSE` if there are no `T` or `F` variables in the
    data or in the scope.

    !end-bullet!
-   !begin-bullet!
    `select.grouped_df` fails when the grouping variables are not
    included in the selected variables (#170)

    !end-bullet!
-   !begin-bullet!
    `all.equal.data.frame()` handles a corner case where the data frame
    has `NULL` names (#217)

    !end-bullet!
-   !begin-bullet!
    `mutate()` gives informative error message on unsupported types
    (#179)

    !end-bullet!
-   !begin-bullet!
    dplyr source package no longer includes pandas benchmark, reducing
    download size from 2.8 MB to 0.5 MB.

    !end-bullet!

!end-bullets-137!

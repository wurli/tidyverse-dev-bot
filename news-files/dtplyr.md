# dtplyr (development version)

!begin-bullets-1!

-   !begin-bullet!
    `full_join()` now produces output with correctly named columns when
    a non-default value for `suffix` is supplied. Previously the
    `suffix` argument was ignored (#382).

    !end-bullet!
-   !begin-bullet!
    Chained operations properly prevent modify-by-reference (#210)

    !end-bullet!
-   !begin-bullet!
    `dplyr` and `tidyr` verbs no longer dispatch to `dtplyr`
    translations when used directly on `data.table` objects. `lazy_dt()`
    must now explicitly be called by the user. (#312)

    !end-bullet!
-   !begin-bullet!
    An error now occurs when `where()` is used for selection (#271)

    !end-bullet!
-   !begin-bullet!
    Anonymous functions are translated correctly in `mutate`/`summarize`
    (#362)

    !end-bullet!
-   !begin-bullet!
    Custom functions can pass a quosure to `col` arg in `separate()`
    (#359)

    !end-bullet!
-   !begin-bullet!
    `glue::glue()` and `stringr::str_glue()` now work inside
    `mutate()`/`transmute()` without needing to specify `.envir`

    !end-bullet!
-   !begin-bullet!
    Can use `.data` pronoun inside `desc()` in `arrange()` (#346)

    !end-bullet!
-   !begin-bullet!
    New translations:

    !end-bullet!
    !begin-bullets-2!
    -   !begin-bullet!
        `add_count()`
        !end-bullet!
    -   !begin-bullet!
        `unite()`
        !end-bullet!

    !end-bullets-2!
-   !begin-bullet!
    `if_any()` and `if_all()` now work for a list of functions specified
    in the `.fns` argument(@mgirlich, #335).

    !end-bullet!
-   !begin-bullet!
    In `semi_join()` the `y` table is again coerced to a lazy table if
    `copy = TRUE` (@mgirlich, #322).

    !end-bullet!
-   !begin-bullet!
    The `.cols` argument of `across()`, `if_any()`, and `if_all()` is
    evaluated in the environment from which `across` was called.

    !end-bullet!
-   !begin-bullet!
    `if_any()` and `if_all()` now work without specifying the `.fns`
    argument (@mgirlich, #325).

    !end-bullet!
-   !begin-bullet!
    `mutate()` can now use `.keep`

    !end-bullet!
-   !begin-bullet!
    `dtplyr` no longer directly depends on `ellipsis`

    !end-bullet!
-   !begin-bullet!
    `count()` properly handles grouping variables (#356)

    !end-bullet!
-   !begin-bullet!
    `select()` now drops columns by reference when possible for improved
    performance (#367)

    !end-bullet!
-   !begin-bullet!
    `arrange()` now utilizes `setorder()` when possible for improved
    performance (#364)

    !end-bullet!
-   !begin-bullet!
    `slice()` uses an intermediate variable to reduce computation time
    of row selection (#377)

    !end-bullet!

!end-bullets-1!

# dtplyr 1.2.2

!begin-bullets-3!

-   !begin-bullet!
    Hot patch release to resolve R CMD check failures.
    !end-bullet!

!end-bullets-3!

# dtplyr 1.2.1

!begin-bullets-4!

-   !begin-bullet!
    Fix for upcoming rlang release.
    !end-bullet!

!end-bullets-4!

# dtplyr 1.2.0

## New authors

!begin-bullet!

@markfairbanks, @mgirlich, and @eutwt are now dtplyr authors in
recognition of their significant and sustained contributions. Along with
@eutwt, they supplied the bulk of the improvements in this release!

!end-bullet!

## New features

!begin-bullets-5!

-   !begin-bullet!
    dtplyr gains translations for many more tidyr verbs:

    !end-bullet!
    !begin-bullets-6!
    -   !begin-bullet!
        `drop_na()` (@markfairbanks, #194)
        !end-bullet!
    -   !begin-bullet!
        `complete()` (@markfairbanks, #225)
        !end-bullet!
    -   !begin-bullet!
        `expand()` (@markfairbanks, #225)
        !end-bullet!
    -   !begin-bullet!
        `fill()` (@markfairbanks, #197)
        !end-bullet!
    -   !begin-bullet!
        `pivot_longer()` (@markfairbanks, #204)
        !end-bullet!
    -   !begin-bullet!
        `replace_na()` (@markfairbanks, #202)
        !end-bullet!
    -   !begin-bullet!
        `nest()` (@mgirlich, #251)
        !end-bullet!
    -   !begin-bullet!
        `separate()` (@markfairbanks, #269)
        !end-bullet!

    !end-bullets-6!
-   !begin-bullet!
    `tally()` gains a translation (@mgirlich, #201).

    !end-bullet!
-   !begin-bullet!
    `ifelse()` is mapped to `fifelse()` (@markfairbanks, #220).

    !end-bullet!

!end-bullets-5!

## Minor improvements and bug fixes

!begin-bullets-7!

-   !begin-bullet!
    `slice()` helpers (`slice_head()`, `slice_tail()`, `slice_min()`,
    `slice_max()` and `slice_sample()`) now accept negative values for
    `n` and `prop`.

    !end-bullet!
-   !begin-bullet!
    `across()` defaults to `everything()` when `.cols` isn't provided
    (@markfairbanks, #231), and handles named selections (@eutwt #293).
    It ˜ow handles `.fns` arguments in more forms (@eutwt #288):

    !end-bullet!
    !begin-bullets-8!
    -   !begin-bullet!
        Anonymous functions, such as `function(x) x + 1`
        !end-bullet!
    -   !begin-bullet!
        Formulas which don't require a function call, such as `~ 1`
        !end-bullet!

    !end-bullets-8!
-   !begin-bullet!
    `arrange(dt, desc(col))` is translated to `dt[order(-col)]` in order
    to take advantage of data.table's fast order (@markfairbanks, #227).

    !end-bullet!
-   !begin-bullet!
    `count()` applied to data.tables no longer breaks when dtplyr is
    loaded (@mgirlich, #201).

    !end-bullet!
-   !begin-bullet!
    `case_when()` supports use of `T` to specify the default (#272).

    !end-bullet!
-   !begin-bullet!
    `filter()` errors for named input, e.g. `filter(dt, x = 1)`
    (@mgirlich, #267) and works for negated logical columns (@mgirlich,
    @211).

    !end-bullet!
-   !begin-bullet!
    `group_by()` ungroups when no grouping variables are specified
    (@mgirlich, #248), and supports inline mutation like
    `group_by(dt, y = x)` (@mgirlich, #246).

    !end-bullet!
-   !begin-bullet!
    `if_else()` named arguments are translated to the correct arguments
    in `data.table::fifelse()` (@markfairbanks, #234). `if_else()`
    supports `.data` and `.env` pronouns (@markfairbanks, #220).

    !end-bullet!
-   !begin-bullet!
    `if_any()` and `if_all()` default to `everything()` when `.cols`
    isn't provided (@eutwt, #294).

    !end-bullet!
-   !begin-bullet!
    `intersect()`/`union()`/`union_all()`/`setdiff()` convert data.table
    inputs to `lazy_dt()` (#278).

    !end-bullet!
-   !begin-bullet!
    `lag()`/`lead()` are translated to `shift()`.

    !end-bullet!
-   !begin-bullet!
    `lazy_dt()` keeps groups (@mgirlich, #206).

    !end-bullet!
-   !begin-bullet!
    `left_join()` produces the same column order as dplyr
    (@markfairbanks, #139).

    !end-bullet!
-   !begin-bullet!
    `left_join()`, `right_join()`, `full_join()`, and `inner_join()`
    perform a cross join for `by = character()` (@mgirlich, #242).

    !end-bullet!
-   !begin-bullet!
    `left_join()`, `right_join()`, and `inner_join()` are always
    translated to the `[.data.table` equivalent. For simple merges the
    translation gets a bit longer but thanks to the simpler code base it
    helps to better handle names in `by` and duplicated variables names
    produced in the data.table join (@mgirlich, #222).

    !end-bullet!
-   !begin-bullet!
    `mutate()` and `transmute()` work when called without variables
    (@mgirlich, #248).

    !end-bullet!
-   !begin-bullet!
    `mutate()` gains new experimental arguments `.before` and `.after`
    that allow you to control where the new columns are placed (to match
    dplyr 1.0.0) (@eutwt #291).

    !end-bullet!
-   !begin-bullet!
    `mutate()` can modify grouping columns (instead of creating another
    column with the same name) (@mgirlich, #246).

    !end-bullet!
-   !begin-bullet!
    `n_distinct()` is translated to `uniqueN()`.

    !end-bullet!
-   !begin-bullet!
    `tally()` and `count()` follow the dplyr convention of creating a
    unique name if the default output `name` (n) already exists (@eutwt,
    #295).

    !end-bullet!
-   !begin-bullet!
    `pivot_wider()` names the columns correctly when `names_from` is a
    numeric column (@mgirlich, #214).

    !end-bullet!
-   !begin-bullet!
    `pull()` supports the `name` argument (@mgirlich, #263).

    !end-bullet!
-   !begin-bullet!
    `slice()` no longer returns excess rows (#10).

    !end-bullet!
-   !begin-bullet!
    `slice_*()` functions after `group_by()` are faster (@mgirlich,
    #216).

    !end-bullet!
-   !begin-bullet!
    `slice_max()` works when ordering by a character column (@mgirlich,
    #218).

    !end-bullet!
-   !begin-bullet!
    `summarise()` supports the `.groups` argument (@mgirlich, #245).

    !end-bullet!
-   !begin-bullet!
    `summarise()`, `tally()`, and `count()` can change the value of a
    grouping variables (@eutwt, #295).

    !end-bullet!
-   !begin-bullet!
    `transmute()` doesn't produce duplicate columns when assigning to
    the same variable (@mgirlich, #249). It correctly flags grouping
    variables so they selected (@mgirlich, #246).

    !end-bullet!
-   !begin-bullet!
    `ungroup()` removes variables in `...` from grouping (@mgirlich,
    #253).

    !end-bullet!

!end-bullets-7!

# dtplyr 1.1.0

## New features

!begin-bullets-9!

-   !begin-bullet!
    All verbs now have (very basic) documentation pointing back to the
    dplyr generic, and providing a (very rough) description of the
    translation accompanied with a few examples.

    !end-bullet!
-   !begin-bullet!
    Passing a data.table to a dplyr generic now converts it to a
    `lazy_dt()`, making it a little easier to move between data.table
    and dplyr syntax.

    !end-bullet!
-   !begin-bullet!
    dtplyr has been bought up to compatibility with dplyr 1.0.0. This
    includes new translations for:

    !end-bullet!
    !begin-bullets-10!
    -   !begin-bullet!
        `across()`, `if_any()`, `if_all()` (#154).

        !end-bullet!
    -   !begin-bullet!
        `count()` (#159).

        !end-bullet!
    -   !begin-bullet!
        `relocate()` (@smingerson, #162).

        !end-bullet!
    -   !begin-bullet!
        `rename_with()` (#160)

        !end-bullet!
    -   !begin-bullet!
        `slice_min()`, `slice_max()`, `slice_head()`, `slice_tail()`,
        and `slice_sample()` (#174).

        !end-bullet!

    !end-bullets-10!
    !begin-bullet!
    And `rename()` and `select()` now support dplyr 1.0.0 tidyselect
    syntax (apart from predicate functions which can't easily work on
    lazily evaluated data tables).

    !end-bullet!
-   !begin-bullet!
    We have begun the process of adding translations for tidyr verbs
    beginning with `pivot_wider()` (@markfairbanks, #189).

    !end-bullet!

!end-bullets-9!

## Translation improvements

!begin-bullets-11!

-   !begin-bullet!
    `compute()` now creates an intermediate assignment within the
    translation. This will generally have little impact on performance
    but it allows you to use intermediate variables to simplify complex
    translations.

    !end-bullet!
-   !begin-bullet!
    `case_when()` is now translated to `fcase()` (#190).

    !end-bullet!
-   !begin-bullet!
    `cur_data()` (`.SD`), `cur_group()` (`.BY`), `cur_group_id()`
    (`.GRP`), and `cur_group_rows() (`.I\`) are now tranlsated to their
    data.table equivalents (#166).

    !end-bullet!
-   !begin-bullet!
    `filter()` on grouped data nows use a much faster translation using
    on `.I` rather than `.SD` (and requiring an intermediate assignment)
    (#176). Thanks to suggestion from @myoung3 and @ColeMiller1.

    !end-bullet!
-   !begin-bullet!
    Translation of individual expressions:

    !end-bullet!
    !begin-bullets-12!
    -   !begin-bullet!
        `x[[1]]` is now translated correctly.

        !end-bullet!
    -   !begin-bullet!
        Anonymous functions are now preserved (@smingerson, #155)

        !end-bullet!
    -   !begin-bullet!
        Environment variables used in the `i` argument of `[.data.table`
        are now correctly inlined when not in the global environment
        (#164).

        !end-bullet!
    -   !begin-bullet!
        `T` and `F` are correctly translated to `TRUE` and `FALSE`
        (#140).

        !end-bullet!

    !end-bullets-12!

!end-bullets-11!

## Minor improvements and bug fixes

!begin-bullets-13!

-   !begin-bullet!
    Grouped filter, mutate, and slice no longer affect ordering of
    output (#178).

    !end-bullet!
-   !begin-bullet!
    `as_tibble()` gains a `.name_repair` argument (@markfairbanks).

    !end-bullet!
-   !begin-bullet!
    `as.data.table()` always calls `[]` so that the result will print
    (#146).

    !end-bullet!
-   !begin-bullet!
    `print.lazy_dt()` shows total rows, and grouping, if present.

    !end-bullet!
-   !begin-bullet!
    `group_map()` and `group_walk()` are now translated (#108).

    !end-bullet!

!end-bullets-13!

# dtplyr 1.0.1

!begin-bullets-14!

-   !begin-bullet!
    Better handling for `.data` and `.env` pronouns (#138).

    !end-bullet!
-   !begin-bullet!
    dplyr verbs now work with `NULL` inputs (#129).

    !end-bullet!
-   !begin-bullet!
    joins do better job at determining output variables in the presence
    of duplicated outputs (#128). When joining based on different
    variables in `x` and `y`, joins consistently preserve column from
    `x`, not `y` (#137).

    !end-bullet!
-   !begin-bullet!
    `lazy_dt()` objects now have a useful `glimpse()` method (#132).

    !end-bullet!
-   !begin-bullet!
    `group_by()` now has an `arrange` parameter which, if set to
    `FALSE`, sets the data.table translation to use `by` rather than
    `keyby` (#85).

    !end-bullet!
-   !begin-bullet!
    `rename()` now works without `data.table` attached, as intended
    (@michaelchirico, #123).

    !end-bullet!
-   !begin-bullet!
    dtplyr has been re-licensed as MIT (#165).

    !end-bullet!

!end-bullets-14!

# dtplyr 1.0.0

!begin-bullets-15!

-   !begin-bullet!
    Converted from eager approach to lazy approach. You now must use
    `lazy_dt()` to begin a translation pipeline, and must use
    `collect()`, `as.data.table()`, `as.data.frame()`, or `as_tibble()`
    to finish the translation and actually perform the computation
    (#38).

    !end-bullet!
    !begin-bullet!
    This represents a complete overhaul of the package replacing the
    eager evaluation used in the previous releases. This unfortunately
    breaks all existing code that used dtplyr, but frankly the previous
    version was extremely inefficient so offered little of data.table's
    impressive speed, and was used by very few people.

    !end-bullet!
-   !begin-bullet!
    dtplyr provides methods for data.tables that warning you that they
    use the data frame implementation and you should use `lazy_dt()`
    (#77)

    !end-bullet!
-   !begin-bullet!
    Joins now pass `...` on to data.table's merge method (#41).

    !end-bullet!
-   !begin-bullet!
    `ungroup()` now copies its input (@christophsax, #54).

    !end-bullet!
-   !begin-bullet!
    `mutate()` preserves grouping (@christophsax, #17).

    !end-bullet!
-   !begin-bullet!
    `if_else()` and `coalesce()` are mapped to data.table's `fifelse()`
    and `fcoalesce()` respectively (@michaelchirico, #112).

    !end-bullet!

!end-bullets-15!

# dtplyr 0.0.3

!begin-bullets-16!

-   !begin-bullet!
    Maintenance release for CRAN checks.

    !end-bullet!
-   !begin-bullet!
    `inner_join()`, `left_join()`, `right_join()`, and `full_join()`:
    new `suffix` argument which allows you to control what suffix
    duplicated variable names receive, as introduced in dplyr 0.5 (#40,
    @christophsax).

    !end-bullet!
-   !begin-bullet!
    Joins use extended `merge.data.table()` and the `on` argument,
    introduced in data.table 1.9.6. Avoids copy and allows joins by
    different keys (#20, #21, @christophsax).

    !end-bullet!

!end-bullets-16!

# dtplyr 0.0.2

!begin-bullets-17!

-   !begin-bullet!
    This is a compatibility release. It makes dtplyr compatible with
    dplyr 0.6.0 in addition to dplyr 0.5.0.
    !end-bullet!

!end-bullets-17!

# dtplyr 0.0.1

!begin-bullets-18!

-   !begin-bullet!
    `distinct()` gains `.keep_all` argument (#30, #31).

    !end-bullet!
-   !begin-bullet!
    Slightly improve test coverage (#6).

    !end-bullet!
-   !begin-bullet!
    Install `devtools` from GitHub on Travis (#32).

    !end-bullet!
-   !begin-bullet!
    Joins return `data.table`. Right and full join are now implemented
    (#16, #19).

    !end-bullet!
-   !begin-bullet!
    Remove warnings from tests (#4).

    !end-bullet!
-   !begin-bullet!
    Extracted from `dplyr` at revision e5f2952923028803.

    !end-bullet!

!end-bullets-18!

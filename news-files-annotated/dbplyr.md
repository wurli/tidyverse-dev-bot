# dbplyr (development version)

!begin-bullets-1!

-   !begin-bullet!
    `quantile()` and `median()` now error for SQL Server when used in
    `summarise()` and for PostgreSQL when used in `mutate()` as they
    can't be properly translated (@mgirlich, #1110).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue when using `filter()` on a summarised variable
    (@mgirlich, #1128).

    !end-bullet!
-   !begin-bullet!
    `across()` and `pick()` can be used (again) in `distinct()`
    (@mgirlich, #1125).

    !end-bullet!
-   !begin-bullet!
    The rank functions (`row_number()`, `min_rank()`, `rank()`,
    `dense_rank()`, `percent_rank()`, and `cume_dist()`) now work again
    for variables wrapped in `desc()`, e.g. `row_number(desc(x))`
    (@mgirlich, #1118).

    !end-bullet!
-   !begin-bullet!
    `mutate()` after `distinct()` now again produces a subquery to
    produce the correct result (@mgirlich, #1119).

    !end-bullet!
-   !begin-bullet!
    Moved argument `auto_index` after `...` in `*_join()` (@mgirlich,
    #1115).

    !end-bullet!
-   !begin-bullet!
    Removed dependency on assertthat (@mgirlich, #1112).

    !end-bullet!
-   !begin-bullet!
    Catch unsupported argument `pivot_wider(id_expand = TRUE)` and
    `pivot_longer(cols_vary)` (@mgirlich, #1109).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue when using a window function after a `summarise()`
    and `select()` (@mgirlich, #1104).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue when there where at least 3 joins and renamed
    variables (@mgirlich, #1101).

    !end-bullet!
-   !begin-bullet!
    `across()` now uses the original value when a column is overriden to
    match the behaviour of dplyr. For example
    `mutate(df, across(c(x, y), ~ .x / x))` now produces

    !begin-codeblock!
        SELECT `x` / `x` AS `x`, `y` / `x` AS `y`
        FROM `df`

    !end-codeblock!
    instead of

    !begin-codeblock!
        SELECT `x`, `y` / `x` AS `y`
        FROM (
          SELECT `x` / `x` AS `x`, `y`
          FROM `df`
        ) 

    !end-codeblock!
    (@mgirlich, #1015).

    !end-bullet!

!end-bullets-1!

# dbplyr 2.3.0

!begin-bullets-2!

-   !begin-bullet!
    Compatibility with purrr 1.0.0 (@mgirlich, #1085).
    !end-bullet!

!end-bullets-2!

## New features

!begin-bullets-3!

-   !begin-bullet!
    `stringr::str_like()` (new in 1.5.0) is translated to the closest
    `LIKE` equivalent (@rjpat, #509)

    !end-bullet!
-   !begin-bullet!
    In preparation for dplyr 1.1.0:

    !begin-bullets-4!
    -   !begin-bullet!
        The `.by` argument is supported (@mgirlich, #1051).
        !end-bullet!
    -   !begin-bullet!
        Passing `...` to `across()` is deprecated because the evaluation
        timing of `...` is ambiguous. Now instead of (e.g.)
        `across(a:b, mean, na.rm = TRUE)` use
        `across(a:b, \(x) mean(x, na.rm = TRUE)`
        !end-bullet!
    -   !begin-bullet!
        `pick()` is translated (@mgirlich, #1044).
        !end-bullet!
    -   !begin-bullet!
        `case_match()` is translated (@mgirlich, #1020).
        !end-bullet!
    -   !begin-bullet!
        `case_when()` now supports the `.default` argument (@mgirlich,
        #1017).
        !end-bullet!

    !end-bullets-4!
    !end-bullet!
-   !begin-bullet!
    Variables that aren't found in either the data or in the environment
    now produce an error (@mgirlich, #907).

    !end-bullet!

!end-bullets-3!

## SQL optimisation

!begin-bullets-5!

-   !begin-bullet!
    dbplyr now produces fewer subqueries resulting in shorter, more
    readable, and, in some cases, faster SQL. The following combination
    of verbs now avoids a subquery if possible:

    !begin-bullets-6!
    -   !begin-bullet!
        `*_join()` + `select()` (@mgirlich, #876).
        !end-bullet!
    -   !begin-bullet!
        `select()` + `*_join()` (@mgirlich, #875).
        !end-bullet!
    -   !begin-bullet!
        `mutate()` + `filter()` and `filter()` + `filter()` (@mgirlich,
        #792).
        !end-bullet!
    -   !begin-bullet!
        `distinct()` (@mgirlich, #880).
        !end-bullet!
    -   !begin-bullet!
        `summarise()` + `filter()` now translates to `HAVING`
        (@mgirlich, #877).
        !end-bullet!
    -   !begin-bullet!
        `left/inner_join()` + `left/inner_join()` (@mgirlich, #865).
        !end-bullet!

    !end-bullets-6!
    !end-bullet!
-   !begin-bullet!
    dbplyr now uses `SELECT *` after a join instead of explicitly
    selecting every column, where possible (@mgirlich, #898).

    !end-bullet!
-   !begin-bullet!
    Joins only use the table aliases ("LHS" and "RHS") if necessary
    (@mgirlich).

    !end-bullet!
-   !begin-bullet!
    When using common table expressions, the results of joins and set
    operations are now reused (@mgirlich, #978).

    !end-bullet!

!end-bullets-5!

## Improved error messages

!begin-bullets-7!

-   !begin-bullet!
    Many errors have been improved and now show the function where the
    error happened instead of a helper function (@mgirlich, #907).

    !end-bullet!
-   !begin-bullet!
    Errors produced by the database, e.g. in `collect()` or `rows_*()`,
    now show the verb where the error happened (@mgirlich).

    !end-bullet!
-   !begin-bullet!
    `window_order()` now produces a better error message when applied to
    a data frame (@mgirlich, #947).

    !end-bullet!
-   !begin-bullet!
    Using a named `across()` now gives a clear error message (@mgirlich,
    #761).

    !end-bullet!

!end-bullets-7!

## Minor improvements and bug fixes

!begin-bullets-8!

-   !begin-bullet!
    Keyword highlighting can now be customised via the option
    `dbplyr_highlight`. Turn it off via
    `options(dbplyr_highlight = FALSE)` or pass a custom ansi style,
    e.g. `options(dbplyr_highlight = cli::combine_ansi_styles("bold", "cyan"))`
    (@mgirlich, #974).

    !end-bullet!
-   !begin-bullet!
    The rank functions (`row_number()`, `min_rank()`, `rank()`,
    `dense_rank()`, `percent_rank()`, and `cume_dist()`) now give
    missing values the rank NA to match the behaviour of dplyr
    (@mgirlich, #991).

    !end-bullet!
-   !begin-bullet!
    `NA`s in `blob()`s are correctly translated to `NULL` (#983).

    !end-bullet!
-   !begin-bullet!
    `copy_inline()` gains a `types` argument to specify the SQL column
    types (@mgirlich, #963).

    !end-bullet!
-   !begin-bullet!
    `cur_column()` is now supported (@mgirlich, #951).

    !end-bullet!
-   !begin-bullet!
    `distinct()` returns columns ordered the way you request, not the
    same as the input data (@mgirlich).

    !end-bullet!
-   !begin-bullet!
    `fill()` can now fill "downup" and "updown" (@mgirlich, #1057), and
    now order by non-numeric columns also in the up direction
    (@mgirlich, #1057).

    !end-bullet!
-   !begin-bullet!
    `filter()` now works when using a window function and an external
    vector (#1048).

    !end-bullet!
-   !begin-bullet!
    `group_by()` + renamed columns works once again (@mgirlich, #928).

    !end-bullet!
-   !begin-bullet!
    `last()` is correctly translated when no window frame is specified
    (@mgirlich, #1063).

    !end-bullet!
-   !begin-bullet!
    `setOldClass()` uses a namespace, fixing an installation issue
    (@mgirlich, #927).

    !end-bullet!
-   !begin-bullet!
    `sql()` is now translated differently. The `...` are now evaluated
    locally instead of being translated with `translate_sql()`
    (@mgirlich, #952).

    !end-bullet!

!end-bullets-8!

## Backend specific improvements

!begin-bullets-9!

-   !begin-bullet!
    HANA:

    !begin-bullets-10!
    -   !begin-bullet!
        Correctly translates `as.character()` (#1027).
        !end-bullet!
    -   !begin-bullet!
        `copy_inline()` now works for Hana (#950)
        !end-bullet!

    !end-bullets-10!
    !end-bullet!
-   !begin-bullet!
    MySQL:

    !begin-bullets-11!
    -   !begin-bullet!
        `str_flatten()` uses `collapse = ""` by default (@fh-afrachioni,
        #993)
        !end-bullet!

    !end-bullets-11!
    !end-bullet!
-   !begin-bullet!
    Oracle:

    !begin-bullets-12!
    -   !begin-bullet!
        `slice_sample()` now works for Oracle (@mgirlich, #986).
        !end-bullet!
    -   !begin-bullet!
        `copy_inline()` now works for Oracle (#972)
        !end-bullet!

    !end-bullets-12!
    !end-bullet!
-   !begin-bullet!
    PostgreSQL:

    !begin-bullets-13!
    -   !begin-bullet!
        Generates correct literals for Dates (#727).
        !end-bullet!
    -   !begin-bullet!
        `str_flatten()` uses `collapse = ""` by default (@fh-afrachioni,
        #993)
        !end-bullet!
    -   !begin-bullet!
        `rows_*()` use the column types of `x` when auto copying
        (@mgirlich, #909).
        !end-bullet!

    !end-bullets-13!
    !end-bullet!
-   !begin-bullet!
    Redshift:

    !begin-bullets-14!
    -   !begin-bullet!
        `round()` now respects the `digits` argument (@owenjonesuob,
        #1033).
        !end-bullet!
    -   !begin-bullet!
        No longer tries to use named windows anymore (@owenjonesuob,
        #1035).
        !end-bullet!
    -   !begin-bullet!
        `copy_inline()` now works for Redshift (#949, thanks to @ejneer
        for an initial implementation).
        !end-bullet!
    -   !begin-bullet!
        `str_flatten()` uses `collapse = ""` by default (@fh-afrachioni,
        #993)
        !end-bullet!

    !end-bullets-14!
    !end-bullet!
-   !begin-bullet!
    Snowflake:

    !end-bullet!
-   !begin-bullet!
    numeric functions: `all()`, `any()`, `log10()`, `round()`, `cor()`,
    `cov()` and `sd()`.

    !end-bullet!
-   !begin-bullet!
    date functions: `day()`, `mday()`, `wday()`, `yday()`, `week()`,
    `isoweek()`, `month()`, `quarter()`, `isoyear()`, `seconds()`,
    `minutes()`, `hours()`, `days()`, `weeks()`, `months()`, `years()`
    and `floor_date()`.

    !end-bullet!
-   !begin-bullet!
    string functions: `grepl()`, `paste()`, `paste0()`, `str_c()`,
    `str_locate()`, `str_detect()`, `str_replace()`,
    `str_replace_all()`, `str_remove()`, `str_remove_all()`,
    `str_trim()`, `str_squish()` and `str_flatten()` (@fh-afrachioni,
    #860).

    !end-bullet!
-   !begin-bullet!
    `str_flatten()` uses `collapse = ""` by default (@fh-afrachioni,
    #993)

    !end-bullet!
-   !begin-bullet!
    SQLite:

    !begin-bullets-15!
    -   !begin-bullet!
        `quantile()` gives a better error saying that it is not
        supported (@mgirlich, #1000).
        !end-bullet!

    !end-bullets-15!
    !end-bullet!
-   !begin-bullet!
    SQL server:

    !begin-bullets-16!
    -   !begin-bullet!
        `as.POSIXct()` now translated correctly (@krlmlr, #1011).
        !end-bullet!
    -   !begin-bullet!
        `median()` now translated correctly (#1008).
        !end-bullet!
    -   !begin-bullet!
        `pivot_wider()` works again for MS SQL (@mgirlich, #929).
        !end-bullet!
    -   !begin-bullet!
        Always use 1 and 0 as literals for logicals (@krlmlr, #934).
        !end-bullet!

    !end-bullets-16!
    !end-bullet!
-   !begin-bullet!
    Teradata:

    !begin-bullets-17!
    -   !begin-bullet!
        Querying works again. Unfortunately, the fix requires every
        column to once again by explicitly selected (@mgirlich, #966).
        !end-bullet!
    -   !begin-bullet!
        New translations for `as.Date()`, `week()`, `quarter()`,
        `paste()`, `startsWith()`, `row_number()`, `weighted.mean()`,
        `lead()`, `lag()`, and `cumsum()` (@overmar, #913).
        !end-bullet!

    !end-bullets-17!
    !end-bullet!

!end-bullets-9!

# dbplyr 2.2.1

!begin-bullets-18!

-   !begin-bullet!
    Querying Oracle databases works again. Unfortunately, the fix
    requires every column to be explicitly selected again (@mgirlich,
    #908).

    !end-bullet!
-   !begin-bullet!
    `semi_join()` and `anti_join()` work again for Spark (@mgirlich,
    #915).

    !end-bullet!
-   !begin-bullet!
    `str_c()` is now translated to `||` in Oracle (@mgirlich, #921).

    !end-bullet!
-   !begin-bullet!
    `sd()`, `var()`, `cor()` and `cov()` now give clear error messages
    on databases that don't support them.

    !end-bullet!
-   !begin-bullet!
    `any()` and `all()` gain default translations for all backends.

    !end-bullet!

!end-bullets-18!

# dbplyr 2.2.0

## New features

!begin-bullets-19!

-   !begin-bullet!
    SQL formatting has been considerably improved with new wrapping and
    indenting. `show_query()` creates more readable queries by printing
    the keywords in blue (@mgirlich, #644). When possible dbplyr now
    uses `SELECT *` instead of explicitly selecting every column
    (@mgirlich).

    !end-bullet!
-   !begin-bullet!
    Added support for `rows_insert()`, `rows_append()`, `rows_update()`,
    `rows_patch()`, `rows_upsert()`, and `rows_delete()` (@mgirlich,
    #736).

    !end-bullet!
-   !begin-bullet!
    Added `copy_inline()` as a `copy_to()` equivalent that does not need
    write access (@mgirlich, #628).

    !end-bullet!
-   !begin-bullet!
    `remote_query()`, `show_query()`, `compute()` and `collect()` have
    an experimental `cte` argument. If `TRUE` the SQL query will use
    common table expressions instead of nested queries (@mgirlich,
    #638).

    !end-bullet!
-   !begin-bullet!
    New `in_catalog()`, which works like `in_schema()`, but allows
    creation of table identifiers consisting of three components:
    catalog, schema, name (#806, @krlmlr).

    !end-bullet!

!end-bullets-19!

## Improvements to SQL generation

!begin-bullets-20!

-   !begin-bullet!
    When possible, dbplyr now uses `SELECT *` instead of explicitly
    selecting every column (@mgirlich).

    !end-bullet!
-   !begin-bullet!
    New translation for `cut()` (@mgirlich, #697).

    !end-bullet!
-   !begin-bullet!
    Improved translations for specific backends:

    !begin-bullets-21!
    -   !begin-bullet!
        `as.Date()` for Oracle (@mgirlich, #661).
        !end-bullet!
    -   !begin-bullet!
        `case_when()` with a final clause of the form `TRUE ~ ...` uses
        `ELSE ...` for SQLite (@mgirlich, #754).
        !end-bullet!
    -   !begin-bullet!
        `day()`, `week()`, `isoweek()`, and `isoyear()` for Postgres
        (@mgirlich, #675).
        !end-bullet!
    -   !begin-bullet!
        `explain()` for ROracle (@mgirlich).
        !end-bullet!
    -   !begin-bullet!
        `fill()` for SQL Server (#651, @mgirlich) and RPostgreSQL
        (@mgirlich).
        !end-bullet!
    -   !begin-bullet!
        `quantile()` for SQL Server (@mgirlich, #620).
        !end-bullet!
    -   !begin-bullet!
        `str_flatten()` for Redshift (@hdplsa, #804)
        !end-bullet!
    -   !begin-bullet!
        `slice_sample()` for MySQL/MariaDB and SQL Server (@mgirlich,
        #617).
        !end-bullet!
    -   !begin-bullet!
        `union()` for Hive (@mgirlich, #663).
        !end-bullet!

    !end-bullets-21!
    !end-bullet!
-   !begin-bullet!
    The backend function `dbplyr_fill0()` (used for databases that lack
    `IGNORE NULLS` support) now respects database specific translations
    (@rsund, #753).

    !end-bullet!
-   !begin-bullet!
    Calls of the form `stringr::foo()` or `lubridate::foo()` are now
    evaluated in the database, rather than locally (#197).

    !end-bullet!
-   !begin-bullet!
    Unary plus (e.g. `db %>% filter(x == +1)`) now works (@mgirlich,
    #674).

    !end-bullet!
-   !begin-bullet!
    `is.na()`, `ifelse()`, `if_else()`, `case_when()`, and `if()`
    generate slightly more compact SQL (@mgirlich, #738).

    !end-bullet!
-   !begin-bullet!
    `if_else()` now supports the `missing` argument (@mgirlich, #641).

    !end-bullet!
-   !begin-bullet!
    `n()` now respects the window frame (@mgirlich, #700).

    !end-bullet!
-   !begin-bullet!
    `quantile()` no longer errors when using the `na.rm` argument
    (@mgirlich, #600).

    !end-bullet!
-   !begin-bullet!
    `remote_name()` now returns a name in more cases where it makes
    sense (@mgirlich, #850).

    !end-bullet!
-   !begin-bullet!
    The partial evaluation code is now more aligned with `dtplyr`. This
    makes it easier to transfer bug fixes and new features from one
    package to the other. In this process the second argument of
    `partial_eval()` was changed to a lazy frame instead of a character
    vector of variables (@mgirlich, #766). Partially evaluated
    expressions with infix operations are now correctly translated. For
    example `translate_sql(!!expr(2 - 1) * x)` now works (@mgirlich,
    #634).

    !end-bullet!

!end-bullets-20!

## Minor improvements and bug fixes

!begin-bullets-22!

-   !begin-bullet!
    New `pillar::tbl_format_header()` method for lazy tables: Printing a
    lazy table where all rows are displayed also shows the exact number
    of rows in the header. The threshold is controlled by
    `getOption("pillar.print_min")`, with a default of 10 (#796,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    The 1st edition extension mechanism is formally deprecated (#507).

    !end-bullet!
-   !begin-bullet!
    `across()`, `if_any()` and `if_all()` now defaults to
    `.cols = everything()` (@mgirlich, #760). If `.fns` is not provided
    `if_any()` and `if_all()` work like a parallel version of
    `any()`/`any()` (@mgirlich, #734).

    !end-bullet!
-   !begin-bullet!
    `across()`, `if_any()`, and `if_all()` can now translate evaluated
    lists and functions (@mgirlich, #796), and accept the name of a list
    of functions (@mgirlich, #817).

    !end-bullet!
-   !begin-bullet!
    Multiple `across()` calls in `mutate()` and `transmute()` can now
    access freshly created variables (@mgirlich, #802).

    !end-bullet!
-   !begin-bullet!
    `add_count()` now doesn't change the groups of the input (@mgirlich,
    #614).

    !end-bullet!
-   !begin-bullet!
    `compute()` can now handle when `name` is named by unnaming it first
    (@mgirlich, #623), and now works when `temporary = TRUE` for Oracle
    (@mgirlich, #621).

    !end-bullet!
-   !begin-bullet!
    `distinct()` now supports `.keep_all = TRUE` (@mgirlich, #756).

    !end-bullet!
-   !begin-bullet!
    `expand()` now works in DuckDB (@mgirlich, #712).

    !end-bullet!
-   !begin-bullet!
    `explain()` passes `...` to methods (@mgirlich, #783), and works for
    Redshift (@mgirlich, #740).

    !end-bullet!
-   !begin-bullet!
    `filter()` throws an error if you supply a named argument
    (@mgirlich, #764).

    !end-bullet!
-   !begin-bullet!
    Joins disambiguates columns that only differ in case (@mgirlich,
    #702). New arguments `x_as` and `y_as` allow you to control the
    table alias used in SQL query (@mgirlich, #637). Joins with
    `na_matches = "na"` now work for DuckDB (@mgirlich, #704).

    !end-bullet!
-   !begin-bullet!
    `mutate()` and `transmute()` use named windows if a window
    definition is used at least twice and the backend supports named
    windows (@mgirlich, #624).

    !end-bullet!
-   !begin-bullet!
    `mutate()` now supports the arguments `.keep`, `.before`, and
    `.after` (@mgirlich, #802).

    !end-bullet!
-   !begin-bullet!
    `na.rm = FALSE` only warns once every 8 hours across all functions
    (#899).

    !end-bullet!
-   !begin-bullet!
    `nesting()` now supports the `.name_repair` argument (@mgirlich,
    #654).

    !end-bullet!
-   !begin-bullet!
    `pivot_longer()` can now pivot a column named `name` (@mgirlich,
    #692), can repair names (@mgirlich, #694), and can work with
    multiple `names_from` columns (@mgirlich, #693).

    !end-bullet!
-   !begin-bullet!
    `pivot_wider(values_fn = )` and `pivot_longer(values_transform = )`
    can now be formulas (@mgirlich, #745).

    !end-bullet!
-   !begin-bullet!
    `pivot_wider()` now supports the arguments `names_vary`,
    `names_expand`, and `unused_fn` (@mgirlich, #774).

    !end-bullet!
-   !begin-bullet!
    `remote_name()` now returns a name in more cases where it makes
    sense (@mgirlich, #850).

    !end-bullet!
-   !begin-bullet!
    `sql_random()` is now exported.

    !end-bullet!
-   !begin-bullet!
    `ungroup()` removes variables in `...` from grouping (@mgirlich,
    #689).

    !end-bullet!
-   !begin-bullet!
    `transmute()` now keeps grouping variables (@mgirlich, #802).

    !end-bullet!

!end-bullets-22!

# dbplyr 2.1.1

!begin-bullets-23!

-   !begin-bullet!
    New support for Snowflake (@edgararuiz)

    !end-bullet!
-   !begin-bullet!
    `compute()`, `sql_table_index()`, and `sql_query_wrap()` now work
    with schemas (@mgirlich, #595).

    !end-bullet!
-   !begin-bullet!
    `if_any()` and `if_all()` are now translated.

    !end-bullet!
-   !begin-bullet!
    `group_by()` now ungroups when the dots argument is empty and `.add`
    is `FALSE` (@mgirlich, #615).

    !end-bullet!
-   !begin-bullet!
    `sql_escape_date()` and `sql_escape_datetime` gain methods for MS
    Access (@erikvona, #608).

    !end-bullet!

!end-bullets-23!

# dbplyr 2.1.0

## New features

!begin-bullets-24!

-   !begin-bullet!
    Thanks to @mgirlich, dbplyr gains support for key verbs from tidyr:
    `pivot_longer()` (#532), `pivot_wider()` (#543), `expand()` (#538),
    `complete()` (#538), `replace_na()` (#538), `fill()` (#566).

    !end-bullet!
-   !begin-bullet!
    @mgirlich is now a dbplyr author in recognition of his significant
    and sustained contributions.

    !end-bullet!
-   !begin-bullet!
    `across()` implementation has been rewritten to support more inputs:
    it now translates formulas (#525), works with SQL functions that
    don't have R translations (#534), and work with `NULL` (#554)

    !end-bullet!
-   !begin-bullet!
    `summarise()` now supports argument `.groups` (@mgirlich, #584).

    !end-bullet!

!end-bullets-24!

## SQL translation

!begin-bullets-25!

-   !begin-bullet!
    All backends: `str_sub()`, `substr()` and `substring()` get better
    translations (#577). Most importantly, the results of using negative
    locations should match the underlying R implementations more
    closely.

    !end-bullet!
-   !begin-bullet!
    MS SQL:

    !begin-bullets-26!
    -   !begin-bullet!
        `as.integer()` and `as.integer64()` translations cast first to
        `NUMERIC` to avoid CASTing weirdness (@DavidPatShuiFong, #496).

        !end-bullet!
    -   !begin-bullet!
        Assumes a boolean context inside of `[` (#546)

        !end-bullet!
    -   !begin-bullet!
        `str_sub()` with `end = -1` now works (#577).

        !end-bullet!

    !end-bullets-26!
    !end-bullet!
-   !begin-bullet!
    Redshift: `lag()` and `lead()` lose the `default` parameter since
    it's not supported (@hdplsa, #548).

    !end-bullet!
-   !begin-bullet!
    SQLite: custom translation of `full_join()` and `right_join()`
    (@mgirlich, #536).

    !end-bullet!

!end-bullets-25!

## Minor improvements and bug fixes

!begin-bullets-27!

-   !begin-bullet!
    RPostgreSQL backend warns if `temporary = TRUE` since temporary
    tables are not supported by `RPostgreSQL::dbWriteTable()` (#574).

    !end-bullet!
-   !begin-bullet!
    `count()` method provides closer match to dplyr semantics (#347).

    !end-bullet!
-   !begin-bullet!
    `distinct()` now respects grouping (@mgirlich, #535).

    !end-bullet!
-   !begin-bullet!
    `db_connection_describe()` no longer uses partial matching
    (@mgirlich, #564).

    !end-bullet!
-   !begin-bullet!
    `pull()` no longer `select()`s the result when there's already only
    one variable (#562).

    !end-bullet!
-   !begin-bullet!
    `select()` no longer relocates grouping variables to the front
    (@mgirlich, #568). and informs when adding missing grouping
    variables (@mgirlich, #559).

    !end-bullet!
-   !begin-bullet!
    `tbl.src_dbi(...)` now passed on to `tbl_sql()` (#530).

    !end-bullet!

!end-bullets-27!

# dbplyr 2.0.0

## dplyr 1.0.0 compatibility

!begin-bullets-28!

-   !begin-bullet!
    `across()` is now translated into individual SQL statements (#480).

    !end-bullet!
-   !begin-bullet!
    `rename()` and `select()` support dplyr 1.0.0 tidyselect syntax
    (apart from predicate functions which can't easily work on computed
    queries) (#502).

    !end-bullet!
-   !begin-bullet!
    `relocate()` makes it easy to move columns (#494) and
    `rename_with()` makes it easy to rename columns programmatically
    (#502).

    !end-bullet!
-   !begin-bullet!
    `slice_min()`, `slice_max()`, and `slice_order()` are now supported.
    `slice_head()` and `slice_tail()` throw clear error messages (#394)

    !end-bullet!

!end-bullets-28!

## SQL generation

!begin-bullets-29!

-   !begin-bullet!
    Documentation has been radically improved with new topics for each
    major verb and each backend giving more details about the SQL
    translation.

    !end-bullet!
-   !begin-bullet!
    `intersect()`, `union()` and `setdiff()` gain an `all` argument to
    add the `ALL` argument (#414).

    !end-bullet!
-   !begin-bullet!
    Join functions gains a `na_matches` argument that allows you to
    control whether or not `NA` (`NULL`) values match other `NA` values.
    The default is `"never"`, which is the usual behaviour in databases.
    You can set `na_matches = "na"` to match R's usual join behaviour
    (#180). Additional arguments error (instead of being silently
    swallowed) (#382).

    !end-bullet!
-   !begin-bullet!
    Joins now only use aliases where needed to disambiguate columns;
    this should make generated queries more readable.

    !end-bullet!
-   !begin-bullet!
    Subqueries no longer include an `ORDER BY` clause. This is not part
    of the SQL spec, and has very limited support across databases. Now
    such queries generate a warning suggesting that you move your
    `arrange()` call later in the pipeline (#276). (There's one
    exception: `ORDER BY` is still generated if `LIMIT` is present; this
    tends to affect the returns rows but not necessarily their order).

    !end-bullet!
-   !begin-bullet!
    Subquery names are now scoped within the query. This makes query
    text deterministic which helps some query optimisers/cachers (#336).

    !end-bullet!
-   !begin-bullet!
    `sql_optimise()` now can partially optimise a pipeline; due to an
    unfortunate bug it previously gave up too easily.

    !end-bullet!
-   !begin-bullet!
    `in_schema()` quotes each input individually (#287) (use `sql()` to
    opt out of quoting, if needed). And `DBI::Id()` should work anywhere
    that `in_schema()` does.

    !end-bullet!

!end-bullets-29!

## SQL translation

!begin-bullets-30!

-   !begin-bullet!
    Experimental new SAP HANA backend (#233). Requires the latest
    version of odbc.

    !end-bullet!
-   !begin-bullet!
    All backends:

    !begin-bullets-31!
    -   !begin-bullet!
        You can now use `::` in translations, so that (e.g.)
        `dbplyr::n()` is translated to `count(*)` (#207).

        !end-bullet!
    -   !begin-bullet!
        `[[` can now also translate numeric indices (#520).

        !end-bullet!
    -   !begin-bullet!
        `%/%` now generates a clear error message; previously it was
        translated to `/` which is not correct (#108).

        !end-bullet!
    -   !begin-bullet!
        `n()` is translated to `count(*)` instead of `count()` (#343).

        !end-bullet!
    -   !begin-bullet!
        `sub_str()` translation is more consistent in edge cases
        (@ianmcook).

        !end-bullet!
    -   !begin-bullet!
        All `median()` (@lorenzwalthert, #483), `pmin()`, `pmax()`
        (#479), `sd()` and `var()` functions have an `na.rm` argument
        that warns once when not `TRUE`. This makes them consistent with
        `mean()` and `sum()`.

        !end-bullet!
    -   !begin-bullet!
        `substring()` is now translated the same way as `substr()`
        (#378).

        !end-bullet!

    !end-bullets-31!
    !end-bullet!
-   !begin-bullet!
    [blob](https://blob.tidyverse.org/) vectors can now be used with
    `!!` and `!!!` operators, for example in `filter()` (@okhoma, #433)

    !end-bullet!
-   !begin-bullet!
    MySQL uses standard SQL for index creation.

    !end-bullet!
-   !begin-bullet!
    MS SQL translation does better a distinguishing between bit and
    boolean (#377, #318). `if` and `ifelse` once again generate `IIF`,
    creating simpler expressions. `as.*()` function uses `TRY_CAST()`
    instead of `CAST()` for version 11+ (2012+) (@DavidPatShuiFong,
    #380).

    !end-bullet!
-   !begin-bullet!
    odbc no longer translates `count()`; this was an accidental
    inclusion.

    !end-bullet!
-   !begin-bullet!
    Oracle translation now depends on Oracle 12c, and uses a
    "row-limiting" clause for `head()`. It gains translations for
    `today()` and `now()`, and improved `as.Date()` translation
    (@rlh1994, #267).

    !end-bullet!
-   !begin-bullet!
    PostgreSQL: new translations for lubridate period functions
    `years()`, `months()`, `days()`, and `floor_date()` (@bkkkk, #333)
    and stringr functions `str_squish()`, `str_remove()`, and
    `str_remove_all()` (@shosaco).

    !end-bullet!
-   !begin-bullet!
    New RedShift translations when used with `RPostgres::Redshift()`.

    !begin-bullets-32!
    -   !begin-bullet!
        `str_replace()` errors since there's no Redshift translation,
        and `str_replace_all()` uses `REGEXP_REPLACE()` (#446).

        !end-bullet!
    -   !begin-bullet!
        `paste()` and `paste0()` use `||` (#458).

        !end-bullet!
    -   !begin-bullet!
        `as.numeric()` and `as.double()` cast to `FLOAT` (#408).

        !end-bullet!
    -   !begin-bullet!
        `substr()` and `str_sub()` use `SUBSTRING()` (#327).

        !end-bullet!

    !end-bullets-32!
    !end-bullet!
-   !begin-bullet!
    SQLite gains translations for lubridate functions `today()`,
    `now()`, `year()`, `month()`, `day()`, `hour()`, `minute()`,
    `second()`,`yday()` (#262), and correct translation for `median()`
    (#357).

    !end-bullet!

!end-bullets-30!

## Extensibility

If you are the author of a dbplyr backend, please see
`vignette("backend-2")` for details.

!begin-bullets-33!

-   !begin-bullet!
    New `dbplyr_edition()` generic allows you to opt-in to the 2nd
    edition of the dbplyr API.

    !end-bullet!
-   !begin-bullet!
    `db_write_table()` now calls `DBI::dbWriteTable()` instead of nine
    generics that formerly each did a small part: `db_create_indexes()`,
    `db_begin()`, `db_rollback()`, `db_commit()`, `db_list_tables()`,
    `drop_drop_table()`, `db_has_table()`, `db_create_table()`, and
    `db_data_types()`. You can now delete the methods for these
    generics.

    `db_query_rows()` is no longer used; it appears that it hasn't been
    used for some time, so if you have a method, you can delete it.

    !end-bullet!
-   !begin-bullet!
    `DBI::dbQuoteIdentifier()` is now used instead of
    `sql_escape_ident()` and `DBI::dbQuoteString()` instead of
    `sql_escape_string()`.

    !end-bullet!
-   !begin-bullet!
    A number of `db_*` generics have been replaced with new SQL
    generation generics:

    !begin-bullets-34!
    -   !begin-bullet!
        `dplyr::db_analyze()` -\> `dbplyr::sql_table_analyze()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::db_create_index()` -\> `dbplyr::sql_table_index()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::db_explain()` -\> `dbplyr::sql_queriy_explain()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::db_query_fields()` -\> `dbplyr::sql_query_fields()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::db_save_query()` -\> `dbplyr::sql_query_save()`
        !end-bullet!

    !end-bullets-34!
    This makes them easier to test and is an important part of the
    process of moving all database generics in dbplyr (#284).

    !end-bullet!
-   !begin-bullet!
    A number of other generics have been renamed to facilitate the move
    from dplyr to dbplyr:

    !begin-bullets-35!
    -   !begin-bullet!
        `dplyr::sql_select()` -\> `dbplyr::sql_query_select()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::sql_join()` -\> `dbplyr::sql_query_join()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::sql_semi_join()` -\> `dbplyr::sql_query_semi_join()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::sql_set_op()` -\> `dbplyr::sql_query_set_op()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::sql_subquery()` -\> `dbplyr::sql_query_wrap()`
        !end-bullet!
    -   !begin-bullet!
        `dplyr::db_desc()` -\> `dbplyr::db_connection_describe()`
        !end-bullet!

    !end-bullets-35!
    !end-bullet!
-   !begin-bullet!
    New `db_temporary_table()` generic makes it easier to work with
    databases that require temporary tables to be specially named.

    !end-bullet!
-   !begin-bullet!
    New `sql_expr_matches()` generic allows databases to use more
    efficient alternatives when determine if two values "match"
    (i.e. like equality but a pair of `NULL`s will also match). For more
    details, see <https://modern-sql.com/feature/is-distinct-from>

    !end-bullet!
-   !begin-bullet!
    New `sql_join_suffix()` allows backends to control the default
    suffixes used (#254).

    !end-bullet!

!end-bullets-33!

## Minor improvements and bug fixes

!begin-bullets-36!

-   !begin-bullet!
    All old lazy eval shims have been removed. These have been
    deprecated for some time.

    !end-bullet!
-   !begin-bullet!
    Date-time escaping methods for Athena and Presto have moved to the
    packages where they belong.

    !end-bullet!
-   !begin-bullet!
    Attempting to embed a Shiny reactive in a query now gives a helpful
    error (#439).

    !end-bullet!
-   !begin-bullet!
    `copy_lahman()` and `copy_nycflights13()` (and hence
    `nycflights13_sqlite()`) and friends now return DBI connections
    rather than the now deprecated `src_dbi()` (#440).

    !end-bullet!
-   !begin-bullet!
    `copy_to()` can now `overwrite` when table is specified with schema
    (#489), and gains an `in_transaction` argument used to optionally
    suppress the transaction wrapper (#368).

    !end-bullet!
-   !begin-bullet!
    `distinct()` no longer duplicates column if grouped (#354).

    !end-bullet!
-   !begin-bullet!
    `transmute()` now correctly tracks variables it needs when creating
    subqueries (#313).

    !end-bullet!
-   !begin-bullet!
    `mutate()` grouping variables no longer generates a downstream error
    (#396)

    !end-bullet!
-   !begin-bullet!
    `mutate()` correctly generates subqueries when you re-use the same
    variable three or more times (#412).

    !end-bullet!
-   !begin-bullet!
    `window_order()` overrides ordering, rather than appending to it.

    !end-bullet!

!end-bullets-36!

# dbplyr 1.4.4

!begin-bullets-37!

-   !begin-bullet!
    Internally `DBI::dbExecute()` now uses `immediate = TRUE`; this
    improves support for session-scoped temporary tables in MS SQL
    (@krlmlr, #438).

    !end-bullet!
-   !begin-bullet!
    Subqueries with `ORDER BY` use `TOP 9223372036854775807` instead of
    `TOP 100 PERCENT` on SQL Server for compatibility with Azure Data
    Warehouse (#337, @alexkyllo).

    !end-bullet!
-   !begin-bullet!
    `escape()` now supports `blob` vectors using new `sql_escape_raw()`
    generic. It enables using [blob](https://blob.tidyverse.org/)
    variables in dplyr verbs, for example to filter nvarchar values by
    UTF-16 blobs (see
    https://github.com/r-dbi/DBI/issues/215#issuecomment-356376133).
    (@okhoma, #433)

    !end-bullet!
-   !begin-bullet!
    Added `setOldClass()` calls for `"ident"` and `"ident_q"` classes
    for compatibility with dplyr 1.0.0 (#448, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Postgres `str_detect()` translation uses same argument names as
    stringr, and gains a `negate` argument (#444).

    !end-bullet!
-   !begin-bullet!
    `semi_join()` and `anti_join()` now correctly support the `sql_on`
    argument (#443, @krlmlr).

    !end-bullet!

!end-bullets-37!

# dbplyr 1.4.3

!begin-bullets-38!

-   !begin-bullet!
    dbplyr now uses RPostgres (instead of RPostgreSQL) and RMariaDB
    (instead of RMySQL) for its internal tests and data functions
    (#427).

    !end-bullet!
-   !begin-bullet!
    The Date and POSIXt methods for `escape()` now use exported
    `sql_escape_date()` and `sql_escape_datetime()` generics to allow
    backend specific formatting of date and datetime literals. These are
    used to provide methods for Athena and Presto backends
    (@OssiLehtinen, #384, #391).

    !end-bullet!
-   !begin-bullet!
    `first()`, `last()`, `nth()`, `lead()` and `lag()` now respect the
    `window_frame()` (@krlmlr, #366).

    !end-bullet!
-   !begin-bullet!
    SQL server: new translations for `str_flatten()` (@PauloJhonny,
    #405).

    !end-bullet!
-   !begin-bullet!
    SQL server: temporary datasets are now session-local, not global
    (#401).

    !end-bullet!
-   !begin-bullet!
    Postgres: correct `str_detect()`, `str_replace()` and
    `str_replace_all()` translation (@shosaco, #362).

    !end-bullet!

!end-bullets-38!

# dbplyr 1.4.2

!begin-bullets-39!

-   !begin-bullet!
    Fix bug when partially evaluating unquoting quosure containing a
    single symbol (#317)

    !end-bullet!
-   !begin-bullet!
    Fixes for rlang and dpylr compatibility.

    !end-bullet!

!end-bullets-39!

# dbplyr 1.4.1

Minor improvements to SQL generation

!begin-bullets-40!

-   !begin-bullet!
    `x %in% y` strips names of `y` (#269).

    !end-bullet!
-   !begin-bullet!
    Enhancements for scoped verbs (`mutate_all()`, `summarise_if()`,
    `filter_at()` etc) (#296, #306).

    !end-bullet!
-   !begin-bullet!
    MS SQL use `TOP 100 PERCENT` as stop-gap to allow subqueries with
    `ORDER BY` (#277).

    !end-bullet!
-   !begin-bullet!
    Window functions now translated correctly for Hive (#293, @cderv).

    !end-bullet!

!end-bullets-40!

# dbplyr 1.4.0

## Breaking changes

!begin-bullets-41!

-   !begin-bullet!
    `` Error: `con` must not be NULL ``: If you see this error, it
    probably means that you have forgotten to pass `con` down to a
    dbplyr function. Previously, dbplyr defaulted to using
    `simulate_dbi()` which introduced subtle escaping bugs. (It's also
    possible I have forgotten to pass it somewhere that the dbplyr tests
    don't pick up, so if you can't figure it out, please let me know).

    !end-bullet!
-   !begin-bullet!
    Subsetting (`[[`, `$`, and `[`) functions are no longer evaluated
    locally. This makes the translation more consistent and enables
    useful new idioms for modern databases (#200).

    !end-bullet!

!end-bullets-41!

## New features

!begin-bullets-42!

-   !begin-bullet!
    MySQL/MariaDB (https://mariadb.com/kb/en/library/window-functions/)
    and SQLite (https://www.sqlite.org/windowfunctions.html)
    translations gain support for window functions, available in Maria
    DB 10.2, MySQL 8.0, and SQLite 3.25 (#191).

    !end-bullet!
-   !begin-bullet!
    Overall, dplyr generates many fewer subqueries:

    !begin-bullets-43!
    -   !begin-bullet!
        Joins and semi-joins no longer add an unneeded subquery (#236).
        This is facilitated by the new `bare_identifier_ok` argument to
        `sql_render()`; the previous argument was called `root` and
        confused me.

        !end-bullet!
    -   !begin-bullet!
        Many sequences of `select()`, `rename()`, `mutate()`, and
        `transmute()` can be collapsed into a single query, instead of
        always generating a subquery (#213).

        !end-bullet!

    !end-bullets-43!
    !end-bullet!
-   !begin-bullet!
    New `vignette("sql")` describes some advantages of dbplyr over SQL
    (#205) and gives some advice about writing literal SQL inside of
    dplyr, when you need to (#196).

    !end-bullet!
-   !begin-bullet!
    New `vignette("reprex")` gives some hints on creating reprexes that
    work anywhere (#117). This is supported by a new `tbl_memdb()` that
    matches the existing `tbl_lazy()`.

    !end-bullet!
-   !begin-bullet!
    All `..._join()` functions gain an `sql_on` argument that allows
    specifying arbitrary join predicates in SQL code (#146, @krlmlr).

    !end-bullet!

!end-bullets-42!

## SQL translations

!begin-bullets-44!

-   !begin-bullet!
    New translations for some lubridate functions: `today()`, `now()`,
    `year()`, `month()`, `day()`, `hour()`, `minute()`, `second()`,
    `quarter()`, `yday()` (@colearendt, @derekmorr). Also added new
    translation for `as.POSIXct()`.

    !end-bullet!
-   !begin-bullet!
    New translations for stringr functions: `str_c()`, `str_sub()`,
    `str_length()`, `str_to_upper()`, `str_to_lower()`, and
    `str_to_title()` (@colearendt). Non-translated stringr functions
    throw a clear error.

    !end-bullet!
-   !begin-bullet!
    New translations for bitwise operations: `bitwNot()`, `bitwAnd()`,
    `bitwOr()`, `bitwXor()`, `bitwShiftL()`, and `bitwShiftR()`. Unlike
    the base R functions, the translations do not coerce arguments to
    integers (@davidchall, #235).

    !end-bullet!
-   !begin-bullet!
    New translation for `x[y]` to `CASE WHEN y THEN x END`. This enables
    `sum(a[b == 0])` to work as you expect from R (#202). `y` needs to
    be a logical expression; if not you will likely get a type error
    from your database.

    !end-bullet!
-   !begin-bullet!
    New translations for `x$y` and `x[["y"]]` to `x.y`, enabling you to
    index into nested fields in databases that provide them (#158).

    !end-bullet!
-   !begin-bullet!
    The `.data` and `.env` pronouns of tidy evaluation are correctly
    translated (#132).

    !end-bullet!
-   !begin-bullet!
    New translation for `median()` and `quantile()`. Works for all ANSI
    compliant databases (SQL Server, Postgres, MariaDB, Teradata) and
    has custom translations for Hive. Thanks to @edavidaja for
    researching the SQL variants! (#169)

    !end-bullet!
-   !begin-bullet!
    `na_if()` is correct translated to `NULLIF()` (rather than
    `NULL_IF`) (#211).

    !end-bullet!
-   !begin-bullet!
    `n_distinct()` translation throws an error when given more than one
    argument. (#101, #133).

    !end-bullet!
-   !begin-bullet!
    New default translations for `paste()`, `paste0()`, and the
    hyperbolic functions (these previously were only available for ODBC
    databases).

    !end-bullet!
-   !begin-bullet!
    Corrected translations of `pmin()` and `pmax()` to `LEAST()` and
    `GREATEST()` for ANSI compliant databases (#118), to `MIN()` and
    `MAX()` for SQLite, and to an error for SQL server.

    !end-bullet!
-   !begin-bullet!
    New translation for `switch()` to the simple form of `CASE WHEN`
    (#192).

    !end-bullet!

!end-bullets-44!

### SQL simulation

SQL simulation makes it possible to see what dbplyr will translate SQL
to, without having an active database connection, and is used for
testing and generating reprexes.

!begin-bullets-45!

-   !begin-bullet!
    SQL simulation has been overhauled. It now works reliably, is better
    documented, and always uses ANSI escaping (i.e. `` ` `` for field
    names and `'` for strings).

    !end-bullet!
-   !begin-bullet!
    `tbl_lazy()` now actually puts a `dbplyr::src` in the `$src` field.
    This shouldn't affect any downstream code unless you were previously
    working around this weird difference between `tbl_lazy` and
    `tbl_sql` classes. It also includes the `src` class in its class,
    and when printed, shows the generated SQL (#111).

    !end-bullet!

!end-bullets-45!

## Database specific improvements

!begin-bullets-46!

-   !begin-bullet!
    MySQL/MariaDB

    !begin-bullets-47!
    -   !begin-bullet!
        Translations also applied to connections via the odbc package
        (@colearendt, #238)

        !end-bullet!
    -   !begin-bullet!
        Basic support for regular expressions via `str_detect()` and\
        `str_replace_all()` (@colearendt, #168).

        !end-bullet!
    -   !begin-bullet!
        Improved translation for `as.logical(x)` to
        `IF(x, TRUE, FALSE)`.

        !end-bullet!

    !end-bullets-47!
    !end-bullet!
-   !begin-bullet!
    Oracle

    !begin-bullets-48!
    -   !begin-bullet!
        New custom translation for `paste()` and `paste0()` (@cderv,
        #221)
        !end-bullet!

    !end-bullets-48!
    !end-bullet!
-   !begin-bullet!
    Postgres

    !begin-bullets-49!
    -   !begin-bullet!
        Basic support for regular expressions via `str_detect()` and\
        `str_replace_all()` (@colearendt, #168).
        !end-bullet!

    !end-bullets-49!
    !end-bullet!
-   !begin-bullet!
    SQLite

    !begin-bullets-50!
    -   !begin-bullet!
        `explain()` translation now generates `EXPLAIN QUERY PLAN` which
        generates a higher-level, more human friendly explanation.
        !end-bullet!

    !end-bullets-50!
    !end-bullet!
-   !begin-bullet!
    SQL server

    !begin-bullets-51!
    -   !begin-bullet!
        Improved translation for `as.logical(x)` to `CAST(x as BIT)`
        (#250).

        !end-bullet!
    -   !begin-bullet!
        Translates `paste()`, `paste0()`, and `str_c()` to `+`.

        !end-bullet!
    -   !begin-bullet!
        `copy_to()` method applies temporary table name transformation
        earlier so that you can now overwrite temporary tables (#258).

        !end-bullet!
    -   !begin-bullet!
        `db_write_table()` method uses correct argument name for passing
        along field types (#251).

        !end-bullet!

    !end-bullets-51!
    !end-bullet!

!end-bullets-46!

## Minor improvements and bug fixes

!begin-bullets-52!

-   !begin-bullet!
    Aggregation functions only warn once per session about the use of
    `na.rm = TRUE` (#216).

    !end-bullet!
-   !begin-bullet!
    table names generated by `random_table_name()` have the prefix
    "dbplyr\_", which makes it easier to find them programmatically
    (@mattle24, #111)

    !end-bullet!
-   !begin-bullet!
    Functions that are only available in a windowed (`mutate()`) query
    now throw an error when called in a aggregate (`summarise()`) query
    (#129)

    !end-bullet!
-   !begin-bullet!
    `arrange()` understands the `.by_group` argument, making it possible
    sort by groups if desired. The default is `FALSE` (#115)

    !end-bullet!
-   !begin-bullet!
    `distinct()` now handles computed variables like
    `distinct(df, y = x + y)` (#154).

    !end-bullet!
-   !begin-bullet!
    `escape()`, `sql_expr()` and `build_sql()` no longer accept
    `con = NULL` as a shortcut for `con = simulate_dbi()`. This made it
    too easy to forget to pass `con` along, introducing extremely subtle
    escaping bugs. `win_over()` gains a `con` argument for the same
    reason.

    !end-bullet!
-   !begin-bullet!
    New `escape_ansi()` always uses ANSI SQL 92 standard escaping (for
    use in examples and documentation).

    !end-bullet!
-   !begin-bullet!
    `mutate(df, x = NULL)` drops `x` from the output, just like when
    working with local data frames (#194).

    !end-bullet!
-   !begin-bullet!
    `partial_eval()` processes inlined functions (including rlang lambda
    functions). This makes dbplyr work with more forms of scoped verbs
    like `df %>% summarise_all(~ mean(.))`,
    `df %>% summarise_all(list(mean))` (#134).

    !end-bullet!
-   !begin-bullet!
    `sql_aggregate()` now takes an optional argument `f_r` for passing
    to `check_na_rm()`. This allows the warning to show the R function
    name rather than the SQL function name (@sverchkov, #153).

    !end-bullet!
-   !begin-bullet!
    `sql_infix()` gains a `pad` argument for the rare operator that
    doesn't need to be surrounded by spaces.

    !end-bullet!
-   !begin-bullet!
    `sql_prefix()` no longer turns SQL functions into uppercase,
    allowing for correct translation of case-sensitive SQL functions
    (#181, @mtoto).

    !end-bullet!
-   !begin-bullet!
    `summarise()` gives a clear error message if you refer to a variable
    created in that same `summarise()` (#114).

    !end-bullet!
-   !begin-bullet!
    New `sql_call2()` which is to `rlang::call2()` as `sql_expr()` is to
    `rlang::expr()`.

    !end-bullet!
-   !begin-bullet!
    `show_query()` and `explain()` use `cat()` rather than message.

    !end-bullet!
-   !begin-bullet!
    `union()`, `union_all()`, `setdiff()` and `intersect()` do a better
    job of matching columns across backends (#183).

    !end-bullet!

!end-bullets-52!

# dbplyr 1.3.0

!begin-bullets-53!

-   !begin-bullet!
    Now supports for dplyr 0.8.0 (#190) and R 3.1.0
    !end-bullet!

!end-bullets-53!

## API changes

!begin-bullets-54!

-   !begin-bullet!
    Calls of the form `dplyr::foo()` are now evaluated in the database,
    rather than locally (#197).

    !end-bullet!
-   !begin-bullet!
    `vars` argument to `tbl_sql()` has been formally deprecated; it
    hasn't actually done anything for a while (#3254).

    !end-bullet!
-   !begin-bullet!
    `src` and `tbl` objects now include a class generated from the class
    of the underlying connection object. This makes it possible for
    dplyr backends to implement different behaviour at the dplyr level,
    when needed. (#2293)

    !end-bullet!

!end-bullets-54!

## SQL translation

!begin-bullets-55!

-   !begin-bullet!
    `x %in% y` is now translated to `FALSE` if `y` is empty (@mgirlich,
    #160).

    !end-bullet!
-   !begin-bullet!
    New `as.integer64(x)` translation to `CAST(x AS BIGINT)` (#3305)

    !end-bullet!
-   !begin-bullet!
    `case_when` now translates with a ELSE clause if a formula of the
    form `TRUE~<RHS>` is provided . (@cderv, #112)

    !end-bullet!
-   !begin-bullet!
    `cummean()` now generates `AVG()` not `MEAN()` (#157)

    !end-bullet!
-   !begin-bullet!
    `str_detect()` now uses correct parameter order (#3397)

    !end-bullet!
-   !begin-bullet!
    MS SQL

    !begin-bullets-56!
    -   !begin-bullet!
        Cumulative summary functions now work (#157)
        !end-bullet!
    -   !begin-bullet!
        `ifelse()` uses `CASE WHEN` instead of `IIF`; this allows more
        complex operations, such as `%in%`, to work properly (#93)
        !end-bullet!

    !end-bullets-56!
    !end-bullet!
-   !begin-bullet!
    Oracle

    !begin-bullets-57!
    -   !begin-bullet!
        Custom `db_drop_table()` now only drops tables if they exist
        (#3306)
        !end-bullet!
    -   !begin-bullet!
        Custom `setdiff()` translation (#3493)
        !end-bullet!
    -   !begin-bullet!
        Custom `db_explain()` translation (#3471)
        !end-bullet!

    !end-bullets-57!
    !end-bullet!
-   !begin-bullet!
    SQLite

    !begin-bullets-58!
    -   !begin-bullet!
        Correct translation for `as.numeric()`/`as.double()`
        (@chris-park, #171).
        !end-bullet!

    !end-bullets-58!
    !end-bullet!
-   !begin-bullet!
    Redshift

    !begin-bullets-59!
    -   !begin-bullet!
        `substr()` translation improved (#3339)
        !end-bullet!

    !end-bullets-59!
    !end-bullet!

!end-bullets-55!

## Minor improvements and bug fixes

!begin-bullets-60!

-   !begin-bullet!
    `copy_to()` will only remove existing table when `overwrite = TRUE`
    and the table already exists, eliminating a confusing "NOTICE" from
    PostgreSQL (#3197).

    !end-bullet!
-   !begin-bullet!
    `partial_eval()` handles unevaluated formulas (#184).

    !end-bullet!
-   !begin-bullet!
    `pull.tbl_sql()` now extracts correctly from grouped tables (#3562).

    !end-bullet!
-   !begin-bullet!
    `sql_render.op()` now correctly forwards the `con` argument
    (@kevinykuo, #73).

    !end-bullet!

!end-bullets-60!

# dbplyr 1.2.2

!begin-bullets-61!

-   !begin-bullet!
    R CMD check fixes
    !end-bullet!

!end-bullets-61!

# dbplyr 1.2.1

!begin-bullets-62!

-   !begin-bullet!
    Forward compatibility fixes for rlang 0.2.0
    !end-bullet!

!end-bullets-62!

# dbplyr 1.2.0

## New top-level translations

!begin-bullets-63!

-   !begin-bullet!
    New translations for

    !begin-bullets-64!
    -   !begin-bullet!
        MS Access (#2946) (@DavisVaughan)
        !end-bullet!
    -   !begin-bullet!
        Oracle, via odbc or ROracle (#2928, #2732, @edgararuiz)
        !end-bullet!
    -   !begin-bullet!
        Teradata.
        !end-bullet!
    -   !begin-bullet!
        Redshift.
        !end-bullet!

    !end-bullets-64!
    !end-bullet!
-   !begin-bullet!
    dbplyr now supplies appropriate translations for the RMariaDB and
    RPostgres packages (#3154). We generally recommend using these
    packages in favour of the older RMySQL and RPostgreSQL packages as
    they are fully DBI compliant and tested with DBItest.

    !end-bullet!

!end-bullets-63!

## New features

!begin-bullets-65!

-   !begin-bullet!
    `copy_to()` can now "copy" tbl_sql in the same src, providing
    another way to cache a query into a temporary table (#3064). You can
    also `copy_to` tbl_sqls from another source, and `copy_to()` will
    automatically collect then copy.

    !end-bullet!
-   !begin-bullet!
    Initial support for stringr functions: `str_length()`,
    `str_to_upper()`, `str_to_lower()`, `str_replace_all()`,
    `str_detect()`, `str_trim()`. Regular expression support varies from
    database to database, but most simple regular expressions should be
    ok.

    !end-bullet!

!end-bullets-65!

## Tools for developers

!begin-bullets-66!

-   !begin-bullet!
    `db_compute()` gains an `analyze` argument to match `db_copy_to()`.

    !end-bullet!
-   !begin-bullet!
    New `remote_name()`, `remote_con()`, `remote_src()`,
    `remote_query()` and `remote_query_plan()` provide a standard API
    for get metadata about a remote tbl (#3130, #2923, #2824).

    !end-bullet!
-   !begin-bullet!
    New `sql_expr()` is a more convenient building block for low-level
    SQL translation (#3169).

    !end-bullet!
-   !begin-bullet!
    New `sql_aggregate()` and `win_aggregate()` for generating SQL and
    windowed SQL functions for aggregates. These take one argument, `x`,
    and warn if `na.rm` is not `TRUE` (#3155). `win_recycled()` is
    equivalent to `win_aggregate()` and has been soft-deprecated.

    !end-bullet!
-   !begin-bullet!
    `db_write_table` now needs to return the table name

    !end-bullet!

!end-bullets-66!

## Minor improvements and bug fixes

!begin-bullets-67!

-   !begin-bullet!
    Multiple `head()` calls in a row now collapse to a single call. This
    avoids a printing problem with MS SQL (#3084).

    !end-bullet!
-   !begin-bullet!
    `escape()` now works with integer64 values from the bit64 package
    (#3230)

    !end-bullet!
-   !begin-bullet!
    `if`, `ifelse()`, and `if_else()` now correctly scope the false
    condition so that it only applies to non-NULL conditions (#3157)

    !end-bullet!
-   !begin-bullet!
    `ident()` and `ident_q()` handle 0-length inputs better, and should
    be easier to use with S3 (#3212)

    !end-bullet!
-   !begin-bullet!
    `in_schema()` should now work in more places, particularly in
    `copy_to()` (#3013, @baileych)

    !end-bullet!
-   !begin-bullet!
    SQL generation for joins no longer gets stuck in a endless loop if
    you request an empty suffix (#3220).

    !end-bullet!
-   !begin-bullet!
    `mutate()` has better logic for splitting a single mutate into
    multiple subqueries (#3095).

    !end-bullet!
-   !begin-bullet!
    Improved `paste()` and `paste0()` support in MySQL, PostgreSQL
    (#3168), and RSQLite (#3176). MySQL and PostgreSQL gain support for
    `str_flatten()` which behaves like `paste(x, collapse = "-")` (but
    for technical reasons can't be implemented as a straightforward
    translation of `paste()`).

    !end-bullet!
-   !begin-bullet!
    `same_src.tbl_sql()` now performs correct comparison instead of
    always returning `TRUE`. This means that `copy = TRUE` once again
    allows you to perform cross-database joins (#3002).

    !end-bullet!
-   !begin-bullet!
    `select()` queries no longer alias column names unnecessarily
    (#2968, @DavisVaughan).

    !end-bullet!
-   !begin-bullet!
    `select()` and `rename()` are now powered by tidyselect, fixing a
    few renaming bugs (#3132, #2943, #2860).

    !end-bullet!
-   !begin-bullet!
    `summarise()` once again performs partial evaluation before database
    submission (#3148).

    !end-bullet!
-   !begin-bullet!
    `test_src()` makes it easier to access a single test source.

    !end-bullet!

!end-bullets-67!

## Database specific improvements

!begin-bullets-68!

-   !begin-bullet!
    MS SQL

    !begin-bullets-69!
    -   !begin-bullet!
        Better support for temporary tables (@Hong-Revo)

        !end-bullet!
    -   !begin-bullet!
        Different translations for filter/mutate contexts for: `NULL`
        evaluation (`is.na()`, `is.null()`), logical operators (`!`,
        `&`, `&&`, `|`, `||`), and comparison operators (`==`, `!=`,
        `<`, `>`, `>=`, `<=`)

        !end-bullet!

    !end-bullets-69!
    !end-bullet!
-   !begin-bullet!
    MySQL: `copy_to()` (via `db_write_table()`) correctly translates
    logical variables to integers (#3151).

    !end-bullet!
-   !begin-bullet!
    odbc: improved `n()` translation in windowed context.

    !end-bullet!
-   !begin-bullet!
    SQLite: improved `na_if` translation (@cwarden)

    !end-bullet!
-   !begin-bullet!
    PostgreSQL: translation for `grepl()` added (@zozlak)

    !end-bullet!
-   !begin-bullet!
    Oracle: changed VARVHAR to VARCHAR2 datatype (@washcycle, #66)

    !end-bullet!

!end-bullets-68!

# dbplyr 1.1.0

## New features

!begin-bullets-70!

-   !begin-bullet!
    `full_join()` over non-overlapping columns `by = character()`
    translated to `CROSS JOIN` (#2924).

    !end-bullet!
-   !begin-bullet!
    `case_when()` now translates to SQL "CASE WHEN" (#2894)

    !end-bullet!
-   !begin-bullet!
    `x %in% c(1)` now generates the same SQL as `x %in% 1` (#2898).

    !end-bullet!
-   !begin-bullet!
    New `window_order()` and `window_frame()` give you finer control
    over the window functions that dplyr creates (#2874, #2593).

    !end-bullet!
-   !begin-bullet!
    Added SQL translations for Oracle (@edgararuiz).

    !end-bullet!

!end-bullets-70!

## Minor improvements and bug fixes

!begin-bullets-71!

-   !begin-bullet!
    `x %in% c(1)` now generates the same SQL as `x %in% 1` (#2898).

    !end-bullet!
-   !begin-bullet!
    `head(tbl, 0)` is now supported (#2863).

    !end-bullet!
-   !begin-bullet!
    `select()`ing zero columns gives a more information error message
    (#2863).

    !end-bullet!
-   !begin-bullet!
    Variables created in a join are now disambiguated against other
    variables in the same table, not just variables in the other table
    (#2823).

    !end-bullet!
-   !begin-bullet!
    PostgreSQL gains a better translation for `round()` (#60).

    !end-bullet!
-   !begin-bullet!
    Added custom `db_analyze_table()` for MS SQL, Oracle, Hive and
    Impala (@edgararuiz)

    !end-bullet!
-   !begin-bullet!
    Added support for `sd()` for aggregate and window functions (#2887)
    (@edgararuiz)

    !end-bullet!
-   !begin-bullet!
    You can now use the magrittr pipe within expressions,
    e.g. `mutate(mtcars, cyl %>% as.character())`.

    !end-bullet!
-   !begin-bullet!
    If a translation was supplied for a summarise function, but not for
    the equivalent windowed variant, the expression would be translated
    to `NULL` with a warning. Now `sql_variant()` checks that all
    aggregate functions have matching window functions so that correct
    translations or clean errors will be generated (#2887)

    !end-bullet!

!end-bullets-71!

# dbplyr 1.0.0

## New features

!begin-bullets-72!

-   !begin-bullet!
    `tbl()` and `copy_to()` now work directly with DBI connections
    (#2423, #2576), so there is no longer a need to generate a dplyr
    src.

    !begin-codeblock!
    ``` r
    library(dplyr)

    con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
    copy_to(con, mtcars)

    mtcars2 <- tbl(con, "mtcars")
    mtcars2
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `glimpse()` now works with remote tables (#2665)

    !end-bullet!
-   !begin-bullet!
    dplyr has gained a basic SQL optimiser, which collapses certain
    nested SELECT queries into a single query (#1979). This will improve
    query execution performance for databases with less sophisticated
    query optimisers, and fixes certain problems with ordering and
    limits in subqueries (#1979). A big thanks goes to @hhoeflin for
    figuring out this optimisation.

    !end-bullet!
-   !begin-bullet!
    `compute()` and `collapse()` now preserve the "ordering" of rows.
    This only affects the computation of window functions, as the rest
    of SQL does not care about row order (#2281).

    !end-bullet!
-   !begin-bullet!
    `copy_to()` gains an `overwrite` argument which allows you to
    overwrite an existing table. Use with care! (#2296)

    !end-bullet!
-   !begin-bullet!
    New `in_schema()` function makes it easy to refer to tables in
    schema: `in_schema("my_schema_name", "my_table_name")`.

    !end-bullet!

!end-bullets-72!

## Deprecated and defunct

!begin-bullets-73!

-   !begin-bullet!
    `query()` is no longer exported. It hasn't been useful for a while
    so this shouldn't break any code.
    !end-bullet!

!end-bullets-73!

## Verb-level SQL generation

!begin-bullets-74!

-   !begin-bullet!
    Partial evaluation occurs immediately when you execute a verb (like
    `filter()` or `mutate()`) rather than happening when the query is
    executed (#2370).

    !end-bullet!
-   !begin-bullet!
    `mutate.tbl_sql()` will now generate as many subqueries as necessary
    so that you can refer to variables that you just created (like in
    mutate with regular dataframes) (#2481, #2483).

    !end-bullet!
-   !begin-bullet!
    SQL joins have been improved:

    !begin-bullets-75!
    -   !begin-bullet!
        SQL joins always use the `ON ...` syntax, avoiding `USING ...`
        even for natural joins. Improved handling of tables with columns
        of the same name (#1997, @javierluraschi). They now generate SQL
        more similar to what you'd write by hand, eliminating a layer or
        two of subqueries (#2333)

        !end-bullet!
    -   !begin-bullet!
        \[API\] They now follow the same rules for including duplicated
        key variables that the data frame methods do, namely that key
        variables are only kept from `x`, and never from `y` (#2410)

        !end-bullet!
    -   !begin-bullet!
        \[API\] The `sql_join()` generic now gains a `vars` argument
        which lists the variables taken from the left and right sides of
        the join. If you have a custom `sql_join()` method, you'll need
        to update how your code generates joins, following the template
        in `sql_join.generic()`.

        !end-bullet!
    -   !begin-bullet!
        `full_join()` throws a clear error when you attempt to use it
        with a MySQL backend (#2045)

        !end-bullet!
    -   !begin-bullet!
        `right_join()` and `full_join()` now return results consistent
        with local data frame sources when there are records in the
        right table with no match in the left table. `right_join()`
        returns values of `by` columns from the right table.
        `full_join()` returns coalesced values of `by` columns from the
        left and right tables (#2578, @ianmcook)

        !end-bullet!

    !end-bullets-75!
    !end-bullet!
-   !begin-bullet!
    `group_by()` can now perform an inline mutate for database backends
    (#2422).

    !end-bullet!
-   !begin-bullet!
    The SQL generation set operations (`intersect()`, `setdiff()`,
    `union()`, and `union_all()`) have been considerably improved.

    By default, the component SELECT are surrounded with parentheses,
    except on SQLite. The SQLite backend will now throw an error if you
    attempt a set operation on a query that contains a LIMIT, as that is
    not supported in SQLite (#2270).

    All set operations match column names across inputs, filling in
    non-matching variables with NULL (#2556).

    !end-bullet!
-   !begin-bullet!
    `rename()` and `group_by()` now combine correctly (#1962)

    !end-bullet!
-   !begin-bullet!
    `tbl_lazy()` and `lazy_tbl()` have been exported. These help you
    test generated SQL with out an active database connection.

    !end-bullet!
-   !begin-bullet!
    `ungroup()` correctly resets grouping variables (#2704).

    !end-bullet!

!end-bullets-74!

## Vector-level SQL generation

!begin-bullets-76!

-   !begin-bullet!
    New `as.sql()` safely coerces an input to SQL.

    !end-bullet!
-   !begin-bullet!
    More translators for `as.character()`, `as.integer()` and
    `as.double()` (#2775).

    !end-bullet!
-   !begin-bullet!
    New `ident_q()` makes it possible to specifier identifiers that do
    not need to be quoted.

    !end-bullet!
-   !begin-bullet!
    Translation of inline scalars:

    !begin-bullets-77!
    -   !begin-bullet!
        Logical values are now translated differently depending on the
        backend. The default is to use "true" and "false" which is the
        SQL-99 standard, but not widely support. SQLite translates to
        "0" and "1" (#2052).

        !end-bullet!
    -   !begin-bullet!
        `Inf` and `-Inf` are correctly escaped

        !end-bullet!
    -   !begin-bullet!
        Better test for whether or not a double is similar to an integer
        and hence needs a trailing 0.0 added (#2004).

        !end-bullet!
    -   !begin-bullet!
        Quoting defaults to `DBI::dbEscapeString()` and
        `DBI::dbQuoteIdentifier()` respectively.

        !end-bullet!

    !end-bullets-77!
    !end-bullet!
-   !begin-bullet!
    `::` and `:::` are handled correctly (#2321)

    !end-bullet!
-   !begin-bullet!
    `x %in% 1` is now correctly translated to `x IN (1)` (#511).

    !end-bullet!
-   !begin-bullet!
    `ifelse()` and `if_else()` use correct argument names in SQL
    translation (#2225).

    !end-bullet!
-   !begin-bullet!
    `ident()` now returns an object with class
    `c("ident", "character")`. It no longer contains "sql" to indicate
    that this is not already escaped.

    !end-bullet!
-   !begin-bullet!
    `is.na()` and `is.null()` gain extra parens in SQL translation to
    preserve correct precedence (#2302).

    !end-bullet!
-   !begin-bullet!
    \[API\] `log(x, b)` is now correctly translated to the SQL
    `log(b, x)` (#2288). SQLite does not support the 2-argument log
    function so it is translated to `log(x) / log(b)`.

    !end-bullet!
-   !begin-bullet!
    `nth(x, i)` is now correctly translated to `nth_value(x, i)`.

    !end-bullet!
-   !begin-bullet!
    `n_distinct()` now accepts multiple variables (#2148).

    !end-bullet!
-   !begin-bullet!
    \[API\] `substr()` is now translated to SQL, correcting for the
    difference in the third argument. In R, it's the position of the
    last character, in SQL it's the length of the string (#2536).

    !end-bullet!
-   !begin-bullet!
    `win_over()` escapes expression using current database rules.

    !end-bullet!

!end-bullets-76!

## Backends

!begin-bullets-78!

-   !begin-bullet!
    `copy_to()` now uses `db_write_table()` instead of
    `db_create_table()` and `db_insert_into()`.
    `db_write_table.DBIConnection()` uses `dbWriteTable()`.

    !end-bullet!
-   !begin-bullet!
    New `db_copy_to()`, `db_compute()` and `db_collect()` allow backends
    to override the entire database process behind `copy_to()`,
    `compute()` and `collect()`. `db_sql_render()` allow additional
    control over the SQL rendering process.

    !end-bullet!
-   !begin-bullet!
    All generics whose behaviour can vary from database to database now
    provide a DBIConnection method. That means that you can easily scan
    the NAMESPACE to see the extension points.

    !end-bullet!
-   !begin-bullet!
    `sql_escape_logical()` allows you to control the translation of
    literal logicals (#2614).

    !end-bullet!
-   !begin-bullet!
    `src_desc()` has been replaced by `db_desc()` and now dispatches on
    the connection, eliminating the last method that required dispatch
    on the class of the src.

    !end-bullet!
-   !begin-bullet!
    `win_over()`, `win_rank()`, `win_recycled()`, `win_cumulative()`,
    `win_current_group()` and `win_current_order()` are now exported.
    This should make it easier to provide customised SQL for window
    functions (#2051, #2126).

    !end-bullet!
-   !begin-bullet!
    SQL translation for Microsoft SQL Server (@edgararuiz)

    !end-bullet!
-   !begin-bullet!
    SQL translation for Apache Hive (@edgararuiz)

    !end-bullet!
-   !begin-bullet!
    SQL translation for Apache Impala (@edgararuiz)

    !end-bullet!

!end-bullets-78!

## Minor bug fixes and improvements

!begin-bullets-79!

-   !begin-bullet!
    `collect()` once again defaults to return all rows in the data
    (#1968). This makes it behave the same as `as.data.frame()` and
    `as_tibble()`.

    !end-bullet!
-   !begin-bullet!
    `collect()` only regroups by variables present in the data (#2156)

    !end-bullet!
-   !begin-bullet!
    `collect()` will automatically LIMIT the result to the `n`, the
    number of rows requested. This will provide the query planner with
    more information that it may be able to use to improve execution
    time (#2083).

    !end-bullet!
-   !begin-bullet!
    `common_by()` gets a better error message for unexpected inputs
    (#2091)

    !end-bullet!
-   !begin-bullet!
    `copy_to()` no longer checks that the table doesn't exist before
    creation, instead preferring to fall back on the database for error
    messages. This should reduce both false positives and false negative
    (#1470)

    !end-bullet!
-   !begin-bullet!
    `copy_to()` now succeeds for MySQL if a character column contains
    `NA` (#1975, #2256, #2263, #2381, @demorenoc, @eduardgrebe).

    !end-bullet!
-   !begin-bullet!
    `copy_to()` now returns it's output invisibly (since you're often
    just calling for the side-effect).

    !end-bullet!
-   !begin-bullet!
    `distinct()` reports improved variable information for SQL backends.
    This means that it is more likely to work in the middle of a
    pipeline (#2359).

    !end-bullet!
-   !begin-bullet!
    Ungrouped `do()` on database backends now collects all data locally
    first (#2392).

    !end-bullet!
-   !begin-bullet!
    Call `dbFetch()` instead of the deprecated `fetch()` (#2134). Use
    `DBI::dbExecute()` for non-query SQL commands (#1912)

    !end-bullet!
-   !begin-bullet!
    `explain()` and `show_query()` now invisibly return the first
    argument, making them easier to use inside a pipeline.

    !end-bullet!
-   !begin-bullet!
    `print.tbl_sql()` displays ordering (#2287) and prints table name,
    if known.

    !end-bullet!
-   !begin-bullet!
    `print(df, n = Inf)` and `head(df, n = Inf)` now work with remote
    tables (#2580).

    !end-bullet!
-   !begin-bullet!
    `db_desc()` and `sql_translate_env()` get defaults for
    DBIConnection.

    !end-bullet!
-   !begin-bullet!
    Formatting now works by overriding the `tbl_sum()` generic instead
    of `print()`. This means that the output is more consistent with
    tibble, and that `format()` is now supported also for SQL sources
    (tidyverse/dbplyr#14).

    !end-bullet!

!end-bullets-79!

## Lazy ops

!begin-bullets-80!

-   !begin-bullet!
    \[API\] The signature of `op_base` has changed to
    `op_base(x, vars, class)`

    !end-bullet!
-   !begin-bullet!
    \[API\] `translate_sql()` and `partial_eval()` have been refined:

    !begin-bullets-81!
    -   !begin-bullet!
        `translate_sql()` no longer takes a vars argument; instead call
        `partial_eval()` yourself.

        !end-bullet!
    -   !begin-bullet!
        Because it no longer needs the environment `translate_sql()_`
        now works with a list of dots, rather than a `lazy_dots`.

        !end-bullet!
    -   !begin-bullet!
        `partial_eval()` now takes a character vector of variable names
        rather than a tbl.

        !end-bullet!
    -   !begin-bullet!
        This leads to a simplification of the `op` data structure: dots
        is now a list of expressions rather than a `lazy_dots`.

        !end-bullet!

    !end-bullets-81!
    !end-bullet!
-   !begin-bullet!
    \[API\] `op_vars()` now returns a list of quoted expressions. This
    enables escaping to happen at the correct time (i.e. when the
    connection is known).

    !end-bullet!

!end-bullets-80!

# Removing old bullets works

    Code
      iwalk(news_data_readable, function(x, y) {
        cat(paste("--", y, "---------------------------\n"))
        cat_ol(x)
      })
    Output
      -- Bullet 01; section 01; level 01 ---------------------------
       1. [`.by`/`by`](https://dplyr.tidyverse.org/dev/reference/dplyr_by.html)
          is an experimental alternative to `group_by()` that supports per-
          operation grouping for `mutate()`, `summarise()`, `filter()`, and the
          `slice()` family (#6528). Rather than:
      -- Bullet 01; section 02; level 01 ---------------------------
       1. ```
          starwars %>%
            group_by(species, homeworld) %>%
            summarise(mean_height = mean(height))
          ```
       2. You can now write:
      -- Bullet 01; section 03; level 01 ---------------------------
       1. ```
          starwars %>%
            summarise(
              mean_height = mean(height),
              .by = c(species, homeworld)
            )
          ```
       2. The most useful reason to do this is because `.by` only affects a
          single operation. In the example above, an ungrouped data frame went
          into the `summarise()` call, so an ungrouped data frame will come
          out; with `.by`, you never need to remember to `ungroup()` afterwards
          and you never need to use the `.groups` argument. Additionally, using
          `summarise()` with `.by` will never sort the results by the group key,
          unlike with `group_by()`. Instead, the results are returned using the
          existing ordering of the groups from the original data. We feel this
          is more predictable, better maintains any ordering you might have
          already applied with a previous call to `arrange()`, and provides
          a way to maintain the current ordering without having to resort to
          factors. This feature was inspired by [data.table](https://CRAN.R-
          project.org/package=data.table), where the equivalent syntax looks
          like:
      -- Bullet 01; section 04; level 01 ---------------------------
       1. ```
          starwars[, .(mean_height = mean(height)), by = .(species, homeworld)]
          ```
       2. `with_groups()` is superseded in favor of `.by` (#6582).
      -- Bullet 07; section 10; level 01 ---------------------------
       1. Joins have been completely overhauled to enable more flexible join
          operations and provide more tools for quality control. Many of these
          changes are inspired by data.table's join syntax (#5914, #5661, #5413,
          #2240).
      -- Bullet 07; section 11; level 02 ---------------------------
       1. • A *join specification* can now be created through `join_by()`.
          This allows you to specify both the left and right hand side of
          a join using unquoted column names, such as `join_by(sale_date
          == commercial_date)`. Join specifications can be supplied to any
          `*_join()` function as the `by` argument.
      -- Bullet 07; section 12; level 02 ---------------------------
       1. • Join specifications allow for new types of joins:
      -- Bullet 07; section 13; level 03 ---------------------------
       1. ‣ Equality joins: The most common join, specified by `==`. For
          example, `join_by(sale_date == commercial_date)`.
      -- Bullet 07; section 14; level 03 ---------------------------
       1. ‣ Inequality joins: For joining on inequalities, i.e.`>=`, `>`, `<`,
          and `<=`. For example, use `join_by(sale_date >= commercial_date)` to
          find every commercial that aired before a particular sale.
      -- Bullet 07; section 15; level 03 ---------------------------
       1. ‣ Rolling joins: For "rolling" the closest match forward or backwards
          when there isn't an exact match, specified by using the rolling
          helper, `closest()`. For example, `join_by(closest(sale_date >=
          commercial_date))` to find only the most recent commercial that aired
          before a particular sale.
      -- Bullet 07; section 16; level 02 ---------------------------
       1. Note that you cannot use arbitrary expressions in the join conditions,
          like `join_by(sale_date - 40 >= commercial_date)`. Instead, use
          `mutate()` to create a new column containing the result of `sale_date
          - 40` and refer to that by name in `join_by()`.
      -- Bullet 07; section 16; level 03 ---------------------------
       1. ‣ Overlap joins: For detecting overlaps between sets of
          columns, specified by using one of the overlap helpers:
          `between()`, `within()`, or `overlaps()`. For example, use
          `join_by(between(commercial_date, sale_date_lower, sale_date))` to
          find commercials that aired before a particular sale, as long as they
          occurred after some lower bound, such as 40 days before the sale was
          made.
      -- Bullet 07; section 17; level 02 ---------------------------
       1. • `multiple` is a new argument for controlling what happens when
          a row in `x` matches multiple rows in `y`. For equality joins and
          rolling joins, where this is usually surprising, this defaults to
          signalling a `"warning"`, but still returns all of the matches. For
          inequality joins, where multiple matches are usually expected, this
          defaults to returning `"all"` of the matches. You can also return only
          the `"first"` or `"last"` match, `"any"` of the matches, or you can
          `"error"`.
      -- Bullet 07; section 18; level 02 ---------------------------
       1. • `keep` now defaults to `NULL` rather than `FALSE`. `NULL` implies
          `keep = FALSE` for equality conditions, but `keep = TRUE` for
          inequality conditions, since you generally want to preserve both sides
          of an inequality join.
      -- Bullet 07; section 19; level 02 ---------------------------
       1. • `unmatched` is a new argument for controlling what happens when a
          row would be dropped because it doesn't have a match. For backwards
          compatibility, the default is `"drop"`, but you can also choose to
          `"error"` if dropped rows would be surprising.
      -- Bullet 100; section 104; level 01 ---------------------------
       1. `rows_insert()` now checks that `y` contains the `by` columns (#6652).
      -- Bullet 101; section 105; level 01 ---------------------------
       1. `setequal()` ignores differences between freely coercible types (e.g.
          integer and double) (#6114) and ignores duplicated rows (#6057).
      -- Bullet 102; section 106; level 01 ---------------------------
       1. `slice()` helpers again produce output equivalent to `slice(.data, 0)`
          when the `n` or `prop` argument is 0, fixing a bug introduced in the
          previous version (@​eutwt, #6184).
      -- Bullet 103; section 107; level 01 ---------------------------
       1. `slice()` with no inputs now returns 0 rows. This is mostly for
          theoretical consistency (#6573).
      -- Bullet 104; section 108; level 01 ---------------------------
       1. `slice()` now errors if any expressions in `...` are named. This helps
          avoid accidentally misspelling an optional argument, such as `.by`
          (#6554).
      -- Bullet 105; section 109; level 01 ---------------------------
       1. `slice_*()` now requires `n` to be an integer.
      -- Bullet 106; section 110; level 01 ---------------------------
       1. `slice_*()` generics now perform argument validation. This should make
          methods more consistent and simpler to implement (#6361).
      -- Bullet 107; section 111; level 01 ---------------------------
       1. `slice_min()` and `slice_max()` can `order_by` multiple variables if
          you supply them as a data.frame or tibble (#6176).
      -- Bullet 108; section 112; level 01 ---------------------------
       1. `slice_min()` and `slice_max()` now consistently include missing
          values in the result if necessary (i.e. there aren't enough non-
          missing values to reach the `n` or `prop` you have selected). If you
          don't want missing values to be included at all, set `na_rm = TRUE`
          (#6177).
      -- Bullet 109; section 113; level 01 ---------------------------
       1. `slice_sample()` now accepts negative `n` and `prop` values (#6402).
      -- Bullet 110; section 114; level 01 ---------------------------
       1. `slice_sample()` returns a data frame or group with the same number
          of rows as the input when `replace = FALSE` and `n` is larger than the
          number of rows or `prop` is larger than 1. This reverts a change made
          in 1.0.8, returning to the behavior of 1.0.7 (#6185)
      -- Bullet 111; section 115; level 01 ---------------------------
       1. `slice_sample()` now gives a more informative error when `replace
          = FALSE` and the number of rows requested in the sample exceeds the
          number of rows in the data (#6271).
      -- Bullet 112; section 116; level 01 ---------------------------
       1. `storms` has been updated to include 2021 data and some missing storms
          that were omitted due to an error (@​steveharoz, #6320).
      -- Bullet 113; section 117; level 01 ---------------------------
       1. `summarise()` now correctly recycles named 0-column data frames
          (#6509).
      -- Bullet 114; section 118; level 01 ---------------------------
       1. `union_all()`, like `union()`, now requires that data frames be
          compatible: i.e. they have the same columns, and the columns have
          compatible types.
      -- Bullet 115; section 119; level 01 ---------------------------
       1. `where()` is re-exported from tidyselect (#6597).
      -- Bullet 22; section 25; level 01 ---------------------------
       1. `symdiff()` computes the symmetric difference (#4811).
      -- Bullet 24; section 27; level 01 ---------------------------
       1. `bench_tbls()`, `compare_tbls()`, `compare_tbls2()`, `eval_tbls()`,
          `eval_tbls2()`, `location()` and `changes()`, deprecated in 1.0.0, are
          now defunct (#6387).
      -- Bullet 26; section 29; level 01 ---------------------------
       1. `select_vars()`, `rename_vars()`, `select_var()` and `current_vars()`,
          deprecated in 0.8.4, are now defunct (#6387).
      -- Bullet 27; section 30; level 01 ---------------------------
       1. `across()`, `c_across()`, `if_any()`, and `if_all()` now require the
          `.cols` and `.fns` arguments. In general, we now recommend that you
          use `pick()` instead of an empty `across()` call or `across()` with no
          `.fns` (e.g. `across(c(x, y))`. (#6523).
      -- Bullet 27; section 31; level 02 ---------------------------
       1. • Relying on the previous default of `.cols = everything()` is
          deprecated. We have skipped the soft-deprecation stage in this case,
          because indirect usage of `across()` and friends in this way is rare.
      -- Bullet 27; section 32; level 02 ---------------------------
       1. • Relying on the previous default of `.fns = NULL` is not yet formally
          soft-deprecated, because there was no good alternative until now,
          but it is discouraged and will be soft-deprecated in the next minor
          release.
      -- Bullet 31; section 34; level 01 ---------------------------
       1. `all_equal()` is deprecated. We've advised against it for some time,
          and we explicitly recommend you use `all.equal()`, manually reordering
          the rows and columns as needed (#6324).
      -- Bullet 36; section 39; level 01 ---------------------------
       1. Using `summarise()` to produce a 0 or \>1 row "summary" is deprecated
          in favor of the new `reframe()`. See the NEWS bullet about `reframe()`
          for more details (#6382).
      -- Bullet 41; section 44; level 01 ---------------------------
       1. `transmute()` is superseded in favour of `mutate(.keep = "none")`
          (#6414).
      -- Bullet 51; section 55; level 01 ---------------------------
       1. `coalesce()` (#6265):
      -- Bullet 51; section 56; level 02 ---------------------------
       1. • Discards `NULL` inputs up front.
      -- Bullet 51; section 57; level 02 ---------------------------
       1. • No longer iterates over the columns of data frame input. Instead,
          a row is now only coalesced if it is entirely missing, which is
          consistent with `vctrs::vec_detect_missing()` and greatly simplifies
          the implementation.
      -- Bullet 51; section 58; level 02 ---------------------------
       1. • Has new `.ptype` and `.size` arguments which allow you to enforce a
          particular output type and size.
      -- Bullet 67; section 71; level 01 ---------------------------
       1. Joins on very wide tables are no longer bottlenecked by the
          application of `suffix` (#6642).
      -- Bullet 68; section 72; level 01 ---------------------------
       1. `*_join()` now error if you supply them with additional arguments that
          aren't used (#6228).
      -- Bullet 69; section 73; level 01 ---------------------------
       1. `across()` used without functions inside a rowwise-data frame no
          longer generates an invalid data frame (#6264).
      -- Bullet 70; section 74; level 01 ---------------------------
       1. Anonymous functions supplied with `function()` and `\()` are now
          inlined by `across()` if possible, which slightly improves performance
          and makes possible further optimisations in the future.
      -- Bullet 71; section 75; level 01 ---------------------------
       1. Functions supplied to `across()` are no longer masked by columns
          (#6545). For instance, `across(1:2, mean)` will now work as expected
          even if there is a column called `mean`.
      -- Bullet 72; section 76; level 01 ---------------------------
       1. `across()` will now error when supplied `...` without a `.fns`
          argument (#6638).
      -- Bullet 73; section 77; level 01 ---------------------------
       1. `arrange()` now correctly ignores `NULL` inputs (#6193).
      -- Bullet 74; section 78; level 01 ---------------------------
       1. `arrange()` now works correctly when `across()` calls are used as the
          2nd (or more) ordering expression (#6495).
      -- Bullet 75; section 79; level 01 ---------------------------
       1. `arrange(df, mydesc::desc(x))` works correctly when mydesc re-exports
          `dplyr::desc()` (#6231).
      -- Bullet 76; section 80; level 01 ---------------------------
       1. `c_across()` now evaluates `all_of()` correctly and no longer allows
          you to accidentally select grouping variables (#6522).
      -- Bullet 77; section 81; level 01 ---------------------------
       1. `c_across()` now throws a more informative error if you try to rename
          during column selection (#6522).
      -- Bullet 78; section 82; level 01 ---------------------------
       1. dplyr no longer provides `count()` and `tally()` methods for
          `tbl_sql`. These methods have been accidentally overriding the
          `tbl_lazy` methods that dbplyr provides, which has resulted in
          issues with the grouping structure of the output (#6338, tidyverse/
          dbplyr#940).
      -- Bullet 79; section 83; level 01 ---------------------------
       1. `cur_group()` now works correctly with zero row grouped data frames
          (#6304).
      -- Bullet 80; section 84; level 01 ---------------------------
       1. `desc()` gives a useful error message if you give it a non-vector
          (#6028).
      -- Bullet 81; section 85; level 01 ---------------------------
       1. `distinct()` now retains attributes of bare data frames (#6318).
      -- Bullet 82; section 86; level 01 ---------------------------
       1. `distinct()` returns columns ordered the way you request, not the same
          as the input data (#6156).
      -- Bullet 83; section 87; level 01 ---------------------------
       1. Error messages in `group_by()`, `distinct()`, `tally()`, and `count()`
          are now more relevant (#6139).
      -- Bullet 84; section 88; level 01 ---------------------------
       1. `group_by_prepare()` loses the `caller_env` argument. It was rarely
          used and it is no longer needed (#6444).
      -- Bullet 85; section 89; level 01 ---------------------------
       1. `group_walk()` gains an explict `.keep` argument (#6530).
      -- Bullet 86; section 90; level 01 ---------------------------
       1. Warnings emitted inside `mutate()` and variants are now collected and
          stashed away. Run the new `last_dplyr_warnings()` function to see the
          warnings emitted within dplyr verbs during the last top-level command.
          This fixes performance issues when thousands of warnings are emitted
          with rowwise and grouped data frames (#6005, #6236).
      -- Bullet 87; section 91; level 01 ---------------------------
       1. `mutate()` behaves a little better with 0-row rowwise inputs (#6303).
      -- Bullet 88; section 92; level 01 ---------------------------
       1. A rowwise `mutate()` now automatically unlists list-columns containing
          length 1 vectors (#6302).
      -- Bullet 89; section 93; level 01 ---------------------------
       1. `nest_join()` has gained the `na_matches` argument that all other
          joins have.
      -- Bullet 90; section 94; level 01 ---------------------------
       1. `nest_join()` now preserves the type of `y` (#6295).
      -- Bullet 91; section 95; level 01 ---------------------------
       1. `n_distinct()` now errors if you don't give it any input (#6535).
      -- Bullet 92; section 96; level 01 ---------------------------
       1. `nth()`, `first()`, `last()`, and `with_order()` now sort character
          `order_by` vectors in the C locale. Using character vectors for
          `order_by` is rare, so we expect this to have little practical impact
          (#6451).
      -- Bullet 93; section 97; level 01 ---------------------------
       1. `ntile()` now requires `n` to be a single positive integer.
      -- Bullet 94; section 98; level 01 ---------------------------
       1. `relocate()` now works correctly with empty data frames and when
          `.before` or `.after` result in empty selections (#6167).
      -- Bullet 95; section 99; level 01 ---------------------------
       1. `relocate()` no longer drops attributes of bare data frames (#6341).
      -- Bullet 96; section 100; level 01 ---------------------------
       1. `relocate()` now retains the last name change when a single column is
          renamed multiple times while it is being moved. This better matches
          the behavior of `rename()` (#6209, with help from @​eutwt).
      -- Bullet 97; section 101; level 01 ---------------------------
       1. `rename()` now contains examples of using `all_of()` and `any_of()` to
          rename using a named character vector (#6644).
      -- Bullet 98; section 102; level 01 ---------------------------
       1. `rename_with()` now disallows renaming in the `.cols` tidy-selection
          (#6561).
      -- Bullet 99; section 103; level 01 ---------------------------
       1. `rename_with()` now checks that the result of `.fn` is the right type
          and size (#6561).


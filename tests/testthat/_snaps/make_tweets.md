# Final tweets are okay

    Code
      iwalk(text, function(x, y) {
        cat(paste("--", y, "----------------------------------\n"))
        cat_ol(x)
      })
    Output
      -- 1 ----------------------------------
       1. (1/8)
          {testpkg} update:
          #RStats #Tidyverse
          
          `.by`/`by` is an experimental alternative to `group_by()` that
          supports per-operation grouping for `mutate()`, `summarise()`,
          `filter()`, and the `slice()` family (#6528). Rather than:
          
          ```
          starwars %>%
       2. (2/8)
            group_by(species, homeworld) %>%
            summarise(mean_height = mean(height))
          ```
          
          You can now write:
       3. (3/8)
          ```
          starwars %>%
            summarise(
              mean_height = mean(height),
              .by = c(species, homeworld)
            )
          ```
          
          The most useful reason to do this is because `.by` only affects a
          single operation.
       4. (4/8)
          In the example above, an ungrouped data frame went into the
          `summarise()` call, so an ungrouped data frame will come out; with
          `.by`, you never need to remember to `ungroup()` afterwards and you
          never need to use the `.groups` argument.
       5. (5/8)
          Additionally, using `summarise()` with `.by` will never sort the
          results by the group key, unlike with `group_by()`. Instead, the
          results are returned using the existing ordering of the groups from
          the original data.
       6. (6/8)
          We feel this is more predictable, better maintains any ordering you
          might have already applied with a previous call to `arrange()`, and
          provides a way to maintain the current ordering without having to
          resort to factors.
       7. (7/8)
          This feature was inspired by data.table, where the equivalent syntax
          looks like:
       8. (8/8)
          ```
          starwars[, .(mean_height = mean(height)), by = .(species, homeworld)]
          ```
          
          `with_groups()` is superseded in favor of `.by` (#6582).
      -- 2 ----------------------------------
       1. (1/3)
          {testpkg} update:
          #RStats #Tidyverse
          
          `reframe()` is a new experimental verb that creates a new data frame
          by applying functions to columns of an existing data frame. It is very
          similar to `summarise()`, with two big differences:
       2. (2/3)
          • `reframe()` can return an arbitrary number of rows per group, while
          `summarise()` reduces each group down to a single row.
       3. (3/3)
          • `reframe()` always returns an ungrouped data frame, while
          `summarise()` might return a grouped or rowwise data frame, depending
          on the scenario.
      -- 4 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `reframe()` has been added in response to valid concern from the
          community that allowing `summarise()` to return any number of rows per
          group increases the chance for accidental bugs.
       2. (2/2)
          We still feel that this is a powerful technique, and is a principled
          replacement for `do()`, so we have moved these features to `reframe()`
          (#6382).
      -- 5 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `group_by()` now uses a new algorithm for computing groups. It is
          often faster than the previous approach (especially when there are
          many groups), and in most cases there should be no changes.
       2. (2/2)
          The one exception is with character vectors, see the C locale news
          bullet below for more details (#4406, #6297).
      -- 6 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `arrange()` now uses a faster algorithm for sorting character vectors,
          which is heavily inspired by data.table's `forder()`. See the C locale
          news bullet below for more details (#4962).
          
          NULL
      -- 7 ----------------------------------
       1. (1/13)
          {testpkg} update:
          #RStats #Tidyverse
          
          Joins have been completely overhauled to enable more flexible join
          operations and provide more tools for quality control. Many of these
          changes are inspired by data.table's join syntax (#5914, #5661, #5413,
          #2240).
       2. (2/13)
          • A *join specification* can now be created through `join_by()`.
          This allows you to specify both the left and right hand side of
          a join using unquoted column names, such as `join_by(sale_date ==
          commercial_date)`.
       3. (3/13)
          Join specifications can be supplied to any `*_join()` function as the
          `by` argument.
          
          • Join specifications allow for new types of joins:
          
          ‣ Equality joins: The most common join, specified by `==`. For
          example, `join_by(sale_date == commercial_date)`.
       4. (4/13)
          ‣ Inequality joins: For joining on inequalities, i.e.`>=`, `>`, `<`,
          and `<=`. For example, use `join_by(sale_date >= commercial_date)` to
          find every commercial that aired before a particular sale.
       5. (5/13)
          ‣ Rolling joins: For "rolling" the closest match forward or backwards
          when there isn't an exact match, specified by using the rolling
          helper, `closest()`.
       6. (6/13)
          For example, `join_by(closest(sale_date >= commercial_date))` to find
          only the most recent commercial that aired before a particular sale.
       7. (7/13)
          ‣ Overlap joins: For detecting overlaps between sets of columns,
          specified by using one of the overlap helpers: `between()`,
          `within()`, or `overlaps()`.
       8. (8/13)
          For example, use `join_by(between(commercial_date, sale_date_lower,
          sale_date))` to find commercials that aired before a particular sale,
          as long as they occurred after some lower bound, such as 40 days
          before the sale was made.
       9. (9/13)
          Note that you cannot use arbitrary expressions in the join conditions,
          like `join_by(sale_date - 40 >= commercial_date)`. Instead, use
          `mutate()` to create a new column containing the result of `sale_date
          - 40` and refer to that by name in `join_by()`.
      10. (10/13)
          • `multiple` is a new argument for controlling what happens when a row
          in `x` matches multiple rows in `y`. For equality joins and rolling
          joins, where this is usually surprising, this defaults to signalling a
          `"warning"`, but still returns all of the matches.
      11. (11/13)
          For inequality joins, where multiple matches are usually expected,
          this defaults to returning `"all"` of the matches. You can also return
          only the `"first"` or `"last"` match, `"any"` of the matches, or you
          can `"error"`.
      12. (12/13)
          • `keep` now defaults to `NULL` rather than `FALSE`. `NULL` implies
          `keep = FALSE` for equality conditions, but `keep = TRUE` for
          inequality conditions, since you generally want to preserve both sides
          of an inequality join.
      13. (13/13)
          • `unmatched` is a new argument for controlling what happens when a
          row would be dropped because it doesn't have a match. For backwards
          compatibility, the default is `"drop"`, but you can also choose to
          `"error"` if dropped rows would be surprising.
      -- 17 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `across()` gains an experimental `.unpack` argument to optionally
          unpack (as in, `tidyr::unpack()`) data frames returned by functions in
          `.fns` (#6360).
          
          NULL
      -- 18 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `consecutive_id()` for creating groups based on contiguous runs of the
          same values, like `data.table::rleid()` (#1534).
          
          NULL
      -- 19 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `case_match()` is a "vectorised switch" variant of `case_when()` that
          matches on values rather than logical expressions
       2. (2/2)
          It is like a SQL "simple" `CASE WHEN` statement, whereas `case_when()`
          is like a SQL "searched" `CASE WHEN` statement (#6328).
      -- 20 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `cross_join()` is a more explicit and slightly more correct
          replacement for using `by = character()` during a join (#6604).
          
          NULL
      -- 21 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `pick()` makes it easy to access a subset of columns from the current
          group. `pick()` is intended as a replacement for `across(.fns =
          NULL)`, `cur_data()`, and `cur_data_all()`.
       2. (2/2)
          We feel that `pick()` is a much more evocative name when you are just
          trying to select a subset of columns from your data (#6204).
      -- 22 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `symdiff()` computes the symmetric difference (#4811).
          
          NULL
      -- 23 ----------------------------------
       1. (1/4)
          {testpkg} update:
          #RStats #Tidyverse
          
          `arrange()` and `group_by()` now use the C locale, not the system
          locale, when ordering or grouping character vectors.
       2. (2/4)
          This brings *substantial* performance improvements, increases
          reproducibility across R sessions, makes dplyr more consistent with
          data.table, and we believe it should affect little existing code.
       3. (3/4)
          If it does affect your code, you can use `options(dplyr.legacy_locale
          = TRUE)` to quickly revert to the previous behavior. However, in
          general, we instead recommend that you use the new `.locale` argument
          to precisely specify the desired locale.
       4. (4/4)
          For a full explanation please read the associated grouping and
          ordering tidyups.
      -- 24 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `bench_tbls()`, `compare_tbls()`, `compare_tbls2()`, `eval_tbls()`,
          `eval_tbls2()`, `location()` and `changes()`, deprecated in 1.0.0, are
          now defunct (#6387).
          
          NULL
      -- 25 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `frame_data()`, `data_frame_()`, `lst_()` and `tbl_sum()` are no
          longer re-exported from tibble (#6276, #6277, #6278, #6284).
          
          NULL
      -- 26 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `select_vars()`, `rename_vars()`, `select_var()` and `current_vars()`,
          deprecated in 0.8.4, are now defunct (#6387).
          
          NULL
      -- 27 ----------------------------------
       1. (1/3)
          {testpkg} update:
          #RStats #Tidyverse
          
          `across()`, `c_across()`, `if_any()`, and `if_all()` now require the
          `.cols` and `.fns` arguments. In general, we now recommend that you
          use `pick()` instead of an empty `across()` call or `across()` with no
          `.fns` (e.g
       2. (2/3)
          `across(c(x, y))`. (#6523).
          
          • Relying on the previous default of `.cols = everything()` is
          deprecated. We have skipped the soft-deprecation stage in this case,
          because indirect usage of `across()` and friends in this way is rare.
       3. (3/3)
          • Relying on the previous default of `.fns = NULL` is not yet formally
          soft-deprecated, because there was no good alternative until now,
          but it is discouraged and will be soft-deprecated in the next minor
          release.
      -- 30 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Passing `...` to `across()` is soft-deprecated because it's
          ambiguous when those arguments are evaluated. Now, instead of (e.g.)
          `across(a:b, mean, na.rm = TRUE)` you should write `across(a:b, ~
          mean(.x, na.rm = TRUE))` (#6073).
          
          NULL
      -- 31 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `all_equal()` is deprecated. We've advised against it for some time,
          and we explicitly recommend you use `all.equal()`, manually reordering
          the rows and columns as needed (#6324).
          
          NULL
      -- 32 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `cur_data()` and `cur_data_all()` are soft-deprecated in favour of
          `pick()` (#6204).
          
          NULL
      -- 33 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Using `by = character()` to perform a cross join is now soft-
          deprecated in favor of `cross_join()` (#6604).
          
          NULL
      -- 34 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `filter()`ing with a 1-column matrix is deprecated (#6091).
          
          NULL
      -- 35 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `progress_estimate()` is deprecated for all uses (#6387).
          
          NULL
      -- 36 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Using `summarise()` to produce a 0 or \>1 row "summary" is deprecated
          in favor of the new `reframe()`. See the NEWS bullet about `reframe()`
          for more details (#6382).
          
          NULL
      -- 37 ----------------------------------
       1. (1/3)
          {testpkg} update:
          #RStats #Tidyverse
          
          All functions deprecated in 1.0.0 (released April 2020) and earlier
          now warn every time you use them (#6387).
       2. (2/3)
          This includes `combine()`, `src_local()`, `src_mysql()`,
          `src_postgres()`, `src_sqlite()`, `rename_vars_()`, `select_vars_()`,
          `summarise_each_()`, `mutate_each_()`, `as.tbl()`, `tbl_df()`, and a
          handful of older arguments.
       3. (3/3)
          They are likely to be made defunct in the next major version (but not
          before mid 2024).
      -- 38 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice()`ing with a 1-column matrix is deprecated.
          
          NULL
      -- 39 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `recode()` is superseded in favour of `case_match()` (#6433).
          
          NULL
      -- 40 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `recode_factor()` is superseded. We don't have a direct replacement
          for it yet, but we plan to add one to forcats. In the meantime you can
          often use `case_match(.ptype = factor(levels = ))` instead (#6433).
          
          NULL
      -- 41 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `transmute()` is superseded in favour of `mutate(.keep = "none")`
          (#6414).
          
          NULL
      -- 42 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          The `.keep`, `.before`, and `.after` arguments to `mutate()` have
          moved from experimental to stable.
          
          NULL
      -- 43 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          The `rows_*()` family of functions have moved from experimental to
          stable.
          
          NULL
      -- 44 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `between()` can now work with all vector types, not just numeric and
          date-time.
       2. (2/2)
          Additionally, `left` and `right` can now also be vectors (with the
          same length as `x`), and `x`, `left`, and `right` are cast to the
          common type before the comparison is made (#6183, #6260, #6478).
      -- 45 ----------------------------------
       1. (1/5)
          {testpkg} update:
          #RStats #Tidyverse
          
          `case_when()` (#5106):
          
          • Has a new `.default` argument that is intended to replace usage of
          `TRUE ~ default_value` as a more explicit and readable way to specify
          a default value.
       2. (2/5)
          In the future, we will deprecate the unsafe recycling of the LHS
          inputs that allows `TRUE ~` to work, so we encourage you to switch to
          using `.default`.
          
          • No longer requires exact matching of the types of RHS values
       3. (3/5)
          For example, the following no longer requires you to use
          `NA_character_`.
       4. (4/5)
          ```
          x <- c("little", "unknown", "small", "missing", "large")
          
          case_when(
            x %in% c("little", "small") ~ "one",
            x %in% c("big", "large") ~ "two",
            x %in% c("missing", "unknown") ~ NA
          )
          ```
          
          • Supports a larger variety of RHS value types
       5. (5/5)
          For example, you can use a data frame to create multiple columns at
          once.
          
          • Has new `.ptype` and `.size` arguments which allow you to enforce a
          particular output type and size.
          
          • Has a better error when types or lengths were incompatible (#6261,
          #6206).
      -- 51 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `coalesce()` (#6265):
          
          • Discards `NULL` inputs up front.
          
          • No longer iterates over the columns of data frame input
       2. (2/2)
          Instead, a row is now only coalesced if it is entirely missing,
          which is consistent with `vctrs::vec_detect_missing()` and greatly
          simplifies the implementation.
          
          • Has new `.ptype` and `.size` arguments which allow you to enforce a
          particular output type and size.
      -- 55 ----------------------------------
       1. (1/3)
          {testpkg} update:
          #RStats #Tidyverse
          
          `first()`, `last()`, and `nth()` (#6331):
          
          • When used on a data frame, these functions now return a single row
          rather than a single column
       2. (2/3)
          This is more consistent with the vctrs principle that a data frame is
          generally treated as a vector of rows.
          
          • The `default` is no longer "guessed", and will always automatically
          be set to a missing value appropriate for the type of `x`.
       3. (3/3)
          • Error if `n` is not an integer. `nth(x, n = 2)` is fine, but `nth(x,
          n = 2.5)` is now an error.
      -- 58 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Additionally, they have all gained an `na_rm` argument since they are
          summary functions (#6242, with contributions from @​tnederlof).
          
          NULL
      -- 59 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `if_else()` gains most of the same benefits as `case_when()`
       2. (2/2)
          In particular,\ `if_else()` now takes the common type of `true`,
          `false`, and `missing` to determine the output type, meaning that you
          can now reliably use `NA`, rather than `NA_character_` and friends
          (#6243).
      -- 60 ----------------------------------
       1. (1/3)
          {testpkg} update:
          #RStats #Tidyverse
          
          `na_if()` (#6329) now casts `y` to the type of `x` before comparison,
          which makes it clearer that this function is type and size stable on
          `x`.
       2. (2/3)
          In particular, this means that you can no longer do `na_if(<tibble>,
          0)`, which previously accidentally allowed you to replace any instance
          of `0` across every column of the tibble with `NA`.
       3. (3/3)
          `na_if()` was never intended to work this way, and this is considered
          off-label usage. You can also now replace `NaN` values in `x` with
          `na_if(x, NaN)`.
      -- 61 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `lag()` and `lead()` now cast `default` to the type of `x`, rather
          than taking the common type. This ensures that these functions are
          type stable on `x` (#6330).
          
          NULL
      -- 62 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `row_number()`, `min_rank()`, `dense_rank()`, `ntile()`,
          `cume_dist()`, and `percent_rank()` are faster and work for more
          types. You can now rank by multiple columns by supplying a data frame
          (#6428).
          
          NULL
      -- 63 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `with_order()` now checks that the size of `order_by` is the same
          size as `x`, and now works correctly when `order_by` is a data frame
          (#6334).
          
          NULL
      -- 64 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Fixed an issue with latest rlang that caused internal tools (such
          as `mask$eval_all_summarise()`) to be mentioned in error messages
          (#6308).
          
          NULL
      -- 65 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Warnings are enriched with contextualised information in `summarise()`
          and `filter()` just like they have been in `mutate()` and `arrange()`.
          
          NULL
      -- 66 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Joins now reference the correct column in `y` when a type error is
          thrown while joining on two columns with different names (#6465).
          
          NULL
      -- 67 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Joins on very wide tables are no longer bottlenecked by the
          application of `suffix` (#6642).
          
          NULL
      -- 68 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `*_join()` now error if you supply them with additional arguments that
          aren't used (#6228).
          
          NULL
      -- 69 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `across()` used without functions inside a rowwise-data frame no
          longer generates an invalid data frame (#6264).
          
          NULL
      -- 70 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Anonymous functions supplied with `function()` and `\()` are now
          inlined by `across()` if possible, which slightly improves performance
          and makes possible further optimisations in the future.
          
          NULL
      -- 71 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Functions supplied to `across()` are no longer masked by columns
          (#6545). For instance, `across(1:2, mean)` will now work as expected
          even if there is a column called `mean`.
          
          NULL
      -- 72 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `across()` will now error when supplied `...` without a `.fns`
          argument (#6638).
          
          NULL
      -- 73 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `arrange()` now correctly ignores `NULL` inputs (#6193).
          
          NULL
      -- 74 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `arrange()` now works correctly when `across()` calls are used as the
          2nd (or more) ordering expression (#6495).
          
          NULL
      -- 75 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `arrange(df, mydesc::desc(x))` works correctly when mydesc re-exports
          `dplyr::desc()` (#6231).
          
          NULL
      -- 76 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `c_across()` now evaluates `all_of()` correctly and no longer allows
          you to accidentally select grouping variables (#6522).
          
          NULL
      -- 77 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `c_across()` now throws a more informative error if you try to rename
          during column selection (#6522).
          
          NULL
      -- 78 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          dplyr no longer provides `count()` and `tally()` methods for `tbl_sql`
       2. (2/2)
          These methods have been accidentally overriding the `tbl_lazy` methods
          that dbplyr provides, which has resulted in issues with the grouping
          structure of the output (#6338, tidyverse/dbplyr#940).
      -- 79 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `cur_group()` now works correctly with zero row grouped data frames
          (#6304).
          
          NULL
      -- 80 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `desc()` gives a useful error message if you give it a non-vector
          (#6028).
          
          NULL
      -- 81 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `distinct()` now retains attributes of bare data frames (#6318).
          
          NULL
      -- 82 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `distinct()` returns columns ordered the way you request, not the same
          as the input data (#6156).
          
          NULL
      -- 83 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          Error messages in `group_by()`, `distinct()`, `tally()`, and `count()`
          are now more relevant (#6139).
          
          NULL
      -- 84 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `group_by_prepare()` loses the `caller_env` argument. It was rarely
          used and it is no longer needed (#6444).
          
          NULL
      -- 85 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `group_walk()` gains an explict `.keep` argument (#6530).
          
          NULL
      -- 86 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          Warnings emitted inside `mutate()` and variants are now collected and
          stashed away. Run the new `last_dplyr_warnings()` function to see the
          warnings emitted within dplyr verbs during the last top-level command.
       2. (2/2)
          This fixes performance issues when thousands of warnings are emitted
          with rowwise and grouped data frames (#6005, #6236).
      -- 87 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `mutate()` behaves a little better with 0-row rowwise inputs (#6303).
          
          NULL
      -- 88 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          A rowwise `mutate()` now automatically unlists list-columns containing
          length 1 vectors (#6302).
          
          NULL
      -- 89 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `nest_join()` has gained the `na_matches` argument that all other
          joins have.
          
          NULL
      -- 90 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `nest_join()` now preserves the type of `y` (#6295).
          
          NULL
      -- 91 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `n_distinct()` now errors if you don't give it any input (#6535).
          
          NULL
      -- 92 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `nth()`, `first()`, `last()`, and `with_order()` now sort character
          `order_by` vectors in the C locale. Using character vectors for
          `order_by` is rare, so we expect this to have little practical impact
          (#6451).
          
          NULL
      -- 93 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `ntile()` now requires `n` to be a single positive integer.
          
          NULL
      -- 94 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `relocate()` now works correctly with empty data frames and when
          `.before` or `.after` result in empty selections (#6167).
          
          NULL
      -- 95 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `relocate()` no longer drops attributes of bare data frames (#6341).
          
          NULL
      -- 96 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `relocate()` now retains the last name change when a single column is
          renamed multiple times while it is being moved. This better matches
          the behavior of `rename()` (#6209, with help from @​eutwt).
          
          NULL
      -- 97 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `rename()` now contains examples of using `all_of()` and `any_of()` to
          rename using a named character vector (#6644).
          
          NULL
      -- 98 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `rename_with()` now disallows renaming in the `.cols` tidy-selection
          (#6561).
          
          NULL
      -- 99 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `rename_with()` now checks that the result of `.fn` is the right type
          and size (#6561).
          
          NULL
      -- 100 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `rows_insert()` now checks that `y` contains the `by` columns (#6652).
          
          NULL
      -- 101 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `setequal()` ignores differences between freely coercible types (e.g.
          integer and double) (#6114) and ignores duplicated rows (#6057).
          
          NULL
      -- 102 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice()` helpers again produce output equivalent to `slice(.data, 0)`
          when the `n` or `prop` argument is 0, fixing a bug introduced in the
          previous version (@​eutwt, #6184).
          
          NULL
      -- 103 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice()` with no inputs now returns 0 rows. This is mostly for
          theoretical consistency (#6573).
          
          NULL
      -- 104 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice()` now errors if any expressions in `...` are named. This helps
          avoid accidentally misspelling an optional argument, such as `.by`
          (#6554).
          
          NULL
      -- 105 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice_*()` now requires `n` to be an integer.
          
          NULL
      -- 106 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice_*()` generics now perform argument validation. This should make
          methods more consistent and simpler to implement (#6361).
          
          NULL
      -- 107 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice_min()` and `slice_max()` can `order_by` multiple variables if
          you supply them as a data.frame or tibble (#6176).
          
          NULL
      -- 108 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `slice_min()` and `slice_max()` now consistently include missing
          values in the result if necessary (i.e. there aren't enough non-
          missing values to reach the `n` or `prop` you have selected).
       2. (2/2)
          If you don't want missing values to be included at all, set `na_rm =
          TRUE` (#6177).
      -- 109 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice_sample()` now accepts negative `n` and `prop` values (#6402).
          
          NULL
      -- 110 ----------------------------------
       1. (1/2)
          {testpkg} update:
          #RStats #Tidyverse
          
          `slice_sample()` returns a data frame or group with the same number
          of rows as the input when `replace = FALSE` and `n` is larger than the
          number of rows or `prop` is larger than 1
       2. (2/2)
          This reverts a change made in 1.0.8, returning to the behavior of
          1.0.7 (#6185)
      -- 111 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `slice_sample()` now gives a more informative error when `replace
          = FALSE` and the number of rows requested in the sample exceeds the
          number of rows in the data (#6271).
          
          NULL
      -- 112 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `storms` has been updated to include 2021 data and some missing storms
          that were omitted due to an error (@​steveharoz, #6320).
          
          NULL
      -- 113 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `summarise()` now correctly recycles named 0-column data frames
          (#6509).
          
          NULL
      -- 114 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `union_all()`, like `union()`, now requires that data frames be
          compatible: i.e. they have the same columns, and the columns have
          compatible types.
          
          NULL
      -- 115 ----------------------------------
       1. {testpkg} update:
          #RStats #Tidyverse
          
          `where()` is re-exported from tidyselect (#6597).
          
          NULL


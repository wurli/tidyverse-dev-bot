# Lua annotation works

    Code
      cat(annotated)
    Output
      # dplyr (development version)
      
      ## New features
      
      !begin-bullets-1!
      
      -   !begin-bullet!
          [`.by`/`by`](https://dplyr.tidyverse.org/dev/reference/dplyr_by.html)
          is an experimental alternative to `group_by()` that supports
          per-operation grouping for `mutate()`, `summarise()`, `filter()`,
          and the `slice()` family (#6528).
      
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
      
          This feature was inspired by
          [data.table](https://CRAN.R-project.org/package=data.table), where
          the equivalent syntax looks like:
      
          !begin-codeblock!
              starwars[, .(mean_height = mean(height)), by = .(species, homeworld)]
      
          !end-codeblock!
          `with_groups()` is superseded in favor of `.by` (#6582).
      
          !end-bullet!
      -   !begin-bullet!
          `reframe()` is a new experimental verb that creates a new data frame
          by applying functions to columns of an existing data frame. It is
          very similar to `summarise()`, with two big differences:
      
          !begin-bullets-2!
          -   !begin-bullet!
              `reframe()` can return an arbitrary number of rows per group,
              while `summarise()` reduces each group down to a single row.
      
              !end-bullet!
          -   !begin-bullet!
              `reframe()` always returns an ungrouped data frame, while
              `summarise()` might return a grouped or rowwise data frame,
              depending on the scenario.
      
              !end-bullet!
      
          !end-bullets-2!
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
      
          !begin-bullets-3!
          -   !begin-bullet!
              A *join specification* can now be created through `join_by()`.
              This allows you to specify both the left and right hand side of
              a join using unquoted column names, such as
              `join_by(sale_date == commercial_date)`. Join specifications can
              be supplied to any `*_join()` function as the `by` argument.
      
              !end-bullet!
          -   !begin-bullet!
              Join specifications allow for new types of joins:
      
              !begin-bullets-4!
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
      
              !end-bullets-4!
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
      
          !end-bullets-3!
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
      
      !end-bullets-1!
      
      ## Lifecycle changes
      
      ### Breaking changes
      
      !begin-bullets-5!
      
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
          read the associated
          [grouping](https://github.com/tidyverse/tidyups/blob/main/006-dplyr-group-by-ordering.md)
          and
          [ordering](https://github.com/tidyverse/tidyups/blob/main/003-dplyr-radix-ordering.md)
          tidyups.
      
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
      
      !end-bullets-5!
      
      ### Newly deprecated
      
      !begin-bullets-6!
      
      -   !begin-bullet!
          `across()`, `c_across()`, `if_any()`, and `if_all()` now require the
          `.cols` and `.fns` arguments. In general, we now recommend that you
          use `pick()` instead of an empty `across()` call or `across()` with
          no `.fns` (e.g. `across(c(x, y))`. (#6523).
      
          !begin-bullets-7!
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
      
          !end-bullets-7!
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
      
      !end-bullets-6!
      
      ### Newly superseded
      
      !begin-bullets-8!
      
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
      
      !end-bullets-8!
      
      ### Newly stable
      
      !begin-bullets-9!
      
      -   !begin-bullet!
          The `.keep`, `.before`, and `.after` arguments to `mutate()` have
          moved from experimental to stable.
      
          !end-bullet!
      -   !begin-bullet!
          The `rows_*()` family of functions have moved from experimental to
          stable.
      
          !end-bullet!
      
      !end-bullets-9!
      
      ## vctrs
      
      Many of dplyr's vector functions have been rewritten to make use of the
      vctrs package, bringing greater consistency and improved performance.
      
      !begin-bullets-10!
      
      -   !begin-bullet!
          `between()` can now work with all vector types, not just numeric and
          date-time. Additionally, `left` and `right` can now also be vectors
          (with the same length as `x`), and `x`, `left`, and `right` are cast
          to the common type before the comparison is made (#6183, #6260,
          #6478).
      
          !end-bullet!
      -   !begin-bullet!
          `case_when()` (#5106):
      
          !begin-bullets-11!
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
      
          !end-bullets-11!
          !end-bullet!
      -   !begin-bullet!
          `coalesce()` (#6265):
      
          !begin-bullets-12!
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
      
          !end-bullets-12!
          !end-bullet!
      -   !begin-bullet!
          `first()`, `last()`, and `nth()` (#6331):
      
          !begin-bullets-13!
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
      
          !end-bullets-13!
          Additionally, they have all gained an `na_rm` argument since they
          are summary functions (#6242, with contributions from @tnederlof).
      
          !end-bullet!
      -   !begin-bullet!
          `if_else()` gains most of the same benefits as `case_when()`. In
          particular,\
          `if_else()` now takes the common type of `true`, `false`, and
          `missing` to determine the output type, meaning that you can now
          reliably use `NA`, rather than `NA_character_` and friends (#6243).
      
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
      
      !end-bullets-10!
      
      ## Minor improvements and bug fixes
      
      !begin-bullets-14!
      
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
          `group_walk()` gains an explict `.keep` argument (#6530).
      
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
      
      !end-bullets-14!


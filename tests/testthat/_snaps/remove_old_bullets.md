# Removing old bullets works

    Code
      iwalk(news_data_readable, function(x, y) {
        cat(paste("--", y, "---------------------------\n"))
        cat_ol(x)
      })
    Output
      -- Bullet 02; section 05; level 01 ---------------------------
       1. `reframe()` is a new experimental verb that creates a new data frame
          by applying functions to columns of an existing data frame. It is very
          similar to `summarise()`, with two big differences:
      -- Bullet 02; section 06; level 02 ---------------------------
       1. • `reframe()` can return an arbitrary number of rows per group, while
          `summarise()` reduces each group down to a single row.
      -- Bullet 02; section 07; level 02 ---------------------------
       1. • `reframe()` always returns an ungrouped data frame, while
          `summarise()` might return a grouped or rowwise data frame, depending
          on the scenario.
      -- Bullet 04; section 07; level 01 ---------------------------
       1. `reframe()` has been added in response to valid concern from the
          community that allowing `summarise()` to return any number of rows
          per group increases the chance for accidental bugs. We still feel
          that this is a powerful technique, and is a principled replacement for
          `do()`, so we have moved these features to `reframe()` (#6382).
      -- Bullet 05; section 08; level 01 ---------------------------
       1. `group_by()` now uses a new algorithm for computing groups. It is
          often faster than the previous approach (especially when there are
          many groups), and in most cases there should be no changes. The one
          exception is with character vectors, see the C locale news bullet
          below for more details (#4406, #6297).
      -- Bullet 06; section 09; level 01 ---------------------------
       1. `arrange()` now uses a faster algorithm for sorting character vectors,
          which is heavily inspired by data.table's `forder()`. See the C locale
          news bullet below for more details (#4962).
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
      -- Bullet 17; section 20; level 01 ---------------------------
       1. `across()` gains an experimental `.unpack` argument to optionally
          unpack (as in, `tidyr::unpack()`) data frames returned by functions in
          `.fns` (#6360).
      -- Bullet 18; section 21; level 01 ---------------------------
       1. `consecutive_id()` for creating groups based on contiguous runs of the
          same values, like `data.table::rleid()` (#1534).
      -- Bullet 19; section 22; level 01 ---------------------------
       1. `case_match()` is a "vectorised switch" variant of `case_when()` that
          matches on values rather than logical expressions. It is like a SQL
          "simple" `CASE WHEN` statement, whereas `case_when()` is like a SQL
          "searched" `CASE WHEN` statement (#6328).
      -- Bullet 20; section 23; level 01 ---------------------------
       1. `cross_join()` is a more explicit and slightly more correct
          replacement for using `by = character()` during a join (#6604).
      -- Bullet 21; section 24; level 01 ---------------------------
       1. `pick()` makes it easy to access a subset of columns from the current
          group. `pick()` is intended as a replacement for `across(.fns =
          NULL)`, `cur_data()`, and `cur_data_all()`. We feel that `pick()` is
          a much more evocative name when you are just trying to select a subset
          of columns from your data (#6204).
      -- Bullet 23; section 26; level 01 ---------------------------
       1. `arrange()` and `group_by()` now use the C locale, not the system
          locale, when ordering or grouping character vectors. This brings
          *substantial* performance improvements, increases reproducibility
          across R sessions, makes dplyr more consistent with data.table, and we
          believe it should affect little existing code. If it does affect your
          code, you can use `options(dplyr.legacy_locale = TRUE)` to quickly
          revert to the previous behavior. However, in general, we instead
          recommend that you use the new `.locale` argument to precisely specify
          the desired locale. For a full explanation please read the associated
          grouping and ordering tidyups.
      -- Bullet 25; section 28; level 01 ---------------------------
       1. `frame_data()`, `data_frame_()`, `lst_()` and `tbl_sum()` are no
          longer re-exported from tibble (#6276, #6277, #6278, #6284).
      -- Bullet 30; section 33; level 01 ---------------------------
       1. Passing `...` to `across()` is soft-deprecated because it's
          ambiguous when those arguments are evaluated. Now, instead of (e.g.)
          `across(a:b, mean, na.rm = TRUE)` you should write `across(a:b, ~
          mean(.x, na.rm = TRUE))` (#6073).
      -- Bullet 32; section 35; level 01 ---------------------------
       1. `cur_data()` and `cur_data_all()` are soft-deprecated in favour of
          `pick()` (#6204).
      -- Bullet 33; section 36; level 01 ---------------------------
       1. Using `by = character()` to perform a cross join is now soft-
          deprecated in favor of `cross_join()` (#6604).
      -- Bullet 34; section 37; level 01 ---------------------------
       1. `filter()`ing with a 1-column matrix is deprecated (#6091).
      -- Bullet 35; section 38; level 01 ---------------------------
       1. `progress_estimate()` is deprecated for all uses (#6387).
      -- Bullet 37; section 40; level 01 ---------------------------
       1. All functions deprecated in 1.0.0 (released April 2020) and earlier
          now warn every time you use them (#6387). This includes `combine()`,
          `src_local()`, `src_mysql()`, `src_postgres()`, `src_sqlite()`,
          `rename_vars_()`, `select_vars_()`, `summarise_each_()`,
          `mutate_each_()`, `as.tbl()`, `tbl_df()`, and a handful of older
          arguments. They are likely to be made defunct in the next major
          version (but not before mid 2024).
      -- Bullet 38; section 41; level 01 ---------------------------
       1. `slice()`ing with a 1-column matrix is deprecated.
      -- Bullet 39; section 42; level 01 ---------------------------
       1. `recode()` is superseded in favour of `case_match()` (#6433).
      -- Bullet 40; section 43; level 01 ---------------------------
       1. `recode_factor()` is superseded. We don't have a direct replacement
          for it yet, but we plan to add one to forcats. In the meantime you can
          often use `case_match(.ptype = factor(levels = ))` instead (#6433).
      -- Bullet 42; section 45; level 01 ---------------------------
       1. The `.keep`, `.before`, and `.after` arguments to `mutate()` have
          moved from experimental to stable.
      -- Bullet 43; section 46; level 01 ---------------------------
       1. The `rows_*()` family of functions have moved from experimental to
          stable.
      -- Bullet 44; section 47; level 01 ---------------------------
       1. `between()` can now work with all vector types, not just numeric and
          date-time. Additionally, `left` and `right` can now also be vectors
          (with the same length as `x`), and `x`, `left`, and `right` are
          cast to the common type before the comparison is made (#6183, #6260,
          #6478).
      -- Bullet 45; section 48; level 01 ---------------------------
       1. `case_when()` (#5106):
      -- Bullet 45; section 49; level 02 ---------------------------
       1. • Has a new `.default` argument that is intended to replace usage of
          `TRUE ~ default_value` as a more explicit and readable way to specify
          a default value. In the future, we will deprecate the unsafe recycling
          of the LHS inputs that allows `TRUE ~` to work, so we encourage you to
          switch to using `.default`.
      -- Bullet 45; section 50; level 02 ---------------------------
       1. • No longer requires exact matching of the types of RHS values. For
          example, the following no longer requires you to use `NA_character_`.
      -- Bullet 45; section 51; level 02 ---------------------------
       1. ```
          x <- c("little", "unknown", "small", "missing", "large")
          
          case_when(
            x %in% c("little", "small") ~ "one",
            x %in% c("big", "large") ~ "two",
            x %in% c("missing", "unknown") ~ NA
          )
          ```
      -- Bullet 45; section 52; level 02 ---------------------------
       1. • Supports a larger variety of RHS value types. For example, you can
          use a data frame to create multiple columns at once.
      -- Bullet 45; section 53; level 02 ---------------------------
       1. • Has new `.ptype` and `.size` arguments which allow you to enforce a
          particular output type and size.
      -- Bullet 45; section 54; level 02 ---------------------------
       1. • Has a better error when types or lengths were incompatible (#6261,
          #6206).
      -- Bullet 55; section 59; level 01 ---------------------------
       1. `first()`, `last()`, and `nth()` (#6331):
      -- Bullet 55; section 60; level 02 ---------------------------
       1. • When used on a data frame, these functions now return a single row
          rather than a single column. This is more consistent with the vctrs
          principle that a data frame is generally treated as a vector of rows.
      -- Bullet 55; section 61; level 02 ---------------------------
       1. • The `default` is no longer "guessed", and will always automatically
          be set to a missing value appropriate for the type of `x`.
      -- Bullet 55; section 62; level 02 ---------------------------
       1. • Error if `n` is not an integer. `nth(x, n = 2)` is fine, but `nth(x,
          n = 2.5)` is now an error.
      -- Bullet 58; section 62; level 01 ---------------------------
       1. Additionally, they have all gained an `na_rm` argument since they are
          summary functions (#6242, with contributions from @​tnederlof).
      -- Bullet 59; section 63; level 01 ---------------------------
       1. `if_else()` gains most of the same benefits as `case_when()`. In
          particular,\ `if_else()` now takes the common type of `true`, `false`,
          and `missing` to determine the output type, meaning that you can now
          reliably use `NA`, rather than `NA_character_` and friends (#6243).
      -- Bullet 60; section 64; level 01 ---------------------------
       1. `na_if()` (#6329) now casts `y` to the type of `x` before comparison,
          which makes it clearer that this function is type and size stable
          on `x`. In particular, this means that you can no longer do
          `na_if(<tibble>, 0)`, which previously accidentally allowed you to
          replace any instance of `0` across every column of the tibble with
          `NA`. `na_if()` was never intended to work this way, and this is
          considered off-label usage. You can also now replace `NaN` values in
          `x` with `na_if(x, NaN)`.
      -- Bullet 61; section 65; level 01 ---------------------------
       1. `lag()` and `lead()` now cast `default` to the type of `x`, rather
          than taking the common type. This ensures that these functions are
          type stable on `x` (#6330).
      -- Bullet 62; section 66; level 01 ---------------------------
       1. `row_number()`, `min_rank()`, `dense_rank()`, `ntile()`,
          `cume_dist()`, and `percent_rank()` are faster and work for more
          types. You can now rank by multiple columns by supplying a data frame
          (#6428).
      -- Bullet 63; section 67; level 01 ---------------------------
       1. `with_order()` now checks that the size of `order_by` is the same
          size as `x`, and now works correctly when `order_by` is a data frame
          (#6334).
      -- Bullet 64; section 68; level 01 ---------------------------
       1. Fixed an issue with latest rlang that caused internal tools (such
          as `mask$eval_all_summarise()`) to be mentioned in error messages
          (#6308).
      -- Bullet 65; section 69; level 01 ---------------------------
       1. Warnings are enriched with contextualised information in `summarise()`
          and `filter()` just like they have been in `mutate()` and `arrange()`.
      -- Bullet 66; section 70; level 01 ---------------------------
       1. Joins now reference the correct column in `y` when a type error is
          thrown while joining on two columns with different names (#6465).
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
      -- Bullet 98; section 102; level 01 ---------------------------
       1. `rename_with()` now disallows renaming in the `.cols` tidy-selection
          (#6561).
      -- Bullet 99; section 103; level 01 ---------------------------
       1. `rename_with()` now checks that the result of `.fn` is the right type
          and size (#6561).


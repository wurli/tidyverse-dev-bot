# removing old bullets works

    Code
      pwalk(reframe(filter(output, flag_new), .by = package, text = list(text)),
      function(package, text) {
        cli_h1("New updates from {package}")
        cat_line(text)
        cat_line("\n\n\n")
      })
    Message
      
      -- New updates from dplyr ------------------------------------------------------
    Output
      `transmute()` is superseded in favour of `mutate(.keep = "none")` (#6414).
      Joins on very wide tables are no longer bottlenecked by the application of `suffix` (#6642).
      `across()` will now error when supplied `...` without a `.fns` argument (#6638).
      `rename()` now contains examples of using `all_of()` and `any_of()` to rename using a named character vector (#6644).
      `rows_insert()` now checks that `y` contains the `by` columns (#6652).
      
      
      
      
    Message
      
      -- New updates from ggplot2 ----------------------------------------------------
    Output
      Glyphs drawing functions of the `draw_key_*()` family can now set `"width"` and `"height"` attributes (in centimetres) to the produced keys to control their displayed size in the legend.
      
      
      
      

---

    Code
      purrr::walk(purrr::list_transpose(as.list(select(filter(output,
        flag_probably_old), update = text, most_similar_prev_update = most_similar))),
      function(x) {
        cli_h1("Update")
        cat_line(x[1])
        cli_h1("Most similar previous update")
        cat_line(x[2])
        cat_line("\n\n\n")
      })
    Message
      
      -- Update ----------------------------------------------------------------------
    Output
      `.by`/`by` is an experimental alternative to `group_by()` that supports per-operation grouping for `mutate()`, `summarise()`, `filter()`, and the `slice()` family (#6528). Rather than:
      ```
      starwars %>%
        group_by(species, homeworld) %>%
        summarise(mean_height = mean(height))
      ```
      You can now write:
      ```
      starwars %>%
        summarise(
          mean_height = mean(height),
          .by = c(species, homeworld)
        )
      ```
      The most useful reason to do this is because `.by` only affects a single operation. In the example above, an ungrouped data frame went into the `summarise()` call, so an ungrouped data frame will come out; with `.by`, you never need to remember to `ungroup()` afterwards and you never need to use the `.groups` argument. Additionally, using `summarise()` with `.by` will never sort the results by the group key, unlike with `group_by()`. Instead, the results are returned using the existing ordering of the groups from the original data. We feel this is more predictable, better maintains any ordering you might have already applied with a previous call to `arrange()`, and provides a way to maintain the current ordering without having to resort to factors. This feature was inspired by data.table, where the equivalent syntax looks like:
      ```
      starwars[, .(mean_height = mean(height)), by = .(species, homeworld)]
      ```
      `with_groups()` is superseded in favor of `.by` (#6582).
    Message
      
      -- Most similar previous update ------------------------------------------------
    Output
      `.by` is an experimental alternative to `group_by()` that supports per-operation grouping for `mutate()`, `summarise()`, `filter()`, and the `slice()` family (#6528). Rather than:
      ```
      starwars %>%
        group_by(species, homeworld) %>%
        summarise(mean_height = mean(height))
      ```
      You can now write:
      ```
      starwars %>%
        summarise(
          mean_height = mean(height),
          .by = c(species, homeworld)
        )
      ```
      The most useful reason to do this is because grouping with `.by` is *temporary* and only affects a single operation. An ungrouped data frame went into the `summarise()` call, so an ungrouped data frame will come out; with `.by`, you never need to remember to `ungroup()` afterwards. Additionally, using `summarise()` or `slice()` with `.by` will never sort the results by the group key, unlike with `group_by()`. Instead, the results are returned using the existing ordering of the groups from the original data. We feel this is more predictable, better maintains any ordering you might have already applied with a previous call to `arrange()`, and provides a way to maintain the current ordering without having to resort to factors. `with_groups()` is superseded in favour of `.by` (#6582). This feature was inspired by data.table, where the equivalent syntax looks like:
      ```
      starwars[, .(mean_height = mean(height)), by = .(species, homeworld)]
      ```
      
      
      
      
    Message
      
      -- Update ----------------------------------------------------------------------
    Output
      `coalesce()` (#6265):
      • Discards `NULL` inputs up front.
      • No longer iterates over the columns of data frame input. Instead, a row is now only coalesced if it is entirely missing, which is consistent with `vctrs::vec_detect_missing()` and greatly simplifies the implementation.
      • Has new `.ptype` and `.size` arguments which allow you to enforce a particular output type and size.
    Message
      
      -- Most similar previous update ------------------------------------------------
    Output
      `coalesce()` (#6265):
      • Discards `NULL` inputs are up front.
      • No longer iterates over the columns of data frame input. Instead, a row is now only coalesced if it is entirely missing, which is consistent with `vctrs::vec_equal_na()` and greatly simplifies the implementation.
      • Has new `.ptype` and `.size` arguments which allow you to enforce a particular output type and size.
      
      
      
      
    Message
      
      -- Update ----------------------------------------------------------------------
    Output
      `coord_radial()` is a successor to `coord_polar()` with more customisation options. In particular, `coord_radial()` can:
      • integrate with the new guide system via a dedicated `guide_axis_theta()` to display the angle coordinate.
      • in addition to drawing full circles, also draw circle sectors by using the `end` argument.
      • avoid data vanishing in the center of the plot by setting the `donut` argument.
      • adjust the `angle` aesthetic of layers, such as `geom_text()`, to align with the coordinate system using the `rotate_angle` argument.
    Message
      
      -- Most similar previous update ------------------------------------------------
    Output
      `coord_radial()` is a successor to `coord_polar()` with more customisation options. `coord_radial()` can:
      • integrate with the new guide system via a dedicated `guide_axis_theta()` to display the angle coordinate.
      • in addition to drawing full circles, also draw circle sectors by using the `end` argument.
      • avoid data vanishing in the center of the plot by setting the `donut` argument.
      • adjust the `angle` aesthetic of layers, such as `geom_text()`, to align with the coordinate system using the `rotate_angle` argument.
      
      
      
      


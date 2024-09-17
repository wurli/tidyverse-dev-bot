# profvis (development version)

!begin-bullets-1!

-   !begin-bullet!
    New technique for trimming uninteresting frames from the stack
    (#130). This requires a new evaluation model where the code you
    supply to `profvis()` is turned into the body of a zero-argument
    anonymous function that is then called by profvis. This subtly
    changes the semantics of evaluation, but it's very unlikely to
    affect the type of code that you are typically profiling.
    !end-bullet!
-   !begin-bullet!
    Bundled `highlight.js` updated to the latest version 11.10.0.
    !end-bullet!
-   !begin-bullet!
    The CSS for profvis code is scoped so that it does not affect other
    blocks of code, such as those from RMarkdown or Quarto (@wch, #140).
    !end-bullet!
-   !begin-bullet!
    profvis now relies on R 4.0.0.
    !end-bullet!
-   !begin-bullet!
    `profvis()` now uses doubles instead of integers (#114).
    !end-bullet!
-   !begin-bullet!
    The version of jQuery bundled in profvis has been upgraded to 3.7.1
    (@hedsnz, #139).
    !end-bullet!
-   !begin-bullet!
    profvis no longer requires purrr or stringr, and no longer suggests
    ggplot2, devtools, knitr, or rmarkdown.
    !end-bullet!
-   !begin-bullet!
    `profvis()` now uses elapsed time where possible (#72).
    !end-bullet!

!end-bullets-1!

# profvis 0.3.8

!begin-bullets-2!

-   !begin-bullet!
    `print()` gains an `aggregate` argument. Use
    `print(profvis(f()), aggregate = TRUE)` to aggregate frames by name
    in the flamegraph. This makes it easier to see the big picture
    (#115). Set the `profvis.aggregate` global option to `TRUE` to
    change the default.

    !end-bullet!
-   !begin-bullet!
    For C function declarations that take no parameters, added `void`
    parameter.

    !end-bullet!

!end-bullets-2!

# profvis 0.3.7

!begin-bullets-3!

-   !begin-bullet!
    Resolved #102:" Added `simplify` argument. When `TRUE` (the
    default), the profiles are simplified using the new
    `filter.callframes` argument of R 4.0. This argument has no effect
    on older R versions. (#118)

    !end-bullet!
-   !begin-bullet!
    Fixed #111: auto-scrolling to lines of code did not work in some
    browsers. (#113)

    !end-bullet!

!end-bullets-3!

# profvis 0.3.6

!begin-bullets-4!

-   !begin-bullet!
    Added a profvis Shiny module, for starting/stopping the profiler
    during the execution of a Shiny application. This can be helpful if
    you don't want to profile the entire execution of an app, only a
    certain operation. To install the profvis module into your app, add
    `profvis_ui("profvis")` to your UI, and
    `callModule(profvis_server, "profvis")` to your server function.

    !end-bullet!
-   !begin-bullet!
    Exported `parse_rprof` function.

    !end-bullet!

!end-bullets-4!

# profvis 0.3.5

!begin-bullets-5!

-   !begin-bullet!
    Fixed problem with development build of R where source refs are
    turned on by default (reported by Tomas Kalibera).
    !end-bullet!

!end-bullets-5!

# profvis 0.3.4

!begin-bullets-6!

-   !begin-bullet!
    Fixed #77: The contents of `<expr>` are now always listed first.

    !end-bullet!
-   !begin-bullet!
    Addressed #85: The `pause()` function is now implemented in C, which
    reduces the amount of data generated.

    !end-bullet!
-   !begin-bullet!
    Fixed #86: In the data pane, toggling between horizontal/vertical
    view caused the flame graph to render on top of the tree view.

    !end-bullet!
-   !begin-bullet!
    Fixed #84: In the data pane, leaf nodes (representing top-most calls
    on the stack) were not displayed.

    !end-bullet!
-   !begin-bullet!
    Addressed #82: In the data pane, if a node has exactly one child,
    that child will automatically be expanded. This makes it more
    efficient to explore the data. (#83)

    !end-bullet!
-   !begin-bullet!
    Fixed #50: In the data pane, function calls were shown in reverse
    order.

    !end-bullet!

!end-bullets-6!

# profvis 0.3.3

!begin-bullets-7!

-   !begin-bullet!
    Fixed #68: profvis threw an error when a package was installed using
    `devtools::install_github(args = "--with-keep.source")`.

    !end-bullet!
-   !begin-bullet!
    Fix bug where, when loading a profile that didn't contain memory
    data, profvis would throw an error. #66

    !end-bullet!
-   !begin-bullet!
    Fixed #73: profvis would throw an error if used on code sourced from
    a remote URL.

    !end-bullet!

!end-bullets-7!

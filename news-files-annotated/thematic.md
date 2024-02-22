# thematic (development version)

# thematic 0.1.5

!begin-bullets-1!

-   !begin-bullet!
    Accommodate for breaking changes in ggplot2 v3.5.0. (#148)
    !end-bullet!
-   !begin-bullet!
    `{thematic}` now works with recent versions of the `{vdiffr}`
    package. (#149)
    !end-bullet!

!end-bullets-1!

# thematic 0.1.4

!begin-bullets-2!

-   !begin-bullet!
    The `{httpgd}` graphics device (and thus, Github codespaces) is now
    supported. (#143)
    !end-bullet!

!end-bullets-2!

# thematic 0.1.3

!begin-bullets-3!

-   !begin-bullet!
    Closed #129: Fixed a bug with not being able override thematic
    inside geom_sf(). (#129)
    !end-bullet!
-   !begin-bullet!
    Closed #120: A warning about a `length-one vector` is no longer
    thrown on R 4.2. (#121)
    !end-bullet!
-   !begin-bullet!
    Closed #111: `{thematic}` no longer throws an error when used with
    `ggiraph::dsvg()`. (#112)
    !end-bullet!

!end-bullets-3!

# thematic 0.1.2.1

Patch release for vdiffr 1.0

# thematic 0.1.2

!begin-bullets-4!

-   !begin-bullet!
    Closed #89: `{thematic}` now works as expected with the
    `{gganimate}` package. (#96)
    !end-bullet!
-   !begin-bullet!
    Closed #93: Better support for `{ggplot2}` extensions that set
    geom/scale colour defaults to 0.
    !end-bullet!
-   !begin-bullet!
    Closed #90: Enabling thematic no longer fails when used with
    package(s) that register `{ggplot2}` methods via
    `registerS3method()` within `.onLoad()` (`{zoo}` is one such package
    that does this). (#90)
    !end-bullet!
-   !begin-bullet!
    Closed #86: `thematic_rmd()` now works as expected in
    `shiny: runtime` Rmd documents. (#87)
    !end-bullet!
-   !begin-bullet!
    Closed #82: Fixed a bug with `ggplot2::element_blank()` in
    plot-specific user code not being respected by `{thematic}`. (#83)
    !end-bullet!

!end-bullets-4!

# thematic 0.1.1

!begin-bullets-5!

-   !begin-bullet!
    Initial release of the package, see
    https://rstudio.github.io/thematic/
    !end-bullet!

!end-bullets-5!

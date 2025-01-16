# webshot2 (development version)

!begin-bullets-1!

-   !begin-bullet!
    Updated the documentation for `webshot()` to clarify that `expand`
    only applies to the clipping rectangle determined by `selector`.
    (#68)

    !end-bullet!
-   !begin-bullet!
    `webshot()` now rounds `vwidth` and `vheight` to the nearest integer
    to match Chrome's expectations. If this behavior is somehow
    problematic, you can use `vwidth = I(my_width)` to avoid the
    conversion. (#70)

    !end-bullet!
-   !begin-bullet!
    `webshot()` now surfaces errors that occur when working with the
    lower-level screenshot API provided by Chrome via `{chromote}`.
    (#69)

    !end-bullet!

!end-bullets-1!

# webshot2 0.1.1

!begin-bullets-2!

-   !begin-bullet!
    `webshot()` now supports JPEG (`.jpg` or `.jpeg`) and WEBP (`.webp`)
    image formats. (@trafficonese #45)

    !end-bullet!
-   !begin-bullet!
    Fixed #52: `rmdshot()` did not work when used to screenshot an R
    Markdown document with `runtime: shiny` or `runtime: shinyrmd`.
    (#53)

    !end-bullet!
-   !begin-bullet!
    Fixed #24: Console messages from `webshot()` can now be suppressed
    by setting `quiet = TRUE` or using the `webshot.quiet` global
    option. (@trafficonese #45)

    !end-bullet!

!end-bullets-2!

# webshot2 0.1.0

!begin-bullets-3!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-3!

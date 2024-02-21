# pretttycode development version

!begin-bullets-1!

-   !begin-bullet!
    Printing primitive functions excludes their `NULL` environment (#11
    @mdequeljoe)
    !end-bullet!
-   !begin-bullet!
    `highlight()` supports long strings and symbols (#21
    @moodymudskipper)
    !end-bullet!

!end-bullets-1!

# prettycode 1.1.0

!begin-bullets-2!

-   !begin-bullet!
    Use the colors of the current theme in RStudio.

    !end-bullet!
-   !begin-bullet!
    Color matching brackets to help distinguish between scopes (#8,
    @mdequeljoe).

    !end-bullet!
-   !begin-bullet!
    The withr package is now a development dependency, it is not needed
    for regular use.

    !end-bullet!

!end-bullets-2!

# prettycode 1.0.2

!begin-bullets-3!

-   !begin-bullet!
    Add `prettycode::prettycode()`. Call this function to turn on
    pretty-printing of function objects. This is needed to work around
    the new S3 method search limits in R 3.5.x.

    !end-bullet!
-   !begin-bullet!
    If prettycode fails to highlight a function, it falls back to
    `base::print.function()` now (#3).

    !end-bullet!

!end-bullets-3!

# prettycode 1.0.1

!begin-bullets-4!

-   !begin-bullet!
    Avoid registering the `print.function` S3 method. This is needed to
    avoid a new `R CMD check` check
    !end-bullet!

!end-bullets-4!

# prettycode 1.0.0

First public release.

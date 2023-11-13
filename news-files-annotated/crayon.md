# crayon (development version)

# crayon 1.5.2

!begin-bullets-1!

-   !begin-bullet!
    crayon functions now mark their output with the right encoding, if
    their input was marked (#136, #138).
    !end-bullet!

!end-bullets-1!

# 1.5.1

!begin-bullets-2!

-   !begin-bullet!
    crayon now does not fail to install from source if the utils package
    is not loaded (#133).
    !end-bullet!

!end-bullets-2!

# 1.5.0

!begin-bullets-3!

-   !begin-bullet!
    You can use the new `cli.default_num_colors` option to set the
    default number of ANSI colors, only if ANSI support is otherwise
    detected. See the details in the manual of `num_ansi_colors()`.
    (From cli.)

    !end-bullet!
-   !begin-bullet!
    crayon now install cleanly on R 3.4.x and R 3.5.x on Windows (#131).

    !end-bullet!

!end-bullets-3!

# 1.4.2

!begin-bullets-4!

-   !begin-bullet!
    Better ANSI support detection if there is an active `sink()`.

    !end-bullet!
-   !begin-bullet!
    Support ANSI markup in RStudio jobs.

    !end-bullet!

!end-bullets-4!

# 1.4.1

!begin-bullets-5!

-   !begin-bullet!
    ANSI color support detection works correctly now in older RStudio
    (#112).

    !end-bullet!
-   !begin-bullet!
    ANSI color support detection works correctly now on older R versions
    (#109).

    !end-bullet!

!end-bullets-5!

# 1.4.0

!begin-bullets-6!

-   !begin-bullet!
    Overhauled and much improved detection of ANSI color support and
    number of ANSI colors.

    !end-bullet!
-   !begin-bullet!
    `NO_COLOR` environment variable disables color (#64)

    !end-bullet!
-   !begin-bullet!
    Now colors are turned on if ANSICON
    (https://github.com/adoxa/ansicon) is active.

    !end-bullet!
-   !begin-bullet!
    New `hyperlink()` function to add hyperlinks to terminal output. The
    new `has_hyperlink()` function tests if the current `stdout()`
    supports this.

    !end-bullet!
-   !begin-bullet!
    `reset` style now restores previous style for text following it
    (@brodieG, #35).

    !end-bullet!
-   !begin-bullet!
    Warnings are no longer generated when the INSIDE_EMACS environment
    variable is set but does not include a version number.

    !end-bullet!

!end-bullets-6!

# 1.3.4

!begin-bullets-7!

-   !begin-bullet!
    Style functions convert arguments to character now

    !end-bullet!
-   !begin-bullet!
    Autodetect RStudio ANSI support

    !end-bullet!
-   !begin-bullet!
    `col_align()` gains `type` argument, default `"width"` (#54).

    !end-bullet!

!end-bullets-7!

# 1.3.2

!begin-bullets-8!

-   !begin-bullet!
    Removed dependency to `memoise` (@brodieG, #25)

    !end-bullet!
-   !begin-bullet!
    Fixed a test case that changed the `crayon.enabled` setting,
    potentially (@brodieG)

    !end-bullet!
-   !begin-bullet!
    Added `crayon.colors` option, to specify the number of colors
    explicitly

    !end-bullet!
-   !begin-bullet!
    `TERM=xterm` and `tput colors=8` will use 256 colors, as 256 colors
    are usually supported in this case (#17)

    !end-bullet!
-   !begin-bullet!
    Support colors in ConEmu and cmder, on Windows

    !end-bullet!
-   !begin-bullet!
    Fix color detection in Emacs tramp

    !end-bullet!
-   !begin-bullet!
    `col_strsplit` and `col_substr` corner cases:

    !begin-bullets-9!
    -   !begin-bullet!
        handle empty chunks at beginning or end of strings like
        `base::strsplit` (@brodieG, #26)

        !end-bullet!
    -   !begin-bullet!
        explicitly deal with 'split' values that are not length 1 as
        that is not currently supported

        !end-bullet!
    -   !begin-bullet!
        handle zero length `x` argument in `col_substr`, and add more
        explicit error messages for corner cases

        !end-bullet!

    !end-bullets-9!
    !end-bullet!
-   !begin-bullet!
    Some performance improvements to `col_substr` (@brodieG)

    !end-bullet!
-   !begin-bullet!
    Change rgb to ANSI code mapping, based on the "paint" ruby gem
    (@richfitz, #33, #34)

    !end-bullet!

!end-bullets-8!

# 1.3.1

!begin-bullets-10!

-   !begin-bullet!
    Fixed some `R CMD check` problems.
    !end-bullet!

!end-bullets-10!

# 1.3.0

!begin-bullets-11!

-   !begin-bullet!
    Colors are turned on by default in Emacs ESS 23.x and above.

    !end-bullet!
-   !begin-bullet!
    Functions to turn on and off a style: `start`, `finish`.

    !end-bullet!
-   !begin-bullet!
    Really fix `tput` corner cases (@jimhester, #21)

    !end-bullet!

!end-bullets-11!

# 1.2.1

!begin-bullets-12!

-   !begin-bullet!
    Fix detecting number of colors when `tput` exists, but fails with an
    error and/or does not return anything useful. (@jimhester, #18, #19)
    !end-bullet!

!end-bullets-12!

# 1.2.0

!begin-bullets-13!

-   !begin-bullet!
    Fix detection of number of colors, it was cached from installation
    time (#17).

    !end-bullet!
-   !begin-bullet!
    Color aware string operations. They are slow and experimental
    currently.

    !end-bullet!

!end-bullets-13!

# 1.1.0

!begin-bullets-14!

-   !begin-bullet!
    `show_ansi_colors()` prints all supported colors on the screen.

    !end-bullet!
-   !begin-bullet!
    256 colors, on terminals that support it.

    !end-bullet!
-   !begin-bullet!
    Disable colors on Windows, they are not supported in the default
    setup.

    !end-bullet!

!end-bullets-14!

# 1.0.0

!begin-bullets-15!

-   !begin-bullet!
    First released version.
    !end-bullet!

!end-bullets-15!

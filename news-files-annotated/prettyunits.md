# prettyunits (development version)

# prettyunits 1.2.0

!begin-bullets-1!

-   !begin-bullet!
    New `pretty_num()` function with all the BIPM agreed unit prefix
    (#26, @cregouby).

    !end-bullet!
-   !begin-bullet!
    New `pretty_round()` and `pretty_signif()` functions preserve the
    requested number of digits as character strings (#14, @billdenney).

    !end-bullet!
-   !begin-bullet!
    New `pretty_p_value()` function to convert p-values to character
    strings where small values are shown like "\<0.0001" (#13,
    @billdenney).

    !end-bullet!
-   !begin-bullet!
    New `pretty_color()` functionm converts a color to a named color
    (#12, @billdenney).

    !end-bullet!

!end-bullets-1!

# prettyunits 1.1.1

!begin-bullets-2!

-   !begin-bullet!
    Fix spurious zero fractions in `pretty_bytes()` when formatting
    vectors of sizes (#23).
    !end-bullet!

!end-bullets-2!

# prettyunits 1.1.0

!begin-bullets-3!

-   !begin-bullet!
    `pretty_dt()`, `pretty_ms()` and `pretty_sec()` now handle `NA`
    values properly, and return `NA_character_` for them (#10,
    @petermeissner).

    !end-bullet!
-   !begin-bullet!
    `pretty_bytes()` now formats quantities just below the units better.
    E.g. 1MB - 1B is formatted as `"1 MB"` instead of `""1000 kB"`
    (#18).

    !end-bullet!
-   !begin-bullet!
    `pretty_bytes()` now has multiple styles. In particular, a fixed
    width style is useful for progress bars. Another style avoids the
    left-padding with spaces.

    !end-bullet!
-   !begin-bullet!
    The new low level `compute_bytes()` function can be used to create
    custom formatters for bytes.

    !end-bullet!

!end-bullets-3!

# prettyunits 1.0.2

!begin-bullets-4!

-   !begin-bullet!
    `pretty_bytes()` always uses two fraction digits for non-integers.
    This looks nicer in a progress bar, as the width of string does not
    change so much.
    !end-bullet!

!end-bullets-4!

# prettyunits 1.0.1

First version with a NEWS file.

!begin-bullets-5!

-   !begin-bullet!
    Get rid of `R CMD check` notes.
    !end-bullet!

!end-bullets-5!

# prettyunits 1.0.0

Last version without a NEWS file.

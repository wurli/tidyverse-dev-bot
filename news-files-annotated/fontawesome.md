# fontawesome (development version)

# fontawesome 0.5.2

!begin-bullets-1!

-   !begin-bullet!
    Updated icon set to that of Font Awesome 6.4.2. (#111)
    !end-bullet!

!end-bullets-1!

# fontawesome 0.5.1

!begin-bullets-2!

-   !begin-bullet!
    Updated icon set to that of Font Awesome 6.4.0. (#109)
    !end-bullet!

!end-bullets-2!

# fontawesome 0.5.0

!begin-bullets-3!

-   !begin-bullet!
    Updated icon set to that of Font Awesome 6.2.1. (#102)

    !end-bullet!
-   !begin-bullet!
    Closed #101: added the `vertical_align` argument `fa()` to control
    vertical alignment of icons. (#103)

    !end-bullet!
-   !begin-bullet!
    Closed #99 and #100: reinstated missing '.woff2' files. (#102)

    !end-bullet!

!end-bullets-3!

# fontawesome 0.4.0

!begin-bullets-4!

-   !begin-bullet!
    Updated icon set to that of Font Awesome 6.2.0. (#96)

    !end-bullet!
-   !begin-bullet!
    It's now possible to reference icons by several of their previous
    names. For example the old icon names `"contact-card"` and `"vcard"`
    will map to the current name of `"address-card"`. (#96)

    !end-bullet!
-   !begin-bullet!
    There is now a `prefer_type` argument (default: `"regular"`) that
    allows you to register a choice between a solid- or regular-type
    icon should both be available for a specific short name. (#96)

    !end-bullet!

!end-bullets-4!

# fontawesome 0.3.0

!begin-bullets-5!

-   !begin-bullet!
    Closed #80: Updated icon set to that of Font Awesome 6.1. (#85)

    !end-bullet!
-   !begin-bullet!
    Closed #68: full icon names (e.g., `"fab fa-r-project"`) are now
    properly parsed and verified in the `fa_i()` function. (#77)

    !end-bullet!
-   !begin-bullet!
    Closed #66 and #73: CSS length values (supplied to the `height` or
    `width` options of the `fa()` function) are now correctly handled
    when they contain decimals. (#74)

    !end-bullet!

!end-bullets-5!

# fontawesome 0.2.2

!begin-bullets-6!

-   !begin-bullet!
    .ttf font files (and associated CSS) have been added back to the
    pared down selection of included webfonts (includes .woff and .ttf);
    this was to re-enable compatibility with the webshot package in
    Windows. (#61)
    !end-bullet!

!end-bullets-6!

# fontawesome 0.2.1

!begin-bullets-7!

-   !begin-bullet!
    Closed #53: The `margin_right` argument of `fa()` is now functional,
    defaulting to the `"auto"` margin; a `margin_left` argument was also
    added with the same default. (#54)

    !end-bullet!
-   !begin-bullet!
    The `"desc"` option in `fa()`'s `a11y` argument is now changed to
    `"deco"`.

    !end-bullet!

!end-bullets-7!

# fontawesome 0.2.0

!begin-bullets-8!

-   !begin-bullet!
    Closed #42: Support for additional R Markdown output formats with
    `fa()`: `pdf_document`, `word_document`, `github_document`,
    `slidy_presentation`, `beamer_presentation`, and
    `ioslides_presentation`. (#43)

    !end-bullet!
-   !begin-bullet!
    Closed #38: Add accessibility features to SVG icons produced by
    `fa()` with its new `a11y` argument. (#41)

    !end-bullet!
-   !begin-bullet!
    Fixes a rendering issue with SVG icons in IE11. (#40)

    !end-bullet!
-   !begin-bullet!
    Tooltips can be added to SVG icons prepared by `fa()` by using the
    new `title` argument.

    !end-bullet!
-   !begin-bullet!
    Closed #44: The collection of font files that support the use of
    `fa_i()` has been trimmed down to just the '.woff' variety. (#45)

    !end-bullet!
-   !begin-bullet!
    Closed #32, #33: Package dependencies have been greatly reduced.
    (#35)

    !end-bullet!

!end-bullets-8!

# fontawesome 0.1.0

!begin-bullets-9!

-   !begin-bullet!
    Added functions `fa()`, `fa_i()`, and `fa_png()` for preparing Font
    Awesome icons in three ways.
    !end-bullet!

!end-bullets-9!

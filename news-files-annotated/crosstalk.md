# crosstalk (development version)

# crosstalk 1.2.2

Address a new R CMD check NOTE about Rd `\link{}`{=tex} targets missing
package anchors. (#163)

## crosstalk 1.2.1

### Bug fixes

!begin-bullets-1!

-   !begin-bullet!
    Some `SharedData` reactive accessors (e.g. `sd$selection()`) were
    broken when the `SharedData` instance was created in a Shiny module.
    (#114)
    !end-bullet!
-   !begin-bullet!
    Closed #87: Fixed an issue where `filter_select()` was double
    escaping HTML characters. (#141)
    !end-bullet!

!end-bullets-1!

## crosstalk 1.2.0

### Breaking changes

!begin-bullets-2!

-   !begin-bullet!
    Removed the Bootstrap HTML dependency attached to `filter_select()`,
    `filter_checkbox()`, and `bscols()`. This allows `{crosstalk}` to be
    used in a non-Bootstrap CSS framework (e.g., `{distill}`) without
    de-grading the overall look. If this change happens to break
    functionality or de-grade the overall appearance of your
    `{crosstalk}` site, consider adding
    `bslib::bs_theme_dependencies(bslib::bs_theme(version = 3))` to the
    UI definition, which will add back the Bootstrap dependency.
    !end-bullet!

!end-bullets-2!

### Improvements

!begin-bullets-3!

-   !begin-bullet!
    Upgraded `filter_select()`'s selectize.js dependency to v0.12.4.
    !end-bullet!

!end-bullets-3!

## crosstalk 1.1.1

!begin-bullets-4!

-   !begin-bullet!
    Upgrade to jQuery v3.5.1.
    !end-bullet!

!end-bullets-4!

## crosstalk 1.1.0.1

!begin-bullets-5!

-   !begin-bullet!
    SharedData now works even when shiny isn't installed.
    !end-bullet!

!end-bullets-5!

## crosstalk 1.1.0

!begin-bullets-6!

-   !begin-bullet!
    `shiny` and `ggplot2` are now Suggested packages instead of Imported
    packages.

    !end-bullet!
-   !begin-bullet!
    Upgrade to Bootstrap v3.4.1 and jQuery v3.4.1.

    !end-bullet!

!end-bullets-6!

## crosstalk 1.0.1

!begin-bullets-7!

-   !begin-bullet!
    `selection_factor` behavior was no longer correct with ggplot2
    2.2.0, which changed its algorithm for stacking order. Added a
    `reverse` argument that defaults to detecting ggplot2 version and
    acting accordingly.
    !end-bullet!

!end-bullets-7!

## crosstalk 1.0.0

Initial release.

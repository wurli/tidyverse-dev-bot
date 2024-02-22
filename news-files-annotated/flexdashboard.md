# flexdashboard (development version)

!begin-bullets-1!

-   !begin-bullet!
    flexdashboard now prevents top margin from being applied to boxes
    created with flexdashboard's markdown syntax when Bootstrap 5 is
    used. (#443)
    !end-bullet!

!end-bullets-1!

# flexdashboard 0.6.2

## New features

!begin-bullets-2!

-   !begin-bullet!
    flexdashboard now supports icons for navigation dropdown menus.
    Pages are created with level-1 headings and can be added to a
    dropdown menu with the `data-navmenu` attribute. You can now also
    assign an icon to this dropdown menu by providing a
    `data-navmenu-icon` attribute, using the same icon selections as
    described in Page Icons. (#419)

    !end-bullet!
-   !begin-bullet!
    Improved support for page selection in navigation dropdown menus in
    Bootstrap 5. (#421)

    !end-bullet!

!end-bullets-2!

## Minor improvements and fixes

!begin-bullets-3!

-   !begin-bullet!
    Fixed #411: Improved support for Bootstrap 5 to ensure correct
    handling of the active dashboard page. (#418)

    !end-bullet!
-   !begin-bullet!
    Fixed #234: Use the correct social sharing link for Facebook.

    !end-bullet!
-   !begin-bullet!
    Fixed #102: knitr's `collapse` chunk option now works as expected.
    This fix also ensures that other knitr options that modify the chunk
    option, like `class.chunk` and others are applied correctly. (#428)

    !end-bullet!

!end-bullets-3!

# flexdashboard 0.6.1

!begin-bullets-4!

-   !begin-bullet!
    Closed #398: The logo is now positioned to the left (instead of the
    right) of the title (regression introduced by 0.6.0).
    !end-bullet!

!end-bullets-4!

# flexdashboard 0.6.0

This release adds integration with the new `{bslib}` package, making it
much easier to customize the overall appearance of the dashboard (and/or
upgrade to Bootstrap 4). See the new website's new article on theming to
learn more.

### Possibly breaking changes

!begin-bullets-5!

-   !begin-bullet!
    The `smart` argument was removed from
    `flexdashboard::flex_dashboard` since it was removed in rmarkdown
    2.2 (relatedly, we now require rmarkdown 2.2 or higher). (#301)
    !end-bullet!
-   !begin-bullet!
    The `window.FlexDashboard.themeColor` JavaScript object property is
    no longer available. Resolving of theming accent colors should now
    be done server-side via `{bslib}`'s dynamic theming tools. (#305)
    !end-bullet!

!end-bullets-5!

### Improvements & fixes

!begin-bullets-6!

-   !begin-bullet!
    Close #343: Fix an issue with order of dependencies with
    `shiny_prerendered` following previous changes in rmarkdown -
    rstudio/rmarkdown#2064. (#344)

    !end-bullet!
-   !begin-bullet!
    Closed #315, #321, and #286: `DT::datatable()` now fills its
    container correctly inside of `flexdashboard::flex_dashboard()`.
    (#322)

    !end-bullet!
-   !begin-bullet!
    Closed #310: An `.active` class may now be added to a particular
    `.tabset` tab to control which tab is shown by default. (#311)

    !end-bullet!
-   !begin-bullet!
    Closed #306: A `.tabset-pills` class may now be added to `.tabset`
    to render pills instead of tabs. (#307)

    !end-bullet!
-   !begin-bullet!
    Closed #297, #254: `gauge()` now uses justgage.js 1.4.0, allowing
    `renderGauge()` to properly update various labels and `sectors` on
    redraw. (#301)

    !end-bullet!
-   !begin-bullet!
    Closed #300: When a custom `{bslib}` theme is provided to
    `flex_dashboard`, `gauge()` and `viewBox()` now generate default
    styles to match it. (#301, #305)

    !end-bullet!
-   !begin-bullet!
    Closed #227: Fixed a bug with `source_code: embed` producing errors
    because code wasn't being escaped before being included in HTML.
    (#228, thanks @cderv)

    !end-bullet!
-   !begin-bullet!
    Added padding to the top of the sidebar. (#294)

    !end-bullet!

!end-bullets-6!

# flexdashboard 0.5.2

!begin-bullets-7!

-   !begin-bullet!
    Support use of Font Awesome icon sets (e.g. "fab fa-r-project")

    !end-bullet!
-   !begin-bullet!
    Fixed #245: Shiny (1.4.0+) outputs not rendering in modified
    flexdashboard html. (#250)

    !end-bullet!

!end-bullets-7!

# flexdashboard 0.5.1.1

Changed maintainer.

# flexdashboard 0.5.1

!begin-bullets-8!

-   !begin-bullet!
    Fixed #149: a compatability issue when using Pandoc 2.0. (#150)

    !end-bullet!
-   !begin-bullet!
    Fixed #139: remove previous valueBox handlers when rebinding.

    !end-bullet!
-   !begin-bullet!
    Update to roxygen2 6.0.

    !end-bullet!

!end-bullets-8!

# flexdashboard 0.5.0

(tagged @ commit #d99dd62)

!begin-bullets-9!

-   !begin-bullet!
    Don't hook graphics device option for `fig_mobile` if it's a data
    chunk (this broke knitr caching for `shiny_prerendered` data
    chunks).
    !end-bullet!

!end-bullets-9!

# flexdashboard 0.4.0

(tagged @ commit #0a88a91)

!begin-bullets-10!

-   !begin-bullet!
    Add support for `target` field in navbar links (e.g. target:
    "\_blank").

    !end-bullet!
-   !begin-bullet!
    Fixed #100: problem w/ embedding source code for Rmd w/ spaces in
    path.

    !end-bullet!
-   !begin-bullet!
    Fixed #106: ensure that previous bg class on valueBox is cleared.

    !end-bullet!

!end-bullets-10!

# flexdashboard 0.3.0

(tagged @ commit #2b6eb71)

!begin-bullets-11!

-   !begin-bullet!
    Support `.hidden` attribute for pages to hide them from the navbar.

    !end-bullet!
-   !begin-bullet!
    Scroll sidebar when content overflows vertically.

    !end-bullet!
-   !begin-bullet!
    Correct handling for storyboard notes in mobile layout.

    !end-bullet!
-   !begin-bullet!
    Handle titles with extended characters (auto-assign id if pandoc
    doesn't).

    !end-bullet!
-   !begin-bullet!
    Handle page titles with punctuation (sanitize id for bootstrap
    tabs).

    !end-bullet!
-   !begin-bullet!
    Use `pre_knit` hook to get access to the source file path.

    !end-bullet!
-   !begin-bullet!
    Restore original DT options after rendering.

    !end-bullet!

!end-bullets-11!

# flexdashboard 0.2.0

(tagged @ commit #64d975f)

!begin-bullets-12!

-   !begin-bullet!
    Initial release to CRAN.
    !end-bullet!

!end-bullets-12!

# flexdashboard 0.1.0

(tagged @ commit #990d10c)

!begin-bullets-13!

-   !begin-bullet!
    init commit!
    !end-bullet!

!end-bullets-13!

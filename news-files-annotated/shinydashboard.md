# shinydashboard (development version)

# shinydashboard 0.7.3

### Bug fixes

!begin-bullets-1!

-   !begin-bullet!
    Fixed #397: `updateTabItems()` is now a run-time alias of
    `shiny::updateTabsetPanel()`. (#398)
    !end-bullet!

!end-bullets-1!

# shinydashboard 0.7.2

### Bug fixes

!begin-bullets-2!

-   !begin-bullet!
    Fixed #369: `renderMenu()` did not work correctly when
    shinydashboard was built against shiny 1.6.0 (and older) but used
    with shiny 1.7.0 (and higher). (#370)
    !end-bullet!

!end-bullets-2!

# shinydashboard 0.7.1

## Full changelog

### New features

!begin-bullets-3!

-   !begin-bullet!
    Shiny async support: render functions can now handle promises.
    Instead of returning a `valueBox` to `renderValueBox`, return a
    promise that resolves to a `valueBox` (for example).
    !end-bullet!

!end-bullets-3!

### Bug fixes

!begin-bullets-4!

-   !begin-bullet!
    Fixed #297: recent versions of Shiny caused the sidebar toggle icon
    to not render because FontAwesome was upgraded in Shiny. (#299)
    !end-bullet!

!end-bullets-4!

# shinydashboard 0.7.0

## Full changelog

### New features

!begin-bullets-5!

-   !begin-bullet!
    Changed license from GPL-2 to GPL\>=2 (meaning GPL version 2 or
    later). (#258)
    !end-bullet!

!end-bullets-5!

### Bug fixes

!begin-bullets-6!

-   !begin-bullet!
    Fixed shinytest/#167: shinydashboard did not work properly with
    shinytest.
    (#256\](https://github.com/rstudio/shinydashboard/pull/256))

    !end-bullet!
-   !begin-bullet!
    Fixed #257: Calling the `setValue()` method on
    `sidebarmenuExpandedInputBinding` did not cause the submenu to
    expand. This caused screenshots from shinytest to be incorrect.

    !end-bullet!
-   !begin-bullet!
    Fixed #235: make sure that the text input field and search button
    line up when using `sidebarSearchForm`. (#243)

    !end-bullet!
-   !begin-bullet!
    Fixed #229: only run `ensureActivatedTab()` after `renderMenu()` is
    called **if** the `el` in question has class `"sidebar-menu"`. Since
    this function is used for both `dropdownMenuOutput` and
    `sidebarMenuOutput`, we have to make sure that
    `ensureActivatedTab()` is only called if it's the latter case
    (otherwise, you get unexpected tab redirections when updating a
    dropdown menu). (#233)

    !end-bullet!

!end-bullets-6!

# shinydashboard 0.6.1

This is a hotfix release of shinydashboard, meant to fix a few edge
cases that have surfaced since the last release.

## Full changelog

!begin-bullets-7!

-   !begin-bullet!
    Fixed #214: make sure that the `data-value` attribute of
    `.sidebarMenuSelectedTabItem` is always set in the body of the
    `ensureActivatedTab()` function. (#216)

    !end-bullet!
-   !begin-bullet!
    Fixed #217: correct `input$sidebarCollapsed` value for edge cases by
    attaching the change event to the end of the sidebar CSS transitions
    (instead of when the toggle button is clicked). Also make sure that
    `input$sidebarCollapsed` is set to `FALSE` when the app starts up
    with the sidebar already collapsed. (#222)

    !end-bullet!

!end-bullets-7!

# shinydashboard 0.6.0

This release of shinydashboard was aimed at both fixing bugs and also
bringing the package up to speed with users' requests and Shiny itself
(especially fully bringing bookmarkable state to shinydashboard's
sidebar). In addition to the changes listed below, we also added a new
"Behavior" section to the shinydashboard website to explain this
release's two biggest new features.

## Full changelog

### New features

!begin-bullets-8!

-   !begin-bullet!
    Address #179 support for bookmarking the expanded/collapsed state of
    the whole sidebar. (commit e71c93f)

    !end-bullet!
-   !begin-bullet!
    Added Shiny input to keep track of which sidebar `menuItem` is
    expanded (if any), which makes bookmarking the exact state of the
    sidebar trivial. (commit 6901b90)

    !end-bullet!

!end-bullets-8!

### Minor new features and improvements

!begin-bullets-9!

-   !begin-bullet!
    Addressed #165: added a new optional argument, called `headerText`
    to the `dropdownMenu()` function. If provided by the user, this text
    (instead of the default) will be shown on the header of the menu
    (only visible when the menu is expanded). See `?dropdownMenu` for
    more details. #207

    !end-bullet!
-   !begin-bullet!
    Split JS files. (commit ea91503). More updates to Gruntfile and
    structure. (commit 4e80616)

    !end-bullet!
-   !begin-bullet!
    Better shown/hidden mechanic for Shiny inputs inside collapsible
    `menuItem`s. (commit 6901b90)

    !end-bullet!
-   !begin-bullet!
    Added hack on adminLTE/app.js in order to make the
    `slideUp`/`slideDown` css transitions look reasonable when its
    content is initially empty (use case is for hidden Shiny outputs
    that are not rendered until the first time the `menuItem` is
    expanded and reveal them -- i.e. first time that `trigger("shown")`
    is called). (commit 25725a6)

    !end-bullet!
-   !begin-bullet!
    Added manual tests for bookmarking and the shown/hidden events that
    happen on the sidebar. (commit 9e3e55d)

    !end-bullet!

!end-bullets-9!

### Bug fixes

!begin-bullets-10!

-   !begin-bullet!
    Fixed #71 and #87: detect and enforce selected tab for dynamic
    sidebar menus by calling `ensureActivatedTab()` for these. (commit
    9b88a79)

    !end-bullet!
-   !begin-bullet!
    Fixed #127 and #177: previously, if `dashboardSidebar()` was called
    with an explicit `width` parameter, mobile rendering would look
    weird (the sidebar wouldn't completely disappear when it was
    collapsed, and content in the dashboard body would be hidden under
    the still-visible sidebar). (#204)

    !end-bullet!
-   !begin-bullet!
    Fixed #79: Re-enable slight css transition when the sidebar is
    expanded/collapsed. (#205).

    !end-bullet!
-   !begin-bullet!
    Fixed #89: We claimed that `dashboardPage()` would try to extract
    the page's title from `dashboardHeader()` (if the title is not
    provided directly to `dashboardPage()`); however, we were selecting
    the wrong child of the header tag object (#203)

    !end-bullet!
-   !begin-bullet!
    Fixed #129: Trigger shown/hidden event for Shiny outputs in the
    sidebar. (#194)

    !end-bullet!
-   !begin-bullet!
    Fixed #73: add `collapsed` argument to `dashboardSidebar()`, which
    allows it to start off collapsed. (#186)

    !end-bullet!
-   !begin-bullet!
    Fixed #62: make images resize when the sidebar collapses/expands.
    #185

    !end-bullet!
-   !begin-bullet!
    Fixed #176 (making buttons look good on the sidebar) by giving Shiny
    action buttons and links some margin space. (#182)

    !end-bullet!

!end-bullets-10!

### Library updates

!begin-bullets-11!

-   !begin-bullet!
    Update documentation to newest version of roxygen. (commit #541d3c1)

    !end-bullet!
-   !begin-bullet!
    Addressed #178: switch from `npm` to `yarn`. Also upgraded all yarn
    packages to the `latest` tag (all major changes). #184

    !end-bullet!
-   !begin-bullet!
    Updated to AdminLTE 2.3.11. (#181)

    !end-bullet!

!end-bullets-11!

# shinydashboard 0.5.3

!begin-bullets-12!

-   !begin-bullet!
    Fixed (#160: Using a dynamically-created `sidebarMenu` without an
    `id` argument would cause the app to not start, when used with Shiny
    0.14.
    !end-bullet!

!end-bullets-12!

# shinydashboard 0.5.2

!begin-bullets-13!

-   !begin-bullet!
    Added ability to bookmark and restore tabs, when used with Shiny
    0.14 and above. (#152, #157)

    !end-bullet!
-   !begin-bullet!
    Fixed issue with R CMD check and Shiny version 0.14.

    !end-bullet!
-   !begin-bullet!
    Updated to AdminLTE 2.3.2 (1ee281b).

    !end-bullet!

!end-bullets-13!

# shinydashboard 0.5.1

!begin-bullets-14!

-   !begin-bullet!
    Logout panels from Shiny Server Pro were previously not visible, but
    now they are.

    !end-bullet!
-   !begin-bullet!
    If a `sidebarUserPanel` doesn't have an image, space for the image
    is no longer allocated.

    !end-bullet!
-   !begin-bullet!
    `tabNames` are now validated so that illegal characters result in an
    error early. (#66)

    !end-bullet!
-   !begin-bullet!
    `sidebarUserPanel` now displays properly. (#70)

    !end-bullet!
-   !begin-bullet!
    `radioButtons` did not wrap, but now they do. (#60)

    !end-bullet!

!end-bullets-14!

# shinydashboard 0.5.0

!begin-bullets-15!

-   !begin-bullet!
    Updated to AdminLTE 2.1.2 (406de4e). Please note that some CSS
    selectors have changed, so if you are using custom CSS, it may
    require modification. The documentation at
    http://rstudio.github.io/shinydashboard/appearance.html has some
    updated examples.

    !end-bullet!
-   !begin-bullet!
    shinydashboard now respects the `shiny.minified` option.

    !end-bullet!
-   !begin-bullet!
    Collapse buttons on boxes trigger `shown` and `hidden` events.
    Previously they did not, which resulted in dynamic content not
    working for boxes that started collapsed. (#17, #42)

    !end-bullet!
-   !begin-bullet!
    Dynamic menuSubItems now work in the sidebar. (#54)

    !end-bullet!
-   !begin-bullet!
    Arbitrary content may now be used in a `sidebarMenu()`, not just
    `menuItem`s. (#44)

    !end-bullet!
-   !begin-bullet!
    Added options to set the width of `dashboardHeader()` and
    `dashboardSidebar()`. (#43, #45, #54)

    !end-bullet!

!end-bullets-15!

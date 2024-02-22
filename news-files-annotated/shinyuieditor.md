# Development version

### Minor new features and improvements

!begin-bullets-1!

-   !begin-bullet!
    Tour works again in website live-demo mode
    !end-bullet!

!end-bullets-1!

### Bug fixes

!begin-bullets-2!

-   !begin-bullet!
    Deleting the element in the value slot of a Value Box no longer
    causes a crash. (#241)
    !end-bullet!
-   !begin-bullet!
    Switching between two elements of the same input or output type no
    longer causes the ID field to take the value of the *previous*
    element. (#245)
    !end-bullet!

!end-bullets-2!

# 0.5.1

### Major changes

!begin-bullets-3!

-   !begin-bullet!
    Deleting an output with a bound render function in the server will
    now ask if you want to delete the render function as well. (#213)
    !end-bullet!
-   !begin-bullet!
    Updating the id of an input or output will now update the
    corresponding id in the server code. (#212)
    !end-bullet!
-   !begin-bullet!
    Removed support for multi-file apps. This was a major source of bugs
    and complexity and was not used by many people.
    !end-bullet!
-   !begin-bullet!
    New website based on Astro framework replaces the old one based on
    `pkgdown`. (#201)
    !end-bullet!

!end-bullets-3!

### Minor changes

!begin-bullets-4!

-   !begin-bullet!
    Replaced `shiny::tabPanel` with `bslib::nav_panel()` to keep up with
    modern shiny app components. `tabPanel`s will be auto upgraded when
    using editor. (#215)
    !end-bullet!

!end-bullets-4!

# shinyuieditor 0.5.0

### Major new features and improvements

!begin-bullets-5!

-   !begin-bullet!
    Switched underlying parsing to use TreeSitter instead of the
    built-in R parser. This simplifies codebase and also makes whole app
    faster.
    !end-bullet!

!end-bullets-5!

### Minor new features and improvements

!begin-bullets-6!

-   !begin-bullet!
    CSS unit inputs now respect valid ranges for their corresponding
    units. E.g. can't go bigger than 100% or smaller than 0px.
    (26324946e132f38dd4183543c51e44392649fab7 and
    a3f385a75cb868b245a0762cd6fa04f5942177c3)
    !end-bullet!
-   !begin-bullet!
    You can now pass a direct path to an app in `launch_editor()`.
    (c931639284ed2420afe3ddc21fbb0261a289f8f4)
    !end-bullet!

!end-bullets-6!

### Bug fixes

!begin-bullets-7!

-   !begin-bullet!
    No longer crashes when special characters (e.g. `\` or `"`) are put
    into string inputs (2e241278750b6af816e44bb51750646a6f5de393)
    !end-bullet!
-   !begin-bullet!
    Fixed bug where refreshing the page when using the editor via the
    `launch_editor()` function (as opposed to the vscode extension)
    could cause app file to be erased. (6aa03f4)
    !end-bullet!
-   !begin-bullet!
    Fixed visual bug where headers and footers of bslib cards would show
    up even when nothing was in them in the vscode extension. (7d253de)
    !end-bullet!
-   !begin-bullet!
    Fixed bug where non-bsicon versions of value boxes would be
    converted to `bsicons::bs_icon("undefined")`. (aefb778)
    !end-bullet!

!end-bullets-7!

# shinyuieditor 0.4.3

### Major new features and improvements

!begin-bullets-8!

-   !begin-bullet!
    Value Boxes from `bslib` are now available to use
    !end-bullet!

!end-bullets-8!

### Minor new features and improvements

!begin-bullets-9!

-   !begin-bullet!
    Ability to hook into pre/post processing of a node when going from
    raw ast to ui node and from ui node to R code. This enables the
    ability to abstract away things like function calls for arguments
    into things like enums or strings and then convert them back to
    function calls when generating R code.
    !end-bullet!
-   !begin-bullet!
    Updated underlying data structures to allow for more flexible
    navigation of the editors internal data structures. This will allow
    for more advanced features in the future where ui nodes can be added
    not only as children but as named arguments.
    !end-bullet!

!end-bullets-9!

### Bug fixes

# shinyuieditor 0.4.2

### Major new features and improvements

### Minor new features and improvements

!begin-bullets-10!

-   !begin-bullet!
    Failures in reading/ parsing the app files are now caught and
    communicated to the user in the main UI in addition to the R
    console/ VSCode output pane. This means most crashes caused by
    malformed apps can be recovered from by fixing the formatting
    without needing to restart editor. Issue #56
    !end-bullet!
-   !begin-bullet!
    Failures in the front-end of the editor are now isolated to their
    location and include options for remedying along with submitting bug
    reports to github. #155
    !end-bullet!

!end-bullets-10!

### Bug fixes

!begin-bullets-11!

-   !begin-bullet!
    Fixed problem introduced in 0.4.1 where elements dropped onto a grid
    layout would not be properly wrapped in a grid card if neccessary.
    !end-bullet!
-   !begin-bullet!
    Fixed bug where reactive values (or any user-declared functions)
    were called in code. #148
    !end-bullet!
-   !begin-bullet!
    Fixed problem where hard-resetting the app preview server didn't
    work when running in HTTPUV mode.
    !end-bullet!

!end-bullets-11!

# shinyuieditor 0.4.1

### Major new features and improvements

!begin-bullets-12!

-   !begin-bullet!
    New more flexible `bslib::card()` based cards are now available
    along with the old grid cards being updated to reflect the new the
    `gridlayout` wrapper `gridlayout::grid_card()`.
    !end-bullet!
-   !begin-bullet!
    You can now add plain text anywhere you could add normal elements.
    The new "Static Text" node let's you enter descriptions etc... The
    contents can also have basic styles applied such as sizing and
    decoration.
    !end-bullet!

!end-bullets-12!

### Minor new features and improvements

!begin-bullets-13!

-   !begin-bullet!
    Cards now have a simple header by default
    !end-bullet!

!end-bullets-13!

### Bug fixes

!begin-bullets-14!

-   !begin-bullet!
    In vscode, if ui changes are made to the app the selection of output
    definitions and addition of new output definitions no longer breaks.
    !end-bullet!
-   !begin-bullet!
    Fixed problem where making lots of quick updates to the state would
    cause the app to crash due to backend and client getting out of
    sync.
    !end-bullet!
-   !begin-bullet!
    Content of cards can no longer spill over obscuring other elements
    like grid tract resizers.
    !end-bullet!
-   !begin-bullet!
    The visual indicator for swapping positions of items on the grid no
    longer flickers and actually is legible.
    !end-bullet!
-   !begin-bullet!
    The width argument of shiny text input elements is now reflected in
    the main editor view.
    !end-bullet!
-   !begin-bullet!
    plot outputs no longer have a fixed width of `200px` when their
    `width` argument is unset, instead filling width of container as
    they do in running app.
    !end-bullet!
-   !begin-bullet!
    Code/ functions that the editor doesn't know how to deal with
    (e.g. custom functions or non-implemented ui elements) no longer
    crash app to blank screen.
    !end-bullet!

!end-bullets-14!

# shinyuieditor 0.4.0

### Major new features and improvements

!begin-bullets-15!

-   !begin-bullet!
    VSCode extension can now highlight output definitions and input uses
    in the server code.
    !end-bullet!
-   !begin-bullet!
    In embedded mode (on the main website) the ui editor now provides
    full code to reproduce the current app.
    !end-bullet!

!end-bullets-15!

### Minor new features and improvements

### Bug fixes

# shinyuieditor 0.3.3

### Major new features and improvements

!begin-bullets-16!

-   !begin-bullet!
    There's now a VSCode extension for running the ui editor. It adds a
    button for jumping from an app script directly into the UI editor
    and opening app code alongside editor.
    !end-bullet!

!end-bullets-16!

### Minor new features and improvements

!begin-bullets-17!

-   !begin-bullet!
    Elements can now be deleted and changes undone and redone using the
    keyboard (#131, #135)
    !end-bullet!

!end-bullets-17!

### Bug fixes

!begin-bullets-18!

-   !begin-bullet!
    Fix bug where deleting the only item in a container then deleting
    that container could crash app (#a27d440)
    !end-bullet!

!end-bullets-18!

# shinyuieditor 0.3.2

### Major new features and improvements

!begin-bullets-19!

-   !begin-bullet!
    When starting the ui editor on an empty app path a visual interface
    is provided for choosing between templates. These templates can be
    navigated into and back using undo/redo buttons to allow for
    "shopping around" for the best template. (#114, #115)
    !end-bullet!

!end-bullets-19!

### Minor new features and improvements

!begin-bullets-20!

-   !begin-bullet!
    Switching from absolute to relative units in the grid tracts now
    results in the tract remaining (almost) the same size instead of
    jumping to a much bigger or much smaller size due to differences in
    magnitude of units. (#110)
    !end-bullet!
-   !begin-bullet!
    Improved quality/polish of included template apps.
    !end-bullet!
-   !begin-bullet!
    Radio inputs, sliders, DT tables, and ui outputs now default to a
    100% width instead of an unset one.
    !end-bullet!

!end-bullets-20!

### Bug fixes

!begin-bullets-21!

-   !begin-bullet!
    Dragging to resize a grid tract with focus still inside of a popup
    tract info widget now hides the widget so the drag-to-resize info
    popup is not obscured. (#110)
    !end-bullet!
-   !begin-bullet!
    Starting the editor on an app with a single column or row gridlayout
    element no longer crashes the app.
    !end-bullet!
-   !begin-bullet!
    On case-sensitive file-path operating systems like linux, the editor
    will now be able to see apps weather using the lowercase `.r` or
    uppercase `.R` extensions. (`ff46cdd`)
    !end-bullet!
-   !begin-bullet!
    Typing in numeric inputs no longer forces you to prefix numbers with
    0 if you delete back to nothing to type a new number. (#118)
    !end-bullet!
-   !begin-bullet!
    Content in really small grid cards no longer overflows.
    !end-bullet!

!end-bullets-21!

# shinyuieditor 0.3.1

### Minor new features and improvements

!begin-bullets-22!

-   !begin-bullet!
    Addition of ui node for adding `DT` tables to app with
    `DT::DTOutput()`.
    !end-bullet!
-   !begin-bullet!
    Addition of ui node for `plotly` plots with
    `plotly::plotlyOutput()`.
    !end-bullet!

!end-bullets-22!

# shinyuieditor 0.3.0

### Major new features and improvements

!begin-bullets-23!

-   !begin-bullet!
    Arguments passed to a known ui function that are not known about are
    now shown and able to be deleted in the properties pane instead of
    silently being passed through.
    !end-bullet!
-   !begin-bullet!
    Arguments that are of incorrect or unknown types for a ui function
    are now displayed as such with the opportunity to revert to a valid
    value.
    !end-bullet!

!end-bullets-23!

### Minor new features and improvements

!begin-bullets-24!

-   !begin-bullet!
    (Developer) Adding a new ui node now only requires meta-data and a
    component for the "App View" as the properties panel is
    automatically constructed
    !begin-bullets-25!
    -   !begin-bullet!
        Overriding for custom properties panel layouts etc is possible
        using the `settingsFormRender` property for the ui node
        definition.
        !end-bullet!

    !end-bullets-25!
    !end-bullet!

!end-bullets-24!

### Bug fixes

!begin-bullets-26!

-   !begin-bullet!
    Numeric inputs now have incrementer buttons in firefox (#60)
    !end-bullet!

!end-bullets-26!

### Known bugs

# shinyuieditor 0.2.0

### Major new features and improvements

!begin-bullets-27!

-   !begin-bullet!
    New option for base page layout: `shiny::navbarPage()` (#76)
    !end-bullet!
-   !begin-bullet!
    Support for `shiny::tabsetPanel()`, `shiny::tabPanel()`, and
    `gridlayout::grid_container()`
    !end-bullet!

!end-bullets-27!

### Minor new features and improvements

!begin-bullets-28!

-   !begin-bullet!
    Updated styles for drop-targets. Now use pulsing background color
    instead of outlines to indicate possible drop targets.
    !end-bullet!
-   !begin-bullet!
    Improved accessability for settings panel inputs with properly
    scoped labels and aria descriptions
    !end-bullet!
-   !begin-bullet!
    Popups on hover over the elements panel now provide some context for
    the functionality of the element. (#74)
    !end-bullet!
-   !begin-bullet!
    Update to React v18 for improved performance
    !end-bullet!

!end-bullets-28!

### Bug fixes

!begin-bullets-29!

-   !begin-bullet!
    Fixes bug where ui editor would not work on hosted services like
    RStudio Workbench. Thanks @mdancho84! (#73, #90)
    !end-bullet!
-   !begin-bullet!
    Nodes can now be dragged to to the child position to the left of any
    of their ancestor nodes.
    !end-bullet!
-   !begin-bullet!
    Selection now properly follows node after move.
    !end-bullet!
-   !begin-bullet!
    Generated layout tables for gridlayout are now column aligned.
    !end-bullet!

!end-bullets-29!

### Known bugs

# shinyuieditor 0.1.0

### Major new features and improvements

!begin-bullets-30!

-   !begin-bullet!
    Edits can now be made in either ui editor *or* the in the code and
    the updates are now automatically synced
    (`fca63396948905055d6f42d05f87993bc3620c65`)
    !end-bullet!
-   !begin-bullet!
    New single-file starter templates (geyser and chick weights)
    !end-bullet!
-   !begin-bullet!
    The main container for placing items on grid is now
    `gridlayout::grid_card()`
    !end-bullet!

!end-bullets-30!

### Minor new features and improvements

!begin-bullets-31!

-   !begin-bullet!
    Tract resizing is now much quicker and has less visual noise due to
    only showing small size-popups
    (`5e767eef9e62170f758d1aab87ba22464008cd7b`)
    !end-bullet!
-   !begin-bullet!
    Website updated with a bunch of new articles
    !end-bullet!
-   !begin-bullet!
    Added some explanatory text about the format of grid-names to the
    popup for naming newly added grid items
    (`ca625edb3c65c5a0da4ebebb5b9d04013c4e84e5`)
    !end-bullet!
-   !begin-bullet!
    The app preview window now no-longer shoes up at all if there's no
    preview connection. (`ae5d8113bd687bd7f7c2d540347bf3289bb57f49`)
    !end-bullet!

!end-bullets-31!

### Bug fixes

!begin-bullets-32!

-   !begin-bullet!
    Theme argument is now supported in `gridlayout::grid_page()` (#51)
    !end-bullet!
-   !begin-bullet!
    Numeric inputs are now *usable* in firefox (See "Known bugs" for
    more detail.)
    !end-bullet!

!end-bullets-32!

### Known bugs

!begin-bullets-33!

-   !begin-bullet!
    Firefox inputs don't have increment buttons (#60)
    !end-bullet!
-   !begin-bullet!
    Arguments that a component knows about but are supplied a non-known
    argument type will simply get wiped away (#58)
    !end-bullet!
-   !begin-bullet!
    Can fail installing on windows using `pak` (#53)
    !end-bullet!

!end-bullets-33!

# shinyuieditor 0.0.1.0

### Major new features and improvements

!begin-bullets-34!

-   !begin-bullet!
    Single-file apps are now supported (#41, #42)
    !end-bullet!
-   !begin-bullet!
    Rehauled the interface for updating the layout for
    `gridlayout::grid_page()`. Tracts can now be resized by dragging the
    divisions and the resizing controls hide when not in use to allow
    for more efficient use of space.
    !end-bullet!
-   !begin-bullet!
    Any code outside of the ui declaration is now preserved, along with
    `library()` calls (#38, #42)
    !end-bullet!
-   !begin-bullet!
    By default, namespaces are omitted from generated code in favor of
    placing `library()` calls at the top of the file (#42)
    !end-bullet!

!end-bullets-34!

### Minor new features and improvements

!begin-bullets-35!

-   !begin-bullet!
    Refreshing the app preview now has animation to let the user know
    something actually happened (#34, #44)
    !end-bullet!
-   !begin-bullet!
    Arguments to functions that are not simple primative types are now
    preserved (#29, #37)
    !end-bullet!
-   !begin-bullet!
    If the browser window containing the editor is closed, the ui server
    now terminates, freeing the terminal (#27, #43)
    !end-bullet!

!end-bullets-35!

### Bug fixes

!begin-bullets-36!

-   !begin-bullet!
    Leaving early from the editor no longer returns `NULL` to the
    console (#36, #45)
    !end-bullet!
-   !begin-bullet!
    Resizing grid panels to a smaller size now respects the grid tracts
    (#25, #46)
    !end-bullet!
-   !begin-bullet!
    Fixed accidental allowance of `gridlayout::grid_panel_plot()` being
    dropped into a `gridlayout::grid_panel_stack()` which could cause an
    invalid ui function state (#35, #49).
    !end-bullet!

!end-bullets-36!

# shinyuieditor 0.0.0.9000

!begin-bullets-37!

-   !begin-bullet!
    Editor now works with Safari (#33)
    !end-bullet!

!end-bullets-37!

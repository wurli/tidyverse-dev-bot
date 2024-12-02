# CHANGES IN DT VERSION 0.34

!begin-bullets-1!

-   !begin-bullet!
    Added `lazyRender` parameter to `DT::datatable()`, which gives the
    option for the table to be rendered immediately rather than waiting
    for it to become visible (thanks, @Mosk915, #1156).

    !end-bullet!
-   !begin-bullet!
    Moved **httpuv** from `Imports` to `Suggests` in `DESCRIPTION`
    (thanks, @MichaelChirico, #1159).

    !end-bullet!

!end-bullets-1!

# CHANGES IN DT VERSION 0.33

!begin-bullets-2!

-   !begin-bullet!
    Added `outputArgs` parameter to `renderDataTable`, to allow width
    and height to be set when using interactive R Markdown documents.

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in `renderDT()`'s evaluation of `...` arguments when
    `quoted = TRUE` (#1130).

    !end-bullet!
-   !begin-bullet!
    Maintain selected columns/rows/cells upon re-render (thanks,
    @epruesse, #1125).

    !end-bullet!

!end-bullets-2!

# CHANGES IN DT VERSION 0.32

!begin-bullets-3!

-   !begin-bullet!
    Fixed a bug that caused the column used for grouping with the
    RowGroup extension to change when relocated by the ColReorder
    extension (thanks, @isthisthat, @mikmart, #1109).

    !end-bullet!
-   !begin-bullet!
    Fixed the bug that `replaceData()` failed to work with data that has
    no column names (thanks, @mmuurr, #1108).

    !end-bullet!
-   !begin-bullet!
    `updateSearch()` now sets the slider values based on the new search
    string for numeric columns (thanks, @mikmart, #1110).

    !end-bullet!
-   !begin-bullet!
    The `searchCols` option now sets the slider values for numeric
    columns when `server = TRUE` (thanks, @alexvpickering, @mikmart,
    #998).

    !end-bullet!
-   !begin-bullet!
    Added server-side processing support for the SearchBuilder extension
    (thanks, @AhmedKhaled945, @shrektan, @mikmart, #963).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that caused the date picker widget from the DateTime
    extension to render incorrectly (thanks, @mikmart, #1116).

    !end-bullet!
-   !begin-bullet!
    Column formatting now also applies to range labels shown on filter
    sliders (thanks, @GitChub, @mikmart, #247).

    !end-bullet!
-   !begin-bullet!
    Added support for passing custom configuration for initializing
    filter widgets in JavaScript. Use the `filter` parameter to
    `datatable()` in the form
    `filter = list(settings = list(select = ..., slider = ...))`
    (thanks, @yogat3ch, @DavidBlairs, @mikmart, #1072, #1083).

    !end-bullet!

!end-bullets-3!

# CHANGES IN DT VERSION 0.31

!begin-bullets-4!

-   !begin-bullet!
    Upgraded DataTables version to 1.13.6 (thanks, @stla, #1091).

    !end-bullet!
-   !begin-bullet!
    Searching and sorting work now when columns are re-ordered by the
    `ColReorder` extension (thanks, @ashbaldry #1096, @gergness #534,
    @nmoraesmunter #921, @isthisthat #1069).

    !end-bullet!
-   !begin-bullet!
    Fixed disabling selection on hyperlink clicks (thanks, @guoci,
    #1093).

    !end-bullet!
-   !begin-bullet!
    Fixed an error for R \>= 4.3.0 (thanks, @AntoineMichelet, #1095).

    !end-bullet!

!end-bullets-4!

# CHANGES IN DT VERSION 0.30

!begin-bullets-5!

-   !begin-bullet!
    Fixed a bug that when using `updateSearch()`, the clear button
    inside the input box doesn't show up, and the table doesn't update
    when the input is cleared (thanks, @DavidBlairs, #1082).

    !end-bullet!
-   !begin-bullet!
    Added support for a list of Booleans as input to the `class`
    argument of `DT::datatable()` when `style = 'bootstrap'` (thanks,
    @pedropark99, #1089). In other words, you can now select the
    Bootstrap classes you want to use at `DT::datatable()` by using a
    list of Booleans that select the classes you want to use. In the
    example below, we are producing an HTML table that uses the `stripe`
    and `hover` Bootstrap classes:

    !begin-codeblock!
    ``` r
    DT::datatable(mtcars, class = list(stripe = TRUE, compact = FALSE, hover = TRUE), style = "bootstrap")
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Handle `NULL` return from `bslib::theme_version()` (thanks,
    @slodge-work, #1090).

    !end-bullet!

!end-bullets-5!

# CHANGES IN DT VERSION 0.29

!begin-bullets-6!

-   !begin-bullet!
    Support Bootstrap 5 with `datatable(style = "auto")` (thanks,
    @gadenbuie, #1074).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that searching would fail when the keyword contains
    special characters such as `&` (thanks, @dfriend21 @olivier7121,
    #1075).

    !end-bullet!
-   !begin-bullet!
    Deleted `()` after `eval` in a JS *comment* to prevent Google from
    treating it as malware, which is just a false alarm (thanks,
    @gorkang, #1080).

    !end-bullet!

!end-bullets-6!

# CHANGES IN DT VERSION 0.28

!begin-bullets-7!

-   !begin-bullet!
    Upgraded DataTables to v1.13.4 (thanks, @stla, #1063).

    !end-bullet!
-   !begin-bullet!
    It is now possible to edit date columns with the help of calendar
    inputs (thanks, @stla, #1064).

    !end-bullet!

!end-bullets-7!

# CHANGES IN DT VERSION 0.27

!begin-bullets-8!

-   !begin-bullet!
    `dataTableOutput()` gains a new `fill` parameter. When `TRUE` (the
    default), the widget's container element is allowed to grow/shrink
    to fit it's parent container so long as that parent is opinionated
    about its height and has been marked with
    `htmltools::bindFillRole(x, container = TRUE)`. (#2198)

    !begin-bullets-9!
    -   !begin-bullet!
        The primary motivation for this is to allow DT to grow/shrink
        inside `bslib::card_body_fill()`. When doing so, you'll also
        want to set `fillContainer = TRUE` in `datatable()`.
        !end-bullet!

    !end-bullets-9!
    !end-bullet!
-   !begin-bullet!
    Bug fixed: when editing a table, it was impossible to switch from an
    empty cell to 0 and vice-versa (thanks, @RozennGZ #1038, @stla
    #1039).

    !end-bullet!
-   !begin-bullet!
    When a `datatable()` is created outside a Shiny app, the `selection`
    argument won't work (thanks, @bartekch, #1043).

    !end-bullet!
-   !begin-bullet!
    `doGloblSearch()` now works correctly when the input data frame is a
    tibble (@mikmart, #1044).

    !end-bullet!

!end-bullets-8!

# CHANGES IN DT VERSION 0.26

!begin-bullets-10!

-   !begin-bullet!
    Upgraded DataTables to v1.12.1.

    !end-bullet!
-   !begin-bullet!
    New extension StateRestore. It allows to save and restore DataTables
    states.

    !end-bullet!
-   !begin-bullet!
    Default to `width: 100%; height: auto` instead of `500px x 960px`
    when statically rendering in browser (thanks, @cpsievert, #1022).

    !end-bullet!

!end-bullets-10!

# CHANGES IN DT VERSION 0.25

!begin-bullets-11!

-   !begin-bullet!
    Server-side filtering is now able to be ran as a `future` via the
    **promises** package (@andyquinterom, #1011). See the argument
    `future` on the help page `?DT::renderDataTable` for more info.

    !end-bullet!
-   !begin-bullet!
    Updated the `jszip` library to v3.10.1 (thanks, @hedsnz, #1017).

    !end-bullet!

!end-bullets-11!

# CHANGES IN DT VERSION 0.24

!begin-bullets-12!

-   !begin-bullet!
    Fixed a bug with missing numeric values rendered as `0` (thanks,
    @tverbeke, #1000).

    !end-bullet!
-   !begin-bullet!
    Box scalar elements of 'list' columns so that, e.g.,
    `data.frame(col = I(integer(), 1, 2:3))` is represented in
    JavaScript as `[[], [1], [2, 3]]` instead of `[[], 1, [2, 3]]`
    (thanks, @mtmorgan, #1005).

    !end-bullet!

!end-bullets-12!

# CHANGES IN DT VERSION 0.23

!begin-bullets-13!

-   !begin-bullet!
    Make sure number inputs return numeric values when editing numeric
    table cells (thanks, @stla, #987).
    !end-bullet!

!end-bullets-13!

# CHANGES IN DT VERSION 0.22

!begin-bullets-14!

-   !begin-bullet!
    Enhancements to `updateFilters()` (#971):

    !begin-bullets-15!
    -   !begin-bullet!
        Added support for data with integer and character columns
        (@mikmart #972).
        !end-bullet!
    -   !begin-bullet!
        Fixed an issue with length 1 options causing filters not to
        update (@mikmart #973).
        !end-bullet!
    -   !begin-bullet!
        Fixed an issue with slider limits sometimes being incorrectly
        scaled (@mikmart #974).
        !end-bullet!
    -   !begin-bullet!
        Updates to factor and logical filters now match the initial
        render (@mikmart #975).
        !end-bullet!
    -   !begin-bullet!
        Disabled status is now also affected by updates (@mikmart #977).
        !end-bullet!

    !end-bullets-15!
    !end-bullet!
-   !begin-bullet!
    New functions `doColumnSearch()` and `doGlobalSearch()` let you do
    server-side searching with filter search strings. These are
    particularly useful in conjunction with `updateFilters()` for
    implementing dynamic limits for filter controls based on currently
    filtered data (@mikmart #982).

    !end-bullet!
-   !begin-bullet!
    Server-side searching is now faster when multiple filters are active
    (@mikmart).

    !end-bullet!
-   !begin-bullet!
    Fix a bug that the column filter didn't work for strings like "+"
    (@stephan-hutter @shrektan #980).

    !end-bullet!

!end-bullets-14!

# CHANGES IN DT VERSION 0.21

## NEW FEATURES

!begin-bullets-16!

-   !begin-bullet!
    Add the `zero.print` argument to `formatPercentage()`,
    `formatCurrency()`, `formatSignif()` and `formatRound()`, which
    allows to control the format of zero values. It's useful when the
    data is "sparse" (thanks, @shrektan #953).

    !end-bullet!
-   !begin-bullet!
    `formatXXX()` functions now gain a new argument `rows` (starting
    from 1), which can be used to specify the rows that the "style"
    should be applied to. Note that it only works expected in the
    client-side processing mode, i.e., `server = FALSE`. `formatStyle()`
    is the only exception that doesn't have this argument and should use
    `styleRow()` instead (thanks, @jrecasens @shrektan #520).

    !end-bullet!
-   !begin-bullet!
    Added a new function `updateFilters` to allow users to update the
    filters of a DataTable object that has been updated by reference,
    such as with `replaceData()` (thanks, @giadasp #934, @wholmes105
    #939).

    !end-bullet!

!end-bullets-16!

## MAJOR CHANGES

!begin-bullets-17!

-   !begin-bullet!
    Now users can provide column names of the data to
    `options$columnDefs$targets`. Previously, it only supports column
    indexes or "\_all" (thanks, @shrektan #948).
    !end-bullet!

!end-bullets-17!

## MINOR CHANGES

!begin-bullets-18!

-   !begin-bullet!
    `styleRow()` and `styleEqual()` now allows a scalar `values`
    argument like other R functions, e.g., `styleRow(1:5, 'abcd')` is
    the same as `styleRow(1:5, rep('abcd', 5))`. It throws error that
    `the length(rows) must be equal to length(values)` in the previous
    version (thanks, @shrektan #955).
    !end-bullet!

!end-bullets-18!

## BUG FIXES

!begin-bullets-19!

-   !begin-bullet!
    Fix the bug that `addRow()` doesn't support a list of `data` after R
    3.4.0, where `structure(NULL, ...)` was deprecated (thanks, @stla
    @shrektan #959).

    !end-bullet!
-   !begin-bullet!
    Fix the bug that DT table can't vertically fill the container, e.g.,
    RStudio IDE or FlexDashboard (thanks, @mbojan @shrektan #951).

    !end-bullet!
-   !begin-bullet!
    Fix the bug that DT failed to parse ajax request correctly, when
    special strings like "=" exist (thanks, @shrektan #965).

    !end-bullet!

!end-bullets-19!

# CHANGES IN DT VERSION 0.20

## MAJOR CHANGES

!begin-bullets-20!

-   !begin-bullet!
    Upgraded the DataTables library to v1.11.3 (thanks, @shrektan #942,
    @michaelquinn32 #940).
    !end-bullet!

!end-bullets-20!

# CHANGES IN DT VERSION 0.19

## NEW FEATUERS

!begin-bullets-21!

-   !begin-bullet!
    Add `vertical` and `opacity` option to `filter` which applies to the
    noUiSliders. This is useful with limited width DataTables to prevent
    x overflow (thanks, @alexvpickering, #919).

    !end-bullet!
-   !begin-bullet!
    Now the user is able to restrict the editing to accept only numbers
    by, e.g.,
    `datatable(..., editable = list(target = "cell", numeric = 3:5))`.
    By default, the editing is restricted to numbers for all numeric
    columns; set `numeric = "none"` to disable this behavior (thanks,
    @stla, #860 #824).

    !end-bullet!
-   !begin-bullet!
    Now the user can request text areas for the editing by, e.g.,
    `datatable(..., editable = list(target = "cell", area = 1:2))`. Text
    areas are useful for cells with large contents (thanks, @stla #860,
    @fabiangehring #671).

    !end-bullet!

!end-bullets-21!

## MAJOR CHANGES

!begin-bullets-22!

-   !begin-bullet!
    Upgraded jQuery from v1.12.4 to v3.x imported from the **jquerylib**
    R package.
    !end-bullet!

!end-bullets-22!

# CHANGES IN DT VERSION 0.18

## NEW FEATURES

!begin-bullets-23!

-   !begin-bullet!
    `datatable()`'s `style` argument now defaults to `'auto'`, which
    resolves to either `'bootstrap'` or `'bootstrap4'` when a `{bslib}`
    theme is relevant. If a `{bslib}` theme isn't relevant, `'auto'`
    resolves to the old default value of `'default'` (thanks,
    @cpsievert, #852).

    !end-bullet!
-   !begin-bullet!
    Add a new function `styleRow()`. It's useful when you want to apply
    CSS styles based on Row Indexes (thanks, @s-fleck, #894).

    !end-bullet!

!end-bullets-23!

## BUG FIXES

!begin-bullets-24!

-   !begin-bullet!
    `datatable(data)` and `datatable(data, fillContainer = TRUE)` now
    work as expected when statically rendered inside
    `flexdashboard::flex_dashboard()` (thanks, @cpsievert, #904).
    !end-bullet!

!end-bullets-24!

# CHANGES IN DT VERSION 0.17

## NEW FEATURES

!begin-bullets-25!

-   !begin-bullet!
    Support the new datatables' extension SearchBuilder. With this new
    extension, users can construct a complex search query by adding
    groups and conditions. Note, as the time of writing, this extension
    only works on the client-side processing mode (thanks, @stla, #875)

    !end-bullet!
-   !begin-bullet!
    Add a new plugin diacritics-neutralise, which can be used for
    searching accented, *non-Latin* characters with their unaccented
    counterparts. Note, it will only work in the client-side processing
    mode (thanks, @tyler-richardett, #887).

    !end-bullet!

!end-bullets-25!

## MINOR CHANGES

!begin-bullets-26!

-   !begin-bullet!
    The `autoHideNavigation` argument now works with the default theme.
    In addition, the prerequisite is properly documented. Specifically
    speaking, it only works when the `pageLength` option is provided and
    is rendered in the client-side processing mode (thanks,
    @bhogan-mitre, #856).

    !end-bullet!
-   !begin-bullet!
    When editing factor columns, `editData()` now automatically updates
    the factor levels if it's necessary (thanks, @aman-malik3010, #865).

    !end-bullet!

!end-bullets-26!

## BUG FIXES

!begin-bullets-27!

-   !begin-bullet!
    Fix the issue that `addRow()` would fail when the proxy DT table
    contains no data (e.g., a zero-row data.frame) (thanks, @chalioui,
    #888).

    !end-bullet!
-   !begin-bullet!
    DT no longer overrides the `options$responsive` to `TRUE`. Thus, it
    enables users to provide customized options for the Responsive
    extension (thanks, @hdrab127, #885).

    !end-bullet!

!end-bullets-27!

# CHANGES IN DT VERSION 0.16

## NEW FEATURES

!begin-bullets-28!

-   !begin-bullet!
    Add a new plugin accent-neutralise, which can be used for searching
    accented characters with their unaccented counterparts. Note, it
    will only work in the client-side processing mode (#822).

    !end-bullet!
-   !begin-bullet!
    `addRow()` now has a new parameter `resetPaging`. By setting it to
    `FALSE`, we can keep the paging position after adding a row (thanks,
    @stanstrup, #853).

    !end-bullet!

!end-bullets-28!

## MINOR CHANGES

!begin-bullets-29!

-   !begin-bullet!
    Upgrade the SearchPanes extension to v1.1.1 so that it can display
    all the entries properly with the Scroller extension (thanks,
    @JonasMandel @stla, #820).

    !end-bullet!
-   !begin-bullet!
    The `class` argument now keeps user-defined classes with bootstrap
    themes (thanks, @mmuurr, #806).

    !end-bullet!
-   !begin-bullet!
    Now DT will throw a clear error message if the value of `search`
    provided in `datatables(..., options=)` is illegal (thanks,
    @realHenningLorenzen, #848).

    !end-bullet!

!end-bullets-29!

## BUG FIXES

!begin-bullets-30!

-   !begin-bullet!
    Fix the issue that the sorting results may not be expected after
    formatting functions applied. This is a regression of PR #777
    (thanks, @fernandofernandezgonzalez @shrektan, #837).

    !end-bullet!
-   !begin-bullet!
    `styleColorBar()` now displays correctly on Safari, when the data is
    greater than the upper limit, due to negative css percentage values
    (thanks, @Seyphaton, #843).

    !end-bullet!

!end-bullets-30!

# CHANGES IN DT VERSION 0.15

## BUG FIXES

!begin-bullets-31!

-   !begin-bullet!
    Fix the issue that the formatting functions may throw error for
    named colname inputs (thanks, @jarauh @shrektan, #831).

    !end-bullet!
-   !begin-bullet!
    The `input$xxx_xxx_selected` values will always be reset to `NULL`
    or an empty list when the table gets reloaded (thanks, @stibu81
    @shrektan, #828).

    !end-bullet!

!end-bullets-31!

# CHANGES IN DT VERSION 0.14

## NEW FEATURES

!begin-bullets-32!

-   !begin-bullet!
    Now the user is able to control the selection range by
    `datatable(..., selection = list(selectable = 3:5))`, where positive
    and non-positive `selectable` means "enable" and "disable",
    respectively (thanks, @tomasreigl @shrektan, #201 #793).

    !end-bullet!
-   !begin-bullet!
    Added a function `styleValue()` to use column values as CSS values.
    When the user has a complex CSS rule to apply, storing the CSS
    values in the columns of the table and call this function is very
    convenient (thanks, @Mosk915 @shrektan, #801 #802).

    !end-bullet!
-   !begin-bullet!
    Clicking on a row or cell now always triggers a reactive event in
    Shiny (`input$tableId_row_last_clicked` or
    `input$tableId_cell_clicked`), even if the same row or cell is
    clicked multiple times (thanks @gadenbuie, #811).

    !end-bullet!

!end-bullets-32!

## BUG FIXES

!begin-bullets-33!

-   !begin-bullet!
    Fix the issue that formatting functions don't support vectorized
    arguments any longer. This was a regression of PR #777 (thanks,
    @pbreheny @shrektan, #790).

    !end-bullet!
-   !begin-bullet!
    Fix the issue that `styleEqual()` incorrectly uses the column values
    as the default css values. This was a regression of PR #702 (thanks,
    @Chr96er @shrektan, #799)

    !end-bullet!

!end-bullets-33!

## MINOR CHANGES

!begin-bullets-34!

-   !begin-bullet!
    The formatting functions now throw clearer error messages when
    called on non-datatables objects (thanks, @shrektan, #785).

    !end-bullet!
-   !begin-bullet!
    Now the `server` argument in `renderDT()` is reactive in Shiny
    (thanks, @shrektan, #794).

    !end-bullet!
-   !begin-bullet!
    Incorrect `selection` param now triggers a clear error message on
    the R side (thanks, @shrektan, #795).

    !end-bullet!

!end-bullets-34!

# CHANGES IN DT VERSION 0.13

## BUG FIXES

!begin-bullets-35!

-   !begin-bullet!
    Fix a bug that on Windows, rmarkdown can't render a file that
    contains DT with PDF download button enabled (thanks, @mfherman
    @shrektan, #774)

    !end-bullet!
-   !begin-bullet!
    The formatting function will no longer throw errors for non-existing
    columns (thanks, @philibe @shrektan, #623).

    !end-bullet!
-   !begin-bullet!
    Fix a bug that `renderDT()` doesn't react to `...` arguments
    (thanks, @AlfTang @shrektan, #152).

    !end-bullet!
-   !begin-bullet!
    Now DT will always display black text in the RStudio IDE, even under
    a dark theme like "Cobalt" (thanks, @GegznaV @shrektan, #447 #767).

    !end-bullet!
-   !begin-bullet!
    Fix the issue that DT doesn't look well in pkgdown (thanks,
    @jayhesselberth @shrektan, #563).

    !end-bullet!

!end-bullets-35!

## NEW FEATURES

!begin-bullets-36!

-   !begin-bullet!
    All the formatting functions except `formatStyle()` now support the
    `Responsive` plugin (thanks, @andirey @shrektan, #776 #777 #782)
    !end-bullet!

!end-bullets-36!

# CHANGES IN DT VERSION 0.12

## NEW FEATURES

!begin-bullets-37!

-   !begin-bullet!
    Support the Select extension on the client-side processing mode
    (thanks, @shrektan, #744).

    !end-bullet!
-   !begin-bullet!
    Support features/scrollResize plug-in (thanks, @andrewkho @shrektan,
    #467 #754).

    !end-bullet!
-   !begin-bullet!
    Upgrade DataTables to 1.10.20 and support the new datatables
    extension SearchPanes (thanks, @shrektan, #756).

    !end-bullet!

!end-bullets-37!

## BUG FIXES

!begin-bullets-38!

-   !begin-bullet!
    The server no longer throws warnings when conducting searching
    (thanks, @bquast @shrektan, #749).

    !end-bullet!
-   !begin-bullet!
    Fix a bug that the row generated by the RowGroup extension can't be
    used as the selector of the DataTables' callback event handlers
    (thanks, @wiktorowczarz @shrektan, #759).

    !end-bullet!
-   !begin-bullet!
    Fix a bug that `addRow()` can't add a `data.table` row to the proxy
    (thanks, @sifodia @shrektan, #760 #761).

    !end-bullet!
-   !begin-bullet!
    Now DT displays the column alignment and the selection style
    correctly under the bootstrap4 theme (thanks, @pjvandam @shrektan,
    #601 #765).

    !end-bullet!

!end-bullets-38!

# CHANGES IN DT VERSION 0.11

## NEW FEATURES

!begin-bullets-39!

-   !begin-bullet!
    Support pagination plug-ins (#734).
    !end-bullet!

!end-bullets-39!

## BUG FIXES

!begin-bullets-40!

-   !begin-bullet!
    Highlighting when searching with regex (i.e., using
    `options = list(searchHighlight = TRUE, search = list(regex = TRUE))`
    for the table) works now (thanks, @lrasmus, #719).

    !end-bullet!
-   !begin-bullet!
    Updated the AutoFill extension (thanks, @stla @shrektan, #711).

    !end-bullet!

!end-bullets-40!

## MINOR CHANGES

!begin-bullets-41!

-   !begin-bullet!
    In the server-side processing mode, filters now use Perl-compatible
    regular expressions (regexps), such as for lookround and negating
    assertions, see `help(regex)` or
    https://perldoc.perl.org/perlre.html. This may be most useful in
    columns
    (`DT::renderDataTable(filter = list(position = "top"), options = list(search = list(regex = TRUE))`),
    but also works in the global search (thanks, @rfhb, #727).

    !end-bullet!
-   !begin-bullet!
    For a factor column, the choices of the filter now use the factor
    levels (#728).

    !end-bullet!

!end-bullets-41!

# CHANGES IN DT VERSION 0.10

## BUG FIXES

!begin-bullets-42!

-   !begin-bullet!
    Fix the issue that `styleEqual()` doesn't work expectedly for values
    contain special HTML character like `>` or `<` (thanks, @hjia222
    #723).
    !end-bullet!

!end-bullets-42!

# CHANGES IN DT VERSION 0.9

## NEW FEATURES

!begin-bullets-43!

-   !begin-bullet!
    `formatStyle()` with `styleEqual()` is now chainable by default
    (thanks, @e-kennedy #632).
    !end-bullet!

!end-bullets-43!

## BUG FIXES

!begin-bullets-44!

-   !begin-bullet!
    Fix the issue that the first column can't be disabled from editing
    (thanks, @tsolloway #669, @haozhu233 #694).

    !end-bullet!
-   !begin-bullet!
    Fix the issue that the filter boxes are not anchored to the
    corresponding value columns when there are many columns (thanks,
    @philibe, #554).

    !end-bullet!
-   !begin-bullet!
    Column selection now works in `row+column` selection mode, when one
    of `scrollX` or `scrollY` is enabled (thanks, @akarslan #705).

    !end-bullet!

!end-bullets-44!

## MINOR CHANGES

!begin-bullets-45!

-   !begin-bullet!
    Upgraded DataTables from 1.10.16 to 1.10.19.
    !end-bullet!

!end-bullets-45!

# CHANGES IN DT VERSION 0.8

## BUG FIXES

!begin-bullets-46!

-   !begin-bullet!
    For `datatable()`, `options$buttons` now works as expected when
    providing a scalar string or a boolean value (thanks, @shrektan,
    #685 #658).

    !end-bullet!
-   !begin-bullet!
    Fix the issue that when parameters of the `formatXXX()` functions
    contain single quotes, they may lead to incorrect JavaScript code
    due to failing to escape the single quotes (thanks, @shrektan #683
    #666, @lorenzwalthert #667).

    !end-bullet!

!end-bullets-46!

# CHANGES IN DT VERSION 0.7

## BUG FIXES

!begin-bullets-47!

-   !begin-bullet!
    Bulk table editing doesn't work for the client-side processing mode
    without Shiny (e.g. a DataTable on a static HTML page).
    !end-bullet!

!end-bullets-47!

# CHANGES IN DT VERSION 0.6

## NEW FEATURES

!begin-bullets-48!

-   !begin-bullet!
    The table editor has been enhanced: now the `editable` argument of
    `datatable()` can take four possible values, `cell` (or `TRUE` for
    backward compatibility), `row`, `column`, or `all`, which means you
    can edit a single cell a time, or a whole row or column, or all
    cells in the table. To trigger the editor, doubleclick on any cell.
    To submit the edit, hit `Ctrl + Enter` when multiple cells are being
    edited, or hit `Esc` to cancel the edit. See
    https://github.com/rstudio/DT/tree/main/inst/examples/DT-edit for
    comprehensive examples (thanks, @LukasK13 #509 and @mgirlich #493).

    !end-bullet!
-   !begin-bullet!
    Editing can be disabled on specified columns now: pass a list of the
    form `list(target = TARGET, disable = list(columns = INDICES))` to
    the `editable` argument of `datatable()`, where `TARGET` can be
    `'cell'`, `'row'`, `'column'`, or `'all'`, and `INDICES` is an
    integer vector of column indices (thanks, @opremicSebastian #657,
    @l-ts #550).

    !end-bullet!
-   !begin-bullet!
    Added a `funcFilter` argument to `DT::renderDT()` (thanks,
    @galachad, #638).

    !end-bullet!

!end-bullets-48!

## BUG FIXES

!begin-bullets-49!

-   !begin-bullet!
    Fixed the issue where `replaceData()` didn't work when used in Shiny
    modules (thanks, @donarus, #628, #626).

    !end-bullet!
-   !begin-bullet!
    The JavaScript event `cell_edit` now always triggers a reactive
    event on the R side. Since `cell_edit` will only be triggered when
    the value shown on the table has been changed so it's almost always
    what user expects (thanks, @shrektan @stelmath, #647 #645).

    !end-bullet!
-   !begin-bullet!
    Fix the issue that the server-side search option doesn't handle
    exotic encoding correctly, because after httpuv v1.5.0,
    `shiny::parseQueryString()` always assumes the input is an UTF-8
    encoded string (thanks, @shrektan @phileas-condemine, #656).

    !end-bullet!

!end-bullets-49!

# CHANGES IN DT VERSION 0.5

## NEW FEATURES

!begin-bullets-50!

-   !begin-bullet!
    Added the Shiny async support (thanks, @jcheng5, #549; @alexturcan,
    #543).

    !end-bullet!
-   !begin-bullet!
    The filters of `Date` or `Datetime` columns now display the same
    format and timezone as the column content if `formatDate()` is
    applied on these columns (thanks, @shrektan, #522 #241).

    !end-bullet!
-   !begin-bullet!
    You can now show and hide columns from shiny using `showCols()` and
    `hideCols()`, and reorder the the display of columns using
    `colReorder()` (thanks, @gergness, #527).

    !end-bullet!
-   !begin-bullet!
    You can now set the default CSS value in `styleEqual()` by using the
    newe param `default` (thanks, @shrektan, #558, #546).

    !end-bullet!
-   !begin-bullet!
    The js callbacks generated from the `format*()` functions will be
    executed in sequential order. `formatString()` will change the cells
    based on the existing content rather than the raw data (thanks,
    @shrektan, #576).

    !end-bullet!
-   !begin-bullet!
    Added the DataTables plugin `ellipsis` (thanks, @jarauh, #603).

    !end-bullet!

!end-bullets-50!

## BUG FIXES

!begin-bullets-51!

-   !begin-bullet!
    `styleInterval()` and `styleEqual()` now generates the correct
    callback for `Date` and `Datetime` values. (thanks, @shrektan, #500,
    #495).

    !end-bullet!
-   !begin-bullet!
    The `dt-right` class will no longer be added to numeric headers
    unexpectedly (thanks, @shrektan @carlganz @vnijs, #514 #512 #511
    #476).

    !end-bullet!
-   !begin-bullet!
    The printing values of `NA` and `Inf` can be controlled by
    `getOption('DT.TOJSON_ARGS')` in the server-side processing mode
    now. (thanks, @shrektan, #536 #513).

    !end-bullet!
-   !begin-bullet!
    `styleEqual()`, `styleInterval()` and `styleColorBar()` now generate
    correct javascript values when `options(OutDec = ',')` (thanks,
    @shrektan @mteixido, #516 #515).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that `selectRows()` and `selectColumns()` behave
    erratically for scalar inputs or character inputs (thanks, @shrektan
    #528).

    !end-bullet!
-   !begin-bullet!
    The server-side processing mode now supports data with nested
    `data.frame`s in its columns (thanks, @shrektan, #530 #525).

    !end-bullet!
-   !begin-bullet!
    The `colReorder` extention now works with the column filters and the
    server-side processing mode (thanks @shrektan, #532 #531 #160).

    !end-bullet!
-   !begin-bullet!
    Fix the bug that `formatDate()` may display dates off by one day
    when method = "toLocaleDateString" (thanks, @shrektan @DevMui, #539
    #538).

    !end-bullet!
-   !begin-bullet!
    Fix the bug that in IE11, the scroll bar of the filter will
    disappear when you try to click it (thanks, @shrektan, #557 #556).

    !end-bullet!
-   !begin-bullet!
    `coerceValue()` no longer throws warnings for class `charactor`
    (thanks, @shrektan, #541 #542).

    !end-bullet!
-   !begin-bullet!
    Fix the bug that using DT as a htmlwidget inside UI throws an error
    (thanks, @shrektan, #583).

    !end-bullet!
-   !begin-bullet!
    The RowReorder extension now works (thanks, @shrektan, #595 #592).

    !end-bullet!

!end-bullets-51!

# CHANGES IN DT VERSION 0.4

## BUG FIXES

!begin-bullets-52!

-   !begin-bullet!
    A table will never appear again after `renderDT(NULL)` once (thanks,
    @jcheng5, #488).

    !end-bullet!
-   !begin-bullet!
    `updateSearch()` does not respect the search options `regex` and
    `caseInsensitive` (thanks, @mgirlich, #487).

    !end-bullet!

!end-bullets-52!

# CHANGES IN DT VERSION 0.3

## NEW FEATURES

!begin-bullets-53!

-   !begin-bullet!
    It is possible to double-click to edit values in table cells now.
    See https://github.com/rstudio/DT/pull/480 for examples.

    !end-bullet!
-   !begin-bullet!
    Added functions `DTOutput()` and `renderDT()` as aliases of
    `dataTableOutput()` and `renderDataTable()`, respectively. This is
    because the latter often collide with functions of the same names in
    **shiny**. You are recommended to use `DTOutput()` and `renderDT()`
    in Shiny apps (unless you always use the `DT::` qualifier).

    !end-bullet!
-   !begin-bullet!
    Support using `Shift + Click` to select multiple rows (thanks,
    @shrektan, #475 #305 #481).

    !end-bullet!
-   !begin-bullet!
    Added an argument `params` to the `formatDate()` function so you can
    pass a list of parameters to the specific date conversion method
    (http://stackoverflow.com/q/38875173/559676).

    !end-bullet!
-   !begin-bullet!
    The arguments `interval`, `mark`, and `dec.mark` also work for
    functions `formatPercentage()`, `formatRound()`, and
    `formatSignif()` now (thanks, @paulofelipe, #128).

    !end-bullet!
-   !begin-bullet!
    Added the `RowGroup` extension (thanks, @ecortens, #466 #442).

    !end-bullet!

!end-bullets-53!

## MAJOR CHANGES

!begin-bullets-54!

-   !begin-bullet!
    Searching in the server-side processing mode has enabled the "smart"
    mode by default
    (https://datatables.net/reference/option/search.smart). Previously
    this only works in the client-side processing mode. If you want to
    disable the smart filtering, you can set the initialization options
    in `datatable()` (e.g.,
    `options = list(search = list(smart = FALSE))`). The smart filtering
    means spaces in the global search keyword in the table will have a
    special meaning: each returned record in the table should match
    *all* of the words separated by spaces (thanks, @carlganz, #453;
    @keshavramaswamy, #391).

    !end-bullet!
-   !begin-bullet!
    For client-side tables in Shiny, the indices of selected rows
    (`input$tableId_rows_selected`) will include the rows that are not
    visible in the current view after filtering is applied. If you want
    to exclude the indices of such rows, you can take the intersection
    of `input$tableId_rows_selected` and `input$tableId_rows_all` (the
    latter is the indices of all rows after filtering is applied).

    !end-bullet!

!end-bullets-54!

## MINOR CHANGES

!begin-bullets-55!

-   !begin-bullet!
    Upgraded DataTables from 1.10.12 to 1.10.16.
    !end-bullet!

!end-bullets-55!

## BUG FIXES

!begin-bullets-56!

-   !begin-bullet!
    When the DataTables option `language.url` is used, the table cannot
    be successfully initialized (thanks, @lubomirskirka, #344)

    !end-bullet!
-   !begin-bullet!
    `styleEqual()` accepts `NA` in the `levels` argument now (thanks,
    @MalditoBarbudo, #355).

    !end-bullet!
-   !begin-bullet!
    `dataTableProxy()` does not work with Shiny modules (thanks,
    @fbreitwieser, #357).

    !end-bullet!
-   !begin-bullet!
    `replaceData()` does not work with Shiny modules (thanks, @ykeuter,
    @ssayols, @fbreitwieser, @carlganz, #359).

    !end-bullet!
-   !begin-bullet!
    `formatDate()` may display dates off by one day (thanks, @jdthorpe,
    #198).

    !end-bullet!
-   !begin-bullet!
    When a table is destroyed, all Shiny input values associated with
    the table should be emptied (thanks, @dracodoc, #457).

    !end-bullet!

!end-bullets-56!

# CHANGES IN DT VERSION 0.2

## NEW FEATURES

!begin-bullets-57!

-   !begin-bullet!
    The `selection` argument of `datatable()` can be used to specify a
    vector of row indices to be pre-selected (thanks, @maxmoro, #89).

    !end-bullet!
-   !begin-bullet!
    Column filters may be disabled individually using the `searchable`
    settings of columns,
    e.g. http://rstudio.github.io/DT/009-searchable.html (thanks,
    @GitChub, #101).

    !end-bullet!
-   !begin-bullet!
    `formatCurrency()` will round numbers to 2 decimal places by
    default, and it is configurable via the new argument `digits`
    (thanks, @mebaran, #100).

    !end-bullet!
-   !begin-bullet!
    In Shiny, `input$tableId_cell_clicked` gives the row and column
    indices of the currently clicked cell as well as its value as a list
    of the form
    `list(row = row_index, col = column_index, value = cell_value)`.

    !end-bullet!
-   !begin-bullet!
    Added a new argument `valueColumns` to `formatStyle()` so we can
    style a column based on the values of a different column (thanks,
    @zizaozi, #115). See http://rstudio.github.io/DT/010-style.html for
    examples.

    !end-bullet!
-   !begin-bullet!
    You can enable column selection by
    `datatable(..., selection = list(target = 'column'))` now. The
    indices of selected columns are available to Shiny as
    `input$tableId_columns_selected` (thanks, @DarioS, #117).

    !end-bullet!
-   !begin-bullet!
    Row and column selections can be enabled simultaneously using
    `datatable(..., selection = list(target = 'row+column')`. Column
    selection is done via clicking on the table footer.

    !end-bullet!
-   !begin-bullet!
    Cell selection can be enabled via
    `datatable(..., selection = list(target = 'cell'))`. See
    http://rstudio.github.io/DT/shiny.html for more info.

    !end-bullet!
-   !begin-bullet!
    It is possible to update the data of a table without regenerating
    the whole table widget with the new function `replaceData()` now
    (#168, #208).

    !end-bullet!
-   !begin-bullet!
    Added a `width` argument to `datatable()` (thanks, @taiyun).

    !end-bullet!
-   !begin-bullet!
    Added a `plugins` argument to `datatable()` to support
    **DataTables** plugins. See http://rstudio.github.io/plugins/ for
    more information.

    !end-bullet!
-   !begin-bullet!
    Added a function `dataTableProxy()` to create a proxy object that
    can be used to manipulate a table instance after it has been
    rendered in a Shiny app. Currently supported methods include
    `selectRows()`, `selectColumns()` (#126), and `addRow()` (#129),
    etc.

    !end-bullet!
-   !begin-bullet!
    Added a function `selectCells()` to select table cells.

    !end-bullet!
-   !begin-bullet!
    Added a function `clearSearch()` to clear the filters.

    !end-bullet!
-   !begin-bullet!
    Added a function `selectPage()` to select a page in the table
    (thanks, @carlganz, #314).

    !end-bullet!
-   !begin-bullet!
    Added a function `updateCaption()` to update the table caption only
    (thanks, @johnpauls, #155).

    !end-bullet!
-   !begin-bullet!
    Added a function `updateSearch()` to change the search keywords of
    the global search box and individual column filters (thanks,
    @fbreitwieser, #262).

    !end-bullet!
-   !begin-bullet!
    When all values in a numeric column are missing (`NA`), the column
    filter will be disabled
    (http://stackoverflow.com/q/31323807/559676).

    !end-bullet!
-   !begin-bullet!
    Added an argument `dec.mark` to `formatCurrency()` to customize the
    character for the decimal point (thanks, @frajuegies, #128).

    !end-bullet!
-   !begin-bullet!
    Added an argument `before` to `formatCurrency()` to determine
    whether to place the currency symbol before or after the data values
    (thanks, @jrdnmdhl, #220).

    !end-bullet!
-   !begin-bullet!
    Added a `target` argument to `formatStyle()` to decide whether to
    style the cell or the full row (thanks, @peterlomas, #108).

    !end-bullet!
-   !begin-bullet!
    Added a `formatSignif()` function to format numbers to a specified
    number of significant digits (thanks, @shabbychef, #216).

    !end-bullet!
-   !begin-bullet!
    Added a `formatString()` function to format strings; currently it
    has two arguments `prefix` and `suffix`, and you may add strings
    before/after column values (thanks, @fbreitwieser, #279)

    !end-bullet!
-   !begin-bullet!
    Added the `elementId` argument to `datatable()` (#307).

    !end-bullet!

!end-bullets-57!

## MAJOR CHANGES

!begin-bullets-58!

-   !begin-bullet!
    Upgraded the DataTables library to 1.10.12; there have been many
    changes from 1.10.7 to this version:
    http://datatables.net/blog/2015-08-13

    !begin-bullets-59!
    -   !begin-bullet!
        The `extensions` argument of `datatable()` should be a character
        vector now; previously it can be a list of initialization
        options for extensions due to the inconsistent ways of
        initializing DataTables extensions; now the initialization
        options for all extensions can be set in the `options` argument.
        !end-bullet!
    -   !begin-bullet!
        The `copySWF()` function has been removed, since the
        `TableTools` extension has been removed.
        !end-bullet!
    -   !begin-bullet!
        The `ColVis` extension was removed and replaced but the `colvis`
        button in the `Buttons` extension.
        !end-bullet!

    !end-bullets-59!
    !end-bullet!
-   !begin-bullet!
    In the previous version, row names were used as row indices in the
    server-side processing mode, but numeric row indices were used in
    the client-side mode. Now we always use numeric row indices in both
    modes for the sake of consistency. These input values in Shiny will
    always be integers: `input$tableId_rows_current`,
    `input$tableId_rows_all`, and `input$tableId_rows_selected`.

    !end-bullet!
-   !begin-bullet!
    `formatCurrency()` puts the currency symbol after the minus sign
    now, e.g. previously you might see `$-20` but now it is displayed as
    `-$20` (#220).

    !end-bullet!

!end-bullets-58!

## BUG FIXES

!begin-bullets-60!

-   !begin-bullet!
    Row selections are not preserved when column filters are enabled and
    clicked (thanks, @The-Dub, #97).

    !end-bullet!
-   !begin-bullet!
    Single row selection does not work for server-side tables
    (http://stackoverflow.com/q/30700143/559676).

    !end-bullet!
-   !begin-bullet!
    Missing dates are not rendered correctly with `formatDate()`
    (thanks, @studerus, #112)

    !end-bullet!
-   !begin-bullet!
    Missing values are mistakenly treated as 0 in `formatStyle()`
    (thanks, @studerus, #116)

    !end-bullet!
-   !begin-bullet!
    The thousands separator (e.g. a comma) in `formatCurrency()` should
    not be applied to the digits after the decimal point (thanks,
    @johnbaums, #116).

    !end-bullet!
-   !begin-bullet!
    The `class` argument does not work when a custom table `container`
    is used in `datatable()` (thanks, @DarioS, #138).

    !end-bullet!
-   !begin-bullet!
    The column filters for numeric columns (sliders) do not work well
    when the columns contain very small values or values with a large
    number of decimal places (thanks, @DarioS, #150).

    !end-bullet!
-   !begin-bullet!
    Searching for the ampersand `&` in the table does not work in Shiny.

    !end-bullet!
-   !begin-bullet!
    Searching for `+` in columns does not work in Shiny (thanks, @vnijs,
    #214).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that triggers a DataTables warning dialog box in the
    browser (thanks, @zross,
    https://github.com/WHOequity/who-heat/issues/229 and
    https://github.com/rstudio/shiny/issues/561)

    !end-bullet!
-   !begin-bullet!
    Factors will a huge number of levels may slow down the rendering of
    the table significantly (thanks, @vnijs, #169).

    !end-bullet!
-   !begin-bullet!
    Clicking links in table cells should not trigger row/column/cell
    selection (thanks, @daattali, #265).

    !end-bullet!
-   !begin-bullet!
    White spaces may be trimmed unexpectedly in select inputs when
    `dataTableOutput()` is present in a Shiny app (thanks, @Yang-Tang,
    #303).

    !end-bullet!
-   !begin-bullet!
    Respect column-wise `searchable` options when performing global
    searching (thanks, @aj2duncan, #311).

    !end-bullet!
-   !begin-bullet!
    Clear buttons do not work when column filters are pre-set (thanks,
    @nutterb, #319).

    !end-bullet!
-   !begin-bullet!
    Changes in column visibility should trigger changes in the table
    state, i.e. `input$tableId_state` (thanks, @MikeBadescu, #256).

    !end-bullet!

!end-bullets-60!

# CHANGES IN DT VERSION 0.1

!begin-bullets-61!

-   !begin-bullet!
    Initial CRAN release.
    !end-bullet!

!end-bullets-61!

# shiny (development version)

# shiny 1.9.1

## Bug fixes

!begin-bullets-1!

-   !begin-bullet!
    Fixed a bug introduced in v1.9.0 where the boundaries of
    hover/click/brush regions on plots were being incorrectly scaled
    when browser zoom was used. (#4111)
    !end-bullet!

!end-bullets-1!

# shiny 1.9.0

## New busy indication feature

Add the new `useBusyIndicators()` function to any UI definition to: 1.
Add a spinner overlay on calculating/recalculating outputs. 2. Show a
page-level pulsing banner when Shiny is busy calculating something
(e.g., a download, side-effect, etc), but no calculating/recalculating
outputs are visible.

In a future version of Shiny, busy indication will be enabled by
default, so we encourage you to try it out now, provide feedback, and
report any issues.

In addition, various properties of the spinners and pulse can be
customized with `busyIndicatorOptions()`. For more details, see
`?busyIndicatorOptions`. (#4040, #4104)

## New features and improvements

!begin-bullets-2!

-   !begin-bullet!
    The client-side TypeScript code for Shiny has been refactored so
    that the `Shiny` object is now an instance of class `ShinyClass`.
    (#4063)

    !end-bullet!
-   !begin-bullet!
    In TypeScript, the `Shiny` object has a new property
    `initializedPromise`, which is a Promise-like object that can be
    `await`ed or chained with `.then()`. This Promise-like object
    corresponds to the `shiny:sessioninitialized` JavaScript event, but
    is easier to use because it can be used both before and after the
    events have occurred. (#4063)

    !end-bullet!
-   !begin-bullet!
    Output bindings now include the `.recalculating` CSS class when they
    are first bound, up until the first render. This makes it
    possible/easier to show progress indication when the output is
    calculating for the first time. (#4039)

    !end-bullet!
-   !begin-bullet!
    A new `shiny.client_devmode` option controls client-side devmode
    features, in particular the client-side error console introduced in
    shiny 1.8.1, independently of the R-side features of
    `shiny::devmode()`. This usage is primarily intended for automatic
    use in Shinylive. (#4073)

    !end-bullet!
-   !begin-bullet!
    Added function `reactlogAddMark()` to programmatically add \_mark_ed
    locations in the reactlog log without the requirement of keyboard
    bindings during an idle reactive moment. (#4103)

    !end-bullet!

!end-bullets-2!

## Bug fixes

!begin-bullets-3!

-   !begin-bullet!
    `downloadButton()` and `downloadLink()` are now disabled up until
    they are fully initialized. This prevents the user from clicking the
    button/link before the download is ready. (#4041)

    !end-bullet!
-   !begin-bullet!
    Output bindings that are removed, invalidated, then inserted again
    (while invalidated) now correctly include the `.recalculating` CSS
    class. (#4039)

    !end-bullet!
-   !begin-bullet!
    Fixed a recent issue with `uiOutput()` and `conditionalPanel()` not
    properly lower opacity when recalculation (in a Bootstrap 5
    context). (#4027)

    !end-bullet!
-   !begin-bullet!
    Image outputs that were scaled by CSS had certain regions that were
    unresponsive to hover/click/brush handlers. (#3234)

    !end-bullet!

!end-bullets-3!

# shiny 1.8.1.1

!begin-bullets-4!

-   !begin-bullet!
    In v1.8.1, shiny.js starting throwing an error when input/output
    bindings have duplicate IDs. This error is now only thrown when
    `shiny::devmode(TRUE)` is enabled, so the issue is still made
    discoverable through the JS error console, but avoids unnecessarily
    breaking apps that happen to work with duplicate IDs. (#4019)
    !end-bullet!

!end-bullets-4!

# shiny 1.8.1

## New features and improvements

!begin-bullets-5!

-   !begin-bullet!
    Added `ExtendedTask`, a new simple way to launch long-running
    asynchronous tasks that are truly non-blocking. That is, even
    *within* a session, an `ExtendedTask` won't block the main thread
    from flushing the reactive graph (i.e., UI updates won't be
    blocked). `ExtendedTask` pairs nicely with new
    `bslib::input_task_button()` and `bslib::bind_task_button()`
    functions, which help give user feedback and prevent extra button
    clicks. (#3958)

    !end-bullet!
-   !begin-bullet!
    Added a JavaScript error dialog, reporting errors that previously
    were only discoverable by opening the browser's devtools open. Since
    this dialog is mainly useful for debugging and development, it must
    be enabled with `shiny::devmode()`. (#3931)

    !end-bullet!
-   !begin-bullet!
    `runExample()` now uses the `{bslib}` package to generate a better
    looking result. It also gains a `package` argument so that other
    packages can leverage this same function to run Shiny app examples.
    For more, see `?runExample`. (#3963, #4005)

    !end-bullet!
-   !begin-bullet!
    Added `onUnhandledError()` to register a function that will be
    called when an unhandled error occurs in a Shiny app. Note that this
    handler doesn't stop the error or prevent the session from closing,
    but it can be used to log the error or to clean up session-specific
    resources. (thanks @JohnCoene, #3993)

    !end-bullet!

!end-bullets-5!

## Changes

!begin-bullets-6!

-   !begin-bullet!
    `renderDataTable()`/`dataTableOutput()` are officially deprecated in
    favor of their `{DT}` equivalents. Migrating to `{DT}`, in most
    cases, just requires changing `renderDataTable()` to
    `DT::renderDT()` and `dataTableOutput()` to `DT::DTOutput()`. Also,
    to promote migration, when a recent version of `{DT}` is available,
    `renderDataTable()`/`dataTableOutput()` now automatically use their
    `{DT}` equivalent (and provide a message that they are doing so). If
    this happens to degrade an existing app, set
    `options(shiny.legacy.datatable = TRUE)` to get the old (i.e.,
    non-`{DT}`) implementation. (#3998)

    !end-bullet!
-   !begin-bullet!
    Both `conditionalPanel()` and `uiOutput()` are now styled with
    `display: contents` by default in Shiny apps that use Bootstrap 5.
    This means that the elements they contain are positioned as if they
    were direct children of the parent container holding the
    `conditionalPanel()` or `uiOutput()`. This is probably what most
    users intend when they use these functions, but it may break apps
    that applied styles directly to the container elements created by
    these two functions. In that case, you may include CSS rules to set
    `display: block` for the `.shiny-panel-conditional` or
    `.shiny-html-output` classes. (#3957, #3960)

    !end-bullet!

!end-bullets-6!

## Bug fixes

!begin-bullets-7!

-   !begin-bullet!
    Notifications are now constrained to the width of the viewport for
    window widths smaller the default notification panel size. (#3949)

    !end-bullet!
-   !begin-bullet!
    Fixed #2392: `downloadButton()` now visibly returns its HTML tag so
    that it renders correctly in R Markdown and Quarto output. (Thanks
    to @fennovj, #2672)

    !end-bullet!
-   !begin-bullet!
    Calling `updateSelectizeInput()` with `choices` and `selected` now
    clears the current selection before updating the choices and
    selected value. (#3967)

    !end-bullet!
-   !begin-bullet!
    Loading a Shiny app in a package-like directory will no longer warn
    if autoloading is disabled by the presence of an
    `R/_disable_autoload.R` file. (Thanks to @krlmlr and @tanho63,
    #3513)

    !end-bullet!

!end-bullets-7!

# shiny 1.8.0

## Breaking changes

!begin-bullets-8!

-   !begin-bullet!
    Closed #3899: The JS function `Shiny.bindAll()` is now asynchronous.
    This change is driven by the recent push toward making dynamic UI
    rendering asynchronous, which is necessary for shinylive (and
    should've happened when it was first introduced in Shiny v1.7.5).
    The vast majority of existing `Shiny.bindAll()` uses should continue
    to work as before, but some cases may break if downstream code
    relies on it being synchronous (i.e., blocking the main thread). In
    this case, consider placing any downstream code in a `.then()`
    callback (or `await` the result in a `async` function). (#3929)
    !begin-bullets-9!
    -   !begin-bullet!
        Since `renderContent()` calls `bindAll()` (after it inserts
        content), it now returns a `Promise<void>` instead of `void`,
        which can be useful if downstream code needs to wait for the
        binding to complete.
        !end-bullet!

    !end-bullets-9!
    !end-bullet!

!end-bullets-8!

## New features and improvements

!begin-bullets-10!

-   !begin-bullet!
    Updated `selectizeInput()`'s selectize.js dependency from v0.12.4 to
    v0.15.2. In addition to many bug fixes and improvements, this update
    also adds several new plugin options. (#3875)

    !end-bullet!
-   !begin-bullet!
    Shiny's CSS styling (for things like `showNotification()`,
    `withProgress()`, `inputPanel()`, etc.), has been updated with
    `{bslib}`'s upcoming CSS-only dark mode feature in mind. (#3882,
    #3914)

    !end-bullet!
-   !begin-bullet!
    Default styles for `showNotification()` were tweaked slightly to
    improve accessibility, sizing, and padding. (#3913)

    !end-bullet!
-   !begin-bullet!
    Shiny inputs and `{htmlwidgets}` are no longer treated as draggable
    inside of `absolutePanel()`/`fixedPanel()` with `draggable = TRUE`.
    As a result, interactions like zooming and panning now work as
    expected with widgets like `{plotly}` and `{leaflet}` when they
    appear in a draggable panel. (#3752, #3933)

    !end-bullet!
-   !begin-bullet!
    For `InputBinding`s, the `.receiveMessage()` method can now be
    asynchronous or synchronous (previously it could only be
    synchronous). (#3930)

    !end-bullet!

!end-bullets-10!

## Bug fixes

!begin-bullets-11!

-   !begin-bullet!
    `fileInput()` no longer has unwanted round corners applied to the
    `buttonLabel`. (#3879)

    !end-bullet!
-   !begin-bullet!
    Fixed #3898: `wrapFunctionLabel()` no longer throws an error if the
    `name` is longer than 10000 bytes. (#3903)

    !end-bullet!

!end-bullets-11!

# shiny 1.7.5.1

## Bug fixes

!begin-bullets-12!

-   !begin-bullet!
    On r-devel (R \> 4.3.1), `isTruthy(NULL)` now returns `FALSE` (as it
    does with older versions of R). (#3906)
    !end-bullet!

!end-bullets-12!

# shiny 1.7.5

## Possibly breaking changes

!begin-bullets-13!

-   !begin-bullet!
    For `reactiveValues()` objects, whenever the `$names()` or
    `$values()` methods are called, the keys are now returned in the
    order that they were inserted. (#3774)

    !end-bullet!
-   !begin-bullet!
    The value provided to `options(shiny.json.digits)` is now
    interpreted as number of *digits after the decimal* instead of
    *significant digits*. To treat the value as significant digits, wrap
    it in `I()` (e.g., `options(shiny.json.digits = I(4))`). This new
    default behavior not only helps with reducing digits in testing
    snapshots, but is also more consistent with `{jsonlite}`'s default
    behavior. (#3819)

    !end-bullet!

!end-bullets-13!

## New features and improvements

!begin-bullets-14!

-   !begin-bullet!
    Closed #789: Dynamic UI is now rendered asynchronously, thanks in
    part to the newly exported `Shiny.renderDependenciesAsync()`,
    `Shiny.renderHtmlAsync()`, and `Shiny.renderContentAsync()`.
    Importantly, this means `<script>` tags are now loaded
    asynchronously (the old way used `XMLHttpRequest`, which is
    synchronous). In addition, `Shiny` now manages a queue of async
    tasks (exposed via `Shiny.shinyapp.taskQueue`) so that order of
    execution is preserved. (#3666)

    !end-bullet!
-   !begin-bullet!
    Fixes #3840: `updateSliderInput()` now warns when attempting to set
    invalid `min`, `max`, or `value` values. Sending an invalid update
    message to an input no longer causes other update messages to fail.
    (#3843)

    !end-bullet!
-   !begin-bullet!
    `sliderInput()` now has a larger target area for clicking or tapping
    on the slider handle or range. (#3859)

    !end-bullet!
-   !begin-bullet!
    Closed #2956: Component authors can now prevent Shiny from creating
    an input binding on specific elements by adding the
    `data-shiny-no-bind-input` attribute to the element. The attribute
    may have any or no value; its presence will prevent binding. This
    feature is primarily useful for input component authors who want to
    use standard HTML input elements without causing Shiny to create an
    input binding for them. Additionally, Shiny now adds custom classes
    to its inputs. For example, `checkboxInput()` now has a
    `shiny-input-checkbox` class. These custom classes may be utilized
    in future updates to Shiny's input binding logic. (#3861)

    !end-bullet!
-   !begin-bullet!
    `Map` objects are now initialized at load time instead of build
    time. This avoids potential problems that could arise from storing
    `fastmap` objects into the built Shiny package. (#3775)

    !end-bullet!

!end-bullets-14!

## Bug fixes

!begin-bullets-15!

-   !begin-bullet!
    Fixed #3771: Sometimes the error
    `ion.rangeSlider.min.js: i.stopPropagation is not a function` would
    appear in the JavaScript console. (#3772)

    !end-bullet!
-   !begin-bullet!
    Fixed #3833: When `width` is provided to `textAreaInput()`, we now
    correctly set the width of the `<textarea>` element. (#3838)

    !end-bullet!

!end-bullets-15!

# shiny 1.7.4.1

## Full changelog

!begin-bullets-16!

-   !begin-bullet!
    Closed #3849: In R-devel, a warning was raised when Shiny was loaded
    because `as.numeric_version()` was called with a number instead of a
    string. (#3850)
    !end-bullet!

!end-bullets-16!

# shiny 1.7.4

## Full changelog

### Breaking changes

!begin-bullets-17!

-   !begin-bullet!
    Closed #3719: Output container sizes, which are available via
    `session$clientData` and `getCurrentOutputInfo()`, no longer round
    to the nearest pixel (i.e., they are now more exact, possibly
    fractional values). (#3720)

    !end-bullet!
-   !begin-bullet!
    Closed #3704, #3735, and #3740: `renderPlot()` no longer generates
    an error (or segfault) when it executes before the output is
    visible. Instead, it'll now use the graphics device's default size
    for it's initial size. Relatedly, `plotPNG()` now ignores `NULL`
    values for `width`/`height` (and uses the device's default
    `width`/`height` instead). (#3739)

    !end-bullet!

!end-bullets-17!

### New features and improvements

!begin-bullets-18!

-   !begin-bullet!
    `plotOutput()`, `imageOutput()`, and `uiOutput()` gain a `fill`
    argument. If `TRUE` (the default for `plotOutput()`), the output
    container is allowed to grow/shrink to fit a fill container (created
    via `htmltools::bindFillRole()`) with an opinionated height. This
    means `plotOutput()` will grow/shrink by default inside of
    `bslib::card_body_fill()`, but `imageOutput()` and `uiOutput()` will
    have to opt-in to similar behavior with `fill = TRUE`. (#3715)

    !end-bullet!
-   !begin-bullet!
    Closed #3687: Updated jQuery-UI to v1.13.2. (#3697)

    !end-bullet!
-   !begin-bullet!
    Internal: Added clearer and strict TypeScript type definitions
    (#3644)

    !end-bullet!

!end-bullets-18!

# shiny 1.7.3

### Bug fixes

!begin-bullets-19!

-   !begin-bullet!
    Shiny 1.7.0 changed the `icon(lib="fontawesome")` implementation
    from a bundled copy of fontawesome, to the {fontawesome} package.
    This led to issue #3688, where icons that were previously working,
    were now breaking. That's because {fontawesome} 0.3.0 and earlier
    did not have support for icon names used in Font Awesome 5 and
    earlier, only the newest icon names used in Font Awesome 6. Now,
    {fontawesome} 0.4.0 has restored support for those older icon names,
    and Shiny 1.7.2.1 has updated its {fontawesome} requirement to
    \>=0.4.0.
    !end-bullet!

!end-bullets-19!

# shiny 1.7.2

## Full changelog

### Breaking changes

!begin-bullets-20!

-   !begin-bullet!
    Closed #3626: `renderPlot()` (and `plotPNG()`) now uses
    `ragg::agg_png()` by default when the `{ragg}` package is installed.
    To restore the previous behavior, set
    `options(shiny.useragg = FALSE)`. (#3654)
    !end-bullet!

!end-bullets-20!

### New features and improvements

!begin-bullets-21!

-   !begin-bullet!
    Closed #1545: `insertUI()` now executes `<script>` tags. (#3630)

    !end-bullet!
-   !begin-bullet!
    `fileInput()` can set the `capture` attribute to facilitates user
    access to a device's media capture mechanism, such as a camera, or
    microphone, from within a file upload control (W3C HTML Media
    Capture). (Thanks to khaled-alshamaa, #3481)

    !end-bullet!
-   !begin-bullet!
    Closed tidyverse/dplyr#5552: Compatibility of dplyr 1.0 (and rlang
    chained errors in general) with `req()`, `validate()`, and friends.

    !end-bullet!
-   !begin-bullet!
    Closed tidyverse/dplyr#6154: Values from an `actionButton()` had S3
    classes in the incorrect order.

    !end-bullet!
-   !begin-bullet!
    Closed #3346: Default for `ref` input in `runGithub()` changed from
    `"master"` to `"HEAD"`. (#3564)

    !end-bullet!
-   !begin-bullet!
    Closed #3619: In R 4.2, `splitLayout()` no longer raises warnings
    about incorrect length in an `if` statement. (Thanks to @dmenne,
    #3625)

    !end-bullet!

!end-bullets-21!

### Bug fixes

!begin-bullets-22!

-   !begin-bullet!
    Closed #3250:`{rlang}`/`{tidyeval}` conditions (i.e., warnings and
    errors) are no longer filtered from stack traces. (#3602)

    !end-bullet!
-   !begin-bullet!
    Closed #3581: Errors in throttled/debounced reactive expressions no
    longer cause the session to exit. (#3624)

    !end-bullet!
-   !begin-bullet!
    Closed #3657: `throttle.ts` and the `Throttler` typescript objects
    it provides now function as intended. (Thanks gto @dvg-p4, #3659)

    !end-bullet!
-   !begin-bullet!
    The auto-reload feature (`options(shiny.autoreload=TRUE)`) was not
    being activated by `devmode(TRUE)`, despite a console message
    asserting that it was. (#3620)

    !end-bullet!
-   !begin-bullet!
    Closed #2297: If an error occurred in parsing a value in a bookmark
    query string, an error would be thrown and nothing would be
    restored. Now a message is displayed and that value is ignored.
    (Thanks to @daattali, #3385)

    !end-bullet!
-   !begin-bullet!
    Restored the previous behavior of automatically guessing the
    `Content-Type` header for `downloadHandler` functions when no
    explicit `contentType` argument is supplied. (#3393)

    !end-bullet!
-   !begin-bullet!
    Previously, updating an input value without a corresponding Input
    binding element did not trigger a JavaScript `shiny:inputchanged`
    event. Now, if no Input binding element is found, the
    `shiny:inputchanged` event is triggered on `window.document`.
    (#3584)

    !end-bullet!
-   !begin-bullet!
    Closed #2955: Input and output bindings previously attempted to use
    `el['data-input-id']`, but that never worked. They now use
    `el.getAttribute('data-input-id')` instead. (#3538)

    !end-bullet!

!end-bullets-22!

### Minor improvements

!begin-bullets-23!

-   !begin-bullet!
    When taking a test snapshot, the sort order of the json keys of the
    `input`, `output`, and `export` fields is currently sorted using the
    locale of the machine. This can lead to inconsistent test snapshot
    results. To opt-in to a consistent ordering of snapshot fields with
    `{shinytest}`, please set the global option
    `options(shiny.snapshotsortc = TRUE)`. `{shinytest2}` users do not
    need to set this value. (#3515)

    !end-bullet!
-   !begin-bullet!
    Closed rstudio/shinytest2#222: When restoring a context (i.e.,
    bookmarking) from a URL, Shiny now better handles a trailing `=`
    after `_inputs_` and `_values_`. (#3648)

    !end-bullet!
-   !begin-bullet!
    Shiny's internal HTML dependencies are now mounted dynamically
    instead of statically. (#3537)

    !end-bullet!
-   !begin-bullet!
    HTML dependencies that are sent to dynamic UI now have better type
    checking, and no longer require a `dep.src.href` field. (#3537)

    !end-bullet!

!end-bullets-23!

# shiny 1.7.1

## Bug Fixes

!begin-bullets-24!

-   !begin-bullet!
    Closed #3516: Fix regression in repeated calls to `appendTab()` when
    `navbarMenu()` is already present within a
    `tabsetPanel()`/`navbarPage()`. (#3518)

    !end-bullet!
-   !begin-bullet!
    Re-arranged conditions for testthat 1.0.0 compatibility. (#3512)

    !end-bullet!

!end-bullets-24!

# shiny 1.7.0

## Full changelog

### Breaking changes

!begin-bullets-25!

-   !begin-bullet!
    The `format` and `locale` arguments to `sliderInput()` have been
    removed. They have been deprecated since 0.10.2.2 (released on
    2014-12-08).

    !end-bullet!
-   !begin-bullet!
    Closed #3403: `insertTab()`'s `position` parameter now defaults to
    `"after"` instead of `"before"`. This has the benefit of allowing us
    to fix a bug in positioning when `target = NULL`, but has the
    drawback of changing the default behavior when `target` is not
    `NULL`. (#3404)

    !end-bullet!

!end-bullets-25!

### New features and improvements

!begin-bullets-26!

-   !begin-bullet!
    Bootstrap 5 support. (#3410 and rstudio/bslib#304)

    !begin-bullets-27!
    -   !begin-bullet!
        As explained here, to opt-in to Bootstrap 5, provide
        `bslib::bs_theme(version = 5)` to a page layout function with a
        `theme` argument (e.g., `fluidPage()`, `navbarPage()`, etc).
        !end-bullet!

    !end-bullets-27!
    !end-bullet!
-   !begin-bullet!
    Closed #3322, #3313, #1823, #3321, #3320, #1928, and #2310: Various
    improvements to `navbarPage()`, `tabsetPanel()`, `tabPanel()`,
    `navbarMenu()`, etc. Also, these functions are now powered by the
    `{bslib}` package's new `nav()` API (consider using `{bslib}`'s API
    to create better looking and more fully featured navs). (#3388)

    !end-bullet!
-   !begin-bullet!
    All uses of `list(...)` have been replaced with `rlang::list2(...)`.
    This means that you can use trailing `,` without error and use
    rlang's `!!!` operator to "splice" a list of argument values into
    `...`. We think this'll be particularly useful for passing a list of
    `tabPanel()` to their consumers (i.e., `tabsetPanel()`,
    `navbarPage()`, etc). For example,
    `tabs <- list(tabPanel("A", "a"), tabPanel("B", "b")); navbarPage(!!!tabs)`.
    (#3315 and #3328)

    !end-bullet!
-   !begin-bullet!
    `installExprFunction()` and `exprToFunction()` are now able to
    handle quosures when `quoted = TRUE`. So `render`-functions which
    call these functions (such as with `htmlwidgets`) can now understand
    quosures. Users can also use `rlang::inject()` to unquote a quosure
    for evaluation. This also means that `render` function no longer
    need `env` and `quoted` parameters; that information can be embedded
    into a quosure which is then passed to the `render` function. Better
    documentation was added for how to create `render` functions.
    (#3472)

    !end-bullet!
-   !begin-bullet!
    `icon(lib="fontawesome")` is now powered by the `{fontawesome}`
    package, which will make it easier to use the latest FA icons in the
    future (by updating the `{fontawesome}` package). (#3302)

    !end-bullet!
-   !begin-bullet!
    Closed #3397: `renderPlot()` new uses `ggplot2::get_alt_text()` to
    inform an `alt` text default (for `{ggplot2}` plots). (#3398)

    !end-bullet!
-   !begin-bullet!
    `modalDialog()` gains support for `size = "xl"`. (#3410)

    !end-bullet!
-   !begin-bullet!
    Addressed #2521: Updated the list of TCP ports that will be rejected
    by default in runapp.R, adding 5060, 5061 and 6566. Added
    documentation describing the port range (3000:8000) and which ports
    are rejected. (#3456)

    !end-bullet!

!end-bullets-26!

### Other improvements

!begin-bullets-28!

-   !begin-bullet!
    Shiny's core JavaScript code was converted to TypeScript. For the
    latest development information, please see the README.md in
    `./srcts`. (#3296)

    !end-bullet!
-   !begin-bullet!
    Switched from `digest::digest()` to `rlang::hash()` for hashing.
    (#3264)

    !end-bullet!
-   !begin-bullet!
    Switched from internal `Stack` class to `fastmap::faststack()`, and
    used `fastmap::fastqueue()`. (#3176)

    !end-bullet!
-   !begin-bullet!
    Some long-deprecated functions and function parameters were removed.
    (#3137)

    !end-bullet!

!end-bullets-28!

### Bug fixes

!begin-bullets-29!

-   !begin-bullet!
    Closed #3345: Shiny now correctly renders
    `htmltools::htmlDependency()`(s) with a `list()` of `script`
    attributes when used in a dynamic UI context. This fairly new
    `htmlDependency()` feature was added in `{htmltools}` v0.5.1.
    (#3395)

    !end-bullet!
-   !begin-bullet!
    Fixed #2666 and #2670: `nearPoints()` and `brushedPoints()` weren't
    properly account for missing values (#2666 was introduced in
    v1.4.0). (#2668)

    !end-bullet!
-   !begin-bullet!
    Closed #3374: `quoToFunction()` now works correctly with nested
    quosures; and as a result, quasi-quotation with rendering function
    (e.g., `renderPrint()`, `renderPlot()`, etc) now works as expected
    with nested quosures. (#3373)

    !end-bullet!
-   !begin-bullet!
    Exported `register_devmode_option()`. This method was described in
    the documentation for `devmode()` but was never exported. See
    `?devmode()` for more details on how to register Shiny Developer
    options using `register_devmode_option()`. (#3364)

    !end-bullet!
-   !begin-bullet!
    Closed #3484: In the RStudio IDE on Mac 11.5, selected checkboxes
    and radio buttons were not visible. (#3485)

    !end-bullet!

!end-bullets-29!

### Library updates

!begin-bullets-30!

-   !begin-bullet!
    Closed #3286: Updated to Font-Awesome 5.15.2. (#3288)

    !end-bullet!
-   !begin-bullet!
    Updated to jQuery 3.6.0. (#3311)

    !end-bullet!

!end-bullets-30!

# shiny 1.6.0

This release focuses on improvements in three main areas:

1.  Better theming (and Bootstrap 4) support:

!begin-bullets-31!

-   !begin-bullet!
    The `theme` argument of `fluidPage()`, `navbarPage()`, and
    `bootstrapPage()` all now understand `bslib::bs_theme()` objects,
    which can be used to opt-into Bootstrap 4, use any Bootswatch theme,
    and/or implement custom themes without writing any CSS.
    !end-bullet!
-   !begin-bullet!
    The `session` object now includes `$setCurrentTheme()` and
    `$getCurrentTheme()` methods to dynamically update (or obtain) the
    page's `theme` after initial load, which is useful for things such
    as adding a dark mode switch to an app or some other "real-time"
    theming tool like `bslib::bs_themer()`.
    !end-bullet!
-   !begin-bullet!
    For more details, see `{bslib}`'s website
    !end-bullet!

!end-bullets-31!

2.  Caching of `reactive()` and `render*()` (e.g. `renderText()`,
    `renderTable()`, etc) expressions.

!begin-bullets-32!

-   !begin-bullet!
    Such expressions automatically cache their *most recent value*,
    which helps to avoid redundant computation within a single "flush"
    of reactivity. The new `bindCache()` function can be used to cache
    *all previous values* (as long as they fit in the cache). This cache
    may be optionally scoped within and/or across user sessions,
    possibly leading to huge performance gains, especially when deployed
    at scale across user sessions.
    !end-bullet!
-   !begin-bullet!
    For more details, see `help(bindCache, package = "shiny")`
    !end-bullet!

!end-bullets-32!

3.  Various improvements to accessibility for screen-reader and keyboard
    users.

!begin-bullets-33!

-   !begin-bullet!
    For more details, see the accessibility section below.
    !end-bullet!

!end-bullets-33!

## Full changelog

### Breaking changes

!begin-bullets-34!

-   !begin-bullet!
    Closed #3074: Shiny no longer supports file uploads for Internet
    Explorer 8 or 9. (#3075)

    !end-bullet!
-   !begin-bullet!
    Subtle changes, and some soft-deprecations, have come to
    `freezeReactiveValue` and `freezeReactiveVal` (#3055). These
    functions have been fragile at best in previous releases (issues
    #1791, #2463, #2946). In this release, we've solved all the problems
    we know about with `freezeReactiveValue(input, "x")`, by 1)
    invalidating `input$x` and set it to `NULL` whenever we freeze,
    and 2) ensuring that, after a freeze, even if the effect of
    `renderUI` or `updateXXXInput` is to set `input$x` to the same value
    it already has, this will result in an invalidation (whereas by
    default, Shiny filters out such spurious assignments).

    Similar problems may exist when using `freezeReactiveVal`, and when
    using `freezeReactiveValue` with non-`input` reactive values
    objects. But support for those was added mostly for symmetry with
    `freezeReactiveValue(input)`, and given the above issues, it's not
    clear to us how you could have used these successfully in the past,
    or why you would even want to. For this release, we're
    soft-deprecating both of those uses, but we're more than willing to
    un-deprecate if it turns out people are using these; if that
    includes you, please join the conversation at
    https://github.com/rstudio/shiny/issues/3063. In the meantime, you
    can squelch the deprecation messages for these functions
    specifically, by setting
    `options(shiny.deprecation.messages.freeze = FALSE)`.

    !end-bullet!

!end-bullets-34!

### Accessibility

!begin-bullets-35!

-   !begin-bullet!
    Added bootstrap accessibility plugin under the hood to improve
    accessibility of shiny apps for screen-reader and keyboard users:
    the enhancements include better navigations for alert, tooltip,
    popover, modal dialog, dropdown, tab Panel, collapse, and carousel
    elements. (#2911)

    !end-bullet!
-   !begin-bullet!
    Closed #2987: Improved accessibility of "live regions" -- namely,
    `*Output()` bindings and `update*Input()`. (#3042)

    !end-bullet!
-   !begin-bullet!
    Added appropriate labels to `icon()` element to provide
    screen-reader users with alternative descriptions for the
    `fontawesome` and `glyphicon`: `aria-label` is automatically applied
    based on the fontawesome name. For example, `icon("calendar")` will
    be announced as "calendar icon" to screen readers. "presentation"
    aria role has also been attached to `icon()` to remove redundant
    semantic info for screen readers. (#2917)

    !end-bullet!
-   !begin-bullet!
    Closed #2929: Fixed keyboard accessibility for file picker button:
    keyboard users can now tab to focus on `fileInput()` widget. (#2937)

    !end-bullet!
-   !begin-bullet!
    Fixed #2951: screen readers correctly announce labels and date
    formats for `dateInput()` and `dateRangeInput()` widgets. (#2978)

    !end-bullet!
-   !begin-bullet!
    Closed #2847: `selectInput()` is reasonably accessible for screen
    readers even when `selectize` option is set to TRUE. To improve
    `selectize.js` accessibility, we have added selectize-plugin-a11y by
    default. (#2993)

    !end-bullet!
-   !begin-bullet!
    Closed #612: Added `alt` argument to `renderPlot()` and
    `renderCachedPlot()` to specify descriptive texts for `plotOutput()`
    objects, which is essential for screen readers. By default, alt text
    is set to the static text, "Plot object," but even dynamic text can
    be made with reactive function. (#3006, thanks @trafficonese and
    @leonawicz for the original PR and discussion via #2494)

    !end-bullet!
-   !begin-bullet!
    Added semantic landmarks for `mainPanel()` and `sidebarPanel()` so
    that assistive technologies can recognize them as "main" and
    "complementary" region respectively. (#3009)

    !end-bullet!
-   !begin-bullet!
    Closed #2844: Added `lang` argument to ui `*Page()` functions (e.g.,
    `fluidPage`, `bootstrapPage`) that specifies document-level language
    within the app for the accessibility of screen readers and
    search-engine parsers. By default, it is set to empty string which
    is commonly recognized as a browser's default locale. (#2920)

    !end-bullet!
-   !begin-bullet!
    Improved accessibility for `radioButtons()` and
    `checkboxGroupInput()`: All options are now grouped together
    semantically for assistive technologies. (thanks @jooyoungseo,
    #3187).

    !end-bullet!

!end-bullets-35!

### Minor new features and improvements

!begin-bullets-36!

-   !begin-bullet!
    Added support for Shiny Developer Mode. Developer Mode enables a
    number of `options()` to make a developer's life easier, like
    enabling non-minified JS and printing messages about deprecated
    functions and options. See `?devmode()` for more details. (#3174)

    !end-bullet!
-   !begin-bullet!
    New `reactiveConsole()` makes it easier to interactively experiment
    with reactivity at the console (#2518).

    !end-bullet!
-   !begin-bullet!
    When UI is specified as a function
    (e.g. `ui <- function(req) { ... }`), the response can now be an
    HTTP response as returned from the (newly exported) `httpResponse()`
    function. (#2970)

    !end-bullet!
-   !begin-bullet!
    `selectInput` and `selectizeInput` now warn about performance
    implications when thousands of choices are used, and recommend
    server-side selectize be used instead. (#2959)

    !end-bullet!
-   !begin-bullet!
    Closed #2980: `addResourcePath()` now allows paths with a leading
    `.` (thanks to @ColinFay). (#2981)

    !end-bullet!
-   !begin-bullet!
    Closed #2972: `runExample()` now supports the `shiny.port` option
    (thanks to @ColinFay). (#2982)

    !end-bullet!
-   !begin-bullet!
    Closed #2692: `downloadButton()` icon can now be changed via the
    `icon` parameter (thanks to @ColinFay). (#3010)

    !end-bullet!
-   !begin-bullet!
    Closed #2984: improved documentation for `renderCachedPlot()`
    (thanks to @aalucaci). (#3016)

    !end-bullet!
-   !begin-bullet!
    `reactiveValuesToList()` will save its `reactlog` label as
    `reactiveValuesToList(<ID>)` vs `as.list(<ID>)` (#3017)

    !end-bullet!
-   !begin-bullet!
    Removed unused (and non-exported) `cacheContext` class.

    !end-bullet!
-   !begin-bullet!
    `testServer()` can accept a single server function as input (#2965).

    !end-bullet!
-   !begin-bullet!
    `shinyOptions()` now has session-level scoping, in addition to
    global and application-level scoping. (#3080)

    !end-bullet!
-   !begin-bullet!
    `runApp()` now warns when running an application in an R package
    directory. (#3114)

    !end-bullet!
-   !begin-bullet!
    Shiny now uses `cache_mem` from the cachem package, instead of
    `memoryCache` and `diskCache`. (#3118)

    !end-bullet!
-   !begin-bullet!
    Closed #3140: Added support for `...` argument in `icon()`. (#3143)

    !end-bullet!
-   !begin-bullet!
    Closed #629: All `update*` functions now have a default value for
    `session`, and issue an informative warning if it is missing.
    (#3195, #3199)

    !end-bullet!
-   !begin-bullet!
    Improved error messages when reading reactive values outside of a
    reactive domain (e.g., `reactiveVal()()`). (#3007)

    !end-bullet!

!end-bullets-36!

### Bug fixes

!begin-bullets-37!

-   !begin-bullet!
    Fixed #1942: Calling `runApp("app.R")` no longer ignores options
    passed into `shinyApp()`. This makes it possible for Shiny apps to
    specify what port/host should be used by default. (#2969)

    !end-bullet!
-   !begin-bullet!
    Fixed #3033: When a `DiskCache` was created with both `max_n` and
    `max_size`, too many items could get pruned when `prune()` was
    called. (#3034)

    !end-bullet!
-   !begin-bullet!
    Fixed #2703: Fixed numerous issues with some combinations of
    `min`/`value`/`max` causing issues with `date[Range]Input()` and
    `updateDate[Range]Input()`. (#3038, #3201)

    !end-bullet!
-   !begin-bullet!
    Fixed #2936: `dateYMD` was giving a warning when passed a vector of
    dates from `dateInput` which was greater than length 1. The length
    check was removed because it was not needed. (#3061)

    !end-bullet!
-   !begin-bullet!
    Fixed #2266, #2688: `radioButtons` and `updateRadioButtons` now
    accept `character(0)` to indicate that none of the options should be
    selected (thanks to @ColinFay). (#3043)

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that `textAreaInput()` doesn't work as expected for
    relative `width` (thanks to @shrektan). (#2049)

    !end-bullet!
-   !begin-bullet!
    Fixed #2859: `renderPlot()` wasn't correctly setting
    `showtext::showtext_opts()`'s `dpi` setting with the correct
    resolution on high resolution displays; which means, if the font was
    rendered by showtext, font sizes would look smaller than they should
    on such displays. (#2941)

    !end-bullet!
-   !begin-bullet!
    Closed #2910, #2909, #1552: `sliderInput()` warns if the `value` is
    outside of `min` and `max`, and errors if `value` is `NULL` or `NA`.
    (#3194)

    !end-bullet!

!end-bullets-37!

### Library updates

!begin-bullets-38!

-   !begin-bullet!
    Removed html5shiv and respond.js, which were used for IE 8 and IE 9
    compatibility. (#2973)

    !end-bullet!
-   !begin-bullet!
    Removed es5-shim library, which was internally used within
    `selectInput()` for ECMAScript 5 compatibility. (#2993)

    !end-bullet!

!end-bullets-38!

# shiny 1.5.0

## Full changelog

### Breaking changes

!begin-bullets-39!

-   !begin-bullet!
    Fixed #2869: Until this release, `renderImage()` had a dangerous
    default of `deleteFile = TRUE`. (Sorry!) Going forward, calls to
    `renderImage()` will need an explicit `deleteFile` argument; for
    now, failing to provide one will result in a warning message, and
    the file will be deleted if it appears to be within the `tempdir()`.
    (#2881)
    !end-bullet!

!end-bullets-39!

### New features

!begin-bullets-40!

-   !begin-bullet!
    The new `shinyAppTemplate()` function creates a new template Shiny
    application, where components are optional, such as helper files in
    an R/ subdirectory, a module, and various kinds of tests. (#2704)

    !end-bullet!
-   !begin-bullet!
    `runTests()` is a new function that behaves much like R CMD check.
    `runTests()` invokes all of the top-level R files in the tests/
    directory inside an application, in that application's environment.
    (#2585)

    !end-bullet!
-   !begin-bullet!
    `testServer()` is a new function for testing reactive behavior
    inside server functions and modules. (#2682, #2764, #2807)

    !end-bullet!
-   !begin-bullet!
    The new `moduleServer` function provides a simpler interface for
    creating and using modules. (#2773)

    !end-bullet!
-   !begin-bullet!
    Resolved #2732: `markdown()` is a new function for writing Markdown
    with Github extensions directly in Shiny UIs. Markdown rendering is
    performed by the commonmark package. (#2737)

    !end-bullet!
-   !begin-bullet!
    The `getCurrentOutputInfo()` function can now return the background
    color (`bg`), foreground color (`fg`), `accent` (i.e., hyperlink)
    color, and `font` information of the output's HTML container. This
    information is reported by `plotOutput()`, `imageOutput()`, and any
    other output bindings containing a class of `.shiny-report-theme`.
    This feature allows developers to style an output's contents based
    on the container's CSS styling. (#2740)

    !end-bullet!

!end-bullets-40!

### Minor new features and improvements

!begin-bullets-41!

-   !begin-bullet!
    Fixed #2042, #2628: In a `dateInput` and `dateRangeInput`, disabled
    months and years are now a lighter gray, to make it easier to see
    that they are disabled. (#2690)

    !end-bullet!
-   !begin-bullet!
    `getCurrentOutputInfo()` previously threw an error when called from
    outside of an output; now it returns `NULL`. (#2707 and #2858)

    !end-bullet!
-   !begin-bullet!
    Added a label to observer that auto-reloads `R/` directory to avoid
    confusion when using `reactlog`. (#58)

    !end-bullet!
-   !begin-bullet!
    `getDefaultReactiveDomain()` can now be called inside a
    `session$onSessionEnded` callback and will return the calling
    `session` information. (#2757)

    !end-bullet!
-   !begin-bullet!
    Added a `'function'` class to `reactive()` and `reactiveVal()`
    objects. (#2793)

    !end-bullet!
-   !begin-bullet!
    Added a new option (`type = "hidden"`) to `tabsetPanel()`, making it
    easier to set the active tab via other input controls (e.g.,
    `radioButtons()`) rather than tabs or pills. Use this option in
    conjunction with `updateTabsetPanel()` and the new
    `tabsetPanelBody()` function (see `help(tabsetPanel)` for an example
    and more details). (#2814)

    !end-bullet!
-   !begin-bullet!
    Added function `updateActionLink()` to update an `actionLink()`
    label and/or icon value. (#2811)

    !end-bullet!
-   !begin-bullet!
    Fixed #2856: Bumped jQuery 3 from 3.4.1 to 3.5.1. (#2857)

    !end-bullet!

!end-bullets-41!

### Bug fixes

!begin-bullets-42!

-   !begin-bullet!
    Fixed #2606: `debounce()` would not work properly if the code in the
    reactive expression threw an error on the first run. (#2652)

    !end-bullet!
-   !begin-bullet!
    Fixed #2653: The `dataTableOutput()` could have incorrect output if
    certain characters were in the column names. (#2658)

    !end-bullet!

!end-bullets-42!

### Documentation Updates

### Library updates

!begin-bullets-43!

-   !begin-bullet!
    Updated from Font-Awesome 5.3.1 to 5.13.0, which includes icons
    related to COVID-19. For upgrade notes, see
    https://github.com/FortAwesome/Font-Awesome/blob/master/UPGRADING.md.
    (#2891)
    !end-bullet!

!end-bullets-43!

# shiny 1.4.0.2

Minor patch release: fixed some timing-dependent tests failed
intermittently on CRAN build machines.

# shiny 1.4.0.1

Minor patch release to account for changes to the grid package that will
be upcoming in the R 4.0 release (#2776).

# shiny 1.4.0

## Full changelog

### Breaking changes

!begin-bullets-44!

-   !begin-bullet!
    Resolved #2554: Upgraded jQuery from v.1.12.4 to v3.4.1 and
    bootstrap from v3.3.7 to v3.4.1. (#2557). Since the jQuery upgrade
    may introduce breaking changes to user code, there is an option to
    switch back to the old version by setting
    `options(shiny.jquery.version = 1)`. If you've hard-coded
    `shared/jquery[.min].js` in the HTML of your Shiny app, in order to
    downgrade, you'll have to change that filepath to
    `shared/legacy/jquery[.min].js`.
    !end-bullet!

!end-bullets-44!

### Improvements

!begin-bullets-45!

-   !begin-bullet!
    Resolved #1433: `plotOutput()`'s coordmap info now includes discrete
    axis limits for **ggplot2** plots. As a result, any **shinytest**
    tests that contain **ggplot2** plots with discrete axes (that were
    recorded before this change) will now report differences that can
    safely be updated. This new coordmap info was added to correctly
    infer what data points are within an input brush and/or near input
    click/hover in scenarios where a non-trivial discrete axis scale is
    involved (e.g., whenever `scale_[x/y]_discrete(limits = ...)` and/or
    free scales across multiple discrete axes are used). (#2410)

    !end-bullet!
-   !begin-bullet!
    Resolved #2402: An informative warning is now thrown for
    mis-specified (date) strings in `dateInput()`, `updateDateInput()`,
    `dateRangeInput()`, and `updateDateRangeInput()`. (#2403)

    !end-bullet!
-   !begin-bullet!
    If the `shiny.autoload.r` option is set to `TRUE`, all files ending
    in `.r` or `.R` contained in a directory named `R/` adjacent to your
    application are sourced when your app is started. This will become
    the default Shiny behavior in a future release (#2547)

    !end-bullet!
-   !begin-bullet!
    Resolved #2442: The `shiny:inputchanged` JavaScript event now
    triggers on the related input element instead of `document`.
    Existing event listeners bound to `document` will still detect the
    event due to event bubbling. (#2446)

    !end-bullet!
-   !begin-bullet!
    Fixed #1393, #2223: For plots with any interactions enabled, the
    image is no longer draggable. (#2460)

    !end-bullet!
-   !begin-bullet!
    Resolved #2469: `renderText` now takes a `sep` argument that is
    passed to `cat`. (#2497)

    !end-bullet!
-   !begin-bullet!
    Added `resourcePaths()` and `removeResourcePaths()` functions.
    (#2459)

    !end-bullet!
-   !begin-bullet!
    Resolved #2433: An informative warning is now thrown if
    subdirectories of the app's `www/` directory are masked by other
    resource prefixes and/or the same resource prefix is mapped to
    different local file paths. (#2434)

    !end-bullet!
-   !begin-bullet!
    Resolved #2478: `cmd + shift + f3` and `ctrl + shift + f3` can now
    be used to add a reactlog mark. If reactlog keybindings are used and
    the reactlog is not enabled, an error page is displayed showing how
    to enable reactlog recordings. (#2560)

    !end-bullet!

!end-bullets-45!

### Bug fixes

!begin-bullets-46!

-   !begin-bullet!
    Partially resolved #2423: Reactivity in Shiny leaked some memory,
    because R can leak memory whenever a new symbols is interned, which
    happens whenever a new name/key is used in an environment. R now
    uses the fastmap package, which avoids this problem. (#2429)

    !end-bullet!
-   !begin-bullet!
    Fixed #2267: Fixed a memory leak with `invalidateLater`. (#2555)

    !end-bullet!
-   !begin-bullet!
    Fixed #1548: The `reactivePoll` function leaked an observer; that is
    the observer would continue to exist even if the `reactivePoll`
    object was no longer accessible. #2522

    !end-bullet!
-   !begin-bullet!
    Fixed #2116: Fixed an issue where dynamic tabs could not be added
    when on a hosted platform. (#2545)

    !end-bullet!
-   !begin-bullet!
    Resolved #2515: `selectInput()` and `selectizeInput()` now deal
    appropriately with named factors. Note that `updateSelectInput()`
    and `updateSelectizeInput()` **do not** yet handle factors; their
    behavior is unchanged. (#2524, #2540, #2625)

    !end-bullet!
-   !begin-bullet!
    Resolved #2471: Large file uploads to a Windows computer were slow.
    (#2579)

    !end-bullet!
-   !begin-bullet!
    Fixed #2387: Updating a `sliderInput()`'s type from numeric to date
    no longer changes the rate policy from debounced to immediate. More
    generally, updating an input binding with a new type should (no
    longer) incorrectly alter the input rate policy. (#2404)

    !end-bullet!
-   !begin-bullet!
    Fixed #868: If an input is initialized with a `NULL` label, it can
    now be updated with a string. Moreover, if an input label is
    initialized with a string, it can now be removed by updating with
    `label=character(0)` (similar to how `choices` and `selected` can be
    cleared in `updateSelectInput()`). (#2406)

    !end-bullet!
-   !begin-bullet!
    Fixed #2250: `updateSliderInput()` now works with un-specified (or
    zero-length) `min`, `max`, and `value`. (#2416)

    !end-bullet!
-   !begin-bullet!
    Fixed #2396: `selectInput("myID", ...)` resulting in an extra
    `myID-selectized` input (introduced in v1.2.0). (#2418)

    !end-bullet!
-   !begin-bullet!
    Fixed #2233: `verbatimTextOutput()` produced wrapped text on Safari,
    but the text should not be wrapped. (#2353)

    !end-bullet!
-   !begin-bullet!
    Fixed #2335: When `dateInput()`'s `value` was unspecified, and `max`
    and/or `min` was set to `Sys.Date()`, the value was not being set
    properly. (#2526)

    !end-bullet!
-   !begin-bullet!
    Fixed #2591: Providing malformed date-strings to `min` or `max` no
    longer results in JS errors for `dateInput()` and
    `dateRangeInput()`. (#2592)

    !end-bullet!
-   !begin-bullet!
    Fixed rstudio/reactlog#36: Changes to reactive values not displaying
    accurately in reactlog. (#2424)

    !end-bullet!
-   !begin-bullet!
    Fixed #2598: Showcase files don't appear with a wide window. (#2582)

    !end-bullet!
-   !begin-bullet!
    Fixed #2329, #1817: These bugs were reported as fixed in Shiny 1.3.0
    but were not actually fixed because some JavaScript changes were
    accidentally not included in the release. The fix resolves issues
    that occur when `withProgressBar()` or bookmarking are combined with
    the networkD3 package's Sankey plot.

    !end-bullet!

!end-bullets-46!

# shiny 1.3.2

### Bug fixes

!begin-bullets-47!

-   !begin-bullet!
    Fixed #2385: Static CSS/JS resources in subapps in R Markdown
    documents did not render properly. (#2386)

    !end-bullet!
-   !begin-bullet!
    Fixed #2280: Shiny applications that used a www/index.html file did
    not serve up the index file. (#2382)

    !end-bullet!

!end-bullets-47!

# shiny 1.3.1

## Full changelog

### Bug fixes

!begin-bullets-48!

-   !begin-bullet!
    Fixed a performance issue introduced in v1.3.0 when using large
    nested lists within Shiny. (#2377)
    !end-bullet!

!end-bullets-48!

# shiny 1.3.0

## Full changelog

### Breaking changes

### New features

!begin-bullets-49!

-   !begin-bullet!
    Revamped Shiny's reactlog viewer which debugs reactivity within a
    shiny application. This allows users to traverse the reactivity
    history of a shiny application, filter to the dependency tree of a
    selected reactive object, and search for matching reactive objects.
    See `?reactlogShow` for more details and how to enable this feature.
    (#2107)

    !end-bullet!
-   !begin-bullet!
    Shiny now serves static files on a background thread. This means
    that things like JavaScript and CSS assets can be served without
    blocking or being blocked by the main R thread, and should result in
    significantly better performance for heavily loaded servers. (#2280)

    !end-bullet!

!end-bullets-49!

### Minor new features and improvements

!begin-bullets-50!

-   !begin-bullet!
    The `Shiny-Shared-Secret` security header is now checked using
    constant-time comparison to prevent timing attacks (thanks
    @dirkschumacher!). (#2319)
    !end-bullet!

!end-bullets-50!

### Bug fixes

!begin-bullets-51!

-   !begin-bullet!
    Fixed #2245: `updateSelectizeInput()` did not update labels. (#2248)

    !end-bullet!
-   !begin-bullet!
    Fixed #2308: When restoring a bookmarked application, inputs with a
    leading `.` would not be restored. (#2311)

    !end-bullet!
-   !begin-bullet!
    Fixed #2305, #2322, #2351: When an input in dynamic UI is restored
    from bookmarks, it would keep getting set to the same value. (#2360)

    !end-bullet!
-   !begin-bullet!
    Fixed #2349, #2329, #1817: These were various bugs triggered by the
    presence of the networkD3 package's Sankey plot in an app. Impacted
    features included `dateRangeInput`, `withProgressBar`, and
    bookmarking (#2359)

    !end-bullet!

!end-bullets-51!

### Documentation Updates

!begin-bullets-52!

-   !begin-bullet!
    Fixed #2247: `renderCachedPlot` now supports using promises for
    either `expr` or `cacheKeyExpr`. (Shiny v1.2.0 supported async
    `expr`, but only if `cacheKeyExpr` was async as well; now you can
    use any combination of sync/async for `expr` and `cacheKeyExpr`.)
    #2261
    !end-bullet!

!end-bullets-52!

# shiny 1.2.0

This release features plot caching, an important new tool for improving
performance and scalability. Using `renderCachedPlot` in place of
`renderPlot` can greatly improve responsiveness for apps that show the
same plot many times (for example, a dashboard or report where all users
view the same data). Shiny gives you a fair amount of control in where
the cache is stored and how cached plots are invalidated, so be sure to
read this article to get the most out of this feature.

## Full changelog

### Breaking changes

!begin-bullets-53!

-   !begin-bullet!
    The URL paths for FontAwesome CSS/JS/font assets have changed, due
    to our upgrade from FontAwesome 4 to 5. This shouldn't affect you
    unless you're using `www/index.html` to provide your UI and have
    hardcoded the old FontAwesome paths into your HTML. If that's you,
    consider switching to HTML templates, which give you the syntax of
    raw HTML while still taking advantage of Shiny's automatic
    management of web dependencies.
    !end-bullet!

!end-bullets-53!

### New features

!begin-bullets-54!

-   !begin-bullet!
    Added `renderCachedPlot()`, which stores plots in a cache so that
    they can be served up almost instantly. (#1997)
    !end-bullet!

!end-bullets-54!

### Minor new features and improvements

!begin-bullets-55!

-   !begin-bullet!
    Upgrade FontAwesome from 4.7.0 to 5.3.1 and made `icon` tags
    browsable, which means they will display in a web browser or RStudio
    viewer by default (#2186). Note that if your application or library
    depends on FontAwesome directly using custom CSS, you may need to
    make some or all of the changes recommended in Upgrade from Version
    4. Font Awesome icons can also now be used in static R Markdown
    documents.

    !end-bullet!
-   !begin-bullet!
    Address #174: Added `datesdisabled` and `daysofweekdisabled` as new
    parameters to `dateInput()`. This resolves #174 and exposes the
    underlying arguments of Bootstrap Datepicker. `datesdisabled`
    expects a character vector with values in `yyyy/mm/dd` format and
    `daysofweekdisabled` expects an integer vector with day interger ids
    (Sunday=0, Saturday=6). The default value for both is `NULL`, which
    leaves all days selectable. Thanks, @nathancday! (#2147)

    !end-bullet!
-   !begin-bullet!
    Support for selecting variables of a data frame with the output
    values to be used within tidy evaluation. Added functions:
    `varSelectInput`, `varSelectizeInput`, `updateVarSelectInput`,
    `updateVarSelectizeInput`. (#2091)

    !end-bullet!
-   !begin-bullet!
    Addressed #2042: dates outside of `min`/`max` date range are now a
    lighter shade of grey to highlight the allowed range. (#2087)

    !end-bullet!
-   !begin-bullet!
    Added support for plot interaction when the plot is scaled. (#2125)

    !end-bullet!
-   !begin-bullet!
    Fixed #1933: extended server-side selectize to lists and optgroups.
    (#2102)

    !end-bullet!
-   !begin-bullet!
    Added namespace support when freezing reactiveValue keys. #2080

    !end-bullet!
-   !begin-bullet!
    Upgrade selectize.js from 0.12.1 to 0.12.4 #2028

    !end-bullet!
-   !begin-bullet!
    Addressed #2079: Added `coords_img`, `coords_css`, and
    `img_css_ratio` fields containing x and y location information for
    plot brush, hover, and click events. #2183

    !end-bullet!

!end-bullets-55!

### Bug fixes

!begin-bullets-56!

-   !begin-bullet!
    Fixed #2033: RStudio Viewer window not closed on `shiny::stopApp()`.
    Thanks, @vnijs! #2047

    !end-bullet!
-   !begin-bullet!
    Fixed #1935: correctly returns plot coordinates when using outer
    margins. (#2108)

    !end-bullet!
-   !begin-bullet!
    Resolved #2019: `updateSliderInput` now changes the slider
    formatting if the input type changes. (#2099)

    !end-bullet!
-   !begin-bullet!
    Fixed #2138: Inputs that are part of a `renderUI` were no longer
    restoring correctly from bookmarked state. #2139

    !end-bullet!
-   !begin-bullet!
    The `knit_print` methods from htmltools are no longer imported into
    shiny and then exported. Also, shiny's `knit_print` methods are no
    longer exported. #2166

    !end-bullet!
-   !begin-bullet!
    Fixed #2093: Make sure bookmark scope directory does not exist
    before trying to create it. #2168

    !end-bullet!
-   !begin-bullet!
    Fixed #2177: The session name is now being recorded when exiting a
    context. Multiple sessions can now view their respective reactlogs.
    #2180

    !end-bullet!
-   !begin-bullet!
    Fixed #2162: `selectInput` was sending spurious duplicate values to
    the server when using backspace. Thanks, @sada1993! #2187

    !end-bullet!
-   !begin-bullet!
    Fixed #2142: Dropping files on `fileInput`s stopped working on
    recent releases of Firefox. Thanks @dmenne for reporting! #2203

    !end-bullet!
-   !begin-bullet!
    Fixed #2204: `updateDateInput` could set the wrong date on days
    where DST begins. (Thanks @GaGaMan1101!) #2212

    !end-bullet!
-   !begin-bullet!
    Fixed #2225: Input event queue can stall in apps that use async.
    #2226

    !end-bullet!
-   !begin-bullet!
    Fixed #2228: `reactiveTimer` fails when not owned by a session.
    Thanks, @P-Bettega! #2229

    !end-bullet!

!end-bullets-56!

### Documentation Updates

!begin-bullets-57!

-   !begin-bullet!
    Addressed #1864 by changing `optgroup` documentation to use `list`
    instead of `c`. (#2084)
    !end-bullet!

!end-bullets-57!

# shiny 1.1.0

This is a significant release for Shiny, with a major new feature that
was nearly a year in the making: support for asynchronous operations!
Until now, R's single-threaded nature meant that performing long-running
calculations or tasks from Shiny would bring your app to a halt for
other users of that process. This release of Shiny deeply integrates the
promises package to allow you to execute some tasks asynchronously,
including as part of reactive expressions and outputs. See the promises
documentation to learn more.

## Full changelog

### Breaking changes

!begin-bullets-58!

-   !begin-bullet!
    `extractStackTrace` and `formatStackTrace` are deprecated and will
    be removed in a future version of Shiny. As far as we can tell,
    nobody has been using these functions, and a refactor has made them
    vestigial; if you need this functionality, please file an issue.
    !end-bullet!

!end-bullets-58!

### New features

!begin-bullets-59!

-   !begin-bullet!
    Support for asynchronous operations! Built-in render functions that
    expected a certain kind of object to be yielded from their `expr`,
    now generally can handle a promise for that kind of object. Reactive
    expressions and observers are now promise-aware as well. (#1932)

    !end-bullet!
-   !begin-bullet!
    Introduced two changes to the (undocumented but widely used)
    JavaScript function `Shiny.onInputChange(name, value)`. First, we
    changed the function name to `Shiny.setInputValue` (but don't
    worry--the old function name will continue to work). Second, until
    now, all calls to `Shiny.onInputChange(inputId, value)` have been
    "deduplicated"; that is, anytime an input is set to the same value
    it already has, the set is ignored. With Shiny v1.1, you can now add
    an options object as the third parameter:
    `Shiny.setInputValue("name", value, {priority: "event"})`. When the
    priority option is set to `"event"`, Shiny will always send the
    value and trigger reactivity, whether it is a duplicate or not. This
    closes #928, which was the most upvoted open issue by far! Thanks,
    @daattali. (#2018)

    !end-bullet!

!end-bullets-59!

### Minor new features and improvements

!begin-bullets-60!

-   !begin-bullet!
    Addressed #1978: `shiny:value` is now triggered when duplicate
    output data is received from the server. (Thanks, @andrewsali!
    #1999)

    !end-bullet!
-   !begin-bullet!
    If a shiny output contains a css class of `shiny-report-size`, its
    container height and width are now reported in `session$clientData`.
    So, for an output with an id with `"myID"`, the height/width can be
    accessed via
    `session$clientData[['output_myID_height']]`/`session$clientData[['output_myID_width']]`.
    Addresses #1980. (Thanks, @cpsievert! #1981)

    !end-bullet!
-   !begin-bullet!
    Added a new `autoclose = TRUE` parameter to `dateInput()` and
    `dateRangeInput()`. This closed #1969 which was a duplicate of much
    older issue, #173. The default value is `TRUE` since that seems to
    be the common use case. However, this will cause existing apps with
    date inputs (that update to this version of Shiny) to have the
    datepicker be immediately closed once a date is selected. For most
    apps, this is actually desired behavior; if you wish to keep the
    datepicker open until the user clicks out of it use
    `autoclose = FALSE`. (#1987)

    !end-bullet!
-   !begin-bullet!
    The version of Shiny is now accessible from Javascript, with
    `Shiny.version`. There is also a new function for comparing version
    strings, `Shiny.compareVersion()`. (#1826, #1830)

    !end-bullet!
-   !begin-bullet!
    Addressed #1851: Stack traces are now smaller in some places
    `do.call()` is used. (#1856)

    !end-bullet!
-   !begin-bullet!
    Stack traces have been improved, with more aggressive de-noising and
    support for deep stack traces (stitching together multiple stack
    traces that are conceptually part of the same async operation).

    !end-bullet!
-   !begin-bullet!
    Addressed #1859: Server-side selectize is now significantly faster.
    (Thanks to @dselivanov #1861)

    !end-bullet!
-   !begin-bullet!
    #1989: The server side of outputs can now be removed
    (e.g. `output$plot <- NULL`). This is not usually necessary but it
    does allow some objects to be garbage collected, which might matter
    if you are dynamically creating and destroying many outputs.
    (Thanks, @mmuurr! #2011)

    !end-bullet!
-   !begin-bullet!
    Removed the (ridiculously outdated) "experimental feature" tag from
    the reference documentation for `renderUI`. (#2036)

    !end-bullet!
-   !begin-bullet!
    Addressed #1907: the `ignoreInit` argument was first added only to
    `observeEvent`. Later, we also added it to `eventReactive`, but
    forgot to update the documentation. Now done, thanks @flo12392!
    (#2036)

    !end-bullet!

!end-bullets-60!

### Bug fixes

!begin-bullets-61!

-   !begin-bullet!
    Fixed #1006: Slider inputs sometimes showed too many digits. (#1956)

    !end-bullet!
-   !begin-bullet!
    Fixed #1958: Slider inputs previously displayed commas after a
    decimal point. (#1960)

    !end-bullet!
-   !begin-bullet!
    The internal `URLdecode()` function previously was a copy of
    `httpuv::decodeURIComponent()`, assigned at build time; now it
    invokes the httpuv function at run time.

    !end-bullet!
-   !begin-bullet!
    Fixed #1840: with the release of Shiny 1.0.5, we accidently changed
    the relative positioning of the icon and the title text in
    `navbarMenu`s and `tabPanel`s. This fix reverts this behavior back
    (i.e. the icon should be to the left of the text and/or the downward
    arrow in case of `navbarMenu`s). (#1848)

    !end-bullet!
-   !begin-bullet!
    Fixed #1600: URL-encoded bookmarking did not work with sliders that
    had dates or date-times. (#1961)

    !end-bullet!
-   !begin-bullet!
    Fixed #1962: File dragging and dropping broke in the presence of
    jQuery version 3.0 as introduced by the rhandsontable htmlwidget.
    (#2005)

    !end-bullet!
-   !begin-bullet!
    Improved the error handling inside the `addResourcePath()` function,
    to give end users more informative error messages when the
    `directoryPath` argument cannot be normalized. This is especially
    useful for `runtime: shiny_prerendered` Rmd documents, like `learnr`
    tutorials. (#1968)

    !end-bullet!
-   !begin-bullet!
    Changed script tags in reactlog (inst/www/reactive-graph.html) from
    HTTP to HTTPS in order to avoid mixed content blocking by most
    browsers. (Thanks, @jekriske-lilly! #1844)

    !end-bullet!
-   !begin-bullet!
    Addressed #1784: `runApp()` will avoid port 6697, which is
    considered unsafe by Chrome.

    !end-bullet!
-   !begin-bullet!
    Fixed #2000: Implicit calls to `xxxOutput` not working inside
    modules. (Thanks, @GregorDeCillia! #2010)

    !end-bullet!
-   !begin-bullet!
    Fixed #2021: Memory leak with `reactiveTimer` and `invalidateLater`.
    (#2022)

    !end-bullet!

!end-bullets-61!

### Library updates

!begin-bullets-62!

-   !begin-bullet!
    Updated to ion.rangeSlider 2.2.0. (#1955)
    !end-bullet!

!end-bullets-62!

## Known issues

In some rare cases, interrupting an application (by pressing Ctrl-C or
Esc) may result in the message
`Error in execCallbacks(timeoutSecs) : c++ exception (unknown reason)`.
Although this message sounds alarming, it is harmless, and will go away
in a future version of the later package (more information here).

# shiny 1.0.5

## Full changelog

### Bug fixes

!begin-bullets-63!

-   !begin-bullet!
    Fixed #1818: `conditionalPanel()` expressions that have a newline
    character in them caused the application to not work. (#1820)

    !end-bullet!
-   !begin-bullet!
    Added a safe wrapper function for internal calls to
    `jsonlite::fromJSON()`. (#1822)

    !end-bullet!
-   !begin-bullet!
    Fixed #1824: HTTP HEAD requests on static files caused the
    application to stop. (#1825)

    !end-bullet!

!end-bullets-63!

# shiny 1.0.4

There are three headlining features in this release of Shiny. It is now
possible to add and remove tabs from a `tabPanel`; there is a new
function, `onStop()`, which registers callbacks that execute when an
application exits; and `fileInput`s now can have files dragged and
dropped on them. In addition to these features, this release has a
number of minor features and bug fixes. See the full changelog below for
more details.

## Full changelog

### New features

!begin-bullets-64!

-   !begin-bullet!
    Implemented #1668: dynamic tabs: added functions (`insertTab`,
    `appendTab`, `prependTab`, `removeTab`, `showTab` and `hideTab`)
    that allow you to do those actions for an existing `tabsetPanel`.
    (#1794)

    !end-bullet!
-   !begin-bullet!
    Implemented #1213: Added a new function, `onStop()`, which can be
    used to register callback functions that are invoked when an
    application exits, or when a user session ends. (Multiple sessions
    can be connected to a single running Shiny application.) This is
    useful if you have finalization/clean-up code that should be run
    after the application exits. (#1770

    !end-bullet!
-   !begin-bullet!
    Implemented #1155: Files can now be drag-and-dropped on `fileInput`
    controls. The appearance of `fileInput` controls while files are
    being dragged can be modified by overriding the
    `shiny-file-input-active` and `shiny-file-input-over` classes.
    (#1782)

    !end-bullet!

!end-bullets-64!

### Minor new features and improvements

!begin-bullets-65!

-   !begin-bullet!
    Addressed #1688: trigger a new `shiny:outputinvalidated` event when
    an output gets invalidated, at the same time that the
    `recalculating` CSS class is added. (#1758, thanks @andrewsali!)

    !end-bullet!
-   !begin-bullet!
    Addressed #1508: `fileInput` now permits the same file to be
    uploaded multiple times. (#1719)

    !end-bullet!
-   !begin-bullet!
    Addressed #1501: The `fileInput` control now retains uploaded file
    extensions on the server. This fixes readxl's `readxl::read_excel`
    and other functions that must recognize a file's extension in order
    to work. (#1706)

    !end-bullet!
-   !begin-bullet!
    For `conditionalPanel`s, Shiny now gives more informative messages
    if there are errors evaluating or parsing the JavaScript conditional
    expression. (#1727)

    !end-bullet!
-   !begin-bullet!
    Addressed #1586: The `conditionalPanel` function now accepts an `ns`
    argument. The `ns` argument can be used in a module UI function to
    scope the `condition` expression to the module's own input and
    output IDs. (#1735)

    !end-bullet!
-   !begin-bullet!
    With `options(shiny.testmode=TRUE)`, the Shiny process will send a
    message to the client in response to a changed input, even if no
    outputs have changed. This helps to streamline testing using the
    shinytest package. (#1747)

    !end-bullet!
-   !begin-bullet!
    Addressed #1738: The `updateTextInput` and `updateTextAreaInput`
    functions can now update the placeholder. (#1742)

    !end-bullet!
-   !begin-bullet!
    Converted examples to single file apps, and made updates and
    enhancements to comments in the example app scripts. (#1685)

    !end-bullet!
-   !begin-bullet!
    Added new `snapshotPreprocessInput()` and
    `snapshotPreprocessOutput()` functions, which is used for
    preprocessing and input and output values before taking a test
    snapshot. (#1760, #1789)

    !end-bullet!
-   !begin-bullet!
    The HTML generated by `renderTable()` no longer includes comments
    with the R version, xtable version, and timestamp. (#1771)

    !end-bullet!
-   !begin-bullet!
    Added a function `isRunning` to test whether a Shiny app is
    currently running. (#1785)

    !end-bullet!
-   !begin-bullet!
    Added a function `setSerializer`, which allows authors to specify a
    function for serializing the value of a custom input. (#1791)

    !end-bullet!

!end-bullets-65!

### Bug fixes

!begin-bullets-66!

-   !begin-bullet!
    Fixed #1546: make it possible (without any hacks) to write arbitrary
    data into a module's `session$userData` (which is exactly the same
    environment as the parent's `session$userData`). To be clear, it
    allows something like `session$userData$x <- TRUE`, but not
    something like `session$userData <- TRUE` (that is not allowed in
    any context, whether you're in the main app, or in a module)
    (#1732).

    !end-bullet!
-   !begin-bullet!
    Fixed #1701: There was a partial argument match in the
    `generateOptions` function. (#1702)

    !end-bullet!
-   !begin-bullet!
    Fixed #1710: `ReactiveVal` objects did not have separate dependents.
    (#1712)

    !end-bullet!
-   !begin-bullet!
    Fixed #1438: `unbindAll()` should not be called when inserting
    content with `insertUI()`. A previous fix (#1449) did not work
    correctly. (#1736)

    !end-bullet!
-   !begin-bullet!
    Fixed #1755: dynamic htmlwidgets sent the path of the package on the
    server to the client. (#1756)

    !end-bullet!
-   !begin-bullet!
    Fixed #1763: Shiny's private random stream leaked out into the main
    random stream. (#1768)

    !end-bullet!
-   !begin-bullet!
    Fixed #1680: `options(warn=2)` was not respected when running an
    app. (#1790)

    !end-bullet!
-   !begin-bullet!
    Fixed #1772: ensure that `runApp()` respects the
    `shinyApp(onStart = function())` argument. (#1770)

    !end-bullet!
-   !begin-bullet!
    Fixed #1474: A `browser()` call in an observer could cause an error
    in the RStudio IDE on Windows. (#1802)

    !end-bullet!

!end-bullets-66!

# shiny 1.0.3

This is a hotfix release of Shiny. With previous versions of Shiny, when
running an application on the newly-released version of R, 3.4.0, it
would print a message:
`Warning in body(fun) : argument is not a function`. This has no effect
on the application, but because the message could be alarming to users,
we are releasing a new version of Shiny that fixes this issue.

## Full changelog

### Bug fixes

!begin-bullets-67!

-   !begin-bullet!
    Fixed #1672: When an error occurred while uploading a file, the
    progress bar did not change colors. (#1673)

    !end-bullet!
-   !begin-bullet!
    Fixed #1676: On R 3.4.0, running a Shiny application gave a warning:
    `Warning in body(fun) : argument is not a function`. (#1677)

    !end-bullet!

!end-bullets-67!

# shiny 1.0.2

This is a hotfix release of Shiny. The primary reason for this release
is because the web host for MathJax JavaScript library is scheduled to
be shut down in the next few weeks. After it is shut down, Shiny
applications that use MathJax will no longer be able to load the MathJax
library if they are run with Shiny 1.0.1 and below. (If you don't know
whether your application uses MathJax, it probably does not.) For more
information about why the MathJax CDN is shutting down, see
https://www.mathjax.org/cdn-shutting-down/.

## Full changelog

### Minor new features and improvements

!begin-bullets-68!

-   !begin-bullet!
    Added a `shiny:sessioninitialized` Javascript event, which is fired
    at the end of the initialize method of the Session object. This
    allows us to listen for this event when we want to get the value of
    things like `Shiny.user`. (#1568)

    !end-bullet!
-   !begin-bullet!
    Fixed #1649: allow the `choices` argument in `checkboxGroupInput()`
    to be `NULL` (or `c()`) to keep backward compatibility with Shiny \<
    1.0.1. This will result in the same thing as providing
    `choices = character(0)`. (#1652)

    !end-bullet!
-   !begin-bullet!
    The official URL for accessing MathJax libraries over CDN has been
    deprecated and will be removed soon. We have switched to a new
    rstudio.com URL that we will support going forward. (#1664)

    !end-bullet!

!end-bullets-68!

### Bug fixes

!begin-bullets-69!

-   !begin-bullet!
    Fixed #1653: wrong code example in documentation. (#1658)
    !end-bullet!

!end-bullets-69!

# shiny 1.0.1

This is a maintenance release of Shiny, mostly aimed at fixing bugs and
introducing minor features. The most notable additions in this version
of Shiny are the introduction of the `reactiveVal()` function (it's like
`reactiveValues()`, but it only stores a single value), and that the
choices of `radioButtons()` and `checkboxGroupInput()` can now contain
HTML content instead of just plain text.

## Full changelog

### Breaking changes

!begin-bullets-70!

-   !begin-bullet!
    The functions `radioButtons()`, `checkboxGroupInput()` and
    `selectInput()` (and the corresponding `updateXXX()` functions) no
    longer accept a `selected` argument whose value is the name of a
    choice, instead of the value of the choice. This feature had been
    deprecated since Shiny 0.10 (it printed a warning message, but still
    tried to match the name to the right choice) and it's now completely
    unsupported.
    !end-bullet!

!end-bullets-70!

### New features

!begin-bullets-71!

-   !begin-bullet!
    Added `reactiveVal` function, for storing a single value which can
    be (reactively) read and written. Similar to `reactiveValues`,
    except that `reactiveVal` just lets you store a single value instead
    of storing multiple values by name. (#1614)
    !end-bullet!

!end-bullets-71!

### Minor new features and improvements

!begin-bullets-72!

-   !begin-bullet!
    Fixed #1637: Outputs stay faded on MS Edge. (#1640)

    !end-bullet!
-   !begin-bullet!
    Addressed #1348 and #1437 by adding two new arguments to
    `radioButtons()` and `checkboxGroupInput()`: `choiceNames` (list or
    vector) and `choiceValues` (list or vector). These can be passed in
    as an alternative to `choices`, with the added benefit that the
    elements in `choiceNames` can be arbitrary UI (i.e. anything created
    by `HTML()` and the `tags()` functions, like icons and images).
    While the underlying values for each choice (passed in through
    `choiceValues`) must still be simple text, their visual
    representation on the app (what the user actually clicks to select a
    different option) can be any valid HTML element. See `?radioButtons`
    for a small example. (#1521)

    !end-bullet!
-   !begin-bullet!
    Updated `tools/README.md` with more detailed instructions. (#1616)

    !end-bullet!
-   !begin-bullet!
    Fixed #1565, which meant that resources with spaces in their names
    return HTTP 404. (#1566)

    !end-bullet!
-   !begin-bullet!
    Exported `session$user` (if it exists) to the client-side; it's
    accessible in the Shiny object: `Shiny.user`. (#1563)

    !end-bullet!
-   !begin-bullet!
    Added support for HTML5's `pushState` which allows for
    pseudo-navigation in shiny apps. For more info, see the
    documentation (`?updateQueryString` and `?getQueryString`). (#1447)

    !end-bullet!
-   !begin-bullet!
    Fixed #1121: plot interactions with ggplot2 now support
    `coord_fixed()`. (#1525)

    !end-bullet!
-   !begin-bullet!
    Added `snapshotExclude` function, which marks an output so that it
    is not recorded in a test snapshot. (#1559)

    !end-bullet!
-   !begin-bullet!
    Added `shiny:filedownload` JavaScript event, which is triggered when
    a `downloadButton` or `downloadLink` is clicked. Also, the values of
    `downloadHandler`s are not recorded in test snapshots, because the
    values change every time the application is run. (#1559)

    !end-bullet!
-   !begin-bullet!
    Added support for plot interactions with ggplot2 \> 2.2.1. (#1578)

    !end-bullet!
-   !begin-bullet!
    Fixed #1577: Improved `escapeHTML` (util.js) in terms of the order
    dependency of replacing, XSS risk attack and performance. (#1579)

    !end-bullet!
-   !begin-bullet!
    The `shiny:inputchanged` JavaScript event now includes two new
    fields, `binding` and `el`, which contain the input binding and DOM
    element, respectively. Additionally, `Shiny.onInputChange()` now
    accepts an optional argument, `opts`, which can contain the same
    fields. (#1596)

    !end-bullet!
-   !begin-bullet!
    The `NS()` function now returns a vectorized function. (#1613)

    !end-bullet!
-   !begin-bullet!
    Fixed #1617: `fileInput` can have customized text for the button and
    the placeholder. (#1619)

    !end-bullet!

!end-bullets-72!

### Bug fixes

!begin-bullets-73!

-   !begin-bullet!
    Fixed #1511: `fileInput`s did not trigger the `shiny:inputchanged`
    event on the client. Also removed `shiny:fileuploaded` JavaScript
    event, because it is no longer needed after this fix. (#1541, #1570)

    !end-bullet!
-   !begin-bullet!
    Fixed #1472: With a Progress object, calling `set(value=NULL)` made
    the progress bar go to 100%. Now it does not change the value of the
    progress bar. The documentation also incorrectly said that setting
    the `value` to `NULL` would hide the progress bar. (#1547)

    !end-bullet!
-   !begin-bullet!
    Fixed #162: When a dynamically-generated input changed to a
    different `inputType`, it might be incorrectly deduplicated. (#1594)

    !end-bullet!
-   !begin-bullet!
    Removed redundant call to `inputs.setInput`. (#1595)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where `dateRangeInput` did not respect `weekstart`
    argument. (#1592)

    !end-bullet!
-   !begin-bullet!
    Fixed #1598: `setBookmarkExclude()` did not work properly inside of
    modules. (#1599)

    !end-bullet!
-   !begin-bullet!
    Fixed #1605: sliders did not move when clicked on the bar area.
    (#1610)

    !end-bullet!
-   !begin-bullet!
    Fixed #1621: if a `reactiveTimer`'s session was closed before the
    first time that the `reactiveTimer` fired, then the `reactiveTimer`
    would not get cleared and would keep firing indefinitely. (#1623)

    !end-bullet!
-   !begin-bullet!
    Fixed #1634: If brushing on a plot causes the plot to redraw, then
    the redraw could in turn trigger the plot to redraw again and again.
    This was due to spurious changes in values of floating point
    numbers. (#1641)

    !end-bullet!

!end-bullets-73!

### Library updates

!begin-bullets-74!

-   !begin-bullet!
    Closed #1500: Updated ion.rangeSlider to 2.1.6. (#1540)
    !end-bullet!

!end-bullets-74!

# shiny 1.0.0

Shiny has reached a milestone: version 1.0.0! In the last year, we've
added two major features that we considered essential for a 1.0.0
release: bookmarking, and support for testing Shiny applications. As
usual, this version of Shiny also includes many minor features and bug
fixes.

Here are some highlights from this release. For more details, see the
full changelog below.

## Support for testing Shiny applications

Shiny now supports automated testing of applications, with the shinytest
package. Shinytest has not yet been released on CRAN, but will be soon.
(#18, #1464)

## Debounce/throttle reactives

Now there's an official way to slow down reactive values and expressions
that invalidate too quickly. Pass a reactive expression to the new
`debounce` or `throttle` function, and get back a modified reactive
expression that doesn't invalidate as often. (#1510)

## Full changelog

### Breaking changes

!begin-bullets-75!

-   !begin-bullet!
    Added a new `placeholder` argument to `verbatimTextOutput()`. The
    default is `FALSE`, which means that, if there is no content for
    this output, no representation of this slot will be made in the UI.
    Previsouly, even if there was no content, you'd see an empty
    rectangle in the UI that served as a placeholder. You can set
    `placeholder = TRUE` to revert back to that look. (#1480)
    !end-bullet!

!end-bullets-75!

### New features

!begin-bullets-76!

-   !begin-bullet!
    Added support for testing Shiny applications with the shinytest
    package. (#18, #1464)

    !end-bullet!
-   !begin-bullet!
    Added `debounce` and `throttle` functions, to control the rate at
    which reactive values and expressions invalidate. (#1510)

    !end-bullet!

!end-bullets-76!

### Minor new features and improvements

!begin-bullets-77!

-   !begin-bullet!
    Addressed #1486 by adding a new argument to `observeEvent` and
    `eventReactive`, called `ignoreInit` (defaults to `FALSE` for
    backwards compatibility). When set to `TRUE`, the action (i.e. the
    second argument: `handlerExpr` and `valueExpr`, respectively) will
    not be triggered when the observer/reactive is first
    created/initialized. In other words, `ignoreInit = TRUE` ensures
    that the `observeEvent` (or `eventReactive`) is *never* run right
    away. For more info, see the documentation (`?observeEvent`).
    (#1494)

    !end-bullet!
-   !begin-bullet!
    Added a new argument to `observeEvent` called `once`. When set to
    `TRUE`, it results in the observer being destroyed (stop observing)
    after the first time that `handlerExpr` is run (i.e. `once = TRUE`
    guarantees that the observer only runs, at most, once). For more
    info, see the documentation (`?observeEvent`). (#1494)

    !end-bullet!
-   !begin-bullet!
    Addressed #1358: more informative error message when calling
    `runApp()` inside of an app's app.R (or inside ui.R or server.R).
    (#1482)

    !end-bullet!
-   !begin-bullet!
    Added a more descriptive JS warning for `insertUI()` when the
    selector argument does not match anything in DOM. (#1488)

    !end-bullet!
-   !begin-bullet!
    Added support for injecting JavaScript code when the
    `shiny.testmode` option is set to `TRUE`. This makes it possible to
    record test events interactively. (#1464)

    !end-bullet!
-   !begin-bullet!
    Added ability through arguments to the `a` tag function called
    inside `downloadButton()` and `downloadLink()`. Closes #986. (#1492)

    !end-bullet!
-   !begin-bullet!
    Implemented #1512: added a `userData` environment to `session`, for
    storing arbitrary session-related variables. Generally,
    session-scoped variables are created just by declaring normal
    variables that are local to the Shiny server function, but
    `session$userData` may be more convenient for some advanced
    scenarios. (#1513)

    !end-bullet!
-   !begin-bullet!
    Relaxed naming requirements for `addResourcePath()` (the first
    character no longer needs to be a letter). (#1529)

    !end-bullet!

!end-bullets-77!

### Bug fixes

!begin-bullets-78!

-   !begin-bullet!
    Fixed #969: allow navbarPage's `fluid` param to control both
    containers. (#1481)

    !end-bullet!
-   !begin-bullet!
    Fixed #1438: `unbindAll()` should not be called when inserting
    content with `insertUI()` (#1449)

    !end-bullet!
-   !begin-bullet!
    Fixed bug causing `<meta>` tags associated with HTML dependencies of
    Shiny R Markdown files to be rendered incorrectly. (#1463)

    !end-bullet!
-   !begin-bullet!
    Fixed #1359: `shinyApp()` options argument ignored when passed to
    `runApp()`. (#1483)

    !end-bullet!
-   !begin-bullet!
    Fixed #117: Reactive expressions now release references to cached
    values as soon as they are invalidated, potentially making those
    cached values eligible for garbage collection sooner. Previously,
    this would not occur until the next cached value was calculated and
    stored. (#1504)

    !end-bullet!
-   !begin-bullet!
    Fixed #1013: `flushReact` should be called after app loads.
    Observers set up outside of server functions were not running until
    after the first user connects. (#1503)

    !end-bullet!
-   !begin-bullet!
    Fixed #1453: When using a modal dialog with `easyClose=TRUE` in a
    Shiny gadget, pressing Esc would close both the modal and the
    gadget. Now pressing Esc only closes the modal. (#1523)

    !end-bullet!

!end-bullets-78!

### Library updates

!begin-bullets-79!

-   !begin-bullet!
    Updated to Font Awesome 4.7.0.
    !end-bullet!

!end-bullets-79!

# shiny 0.14.2

This is a maintenance release of Shiny, with some bug fixes and minor
new features.

## Full changelog

### Minor new features and improvements

!begin-bullets-80!

-   !begin-bullet!
    Added a `fade` argument to `modalDialog()` -- setting it to `FALSE`
    will remove the usual fade-in animation for that modal window.
    (#1414)

    !end-bullet!
-   !begin-bullet!
    Fixed a "duplicate binding" error that occurred in some edge cases
    involving `insertUI` and nested `uiOutput`. (#1402)

    !end-bullet!
-   !begin-bullet!
    Fixed #1422: When using the `shiny.trace` option, allow specifying
    to only log SEND or RECV messages, or both. (PR #1428)

    !end-bullet!
-   !begin-bullet!
    Fixed #1419: Allow overriding a JS custom message handler. (PR
    #1445)

    !end-bullet!
-   !begin-bullet!
    Added `exportTestValues()` function, which allows a test driver to
    query the session for values internal to an application's server
    function. This only has an effect if the `shiny.testmode` option is
    set to `TRUE`. (#1436)

    !end-bullet!

!end-bullets-80!

### Bug fixes

!begin-bullets-81!

-   !begin-bullet!
    Fixed #1427: make sure that modals do not close incorrectly when an
    element inside them is triggered as hidden. (#1430)

    !end-bullet!
-   !begin-bullet!
    Fixed #1404: stack trace tests were not compatible with the
    byte-code compiler in R-devel, which now tracks source references.

    !end-bullet!
-   !begin-bullet!
    `sliderInputBinding.setValue()` now sends a slider's value
    immediately, instead of waiting for the usual 250ms debounce delay.
    (#1429)

    !end-bullet!
-   !begin-bullet!
    Fixed a bug where, in versions of R before 3.2, Shiny applications
    could crash due to a bug in R's implementation of `list2env()`.
    (#1446)

    !end-bullet!

!end-bullets-81!

# shiny 0.14.1

This is a maintenance release of Shiny, with some bug fixes and minor
new features.

## Full changelog

### Minor new features and improvements

!begin-bullets-82!

-   !begin-bullet!
    Restored file inputs are now copied on restore, so that the restored
    application can't modify the bookmarked file. (#1370)

    !end-bullet!
-   !begin-bullet!
    Added support for plot interaction in the development version of
    ggplot2, 2.1.0.9000. Also added support for ggplot2 plots with
    `coord_flip()` (in the development version of ggplot2).
    (hadley/ggplot2#1781, #1392)

    !end-bullet!

!end-bullets-82!

### Bug fixes

!begin-bullets-83!

-   !begin-bullet!
    Fixed #1093 better: `updateRadioButtons()` and
    `updateCheckboxGroupInput()` were not working correctly if the
    choices were given as a numeric vector. This had been solved in
    #1291, but that introduced a different bug #1396 that this better
    fix avoids. (#1370)

    !end-bullet!
-   !begin-bullet!
    Fixed #1368: If an app with a file input was bookmarked and
    restored, and then the restored app was bookmarked and restored
    (without uploading a new file), then it would fail to restore the
    file the second time. (#1370)

    !end-bullet!
-   !begin-bullet!
    Fixed #1369: `sliderInput()` did not allow showing numbers without a
    thousands separator.

    !end-bullet!
-   !begin-bullet!
    Fixed #1346 and #1107 : jQuery UI's datepicker conflicted with the
    bootstrap-datepicker used by Shiny's `dateInput()` and
    `dateRangeInput()`. (#1374)

    !end-bullet!

!end-bullets-83!

### Library updates

!begin-bullets-84!

-   !begin-bullet!
    Updated to bootstrap-datepicker 1.6.4. (#1218, #1374)

    !end-bullet!
-   !begin-bullet!
    Updated to jQuery UI 1.12.1. Previously, Shiny included a build of
    1.11.4 which was missing the datepicker component due to a conflict
    with the bootstrap-datepicker used by Shiny's `dateInput()` and
    `dateRangeInput()`. (#1374)

    !end-bullet!

!end-bullets-84!

# shiny 0.14

A new Shiny release is upon us! There are many new exciting features,
bug fixes, and library updates. We'll just highlight the most important
changes here, but you can browse through the full changelog below for
details. This will likely be the last release before shiny 1.0, so get
out your party hats!

## Bookmarkable state

Shiny now supports bookmarkable state: users can save the state of an
application and get a URL which will restore the application with that
state. There are two types of bookmarking: encoding the state in a URL,
and saving the state to the server. With an encoded state, the entire
state of the application is contained in the URL's query string. You can
see this in action with this app:
https://gallery.shinyapps.io/113-bookmarking-url/. An example of a
bookmark URL for this app is
https://gallery.shinyapps.io/113-bookmarking-url/?*inputs*&n=200. When
the state is saved to the server, the URL might look something like:
https://gallery.shinyapps.io/bookmark-saved/?*state_id*=d80625dc681e913a
(note that this URL is not for an active app).

***Important note*:** \> Saved-to-server bookmarking currently works
with Shiny Server Open Source. Support on Shiny Server Pro, RStudio
Connect, and shinyapps.io is under development and testing. However,
URL-encoded bookmarking works on all hosting platforms.

See this article to get started with bookmarkable state. There is also
an advanced-level article (for apps that have a complex state), and a
modules article that details how to use bookmarking in conjunction with
modules.

## Notifications

Shiny can now display notifications on the client browser by using the
`showNotification()` function. Use this demo app to play around with the
notification API. Here's a screenshot of a very simple notification
(shown when the button is clicked):

```{=html}
<p align="center">
```
`<img src="http://shiny.rstudio.com/images/notification.png" alt="notification" width="50%"/>`{=html}
```{=html}
</p>
```
Here's our article about it, and the reference documentation.

## Progress indicators

If your Shiny app contains computations that take a long time to
complete, a progress bar can improve the user experience by
communicating how far along the computation is, and how much is left.
Progress bars were added in Shiny 0.10.2. In Shiny 0.14, they were
changed to use the notifications system, which gives them a different
look.

***Important note*:** \> If you were already using progress bars and had
customized them with your own CSS, you can add the `style = "old"`
argument to your `withProgress()` call (or `Progress$new()`). This will
result in the same appearance as before. You can also call
`shinyOptions(progress.style = "old")` in your app's server function to
make all progress indicators use the old styling.

To see new progress bars in action, see this app in the gallery. You can
also learn more about this in our article and in the reference
documentation (either for the easier `withProgress` functional API or
the more complicated, but more powerful, `Progress` object-oriented API.

## Reconnection

Shiny can now automatically reconnect to your Shiny session if you
temporarily lose network access.

## Modal windows

Shiny has now built-in support for displaying modal dialogs like the one
below (live app here):

```{=html}
<p align="center">
```
`<img src="http://shiny.rstudio.com/images/modal-dialog.png" alt="modal-dialog" width="50%"/>`{=html}
```{=html}
</p>
```
To learn more about this, read our article and the reference
documentation.

## `insertUI` and `removeUI`

Sometimes in a Shiny app, arbitrary HTML UI may need to be created
on-the-fly in response to user input. The existing `uiOutput` and
`renderUI` functions let you continue using reactive logic to call UI
functions and make the results appear in a predetermined place in the
UI. The `insertUI` and `removeUI` functions, which are used in the
server code, allow you to use imperative logic to add and remove
arbitrary chunks of HTML (all independent from one another), as many
times as you want, whenever you want, wherever you want. This option may
be more convenient when you want to, for example, add a new model to
your app each time the user selects a different option (and leave
previous models unchanged, rather than substitute the previous one for
the latest one).

See this simple demo app of how one could use `insertUI` and `removeUI`
to insert and remove text elements using a queue. Also see this other
app that demonstrates how to insert and remove a few common Shiny input
objects. Finally, this app shows how to dynamically insert modules using
`insertUI`.

For more, read our article about dynamic UI generation and the reference
documentation about `insertUI` and `removeUI`.

## Documentation for connecting to an external database

Many Shiny users have asked about best practices for accessing external
databases from their Shiny applications. Although database access has
long been possible using various database connector packages in R, it
can be challenging to use them robustly in the dynamic environment that
Shiny provides. So far, it has been mostly up to application authors to
find the appropriate database drivers and to discover how to manage the
database connections within an application. In order to demystify this
process, we wrote a series of articles (first one here) that covers the
basics of connecting to an external database, as well as some security
precautions to keep in mind (e.g. how to avoid SQL injection attacks).

There are a few packages that you should look at if you're using a
relational database in a Shiny app: the `dplyr` and `DBI` packages (both
featured in the article linked to above), and the brand new `pool`
package, which provides a further layer of abstraction to make it easier
and safer to use either `DBI` or `dplyr`. `pool` is not yet on CRAN. In
particular, `pool` will take care of managing connections, preventing
memory leaks, and ensuring the best performance. See this `pool` basics
article and the more advanced-level article if you're feeling
adventurous! (Both of these articles contain Shiny app examples that use
`DBI` to connect to an external MySQL database.) If you are more
comfortable with `dplyr` than `DBI`, don't miss the article about the
integration of `pool` and `dplyr`.

If you're new to databases in the Shiny world, we recommend using
`dplyr` and `pool` if possible. If you need greater control than `dplyr`
offers (for example, if you need to modify data in the database or use
transactions), then use `DBI` and `pool`. The `pool` package was
introduced to make your life easier, but in no way constrains you, so we
don't envision any situation in which you'd be better off *not* using
it. The only caveat is that `pool` is not yet on CRAN, so you may prefer
to wait for that.

## Others

There are many more minor features, small improvements, and bug fixes
than we can cover here, so we'll just mention a few of the more
noteworthy ones (the full changelog, with links to all the relevant
issues and pull requests, is right below this section):

!begin-bullets-85!

-   !begin-bullet!
    **Error Sanitization**: you now have the option to sanitize error
    messages; in other words, the content of the original error message
    can be suppressed so that it doesn't leak any sensitive information.
    To sanitize errors everywhere in your app, just add
    `options(shiny.sanitize.errors = TRUE)` somewhere in your app. Read
    this article for more, or play with the demo app.

    !end-bullet!
-   !begin-bullet!
    **Code Diagnostics**: if there is an error parsing `ui.R`,
    `server.R`, `app.R`, or `global.R`, Shiny will search the code for
    missing commas, extra commas, and unmatched braces, parens, and
    brackets, and will print out messages pointing out those problems.
    (#1126)

    !end-bullet!
-   !begin-bullet!
    **Reactlog visualization**: by default, the `showReactLog()`
    function (which brings up the reactive graph) also displays the time
    that each reactive and observer were active for:

    ```{=html}
    <p align="center">
    ```
    `<img src="http://shiny.rstudio.com/images/reactlog.png" alt="modal-dialog" width="75%"/>`{=html}

    ```{=html}
    </p>
    ```
    This new feature can be turned off with
    `showReactLog(time = FALSE)`. This may be convenient if you have a
    large graph and don't want to have this new information cluttering
    it up. The elapsed time info shows up above each relevant node's
    label, and the time is also coded by color: the slowest reactive
    will be dark red and the fastest will be light red.

    Additionally, to organize the graph, you can now drag any of the
    nodes to a specific position and leave it there.

    !end-bullet!
-   !begin-bullet!
    **Nicer-looking tables**: we've made tables generated with
    `renderTable()` look cleaner and more modern. While this won't break
    any older code, the finished look of your table will be quite a bit
    different, as the following image shows:

    ```{=html}
    <p align="center">
    ```
    `<img src="http://shiny.rstudio.com/images/render-table.png" alt="render-table" width="75%"/>`{=html}

    ```{=html}
    </p>
    ```
    For more, read our short article about this update, experiment with
    all the new features in this demo app, or check out the reference
    documentation.

    !end-bullet!

!end-bullets-85!

## Full changelog

### Breaking changes

!begin-bullets-86!

-   !begin-bullet!
    Progress indicators can now either use the new notification API,
    using `style = "notification"` (default), or be displayed with the
    previous styling, using `style = "old"`. You can also call
    `shinyOptions(progress.style = "old")` in the server function to
    make all progress indicators use the old styling. Note that if you
    had customized your progress indicators with additional CSS, you'll
    need to use the old style if you want your UI to look the same
    (#1160 and #1329).

    !end-bullet!
-   !begin-bullet!
    Closed #1161: Deprecated the `position` argument to `tabsetPanel()`
    since Bootstrap 3 stopped supporting this feature.

    !end-bullet!
-   !begin-bullet!
    The long-deprecated ability to pass a `func` argument to many of the
    `render` functions has been removed.

    !end-bullet!

!end-bullets-86!

### New features

!begin-bullets-87!

-   !begin-bullet!
    Added the ability to bookmark and restore application state. (main
    PR: #1209)

    !end-bullet!
-   !begin-bullet!
    Added a new notification API. From R, there are new functions
    `showNotification` and `hideNotification`. From JavaScript, there is
    a new `Shiny.notification` object that controls notifications.
    (#1141)

    !end-bullet!
-   !begin-bullet!
    Progress indicators now use the notification API. (#1160)

    !end-bullet!
-   !begin-bullet!
    Added the ability for the client browser to reconnect to a new
    session on the server, by setting `session$allowReconnect(TRUE)`.
    This requires a version of Shiny Server that supports reconnections.
    (#1074)

    !end-bullet!
-   !begin-bullet!
    Added modal dialogs. (#1157)

    !end-bullet!
-   !begin-bullet!
    Added insertUI and removeUI functions to be able to add and remove
    chunks of UI, standalone, and all independent of one another. (#1174
    and #1189)

    !end-bullet!
-   !begin-bullet!
    Improved `renderTable()` function to make the tables look prettier
    and also provide the user with a lot more parameters to customize
    their tables with. (#1129)

    !end-bullet!
-   !begin-bullet!
    Added support for the `pool` package (use Shiny's timer/scheduler).
    (#1226)

    !end-bullet!

!end-bullets-87!

### Minor new features and improvements

!begin-bullets-88!

-   !begin-bullet!
    Added `cancelOutput` argument to `req()`. This causes the currently
    executing reactive to cancel its execution, and leave its previous
    state alone (as opposed to clearing the output). (#1272)

    !end-bullet!
-   !begin-bullet!
    `Display: Showcase` now displays the .js, .html and .css files in
    the `www` directory by default. In order to use showcase mode and
    not display these, include a new line in your Description file:
    `IncludeWWW: False`. (#1185)

    !end-bullet!
-   !begin-bullet!
    Added an error sanitization option:
    `options(shiny.sanitize.errors = TRUE)`. By default, this option is
    `FALSE`. When `TRUE`, normal errors will be sanitized, displaying
    only a generic error message. This changes the look of an app when
    errors are printed (but the console log remains the same). (#1156)

    !end-bullet!
-   !begin-bullet!
    Added the option of passing arguments to an `xxxOutput()` function
    through the corresponding `renderXXX()` function via an `outputArgs`
    parameter to the latter. This is only valid for snippets of Shiny
    code in an interactive `runtime: shiny` Rmd document (never for full
    apps, even if embedded in an Rmd). (#1443)

    !end-bullet!
-   !begin-bullet!
    Added `updateActionButton()` function, so the user can change an
    `actionButton`'s (or `actionLink`'s) label and/or icon. It also
    checks that the icon argument (for both creation and updating of a
    button) is valid and throws a warning otherwise. (#1134)

    !end-bullet!
-   !begin-bullet!
    Added code diagnostics: if there is an error parsing ui.R, server.R,
    app.R, or global.R, Shiny will search the code for missing commas,
    extra commas, and unmatched braces, parens, and brackets, and will
    print out messages pointing out those problems. (#1126)

    !end-bullet!
-   !begin-bullet!
    Added support for horizontal dividers in `navbarMenu`. (#1147)

    !end-bullet!
-   !begin-bullet!
    Added `placeholder` option to `passwordInput`. (#1152)

    !end-bullet!
-   !begin-bullet!
    Added `session$resetBrush(brushId)` (R) and
    `Shiny.resetBrush(brushId)` (JS) to programatically clear brushes
    from `imageOutput`/`plotOutput`. (#1197)

    !end-bullet!
-   !begin-bullet!
    Added textAreaInput. (thanks, @nuno-agostinho! #1300)

    !end-bullet!
-   !begin-bullet!
    Added `session$sendBinaryMessage(type, message)` method for sending
    custom binary data to the client. See `?session`. (thanks, @daef!
    #1316 and #1320)

    !end-bullet!
-   !begin-bullet!
    Almost all code examples now have a runnable example with
    `shinyApp()`, so that users can run the examples and see them in
    action. (#1158)

    !end-bullet!
-   !begin-bullet!
    When resized, plots are drawn with `replayPlot()`, instead of
    re-executing all plotting code. This results in faster plot
    rendering. (#1112)

    !end-bullet!
-   !begin-bullet!
    Exported the `isTruthy()` function. (part of PR #1272)

    !end-bullet!
-   !begin-bullet!
    Reactive log now shows elapsed time for reactives and observers.
    (#1132)

    !end-bullet!
-   !begin-bullet!
    Nodes in the reactlog visualization are now sticky if the user drags
    them. (#1283)

    !end-bullet!

!end-bullets-88!

### Bug fixes

!begin-bullets-89!

-   !begin-bullet!
    Fixed #1350: Highlighting of reactives didn't work in showcase mode.

    !end-bullet!
-   !begin-bullet!
    Fixed #1331: `renderPlot()` now correctly records and replays plots
    when `execOnResize = FALSE`.

    !end-bullet!
-   !begin-bullet!
    `updateDateInput()` and `updateDateRangeInput()` can now clear the
    date input fields. (thanks, @gaborcsardi! #1299, #1315 and #1317)

    !end-bullet!
-   !begin-bullet!
    Fixed #561: DataTables previously might pop up a warning when the
    data was updated extremely frequently.

    !end-bullet!
-   !begin-bullet!
    Fixed #776: In some browsers, plots sometimes flickered when
    updated.

    !end-bullet!
-   !begin-bullet!
    Fixed #543 and #855: When `navbarPage()` had a `navbarMenu()` as the
    first item, it did not automatically select an item.

    !end-bullet!
-   !begin-bullet!
    Fixed #970: `navbarPage()` previously did not have an option to set
    the selected tab.

    !end-bullet!
-   !begin-bullet!
    Fixed #1253: Memory could leak when an observer was destroyed
    without first being invalidated.

    !end-bullet!
-   !begin-bullet!
    Fixed #931: Nested observers could leak memory.

    !end-bullet!
-   !begin-bullet!
    Fixed #1144: `updateRadioButton()` and `updateCheckboxGroupInput()`
    broke controls when used in modules (thanks, @sipemu!).

    !end-bullet!
-   !begin-bullet!
    Fixed #1093: `updateRadioButtons()` and `updateCheckboxGroupInput()`
    didn't work if `choices` was numeric vector.

    !end-bullet!
-   !begin-bullet!
    Fixed #1122: `downloadHandler()` popped up empty browser window if
    the file wasn't present. It now gives a 404 error code.

    !end-bullet!
-   !begin-bullet!
    Fixed #1278: Reactive system was being flushed too often (usually
    this just means a more-expensive no-op than necessary).

    !end-bullet!
-   !begin-bullet!
    Fixed #803 and #1179: handling malformed dates in `dateInput` and
    `updateDateInput()`.

    !end-bullet!
-   !begin-bullet!
    Fixed #1257: `updateSelectInput()` didn't work correctly in IE 11
    and Edge.

    !end-bullet!
-   !begin-bullet!
    Fixed #971: `runApp()` would give confusing error if `port` was not
    numeric.

    !end-bullet!
-   !begin-bullet!
    Shiny now avoids using ports that Chrome deems unsafe. (#1222)

    !end-bullet!
-   !begin-bullet!
    Added workaround for quartz graphics device resolution bug, where
    resolution is hard-coded to 72 ppi.

    !end-bullet!

!end-bullets-89!

### Library updates

!begin-bullets-90!

-   !begin-bullet!
    Updated to ion.RangeSlider 2.1.2.

    !end-bullet!
-   !begin-bullet!
    Updated to Font Awesome 4.6.3.

    !end-bullet!
-   !begin-bullet!
    Updated to Bootstrap 3.3.7.

    !end-bullet!
-   !begin-bullet!
    Updated to jQuery 1.12.4.

    !end-bullet!

!end-bullets-90!

# shiny 0.13.2

!begin-bullets-91!

-   !begin-bullet!
    Updated documentation for `htmlTemplate`.
    !end-bullet!

!end-bullets-91!

# shiny 0.13.1

!begin-bullets-92!

-   !begin-bullet!
    `flexCol` did not work on RStudio for Windows or Linux.

    !end-bullet!
-   !begin-bullet!
    Fixed RStudio debugger integration.

    !end-bullet!
-   !begin-bullet!
    BREAKING CHANGE: The long-deprecated ability to pass functions
    (rather than expressions) to reactive() and observe() has finally
    been removed.

    !end-bullet!

!end-bullets-92!

# shiny 0.13.0

!begin-bullets-93!

-   !begin-bullet!
    Fixed #962: plot interactions did not work with the development
    version of ggplot2 (after ggplot2 1.0.1).

    !end-bullet!
-   !begin-bullet!
    Fixed #902: the `drag_drop` plugin of the selectize input did not
    work.

    !end-bullet!
-   !begin-bullet!
    Fixed #933: `updateSliderInput()` does not work when only the label
    is updated.

    !end-bullet!
-   !begin-bullet!
    Multiple imageOutput/plotOutput calls can now share the same brush
    id. Shiny will ensure that performing a brush operation will clear
    any other brush with the same id.

    !end-bullet!
-   !begin-bullet!
    Added `placeholder` option to `textInput`.

    !end-bullet!
-   !begin-bullet!
    Improved support for Unicode characters on Windows (#968).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `selectInput` and `selectizeInput` where values with
    double quotes were not properly escaped.

    !end-bullet!
-   !begin-bullet!
    `runApp()` can now take a path to any .R file that yields a
    `shinyApp` object; previously, the path had to be a directory that
    contained an app.R file (or server.R if using separately defined
    server and UI). Similarly, introduced `shinyAppFile()` function
    which creates a `shinyApp` object for an .R file path, just as
    `shinyAppDir()` does for a directory path.

    !end-bullet!
-   !begin-bullet!
    Introduced Shiny Modules, which are designed to 1) simplify the
    reuse of Shiny UI/server logic and 2) make authoring and maintaining
    complex Shiny apps much easier. See the article linked from
    `?callModule`.

    !end-bullet!
-   !begin-bullet!
    `invalidateLater` and `reactiveTimer` no longer require an explicit
    `session` argument; the default value uses the current session.

    !end-bullet!
-   !begin-bullet!
    Added `session$reload()` method, the equivalent of hitting the
    browser's Reload button.

    !end-bullet!
-   !begin-bullet!
    Added `shiny.autoreload` option, which will automatically cause
    browsers to reload whenever Shiny app files change on disk. This is
    intended to shorten the feedback cycle when tweaking UI code.

    !end-bullet!
-   !begin-bullet!
    Errors are now printed with stack traces! This should make it
    tremendously easier to track down the causes of errors in Shiny. Try
    it by calling `stop("message")` from within an output, reactive, or
    observer. Shiny itself adds a lot of noise to the call stack, so by
    default, it attempts to hide all but the relevant levels of the call
    stack. You can turn off this behavior by setting
    `options(shiny.fullstacktrace=TRUE)` before or during app startup.

    !end-bullet!
-   !begin-bullet!
    Fixed #1018: the selected value of a selectize input is guaranteed
    to be selected in server-side mode.

    !end-bullet!
-   !begin-bullet!
    Added `req` function, which provides a simple way to prevent a
    reactive, observer, or output from executing until all required
    inputs and values are available. (Similar functionality has been
    available for a while using validate/need, but req provides a much
    simpler and more direct interface.)

    !end-bullet!
-   !begin-bullet!
    Improve stability with Shiny Server when many subapps are used, by
    deferring the loading of subapp iframes until a connection has first
    been established with the server.

    !end-bullet!
-   !begin-bullet!
    Upgrade to Font Awesome 4.5.0.

    !end-bullet!
-   !begin-bullet!
    Upgraded to Bootstrap 3.3.5.

    !end-bullet!
-   !begin-bullet!
    Upgraded to jQuery 1.12.4

    !end-bullet!
-   !begin-bullet!
    Switched to an almost-complete build of jQuery UI with the exception
    of the datepicker extension, which conflicts with Shiny's date
    picker.

    !end-bullet!
-   !begin-bullet!
    Added `fillPage` function, an alternative to `fluidPage`,
    `fixedPage`, etc. that is designed for apps that fill the entire
    available page width/height.

    !end-bullet!
-   !begin-bullet!
    Added `fillRow` and `fillCol` functions, for laying out proportional
    grids in `fillPage`. For modern browsers only.

    !end-bullet!
-   !begin-bullet!
    Added `runGadget`, `paneViewer`, `dialogViewer`, and `browserViewer`
    functions to support Shiny Gadgets. More detailed docs about gadgets
    coming soon.

    !end-bullet!
-   !begin-bullet!
    Added support for the new htmltools 0.3 feature `htmlTemplate`. It's
    now possible to use regular HTML markup to design your UI, but still
    use R expressions to define inputs, outputs, and HTML widgets.

    !end-bullet!

!end-bullets-93!

# shiny 0.12.2

!begin-bullets-94!

-   !begin-bullet!
    GitHub changed URLs for gists from .tar.gz to .zip, so `runGist` was
    updated to work with the new URLs.

    !end-bullet!
-   !begin-bullet!
    Callbacks from the session object are now guaranteed to execute in
    the order in which registration occurred.

    !end-bullet!
-   !begin-bullet!
    Minor bugs in sliderInput's animation behavior have been fixed.
    (#852)

    !end-bullet!
-   !begin-bullet!
    Updated to ion.rangeSlider to 2.0.12.

    !end-bullet!
-   !begin-bullet!
    Added `shiny.minified` option, which controls whether the minified
    version of shiny.js is used. Setting it to FALSe can be useful for
    debugging. (#826, #850)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue for outputting plots from ggplot objects which also
    have an additional class whose print method takes precedence over
    `print.ggplot`. (#840, 841)

    !end-bullet!
-   !begin-bullet!
    Added `width` option to Shiny's input functions. (#589, #834)

    !end-bullet!
-   !begin-bullet!
    Added two alias functions of `updateTabsetPanel()` to update the
    selected tab: `updateNavbarPage()` and `updateNavlistPanel()`.
    (#881)

    !end-bullet!
-   !begin-bullet!
    All non-base functions are now explicitly namespaced, to pass checks
    in R-devel.

    !end-bullet!
-   !begin-bullet!
    Shiny now correctly handles HTTP HEAD requests. (#876)

    !end-bullet!

!end-bullets-94!

# shiny 0.12.1

!begin-bullets-95!

-   !begin-bullet!
    Fixed an issue where unbindAll() causes subsequent bindAll() to be
    ignored for previously bound outputs. (#856)

    !end-bullet!
-   !begin-bullet!
    Undeprecate `dataTableOutput` and `renderDataTable`, which had been
    deprecated in favor of the new DT package. The DT package is a bit
    too new and has a slightly different API, we were too hasty in
    deprecating the existing Shiny functions.

    !end-bullet!

!end-bullets-95!

# shiny 0.12.0

In addition to the changes listed below (in the *Full Changelog*
section), there is an infrastructure change that could affect existing
Shiny apps.

### JSON serialization

In Shiny 0.12.0, we've switched from RJSONIO to jsonlite. For the vast
majority of users, this will result in no noticeable changes; however,
if you use any packages in your Shiny apps which rely on the
htmlwidgets, you will also need to update htmlwidgets to 0.4.0. Both of
these packages will issue a message when loaded, if the other package
needs to be upgraded.

POSIXt objects are now serialized to JSON in UTC8601 format (like
"2015-03-20T20:00:00Z"), instead of as seconds from the epoch. If you
have a Shiny app which uses `sendCustomMessage()` to send datetime
(POSIXt) objects, then you may need to modify your Javascript code to
receive time data in this format.

### A note about Data Tables

Shiny 0.12.0 deprecated Shiny's dataTableOutput and renderDataTable
functions and instructed you to migrate to the nascent DT package
instead. (We'll talk more about DT in a future blog post.) User feedback
has indicated this transition was too sudden and abrupt, so we've
undeprecated these functions in 0.12.1. We'll continue to support these
functions until DT has had more time to mature.

## Full Changelog

!begin-bullets-96!

-   !begin-bullet!
    Switched from RJSONIO to jsonlite. This improves consistency and
    speed when converting between R data structures and JSON. One
    notable change is that POSIXt objects are now serialized to JSON in
    UTC8601 format (like "2015-03-20T20:00:00Z"), instead of as seconds
    from the epoch).

    !end-bullet!
-   !begin-bullet!
    In addition to the existing support for clicking and hovering on
    plots created by base graphics, added support for double-clicking
    and brushing. (#769)

    !end-bullet!
-   !begin-bullet!
    Added support for clicking, hovering, double-clicking, and brushing
    for plots created by ggplot2, including support for facets. (#802)

    !end-bullet!
-   !begin-bullet!
    Added `nearPoints` and `brushedPoints` functions for easily
    selecting rows of data that are clicked/hovered, or brushed. (#802)

    !end-bullet!
-   !begin-bullet!
    Added `shiny.port` option. If this is option is set, `runApp()` will
    listen on this port by default. (#756)

    !end-bullet!
-   !begin-bullet!
    `runUrl`, `runGist`, and `runGitHub` now can save downloaded
    applications, with the `destdir` argument. (#688)

    !end-bullet!
-   !begin-bullet!
    Restored ability to set labels for `selectInput`. (#741)

    !end-bullet!
-   !begin-bullet!
    Travis continuous integration now uses Travis's native R support.

    !end-bullet!
-   !begin-bullet!
    Fixed encoding issue when the server receives data from the client
    browser. (#742)

    !end-bullet!
-   !begin-bullet!
    The `session` object now has class `ShinySession`, making it easier
    to test whether an object is indeed a session object. (#720, #746)

    !end-bullet!
-   !begin-bullet!
    Fix JavaScript error when an output appears in nested uiOutputs.
    (Thanks, Gregory Zhang. #749)

    !end-bullet!
-   !begin-bullet!
    Eliminate delay on receiving new value when
    `updateSliderInput(value=...)` is called.

    !end-bullet!
-   !begin-bullet!
    Updated to DataTables (Javascript library) 1.10.5.

    !end-bullet!
-   !begin-bullet!
    Fixed downloading of files that have no filename extension. (#575,
    #753)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where nested UI outputs broke outputs. (#749, #750)

    !end-bullet!
-   !begin-bullet!
    Removed unneeded HTML ID attributes for `checkboxGroupInputs` and
    `radioButtons`. (#684)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where checkboxes were still active even after
    `Shiny.unbindAll()` was called. (#206)

    !end-bullet!
-   !begin-bullet!
    The server side selectize input will load the first 1000 options by
    default before users start to type and search in the box. (#823)

    !end-bullet!
-   !begin-bullet!
    renderDataTable() and dataTableOutput() have been deprecated in
    shiny and will be removed in future versions of shiny. Please use
    the DT package instead: http://rstudio.github.io/DT/ (#807)

    !end-bullet!

!end-bullets-96!

# shiny 0.11.1

!begin-bullets-97!

-   !begin-bullet!
    Major client-side performance improvements for pages that have many
    conditionalPanels, tabPanels, and plotOutputs. (#693, #717, #723)

    !end-bullet!
-   !begin-bullet!
    `tabPanel`s now use the `title` for `value` by default. This fixes a
    bug in which an icon in the title caused problems with a
    conditionalPanel's test condition. (#725, #728)

    !end-bullet!
-   !begin-bullet!
    `selectInput` now has a `size` argument to control the height of the
    input box. (#729)

    !end-bullet!
-   !begin-bullet!
    `navbarPage` no longer includes a first row of extra whitespace when
    `header=NULL`. (#722)

    !end-bullet!
-   !begin-bullet!
    `selectInput`s now use Bootstrap styling when `selectize=FALSE`.
    (#724)

    !end-bullet!
-   !begin-bullet!
    Better vertical spacing of label for checkbox groups and radio
    buttons.

    !end-bullet!
-   !begin-bullet!
    `selectInput` correctly uses width for both selectize and
    non-selectize inputs. (#702)

    !end-bullet!
-   !begin-bullet!
    The wrapper tag generated by `htmlOutput` and `uiOutput` can now be
    any type of HTML tag, instead of just span and div. Also, custom
    classes are now allowed on the tag. (#704)

    !end-bullet!
-   !begin-bullet!
    Slider problems in IE 11 and Chrome on touchscreen-equipped Windows
    computers have been fixed. (#700)

    !end-bullet!
-   !begin-bullet!
    Sliders now work correctly with draggable panels. (#711)

    !end-bullet!
-   !begin-bullet!
    Fixed arguments in `fixedPanel`. (#709)

    !end-bullet!
-   !begin-bullet!
    downloadHandler content callback functions are now invoked with a
    temp file name that has the same extension as the final filename
    that will be used by the download. This is to deal with the fact
    that some file writing functions in R will auto-append the extension
    for their file type (pdf, zip).

    !end-bullet!

!end-bullets-97!

# shiny 0.11

Shiny 0.11 switches away from the Bootstrap 2 web framework to the next
version, Bootstrap 3. This is in part because Bootstrap 2 is no longer
being developed, and in part because it allows us to tap into the
ecosystem of Bootstrap 3 themes.

### Known issues for migration

!begin-bullets-98!

-   !begin-bullet!
    In Bootstrap 3, images in `<img>` tags are no longer automatically
    scaled to the width of their container. If you use `img()` in your
    UI code, or `<img>` tags in your raw HTML source, it's possible that
    they will be too large in the new version of Shiny. To address this
    you can add the `img-responsive` class:
    !end-bullet!

!end-bullets-98!

!begin-codeblock!

    ```r
    img(src = "picture.png", class = "img-responsive")
    ```

    The R code above will generate the following HTML:

    ```html
    <img src="picture.png" class="img-responsive">
    ```

!end-codeblock!

!begin-bullets-99!

-   !begin-bullet!
    The sliders have been replaced. Previously, Shiny used the jslider
    library, but now it uses ion.RangeSlider. The new sliders have an
    updated appearance, and they have allowed us to fix many
    long-standing interface issues with the sliders.

    !end-bullet!
-   !begin-bullet!
    The `sliderInput()` function no longer uses the `format` or `locale`
    options. Instead, you can use `pre`, `post`, and `sep` options to
    control the prefix, postfix, and thousands separator.

    !end-bullet!
-   !begin-bullet!
    `updateSliderInput()` can now control the min, max, value, and step
    size of a slider. Previously, only the value could be controlled
    this way, and if you wanted to change other values, you needed to
    use Shiny's dynamic UI.

    !end-bullet!
-   !begin-bullet!
    If in your HTML you are using custom CSS classes that are specific
    to Bootstrap, you may need to update them for Bootstrap 3. See the
    Bootstrap migration guide.

    !end-bullet!

!end-bullets-99!

If you encounter other migration issues, please let us know on the
shiny-discuss mailing list, or on the Shiny issue tracker.

### Using shinybootstrap2

If you would like to use Shiny 0.11 with Bootstrap 2, you can use the
**shinybootstrap2** package. Installation and usage instructions are on
available on the project page. We recommend that you do this only as a
temporary solution because future development on Shiny will use
Bootstrap 3.

### Installing an older version of Shiny

If you want to install a specific version of Shiny other than the latest
CRAN release, you can use the `install_version()` function from
devtools:

!begin-codeblock!

``` r
# Install devtools if you don't already have it:
install.package("devtools")

# Install the last version of Shiny prior to 0.11
devtools::install_version("shiny", "0.10.2.2")
```

!end-codeblock!

### Themes

Along with the release of Shiny 0.11, we've packaged up some Bootstrap 3
themes in the shinythemes package. This package makes it easy to use
Bootstrap themes with Shiny.

## Full Changelog

!begin-bullets-100!

-   !begin-bullet!
    Changed sliders from jquery-slider to ion.rangeSlider. These sliders
    have an improved appearance, support updating more properties from
    the server, and can be controlled with keyboard input.

    !end-bullet!
-   !begin-bullet!
    Switched from Bootstrap 2 to Bootstrap 3. For most users, this will
    work seamlessly, but some users may need to use the shinybootstrap2
    package for backward compatibility.

    !end-bullet!
-   !begin-bullet!
    The UI of a Shiny app can now have a body tag. This is useful for
    CSS templates that use classes on the body tag.

    !end-bullet!
-   !begin-bullet!
    `actionButton` and `actionLink` now pass their `...` arguments to
    the underlying tag function. (#607)

    !end-bullet!
-   !begin-bullet!
    Added `observeEvent` and `eventReactive` functions for clearer, more
    concise handling of `actionButton`, plot clicks, and other
    naturally-imperative inputs.

    !end-bullet!
-   !begin-bullet!
    Errors that happen in reactives no longer prevent any remaining
    pending observers from executing. It is also now possible for users
    to control how errors are handled, with the 'shiny.observer.error'
    global option. (#603, #604)

    !end-bullet!
-   !begin-bullet!
    Added an `escape` argument to `renderDataTable()` to escape the HTML
    entities in the data table for security reasons. This might break
    tables from previous versions of shiny that use raw HTML in the
    table content, and the old behavior can be brought back by
    `escape = FALSE` if you are aware of the security implications.
    (#627)

    !end-bullet!
-   !begin-bullet!
    Changed the URI encoding/decoding functions internally to use
    `encodeURI()`, `encodeURIComponent()`, and `decodeURIComponent()`
    from the httpuv package instead of `utils::URLencode()` and
    `utils::URLdecode()`. (#630)

    !end-bullet!
-   !begin-bullet!
    Shiny's web assets are now minified.

    !end-bullet!
-   !begin-bullet!
    The default reactive domain is now available in event handler
    functions. (#669)

    !end-bullet!
-   !begin-bullet!
    Password input fields can now be used, with `passwordInput()`.
    (#672)

    !end-bullet!

!end-bullets-100!

# shiny 0.10.2.2

!begin-bullets-101!

-   !begin-bullet!
    Remove use of `rstudio::viewer` in a code example, for R CMD check.
    !end-bullet!

!end-bullets-101!

# shiny 0.10.2.1

!begin-bullets-102!

-   !begin-bullet!
    Changed some examples to use `\donttest `{=tex}instead of
    `\dontrun`{=tex}.
    !end-bullet!

!end-bullets-102!

# shiny 0.10.2

!begin-bullets-103!

-   !begin-bullet!
    The minimal version of R required for the shiny package is 3.0.0
    now.

    !end-bullet!
-   !begin-bullet!
    Shiny apps can now consist of a single file, app.R, instead of ui.R
    and server.R.

    !end-bullet!
-   !begin-bullet!
    Upgraded DataTables from 1.9.4 to 1.10.2. This might be a breaking
    change if you have customized the DataTables options in your apps.
    (More info: https://github.com/rstudio/shiny/pull/558)

    !end-bullet!
-   !begin-bullet!
    File uploading via `fileInput()` works for Internet Explorer 8 and 9
    now. Note: IE8/9 do not support multiple files from a single file
    input. If you need to upload multiple files, you have to use one
    file input for each file.

    !end-bullet!
-   !begin-bullet!
    Switched away from reference classes to R6.

    !end-bullet!
-   !begin-bullet!
    Reactive log performance has been greatly improved.

    !end-bullet!
-   !begin-bullet!
    Added `Progress` and `withProgress`, to display the progress of
    computation on the client browser.

    !end-bullet!
-   !begin-bullet!
    Fixed #557: updateSelectizeInput(choices, server = TRUE) did not
    work when `choices` is a character vector.

    !end-bullet!
-   !begin-bullet!
    Searching in DataTables is case-insensitive and the search strings
    are not treated as regular expressions by default now. If you want
    case-sensitive searching or regular expressions, you can use the
    configuration options `search$caseInsensitive` and `search$regex`,
    e.g. `renderDataTable(..., options = list(search = list(caseInsensitve = FALSE, regex = TRUE)))`.

    !end-bullet!
-   !begin-bullet!
    Added support for `htmltools::htmlDependency`'s new `attachment`
    parameter to `renderUI`/`uiOutput`.

    !end-bullet!
-   !begin-bullet!
    Exported `createWebDependency`. It takes an
    `htmltools::htmlDependency` object and makes it available over
    Shiny's built-in web server.

    !end-bullet!
-   !begin-bullet!
    Custom output bindings can now render `htmltools::htmlDependency`
    objects at runtime using `Shiny.renderDependencies()`.

    !end-bullet!
-   !begin-bullet!
    Fixes to rounding behavior of sliderInput. (#301, #502)

    !end-bullet!
-   !begin-bullet!
    Updated selectize.js to version 0.11.2. (#596)

    !end-bullet!
-   !begin-bullet!
    Added `position` parameter to `navbarPage`.

    !end-bullet!

!end-bullets-103!

# shiny 0.10.1

!begin-bullets-104!

-   !begin-bullet!
    Added Unicode support for Windows. Shiny apps running on Windows
    must use the UTF-8 encoding for ui.R and server.R (also the optional
    global.R) if they contain non-ASCII characters. See this article for
    details and examples:
    http://shiny.rstudio.com/gallery/unicode-characters.html (#516)

    !end-bullet!
-   !begin-bullet!
    `runGitHub()` also allows the 'username/repo' syntax now, which is
    equivalent to `runGitHub('repo', 'username')`. (#427)

    !end-bullet!
-   !begin-bullet!
    `navbarPage()` now accepts a `windowTitle` parameter to set the web
    browser page title to something other than the title displayed in
    the navbar.

    !end-bullet!
-   !begin-bullet!
    Added an `inline` argument to `textOutput()`, `imageOutput()`,
    `plotOutput()`, and `htmlOutput()`. When `inline = TRUE`, these
    outputs will be put in `span()` instead of the default `div()`. This
    occurs automatically when these outputs are created via the inline
    expressions (e.g. `r renderText(expr)`) in R Markdown documents. See
    an R Markdown example at
    http://shiny.rstudio.com/gallery/inline-output.html (#512)

    !end-bullet!
-   !begin-bullet!
    Added support for option groups in the select/selectize inputs. When
    the `choices` argument for `selectInput()`/`selectizeInput()` is a
    list of sub-lists and any sub-list is of length greater than 1, the
    HTML tag `<optgroup>` will be used. See an example at
    http://shiny.rstudio.com/gallery/option-groups-for-selectize-input.html
    (#542)

    !end-bullet!

!end-bullets-104!

# shiny 0.10.0

!begin-bullets-105!

-   !begin-bullet!
    BREAKING CHANGE: By default, observers now terminate themselves if
    they were created during a session and that session ends. See
    ?domains for more details.

    !end-bullet!
-   !begin-bullet!
    Shiny can now be used in R Markdown v2 documents, to create "Shiny
    Docs": reports and presentations that combine narrative, statically
    computed output, and fully dynamic inputs and outputs. For more
    info, including examples, see
    http://rmarkdown.rstudio.com/authoring_shiny.html.

    !end-bullet!
-   !begin-bullet!
    The `session` object that can be passed into a server function
    (e.g. shinyServer(function(input, output, session) {...})) is now
    documented: see `?session`.

    !end-bullet!
-   !begin-bullet!
    Most inputs can now accept `NULL` label values to omit the label
    altogether.

    !end-bullet!
-   !begin-bullet!
    New `actionLink` input control; like `actionButton`, but with the
    appearance of a normal link.

    !end-bullet!
-   !begin-bullet!
    `renderPlot` now calls `print` on its result if it's visible
    (i.e. no more explicit `print()` required for ggplot2).

    !end-bullet!
-   !begin-bullet!
    Introduced Shiny app objects (see `?shinyApp`). These essentially
    replace the little-advertised ability for `runApp` to take a
    `list(ui=..., server=...)` as the first argument instead of a
    directory (though that ability remains for backward compatibility).
    Unlike those lists, Shiny app objects are tagged with class
    `shiny.appobj` so they can be run simply by printing them.

    !end-bullet!
-   !begin-bullet!
    Added `maskReactiveContext` function. It blocks the current reactive
    context, to evaluate expressions that shouldn't use reactive sources
    directly. (This should not be commonly needed.)

    !end-bullet!
-   !begin-bullet!
    Added `flowLayout`, `splitLayout`, and `inputPanel` functions for
    putting UI elements side by side. `flowLayout` lays out its children
    in a left-to-right, top-to-bottom arrangement. `splitLayout` evenly
    divides its horizontal space among its children (or unevenly divides
    if `cellWidths` argument is provided). `inputPanel` is like
    `flowPanel`, but with a light grey background, and is intended to be
    used to encapsulate small input controls wherever vertical space is
    at a premium.

    !end-bullet!
-   !begin-bullet!
    Added `serverInfo` to obtain info about the Shiny Server if the app
    is served through it.

    !end-bullet!
-   !begin-bullet!
    Added an `inline` argument (TRUE/FALSE) in `checkboxGroupInput()`
    and `radioButtons()` to allow the horizontal layout (inline = TRUE)
    of checkboxes or radio buttons. (Thanks, @saurfang, #481)

    !end-bullet!
-   !begin-bullet!
    `sliderInput` and `selectizeInput`/`selectInput` now use a standard
    horizontal size instead of filling up all available horizontal
    space. Pass `width="100%"` explicitly for the old behavior.

    !end-bullet!
-   !begin-bullet!
    Added the `updateSelectizeInput()` function to make it possible to
    process searching on the server side (i.e. using R), which can be
    much faster than the client side processing (i.e. using HTML and
    JavaScript). See the article at
    http://shiny.rstudio.com/articles/selectize.html for a detailed
    introduction.

    !end-bullet!
-   !begin-bullet!
    Fixed a bug of renderDataTable() when the data object only has 1 row
    and 1 column. (Thanks, ZJ Dai, #429)

    !end-bullet!
-   !begin-bullet!
    `renderPrint` gained a new argument 'width' to control the width of
    the text output, e.g. renderPrint({mtcars}, width = 40).

    !end-bullet!
-   !begin-bullet!
    Fixed #220: the zip file for a directory created by some programs
    may not have the directory name as its first entry, in which case
    runUrl() can fail. (#220)

    !end-bullet!
-   !begin-bullet!
    `runGitHub()` can also take a value of the form "username/repo" in
    its first argument, e.g. both runGitHub("shiny_example", "rstudio")
    and runGitHub("rstudio/shiny_example") are valid ways to run the
    GitHub repo.

    !end-bullet!

!end-bullets-105!

# shiny 0.9.1

!begin-bullets-106!

-   !begin-bullet!
    Fixed warning 'Error in Context\$new : could not find function
    "loadMethod"' that was happening to dependent packages on "R CMD
    check".
    !end-bullet!

!end-bullets-106!

# shiny 0.9.0

!begin-bullets-107!

-   !begin-bullet!
    BREAKING CHANGE: Added a `host` parameter to runApp() and
    runExample(), which defaults to the shiny.host option if it is
    non-NULL, or "127.0.0.1" otherwise. This means that by default,
    Shiny applications can only be accessed on the same machine from
    which they are served. To allow other clients to connect, as in
    previous versions of Shiny, use "0.0.0.0" (or the IP address of one
    of your network interfaces, if you care to be explicit about it).

    !end-bullet!
-   !begin-bullet!
    Added a new function `selectizeInput()` to use the JavaScript
    library selectize.js (https://github.com/brianreavis/selectize.js),
    which extends the basic select input in many aspects.

    !end-bullet!
-   !begin-bullet!
    The `selectInput()` function also gained a new argument
    `selectize = TRUE` to makes use of selectize.js by default. If you
    want to revert back to the original select input, you have to call
    selectInput(..., selectize = FALSE).

    !end-bullet!
-   !begin-bullet!
    Added Showcase mode, which displays the R code for an app right in
    the app itself. You can invoke Showcase mode by passing
    `display.mode="showcase"` to the `runApp()` function. Or, if an app
    is designed to run in Showcase mode by default, add a DESCRIPTION
    file in the app dir with Title, Author, and License fields; with
    "Type: Shiny"; and with "DisplayMode: Showcase".

    !end-bullet!
-   !begin-bullet!
    Upgraded to Bootstrap 2.3.2 and jQuery 1.11.0.

    !end-bullet!
-   !begin-bullet!
    Make `tags$head()` and `singleton()` behave correctly when used with
    `renderUI()` and `uiOutput()`. Previously, "hoisting content to the
    head" and "only rendering items a single time" were features that
    worked only when the page was initially loading, not in dynamic
    rendering.

    !end-bullet!
-   !begin-bullet!
    Files are now sourced with the `keep.source` option, to help with
    debugging and profiling.

    !end-bullet!
-   !begin-bullet!
    Support user-defined input parsers for data coming in from
    JavaScript using the parseShinyInput method.

    !end-bullet!
-   !begin-bullet!
    Fixed the bug #299: renderDataTable() can deal with 0-row data
    frames now. (reported by Harlan Harris)

    !end-bullet!
-   !begin-bullet!
    Added `navbarPage()` and `navbarMenu()` functions to create
    applications with multiple top level panels.

    !end-bullet!
-   !begin-bullet!
    Added `navlistPanel()` function to create layouts with a bootstrap
    navlist on the left and tabPanels on the right

    !end-bullet!
-   !begin-bullet!
    Added `type` parameter to `tabsetPanel()` to enable the use of pill
    style tabs in addition to the standard ones.

    !end-bullet!
-   !begin-bullet!
    Added `position` paramter to `tabsetPanel()` to enable positioning
    of tabs above, below, left, or right of tab content.

    !end-bullet!
-   !begin-bullet!
    Added `fluidPage()` and `fixedPage()` functions as well as related
    row and column layout functions for creating arbitrary bootstrap
    grid layouts.

    !end-bullet!
-   !begin-bullet!
    Added `hr()` builder function for creating horizontal rules.

    !end-bullet!
-   !begin-bullet!
    Automatically concatenate duplicate attributes in tag definitions

    !end-bullet!
-   !begin-bullet!
    Added `responsive` parameter to page building functions for
    opting-out of bootstrap responsive css.

    !end-bullet!
-   !begin-bullet!
    Added `theme` parameter to page building functions for specifying
    alternate bootstrap css styles.

    !end-bullet!
-   !begin-bullet!
    Added `icon()` function for embedding icons from the font awesome
    icon library

    !end-bullet!
-   !begin-bullet!
    Added `makeReactiveBinding` function to turn a "regular" variable
    into a reactive one (i.e. reading the variable makes the current
    reactive context dependent on it, and setting the variable is a
    source of reactivity).

    !end-bullet!
-   !begin-bullet!
    Added a function `withMathJax()` to include the MathJax library in
    an app.

    !end-bullet!
-   !begin-bullet!
    The argument `selected` in checkboxGroupInput(), selectInput(), and
    radioButtons() refers to the value(s) instead of the name(s) of the
    argument `choices` now. For example, the value of the `selected`
    argument in selectInput(..., choices = c('Label 1' = 'x1', 'Label 2'
    = 'x2'), selected = 'Label 2') must be updated to 'x2', although
    names/labels will be automatically converted to values internally
    for backward compatibility. The same change applies to
    updateCheckboxGroupInput(), updateSelectInput(), and
    updateRadioButtons() as well. (#340)

    !end-bullet!
-   !begin-bullet!
    Now it is possible to only update the value of a checkbox group,
    select input, or radio buttons using the `selected` argument without
    providing the `choices` argument in updateCheckboxGroupInput(),
    updateSelectInput(), and updateRadioButtons(), respectively. (#340)

    !end-bullet!
-   !begin-bullet!
    Added `absolutePanel` and `fixedPanel` functions for creating
    absolute- and fixed-position panels. They can be easily made
    user-draggable by specifying `draggable = TRUE`.

    !end-bullet!
-   !begin-bullet!
    For the `options` argument of the function `renderDataTable()`, we
    can pass literal JavaScript code to the DataTables library via
    `I()`. This makes it possible to use any JavaScript object in the
    options, e.g. a JavaScript function (which is not supported in
    JSON). See `?renderDataTable` for details and examples.

    !end-bullet!
-   !begin-bullet!
    DataTables also works under IE8 now.

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in DataTables pagination when searching is turned on,
    which caused failures for matrices as well as empty rows when
    displaying data frames using renderDataTable().

    !end-bullet!
-   !begin-bullet!
    The `options` argument in `renderDataTable()` can also take a
    function that returns a list. This makes it possible to use reactive
    values in the options. (#392)

    !end-bullet!
-   !begin-bullet!
    `renderDataTable()` respects more DataTables options now: (1) either
    bPaginate = FALSE or iDisplayLength = -1 will disable pagination
    (i.e. all rows are returned from the data); besides, this means we
    can also use -1 in the length menu, e.g. aLengthMenu = list(c(10,
    30, -1), list(10, 30, 'All')); (2) we can disable searching for
    individual columns through the bSearchable option, e.g. aoColumns =
    list(list(bSearchable = FALSE), list(bSearchable = TRUE),...) (the
    search box for the first column is hidden); (3) we can turn off
    searching entirely (for both global searching and individual
    columns) using the option bFilter = FALSE.

    !end-bullet!
-   !begin-bullet!
    Added an argument `callback` in `renderDataTable()` so that a custom
    JavaScript function can be applied to the DataTable object. This
    makes it much easier to use DataTables plug-ins.

    !end-bullet!
-   !begin-bullet!
    For numeric columns in a DataTable, the search boxes support lower
    and upper bounds now: a search query of the form "lower,upper"
    (without quotes) indicates the limits \[lower, upper\]. For a column
    X, this means the rows corresponding to X \>= lower & X \<= upper
    are returned. If we omit either the lower limit or the upper limit,
    only the other limit will be used, e.g. ",upper" means X \<= upper.

    !end-bullet!
-   !begin-bullet!
    `updateNumericInput(value)` tries to preserve numeric precision by
    avoiding scientific notation when possible, e.g. 102145 is no longer
    rounded to 1.0214e+05 = 102140. (Thanks, Martin Loos. #401)

    !end-bullet!
-   !begin-bullet!
    `sliderInput()` no longer treats a label wrapped in HTML() as plain
    text, e.g. the label in sliderInput(..., label =
    HTML('`<em>`{=html}A Label`</em>`{=html}')) will not be escaped any
    more. (#119)

    !end-bullet!
-   !begin-bullet!
    Fixed #306: the trailing slash in a path could fail
    `addResourcePath()` under Windows. (Thanks, ZJ Dai)

    !end-bullet!
-   !begin-bullet!
    Dots are now legal characters for inputId/outputId. (Thanks, Kevin
    Lindquist. #358)

    !end-bullet!

!end-bullets-107!

# shiny 0.8.0

!begin-bullets-108!

-   !begin-bullet!
    Debug hooks are registered on all user-provided functions and
    (reactive) expressions (e.g., in renderPlot()), which makes it
    possible to set breakpoints in these functions using the latest
    version of the RStudio IDE, and the RStudio visual debugging tools
    can be used to debug Shiny apps. Internally, the registration is
    done via installExprFunction(), which is a new function introduced
    in this version to replace exprToFunction() so that the registration
    can be automatically done.

    !end-bullet!
-   !begin-bullet!
    Added a new function renderDataTable() to display tables using the
    JavaScript library DataTables. It includes basic features like
    pagination, searching (global search or search by individual
    columns), sorting (by single or multiple columns). All these
    features are implemented on the R side; for example, we can use R
    regular expressions for searching. Besides, it also uses the
    Bootstrap CSS style. See the full documentation and examples in the
    tutorial: http://rstudio.github.io/shiny/tutorial/#datatables

    !end-bullet!
-   !begin-bullet!
    Added a new option `shiny.error` which can take a function as an
    error handler. It is called when an error occurs in an app (in
    user-provided code), e.g., after we set options(shiny.error =
    recover), we can enter a specified environment in the call stack to
    debug our code after an error occurs.

    !end-bullet!
-   !begin-bullet!
    The argument `launch.browser` in runApp() can also be a function,
    which takes the URL of the shiny app as its input value.

    !end-bullet!
-   !begin-bullet!
    runApp() uses a random port between 3000 and 8000 instead of 8100
    now. It will try up to 20 ports in case certain ports are not
    available.

    !end-bullet!
-   !begin-bullet!
    Fixed a bug for conditional panels: the value `input.id` in the
    condition was not correctly retrieved when the input widget had a
    type, such as numericInput(). (reported by Jason Bryer)

    !end-bullet!
-   !begin-bullet!
    Fixed two bugs in plotOutput(); clickId and hoverId did not give
    correct coordinates in Firefox, or when the axis limits of the plot
    were changed. (reported by Chris Warth and Greg D)

    !end-bullet!
-   !begin-bullet!
    The minimal required version for the httpuv package was increased to
    1.2 (on CRAN now).

    !end-bullet!

!end-bullets-108!

# shiny 0.7.0

!begin-bullets-109!

-   !begin-bullet!
    Stopped sending websocket subprotocol. This fixes a compatibility
    issue with Google Chrome 30.

    !end-bullet!
-   !begin-bullet!
    The `input` and `output` objects are now also accessible via
    `session$input` and `session$output`.

    !end-bullet!
-   !begin-bullet!
    Added click and hover events for static plots; see `?plotOutput` for
    details.

    !end-bullet!
-   !begin-bullet!
    Added optional logging of the execution states of a reactive
    program, and tools for visualizing the log data. To use, start a new
    R session and call `options(shiny.reactlog=TRUE)`. Then launch a
    Shiny app and interact with it. Press Ctrl+F3 (or for Mac, Cmd+F3)
    in the browser to launch an interactive visualization of the
    reactivity that has occurred. See `?showReactLog` for more
    information.

    !end-bullet!
-   !begin-bullet!
    Added `includeScript()` and `includeCSS()` functions.

    !end-bullet!
-   !begin-bullet!
    Reactive expressions now have class="reactive" attribute. Also added
    `is.reactive()` and `is.reactivevalues()` functions.

    !end-bullet!
-   !begin-bullet!
    New `stopApp()` function, which stops an app and returns a value to
    the caller of `runApp()`.

    !end-bullet!
-   !begin-bullet!
    Added the `shiny.usecairo` option, which can be used to tell Shiny
    not to use Cairo for PNG output even when it is installed. (Defaults
    to `TRUE`.)

    !end-bullet!
-   !begin-bullet!
    Speed increases for `selectInput()` and `radioButtons()`, and their
    corresponding updater functions, for when they have many options.

    !end-bullet!
-   !begin-bullet!
    Added `tagSetChildren()` and `tagAppendChildren()` functions.

    !end-bullet!
-   !begin-bullet!
    The HTTP request object that created the websocket is now accessible
    from the `session` object, as `session$request`. This is a Rook-like
    request environment that can be used to access HTTP headers, among
    other things. (Note: When running in a Shiny Server environment, the
    request will reflect the proxy HTTP request that was made from the
    Shiny Server process to the R process, not the request that was made
    from the web browser to Shiny Server.)

    !end-bullet!
-   !begin-bullet!
    Fix `getComputedStyle` issue, for IE8 browser compatibility (#196).
    Note: Shiny Server is still required for IE8/9 compatibility.

    !end-bullet!
-   !begin-bullet!
    Add shiny.sharedSecret option, to require the HTTP header
    Shiny-Shared-Secret to be set to the given value.

    !end-bullet!

!end-bullets-109!

# shiny 0.6.0

!begin-bullets-110!

-   !begin-bullet!
    `tabsetPanel()` can be directed to start with a specific tab
    selected.

    !end-bullet!
-   !begin-bullet!
    Fix bug where multiple file uploads with 3 or more files result in
    incorrect data.

    !end-bullet!
-   !begin-bullet!
    Add `withTags()` function.

    !end-bullet!
-   !begin-bullet!
    Add dateInput and dateRangeInput.

    !end-bullet!
-   !begin-bullet!
    `shinyServer()` now takes an optional `session` argument, which is
    used for communication with the session object.

    !end-bullet!
-   !begin-bullet!
    Add functions to update values of existing inputs on a page, instead
    of replacing them entirely.

    !end-bullet!
-   !begin-bullet!
    Allow listening on domain sockets.

    !end-bullet!
-   !begin-bullet!
    Added `actionButton()` to Shiny.

    !end-bullet!
-   !begin-bullet!
    The server can now send custom JSON messages to the client. On the
    client side, functions can be registered to handle these messages.

    !end-bullet!
-   !begin-bullet!
    Callbacks can be registered to be called at the end of a client
    session.

    !end-bullet!
-   !begin-bullet!
    Add ability to set priority of observers and outputs. Each priority
    level gets its own queue.

    !end-bullet!
-   !begin-bullet!
    Fix bug where the presence of a submit button would prevent sending
    of metadata until the button was clicked.

    !end-bullet!
-   !begin-bullet!
    `reactiveTimer()` and `invalidateLater()` by default no longer
    invalidate reactive objects after the client session has closed.

    !end-bullet!
-   !begin-bullet!
    Shiny apps can be run without a server.r and ui.r file.

    !end-bullet!

!end-bullets-110!

# shiny 0.5.0

!begin-bullets-111!

-   !begin-bullet!
    Switch from websockets package for handling websocket connections to
    httpuv.

    !end-bullet!
-   !begin-bullet!
    New method for detecting hidden output objects. Instead of checking
    that height and width are 0, it checks that the object or any
    ancestor in the DOM has style display:none.

    !end-bullet!
-   !begin-bullet!
    Add `clientData` reactive values object, which carries information
    about the client. This includes the hidden status of output objects,
    height/width plot output objects, and the URL of the browser.

    !end-bullet!
-   !begin-bullet!
    Add `parseQueryString()` function.

    !end-bullet!
-   !begin-bullet!
    Add `renderImage()` function for sending arbitrary image files to
    the client, and its counterpart, `imageOutput()`.

    !end-bullet!
-   !begin-bullet!
    Add support for high-resolution (Retina) displays.

    !end-bullet!
-   !begin-bullet!
    Fix bug #55, where `renderTable()` would throw error with an empty
    data frame.

    !end-bullet!

!end-bullets-111!

# shiny 0.4.1

!begin-bullets-112!

-   !begin-bullet!
    Fix bug where width and height weren't passed along properly from
    `reactivePlot` to `renderPlot`.

    !end-bullet!
-   !begin-bullet!
    Fix bug where infinite recursion would happen when `reactivePlot`
    was passed a function for width or height.

    !end-bullet!

!end-bullets-112!

# shiny 0.4.0

!begin-bullets-113!

-   !begin-bullet!
    Added suspend/resume capability to observers.

    !end-bullet!
-   !begin-bullet!
    Output objects are automatically suspended when they are hidden on
    the user's web browser.

    !end-bullet!
-   !begin-bullet!
    `runGist()` accepts GitHub's new URL format, which includes the
    username.

    !end-bullet!
-   !begin-bullet!
    `reactive()` and `observe()` now take expressions instead of
    functions.

    !end-bullet!
-   !begin-bullet!
    `reactiveText()`, `reactivePlot()`, and so on, have been renamed to
    `renderText()`, `renderPlot()`, etc. They also now take expressions
    instead of functions.

    !end-bullet!
-   !begin-bullet!
    Fixed a bug where empty values in a numericInput were sent to the R
    process as 0. They are now sent as NA.

    !end-bullet!

!end-bullets-113!

# shiny 0.3.1

!begin-bullets-114!

-   !begin-bullet!
    Fix issue #91: bug where downloading files did not work.

    !end-bullet!
-   !begin-bullet!
    Add \[\[\<- operator for shinyoutput object, making it possible to
    assign values with `output[['plot1']] <- ...`.

    !end-bullet!
-   !begin-bullet!
    Reactive functions now preserve the visible/invisible state of their
    returned values.

    !end-bullet!

!end-bullets-114!

# shiny 0.3.0

!begin-bullets-115!

-   !begin-bullet!
    Reactive functions are now evaluated lazily.

    !end-bullet!
-   !begin-bullet!
    Add `reactiveValues()`.

    !end-bullet!
-   !begin-bullet!
    Using `as.list()` to convert a reactivevalues object (like `input`)
    to a list is deprecated. The new function `reactiveValuesToList()`
    should be used instead.

    !end-bullet!
-   !begin-bullet!
    Add `isolate()`. This function is used for accessing reactive
    functions, without them invalidating their parent contexts.

    !end-bullet!
-   !begin-bullet!
    Fix issue #58: bug where reactive functions are not re-run when all
    items in a checkboxGroup are unchecked.

    !end-bullet!
-   !begin-bullet!
    Fix issue #71, where `reactiveTable()` would return blank if the
    first element of a data frame was NA.

    !end-bullet!
-   !begin-bullet!
    In `plotOutput`, better validation for CSS units when specifying
    width and height.

    !end-bullet!
-   !begin-bullet!
    `reactivePrint()` no longer displays invisible output.

    !end-bullet!
-   !begin-bullet!
    `reactiveText()` no longer displays printed output, only the return
    value from a function.

    !end-bullet!
-   !begin-bullet!
    The `runGitHub()` and `runUrl()` functions have been added, for
    running Shiny apps from GitHub repositories and zip/tar files at
    remote URLs.

    !end-bullet!
-   !begin-bullet!
    Fix issue #64, where pressing Enter in a textbox would cause a form
    to submit.

    !end-bullet!

!end-bullets-115!

# shiny 0.2.4

!begin-bullets-116!

-   !begin-bullet!
    `runGist` has been updated to use the new download URLs from
    https://gist.github.com.

    !end-bullet!
-   !begin-bullet!
    Shiny now uses `CairoPNG()` for output, when the Cairo package is
    available. This provides better-looking output on Linux and Windows.

    !end-bullet!

!end-bullets-116!

# shiny 0.2.3

!begin-bullets-117!

-   !begin-bullet!
    Ignore request variables for routing purposes
    !end-bullet!

!end-bullets-117!

# shiny 0.2.2

!begin-bullets-118!

-   !begin-bullet!
    Fix CRAN warning (assigning to global environment)
    !end-bullet!

!end-bullets-118!

# shiny 0.2.1

!begin-bullets-119!

-   !begin-bullet!
    \[BREAKING\] Modify API of `downloadHandler`: The `content` function
    now takes a file path, not writable connection, as an argument. This
    makes it much easier to work with APIs that only write to file
    paths, not connections.
    !end-bullet!

!end-bullets-119!

# shiny 0.2.0

!begin-bullets-120!

-   !begin-bullet!
    Fix subtle name resolution bug--the usual symptom being S4 methods
    not being invoked correctly when called from inside of ui.R or
    server.R
    !end-bullet!

!end-bullets-120!

# shiny 0.1.14

!begin-bullets-121!

-   !begin-bullet!
    Fix slider animator, which broke in 0.1.10
    !end-bullet!

!end-bullets-121!

# shiny 0.1.13

!begin-bullets-122!

-   !begin-bullet!
    Fix temp file leak in reactivePlot
    !end-bullet!

!end-bullets-122!

# shiny 0.1.12

!begin-bullets-123!

-   !begin-bullet!
    Fix problems with runGist on Windows

    !end-bullet!
-   !begin-bullet!
    Add feature for on-the-fly file downloads (e.g. CSV data, PDFs)

    !end-bullet!
-   !begin-bullet!
    Add CSS hooks for app-wide busy indicators

    !end-bullet!

!end-bullets-123!

# shiny 0.1.11

!begin-bullets-124!

-   !begin-bullet!
    Fix input binding with IE8 on Shiny Server

    !end-bullet!
-   !begin-bullet!
    Fix issue #41: reactiveTable should allow print options too

    !end-bullet!
-   !begin-bullet!
    Allow dynamic sizing of reactivePlot (i.e. using a function instead
    of a fixed value)

    !end-bullet!

!end-bullets-124!

# shiny 0.1.10

!begin-bullets-125!

-   !begin-bullet!
    Support more MIME types when serving out of www

    !end-bullet!
-   !begin-bullet!
    Fix issue #35: Allow modification of untar args

    !end-bullet!
-   !begin-bullet!
    headerPanel can take an explicit window title parameter

    !end-bullet!
-   !begin-bullet!
    checkboxInput uses correct attribute `checked` instead of `selected`

    !end-bullet!
-   !begin-bullet!
    Fix plot rendering with IE8 on Shiny Server

    !end-bullet!

!end-bullets-125!

# shiny 0.1.9

!begin-bullets-126!

-   !begin-bullet!
    Much less flicker when updating plots

    !end-bullet!
-   !begin-bullet!
    More customizable error display

    !end-bullet!
-   !begin-bullet!
    Add `includeText`, `includeHTML`, and `includeMarkdown` functions
    for putting text, HTML, and Markdown content from external files in
    the application's UI.

    !end-bullet!

!end-bullets-126!

# shiny 0.1.8

!begin-bullets-127!

-   !begin-bullet!
    Add `runGist` function for conveniently running a Shiny app that is
    published on gist.github.com.

    !end-bullet!
-   !begin-bullet!
    Fix issue #27: Warnings cause reactive functions to stop executing.

    !end-bullet!
-   !begin-bullet!
    The server.R and ui.R filenames are now case insensitive.

    !end-bullet!
-   !begin-bullet!
    Add `wellPanel` function for creating inset areas on the page.

    !end-bullet!
-   !begin-bullet!
    Add `bootstrapPage` function for creating new Bootstrap based
    layouts from scratch.

    !end-bullet!

!end-bullets-127!

# shiny 0.1.7

!begin-bullets-128!

-   !begin-bullet!
    Fix issue #26: Shiny.OutputBindings not correctly exported.

    !end-bullet!
-   !begin-bullet!
    Add `repeatable` function for making easily repeatable versions of
    random number generating functions.

    !end-bullet!
-   !begin-bullet!
    Transcode JSON into UTF-8 (prevents non-ASCII reactivePrint values
    from causing errors on Windows).

    !end-bullet!

!end-bullets-128!

# shiny 0.1.6

!begin-bullets-129!

-   !begin-bullet!
    Import package dependencies, instead of attaching them (with the
    exception of websockets, which doesn't currently work unless
    attached).

    !end-bullet!
-   !begin-bullet!
    conditionalPanel was animated, now it is not.

    !end-bullet!
-   !begin-bullet!
    bindAll was not correctly sending initial values to the server;
    fixed.

    !end-bullet!

!end-bullets-129!

# shiny 0.1.5

!begin-bullets-130!

-   !begin-bullet!
    BREAKING CHANGE: JS APIs Shiny.bindInput and Shiny.bindOutput
    removed and replaced with Shiny.bindAll; Shiny.unbindInput and
    Shiny.unbindOutput removed and replaced with Shiny.unbindAll.

    !end-bullet!
-   !begin-bullet!
    Add file upload support (currently only works with Chrome and
    Firefox). Use a normal HTML file input, or call the `fileInput` UI
    function.

    !end-bullet!
-   !begin-bullet!
    Shiny.unbindOutputs did not work, now it does.

    !end-bullet!
-   !begin-bullet!
    Generally improved robustness of dynamic input/output bindings.

    !end-bullet!
-   !begin-bullet!
    Add conditionalPanel UI function to allow showing/hiding UI based on
    a JS expression; for example, whether an input is a particular
    value. Also works in raw HTML (add the `data-display-if` attribute
    to the element that should be shown/hidden).

    !end-bullet!
-   !begin-bullet!
    htmlOutput (CSS class `shiny-html-output`) can contain inputs and
    outputs.

    !end-bullet!

!end-bullets-130!

# shiny 0.1.4

!begin-bullets-131!

-   !begin-bullet!
    Allow Bootstrap tabsets to act as reactive inputs; their value
    indicates which tab is active

    !end-bullet!
-   !begin-bullet!
    Upgrade to Bootstrap 2.1

    !end-bullet!
-   !begin-bullet!
    Add `checkboxGroupInput` control, which presents a list of
    checkboxes and returns a vector of the selected values

    !end-bullet!
-   !begin-bullet!
    Add `addResourcePath`, intended for reusable component authors to
    access CSS, JavaScript, image files, etc. from their package
    directories

    !end-bullet!
-   !begin-bullet!
    Add Shiny.bindInputs(scope), .unbindInputs(scope),
    .bindOutputs(scope), and .unbindOutputs(scope) JS API calls to allow
    dynamic binding/unbinding of HTML elements

    !end-bullet!

!end-bullets-131!

# shiny 0.1.3

!begin-bullets-132!

-   !begin-bullet!
    Introduce Shiny.inputBindings.register JS API and InputBinding
    class, for creating custom input controls

    !end-bullet!
-   !begin-bullet!
    Add `step` parameter to numericInput

    !end-bullet!
-   !begin-bullet!
    Read names of input using `names(input)`

    !end-bullet!
-   !begin-bullet!
    Access snapshot of input as a list using `as.list(input)`

    !end-bullet!
-   !begin-bullet!
    Fix issue #10: Plots in tabsets not rendered

    !end-bullet!

!end-bullets-132!

# shiny 0.1.2

!begin-bullets-133!

-   !begin-bullet!
    Initial private beta release!
    !end-bullet!

!end-bullets-133!

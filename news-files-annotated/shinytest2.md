# shinytest2 0.4.1

## Bug

!begin-bullets-1!

-   !begin-bullet!
    Fixed a bug where `AppDriver$expect_values(transform=)` default
    value caused error to be thrown. (#413)
    !end-bullet!

!end-bullets-1!

# shinytest2 0.4.0

## Breaking changes

!begin-bullets-2!

-   !begin-bullet!
    `{shinytest2}` will skip and test on CRAN where an `AppDriver` is
    initialized. From a request from CRAN, using `{chromote}` during
    CRAN package testing should be avoided as it can create failing
    tests over time due to application changes within the testing
    machine, not changes in package code. Since `AppDriver` directly
    depends on `{chromote}` to test Shiny applications, creating an
    `AppDriver` should always skip the current test during CRAN package
    testing. This decision was made to achieve consistent testing
    behavior over time (rather than silently skipping tests that are
    expected to run due to a Chrome update). To escape this behavior,
    you can set the system environment variable
    `SHINYTEST2_APP_DRIVER_TEST_ON_CRAN=1`. Following `{chromote}`'s
    recommendation, you should test your R package in a CI environment,
    ideally on a weekly or monthly schedule to test your Shiny app with
    the latest R package versions. (#407)
    !end-bullet!

!end-bullets-2!

## Bug / Improvements

!begin-bullets-3!

-   !begin-bullet!
    Add support for `$click()`ing `{bslib}`'s `input_task_button()`
    (#389).

    !end-bullet!
-   !begin-bullet!
    Improved the error message when an app takes too long to start up
    (@LouisLeNezet, #394).

    !end-bullet!
-   !begin-bullet!
    The `threshold` and `kernel_size` default values of the
    `AppDriver$expect_screenshot()` method are now configurable via two
    new global options: `shinytest2.compare_screenshot.threshold` and
    `shinytest2.compare_screenshot.kernel_size` (#401)

    !end-bullet!
-   !begin-bullet!
    `{shinytest2}` now imports `{cli}` and no longer imports `{crayon}`
    (@olivroy, #399).

    !end-bullet!
-   !begin-bullet!
    Added `{testthat}`'s snapshot file `transform=` parameter support to
    `AppDriver$expect_download()` and `AppDriver$expect_values()`. This
    allows for text transformations of the snapshot files before they
    are compared. (#403)

    !end-bullet!

!end-bullets-3!

# shinytest2 0.3.2

## Bug / Improvements

!begin-bullets-4!

-   !begin-bullet!
    `{shinytest2}` now uses `{rlang}` and longer depends on `{ellipsis}`
    (@olivroy, #382).

    !end-bullet!
-   !begin-bullet!
    `{shinytest2}` now warns rather than erroring when a potentially
    non-existent global variable is found in the server function, such
    as when column names are passed to `dplyr::select()` (thanks
    @matt-sd-watson @MichalLauer, #385).

    !end-bullet!

!end-bullets-4!

# shinytest2 0.3.1

## Breaking changes

!begin-bullets-5!

-   !begin-bullet!
    `AppDriver$get_screenshot()`/`AppDriver$expect_screenshot()` now
    default an underlying `deviceScaleFactor` option to 0 instead of 1.
    This ensures that image sizes are more consistent across devices. To
    revert to prior behavior, provide
    `screenshot_args = list(scale = 1)` to
    `get_screenshot()`/`expect_screenshot()` (#350).
    !end-bullet!

!end-bullets-5!

## Bug / Improvements

!begin-bullets-6!

-   !begin-bullet!
    shinytest2 no longer checks if the computer running the tests is
    connected to the internet when determining if shinytest2 can connect
    to the server hosting the Shiny app being tested. (@Riraro #364)
    !end-bullet!

!end-bullets-6!

# shinytest2 0.3.0

## Breaking changes

!begin-bullets-7!

-   !begin-bullet!
    `AppDriver$get_screenshot(selector=)`,
    `AppDriver$expect_screenshot(selector=)`'s default `selector` value
    changed from the HTML DOM selector `"html"` to `"scrollable_area"`.
    `"scrollable_area"` is a custom `{shinytest2}` selector that will
    take a screenshot of the entire scrollable area. While a breaking
    change, this new default value is more intuitive and robust to
    non-standard CSS height and width values that fail with `"html"`.
    (#325)
    !end-bullet!

!end-bullets-7!

## New features

!begin-bullets-8!

-   !begin-bullet!
    `AppDriver$get_screenshot(selector=)`,
    `AppDriver$expect_screenshot(selector=)`, and their corresponding
    `selector` values inside `screenshot_args=`, gained two custom
    `{shinytest2}` values: `"scrollable_area"` and `"viewport"`.
    `"scrollable_area"` is the new default value and it takes a
    screenshot of the entire scrollable area. This is more intuitive
    than the previous value of the HTML DOM selector `"html"` which may
    result in a surprising height and width. `"viewport"` will take a
    screenshot of the current browser viewport. This means it will take
    a screenshot of whatever `$view()` is currently looking at. (#325)

    !end-bullet!
-   !begin-bullet!
    GitHub Action `rstudio/shinytest2/actions/test-app` added support
    for multiple directories in `app-dir`. These can be supplied using
    multiline string yaml syntax. See use-ci vignette for more details.
    (#332)

    !end-bullet!
-   !begin-bullet!
    GitHub Action `rstudio/shinytest2/actions/test-app` changed the
    default value of `upload-snapshots` from `false` to `true`. This is
    in preparation for automated snapshot handling. (#332)

    !end-bullet!

!end-bullets-8!

## Bug / Improvements

!begin-bullets-9!

-   !begin-bullet!
    Set the directory to the Shiny App directory before starting the
    background R process. This allows for local `.Rprofile` and
    `.Renviron` files to be found naturally. (#275)
    !end-bullet!

!end-bullets-9!

# shinytest2 0.2.1

!begin-bullets-10!

-   !begin-bullet!
    Fixed request from CRAN to correct C++11 problems in web checks
    (#326)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where `compare_screenshot_threshold()` did not safe guard
    against errors thrown by `screenshot_max_difference()` (#276)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where preview overflow did not have length of 1
    (@cpsievert #291)

    !end-bullet!
-   !begin-bullet!
    Better support for saving global variables for a Shiny server
    function (#307)

    !end-bullet!
-   !begin-bullet!
    Better error message when both app.R and server.R are found (#284)

    !end-bullet!
-   !begin-bullet!
    Force JS code to be a character for `{glue}` support (#288)

    !end-bullet!

!end-bullets-10!

# shinytest2 0.2.0

## Breaking changes

### Shiny log levels

!begin-bullets-11!

-   !begin-bullet!
    `AppDriver$get_logs()` has changed the `level` values when
    `location` equals `"shiny"`. The levels of `"error"` and `"info"`
    have been renamed to `"stderr"` and `"stdout"`. (#265)
    !end-bullet!

!end-bullets-11!

### Download snapshot files

!begin-bullets-12!

-   !begin-bullet!
    All downloaded snapshots will contain a counter prefix (e.g. `003-`
    in `003-my_custom_name.txt`) to avoid having two files point to the
    same snapshot file location. Sharing the same snapshot file is
    dangerous as the last file written is stored as truth, overwriting
    any knowledge of the original file. (#261)
    !end-bullet!
-   !begin-bullet!
    If a `content-disposition` header is provided and
    `AppDriver$expect_download(name = NULL)` (default), the snapshot
    file will try to be saved using the `content-disposition` header
    value. When paired with `compare = NULL` (default), `{testthat}`
    will choose the proper `compare` method between
    `compare_file_text()` and `compare_file_binary()`. See
    `?testthat::expect_snapshot_file` for more details. (#261)
    !end-bullet!
-   !begin-bullet!
    `AppDriver$expect_download()` will now download snapshot files using
    a sanitized file name,
    e.g. `AppDriver$expect_download(name = "my/custom/name.txt")` will
    be stored in the file
    `tests/testthat/_snaps/003-my_custom_name.txt`. (#261)
    !end-bullet!

!end-bullets-12!

### Timeout values

The **default** timeout values for many `AppDriver` methods have been
altered and are shown in the table below. (#263)

  Method                                   Previous value (ms)   New value (ms)
  -------------------------------------- --------------------- ----------------
  `AppDriver$new(load_timeout=)`                   `10 * 1000`      `15 * 1000`
  `AppDriver$set_inputs(timeout_=)`                 `3 * 1000`       `4 * 1000`
  `AppDriver$upload_file(timeout_=)`                `3 * 1000`       `4 * 1000`
  `AppDriver$expect_js(timeout=)`                  `15 * 1000`       `4 * 1000`
  `AppDriver$get_js(timeout=)`                     `15 * 1000`       `4 * 1000`
  `AppDriver$run_js(timeout=)`                     `15 * 1000`       `4 * 1000`
  `AppDriver$wait_for_idle(timeout=)`              `30 * 1000`       `4 * 1000`
  `AppDriver$wait_for_value(timeout=)`             `15 * 1000`       `4 * 1000`
  `AppDriver$wait_for_js(timeout=)`                `30 * 1000`       `4 * 1000`
  `AppDriver$stop(signal_timeout=)`                      `250`            `500`

`AppDriver$new(load_timeout=)` is initialized using the first numeric
value found: 1. Supplied directly: `AppDriver$new(load_timeout=)` 2.
Locally defined option: `options(shinytest2.load_timeout=)` 3. System
environment variable: `SHINYTEST2_LOAD_TIMEOUT` 4. `15 * 1000` (15s)

`AppDriver$new(timeout=)` is initialized using the first numeric value
found: 1. Supplied directly: `AppDriver$new(timeout=)` 2. Locally
defined option: `options(shinytest2.timeout=)` 3. System environment
variable: `SHINYTEST2_TIMEOUT` 4. `4 * 1000` (4s)

`AppDriver$stop(signal_timeout=)` is initialized using the first numeric
value found: 1. Supplied directly: `AppDriver$stop(signal_timeout=)` 2.
Locally defined option: `options(shinytest2.signal_timeout=)` 3. System
environment variable: `SHINYTEST2_SIGNAL_TIMEOUT` 4. If the system
environment variable `R_COVR=true`: `20 * 1000` (20s) 5. `500` (0.5s)

All remaining `AppDriver` methods will default their `timeout` and
`timeout_` parameters to the initialized `AppDriver$new(timeout=)`
value. For example, if `app <- AppDriver$new(timeout = 500)` then
`app$get_js(timeout=)` will default to `500` milliseconds.

## New Features

!begin-bullets-13!

-   !begin-bullet!
    `compare_screenshot_threshold()` is a new method to compare
    screenshots and allow small differences between two screenshots.
    This method checks every subset matrix of the pixel differences
    between the two images. If any total difference is larger than the
    `threshold` value, the two images are considered to be different.
    The subset matrix size can be increased by setting `kernel_size`.
    (#231)

    !end-bullet!
-   !begin-bullet!
    Support for supplying your own compare method to
    `AppDriver$expect_screenshot(compare=)` has been added. By default,
    `AppDriver$expect_screenshot(compare=)` is set to
    `compare_screenshot_threshold(threshold = NULL)` which is equivalent
    to `testthat::compare_file_binary()`. No default screenshot
    expectation behavior has changed. (#231)

    !end-bullet!
-   !begin-bullet!
    `test_app()` now inherits the existing test reporter when testing
    multiple apps within a package test file. This allows for a
    seamless, single reporter output instead of nested reporters being
    displayed. (#192)

    !end-bullet!
-   !begin-bullet!
    The recording browser window is now closed when either the "Save
    test and exit" or "Exit" buttons are clicked. (@daattali, #202)

    !end-bullet!
-   !begin-bullet!
    When testing and `{chromote}` can not be started, the test will be
    skipped. When testing on windows in CI, `{chromote}` will get an
    extra attempt to be started (#225)

    !end-bullet!
-   !begin-bullet!
    Make `{globals}` an `Imports` package, instead of a `Suggests`
    package (#223)

    !end-bullet!
-   !begin-bullet!
    Add support for *not* recording the screen size when recording a
    test (#223)

    !end-bullet!

!end-bullets-13!

## Bug / Improvements

!begin-bullets-14!

-   !begin-bullet!
    Fix set of bugs found by @daattali including test files should be
    opened in the IDE after recording and test and replace missing
    images in the website (#199)

    !end-bullet!
-   !begin-bullet!
    Provide example workflows on how to use
    `rstudio/shinytest2/actions/test-app` GHA action (#217)

    !end-bullet!
-   !begin-bullet!
    When setting a date time slider value, it can now handle array
    inputs properly. When recording a date time slider value, numeric
    values will not be recorded as milliseconds instead of seconds since
    epoch. (#223)

    !end-bullet!
-   !begin-bullet!
    When creating a test setup file for `{shinytest2}`, use the file
    path `tests/testthat/setup-shinytest2.R` instead of
    `tests/testthat/setup.R` to provide some quick context within the
    file name (#224)

    !end-bullet!
-   !begin-bullet!
    Remove trailing comma causing render bug in recorder app
    (@mehrnoushmalek, #239)

    !end-bullet!
-   !begin-bullet!
    Update {lintr} lints to v3 (#240)

    !end-bullet!
-   !begin-bullet!
    Fixed GHA links for `rstudio/shinytest2/actions/test-app@v1` (#249)

    !end-bullet!
-   !begin-bullet!
    Fix documentation on on `AppDriver`'s `delay` parameter being in
    seconds, not *milli*seconds (#255)

    !end-bullet!
-   !begin-bullet!
    Escape JS text supplied to `AppDriver$wait_for_js(script=)` (#258)

    !end-bullet!
-   !begin-bullet!
    Added support for `AppDriver$stop(signal_timeout=)`. The default
    timeout when sending `SIGINT`, `SIGTERM`, and `SIGKILL` signals to
    the `{shiny}` process is now 500ms. However, if `{covr}` is running,
    the default timeout is 20,000 ms to allow time for the report to
    generate. (#259, #263)

    !end-bullet!
-   !begin-bullet!
    Add example and FAQ entry on how to test bookmarking (#262)

    !end-bullet!
-   !begin-bullet!
    Added a DOI badge to README.md (#267)

    !end-bullet!

!end-bullets-14!

# shinytest2 0.1.1

!begin-bullets-15!

-   !begin-bullet!
    Update docs for CRAN (#253)
    !end-bullet!

!end-bullets-15!

# shinytest2 0.1.0

!begin-bullets-16!

-   !begin-bullet!
    Initial release of package
    !end-bullet!

!end-bullets-16!

# chromote (development version)

# chromote 0.3.0

!begin-bullets-1!

-   !begin-bullet!
    The headless mode used by Chrome can now be selected with the
    `chromote.headless` option or `CHROMOTE_HEADLESS` environment
    variable.

    In Chrome v128, a new headless mode became the default. The new mode
    uses the same browser engine as the regular Chrome browser, whereas
    the old headless mode is built on a separate architecture. The old
    headless mode may be faster to launch and is still well-suited to
    many of the tasks for which chromote is used.

    For now, to avoid disruption, chromote defaults to using the old
    headless mode. In the future, chromote will follow Chrome and
    default to `"new"` headless mode. (And at some point, Chrome intends
    to remove the old headless mode which is now offered as a separate
    binary.) To test the new headless mode, use
    `options(chromote.headless = "new")` or `CHROMOTE_HEADLESS="new"`
    (in `.Renviron` or via `Sys.setenv()`). (#172)

    !end-bullet!

!end-bullets-1!

# chromote 0.2.0

## Breaking changes

!begin-bullets-2!

-   !begin-bullet!
    Breaking change: `Chromote$is_active()` method now reports if there
    is an active connection to the underlying chrome instance, rather
    than whether or not that instance is alive (#94).
    !end-bullet!

!end-bullets-2!

## Improvements and bug fixes

!begin-bullets-3!

-   !begin-bullet!
    `Chromote` and `ChromoteSession` gain print methods to give you a
    snapshot of the most important values (#140).

    !end-bullet!
-   !begin-bullet!
    `Chromote` gains a new `is_alive()` method equivalent to the old
    `is_active()` method; i.e. it reports on if there is an active
    chrome process running in the background (#136).

    !end-bullet!
-   !begin-bullet!
    `ChromoteSession` now records the `targetId`. This eliminates one
    round-trip to the browser when viewing or closing a session. You can
    now call the `$respawn()` method if a session terminates and you
    want to reconnect to the same target (#94).

    !end-bullet!
-   !begin-bullet!
    `ChromoteSession$screenshot()` gains an `options` argument that
    accepts a list of additional options to be passed to the Chrome
    Devtools Protocol's `Page.captureScreenshot` method (#129).

    !end-bullet!
-   !begin-bullet!
    `ChromoteSession$screenshot()` will now infer the image format from
    the `filename` extension. Alternatively, you can specify the
    `format` in the list passed to `options` (#130).

    !end-bullet!
-   !begin-bullet!
    `--disable-gpu` is no longer included in the default Chrome
    arguments, except on windows where empirically it appears to be
    necessary (otherwise GHA check runs never terminate) (#142).

    !end-bullet!

!end-bullets-3!

# chromote 0.1.2

!begin-bullets-4!

-   !begin-bullet!
    Fixed #109: An error would occur when a `Chromote` object's
    `$close()` method was called. (#110)

    !end-bullet!
-   !begin-bullet!
    Fixed #99: When the `$view()` method was called, recent versions of
    Chrome would display
    `"Debugging connection was closed. Reason: WebSocket disconnected"`.
    (#101)

    !end-bullet!
-   !begin-bullet!
    Fixed #89, #91: `find_chrome()` now checks more possible binary
    names for Chrome or Chromium on Linux and Mac. (thanks @brianmsm and
    @rossellhayes, #117)

    !end-bullet!
-   !begin-bullet!
    Fixed #22: Added a new `chromote.timeout` global option that can be
    used to set the timeout (in seconds) for establishing connections
    with the Chrome session. (#120)

    !end-bullet!

!end-bullets-4!

# chromote 0.1.1

!begin-bullets-5!

-   !begin-bullet!
    Update docs for CRAN (#93)
    !end-bullet!

!end-bullets-5!

# chromote 0.1.0

!begin-bullets-6!

-   !begin-bullet!
    Initial package release
    !end-bullet!

!end-bullets-6!

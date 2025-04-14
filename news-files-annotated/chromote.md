# chromote (development version)

## New features

!begin-bullets-1!

-   !begin-bullet!
    `ChromoteSession` gets a new helper method, `$go_to()`. This is an
    easier way of reliably waiting for a page load, instead of using
    `Page$loadEventFired()` and `Page$navigate()` together. (#221)

    !end-bullet!
-   !begin-bullet!
    `ChromoteSession$view()` now accommodates the new DevTools Frontend
    URL used by Chrome v135 and later (#225, #226).

    !end-bullet!

!end-bullets-1!

# chromote 0.5.0

## New features

!begin-bullets-2!

-   !begin-bullet!
    chromote now includes experimental features to download versioned
    binaries of Chrome and `chrome-headless-shell` for Mac (x64 or
    arm64), Windows (32- or 64-bit) or Linux (x86-64) from the Chrome
    for Testing service. (#198)
    !begin-bullets-3!
    -   !begin-bullet!
        Use `with_chrome_version()` or `local_chrome_version()` to
        temporarily switch to a specific version of Chrome. The
        appropriate binary will be downloaded automatically if not yet
        available locally.
        !end-bullet!
    -   !begin-bullet!
        Use `chrome_versions_list()` to list installed or available
        versions of Chrome.
        !end-bullet!
    -   !begin-bullet!
        Or use `chrome_versions_add()` and `chrome_versions_remove()` to
        manually add or remove a specific version of Chrome from
        chromote's cache.
        !end-bullet!

    !end-bullets-3!
    !end-bullet!
-   !begin-bullet!
    `ChromoteSession` gains two new helper methods:
    `$set_viewport_size()` and `$get_viewport_size()`. These methods
    allow you to change the viewport size -- effectively the virtual
    window size for a page -- or to get the current viewport size. If
    you previously relied on `$Emulation$setVisibleSize()` (now a
    deprecated method in the Chrome DevTools Protocol),
    `$set_viewport_size()` is a good replacement as it uses
    Emulation.setDeviceMetricsOverride instead. (#206)
    !end-bullet!

!end-bullets-2!

## Improvements

!begin-bullets-4!

-   !begin-bullet!
    `ChromoteSession$new()` gains a `mobile` argument that can be used
    to set the device emulation in that session to emulate a mobile
    browser. The default is `mobile = FALSE`, which matches previous
    behavior. (#205)

    !end-bullet!
-   !begin-bullet!
    `Chromote` and `ChromoteSesssion` gain an
    `$auto_events_enable_args()` method that sets that arguments used by
    chromote's auto-events feature when calling the `enable` command for
    a domain, e.g. `Fetch.enable`. (#208)

    !end-bullet!
-   !begin-bullet!
    The `$view()` method of a `ChromoteSession` will now detect when
    `chrome-headless-shell` is being used and will use the system
    browser (via `utils::browseURL()`) rather than the Chrome instance
    attached to chromote. (#214)

    !end-bullet!
-   !begin-bullet!
    chromote now has a hex sticker! Thank you to @davidrsch for the
    inspiration. (#216)

    !end-bullet!

!end-bullets-4!

## Bug fixes

!begin-bullets-5!

-   !begin-bullet!
    `ChromoteSession$new()` now sets `width` and `height` using
    Emulation.setDeviceMetricsOverride, which works for all Chrome
    binaries and versions. This fixes an issue with `width` and `height`
    being ignored for Chrome versions 128-133. (#205)

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in `chromote_info()` on Windows with Powershell when no
    version info is returned. (#207)

    !end-bullet!
-   !begin-bullet!
    `Chromote` and `ChromoteSession` once again correctly handles
    connections to remote Chrome browsers via `ChromeRemote`. Calling
    `$close()` on a `Chromote` object connected to a remote browser no
    longer attempts to close the browser, and will now simply close the
    websocket connection to the browser. For local process, the
    `Chromote$close()` gains a `wait` argument that sets the number of
    seconds to wait for Chrome to gracefully shut down before chromote
    closes the process. (#212)

    !end-bullet!

!end-bullets-5!

# chromote 0.4.0

!begin-bullets-6!

-   !begin-bullet!
    Chrome v132 and later no longer support old headless mode. As such,
    `chromote` no longer defaults to using `--headless=old` and now uses
    `--headless` when running Chrome. You can still use the
    `chromote.headless` option or `CHROMOTE_HEADLESS` environment
    variable to configure the `--headless` flag if you're using an older
    version of Chrome. (#187)

    !end-bullet!
-   !begin-bullet!
    Added `chromote_info()`, a new utility function to print out key
    information about chromote and Chrome. Useful when debugging
    chromote or reporting an issue. (#190)

    !end-bullet!
-   !begin-bullet!
    chromote now uses a consistent prefix for logs, e.g
    `{tempdir}/chrome-{id}-stdout.log` and
    `{tempdir}/chrome-{id}-stderr.log`. chromote also now uses
    `--crash-dumps-dir` to set a session-specific temp directory. (#194)

    !end-bullet!

!end-bullets-6!

# chromote 0.3.1

!begin-bullets-7!

-   !begin-bullet!
    Fixed a typo that caused `launch_chrome()` to throw an error. (#175)
    !end-bullet!

!end-bullets-7!

# chromote 0.3.0

!begin-bullets-8!

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

!end-bullets-8!

# chromote 0.2.0

## Breaking changes

!begin-bullets-9!

-   !begin-bullet!
    Breaking change: `Chromote$is_active()` method now reports if there
    is an active connection to the underlying chrome instance, rather
    than whether or not that instance is alive (#94).
    !end-bullet!

!end-bullets-9!

## Improvements and bug fixes

!begin-bullets-10!

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

!end-bullets-10!

# chromote 0.1.2

!begin-bullets-11!

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

!end-bullets-11!

# chromote 0.1.1

!begin-bullets-12!

-   !begin-bullet!
    Update docs for CRAN (#93)
    !end-bullet!

!end-bullets-12!

# chromote 0.1.0

!begin-bullets-13!

-   !begin-bullet!
    Initial package release
    !end-bullet!

!end-bullets-13!

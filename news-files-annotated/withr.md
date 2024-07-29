# withr (development version)

# withr 3.0.0

## Performance of withr

!begin-bullets-1!

-   !begin-bullet!
    `defer()` is now a thin wrapper around `base::on.exit()`. This is
    possible thanks to two contributions that we made to R 3.5:

    !begin-bullets-2!
    -   !begin-bullet!
        We added an argument for LIFO cleanup: `on.exit(after = FALSE)`.
        !end-bullet!
    -   !begin-bullet!
        Calling `sys.on.exit()` elsewhere than top-level didn't work.
        This is needed for manual invocation with `deferred_run()`.
        !end-bullet!

    !end-bullets-2!
    Following this change, `defer()` is now much faster (although still
    slower than `on.exit()` which is a primitive function and about as
    fast as it gets). This also increases the compatibility of `defer()`
    with `on.exit()` (all handlers are now run in the expected order
    even if they are registered with `on.exit()`) and standalone
    versions of `defer()`.

    !end-bullet!

!end-bullets-1!

## Breaking change

!begin-bullets-3!

-   !begin-bullet!
    When `source()` is used with a local environment, as opposed to
    `globalenv()` (the default), you now need to set
    `options(withr.hook_source = TRUE)` to get proper withr support
    (running `defer()` or `local_` functions at top-level of a script).
    This support is disabled by default in local environments to avoid a
    performance penalty in normal usage of withr features.
    !end-bullet!

!end-bullets-3!

## Other features and bugfixes

!begin-bullets-4!

-   !begin-bullet!
    `deferred_run()` now reports the number of executed expressions with
    a message.

    !end-bullet!
-   !begin-bullet!
    `deferred_run()` can now be run at any point in a knitr file (#235).

    !end-bullet!
-   !begin-bullet!
    `local_tempfile()` now writes `lines` in UTF-8 (#210) and always
    uses `\n` for newlines (#216).

    !end-bullet!
-   !begin-bullet!
    `local_pdf()` and friends now correctly restore to the previously
    active device (#138).

    !end-bullet!
-   !begin-bullet!
    `local_()` now works even if withr isn't attached (#207).

    !end-bullet!
-   !begin-bullet!
    `local_par()` and `with_par()` now work if you don't set any
    parameters (#238).

    !end-bullet!
-   !begin-bullet!
    `with_language()` now properly resets the translation cache (#213).

    !end-bullet!
-   !begin-bullet!
    Fixes for Debian packaging.

    !end-bullet!

!end-bullets-4!

# withr 2.5.2

!begin-bullets-5!

-   !begin-bullet!
    Fixes for CRAN checks.
    !end-bullet!

!end-bullets-5!

# withr 2.5.1

!begin-bullets-6!

-   !begin-bullet!
    Fixes for CRAN checks.
    !end-bullet!

!end-bullets-6!

# withr 2.5.0

!begin-bullets-7!

-   !begin-bullet!
    `defer()` and all `local_*()` functions now work when run inside of
    a `.Rmd`. The deferred expressions are executed when knitr exits.

    !end-bullet!
-   !begin-bullet!
    `defer()` and `local_` functions now work within `source()`. The
    deferred expressions are executed when `source()` exits.

    !end-bullet!
-   !begin-bullet!
    `with_()` and `local_()` gain a `get` argument. Supply a getter
    function to create `with` and `local` functions that are robust to
    early exits.

    When supplied, this restoration pattern is used:

    !begin-codeblock!
        old <- get()
        on.exit(set(old))
        set(new)
        action()

    !end-codeblock!
    Instead of:

    !begin-codeblock!
        old <- set(new)
        on.exit(set(old))
        action()

    !end-codeblock!
    This ensures proper restoration of the old state when an early exit
    occurs during `set()` (for instance when a deprecation warning is
    caught, see #191).

    !end-bullet!
-   !begin-bullet!
    These `with_` and `local_` functions are now robust to early exits
    (see next bullet):

    !begin-bullets-8!
    -   !begin-bullet!
        `_locale()`
        !end-bullet!
    -   !begin-bullet!
        `_envvar()`
        !end-bullet!
    -   !begin-bullet!
        `_libpaths()`
        !end-bullet!
    -   !begin-bullet!
        `_options()`
        !end-bullet!
    -   !begin-bullet!
        `_par()`
        !end-bullet!
    -   !begin-bullet!
        `_path()`
        !end-bullet!
    -   !begin-bullet!
        `_seed()`
        !end-bullet!

    !end-bullets-8!
    !end-bullet!
-   !begin-bullet!
    `with_namespace()` and `local_namespace()` now pass `warn.conflicts`
    to `attach()` (@kyleam, #185).

    !end-bullet!
-   !begin-bullet!
    `local_rng_version()` and `local_seed()` no longer warn when
    restoring `sample.kind` to `"Rounding"` (#167).

    !end-bullet!
-   !begin-bullet!
    `with_seed()` now preserves the current values of `RNGkind()`
    (#167).

    !end-bullet!
-   !begin-bullet!
    `with_collate()` is no longer affected by the `LC_COLLATE`
    environment variable set to "C" (#179).

    !end-bullet!
-   !begin-bullet!
    Local evaluations in the `globalenv()` (as opposed to top-level
    ones) are now unwound in the same way as regular environments.

    !end-bullet!
-   !begin-bullet!
    `local_tempfile()` gains a lines argument so, if desired, you can
    pre-fill the temporary file with some data.

    !end-bullet!

!end-bullets-7!

# withr 2.4.3

!begin-bullets-9!

-   !begin-bullet!
    Lionel Henry is the new maintainer.

    !end-bullet!
-   !begin-bullet!
    Handlers registered with the global environment (as happens when
    `local_()` is run at the top-level, outside a function) are now
    automatically run when the R session ends (#173).

    !end-bullet!
-   !begin-bullet!
    New `with_language()` and `local_language()` to temporarily control
    the language used for translations (#180).

    !end-bullet!
-   !begin-bullet!
    `with_seed()` now caches the check for R version, so is now faster
    (#170)

    !end-bullet!
-   !begin-bullet!
    `with_makevars()` and `local_makevars()` now eagerly evaluate the
    `path` argument (#169)

    !end-bullet!

!end-bullets-9!

# withr 2.4.2

!begin-bullets-10!

-   !begin-bullet!
    `local_options()` now lets you set an option to `NULL` as intended
    (#156)

    !end-bullet!
-   !begin-bullet!
    `local_tempfile()` argument `envir` is deprecated, in favor of
    `.local_envir`. All withr functions except `local_tempfile()` used
    `.local_envir` to specify environments, so this makes this function
    consistent with the rest. (#157)

    !end-bullet!
-   !begin-bullet!
    `with_environment()` now passing `pos` and `warn.conflicts` to
    `attach()`, as intended (#161).

    !end-bullet!
-   !begin-bullet!
    `with_seed()` now also sets the RNG via new arguments `.rng_kind`,
    `.rng_normal_kind` and `.rng_sample_kind` (#162, @AshesITR).

    !end-bullet!
-   !begin-bullet!
    `with_timezone()` now works after recent changes to `Sys.timezone()`
    in R-devel (#165)

    !end-bullet!

!end-bullets-10!

# withr 2.4.1

!begin-bullets-11!

-   !begin-bullet!
    Tests which require `capabilities("cairo")` are now skipped.
    !end-bullet!

!end-bullets-11!

# withr 2.4.0

!begin-bullets-12!

-   !begin-bullet!
    withr is now licensed as MIT (#154).

    !end-bullet!
-   !begin-bullet!
    Tests for `with_cairo_pdf()` and `with_cairo_ps()` have been
    removed, as they fail if Cairo is not available, such as with M1
    macOS systems (#158)

    !end-bullet!
-   !begin-bullet!
    `local_seed()` is now exported (#153)

    !end-bullet!

!end-bullets-12!

# withr 2.3.0

## Deprecations

!begin-bullets-13!

-   !begin-bullet!
    `local_tempfile()` argument `new` is deprecated, in favor of
    returning the path to the new tempfile. calls like
    `local_tempfile("xyz")` should be replaced with
    `xyx <- local_tempfile()` in your code (#141).
    !end-bullet!

!end-bullets-13!

## New features

!begin-bullets-14!

-   !begin-bullet!
    New `local_seed()` function and `local_preserve_seed()` functions to
    correspond to `with_seed()` and `with_preserve_seed()` (#139).

    !end-bullet!
-   !begin-bullet!
    New `local_tempdir()` function added to create a temp directory
    (#140)

    !end-bullet!
-   !begin-bullet!
    `local_*()` functions now take dots (`...`), which can simplify
    calls in some cases, e.g. you can now use
    `local_options(foo = "bar")` rather than
    `local_options(c(foo = "bar"))`.

    !end-bullet!

!end-bullets-14!

## Minor improvements and fixes

!begin-bullets-15!

-   !begin-bullet!
    `defer()` now throws an error if an error occurs in the deferred
    expression (#148)

    !end-bullet!
-   !begin-bullet!
    `with_file()` and `local_file()` can now work if the file is
    actually a directory (#144).

    !end-bullet!

!end-bullets-15!

# withr 2.2.0

!begin-bullets-16!

-   !begin-bullet!
    `defer()` can set deferred events on `.GlobalEnv` to facilitate the
    interactive development of code inside a function or test. Helpers
    `deferred_run()` (and `deferred_clear()`) provide a way to explicity
    run and clear (or just clear) deferred events (#76, @jennybc).

    !end-bullet!
-   !begin-bullet!
    `with_connection()` now works when existing objects or connections
    exist with the same names (#120)

    !end-bullet!
-   !begin-bullet!
    `with_makevars()` now uses `tools::makevars_user()` to determine the
    default user makevars file (#77, @siddharthab).

    !end-bullet!
-   !begin-bullet!
    `with_options()` no longer uses `do.call()`, so optiosn are not
    evaluated on exit (#73, @mtmorgan).

    !end-bullet!
-   !begin-bullet!
    `with_package()` no longer has the `help` argument (#94, @wendtke).

    !end-bullet!
-   !begin-bullet!
    `with_package()` now does not try to detach the package if it is
    already attached before calling `with_package()` (#107)

    !end-bullet!
-   !begin-bullet!
    `with_preserve_seed()` now restores `.Random.seed` if it is not set
    originally (#124).

    !end-bullet!
-   !begin-bullet!
    Add `with_rng_version()` and `local_rng_version()` functions to
    change the version of the RNG (#90, @gaborcsardi).

    !end-bullet!
-   !begin-bullet!
    `with_svg()` documentation now is consistent across R versions
    (#129)

    !end-bullet!
-   !begin-bullet!
    Add `with_timezone()` and `local_timezone()` functions to change the
    time zone (#92, @gaborcsardi).

    !end-bullet!
-   !begin-bullet!
    `with_tempfile()` and `local_tempfile()` now delete recursively
    directories on exit (#84, @meta00).

    !end-bullet!

!end-bullets-16!

# withr 2.1.2

!begin-bullets-17!

-   !begin-bullet!
    `set_makevars()` is now exported (#68, @gaborcsardi).

    !end-bullet!
-   !begin-bullet!
    `with_temp_libpaths()` gains an `action` argument, to specify how
    the temporary library path will be added (#66, @krlmlr).

    !end-bullet!

!end-bullets-17!

# withr 2.1.1

!begin-bullets-18!

-   !begin-bullet!
    Fixes test failures with testthat 2.0.0

    !end-bullet!
-   !begin-bullet!
    `with_file()` function to automatically remove files.

    !end-bullet!

!end-bullets-18!

# withr 2.1.0

!begin-bullets-19!

-   !begin-bullet!
    `with_connection()` function to automatically close R file
    connections.

    !end-bullet!
-   !begin-bullet!
    `with_db_connection()` function to automatically disconnect from DBI
    database connections.

    !end-bullet!
-   !begin-bullet!
    `with_gctorture2` command to run code with gctorture2, useful for
    testing (#47).

    !end-bullet!
-   !begin-bullet!
    `with_package()`, `with_namespace()` and `with_environment()` (and
    equivalent locals) functions added, to run code with a modified
    object search path (#38, #48).

    !end-bullet!
-   !begin-bullet!
    Add `with_tempfile()` and `local_tempfile()` functions to create
    temporary files which are cleanup up afterwards. (#32)

    !end-bullet!
-   !begin-bullet!
    Remove the `code` argument from `local_` functions (#50).

    !end-bullet!

!end-bullets-19!

# withr 2.0.0

!begin-bullets-20!

-   !begin-bullet!
    Each `with_` function now has a `local_` variant, which reset at the
    end of their local scope, generally at the end of the function body.

    !end-bullet!
-   !begin-bullet!
    New functions `with_seed()` and `with_preserve_seed()` for running
    code with a given random seed (#45, @krlmlr).

    !end-bullet!

!end-bullets-20!

# withr 1.0.2

!begin-bullets-21!

-   !begin-bullet!
    `with_makevars()` gains an `assignment` argument to allow specifying
    additional assignment types.
    !end-bullet!

!end-bullets-21!

# withr 1.0.1

!begin-bullets-22!

-   !begin-bullet!
    Relaxed R version requirement to 3.0.2 (#35, #39).
    !end-bullet!
-   !begin-bullet!
    New `with_output_sink()` and `with_message_sink()` (#24).
    !end-bullet!

!end-bullets-22!

# withr 1.0.0

!begin-bullets-23!

-   !begin-bullet!
    First Public Release
    !end-bullet!

!end-bullets-23!

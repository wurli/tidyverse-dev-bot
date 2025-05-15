# rcmdcheck (development version)

!begin-bullets-1!

-   !begin-bullet!
    Fixed an issue where check output could be malformed when testing
    packages with multiple test files (#205, @kevinushey).

    !end-bullet!
-   !begin-bullet!
    Update pkgdown template and move url to https://rcmdcheck.r-lib.org.

    !end-bullet!
-   !begin-bullet!
    Fix usage of `libpath` argument (#195).

    !end-bullet!
-   !begin-bullet!
    `cran_check_results()` works again.

    !end-bullet!

!end-bullets-1!

# rcmdcheck 1.4.0

!begin-bullets-2!

-   !begin-bullet!
    `cran_check_results()` now downloads results in parallel, so it is
    much faster.

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck_process` now redirects the standard error to the standard
    output, to make sure that they are correctly interleaved (#148).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now puts Rtools on the PATH, via pkgbuild (#111).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now builds the manual when building the package, if it is
    needed for `\Sexpr{}` expressions (#137).

    !end-bullet!
-   !begin-bullet!
    This version fixes a rare race condition that made rcmdcheck fail
    (#139).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now safeguards against R deleting the user's home
    directory via an `R CMD build` bug (#120).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck can now ignore files in `inst/doc` when building a
    package. See the `Config/build/clean-inst-doc` package option in
    `?"rcmdcheck-config"` (#130).

    !end-bullet!
-   !begin-bullet!
    It is now possible to turn on/off ANSI colors for rcmdcheck only,
    without affecting the checked package. See
    `?"rcmdcheck-config" and the`RCMDCHECK_NUM_COLORS`environment variable and the`rcmdcheck.num_colors\`
    option (#119, @jimhester).

    !end-bullet!
-   !begin-bullet!
    `print.rcmdcheck()` now has a `test_output` argument and
    `rcmdcheck.test_output` global option, to control whether to print
    the full test output or not. (#121)

    !end-bullet!
-   !begin-bullet!
    RStudio's Pandoc is now on the path during `rcmdcheck()` and
    `rcmdcheck_process` (#109, #132, @dpprdan).

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` now errors if the check process crashes (#110, #163).

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` prints the check ouptut better interactively,
    especially when the package has multiple test files (#145, #161).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck can now ignore `NOTE`s, if requested, see `?rcmdcheck` for
    details (#12, #160).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now always converts its output to UTF-8 from the native
    encoding. It also handles parsing check output in a non-native
    encoding better (#152).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now ignored time stamps when comparing two check results
    (#128).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now does not print extra empty lines in the interactive
    output on GitHub Actions.

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now uses a more robust implementation to extract the
    session info from the check process (#164).

    !end-bullet!

!end-bullets-2!

# rcmdcheck 1.3.3

!begin-bullets-3!

-   !begin-bullet!
    `cran_check_results()` has now a `quiet` argument, and the download
    progress bars are shown if it is set to `FALSE` (#17).

    !end-bullet!
-   !begin-bullet!
    Fix output when standard output does not support `\r`, typically
    when it is not a terminal (#94).

    !end-bullet!
-   !begin-bullet!
    Fix standard output and standard error mixup in the test cases,
    (#88, #96).

    !end-bullet!
-   !begin-bullet!
    Fix parsing test failures when multiple architectures are checked,
    (#97).

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` has now better colors. WARNINGs are magenta, and NOTEs
    are blue (#103, @hadley).

    !end-bullet!

!end-bullets-3!

# rcmdcheck 1.3.2

!begin-bullets-4!

-   !begin-bullet!
    `rcmdcheck()` now correctly overwrites existing tarballs if they
    already exist in the check directory. This time for real.
    !end-bullet!

!end-bullets-4!

# rcmdcheck 1.3.1

!begin-bullets-5!

-   !begin-bullet!
    `rcmdcheck()` now correctly overwrites existing tarballs if they
    already exist in the check directory (#84 @jimhester).

    !end-bullet!
-   !begin-bullet!
    rcmdcheck now uses `sessioninfo::session_info()` to query session
    information for the check.

    !end-bullet!

!end-bullets-5!

# rcmdcheck 1.3.0

!begin-bullets-6!

-   !begin-bullet!
    New `rcmdcheck_process` class to run `R CMD check` in the
    background.

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` now supports timeouts (default is 10 minutes).

    !end-bullet!
-   !begin-bullet!
    Checks now capture and print installation and test failures.

    !end-bullet!
-   !begin-bullet!
    Checks now record and print the duration of the check.

    !end-bullet!
-   !begin-bullet!
    Checks now record and print session information from the check
    session (#22).

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` new keep files until the returned check object is
    deleted, if check was run in a temporary directory (the default)
    (#23).

    !end-bullet!
-   !begin-bullet!
    New `xopen()` to show the check file in a file browser window (#61).

    !end-bullet!
-   !begin-bullet!
    Checks now save `install.out` and also `DESCRIPTION` in the result,
    and save the standard error and the exit status as well.

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` printing is now better: the message from the check
    that is actually *being performed* is shown on the screen.

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` now shows a spinner while running check.

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` results now have a `summary()` method for check
    comparisons.

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` results now have a new `check_details()` method, to
    query the check results programmatically. (No need to use `$errors`,
    `$warnings`, etc. directly.)

    !end-bullet!
-   !begin-bullet!
    Checks now find package root automatically (#18).

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` now has an `error_on` argument to throw an error on an
    `R CMD check` failure (#51).

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` result printing is now better, the colors are
    consistent (#54).

    !end-bullet!

!end-bullets-6!

# rcmdcheck 1.2.1

!begin-bullets-7!

-   !begin-bullet!
    Compare two check results with `compare_checks` or compare check
    results to CRAN with `compare_to_cran`.

    !end-bullet!
-   !begin-bullet!
    The result object has more metadata: package name, version, R
    version and platform.

    !end-bullet!
-   !begin-bullet!
    Refined printing of the result.

    !end-bullet!
-   !begin-bullet!
    `rcmdcheck()` works on tarballs build via `R CMD build` now.

    !end-bullet!
-   !begin-bullet!
    Parse `R CMD check` results: `parse_check`, `parse_check_url`.

    !end-bullet!
-   !begin-bullet!
    Download and parse check results for CRAN packages.

    !end-bullet!
-   !begin-bullet!
    Report errors during the build, typically vignette errors.

    !end-bullet!
-   !begin-bullet!
    Use the `callr` package (https://github.com/r-lib/callr) for running
    `R CMD` commands.

    !end-bullet!

!end-bullets-7!

# rcmdcheck 1.1.0

!begin-bullets-8!

-   !begin-bullet!
    New arguments `libpath` and `repos` to set the library path and the
    default CRAN repository

    !end-bullet!
-   !begin-bullet!
    Do not run tests on CRAN.

    !end-bullet!

!end-bullets-8!

# rcmdcheck 1.0.0

First public release.

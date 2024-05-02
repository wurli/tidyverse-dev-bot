# debugme (development version)

# debugme 1.2.0

!begin-bullets-1!

-   !begin-bullet!
    debugme now does not instrumented code multiple times, this could
    happen if environments were referenced from multiple places (#15).

    !end-bullet!
-   !begin-bullet!
    debugme now correctly instruments functions with attributes, the
    attributes are kept now. Some packages, e.g. `assertthat` create
    such functions.

    !end-bullet!
-   !begin-bullet!
    debugme now supports debug levels. Relatedly, `debugme()` has a
    `level` argument now (#49, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    debugme now correctly instruments functions with `NULL` body and
    functions with no arguments.

    !end-bullet!
-   !begin-bullet!
    Nested calls are printed better now, with indentation (#44,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `debugme()` now re-reads the `DEBUGME` environment variable (#45,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    New `DEBUGME_SHOW_TIMESTAMP` environment variable to hide timestamp
    output for reproducibility (#49, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    debugme now does not change the random seed (#50).

    !end-bullet!

!end-bullets-1!

# debugme 1.1.0

!begin-bullets-2!

-   !begin-bullet!
    Support functions in lists and environments. In particular, this
    fixes debugging R6 methods (#15)

    !end-bullet!
-   !begin-bullet!
    Support `DEBUGME_OUTPUT_DIR` (#19)

    !end-bullet!
-   !begin-bullet!
    Support log levels (#12)

    !end-bullet!
-   !begin-bullet!
    Fix functions without arguments (#17)

    !end-bullet!
-   !begin-bullet!
    Print the debug stack, optionally (@kforner, #21)

    !end-bullet!

!end-bullets-2!

# debugme 1.0.2

!begin-bullets-3!

-   !begin-bullet!
    Do not us `testthat::with_mock`, it interferes with the JIT that is
    default in R 3.4.0. Use the `mockery` package instead.
    !end-bullet!

!end-bullets-3!

# debugme 1.0.1

!begin-bullets-4!

-   !begin-bullet!
    Fix a test case bug.
    !end-bullet!

!end-bullets-4!

# debugme 1.0.0

First public release.

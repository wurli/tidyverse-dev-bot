# 1.1.0.9000

!begin-bullets-1!

-   !begin-bullet!
    Make sure code is not instrumented multiple times, which can happen
    if environments are referenced from multiple places

    !end-bullet!
-   !begin-bullet!
    Fix instrumenting functions with attributes, the attributes are kept
    now. Some packages, e.g. `assertthat` create such functions.

    !end-bullet!

!end-bullets-1!

# 1.1.0

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

# 1.0.2

!begin-bullets-3!

-   !begin-bullet!
    Do not us `testthat::with_mock`, it interferes with the JIT that is
    default in R 3.4.0. Use the `mockery` package instead.
    !end-bullet!

!end-bullets-3!

# 1.0.1

!begin-bullets-4!

-   !begin-bullet!
    Fix a test case bug.
    !end-bullet!

!end-bullets-4!

# 1.0.0

First public release.

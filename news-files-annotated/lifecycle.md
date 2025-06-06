# lifecycle (development version)

!begin-bullets-1!

-   !begin-bullet!
    Improvements to `lint_lifecycle()` and `lint_tidyverse_lifecycle()`
    (@AshesITR):
    !begin-bullets-2!
    -   !begin-bullet!
        Updated to support lintr \>= 3.0.0 (#178).
        !end-bullet!
    -   !begin-bullet!
        Fixed default `pattern=` argument to only find R files (#165).
        !end-bullet!
    -   !begin-bullet!
        Fixed `lint_tidyverse_lifecycle()` ignoring the `pattern=`
        argument (#179).
        !end-bullet!
    -   !begin-bullet!
        Added support for Quarto qmd files to the default `pattern=`
        argument (#155).
        !end-bullet!
    -   !begin-bullet!
        Added support for Rnw, Rhtml, Rrst, Rtex and Rtxt files to the
        default `pattern=` argument.
        !end-bullet!
    -   !begin-bullet!
        Exported `lifecycle_linter()` to allow including the linter in
        `.lintr` configurations when using `lintr` (#122).
        !end-bullet!

    !end-bullets-2!
    !end-bullet!

!end-bullets-1!

# lifecycle 1.0.4

!begin-bullets-3!

-   !begin-bullet!
    Repeated calls to `deprecate_soft()` and `deprecate_warn()` are
    faster thanks to some internal refactoring (#177).

    !end-bullet!
-   !begin-bullet!
    Switch from `expr_deparse()` to `deparse()`. This improves
    performance considerably and the cost of making some unusual
    function calls mildly less appealing (#167).

    !end-bullet!

!end-bullets-3!

# lifecycle 1.0.3

!begin-bullets-4!

-   !begin-bullet!
    The `with` line is now an info bullet. The `details` lines are info
    bullets by default, unless the argument is named.

    !end-bullet!
-   !begin-bullet!
    Indirect usages of deprecated features now mention the package that
    likely used the deprecated feature and recommends contacting the
    authors (#135).

    !end-bullet!
-   !begin-bullet!
    Indirect usages of `deprecate_warn()` no longer warn repeatedly,
    even if `always = TRUE` (#135).

    !end-bullet!
-   !begin-bullet!
    In tests, `deprecate_soft()` will only warn if the deprecated
    function is called directly from the package being tested, not one
    of its dependencies. This ensures that you only see the warning when
    it's your responsibility to do something about it (#134).

    !end-bullet!
-   !begin-bullet!
    Soft deprecations now only warn every 8 hours in non-package code
    (#134).

    !end-bullet!

!end-bullets-4!

# lifecycle 1.0.2

!begin-bullets-5!

-   !begin-bullet!
    You can now generate arbitrary text in a deprecation message by
    wrapping `what` or `with` in `I()` (#120).

    !end-bullet!
-   !begin-bullet!
    `deprecate_warn()` gains an `always = TRUE` argument to force
    warnings to occur every time, not every 8 hours. This adds an extra
    step in between `deprecate_warn()` and `deprecate_stop()` (#124).

    !end-bullet!
-   !begin-bullet!
    `signal_stage()` now supports `with` (#116).

    !end-bullet!

!end-bullets-5!

# lifecycle 1.0.1

!begin-bullets-6!

-   !begin-bullet!
    `deprecate_soft()` now follows the verbosity option when called from
    the global environment (#113).

    !end-bullet!
-   !begin-bullet!
    `last_warnings()` has been renamed to `last_lifecycle_warnings()`
    and `last_warning()` has been removed. This is for compatibility
    with the future `rlang::last_warnings()` function to be released in
    the next rlang version.

    !end-bullet!

!end-bullets-6!

# lifecycle 1.0.0

!begin-bullets-7!

-   !begin-bullet!
    New vignettes:

    !begin-bullets-8!
    -   !begin-bullet!
        `vignette("stages")` describes the lifecycle stages
        !end-bullet!
    -   !begin-bullet!
        `vignette("manage")` teaches you how to manage lifecycle changes
        in functions you *use*.
        !end-bullet!
    -   !begin-bullet!
        `vignette("communicate")` shows how to use lifecycle in
        functions that you *write*.
        !end-bullet!

    !end-bullets-8!
    !end-bullet!
-   !begin-bullet!
    In `deprecate_soft()`, `deprecate_warn()`, and `deprecate_stop()`:

    !begin-bullets-9!
    -   !begin-bullet!
        You can deprecate an argument with `foo(arg)` instead of
        `foo(arg =)` (#78). This syntax is similar in spirit to the
        formal arguments of function definitions.

        !end-bullet!
    -   !begin-bullet!
        You can deprecate R6 methods by using `class$method()` (#54).

        !end-bullet!
    -   !begin-bullet!
        A character vector `details` is now converted into a bulleted
        list (#55).

        !end-bullet!
    -   !begin-bullet!
        Messages for non-prefix functions (like "`x<-`()" and "`%>%`()")
        look a little nicer (#95).

        !end-bullet!
    -   !begin-bullet!
        Manually printed warnings now omit the advice footer (#68).

        !end-bullet!

    !end-bullets-9!
    !end-bullet!
-   !begin-bullet!
    Experimental `signal_stage()` can be used to signal that a function
    is experimental or superseded. These signals are not currently
    hooked up to any behaviour, but we'll add tools in a future release
    (#44).

    !end-bullet!
-   !begin-bullet!
    `lifecycle_cnd_data()` has been removed; as far as I can tell it
    wasn't used by anyone.

    !end-bullet!

!end-bullets-7!

# lifecycle 0.2.0

!begin-bullets-10!

-   !begin-bullet!
    Lifecycle warnings are now displayed once every 8 hours.

    !end-bullet!
-   !begin-bullet!
    Added experimental `signal_experimental()` and `signal_superseded()`
    functions.

    !end-bullet!
-   !begin-bullet!
    Added the "superseded" lifecycle stage to the documentation.

    !end-bullet!
-   !begin-bullet!
    `deprecate_stop()` now mentions that function is defunct (#28).

    !end-bullet!
-   !begin-bullet!
    New `expect_deprecated()` and `expect_defunct()` functions for
    testting lifecycle warnings and errors. `expect_deprecated()`
    automatically sets the `lifecycle_verbosity` option to `"warning"`
    to enforce warnings at each invocation rather than once per session.

    !end-bullet!
-   !begin-bullet!
    New syntax `"foo(arg = 'can\\'t be a baz')"` to describe that
    specific inputs for an argument are deprecated (#30, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    New `is_present()` function to test whether the caller has supplied
    a `deprecated()` function.

    !end-bullet!

!end-bullets-10!

# lifecycle 0.1.0

!begin-bullets-11!

-   !begin-bullet!
    Deprecated functions under the control of the developer now warn
    repeatedly in unit tests.

    !end-bullet!
-   !begin-bullet!
    Deprecation warnings now record a backtrace. Call
    `lifecycle::last_lifecycle_warnings()` and
    `lifecycle::last_warning()` to print the warnings that occurred
    during the last command, along with their backtraces.

    !end-bullet!
-   !begin-bullet!
    The naming scheme of signaller functions has been simplified:

    !begin-bullets-12!
    -   !begin-bullet!
        `signal_soft_deprecated()` is now `deprecate_soft()`.
        !end-bullet!
    -   !begin-bullet!
        `warn_deprecated()` is now `deprecate_warn()`.
        !end-bullet!
    -   !begin-bullet!
        `stop_defunct()` is now `deprecate_stop()`.
        !end-bullet!

    !end-bullets-12!
    !end-bullet!
-   !begin-bullet!
    The signaller functions now take a version and two descriptors for
    the deprecated feature and its replacement (the latter is optional).
    The deprecation message is built from these components. You can pass
    a `details` argument to append additional information to the
    generated deprecation message.

    !end-bullet!
-   !begin-bullet!
    Helpers from rlang's `compat-lifecycle.R` drop-in file are now
    exported in this package.

    !end-bullet!

!end-bullets-11!

# mockery (development version)

# mockery 0.4.5

!begin-bullets-1!

-   !begin-bullet!
    Documentation fixes for `R CMD check`.
    !end-bullet!
-   !begin-bullet!
    Eliminate use of deprecated `testthat::with_mock()`.
    !end-bullet!

!end-bullets-1!

# mockery 0.4.4

!begin-bullets-2!

-   !begin-bullet!
    Fixes for `R CMD check`
    !end-bullet!

!end-bullets-2!

# mockery 0.4.3

!begin-bullets-3!

-   !begin-bullet!
    Hadley Wickham is now the maintainer.

    !end-bullet!
-   !begin-bullet!
    `stub()` now unlocks/relocks locked bindings as required
    (@sambrightman, #30).

    !end-bullet!

!end-bullets-3!

# mockery 0.4.2

!begin-bullets-4!

-   !begin-bullet!
    The R6 package has been added to Suggests, as requested by CRAN.

    !end-bullet!
-   !begin-bullet!
    `stub()` now works if the function being stubbed contains assignment
    functions (@jimhester, #23).

    !end-bullet!

!end-bullets-4!

# mockery 0.4.1

!begin-bullets-5!

-   !begin-bullet!
    Fix bug whereby functions that begin with `.` don't have things
    mocked out in them.
    !end-bullet!

!end-bullets-5!

# mockery 0.4.0

!begin-bullets-6!

-   !begin-bullet!
    Add support for stubbing depth greater than 1.

    !end-bullet!
-   !begin-bullet!
    Add support for nested R6 classes.

    !end-bullet!

!end-bullets-6!

# mockery 0.3.2

This release addresses issues
https://github.com/jfiksel/mockery/issues/17 and
https://github.com/jfiksel/mockery/issues/13

In particular, it is now possible to mock functions out of R6 methods
that contain other R6 objects. Additionally, it's also possible to
specify the depth of mocking.

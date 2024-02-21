# conflicted (development version)

!begin-bullets-1!

-   !begin-bullet!
    `conflict_scout()` refers to the package where the function was
    defined, for reexported functions (#93).

    !end-bullet!
-   !begin-bullet!
    `conflict_scout()` no longer returns functions whose conflicts have
    been resolved manually or automatically (#95).

    !end-bullet!

!end-bullets-1!

# conflicted 1.2.0

!begin-bullets-2!

-   !begin-bullet!
    New `conflicts_prefer()` to easily declare multiple preferences at
    once: `conflicts_prefer(dplyr::filter, lubridate::week, ...)` (#82).

    !end-bullet!
-   !begin-bullet!
    Disambiguation message now provides clickable preferences (#74).

    !end-bullet!
-   !begin-bullet!
    Conflicts now take into account the `include.only` and `exclude`
    arguments that you might have specified in `library()` (#84).

    !end-bullet!
-   !begin-bullet!
    `conflict_prefer_all()` and `conflict_prefer_matching()` are now
    much faster. And when `losers` is supplied, they only register the
    minimal necessary number of conflicts.

    !end-bullet!

!end-bullets-2!

# conflicted 1.1.0

!begin-bullets-3!

-   !begin-bullet!
    New `conflicted_prefer_all()` and `conflicted_prefer_matching()` to
    prefer functions en masse (#51).

    !end-bullet!
-   !begin-bullet!
    Improvements to conflict detection and resolution:

    !begin-bullets-4!
    -   !begin-bullet!
        Reports conflicts involving lazy loaded datasets (#54).

        !end-bullet!
    -   !begin-bullet!
        Don't report conflicts involving a `standardGeneric` (#47).

        !end-bullet!
    -   !begin-bullet!
        Better handling of conflicts cleared by superset principle: if
        there is a conflict all functions (including any base functions)
        are reported, and if there isn't a conflict, no packages are
        reported (instead of 1) (#47).

        !end-bullet!
    -   !begin-bullet!
        Don't report conflict between a function and a non-function
        (#30).

        !end-bullet!
    -   !begin-bullet!
        Conflicts involving a primitive function no longer error
        (@nerskin, #46, #48).

        !end-bullet!

    !end-bullets-4!
    !end-bullet!

!end-bullets-3!

# conflicted 1.0.4

!begin-bullets-5!

-   !begin-bullet!
    Fixes for dev rlang
    !end-bullet!

!end-bullets-5!

# conflicted 1.0.3

!begin-bullets-6!

-   !begin-bullet!
    Fix \> vs \>= mistake
    !end-bullet!

!end-bullets-6!

# conflicted 1.0.2

!begin-bullets-7!

-   !begin-bullet!
    Align with changes to R 3.6
    !end-bullet!

!end-bullets-7!

# conflicted 1.0.1

!begin-bullets-8!

-   !begin-bullet!
    Internal `has_moved()` function no longer fails when it encounters a
    call to `.Deprecated()` with no arguments (#29).

    !end-bullet!
-   !begin-bullet!
    `.conflicts` environment is correctly removed and replaced each time
    a new package is loaded (#28).

    !end-bullet!

!end-bullets-8!

# conflicted 1.0.0

### New functions

!begin-bullets-9!

-   !begin-bullet!
    `conflict_scout()` reports all conflicts found with a set of
    packages.

    !end-bullet!
-   !begin-bullet!
    `conflict_prefer()` allows you to declare a persistent preference
    (within a session) for one function over another (#4).

    !end-bullet!

!end-bullets-9!

### Improve conflict resolution

!begin-bullets-10!

-   !begin-bullet!
    conflicts now generally expects packages that override functions in
    base packages to obey the "superset principle", i.e. that
    `foo::bar(...)` must return the same value of `base::bar(...)`
    whenever the input is not an error. In other words, if you override
    a base function you can only extend the API, not change or reduce
    it.

    There are two exceptions. If the arguments of the two functions are
    not compatible (i.e. the function in the package doesn't include all
    arguments of the base package), conflicts can tell it doesn't follow
    the superset principle. Additionally, `dplyr::lag()` fails to follow
    the superset principle, and is marked as a special case (#2).

    !end-bullet!
-   !begin-bullet!
    Functions that have moved between packages (i.e. functions with a
    call to `.Deprecated("pkg::foo")`) as the first element of the
    function body) will never generate conflicts.

    !end-bullet!
-   !begin-bullet!
    conflicted now listens for `detach()` events and removes conflicts
    that are removed by detaching a package (#5)

    !end-bullet!

!end-bullets-10!

## Minor improvements and bug fixes

!begin-bullets-11!

-   !begin-bullet!
    Error messages for infix functions and non-syntactic function names
    are improved (#14)
    !end-bullet!

!end-bullets-11!

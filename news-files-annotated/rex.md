## Rex (development version)

!begin-bullets-1!

-   !begin-bullet!
    Rex no longer changes the state of the random number generator when
    attached.
    !end-bullet!

!end-bullets-1!

## Rex Version 1.2.1

!begin-bullets-2!

-   !begin-bullet!
    Kevin Ushey is now the maintainer
    !end-bullet!

!end-bullets-2!

## Rex Version 1.2.0

!begin-bullets-3!

-   !begin-bullet!
    `%>%` is no longer imported and then re-exported from rex
    !end-bullet!

!end-bullets-3!

## Rex Version 1.1.2

!begin-bullets-4!

-   !begin-bullet!
    Updating tests to work with testthat version 1.0.2.9000.

    !end-bullet!
-   !begin-bullet!
    Add `m`, `matches` and `s`, `substitutes` aliases for `re_matches`
    and `re_substitutes`.

    !end-bullet!

!end-bullets-4!

## Rex Version 1.1.1

!begin-bullets-5!

-   !begin-bullet!
    Vignette tweak for ggplot2 2.0.0
    !end-bullet!
-   !begin-bullet!
    Only print startup message some of the time.
    !end-bullet!
-   !begin-bullet!
    Move register for magrittr pipe to `.onLoad()`
    !end-bullet!

!end-bullets-5!

## Rex Version 1.0.1

!begin-bullets-6!

-   !begin-bullet!
    Work around ggplot2 bug with windows fonts
    !end-bullet!

!end-bullets-6!

## Rex Version 1.0.0

!begin-bullets-7!

-   !begin-bullet!
    Include the capture results even if `locations = TRUE`
    !end-bullet!
-   !begin-bullet!
    Add `:` operator for character ranges
    !end-bullet!
-   !begin-bullet!
    Remove duplicate regex functino
    !end-bullet!
-   !begin-bullet!
    Don't re-compute missing names
    !end-bullet!
-   !begin-bullet!
    Reduce code duplication
    !end-bullet!
-   !begin-bullet!
    Add examples for lookarounds
    !end-bullet!

!end-bullets-7!

## Rex Version 0.2.0

### Enhancements

!begin-bullets-8!

-   !begin-bullet!
    Add a newline shortcut
    !end-bullet!
-   !begin-bullet!
    add register_shortcuts to allow use of rex in external packages
    without spurious NOTES.
    !end-bullet!

!end-bullets-8!

## Rex Version 0.1.1

### Enhancements

!begin-bullets-9!

-   !begin-bullet!
    re_matches now has a "locations" argument, which returns the start
    and end locations of the match or capture(s).
    !end-bullet!
-   !begin-bullet!
    Simplify regular expressions generated from 'some_of' functions.
    !end-bullet!

!end-bullets-9!

### Bug fixes

!begin-bullets-10!

-   !begin-bullet!
    backslashes ("\\") are now properly escaped.
    !end-bullet!

!end-bullets-10!

### Misc

!begin-bullets-11!

-   !begin-bullet!
    Improve Rex mode documentation (#21 @Ironholds)
    !end-bullet!
-   !begin-bullet!
    Improve Log parsing Vignette copy and Title (#18, #20 @Ironholds)
    !end-bullet!
-   !begin-bullet!
    Add links to GitHub and issues page in DESCRIPTION
    !end-bullet!

!end-bullets-11!

## Rex Version 0.1.0

Initial release

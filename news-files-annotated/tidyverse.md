# tidyverse (development version)

!begin-bullets-1!

-   !begin-bullet!
    tidyverse now requires R 4.0.0.
    !end-bullet!

!end-bullets-1!

# tidyverse 2.0.0

!begin-bullets-2!

-   !begin-bullet!
    lubridate is now a member of the core tidyverse (#157)!

    !end-bullet!
-   !begin-bullet!
    tidyverse now installs ragg (#310).

    !end-bullet!
-   !begin-bullet!
    Loading the tidyverse now advertises `library(conflicted)` because
    it resolves many conflict problems and silences tidyverse's
    automated report (#218).

    !end-bullet!
-   !begin-bullet!
    `tidyverse_sitrep()` correctly displays installed package versions
    and highlights development versions of packages (#222).

    !end-bullet!

!end-bullets-2!

# tidyverse 1.3.2

!begin-bullets-3!

-   !begin-bullet!
    Text version of the citation now lists all authors (#269).

    !end-bullet!
-   !begin-bullet!
    All packages have been bumped to their latest versions.

    !end-bullet!
-   !begin-bullet!
    Messaging uses modern approach to avoid red text in RStudio (#296).

    !end-bullet!

!end-bullets-3!

# tidyverse 1.3.1

!begin-bullets-4!

-   !begin-bullet!
    tidyverse now installs dtplyr (#216), googledrive, and googlesheets4
    (#229). All packages have been bumped to their latest versions.

    !end-bullet!
-   !begin-bullet!
    License changed to MIT (#235).

    !end-bullet!

!end-bullets-4!

# tidyverse 1.3.0

!begin-bullets-5!

-   !begin-bullet!
    The tidyverse now has an associated paper at the Journal of Open
    Source Software that you can use to cite the tidyverse if you use it
    in a paper - see `citation("tidyverse")` for details.

    !end-bullet!
-   !begin-bullet!
    Eliminate repeats in the package list when loading an odd number of
    packages (#94, #100, @dchiu911)

    !end-bullet!
-   !begin-bullet!
    Packages attached from same library they were initially loaded from
    (#171, @gabrocsardi)

    !end-bullet!
-   !begin-bullet!
    If conflicted package is loaded, omit display of conflicts. This
    includes fix to `tidyverse_conflicts()` to avoid accidentally
    triggering conflicted shims (#136).

    !end-bullet!
-   !begin-bullet!
    `tidyverse_deps()` now succeeds even if a dependency of a dependency
    is missing (#152, @PoGibas). It no longer includes dependencies that
    are needed by the tidyverse package but are not strictly part of the
    tidyverse (i.e. cli, crayon, and rstudioapi).

    !end-bullet!
-   !begin-bullet!
    `tidyverse_deps()` and `tidyverse_update()` gain a new `repos`
    argument that gets passed to the base function
    `available.packages()` (@zkamvar, #82)

    !end-bullet!
-   !begin-bullet!
    `tidyverse_packages()` correctly returns packages names (#93, #106,
    @coatless)

    !end-bullet!
-   !begin-bullet!
    `tidyverse_sitrep()` gives you a situation report on your install of
    the tidyverse (#203)

    !end-bullet!

!end-bullets-5!

# tidyverse 1.2.1

!begin-bullets-6!

-   !begin-bullet!
    Require modern versions of all packages (#85)

    !end-bullet!
-   !begin-bullet!
    Work with RStudio 1.0 and earlier (#88).

    !end-bullet!

!end-bullets-6!

# tidyverse 1.2.0

## Changes to tidyverse membership

!begin-bullets-7!

-   !begin-bullet!
    stringr and forcats have been added to the core tidyverse, so they
    are attached by `library(tidyverse)`.

    !end-bullet!
-   !begin-bullet!
    reprex joins the tidyverse to make it easier to create reproducible
    examples (#47)

    !end-bullet!

!end-bullets-7!

## Other improvements

!begin-bullets-8!

-   !begin-bullet!
    On attach, tidyverse now makes better use of the horizontal space,
    printing packages and versions in two columns (#59). It only prints
    packages that it attaches, not packages that you've already
    attached. Development versions are highlighted in red.

    You can now suppress this startup message by setting
    `options(tidyverse.quiet = TRUE)`

    !end-bullet!
-   !begin-bullet!
    `tidyverse_conflicts()` now prints all conflicts that involve at
    least one tidyverse package; Previously it only omitted any
    intra-tidyverse conflicts (#26). I've also tweaked the display of
    conflicts to hopefully make it more clear which function is the
    "winner".

    !end-bullet!
-   !begin-bullet!
    `tidyverse_update()` now just gives you the code you need to update
    the packges, since in general it's not possible to update packages
    that are already loaded.

    !end-bullet!
-   !begin-bullet!
    feather is now *actually* in suggests.

    !end-bullet!

!end-bullets-8!

# tidyverse 1.1.1

!begin-bullets-9!

-   !begin-bullet!
    Moved feather from Imports to Suggests - feather is part of the
    tidyverse but it's installation requirements (C++11 + little-endian)
    make it painful in many scenarios (#36).
    !end-bullet!

!end-bullets-9!

# tidyverse 1.1.0

!begin-bullets-10!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.

    !end-bullet!
-   !begin-bullet!
    Membership changes:

    !begin-bullets-11!
    -   !begin-bullet!
        Removed DBI (since very different API, #16)
        !end-bullet!
    -   !begin-bullet!
        Added feather (#15)
        !end-bullet!

    !end-bullets-11!
    !end-bullet!
-   !begin-bullet!
    `tidyverse_deps()` and `tidyverse_packages()` are now exported so
    you can more easily see the make up of the tidyverse, and what
    package versions you have (#18, #23)

    !end-bullet!
-   !begin-bullet!
    `suppressPackageStartupMessages()` now suppresses all messages
    during loading (#19). `suppressPackageStartupMessages()` is called
    automatically for all tidyverse packages (#27).

    !end-bullet!

!end-bullets-10!

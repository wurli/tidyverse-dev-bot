# available (development version)

# available 1.1.0

!begin-bullets-1!

-   !begin-bullet!
    Removed Urban Dictionary support, as the udapi package is set to be
    archived.
    !end-bullet!

!end-bullets-1!

# available 1.0.5

!begin-bullets-2!

-   !begin-bullet!
    Gábor Csárdi is now the maintainer.

    !end-bullet!
-   !begin-bullet!
    `get_wikipidia()` renamed to `get_wikipedia()`.

    !end-bullet!
-   !begin-bullet!
    `valid_package_name()` now correctly checks a package name according
    to CRAN policy (@KevCaz, #61).

    !end-bullet!

!end-bullets-2!

# available 1.0.4

!begin-bullets-3!

-   !begin-bullet!
    Tests requiring network access are now skipped on CRAN.
    !end-bullet!

!end-bullets-3!

# available 1.0.3

!begin-bullets-4!

-   !begin-bullet!
    `BiocManager` is now preferred to `BiocInstaller` if both are
    installed (#44, @luciorq).

    !end-bullet!
-   !begin-bullet!
    `create()` now uses `usethis::create_package()` rather than the
    deprecated `devtools::create()`.

    !end-bullet!

!end-bullets-4!

# available 1.0.2

!begin-bullets-5!

-   !begin-bullet!
    Add dialog when run interactively asking if urban dictionary results
    should be included, as they can potentially contain offensive
    results (#41).
    !end-bullet!
-   !begin-bullet!
    Use BiocManager for compatibility with future versions of R.
    !end-bullet!

!end-bullets-5!

# available 1.0.1

!begin-bullets-6!

-   !begin-bullet!
    Filter own repo from GitHub results (#21).
    !end-bullet!
-   !begin-bullet!
    `get_urban_data()` is now exported (#34).
    !end-bullet!
-   !begin-bullet!
    No longer trimming r or R when proceeded by a vowel from search
    terms, as originally intended (#35).
    !end-bullet!
-   !begin-bullet!
    Support for upcoming glue 1.3.0 release
    !end-bullet!

!end-bullets-6!

# available 1.0.0

!begin-bullets-7!

-   !begin-bullet!
    Initial release
    !end-bullet!

!end-bullets-7!

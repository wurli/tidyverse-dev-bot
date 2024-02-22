# config 0.3.2.9000 (development version)

New features:

!begin-bullets-1!

-   !begin-bullet!
    Allow expressions in the `inherits:` line of the yaml file (#38)
    !end-bullet!

!end-bullets-1!

Bug fixes:

!begin-bullets-2!

-   !begin-bullet!
    Fixes bug introduced in v0.3.2 where the result of `config::get()`
    doesn't have the correct class, resulting in problems converting to
    JSON (#49)
    !end-bullet!

!end-bullets-2!

# config 0.3.2

New features:

!begin-bullets-3!

-   !begin-bullet!
    Better handling of R expressions in the `config.yml`. In particular,
    you can now refer to other configuration values in the R expression.

    !end-bullet!
-   !begin-bullet!
    Check if package is attached and throw message to use `config::ge()`
    instead.

    !end-bullet!
-   !begin-bullet!
    New function `with_config()` that might be useful for testing and in
    vignettes.

    !end-bullet!
-   !begin-bullet!
    Allow using a string for `.active_config` in `with_config()`

    !end-bullet!

!end-bullets-3!

Documentation:

!begin-bullets-4!

-   !begin-bullet!
    New vignettes, in particular using `config` with Posit Connect.
    !end-bullet!
-   !begin-bullet!
    Better documentation to not attach the package and use
    `config::get()` instead.
    !end-bullet!

!end-bullets-4!

# config 0.3.1 (2020-12-15)

!begin-bullets-5!

-   !begin-bullet!
    Bug fix: evaluate expressions only for the active config (not all
    configs). In previous versions of `config`, all expressions in the
    `yml` file were evaluated, regardless whether these expressions were
    used in the active config. In this version, the appropriate config
    is selected, and only then are the expressions evaluated. Fixes #20
    !end-bullet!

!end-bullets-5!

# config 0.3.0 (2018-03-27)

!begin-bullets-6!

-   !begin-bullet!
    Improved handling of expressions

    !end-bullet!
-   !begin-bullet!
    Bug fixes

    !end-bullet!

!end-bullets-6!

# config 0.2.0 (2016-08-02)

!begin-bullets-7!

-   !begin-bullet!
    Add `merge` function to merge one configuration into another.
    !end-bullet!

!end-bullets-7!

# config 0.1.0 (2016-06-08)

Initial release to CRAN

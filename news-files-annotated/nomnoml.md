# nomnoml 0.3.0

!begin-bullets-1!

-   !begin-bullet!
    This release can potentially cause breaking changes, because of a
    switch to use `webshot2`. You now need a chromium based browser.
    !end-bullet!
-   !begin-bullet!
    Update `nomnoml.js` to v1.6.2
    !end-bullet!
-   !begin-bullet!
    Update from `webshot` to `webshot2`, thus removing the dependency on
    `phantomjs`
    !end-bullet!

!end-bullets-1!

# nomnoml 0.2.7

!begin-bullets-2!

-   !begin-bullet!
    Remove use of `numeric_version()` to comply with changes in R devel.
    !end-bullet!

!end-bullets-2!

# nomnoml 0.2.6

!begin-bullets-3!

-   !begin-bullet!
    Update `nomnoml.js` to v1.5.3
    !end-bullet!
-   !begin-bullet!
    Fix spurious package startup message
    !end-bullet!
-   !begin-bullet!
    Merge PR by @dmurdoch to add unicode support
    !end-bullet!

!end-bullets-3!

# nomnoml 0.2.5

!begin-bullets-4!

-   !begin-bullet!
    Correctly use `packageStartupMessage()`
    !end-bullet!

!end-bullets-4!

# nomnoml 0.2.4

!begin-bullets-5!

-   !begin-bullet!
    Update `nomnoml.js` to version 1.4.0
    !end-bullet!

!end-bullets-5!

# nomnoml 0.2.3

!begin-bullets-6!

-   !begin-bullet!
    Fix CRAN check failures, specifically relaxing the requirement for
    phantomjs.

    !end-bullet!
-   !begin-bullet!
    PhantomJS is only necessary for creating PNG files, including PNG
    output in R Markdown, but not for SVG output or any interactive
    widgets, e.g. in a shiny app.

    !end-bullet!

!end-bullets-6!

# nomnoml 0.2.2

!begin-bullets-7!

-   !begin-bullet!
    Update `nomnoml` to v1.3.1 (taking dependency on `graphre`)

    !end-bullet!
-   !begin-bullet!
    Add additional tests and improved code coverage

    !end-bullet!
-   !begin-bullet!
    Add `pkgdown` documentation site

    !end-bullet!
-   !begin-bullet!
    Add `nomnoml_validate()`, an experimental function to validate if a
    diagram can be parsed. Uses the `V8` package to do this.

    !end-bullet!
-   !begin-bullet!
    Added "experimental badge" to package

    !end-bullet!

!end-bullets-7!

# nomnoml 0.2.1

!begin-bullets-8!

-   !begin-bullet!
    Change maintainer to @andrie

    !end-bullet!
-   !begin-bullet!
    Add additional tests

    !end-bullet!

!end-bullets-8!

# nomnoml 0.2.0

!begin-bullets-9!

-   !begin-bullet!
    Update `nomnoml` to version 0.7.2

    !end-bullet!
-   !begin-bullet!
    Add support for 'svg' output in 'nomnoml()'.

    !end-bullet!
-   !begin-bullet!
    Fix issue introducing too much blank space in Rmd docs.

    !end-bullet!
-   !begin-bullet!
    Fix duplicate diagrams in Shiny apps (@andrie, #15).

    !end-bullet!

!end-bullets-9!

# nomnoml 0.1.0

!begin-bullets-10!

-   !begin-bullet!
    Use `nomnoml` version 0.2.0

    !end-bullet!
-   !begin-bullet!
    Support to render PNGs.

    !end-bullet!
-   !begin-bullet!
    Support to render 'htmlwidgets'.

    !end-bullet!
-   !begin-bullet!
    Support for 'nomnoml' chunks in R Markdown.

    !end-bullet!

!end-bullets-10!

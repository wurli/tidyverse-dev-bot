# pkgdown (development version)

!begin-bullets-1!

-   !begin-bullet!
    `\cr` is now translated to `<br>` not `<br />` (#2400).
    !end-bullet!
-   !begin-bullet!
    Fix parsing of github profiles and issues into links when present at
    the beginning of list items (@pearsonca, #2122)
    !end-bullet!
-   !begin-bullet!
    Correct parse usage for S3 methods with non-syntactic class names
    (#2384).
    !end-bullet!
-   !begin-bullet!
    Deprecated `build_favicon()` was removed (`build_favicons()`
    remains).
    !end-bullet!
-   !begin-bullet!
    Use cli to provide interactive feedback.
    !end-bullet!
-   !begin-bullet!
    Preserve Markdown code blocks with class rmd from roxygen2 docs
    (@salim-b, #2298).
    !end-bullet!
-   !begin-bullet!
    Avoid unwanted linebreaks from parsing `DESCRIPTION` (@salim-b,
    #2247).
    !end-bullet!
-   !begin-bullet!
    Remove redundant entries in the documentation index when multiple
    explicit `@usage` tags are provided (@klmr, #2302)
    !end-bullet!
-   !begin-bullet!
    The article index now sorts vignettes and non-vignette articles
    alphabetically by their filename (literally, their `basename()`), by
    default (@jennybc, #2253).
    !end-bullet!
-   !begin-bullet!
    Add Catalan translation (@jmaspons, #2333)
    !end-bullet!
-   !begin-bullet!
    Set RNG seed before building articles by default. Use
    `build_articles(seed = NULL)` for the old (unreproducible)
    behaviour. (@salim-b, #2354).
    !end-bullet!
-   !begin-bullet!
    Set RNG seed for htmlwidgets IDs. This reduces noise in final HTML
    output, both for articles and examples in the reference that contain
    htmlwidgets (@salim-b, #2294, #2354).
    !end-bullet!
-   !begin-bullet!
    Set RNG seed for htmlwidgets IDs. This reduces noise in pkgdown
    reference HTML output when examples generate htmlwidgets (@salim-b,
    #2294).
    !end-bullet!
-   !begin-bullet!
    Fix BS5 navbar template to get `navbar.type: dark` to work with
    bslib 0.6+ / Bootstrap 5.3+ (@tanho63, #2388)
    !end-bullet!
-   !begin-bullet!
    Allow detection of quarto `.qmd` articles and let them be processed
    using the `quarto` vignette builder (@rcannood, #2404).
    !end-bullet!
-   !begin-bullet!
    Fix setting `seed` in `build_reference()`. The seed was reset too
    early, before. (@salim-b, #2355)
    !end-bullet!
-   !begin-bullet!
    Translates citation sections (@eliocamp, #2410).
    !end-bullet!
-   !begin-bullet!
    Topic names that conflict with selector functions can now be listed
    as references in `_pkgdown.yml` (@dmurdoch, #2397).
    !end-bullet!

!end-bullets-1!

# pkgdown 2.0.7

!begin-bullets-2!

-   !begin-bullet!
    Fix topic match selection when there is an unmatched selection
    followed by a matched selection (@bundfussr, #2234)
    !end-bullet!
-   !begin-bullet!
    Fix highlighting of nested not R code blocks (for instance, example
    of R Markdown code with chunks) (@idavydov, #2237).
    !end-bullet!
-   !begin-bullet!
    Tweak German translation (@krlmlr, @mgirlich, @lhdjung, #2149,
    #2236)
    !end-bullet!
-   !begin-bullet!
    Remove mention of (defunct) Twitter card validator, provide
    alternatives (@Bisaloo, #2185)
    !end-bullet!
-   !begin-bullet!
    Fix `keywords` typo in `check_missing_topics()` message (@swsoyee,
    #2178).
    !end-bullet!
-   !begin-bullet!
    Use jsdeliver CDN for bootstrap-toc (@GregorDeCillia, #2207).
    !end-bullet!

!end-bullets-2!

# pkgdown 2.0.6

!begin-bullets-3!

-   !begin-bullet!
    If you're using an RStudio daily, output file names are now
    clickable, previewing the generated HTML in the browser (#2157).

    !end-bullet!
-   !begin-bullet!
    Getting started vignette no longer needs to be included in the
    articles index (#2150).

    !end-bullet!
-   !begin-bullet!
    If there aren't any functions in the `\usage{}` block, then pkgdown
    will now shows all aliases on the reference index, rather than just
    the topic name (#1624).

    !end-bullet!

!end-bullets-3!

# pkgdown 2.0.5

!begin-bullets-4!

-   !begin-bullet!
    Correctly generate downlit link targets for topics that have a file
    name ending in `.` (#2128).

    !end-bullet!
-   !begin-bullet!
    `build_articles()`: if build fails because the index doesn't include
    all articles, you're now told what articles are missing (@zkamvar,
    #2121).

    !end-bullet!
-   !begin-bullet!
    `build_home()` now escapes angle brackets in author comments(#2127).

    !end-bullet!
-   !begin-bullet!
    `build_home()` will automatically render and link
    `.github/SUPPORT.md` (@IndrajeetPatil, #2124).

    !end-bullet!
-   !begin-bullet!
    `build_news()` once again fails to link `@username` at start of
    bullet. I had to reverted #2030 because of #2122.

    !end-bullet!
-   !begin-bullet!
    `build_reference()`: restore accidentally nerfed `has_keyword()` and
    `has_concept()` reference selectors (#2126) and add tests.

    !end-bullet!

!end-bullets-4!

# pkgdown 2.0.4

!begin-bullets-5!

-   !begin-bullet!
    New `check_pkgdown()` provides a lightweight way to check that your
    `_pkgdown.yml` is valid without building the site (#2056). Invalid
    `_pkgdown.yml` now consistently generates errors both locally and on
    CI (#2055).

    !end-bullet!
-   !begin-bullet!
    `build_article()` now supports inline markdown in the `title`
    (#2039).

    !end-bullet!
-   !begin-bullet!
    `build_home()` no longer shows development status badges on the
    released version of the site (#2054).

    !end-bullet!
-   !begin-bullet!
    `build_news()` support automated `@username` links in more places
    (#2030).

    !end-bullet!
-   !begin-bullet!
    `build_reference()`:

    !begin-bullets-6!
    -   !begin-bullet!
        You can once again exclude topics from the reference index with
        `-` (#2040).

        !end-bullet!
    -   !begin-bullet!
        Inline markdown in `title`s and `subtitle`s is now
        supported(#2039).

        !end-bullet!
    -   !begin-bullet!
        Package logos will be automatically stripped from the `.Rd` you
        don't end up with two on one page. (#2083).

        !end-bullet!
    -   !begin-bullet!
        `\figure{file}{alternative text}` with multiline alt text is now
        parsed correctly (#2080)

        !end-bullet!
    -   !begin-bullet!
        roxygen 7.2.0 output for generic code blocks (#2092,
        @jabenninghoff) is processed correctly.

        !end-bullet!

    !end-bullets-6!
    !end-bullet!
-   !begin-bullet!
    Front end changes:

    !begin-bullets-7!
    -   !begin-bullet!
        Automatically added links in code blocks are now styled less
        aggressively, so they occupy less visual weight on the page
        (#2007).

        !end-bullet!
    -   !begin-bullet!
        All article pages are given class `col-md-9` for consistency
        with other pages (#2045).

        !end-bullet!
    -   !begin-bullet!
        Fixed width HTML widgets are sized correctly (@dmurdoch, #2062).

        !end-bullet!
    -   !begin-bullet!
        Footnotes work with more contents, including code (@banfai,
        #2042).

        !end-bullet!
    -   !begin-bullet!
        Navbar components now accept `target` argument (#2089,
        @JSchoenbachler).

        !end-bullet!

    !end-bullets-7!
    !end-bullet!
-   !begin-bullet!
    New syntax highlighting themes a11y-light, a11y-dark,
    monochrome-light, monochrome-dark, and solarized

    !end-bullet!

!end-bullets-5!

# pkgdown 2.0.3

!begin-bullets-8!

-   !begin-bullet!
    Fixes for R CMD check
    !end-bullet!

!end-bullets-8!

# pkgdown 2.0.2

!begin-bullets-9!

-   !begin-bullet!
    New Korean (`ko`) translation thanks to @mrchypark and @peremen
    (#1944). New Danish (`dk`) translation thanks to @LDalby.

    !end-bullet!
-   !begin-bullet!
    `build_articles()` now adjusts the heading levels of
    vignettes/articles that use `<h1>` as section headings to ensure
    that there's one top-level heading (#2004). This ensures that
    there's one `<h1>`, the title, on each page, and makes the TOC in
    the sidebar work correctly.

    !end-bullet!
-   !begin-bullet!
    `build_home_index()` no longer spuriously complains about missing
    images if you use plots in your `README.Rmd` (#1980, #1977). It no
    longer tweaks the `src` path for `<img>` tags with absolute paths
    (#1955).

    !end-bullet!
-   !begin-bullet!
    `build_news()` once again works if `NEWS.md` uses `<h1>` headings
    (#1947).

    !end-bullet!
-   !begin-bullet!
    `build_reference()` now correctly interprets `title: internal`: it
    removes the section from the reference index *and* it doesn't list
    the topics in that section as missing (#1958).

    !end-bullet!
-   !begin-bullet!
    `build_reference()` now gives a correct hint when the reference
    index YAML is not formatted correctly (e.g. empty item, or item such
    as "n" that needs to be escaped with quotes to not be interpreted as
    Boolean) (#1995).

    !end-bullet!
-   !begin-bullet!
    `deploy_to_branch()` gains a `subdir` argument, allowing you to
    deploy the site to a subdirectory (@gadenbuie, #2001).

    !end-bullet!
-   !begin-bullet!
    Front end changes:

    !begin-bullets-10!
    -   !begin-bullet!
        The navbar gets a little more space after the version number,
        and aligns the baseline with rest of the navbar (#1989).

        !end-bullet!
    -   !begin-bullet!
        Long lines in code output once again scroll, rather than being
        wrapped. While this is different to what you'll see in the
        console, it's a better fit for web pages where the available
        code width varies based on the browser width (#1940).

        !end-bullet!
    -   !begin-bullet!
        scrollspy (which highlights the "active" heading in the sidebar)
        now computes the offset dynamically which makes it work better
        on sites with taller navbars (#1993).

        !end-bullet!
    -   !begin-bullet!
        Fixed js issues that occurred on pages without a table of
        contents (@gadenbuie, #1998).

        !end-bullet!
    -   !begin-bullet!
        When htmlwidgets with jQuery or Bootstrap dependencies are used
        in examples or articles, pkgdown's versions of jQuery and
        Boostrap will take precedence over the versions used by the
        htmlwidget (@gadenbuie, #1997).

        !end-bullet!

    !end-bullets-10!
    !end-bullet!
-   !begin-bullet!
    pkgdown no longer includes bundled author metadata for Hadley
    Wickham, RStudio, or the RConsortium, since there are now ways to
    include this meta data in template packages, and special casing
    these three entities feels increasingly weird (#1952).

    !end-bullet!

!end-bullets-9!

# pkgdown 2.0.1

!begin-bullets-11!

-   !begin-bullet!
    Fix CRAN failures.

    !end-bullet!
-   !begin-bullet!
    Reference sections are de-duplicated correctly (#1935).

    !end-bullet!
-   !begin-bullet!
    Usage sections only generated for topics that have them; usage
    correctly displayed with BS3 (#1931)

    !end-bullet!
-   !begin-bullet!
    Empty `\value{}` no longer errors (#1930).

    !end-bullet!

!end-bullets-11!

# pkgdown 2.0.0

## New authors

@maelle is now a pkgdown author in recognition of her significant and
sustained contributions. She was the powerhouse behind many of the
improvements in this release, particularly the switch to bootstrap 5,
improvements to customisation, and implementation of local search.

## Bootstrap 5

!begin-bullets-12!

-   !begin-bullet!
    pkgdown can style your site with Bootstrap 5 (with help from
    @jayhesselberth, @apreshill, @cpsievert). Opt-in by setting
    `boostrap` version in your `_pkgdown.yml`:

    !begin-codeblock!
    ``` yaml
    template:
      bootstrap: 5
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    We reviewed site accessibility and made a number of small
    improvements: (#782, #1553):

    !begin-bullets-13!
    -   !begin-bullet!
        Default font is larger and links are always underlined.
        !end-bullet!
    -   !begin-bullet!
        Heading anchors use `aria-hidden` to reduce noise for
        screenreader users.
        !end-bullet!
    -   !begin-bullet!
        Navbar dropdowns has improved `aria-labelledby`.
        !end-bullet!
    -   !begin-bullet!
        The default GitHub/GitLab links gain an `aria-label`; use for
        other icons is now supported, and encouraged in the docs.
        !end-bullet!
    -   !begin-bullet!
        Syntax highlighting uses a new more accessible colour scheme,
        designed by Alison Hill (#1536)
        !end-bullet!
    -   !begin-bullet!
        A skip link makes it easier to get directly to the page contents
        (#1827).
        !end-bullet!

    !end-bullets-13!
    !end-bullet!
-   !begin-bullet!
    In-line footnotes mean you can read asides next to the text they
    refer to.

    !end-bullet!
-   !begin-bullet!
    Articles support tabsets, as in R Markdown. (@JamesHWade, #1667).

    !end-bullet!
-   !begin-bullet!
    Other minor styling improvements:

    !begin-bullets-14!
    -   !begin-bullet!
        The active item in TOC is indicated with background colour,
        rather than a border.
        !end-bullet!
    -   !begin-bullet!
        If present, the package logo is shown on all pages near the
        header.
        !end-bullet!
    -   !begin-bullet!
        Section anchors now appear on the right (making them usable on
        mobile phones) (#1782).
        !end-bullet!
    -   !begin-bullet!
        The TOC is scrollable independently of the main content. This
        makes it more useful on long pages with many headings (#1610).
        !end-bullet!
    -   !begin-bullet!
        The sidebar is shown at the bottom of the page on narrow
        screens.
        !end-bullet!
    -   !begin-bullet!
        Function arguments and the reference index (#1822) use
        definition lists (`<dl>`) instead of tables. This gives more
        room for long argument names/lists of function and detailed
        descriptions, and displays better on mobile.
        !end-bullet!
    -   !begin-bullet!
        Links on the homepage no longer show the full url in the text.
        !end-bullet!
    -   !begin-bullet!
        The default navbar no longer includes a home icon - this took up
        precious horizontal space and wasn't very useful since there was
        already a link to the home page immediately to its left (#1383).
        !end-bullet!

    !end-bullets-14!
    !end-bullet!

!end-bullets-12!

## Local search

!begin-bullets-15!

-   !begin-bullet!
    pkgdown now supports local searching (i.e. searching without an
    external service), and is enabled by default for Bootstrap 5 sites
    since no set-up is needed (#1629, with help from @gustavdelius in
    #1655 and @dieghernan & @GregorDeCillia in #1770).

    !end-bullet!
-   !begin-bullet!
    pkgdown builds a more exhaustive `sitemap.xml` even for websites
    built with Bootstrap 3. This might change Algolia results if you use
    Algolia for search (#1629).

    !end-bullet!

!end-bullets-15!

## Customisation

!begin-bullets-16!

-   !begin-bullet!
    New `vignette("customise")` documents all the ways you can customise
    your site, including the new options described below (#1573).

    !end-bullet!
-   !begin-bullet!
    Sites can be easily themed with either bootswatch themes or by
    selectively overriding the `bslib` variables used to generate the
    CSS. pkgdown now uses scss for its own Bootstrap css tweaks, which
    means that you can customise more of the site from within
    `_pkgdown.yml`.

    !end-bullet!
-   !begin-bullet!
    You can pick from a variety of built-in syntax highlighting themes
    (#1823). These control the colours (and background) of code in
    `<pre>` tags.

    !end-bullet!
-   !begin-bullet!
    pkgdown can now translate all the text that it generates (#1446):
    this means that if you have a package where the docs are written in
    another language, you can match all the pkgdown UI to provide a
    seamless experience to non-English speakers. Activate the
    translations by setting the `lang` in `_pkgdown.yml`:

    !begin-codeblock!
    ``` yaml
    lang: fr
    ```

    !end-codeblock!
    pkgdown includes translations for:

    !begin-bullets-17!
    -   !begin-bullet!
        `es`, Spanish, thanks to @edgararuiz-zz, @dieghernan,
        @rivaquiroga.
        !end-bullet!
    -   !begin-bullet!
        `de`, German, thanks to @hfrick.
        !end-bullet!
    -   !begin-bullet!
        `fr`, French, thanks to @romainfrancois, @lionel-,
        @jplecavalier, and @maelle.
        !end-bullet!
    -   !begin-bullet!
        `pt`, Portuguese, thanks to @rich-iannone.
        !end-bullet!
    -   !begin-bullet!
        `tr`, Turkish, thanks to @mine-cetinkaya-rundel.
        !end-bullet!
    -   !begin-bullet!
        `zh_CN`, simplified Chinese, thanks to @yitao.
        !end-bullet!

    !end-bullets-17!
    If you're interested in adding translations for your language please
    file an issue and we'll help you get started.

    !end-bullet!
-   !begin-bullet!
    Template packages can now provide `inst/pkgdown/_pkgdown.yml` which
    is used as a set of defaults for `_pkgdown.yml`. It can be used to
    (e.g.) provide author definitions, select Bootstrap version and
    define bslib variables, and customise the sidebar, footer, navbar,
    etc. (#1499).

    !end-bullet!
-   !begin-bullet!
    New `includes` parameters `in-header`, `before-body`, and
    `after-body` make it easy to add arbitrary HTML to every page. Their
    content will be placed at the end of the `<head>` tag, right below
    the opening `<body>` tag, and before the closing tag `</body>`
    respectively (#1487). They match the bookdown options `in_header`,
    `before_body` and `after_body`.

    Additionally, you can use `before_title`, `before_navbar`, and
    `after_navbar` to add arbitrary HTML into the navbar/page header;
    they will appear to the left of the package name/version, and to the
    left and right of the navigation links respectively (#1882).

    !end-bullet!
-   !begin-bullet!
    Authors configuration is more flexible (#1516). You can now:

    !begin-bullets-18!
    -   !begin-bullet!
        Choose the roles used for filtering authors for the sidebar and
        footer.
        !end-bullet!
    -   !begin-bullet!
        Choose the text before authors in the footer.
        !end-bullet!
    -   !begin-bullet!
        Add text before and after the authors list in the sidebar.
        !end-bullet!
    -   !begin-bullet!
        Add text before and after the authors list of the authors page.
        !end-bullet!

    !end-bullets-18!
    !end-bullet!
-   !begin-bullet!
    Sidebar specification is more flexible (#1443, #1488, #1502). You
    can now:

    !begin-bullets-19!
    -   !begin-bullet!
        Change the order of sidebar elements.
        !end-bullet!
    -   !begin-bullet!
        Add custom sidebar sections (with Markdown/HTML `text`).
        !end-bullet!
    -   !begin-bullet!
        Add a table of contents to the home page.
        !end-bullet!
    -   !begin-bullet!
        Completely suppress the sidebar.
        !end-bullet!
    -   !begin-bullet!
        Provide your own HTML for the navbar.
        !end-bullet!

    !end-bullets-19!
    !end-bullet!
-   !begin-bullet!
    Footer specification is more flexible (#1502). You can now:

    !begin-bullets-20!
    -   !begin-bullet!
        Change the placement of elements on the left and right.
        !end-bullet!
    -   !begin-bullet!
        Add text to the left and right (or even remove/replace default
        text)
        !end-bullet!

    !end-bullets-20!
    !end-bullet!
-   !begin-bullet!
    You can now exclude all default components from the navbar (#1517).

    !end-bullet!
-   !begin-bullet!
    Expert users can now override layout templates provided by pkgdown
    or template packages by placing template files in
    `pkgdown/templates` (@gadenbuie, #1897).

    !end-bullet!

!end-bullets-16!

## New features

!begin-bullets-21!

-   !begin-bullet!
    pkgdown now supports redirects (#1259, @lorenzwalthert). The
    following yaml demonstrates the syntax, with old paths on the left
    and new paths/URLs on the right.

    !begin-codeblock!
    ``` yaml
    redirects:
      - ["articles/old-vignette-name.html", "articles/new-vignette-name.html"]
      - ["articles/another-old-vignette-name.html", "articles/new-vignette-name.html"]
      - ["articles/yet-another-old-vignette-name.html", "https://pkgdown.r-lib.org/dev"]
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Use HTML classes `pkgdown-devel` or `pkgdown-release` to declare
    that certain content should appear only on the devel or release
    site. Use the class `pkgdown-hide` for content that should only
    appear only on GitHub/CRAN (#1299).

    !end-bullet!
-   !begin-bullet!
    New `pkgdown_sitrep()` function reports whether the site is set up
    correctly; in particularly it currently reports if auto-linking will
    work (#1478).

    !end-bullet!

!end-bullets-21!

## Code

!begin-bullets-22!

-   !begin-bullet!
    Styling for errors, warnings, and messages has been tweaked.
    Messages are now displayed the same way as output, and warnings and
    errors are bolded, not coloured. This is part of a suite of changes
    that aim to give package authors greater control over the appearance
    of messages, warnings, and errors.

    !end-bullet!
-   !begin-bullet!
    Long lines in code output are now wrapped, rather than requiring
    scrolling. This better matches `rmarkdown::html_document()` and what
    you see in the console.

    !end-bullet!
-   !begin-bullet!
    `build_reference()` now allows linking to topics from other packages
    (either function names e.g. `rlang::is_installed` or topic names
    e.g.  `sass::font_face`). (#1664)

    !end-bullet!
-   !begin-bullet!
    `build_reference()` now runs examples with
    `options(rlang_interactive = FALSE)` (ensuring non-interactive
    behaviour in functions that use `rlang::is_interactive()`),
    `options(cli.dynamic = FALSE)`, `Sys.setenv(RSTUDIO = NA)` and
    `Sys.setLocale("LC_COLLATE", "C")` (#1693). It also runs
    `pkgdown/pre-reference.R` before and `pkgdown/post-reference.R`
    after examples. These allow you to do any setup or teardown
    operations you might need (#1602).

    !end-bullet!
-   !begin-bullet!
    A reference index section with `title: internal` is now silently
    dropped, allowing you to suppress warnings about topics that are not
    listed in the index (#1716).

    !end-bullet!
-   !begin-bullet!
    Code blocks are now highlighted according to their declared language
    (e.g. `yaml`) if the documentation was built with roxygen2 7.1.2 or
    later (#1690, #1692).

    !end-bullet!
-   !begin-bullet!
    New `pkgdown_print()` allows you to control how your objects are
    rendered in examples. It includes built-in handling for htmlwidgets
    and "browseable" HTML so pkgdown output now more closely resembles
    what you see in RStudio. Added extension points to make HTML widgets
    (and RGL in particular) work in rendered examples (@dmurdoch).

    !end-bullet!
-   !begin-bullet!
    You can globally set the `width` of code output (in reference and
    articles) with

    !begin-codeblock!
    ``` yaml
    code:
      width: 50
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Articles now render output styles created by cli/crayon (#1556).

    !end-bullet!
-   !begin-bullet!
    When copy and pasting code blocks, lines containing output
    (e.g. `#>`) are automatically omitted (#1675).

    !end-bullet!
-   !begin-bullet!
    Auto-linking improvements:

    !begin-bullets-23!
    -   !begin-bullet!
        Links to inherited R6 methods now work correctly for both
        internal (#1173, @vandenman) and external (#1476) parent
        classes.

        !end-bullet!
    -   !begin-bullet!
        Linking no longer fails if a package contains duplicated Rd
        aliases.

        !end-bullet!
    -   !begin-bullet!
        Correctly link to reference pages when the `\name{}` entry
        doesn't match the file name (@dmurdoch, #1586; #1676).

        !end-bullet!

    !end-bullets-23!
    !end-bullet!

!end-bullets-22!

## Articles

!begin-bullets-24!

-   !begin-bullet!
    Article subtitle, author and date (specified in the YAML
    frontmatter) are now correctly omitted from the article table of
    contents in the sidebar (@maxheld83, #1428).

    !end-bullet!
-   !begin-bullet!
    Support for `as_is: true` and non-default output formats for
    vignettes/ articles has been somewhat improved. Support is
    fundamentally limited due to the challenges of integrating HTML from
    output formats that pkgdown doesn't know about, but it should be a
    little more reliable and a little better documented (#1757, #1764).

    !end-bullet!
-   !begin-bullet!
    `build_articles()` no longer fails if you have a directory
    underneath vignettes with a `.Rmd` extension (#1425).

    !end-bullet!
-   !begin-bullet!
    `build_articles()` now correctly handles links to images in
    `man/figures` (which have the form `../man/figures`) (#1472).

    !end-bullet!
-   !begin-bullet!
    `build_articles()` again sets the `theme` argument of the document
    format to `NULL` when `as_is: true` but lets users override this via
    the `theme` argument of the output format.

    !end-bullet!
-   !begin-bullet!
    `build_articles()` and `build_home()` now warn if you have images
    that won't render on the website because they're in unsupported
    directories (#1810). Generally, it's only safe to refer to figures
    in `man/figures` and `vignettes`.

    !end-bullet!
-   !begin-bullet!
    Articles stored in `vignettes/articles` are moved up one level so
    that they appear in `articles/` on the website. Previously, they
    would appear in `articles/articles`, so `build_redirects()`
    automatically adds redirects for any articles in the
    `vignettes/articles` directory (@gadenbuie #1911).

    !end-bullet!

!end-bullets-24!

## HTML, CSS and JS

!begin-bullets-25!

-   !begin-bullet!
    New `template` option `trailing_slash_redirect` that allows adding a
    script to redirect `your-package-url.com` to `your-package-url.com/`
    (#1439, @cderv, @apreshill).

    !end-bullet!
-   !begin-bullet!
    External links now get the class `external-link`. This makes them
    easier to style with CSS (#881, #1491).

    !end-bullet!
-   !begin-bullet!
    Duplicated section ids are now de-duplicated; this makes pkgdown
    work better with the documentation of R6 classes.

    !end-bullet!
-   !begin-bullet!
    Updated CSS styles from pandoc to improve styling of reference lists
    (#1469).

    !end-bullet!

!end-bullets-25!

## Deployment

!begin-bullets-26!

-   !begin-bullet!
    `build_site_github_pages()` has been extracted out of
    `deploy_site_github()` to make it easier to decouple building and
    deployment, and so we can take advantage of standard deployment
    actions (#1756).

    !end-bullet!
-   !begin-bullet!
    `deploy_to_branch()` now calls `git remote set-branches` with
    `--add` to avoid overwriting the existing `remote.{remote}.fetch`
    value (@kyleam, #1382). It also now cleans out the website directory
    by default; revert to previous behaviour with `clean = FALSE`
    (#1394).

    !end-bullet!
-   !begin-bullet!
    `build_reference()` will error if envar `CI` is `true` and there are
    missing topics (@ThierryO, #1378).

    !end-bullet!
-   !begin-bullet!
    You can override the `auto` development mode detected from the
    package version by setting env var `PKGDOWN_DEV_MODE` to `release`
    or `devel`. This is useful if your package uses a different
    convention to indicate development and release versions (#1081).

    !end-bullet!

!end-bullets-26!

## Other minor improvements and bug fixes

!begin-bullets-27!

-   !begin-bullet!
    `\special{}` tags with complex contents are rendered correctly
    (@klmr, #1744).

    !end-bullet!
-   !begin-bullet!
    `\arguments{}` and `\value{}` do a better job of handling mingled
    items and text (#1479). The contents of `\value{}` are now shown
    immediately after `\arguments{}`.

    !end-bullet!
-   !begin-bullet!
    The default "branch" for linking to the file sources is `HEAD`,
    which will work regardless of whether your default branch is called
    "main" or "master".

    !end-bullet!
-   !begin-bullet!
    Non-ORCID comments in `Authors@R` are now more usable: if such
    comments exist, the sidebar gains a link to the authors page, where
    they are displayed (#1516).

    !end-bullet!
-   !begin-bullet!
    Citations with and without text versions are better handled, and
    text citations are correctly escaped for HTML (@bastistician,
    #1507).

    !end-bullet!
-   !begin-bullet!
    README badges in a single paragraph placed between
    `<!-- badges: end -->`and `<!-- badges: end -->` comments are again
    detected (#1603).

    !end-bullet!
-   !begin-bullet!
    The 404 page (default or from `.github/404.md`) is no longer built
    in the development mode (see `?build_site`) as e.g. GitHub pages
    only uses the `404.html` in the site root (#1622).

    !end-bullet!
-   !begin-bullet!
    All links on the 404 pages (navbar, scripts, CSS) are now absolute
    if there is an URL in the configuration file (#1622).

    !end-bullet!
-   !begin-bullet!
    The version tooltip showed in the top navbar is now only set if
    you've explicitly set the `development.mode` in `_pkgdown.yml`
    (#1768).

    !end-bullet!
-   !begin-bullet!
    All heading (e.g. headings on the reference index page, and the
    arguments heading on the reference pages) now get anchors (#1747).

    !end-bullet!
-   !begin-bullet!
    Use `autolink_bare_uris` for Pandoc above version 2.0 (@marcosmolla,
    #1618).

    !end-bullet!
-   !begin-bullet!
    pkgdown now recognizes GitLab URLs to the source repository and adds
    the corresponding icon to the navbar (#1493). It also supports
    GitLab subgroups (@salim-b, #1532).

    !end-bullet!
-   !begin-bullet!
    Links for GitHub Enterprise and GitLab Enterprise repositories are
    detected by assuming such host address begin with `github.` or
    `gitlab.` (@ijlyttle, #1452).

    !end-bullet!
-   !begin-bullet!
    The rules drawn by the CLI (as for example, in `build_site()`) are
    protected against very narrow terminal windows (@maxheld83, #1435).

    !end-bullet!
-   !begin-bullet!
    Google Site Verification
    (https://support.google.com/webmasters/answer/9008080?hl=en) can now
    be configured for pkgdown sites.

    !end-bullet!
-   !begin-bullet!
    `build_rmarkdown_format` sets
    `html_document(anchor_sections = FALSE)` to avoid needless
    dependencies (@atusy, #1426).

    !end-bullet!
-   !begin-bullet!
    Jira issues in NEWS can be automatically linked by setting your
    project name

    (s) with `repo: jira_projects: [...]` and specifying a custom issue
        URL with `repo: url: issue: ...` in `_pkgdown.yml` (@jonkeane,
        #1466).

    !end-bullet!
-   !begin-bullet!
    `build_home()` always creates citation information for the authors
    page, using metadata from `DESCRIPTION` when there is no
    `inst/CITATION` file, and links to this from the sidebar (#1904).

    !end-bullet!
-   !begin-bullet!
    `build_news()` no longer breaks with URLs containing numeric
    fragments (@krassowski, #1456), recognises more styles of release
    heading (#1437), and generate stable IDs using a the combination of
    the heading slug and package number. (@Bisaloo, #1015)

    !end-bullet!

!end-bullets-27!

# pkgdown 1.6.1

!begin-bullets-28!

-   !begin-bullet!
    The article index (used for autolinking vignettes across packages)
    once again works (#1401).
    !end-bullet!

!end-bullets-28!

# pkgdown 1.6.0

## Major changes

!begin-bullets-29!

-   !begin-bullet!
    pkgdown now uses the new downlit package for all syntax highlighting
    and autolinking (in both reference topics and vignettes). There
    should be very little change in behaviour because the code in
    downlit was extracted from pkgdown, but this makes it easier to use
    pkgdown's nice linking/highlighting in more places (#1234).

    !end-bullet!
-   !begin-bullet!
    pkgdown now uses the `ragg::agg_png()` device to generate example
    figures. This should be a little faster and produce higher quality
    output. Learn more at https://ragg.r-lib.org (#1320).

    !end-bullet!

!end-bullets-29!

## Minor improvements and bug fixes

### Rd translation

!begin-bullets-30!

-   !begin-bullet!
    `\special{}` support inside `\usage{}` added to allow non-standard R
    usage syntax (@klmr, #1345).

    !end-bullet!
-   !begin-bullet!
    `#ifdef` and `#ifndef` are now supported; the "current" OS is hard
    coded to "unix" to ensure reproducible output regardless of where
    you build the website (#1384).

    !end-bullet!
-   !begin-bullet!
    Nested `\subsection{}`s now generate appropriate heading levels (h3,
    h4, h5 etc) (#1377), and get anchor links (#1389).

    !end-bullet!
-   !begin-bullet!
    `\preformatted{}` no longer double escapes its contents (#1311).

    !end-bullet!

!end-bullets-30!

### Articles and vignettes

!begin-bullets-31!

-   !begin-bullet!
    `build_articles()` no longer sets the `theme` argument of the
    document format to `NULL` when `as_is: true`. This should allow it
    to work with a wider range of output formats including
    `bookdown::html_vignette2()` and friends (@GegznaV, #955, #1352).

    !end-bullet!
-   !begin-bullet!
    When `build_article()` fails, it gives the complete failure message
    (#1379).

    !end-bullet!
-   !begin-bullet!
    Markdown header attributes are now processed in all markdown files
    (@jonkeane, #1343)

    !end-bullet!

!end-bullets-31!

### Auto-linking and syntax highlighting

!begin-bullets-32!

-   !begin-bullet!
    The branch used for source linking can be configured by setting
    `repo: branch: branch_name` in `_pkgdown.yml` (@jonkeane, #1355):

    !begin-codeblock!
    ``` yaml
    repo:
      branch: main
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `autolink_html()` is (soft) deprecated. Please use
    `downlit::downlit_html_path()` instead.

    !end-bullet!
-   !begin-bullet!
    Highlighting of empty expressions works once more (#1310).

    !end-bullet!
-   !begin-bullet!
    New `deploy$install_metadata` option in `_pkgdown.yml`. Setting it
    to `true` will store site metadata in the package itself, allowing
    offline access for packages that to autolink to the package's
    website (@mstr3336, #1336).

    !end-bullet!

!end-bullets-32!

### Other

!begin-bullets-33!

-   !begin-bullet!
    You can now control the background colour of plots with the
    `figures.bg` option (it is transparent by default, and given a white
    background by css). See `?build_reference` for an example.

    !end-bullet!
-   !begin-bullet!
    HTML is automatically stripped from the page title (#1318).

    !end-bullet!
-   !begin-bullet!
    Suppressing CRAN dates in news file now actually works.

    !end-bullet!
-   !begin-bullet!
    All HTTP requests are now retried upon failure (@jameslamb, #1305).

    !end-bullet!
-   !begin-bullet!
    Setting `clean = TRUE` in `deploy_site_github()` removes old files
    from the deployed site before building a new one (#1297).

    !end-bullet!

!end-bullets-33!

# pkgdown 1.5.1

!begin-bullets-34!

-   !begin-bullet!
    Syntax highlighting works on Windows once more (#1282).

    !end-bullet!
-   !begin-bullet!
    pkgdown no longer fails if your `.Rd` files have duplicated
    `\aliases` as were produced by an older version of roxygen2 (#1290).

    !end-bullet!
-   !begin-bullet!
    Rendering empty `.md` file now returns empty string (#1285).

    !end-bullet!
-   !begin-bullet!
    `build_articles_index()` is now exported to rapidly rebuild the
    index (#1281)

    !end-bullet!
-   !begin-bullet!
    `deploy_site_github()` now accepts a `host` argument to specify
    alternate hosts (e.g., Github enterprise) (@dimagor, #1165) and once
    again works as intended on Travis-CI (@jimhester, #1276).

    !end-bullet!

!end-bullets-34!

# pkgdown 1.5.0

## New features

!begin-bullets-35!

-   !begin-bullet!
    The articles index page and navbar have been overhauled. There are
    two major new features in this release:

    !begin-bullets-36!
    -   !begin-bullet!
        The articles index page now displays article `description`s,
        taken from YAML metadata belonging to each article. This lets
        you provide more context about each article and describe why one
        might want to read it (#1227).

        !end-bullet!
    -   !begin-bullet!
        The articles navbar is now also controlled by the `articles`
        section in `_pkgdown.yml`. The ordering of the sections, and
        articles within them, control the order of the articles in the
        navbar, and you can use the new `navbar` field to control
        whether or not each section appears in the navbar (#1101,
        #1146).

        !end-bullet!

    !end-bullets-36!
    !end-bullet!
-   !begin-bullet!
    The reference index now has two levels of heading hierarchy: `title`
    and `subtitle` (#327).

    !end-bullet!
-   !begin-bullet!
    Tables of contents in sidebars now use bootstrap-toc; this
    considerably improves navigation for long articles and reference
    pages.

    !end-bullet!
-   !begin-bullet!
    You can now control the links to source files (in reference pages
    and articles) and issues and users (in the NEWS) with new `repo$url`
    config option (#1238). This makes it easier to use pkgdown with
    GitHub enterprise, packages in subdirectories, and other source
    hosts (like bitbucket).

    !begin-codeblock!
    ``` yaml
    repo:
      url:
        home: https://github.com/r-lib/pkgdown/
        source: https://github.com/r-lib/pkgdown/blob/main/
        issue: https://github.com/r-lib/pkgdown/issues/
        user: https://github.com/
    ```

    !end-codeblock!
    The individual components (e.g. path, issue number, username) are
    pasted on the end of these urls so they should have trailing `/`s.

    You don't need to set these links for GitLab, as pkgdown now detects
    GitLab urls automatically (since they use the same structure as
    GitHub) (#1045).

    !end-bullet!
-   !begin-bullet!
    There's much richer control over Open Graph and Twitter metadata for
    the whole site and for individual articles. See new
    `vignette("metadata")` for details (@gadenbuie, #936).

    !end-bullet!
-   !begin-bullet!
    New `deploy_to_branch()` function to build and deploy a site to a
    branch, defaulting to `gh-pages` for use with GitHub Pages. This is
    used in our recommended GitHub action workflow for automatically
    building and deploying pkgdown sites for packages on GitHub
    (@jimhester, #1221).

    !end-bullet!
-   !begin-bullet!
    Updated JS libraries: jquery 3.3.1 -\> 3.4.1; bootswatch 3.3.7 -\>
    3.4.0; bootstrap 3.3.7 -\> bootstrap 3.4.1; docsearch 2.6.1 -\>
    2.6.3; fontawesome 5.11.1 -\> 5.12.1; headroom.js 0.9.44 -\> 0.11.0;
    clipboard.js 2.0.4 -\> 2.0.6 (@jayhesselberth).

    !end-bullet!

!end-bullets-35!

## Auto-linking improvements

!begin-bullets-37!

-   !begin-bullet!
    Examples and Rmd now use exactly the same syntax highlighting
    strategy.

    !end-bullet!
-   !begin-bullet!
    In examples and Rmd, calls of the form `current_package::foo` now
    get a local link (#1262).

    !end-bullet!
-   !begin-bullet!
    `\preformatted{}` blocks are now highlighted and linked if they
    parse as R code (#1180).

    !end-bullet!
-   !begin-bullet!
    `library(pkgdown)` is now automatically linked to the reference
    index for "pkgdown" not the documentation for `library()` (#1161).

    !end-bullet!
-   !begin-bullet!
    `help("topic")` is now automatically linked to the documentation for
    "topic", not to the documentation for `help()` (#1210)

    !end-bullet!

!end-bullets-37!

## Minor improvements and bug fixes

### Articles

!begin-bullets-38!

-   !begin-bullet!
    `build_home()` no longer uses (unrendered) `README.Rmd` or
    `index.Rmd` if corresponding `.md` files are not found.

    !end-bullet!
-   !begin-bullet!
    `build_article()` failures now print more information to help you
    debug the problem (#952).

    !end-bullet!
-   !begin-bullet!
    The name of the vignette mapped to the "Get started" entry in the
    navbar is now more flexible. You can use an article (e.g
    `articles/{pkgname}`) and if your package has a `.` in its name you
    can replace it with `-` to generate a valid article name (e.g. the
    get started vignette for `pack.down` would be `pack-down`) (#1166).

    !end-bullet!

!end-bullets-38!

### Deployment

!begin-bullets-39!

-   !begin-bullet!
    `deploy_to_branch()` now correctly captures the commit SHA on GitHub
    Actions (@coatless, #1252).

    !end-bullet!
-   !begin-bullet!
    `deploy_to_branch(github_pages = TRUE)` generates a `.nojekyll` to
    prevent jekyll ever executing (#1242).

    !end-bullet!
-   !begin-bullet!
    `CNAME` is no longer generated by `init_site()`, but is instead
    conditionally by `deploy_to_branch()` when `github_pages = TRUE`.
    This is a better a fit because the `CNAME` file is only needed by
    GitHub pages (#969).

    !end-bullet!
-   !begin-bullet!
    `deploy_site_github()` argument `repo_slug` has been deprecated and
    is no longer needed or used. (@jimhester, #1221)

    !end-bullet!

!end-bullets-39!

### News

See additional details in `?build_news`:

!begin-bullets-40!

-   !begin-bullet!
    You can optionally suppress the CRAN release dates added to the news
    page (#1118).

    !end-bullet!
-   !begin-bullet!
    Multi-page news style gets a better yaml specification (the old
    style will continue to work so no need to change existing YAML).

    !end-bullet!

!end-bullets-40!

### Reference

!begin-bullets-41!

-   !begin-bullet!
    A topic named `index` will not longer clobber the reference index
    (#1110).

    !end-bullet!
-   !begin-bullet!
    Topic names/aliases on reference index are now escaped (#1216).

    !end-bullet!
-   !begin-bullet!
    `build_reference()` gives better warnings if your `_pkgdown.yml` is
    constructed incorrectly (#1025).

    !end-bullet!
-   !begin-bullet!
    New `has_keyword()` topic selector for `reference`.
    `has_keyword("datasets")` is particularly useful for selecting all
    data documentation (#760).

    !end-bullet!
-   !begin-bullet!
    New `lacks_concepts()` can select topics that do not contain any of
    a number of specified concepts. (@mikldk, #1232)

    !end-bullet!

!end-bullets-41!

### Home, authors, and citation

!begin-bullets-42!

-   !begin-bullet!
    pkgdown now escapes html and linkifies links in comments in author
    info from DESCRIPTION (@maelle, #1204)

    !end-bullet!
-   !begin-bullet!
    pkgdown now uses the ORCiD logo included in Font Awesome 5.11
    instead of querying it from members.orcid.org (@bisaloo, #1153)

    !end-bullet!
-   !begin-bullet!
    badges are now extracted from everything between
    `<!--badges: start-->` and `<!--badges: end-->`. They used to be
    extracted only if they were direct children of the first `<p>` after
    `<!--badges: start-->`.

    !end-bullet!
-   !begin-bullet!
    `build_home()` now looks for `pkgdown/index.md` in addition to the
    top-level `index` or `README` files (@nteetor, #1031)

    !end-bullet!

!end-bullets-42!

### Navbar

!begin-bullets-43!

-   !begin-bullet!
    pkgdown now formats the package version displayed in the navbar the
    same way as it has been specified in the DESCRIPTION file. In
    particular, version separators (e.g. `.` and `-`) are preserved.
    (#1170, @kevinushey)

    !end-bullet!
-   !begin-bullet!
    add support for navbar submenus: you can create submenus following
    the convention established in rstudio/rmarkdown#721 (@ijlyttle,
    @wendtke, #1213)

    !end-bullet!

!end-bullets-43!

### Other

!begin-bullets-44!

-   !begin-bullet!
    Updated JS libraries: jquery 3.3.1 -\> 3.4.1; bootswatch 3.3.7 -\>
    3.4.0; bootstrap 3.3.7 -\> bootstrap 3.4.1; docsearch 2.6.1 -\>
    2.6.3 (@jayhesselberth).

    !end-bullet!
-   !begin-bullet!
    Markdown conversion now explicitly allows markdown inside of HTML
    blocks; this was previously accidentally disabled (#1220).

    !end-bullet!
-   !begin-bullet!
    A timestamp for the last site build is reported in `pkgdown.yml`
    (#1122).

    !end-bullet!

!end-bullets-44!

# pkgdown 1.4.1

!begin-bullets-45!

-   !begin-bullet!
    Don't install test package in user library (fixes CRAN failure).
    !end-bullet!

!end-bullets-45!

# pkgdown 1.4.0

## New features

!begin-bullets-46!

-   !begin-bullet!
    build citation as specified by the `textVersion` argument of
    `citEntry` in the `CITATION` file (#1096, @yiluheihei)

    !end-bullet!
-   !begin-bullet!
    `build_site()`, `build_reference()` and `build_home()` gain a
    parameter `devel` which controls whether you're in deployment or
    development mode. It generalises and replaces (with deprecation) the
    existing `document` argument.

    Development mode is optimised for rapid iteration and is the default
    for `build_reference()`. It uses `pkgload::load_all()` to load code
    directly from disk in order.

    Deployment mode is slower, but guarantees correct results, and is
    the default for `build_site()`. It installs the package into a
    temporary library, and runs examples/articles in a new process.

    !end-bullet!
-   !begin-bullet!
    `build_reference()` no longer runs `devtools::document()` (#1079)
    and `build_home()` no longer re-builds `README.Rmd` or `index.Rmd`.
    This makes the scope of responsibility of pkgdown more clear: it now
    only creates/modifies files in `doc/`.

    !end-bullet!
-   !begin-bullet!
    `build_home()` now strips quotes from `Title` and `Description`
    fields when generating page metadata. Additionally, you can now
    override the defaults via the `title` and `description` fields in
    the `home` section of `_pkgdown.yml` (#957, @maelle).

    !end-bullet!
-   !begin-bullet!
    `vignette("linking")` describes how pkgdown's automatic linking
    works, and how to ensure that cross-package links point to the right
    place.

    !end-bullet!

!end-bullets-46!

## Bug fixes and minor improvements

### Rd translation

!begin-bullets-47!

-   !begin-bullet!
    `\examples{}` rendering has been completely overhauled so it now
    first converts the entire mixed Rd-R block to R prior, and then
    evaluates the whole thing. This considerably improves the fidelity
    of the translation at a small cost of no longer being able to remove
    `\donttest{}` and friends (#1087).

    !end-bullet!
-   !begin-bullet!
    `\item{}`s in `\describe{}` containing whitespace are translated
    correctly (#1117).

    !end-bullet!
-   !begin-bullet!
    `\dots` and `\ldots` are translated to `...` instead of the
    ellipsis, since they're often found in code (#1114).

    !end-bullet!
-   !begin-bullet!
    `\tabular{}` translation handles code better (@mitchelloharawild,
    #978).

    !end-bullet!
-   !begin-bullet!
    `\subsection{}` contents are now treated as paragraphs, not inline
    text (#991).

    !end-bullet!
-   !begin-bullet!
    `\preformatted{}` blocks preserve important whitespace (#951).

    !end-bullet!

!end-bullets-47!

### Front end

!begin-bullets-48!

-   !begin-bullet!
    Links to online documentation for functions in code chunks are no
    longer displayed when printing (#1135, @bisaloo).

    !end-bullet!
-   !begin-bullet!
    Updated fontawesome to v5.7.1. fontawesome 5 deprecated the `fa`
    prefix. If you have used custom icons in your navbar, you'll should
    update them from (e.g.) `fa fa-home` to `fas fa-home`. Brands now
    have a separate prefix so `fa fa-github` becomes `fab fa-github`
    (#953).

    !end-bullet!
-   !begin-bullet!
    The navbar is now automatically hidden with headroom.js.

    !end-bullet!
-   !begin-bullet!
    The sticky behaviour of the navbar is now implemented in pure CSS
    instead of relying a the 3rd party javascript library (#1016,
    @bisaloo)

    !end-bullet!
-   !begin-bullet!
    Favicons are now automatically built from a package logo (#949).

    !end-bullet!

!end-bullets-48!

### Linking

!begin-bullets-49!

-   !begin-bullet!
    Infix operators (e.g., `%in%` and `%*%`) are now linked to their
    documentation (#1082).

    !end-bullet!
-   !begin-bullet!
    Function names can now be included in headers without spurious
    auto-linking (#948).

    !end-bullet!
-   !begin-bullet!
    Links to external documentation now point to rdrr.io (#998).

    !end-bullet!

!end-bullets-49!

### Other

!begin-bullets-50!

-   !begin-bullet!
    News page recognises more version specifications (including the\
    "(development version)" now used by usethis) (#980).

    !end-bullet!
-   !begin-bullet!
    Subdirectories are supported for assets (#939, @ijlyttle).

    !end-bullet!
-   !begin-bullet!
    A default 404 page (`404.html`) is built, unless a custom
    `.github/404.md` is provided (#947).

    !end-bullet!
-   !begin-bullet!
    `build_article()` now uses the raw vignette title as page `<title>`
    and `og:title` (@maelle, #1037).

    !end-bullet!
-   !begin-bullet!
    `build_home()` now looks for license files spelled either as LICENSE
    or LICENCE (#972).

    !end-bullet!
-   !begin-bullet!
    `build_home()` can find badges in paragraph coming after the comment
    `<!-- badges: start -->` (#670, @gaborcsardi, @maelle).

    !end-bullet!
-   !begin-bullet!
    `build_home()` will add a community section to the sidebar if there
    is either a code of conduct (`.github/CODE_OF_CONDUCT.md`) or a
    contributing guide (`.github/CONTRIBUTING.md`) (#1044, @maelle).

    !end-bullet!
-   !begin-bullet!
    `build_reference()` gains a `topics` argument which allows you to
    re-build only specified topics.

    !end-bullet!
-   !begin-bullet!
    `build_site(new_process = TRUE)` gains a timeout,
    `options(pkgdown.timeout = 10)`, that can be used to prevent stalled
    builds.

    !end-bullet!
-   !begin-bullet!
    `deploy_site_github(install = FALSE)` makes it possible to opt out
    of installation.

    !end-bullet!
-   !begin-bullet!
    `dev_mode()` now recognises `0.1.9000` as a development version of a
    package (this is an emerging standard we use for packages with
    backward incompatible changes) (#1101).

    !end-bullet!

!end-bullets-50!

# pkgdown 1.3.0

!begin-bullets-51!

-   !begin-bullet!
    Restore accidentally deleted `build_logo()` function so that logos
    are once more copied to the website.

    !end-bullet!
-   !begin-bullet!
    Fix to `pkgdown.css` so page header has correct amount of top
    margin.

    !end-bullet!
-   !begin-bullet!
    `content-home.html` template is no longer used when the homepage is
    an `.Rmd` (Reverts #834. Fixes #927, #929)

    !end-bullet!
-   !begin-bullet!
    `deploy_site_github()` now passes parameters to `build_site()`
    (@noamross, #922), and the documentation gives slightly better
    advice.

    !end-bullet!
-   !begin-bullet!
    Correct off-by-one error in navbar highlighting javascript; now no
    navbar is highlighted if none match the current path (#911).

    !end-bullet!
-   !begin-bullet!
    Tweaking of HTML table classes was fixed (@yonicd, #912)

    !end-bullet!
-   !begin-bullet!
    Restore accidentally removed `docsearch.css` file.

    !end-bullet!

!end-bullets-51!

# pkgdown 1.2.0

## New features

!begin-bullets-52!

-   !begin-bullet!
    `deploy_site_github()` can be used from continuous integration
    systems (like travis) to automatically deploy your package website
    to GitHub Pages. See documentation for how to set up details
    (@jimhester).

    !end-bullet!
-   !begin-bullet!
    `build_favicon()` creates high resolution favicons from the package
    logo, and saves them in `pkgdown/`. They are created using the
    https://realfavicongenerator.net/ API, and are better suited for
    modern web usage (e.g. retina display screens, desktop shortcuts,
    etc.). This also removes the dependency on the magick package,
    making automated deployment a little easier (@bisaloo, #883).

    !end-bullet!
-   !begin-bullet!
    Users with limited internet connectivity can explicitly disable
    internet usage by pkgdown by setting
    `options(pkgdown.internet = FALSE)` (#774, #877).

    !end-bullet!

!end-bullets-52!

## Improvements to Rd translation

!begin-bullets-53!

-   !begin-bullet!
    `rd2html()` is now exported to facilitate creation of translation
    reprexes.

    !end-bullet!
-   !begin-bullet!
    `\Sexpr{}` conversion supports multiple arguments, eliminating
    `x must be a string or a R connection` errors when using `\doi{}`
    (#738).

    !end-bullet!
-   !begin-bullet!
    `\tabular{}` conversion better handles empty cells (#780).

    !end-bullet!
-   !begin-bullet!
    `\usage{}` now supports qualified functions eliminating\
    `Error in fun_info(x) : Unknown call: ::` errors (#795).

    !end-bullet!
-   !begin-bullet!
    Invalid tags now generate more informative errors (@BarkleyBG, #771,
    #891)

    !end-bullet!

!end-bullets-53!

## Front end

!begin-bullets-54!

-   !begin-bullet!
    The default footer now displays the version of pkgdown used to build
    the site (#876).

    !end-bullet!
-   !begin-bullet!
    All third party resources are now fetched from a single CDN and are
    give a SRI hash (@bisaloo, #893).

    !end-bullet!
-   !begin-bullet!
    The navbar version now has class "version" so you can more easily
    control its display (#680).

    !end-bullet!
-   !begin-bullet!
    The default css has been tweaked to ensure that icons are visible on
    all browsers (#852).

    !end-bullet!

!end-bullets-54!

## Bug fixes and minor improvements

### Home page

!begin-bullets-55!

-   !begin-bullet!
    Can now build sites for older packages that don't have a `Authors@R`
    field (#727).

    !end-bullet!
-   !begin-bullet!
    Remote urls ending in `.md` are no longer tweaked to end in `.html`
    (#763).

    !end-bullet!
-   !begin-bullet!
    Bug report link is only shown if there's a "BugReports" field
    (#855).

    !end-bullet!
-   !begin-bullet!
    `content-home.html` template is now used when the homepage is an
    `.Rmd` (@goldingn, #787).

    !end-bullet!
-   !begin-bullet!
    A link to the source `inst/CITATION` was added to the authors page
    (#714).

    !end-bullet!

!end-bullets-55!

### News

!begin-bullets-56!

-   !begin-bullet!
    Uses stricter regular expression when linking to GitHub authors
    (#902).
    !end-bullet!

!end-bullets-56!

### Reference

!begin-bullets-57!

-   !begin-bullet!
    Unexported functions and test helpers are no longer loaded (#789).

    !end-bullet!
-   !begin-bullet!
    Selectors that do not match topics now generate a warning. If none
    of the specified selectors have a match, no topics are selected
    (#728).

    !end-bullet!

!end-bullets-57!

### Articles

!begin-bullets-58!

-   !begin-bullet!
    The display depth of vignette tables of contents can be configured
    by setting `toc: depth` in `_pkgdown.yml` (#821):

    !begin-codeblock!
    ``` yaml
    toc:
      depth: 2
    ```

    !end-codeblock!
    !end-bullet!

!end-bullets-58!

### Overall site

!begin-bullets-59!

-   !begin-bullet!
    `init_site()` now creates a CNAME file if one doesn't already exist
    and the site's metadata includes a `url` field.

    !end-bullet!
-   !begin-bullet!
    `build_site()` loses vestigal `mathjax` parameter. This didn't
    appear to do anything and no one could remember why it existed
    (#785).

    !end-bullet!
-   !begin-bullet!
    `build_site()` now uses colours even if `new_process = TRUE`
    (@jimhester).

    !end-bullet!

!end-bullets-59!

# pkgdown 1.1.0

## New features

!begin-bullets-60!

-   !begin-bullet!
    `build_reference()` and `build_site()` get new `document` argument.
    When `TRUE`, the default, will automatically run
    `devtools::document()` to ensure that your documentation is up to
    date.

    !end-bullet!
-   !begin-bullet!
    `build_site()` gains a `new_process` argument, which defaults to
    `TRUE`. This will run pkgdown in a separate process, and is
    recommended practice because it improves reproducibility (#647).

    !end-bullet!
-   !begin-bullet!
    Improved display for icons: icons must be 30px and stored in
    top-level `icons/` directory. They are embedded in a separate column
    of reference index table, instead of being inside a comment (!)
    (#607).

    !end-bullet!

!end-bullets-60!

## Front end

!begin-bullets-61!

-   !begin-bullet!
    Added a keyboard shortcut for searching. Press `shift` + `/` (`?`)
    to move focus to the search bar (#642).

    !end-bullet!
-   !begin-bullet!
    The Algolia logo is correctly shown in the search results (#673).

    !end-bullet!
-   !begin-bullet!
    Navbar active tab highlighting uses a superior approach (suggested
    by

    1)  which should mean that the active page is correctly highlighted
        in all scenarios (#660).

    !end-bullet!
-   !begin-bullet!
    `pkgdown.js` is better isolated so it should still work even if you
    load html widgets that import a different version of jquery (#655).

    !end-bullet!

!end-bullets-61!

## Improvements to Rd translation

!begin-bullets-62!

-   !begin-bullet!
    `vignette()` calls that don't link to existing vignettes silently
    fail to link instead of generating an uninformative error messages
    (#652). Automatic linking works for re-exported objects that are not
    functions (@gaborcsardi, #666).

    !end-bullet!
-   !begin-bullet!
    Empty `\section{}`s are ignored (#656). Previously, empty sections
    caused error `Error in rep(TRUE, length(x) - 1)`.

    !end-bullet!
-   !begin-bullet!
    `\Sexpr{}` supports `results=text`, `results=Rd` and `results=hide`
    (#651).

    !end-bullet!
-   !begin-bullet!
    `\tabular{}` no longer requires a terminal `\cr` (#664, #645).

    !end-bullet!

!end-bullets-62!

## Minor bug fixes and improvements

!begin-bullets-63!

-   !begin-bullet!
    Add `inst/pkgdown.yml` as a possible site configuration file so that
    packages on CRAN can be built without needing the development
    version (#662).

    !end-bullet!
-   !begin-bullet!
    Default navbar template now uses site title, not package name (the
    package name is the default title, so this will not affect most
    sites) (#654).

    !end-bullet!
-   !begin-bullet!
    You can suppress indexing by search engines by setting
    `noindex: true` `pkgdown.yml` (#686)

    !begin-codeblock!
    ``` yaml
    template:
      params:
        noindex: true
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `build_article()` sets `IN_PKGDOWN` env var so `in_pkgdown()` works
    (#650).

    !end-bullet!
-   !begin-bullet!
    `build_home()`: CITATION files with non-UTF-8 encodings (latin1)
    work correctly, instead of generating an error. For non-UTF-8
    locales, ensure you have e.g. `Encoding: latin1` in your
    `DESCRIPTION`; but best practice is to re-enode your CITATION file
    to UTF-8 (#689).

    !end-bullet!
-   !begin-bullet!
    `build_home()`: Markdown files (e.g., `CODE_OF_CONDUCT.md`) stored
    in `.github/` are copied and linked correctly (#682).

    !end-bullet!
-   !begin-bullet!
    `build_news()`: Multi-page changelogs (generated from `NEWS.md` with
    `news: one_page: false` in `_pkgdown.yml`) are rendered correctly.

    !end-bullet!
-   !begin-bullet!
    `build_reference()`: reference index shows infix functions (like
    `%+%`) as `` `%+%` ``, not `` `%+%`() `` on (#659).

    !end-bullet!

!end-bullets-63!

# pkgdown 1.0.0

!begin-bullets-64!

-   !begin-bullet!
    Major refactoring of path handling. `build_` functions no longer
    take `path` or `depth` arguments. Instead, set the `destination`
    directory at the top level of `pkgdown.yml`.

    !end-bullet!
-   !begin-bullet!
    Similarly, `build_news()` no longer takes a `one_page` argument;
    this should now be specified in the `_pkgdown.yml` instead. See the
    documentation for an example.

    !end-bullet!

!end-bullets-64!

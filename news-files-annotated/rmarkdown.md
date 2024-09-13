# rmarkdown 2.29

!begin-bullets-1!

-   !begin-bullet!
    `find_external_resources()` now correctly detects knitr child
    document provided with option like `child = c("child.Rmd")` (thanks,
    @rempsyc, #2574).
    !end-bullet!

!end-bullets-1!

# rmarkdown 2.28

!begin-bullets-2!

-   !begin-bullet!
    Add classes `odd`, `even`, and `header` back to table rows for
    Pandoc \>= 3.2.1, so tables can be styled properly (thanks,
    @therealgenna, #2567).

    !end-bullet!
-   !begin-bullet!
    `beamer_presentation` support handling latex dependencies via the
    new `extra_dependencies` argument and declarations within chunks
    (e.g.,
    `knitr::asis_output("", meta = list(rmarkdown::latex_dependency("longtable")))`)
    (thanks, @cderv, @atusy, #2478).

    !end-bullet!

!end-bullets-2!

# rmarkdown 2.27

!begin-bullets-3!

-   !begin-bullet!
    Provide a global option `rmarkdown.files.suffix` to configure the
    suffix of the directory for auxiliary files (thanks,
    @certara-tzweers, #2550). By default, this suffix is `_files`, which
    can cause HTML output files to be deleted automatically on Microsoft
    OneDrive or Google Drive. If that is the case for you, you may set a
    different suffix in your `.Rprofile`, e.g.,
    `options(rmarkdown.files.suffix = "_rmdfiles")`.

    !end-bullet!
-   !begin-bullet!
    Fix a regression in 2.26 regarding image paths post-processing in
    `html_document_base()`. Now absolute paths to image in the output
    directory (`output_dir`) are correctly made relative to the output
    directory again.

    !end-bullet!

!end-bullets-3!

# rmarkdown 2.26

!begin-bullets-4!

-   !begin-bullet!
    **rmarkdown** now requires **knitr** \>= 1.43.

    !end-bullet!
-   !begin-bullet!
    Get rid of the superfluous warning in `find_pandoc()` (thanks,
    @jszhao, #2527).

    !end-bullet!
-   !begin-bullet!
    Removed the **stringr** dependency since it is used only once in the
    package and the equivalent base R code is simple enough (thanks,
    @etiennebacher, #2530).

    !end-bullet!
-   !begin-bullet!
    For the output format option `fig_crop: auto`, it will now use the
    same logic as in **knitr** to decide if cropping is possible
    (yihui/knitr#2246).

    !end-bullet!
-   !begin-bullet!
    Avoid corrupting input files by accident (thanks, @J-Moravec,
    #2534).

    !end-bullet!

!end-bullets-4!

# rmarkdown 2.25

!begin-bullets-5!

-   !begin-bullet!
    Fixed a bug that filenames beginning with `-` cause incorrect
    invocation of Pandoc (thanks, @mbaynton, #2503).

    !end-bullet!
-   !begin-bullet!
    Documented how to merge `output_format_dependency()` to the output
    format (thanks, @atusy, #2508).

    !end-bullet!
-   !begin-bullet!
    `ioslides_presentation()` now correctly works with new **shiny**
    1.7.5 (thanks, @nicolasgaraycoa, #2514, @gadenbuie, #2516).

    !end-bullet!
-   !begin-bullet!
    Added a new argument `metadata` to the `pre_knit` function in
    `output_format()` so that users will have access to the YAML
    metadata of the input document before knitting it (#2485). Please
    note that if you define `pre_knit` for a custom output format, you
    are strongly recommended to leave a `...` argument in `pre_knit`, so
    we (**rmarkdown** package authors) are free to add more arguments to
    `pre_knit` without breaking your code. If your `pre_knit` function
    does not have the `...` argument, you will get a warning.

    !end-bullet!

!end-bullets-5!

# rmarkdown 2.24

!begin-bullets-6!

-   !begin-bullet!
    Fixed `file_scope` being lost when extending output formats that
    considers the `file_scope` using `output_format()`. Merge behavior
    is to apply overlay `file_scope` function onto the result of
    `base_format`'s `file_scope` function. This implies that
    `file_scope` gains second argument which receives the returned
    values of the base `file_scope` (thanks, @atusy, #2488).

    !end-bullet!
-   !begin-bullet!
    Added `output_format_dependency()` which allows extending output
    format from within chunks (thanks, @atusy, #2462)

    !end-bullet!
-   !begin-bullet!
    Fix an issue with shiny prerendered document where dependencies
    context were written twice leasing to parsing error (thanks,
    @gadenbuie, rstudio/learn#597, #2500).

    !end-bullet!

!end-bullets-6!

# rmarkdown 2.23

!begin-bullets-7!

-   !begin-bullet!
    `find_external_resources()` works with formats defining there own
    `theme` argument, like `cleanrmd::html_document_clean()`, not
    related to **bslib** supports (thanks, @gadenbuie, #2493,
    r-lib/pkgdown#2319).

    !end-bullet!
-   !begin-bullet!
    Fixed version number comparison problems as requested by CRAN.

    !end-bullet!

!end-bullets-7!

# rmarkdown 2.22

!begin-bullets-8!

-   !begin-bullet!
    Using `css` with `.scss` and `.sass` file, or with a bslib theme,
    now works as expected with a shiny runtime (thanks, @cpsievert,
    #2443, #2447).

    !end-bullet!
-   !begin-bullet!
    Add a `pandoc_metadata_file_arg()` function to match Pandoc's CLI
    flag `--metadata-file`.

    !end-bullet!
-   !begin-bullet!
    Mentions that **webshot** or **webshot2** is required to take
    screenshot of HTML widget. When not installed, an error message
    mentioning `always_allow_html: true` solution will be shown, but
    setting this is not the solution (quarto-dev/quarto-cli#4225).

    !end-bullet!
-   !begin-bullet!
    `html_dependency_jqueryui()` updated to 1.13.2 from version bundled
    in shiny (thanks, @daschnerm, #2477).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with YAML header ending with a commented line
    containing incomplete yaml (thanks, @keithnewman, #2483).

    !end-bullet!
-   !begin-bullet!
    When code folding is enabled in `html_document()`, the text on the
    button to show the content has been changed from "Code" to "Show",
    because the content to show is not necessarily code, e.g.,
    yihui/knitr#2227.

    !end-bullet!

!end-bullets-8!

# rmarkdown 2.21

!begin-bullets-9!

-   !begin-bullet!
    Now HTML output formats use the Font Awesome HTML dependency from
    the **fontawesome** package instead of shipping an outdated version
    of Font Awesome in **rmarkdown** (thanks, @rich-iannone, #2451).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug caused by a change in the `is_blank()` function in
    **xfun** 0.38 (thanks, @andreahgsin, #2469).

    !end-bullet!

!end-bullets-9!

# rmarkdown 2.20

!begin-bullets-10!

-   !begin-bullet!
    The defunct `tufte_handout()` has been removed from **rmarkdown**.
    Please use `tufte::tufte_handout()` instead.

    !end-bullet!
-   !begin-bullet!
    If an input path to `rmarkdown::render()` is a symbolic link, it is
    no longer resolved to its real path (thanks, @SamDM @jmw86069,
    #1508).

    !end-bullet!
-   !begin-bullet!
    Make sure to avoid creating invalid paths when copying resources
    (thanks, @mnazarov, #2429).

    !end-bullet!
-   !begin-bullet!
    Make sure `logo` is properly embedded in `ioslides_presentation()`
    when `self_contained = TRUE` (thanks, @mnazarov, #2428).

    !end-bullet!

!end-bullets-10!

# rmarkdown 2.19

!begin-bullets-11!

-   !begin-bullet!
    No longer use `xfun::isFALSE()` internally.
    !end-bullet!

!end-bullets-11!

# rmarkdown 2.18

!begin-bullets-12!

-   !begin-bullet!
    `rmarkdown::render()` argument `output_file` is now used for all
    output formats, if there is only one name for multiple output
    formats (thanks, @MaelAstruc, #2421).

    !end-bullet!
-   !begin-bullet!
    Custom output formats can provide a custom function to convert
    Markdown input to the desired output format now. To do so, define
    the output format via
    `output_format(pandoc = pandoc_options(convert_fun = function(...) {}))`.
    The default converting function is `pandoc_convert()` in this
    package. See the help page `?pandoc_options` for more details.

    !end-bullet!

!end-bullets-12!

# rmarkdown 2.17

!begin-bullets-13!

-   !begin-bullet!
    `rmarkdown::render_site()` will now also look for `index.rmd` in
    addition to `index.Rmd` for custom site generator in YAML with
    `site:` (thanks, @kamalsacranie, #2409).

    !end-bullet!
-   !begin-bullet!
    Icons in tabset dropdown are now correctly shown, including when
    `self_contained: false` (thanks, @cpsievert, #1697).

    !end-bullet!

!end-bullets-13!

# rmarkdown 2.16

!begin-bullets-14!

-   !begin-bullet!
    Pandoc 2.19 has deprecated the argument `--self-contained`. If you
    have installed Pandoc 2.19+, **rmarkdown** will use
    `--embed-resources --standalone` as recommended by Pandoc for output
    formats that use the option `self_contained = TRUE` (#2382).

    !end-bullet!
-   !begin-bullet!
    `pandoc_version()` returns a version number of the form
    `X.Y.Z.YYYY.MM.DD` for the nightly build of Pandoc now, where
    `YYYY.MM.DD` is its build date. Previously it would return
    `X.Y.Z.9999` to indicate the nightly version.

    !end-bullet!

!end-bullets-14!

# rmarkdown 2.15

!begin-bullets-15!

-   !begin-bullet!
    Fix navbar issue with website when using Boostrap 5 with **bslib**
    (thanks, @guasi, #2379, @cpsievert, #2384).

    !end-bullet!
-   !begin-bullet!
    The `tufte_handout()` function inside **rmarkdown** is defunct now.
    Its codebase was moved to the **tufte** package in 2016, and this
    function was marked as deprecated in 2021. Please use
    `tufte::tufte_handout()` instead of `rmarkdown::tufte_handout()`.
    The latter will be removed eventually from this package.

    !end-bullet!
-   !begin-bullet!
    `github_document()` gains `math_method = "default"` and defaults to
    it. No special processing will be done to inline maths in `$` and
    block maths in `$$` as now Github supports it and will render using
    Mathjax (thanks, @kylebutts, #2361).

    !end-bullet!

!end-bullets-15!

# rmarkdown 2.14

!begin-bullets-16!

-   !begin-bullet!
    Improved highlighting theme `arrow` regarding accessibility.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue with `site_generator()` detection of a site project
    (thanks, @bhattmaulik, #2344).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue with Shiny prerendered documents and Pandoc not
    correctly rendering last Markdown paragraph in HTML (thanks,
    @gadenbuie, #2336).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that `site_generator()` fails to detect the root dir of
    the site and causes infinite recursion (thanks, @fisher-j, #2339).

    !end-bullet!
-   !begin-bullet!
    `html_vignette()` gains `code_folding` argument (thanks, @atusy,
    #2340).

    !end-bullet!
-   !begin-bullet!
    `html_document()` can opt-out `code_folding = "show"` or `"hide"`
    for individual code blocks by adding the `fold-none` class to the
    code blocks (thanks, @atusy, #2348).

    !end-bullet!
-   !begin-bullet!
    When using a development version of Pandoc, a `.9999` suffix is
    appended to version number so that `pandoc_available()` can
    correctly compared version with last release.

    !end-bullet!

!end-bullets-16!

# rmarkdown 2.13

!begin-bullets-17!

-   !begin-bullet!
    Fix an issue with older R version and vignette building (#2324).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with older R version and `preserve_yaml = TRUE` in
    `md_document()` (#2325).

    !end-bullet!
-   !begin-bullet!
    Long title in `ioslides_presentation` failed to work with Pandoc
    2.17.x (thanks, @Am386DX-40, #2327).

    !end-bullet!

!end-bullets-17!

# rmarkdown 2.12

!begin-bullets-18!

-   !begin-bullet!
    `html_document()` and `html_document_base()` gains the `math_method`
    argument to support all the math rendering engines from Pandoc:
    "mathjax", "katex", "mathml", "webtex", and "gladtex". For backward
    compatibility, the `mathjax` argument still works and will take
    precedence over `math_method`, but we recommend using the new
    `math_method` argument instead of the `mathjax` argument, and the
    latter could be deprecated in the future.

    You can specify a math engine via `math_method` as an engine name,
    e.g.,

    !begin-codeblock!
    ``` yaml
    output:
      html_document:
        math_method: katex
    ```

    !end-codeblock!
    or provide both a name and a URL (for `mathjax`, `katex` and
    `webtex`):

    !begin-codeblock!
    ``` yaml
    output:
      html_document:
        math_method: 
          engine: mathjax
          url: https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml-full.js
    ```

    !end-codeblock!
    For `math_method = "katex"`, KaTeX CDN will be inserted in version
    0.15.2 by default (from jsdelivr). A custom URL toward another CDN
    can be passed as `url`.

    For `math_method = "webtex"`, it will default to inset SVG using
    `https://latex.codecogs.com/svg.image?`. Use
    `https://latex.codecogs.com/png.image?` for PNG. See
    https://latex.codecogs.com for supported options (dpi, background,
    ...).

    Most HTML output format using `html_document()` or
    `html_document_base()` as based format should benefit from this new
    feature. See `?rmarkdown::html_document()` for details (thanks,
    @atusy, #1940).

    !end-bullet!
-   !begin-bullet!
    `github_document()` also gains the `math_method` argument set to
    `"webtex"` by default so that LaTeX equations can be rendered in the
    Github Markdown document as images. Previously, LaTeX equations were
    not rendered. Set `math_method = NULL` to deactivate.

    !end-bullet!
-   !begin-bullet!
    Added support for **katex** R package as a math engine with
    `math_method = "r-katex"` in HTML documents. This method offers
    server-side rendering of all the equations, which means no JS
    processing is needed in the browser as with usual KaTeX or MathJaX
    methods. (thanks, @jeroen, #2304).

    !end-bullet!
-   !begin-bullet!
    `anchor_sections` can now be easily customized using `style` or
    `depth` element for `anchor_sections`. For example:

    !begin-codeblock!
    ``` yaml
    output:
      html_document:
        anchor_sections:
          style: symbol # use symbol style ("hash", "symbol", "icon")
          depth: 2 # max depth to apply anchor on (default to max which is 6)
    ```

    !end-codeblock!
    Customizing using a CSS rule is still possible. Detailed explanation
    and examples have been added to the help page `?html_document`.

    !end-bullet!
-   !begin-bullet!
    Improved the highlighting mechanism in formats that supports
    `highlight` argument:

    !begin-bullets-19!
    -   !begin-bullet!
        It is now possible to pass a custom theme file `.theme` in
        `highlight` argument for customizing the syntax highlighting
        style used by Pandoc.
        !end-bullet!
    -   !begin-bullet!
        In addition to Pandoc's own supported themes, two more themes
        are bundled in the package: `highlight: arrow` a theme optimized
        for accessibility and color contrast (thanks to @apreshill), and
        `highlight: rstudio` to mimic the RStudio editor theme.
        !end-bullet!
    -   !begin-bullet!
        For HTML output only, added optional downlit support in
        `html_document()` for R syntax highlighting and autolinking. Use
        `highlight_downlit = TRUE` to activate it (same argument as in
        **distill**). This features require the **downlit** package.
        !end-bullet!

    !end-bullets-19!
    !end-bullet!
-   !begin-bullet!
    Templates for `html_document()` and `ioslides_presentation()` gained
    a new CSS rule to display single line `<summary>` content inline
    (rstudio/rstudio#10589).

    !end-bullet!
-   !begin-bullet!
    `md_document()` gained a new `standalone` argument, which is `FALSE`
    by default unless `toc = TRUE`. This allows to output authors, date
    and other metadata per the Pandoc's template. Due to limitation in
    how Pandoc is handling metadata blocks in its extensions
    `yaml_metadata_block`, `preserve_yaml = TRUE` now deactivate any
    extension to let **rmarkdown** directly handle the keeping of YAML
    block - this means it does not set `standalone = TRUE` by default.
    Meanwhile, `github_document()` gained the `preserve_yaml` argument
    (thanks, @florisvdh, #2297).

    !end-bullet!
-   !begin-bullet!
    Added `available_templates()` to list all the templates from a
    specific package that can be used with `rmarkdown::draft()`.

    !end-bullet!
-   !begin-bullet!
    Following support in Pandoc 2.15, `powerpoint_presentation()` gained
    a `incremental` argument as other slide formats. As a reminder,
    setting `incremental = TRUE` will make lists to display
    incrementally. See more in Pandoc's MANUAL.

    !end-bullet!
-   !begin-bullet!
    Added support for Pandoc's `dir` variable in HTML templates. This is
    the second Language Variables after `lang`.

    !end-bullet!
-   !begin-bullet!
    Added a global option `rmarkdown.html_dependency.header_attr`
    (`TRUE` by default). It can be set to `FALSE` to opt-out the HTML
    dependency `html_dependency_header_attrs()` in documents based on
    `html_document_base()` (thanks, @salim-b rstudio/bookdown#865,
    @maelle r-lib/downlit#1538).

    !end-bullet!
-   !begin-bullet!
    Rendering using `runtime: shiny_prerendered` or `runtime: shinyrmd`
    now natively supports custom templates. Previously since 2.8,
    developers had to add a special comment, `<!-- HEAD_CONTENT -->`,
    conditionally to `shiny-prerendered` variable. (See also NEWS from
    2.8 for the previous behavior). The new behavior inserts required
    special comment `<!-- HEAD_CONTENT -->` as a last element of
    `$header-includes$`. If templates rely on the old behavior and
    require some contents between `$header-includes$` and
    `<!-- HEAD_CONTENT -->`, consider including them with
    `$header-includes$` (thanks, @atusy, @gadenbuie #2249).

    !end-bullet!
-   !begin-bullet!
    A shiny prerendered document with only a empty server context does
    not error anymore. Document will be rendered with a empty server
    function and `server.R` file will be ignored. To use `server.R`, no
    server context should be present in the Rmd document (thanks,
    @jcheng5, #2305).

    !end-bullet!
-   !begin-bullet!
    Fixed a regression with rendering `shiny_prerendered` document
    (thanks, @aronatkins, @gadenbuie, #2218).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue in `beamer_presentation()` where `header-includes`
    would be overwritten by `includes = list(in_header =)` (thanks,
    @samcarter, #2294). Same fix as for `pdf_document()` (#1359).

    !end-bullet!
-   !begin-bullet!
    Fixed broken links to section headers when `number_sections = TRUE`
    is specified in `md_document` and `github_document` (thanks, @atusy,
    #2093).

    !end-bullet!
-   !begin-bullet!
    `draft()` now works with `devtools::load_all()` and **testthat**
    when used in other packages.

    !end-bullet!
-   !begin-bullet!
    Lua Filters: Added two more functions in `shared.lua` for other
    package to use:

    !begin-bullets-20!
    -   !begin-bullet!
        Added `type()` function backward compatible following Pandoc
        2.17 changes.
        !end-bullet!
    -   !begin-bullet!
        Added `print_debug()` for easier logging during debug.
        !end-bullet!

    !end-bullets-20!
    !end-bullet!
-   !begin-bullet!
    Add opt-in `tabset` option to the `html_vignette`. In contrast to
    the similar feature from `html_document`, this feature supports
    navigation from ToC and URL. Any custom formats can introduce this
    feature by using an exported function `html_dependency_tabset()`
    (thanks, @atusy, #2313).

    !end-bullet!

!end-bullets-18!

# rmarkdown 2.11

!begin-bullets-21!

-   !begin-bullet!
    Relative paths in parent directories in the `css` argument of
    `html_document()` were incorrectly normalized to absolute paths by
    #2095 in v2.8. Now relative paths in parent directories will no
    longer be converted to absolute paths (thanks, @daijiang,
    yihui/xaringan#331).

    !end-bullet!
-   !begin-bullet!
    It is possible to specify the version of jQuery via a global option
    now, e.g., `options(rmarkdown.jquery.version = 2)` (note that the
    default major version is `3`). This is mainly for advanced users and
    developers to test different versions of jQuery.

    !end-bullet!
-   !begin-bullet!
    `pandoc_citeproc_convert()` now handles correctly bib file
    containing specific UTF-8 characters on non default UTF-8 systems
    like Windows (thanks, @mitchelloharawild, #2195).

    !end-bullet!
-   !begin-bullet!
    Shiny prerendered documents are now pre-rendered in a child
    environment to avoid allowing the results of static code chunks to
    exist in the Shiny app environment (@gadenbuie, #2203).

    !end-bullet!
-   !begin-bullet!
    The previously unexported function `convert_ipynb()` is exported now
    (thanks, @acircleda).

    !end-bullet!

!end-bullets-21!

# rmarkdown 2.10

!begin-bullets-22!

-   !begin-bullet!
    `md_document()` will now handle correctly `preserve_yaml` value for
    all variants and all pandoc versions (#2190).

    !begin-bullets-23!
    -   !begin-bullet!
        with `preserve_yaml = TRUE`, markdown output will keep the YAML
        metadata block from the Rmd file.
        !end-bullet!
    -   !begin-bullet!
        with `preserve_yaml = FALSE`, markdown output will have no YAML
        metadata block.
        !end-bullet!

    !end-bullets-23!
    This fixes a breaking change in Pandoc 2.13 regarding `gfm`,
    `commonmark` and `commonmark_x` which now supports
    `yaml_metadata_block` by default (#2118).

    !end-bullet!
-   !begin-bullet!
    New supported syntax for Shiny prerendered documents: you can now
    use `server: shiny` or `server: type: shiny`.

    !end-bullet!
-   !begin-bullet!
    Ability to inject additional functions into Shiny prerendered server
    scope using the "server-extras" context.

    !end-bullet!
-   !begin-bullet!
    Fixed the syntax highlighting issue with R's pipe operator `|>`
    (thanks, @edzer, rstudio/bookdown#1157).

    !end-bullet!

!end-bullets-22!

# rmarkdown 2.9

!begin-bullets-24!

-   !begin-bullet!
    Fix a regression in version 2.8 when a url is used in `css` argument
    (thanks, @vnijs, #2163).

    !end-bullet!
-   !begin-bullet!
    All HTML dependencies are now correctly supported, included those
    with only an `href` component but not `file` component in their
    `src` attribute. Previously, **rmarkdown** would throw the error
    `'path for html_dependency not provided'` when rendering documents
    containing HTML dependencies with `href` components (thanks,
    @crazycapivara, @matthewstrasiotto, #1805, #1948, #2151).

    !end-bullet!
-   !begin-bullet!
    Fix an error thrown with output format using a `file_scope` function
    (like in **bookdown**) (thanks, @rfaelens, #2149).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with `copy_ressource = TRUE` in `html_document_base`
    where very long HTML documents were truncated during post processing
    (thanks, @oliviermeslin, #2145).

    !end-bullet!
-   !begin-bullet!
    When `run()`-ing a `runtime: shiny` document, an extra temp folder
    will be used in the output path. With the extra temp random folder
    in the path, predictable output file names may be used. (#2137)

    !end-bullet!
-   !begin-bullet!
    When `run()`-ing a `runtime: shiny` document with a `{bslib}` theme,
    the global theme value wasn't being restored properly. (#2160)

    !end-bullet!
-   !begin-bullet!
    Floating ToC in `html_document` can now hide headings with
    unnumbered and unlisted classes (thanks, @atusy, #1993).

    !end-bullet!
-   !begin-bullet!
    Fix prefix handling in R Markdown website's navbar for Fontawesome
    V5 and compatibility with V4. For icon only available in V5, the
    full prefix + name should be use, especially with new `fab` prefix
    (e.g. `fab fa-r-project`). If no prefix is used (e.g `fa-home`
    instead of `fas fa-home`), the `fa` prefix will be added for V4
    compatibility as it has been deprecated in V5. We advice to use the
    full prefix + name for icons following Fontawesome documentation.
    (#1994)

    !end-bullet!
-   !begin-bullet!
    `rmarkdown::site_generator()` can hang session waiting for input
    when the `site` field is not found in the YAML frontmatter of
    `index.Rmd` (thanks, @kevinushey @mirh, #2043).

    !end-bullet!

!end-bullets-24!

# rmarkdown 2.8

!begin-bullets-25!

-   !begin-bullet!
    Fix a issue with Pandoc 2.5 and `latex-div.lua` - documents can now
    be rendered as expected without error (thanks, @davidwales, #2121).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with styling and code folding button behavior when
    default is `code-folding: show`. The Button can now be correctly
    style according to state as `aria-expanded` attributes is correctly
    updated. Also, new classes has been added on the button to allow
    styling during transition: `btn-collapsing` and `btn-expanding` are
    respectively applied during transition Show to Hide and Hide to
    Show. (This follow Bootstrap behavior for the collapsible block)
    (thanks, @steveharoz, #2085).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with `citation_package` having no effect when using
    `.md` file as input to `render()` with latex and PDF output formats
    (thanks, @andrewheiss, #2113).

    !end-bullet!
-   !begin-bullet!
    A new internal option `rmarkdown.knit.ext` has been added to control
    the extension of the intermediary knit output during a rendering. It
    defaults to `md` to produce `*.knit.md`. Only useful for very
    advanced usage (#2098).

    !end-bullet!
-   !begin-bullet!
    `render()` won't produce any `*.utf8.md` intermediary file anymore.
    This was a leftover from previous versions of **rmarkdown**. Since
    **knitr** 1.24 and **rmarkdown** 2.0, only UTF-8 input files are
    allowed. (#2098).

    !end-bullet!
-   !begin-bullet!
    Fix an `Invalid cross-device link` error when `tempdir()` is used
    for `intermediates_dir` in `render()` (thanks, @gorgitko, #2096).

    !end-bullet!
-   !begin-bullet!
    Fix a regression in HTML default template with floating toc
    incorrectly placed on small size window (thanks, @grimbough, #2071)

    !end-bullet!
-   !begin-bullet!
    Provided a `runtime: shiny` fix for output formats that pass a
    modified `bslib::bs_theme()` object to `html_document_base()`'s
    `theme` (thanks, @cpsievert, #2049).

    !end-bullet!
-   !begin-bullet!
    Rendering using `runtime: shiny_prerendered` or `runtime: shinyrmd`
    will now produce valid HTML by not inserting anymore the full
    document as body in the resulting shiny apps (thanks, @dakep,
    #1912). Header content usually containing html dependencies will be
    inserted in the HTML document at the end of the head before
    `</head>`, unless the rendered HTML contains `<!-- HEAD_CONTENT -->`
    special comment (see `htmltools::renderDocument()`). A new Pandoc
    variable is set in for shiny prerendered document to allow
    conditional insertion of such content in the the HTML template using
    `$if(shiny-prerendered)$`. This has been done in all HTML template
    in this package. Users of custom template should make this change to
    provide support for this runtime. See **rmarkdown** default template
    (`default.html`) for an example (#2064).

    !end-bullet!
-   !begin-bullet!
    Added `tectonic` as a supported LaTeX engine for generating PDF
    output (thanks, @dpryan79, #2078). You can specify to use this by
    adding `engine: "tectonic"` to your output format in YAML, such as
    `pdf_document`.

    !end-bullet!
-   !begin-bullet!
    When no `output_format` is provided in any way but an `output_file`
    is provided in `render()`, the default format will be determined
    based on the extension: `"pdf_document"` for `.pdf`, or
    `"word_document"` for `.docx`. Otherwise, it will be
    `"html_document"` as previous version (thanks, @pearsonca, #1569).

    !end-bullet!
-   !begin-bullet!
    Added a new global option `rmarkdown.render.message`. When set
    `FALSE`, `render()` will not output the message starting by
    `Output created:` allowing RStudio IDE to open a preview of the
    document. This is useful for package developers that would need to
    emit there own output message for there custom format. See
    `?render_site` for more info on this special message (#2092).

    !end-bullet!
-   !begin-bullet!
    Internal changes regarding Lua filters. They have now an explicit
    Pandoc version minimal requirement: A filter will be skipped with a
    warning printed by the Lua filter if this requirement is not met.
    For now, all filters work for Pandoc 2.1 and above (thanks, @atusy,
    #2088). There is also now a new mechanism to have a share Lua filter
    script loadable by other Lua files: `render()` will set the
    `RMARKDOWN_LUA_SHARED` env var to the path of Lua filter
    `shared.lua` so that other filters can access functions defined in
    it using `dofile(os.getenv 'RMARKDOWN_LUA_SHARED')`. This is for
    internal usage only to avoid duplication (thanks, @tarleb, #2103).

    !end-bullet!
-   !begin-bullet!
    `html_document_base` gains a `css` argument, to which
    `html_document`'s `css` argument is now passed. This also fix an
    issue when `.sass` or `.scss` files are used with this `css`
    argument when `self_contained: FALSE`. Moreover, **sass** caching
    mechanism can now be used when passing `.sass` or `.scss` files to
    the `css` argument (thanks, @cpsievert, #2095).

    !end-bullet!
-   !begin-bullet!
    The `fig_crop` option of PDF document formats (such as
    `pdf_document` and `beamer_presentation`) supports the value
    `"auto"` now, which means `fig_crop = TRUE` when figure cropping
    tools `pdfcrop` and `ghostscript` are available.

    !end-bullet!
-   !begin-bullet!
    The default value of the `fig_crop` option of PDF output formats has
    been changed from `TRUE` to `"auto"` (#2077).

    !end-bullet!
-   !begin-bullet!
    `rmarkdown::tufte_handout` has been deprecated and will be removed
    in the future from this package. It has been moved to the **tufte**
    package since **rmarkdown** 0.9.5 (released on 2016-02-22). Please
    use `tufte::tufte_handout` instead.

    !end-bullet!

!end-bullets-25!

# rmarkdown 2.7

!begin-bullets-26!

-   !begin-bullet!
    `html_document` (and `html_document_base`)'s `theme` parameter now
    understands `bslib::bs_theme()` objects/arguments, meaning that one
    may opt-into Bootstrap 4 and more easily create custom themes. For
    examples, see https://github.com/rstudio/rmarkdown/pull/1706, and
    for context, see https://rstudio.github.io/bslib/ (thanks,
    @cpsievert, #1706).

    !end-bullet!
-   !begin-bullet!
    Files with `.scss`/`.sass` extension (i.e., Sass files) provided to
    `html_document`'s `css` parameter are now compiled to CSS using the
    `{sass}` package. Also, if `theme` is a `{bslib}` object, these Sass
    files may utilize Sass code inside the `theme` (thanks, @cpsievert,
    #1706).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with line numbering in code chunks when `.numberlines`
    with Pandoc's highlighting (thanks, @aosavi, #1876).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with shiny runtime and `global.R` (thanks,
    @liaojiahui-r, rstudio/flexdashboard#298).

    !end-bullet!
-   !begin-bullet!
    Accept `latex="{options}"`, `latex=1`, or `latex=true` for Latex
    Divs.

    !end-bullet!
-   !begin-bullet!
    Add `output_format_filter` function to `default_site_generator()`.
    Enables custom site generators to customize or even entirely replace
    the output format right before rendering of each page.

    !end-bullet!
-   !begin-bullet!
    Automatically exclude **renv** directory for `render_site()`
    (thanks, @jmbuhr, #1996)

    !end-bullet!
-   !begin-bullet!
    Do not force `options(htmltools.preserve.raw = TRUE)` when this
    option has been set, otherwise it is impossible for other packages
    to turn this option off, e.g., yihui/xaringan#293.

    !end-bullet!
-   !begin-bullet!
    `knitr_options_pdf()` will now throw a warning when
    `fig_crop = TRUE` but is disabled because required tools `pdfcrop`
    and/or `ghostscript` are missing (thanks, @netique, #2016).

    !end-bullet!
-   !begin-bullet!
    Eliminated the unnecessary padding in code blocks in the
    `html_document` output with Bootstrap 4 themes (thanks, @atusy,
    #2019).

    !end-bullet!
-   !begin-bullet!
    `github_document()` will produce a working TOC even if some headers
    start with number (#2039).

    !end-bullet!
-   !begin-bullet!
    Fix an issue with `knit_print.data.frame`. The `...` arguments are
    no more passed to `print()` to avoid passing `knit_print()`
    arguments `options` and `encoding` to custom `print()` methods
    (#2047).

    !end-bullet!

!end-bullets-26!

# rmarkdown 2.6

!begin-bullets-27!

-   !begin-bullet!
    Encoding is correctly handled now in `html_vignette` when checking
    for identical title and vignette index entry (thanks, @py-b, #1978).

    !end-bullet!
-   !begin-bullet!
    `clean_site()` now default to `preview = TRUE` and will no more
    remove files without notice. This change will affect the "Clean All"
    button in the "Build" pane for website project.
    `clean_site(preview = FALSE)` must be run to effectively remove
    files (#1973).

    !end-bullet!
-   !begin-bullet!
    The intermediate `.tex` file is now correctly deleted if
    `keep_tex = FALSE` when the R Markdown document is not rendered from
    the working directory (thanks, @vqv, #1308).

    !end-bullet!
-   !begin-bullet!
    Fix a bug causing certain resources files to be deleted as
    intermediate files when `intermediates_dir` is the same as the input
    (thanks, @bellma-lilly, #1248).

    !end-bullet!
-   !begin-bullet!
    Fix issues with `anchor_sections = TRUE` and **learnr** (thanks,
    @gadenbuie, #1938).

    !end-bullet!
-   !begin-bullet!
    Enable use of `server.R` and `global.R` alongside
    `runtime: shinyrmd` documents.

    !end-bullet!
-   !begin-bullet!
    `pkg_file_lua()` now works with `devtools::load_all()` and
    **testthat** when used in other packages.

    !end-bullet!
-   !begin-bullet!
    Fix `pandoc_convert(citeproc = TRUE)` not supressing the `--natbib`
    or `--biblatex` options (thanks, @atusy, #1932).

    !end-bullet!
-   !begin-bullet!
    `pandoc-citeproc` is now activated if a `bibliography` field is
    defined in another YAML block instead of the first YAML block
    (thanks, @bwiernik, #1364).

    !end-bullet!
-   !begin-bullet!
    Specify that `htmltools::htmlPreserve()` should use the pandoc raw
    attribute rather than preservation tokens when pandoc \>= v2.0. Note
    that this option will have the intended effect only for versions of
    htmltools \>= 0.5.0.9003.

    !end-bullet!
-   !begin-bullet!
    `anchor_sections` in `html_documents()` now defaults to `FALSE`. It
    was introduced in previous version with a default to `TRUE`, but it
    is reverted now after hearing feedbacks from the community (thank
    you!). The `#` is still used as the character for the anchor but you
    can easily change that using CSS rules. Examples have been added to
    the help page `?html_document`.

    !end-bullet!
-   !begin-bullet!
    Using Pandoc's default for `--email-obfuscation` now. Previously, it
    was set to `none` explicitly, which is the default for Pandoc
    1.17.2+ anyway. Only users with a Pandoc version before 1.17.2 may
    see a change in the content of the html source file produced if the
    document contains email addresses. This change allows to pass the
    Pandoc's command line flag if you want to set it to another value
    (thanks,@seankross, #1969).

    !begin-codeblock!
    ``` yaml
    output:
      html_document: 
        pandoc_args: ["--email-obfuscation", "javascript"]
    ```

    !end-codeblock!
    See Pandoc's manual for the meaning of this option.

    !end-bullet!
-   !begin-bullet!
    Fix Fontawesome 5 icons in navbar by correctly handling new prefix
    as `fa` has been deprecated in favor of `fas` or `fab` (#1967)

    !end-bullet!

!end-bullets-27!

# rmarkdown 2.5

!begin-bullets-28!

-   !begin-bullet!
    Tables without header rows (wich can be possible in Pandoc's simple
    table) are now formatted correctly when using `html_document()`
    format (thanks, @fkohrt, #1893).

    !end-bullet!
-   !begin-bullet!
    `html_document()` gains the `anchor_sections` argument, which is
    `TRUE` by default, so that readers can get links to section headers
    easily---when you mouse over a section header, you will see a hash
    symbol `#` at the end of the header, which contains the anchor link
    to this header. You can click on this link and get the URL in the
    addres bar of your web browser, or right-click on it and copy the
    URL from the context menu. The hash symbol is defined by the CSS
    rule `a.anchor-section::before {content: '#';}`. You can customize
    it by overriding this rule (e.g., via the `css` argument of
    `html_document`) and use any other symbols or icons, e.g.,
    `content: "\02AD8;"` (thanks, @atusy, #1884).

    !end-bullet!
-   !begin-bullet!
    `pkg_file_lua()` should have thrown an error if the expected Lua
    file does not exist.

    !end-bullet!
-   !begin-bullet!
    Provide `files_dir` and `intermediates_dir` as attributes on return
    from `render()` when `run_pandoc = FALSE`.

    !end-bullet!
-   !begin-bullet!
    Supports new Pandoc 2.11 `--citeproc` flags usage instead of
    `pandoc-citeproc` external filter. `pandoc_convert()` and
    `pandoc_citeproc_convert()` will now use the correct flags according
    to the Pandoc version used. The logic is exported in
    `pandoc_citeproc_args()`. See Pandoc release note for more
    information about the new `citeproc` processing (#1916).

    !end-bullet!
-   !begin-bullet!
    Fixed the code highlighting when code block is hidden. Previous
    version introduced a regression where non default code highlighting
    was still shown when `code_folding` is activated and code block is
    hidden (thanks, @matthewcarlucci, #1921).

    !end-bullet!
-   !begin-bullet!
    The minimal required version for the **xfun** package (v0.15) has
    been specified for R Markdown Notebooks to work properly (thanks,
    @jmcphers, #1923).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in `convert_ipynb()` when the language is not specified
    in the `.ipynb` file (thanks, @acca3003, #1925).

    !end-bullet!
-   !begin-bullet!
    Introduce `runtime: shinyrmd` as a more user friendly alias for
    `runtime: shiny_prerendered`.

    !end-bullet!

!end-bullets-28!

# rmarkdown 2.4

!begin-bullets-29!

-   !begin-bullet!
    Lua filters handling has been improved internally with some
    user-facing changes (#1899):

    !begin-bullets-30!
    -   !begin-bullet!
        New exported function `pandoc_lua_filter_args()` to return the
        Pandoc command-line argument to add a Lua filter.
        !end-bullet!
    -   !begin-bullet!
        New argument `lua_filters` in `pandoc_options()` to pass the Lua
        filter paths to use with a format. This allow output format
        authors to add filters for a custom format using the `pandoc`
        argument of `output_format()` and to get filters from a format
        using `fmt$pandoc$lua_filters`.
        !end-bullet!
    -   !begin-bullet!
        The Lua filters of an output format are now passed to Pandoc in
        `render()`. By default, they are passed to Pandoc before any
        other format-defined or user-defined Pandoc arguments (usually
        via the `pandoc_args` option of an output format). This ensures
        that filters of an output format are executed first. To change
        the default, you need to deal with it in a custom format (i.e.,
        modify the elements in `fmt$pandoc$lua_filters`, such as
        reordering them).
        !end-bullet!
    -   !begin-bullet!
        New exported function `pkg_file_lua()` to get the full system
        path of a Lua filter included in a package source within the
        `inst/rmarkdown/lua` folder (thanks, @atusy, #1903).
        !end-bullet!

    !end-bullets-30!
    !end-bullet!
-   !begin-bullet!
    Fixed the path separators for the `css` parameter in YAML
    frontmatter for HTML output files under Windows. Previously, forward
    slashes in `css` paths were converted to backslashes (thanks,
    @jonathan-g, #1862).

    !end-bullet!
-   !begin-bullet!
    Since **rmarkdown** 1.16, Pandoc's fenced `Div`'s are converted to
    LaTeX environments when the output format is LaTeX, e.g.,
    `::: {.center data-latex=""}` is converted to `\begin{center}`. The
    attribute `data-latex` of the `Div` was mandatory, even if it is
    empty. In **rmarkdown** 2.2, we silently drop this requirement,
    which means `::: {.center}` is converted to `\begin{center}`. This
    turns out to be a bad idea, because users have no control over which
    Div's to be converted to LaTeX environments. Previously, they could
    opt-in by the `data-latex` attribute, but with **rmarkdown** 2.3,
    all Div's are converted to LaTeX environments unconditionally.
    What's more, this change led to bugs like
    https://stackoverflow.com/q/62340425/559676 and
    https://github.com/rstudio/bookdown/issues/883. Therefore the
    `data-latex` attribute became mandatory again in this version. If
    the LaTeX environment does not need arguments, you may use
    `data-latex=""`.

    !end-bullet!
-   !begin-bullet!
    The two Lua fitlers `pagebreak.lua` and `latex-div.lua` (introduced
    in **rmarkdown** 1.16) are also applied to the output format
    `beamer_presentation` now (thanks, @XiangyunHuang, #1815).

    !end-bullet!
-   !begin-bullet!
    When customizing formats with the `output_format` function,
    `pre_knit`, `opts_hooks`, and `knit_hooks` can now refer to
    `rmarkdown::metadata`. Previously, `rmarkdown::metadata` returned
    `list()` in these functions (thanks, @atusy, #1855).

    !end-bullet!
-   !begin-bullet!
    `rmarkdown::find_external_resources()` now discovers external
    template files. This in turn fixes the rendering issue of
    `html_document` with the `shiny` runtime and `intermediate_dir` set
    (thanks, @atusy, @cderv, #1865).

    !end-bullet!
-   !begin-bullet!
    Added the `number_sections` argument to following formats:
    `github_document`, `ioslides_presentation`, `md_document`,
    `odt_document`, `powerpoint_presentation`, `rtf_document`,
    `slidy_presentation`, `word_document`. These are powered by a Lua
    filter and requires Pandoc \> 2.0. It will silently have no effect
    has before with previous pandoc version (thanks @atusy 1893). Pandoc
    \>= 2.10.1 adds `--number-sections` for docx format, and thus
    `word_document` prefers the native feature to the Lua filter
    (thanks, @jooyoungseo, #1869).

    !end-bullet!
-   !begin-bullet!
    For the output format `pdf_document`, the option `fig_crop` will not
    be enabled unless both the programs `pdfcrop` and `ghostscript` are
    found (thanks, @dalupus, yihui/knitr#954).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that a chunk with a class `fold-hide` hides the rest of
    the chunks even the output format setting
    `html_document(code_folding = "show")` (thanks, @atusy, #1906).

    !end-bullet!
-   !begin-bullet!
    Updated documentation for `render()` to make it clearer how options
    are set for the `output_format` parameter (thanks, @jonathan-g,
    #1907 and rstudio/bookdown#930).

    !end-bullet!
-   !begin-bullet!
    Ported some CSS styles (e.g., underlines, small caps, and
    multi-column layouts) from the latest Pandoc's HTML template into
    **rmarkdown**s HTML templates (thanks, @atusy, #1878, #1908).

    !end-bullet!

!end-bullets-29!

# rmarkdown 2.3

!begin-bullets-31!

-   !begin-bullet!
    Addressed an accessibility issue in highlighted code blocks of HTML
    output for screen reader users: screen readers no longer read out an
    unnecessary code line id values (thanks, @jooyoungseo and @atusy,
    #1833).

    !end-bullet!
-   !begin-bullet!
    Added `file_scope` option to output format definition. This enables
    handling of duplicate numeric footnote identifiers (e.g. across
    bookdown chapters) via the pandoc `--file-scope` option (#1837).

    !end-bullet!
-   !begin-bullet!
    Added the customizable `lang` attribute to `ioslides_presentation`
    output (thanks, @jooyoungseo, #1841).

    !end-bullet!
-   !begin-bullet!
    Added `publish_site()` function for "one-button" publishing of R
    Markdown websites.

    !end-bullet!
-   !begin-bullet!
    When the `df_print` option is `kable` and the output format is not
    HTML, `<div class="kable-table">` is no longer added to the
    `kable()` output, because recent versions of Pandoc will convert the
    `div` to a LaTeX environment when the output format is LaTeX
    (thanks, Laurens, https://stackoverflow.com/q/62340425/559676).

    !end-bullet!
-   !begin-bullet!
    `html_vignette()` only warns against differences in the vignette
    title and the vignette index entry for R \>= 3.6.0 (thanks, @krlmlr,
    #1832).

    !end-bullet!
-   !begin-bullet!
    `html_document()` can apply `code_folding` on any chunk engines if
    the `foldable` class is added to a source code block via the chunk
    options (`class.source` or `attr.source`). You may apply this
    feature to all the source code blocks, for example, by setting
    `knitr::opts_chunk$set(class.source = "foldable")` at the beginning
    of your document (thanks, @atusy, #1835).

    !end-bullet!

!end-bullets-31!

# rmarkdown 2.2

!begin-bullets-32!

-   !begin-bullet!
    Exported the internal function `find_pandoc()`, and also added two
    arguments, `dir` and `version`, so that users can provide a custom
    directory under which this function may find Pandoc, as well as an
    expected version of Pandoc to be found (thanks, @connorp, #1785).

    !end-bullet!
-   !begin-bullet!
    `pandoc_metadata_arg()` is a new Pandoc helper function to generate
    `--metadata` argument for Pandoc command line (thanks, @cderv,
    #1789).

    !end-bullet!
-   !begin-bullet!
    The output format `html_vignette()` now warns against differences in
    the vignette title specified in the `title` field in the YAML
    metadata and the one specified inside `\VignetteIndexEntry{}`.
    Normally they are expected to be identical (#1789).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug with encoding when rendering `html_notebook` containing
    HTML widgets (thanks, @cderv, #1799).

    !end-bullet!
-   !begin-bullet!
    TOC title can now be specified for `html_document` via the top-level
    option `toc-title` in the YAML frontmatter (thanks, @atusy, #1771).

    !end-bullet!
-   !begin-bullet!
    Floating TOC can now distinguish upper/lower-cases (thanks, @atusy,
    #1783).

    !end-bullet!
-   !begin-bullet!
    When `code_folding='show'` for the output format `html_document`,
    code blocks can be individually hidden initially by specifying the
    chunk option `class.source='fold-hide'` (thanks, @atusy, #1798).

    !end-bullet!
-   !begin-bullet!
    For LaTeX/PDF output formats `pdf_document`, `beamer_presentation`,
    and `context_document`, the argument `citation_package = 'none'` was
    deprecated, and `citation_package = 'default'` should be used
    instead if citations are to be processed by `pandoc-citeproc`
    (thanks, @njbart, rstudio/bookdown#754).

    !end-bullet!
-   !begin-bullet!
    `output_format()` can now inherit `keep_md` and `clean_supporting`
    from `base_format` when `NULL` is passed to these arguments.
    Previously, you must explicitly specify `keep_md` and/or
    `clean_supporting` as `TRUE` or `FALSE` in `output_format()` since
    they could not inherit the corresponding options of `base_format`.
    This behavior was not consisent with other arguments of
    `output_format()` (thanks, @atusy, #1823).

    !end-bullet!
-   !begin-bullet!
    The `smart` argument of most output formats has been removed,
    because Pandoc's `smart` extension is enabled by default, and
    setting `smart: false` for an output format did not really have any
    effect (which could be considered a bug, but we want to get rid of
    this option since it existed only for a historical reason for Pandoc
    1.x, and Pandoc 2.x has been released for more than two years). If
    you want to disable the `smart` extension, you can use the option
    `md_extensions: -smart` of the output format (thanks, @atusy,
    #1774).

    !end-bullet!
-   !begin-bullet!
    `pdf_document()` should not specify the `geometry` variable when the
    `documentclass` variable is passed to Pandoc (thanks, @jpcirrus,
    #1782).

    !end-bullet!
-   !begin-bullet!
    `render()` now respects the YAML metadata in the R script when
    rendering the script with Pandoc 2.8 or later (thanks, @nsoranzo
    #1740, @cderv #1741).

    !end-bullet!
-   !begin-bullet!
    For `pandoc_convert()`, when the argument `to = 'pdf'`, it will be
    changed to `'latex'` internally (thanks, @JohannesFriedrich, #1802).

    !end-bullet!
-   !begin-bullet!
    `render(run_pandoc = FALSE)` no longer cleans up the Markdown file
    (typically knitted from Rmd) (thanks, @BrianDiggs, #1812).

    !end-bullet!

!end-bullets-32!

# rmarkdown 2.1

!begin-bullets-33!

-   !begin-bullet!
    Added the returned output from `shiny::runApp()` within
    `rmarkdown::run()` (thanks, @schloerke, #1760).

    !end-bullet!
-   !begin-bullet!
    YAML header is now correctly parsed in `html_notebook`'s
    intermediate `.knit.md` file so that features like adding
    bibliography works again (thanks, @everdark, @cderv, #1747).

    !end-bullet!
-   !begin-bullet!
    `ioslides_presentation` template no longer generates an empty `<h2>`
    tag when `subtitle` is not specified in YAML (thanks, @jooyoungseo
    #1735, @cgrudz #1663).

    !end-bullet!
-   !begin-bullet!
    No longer center the `#header` element in the `html_vignette()`
    output (thanks, @EmilHvitfeldt, #1742).

    !end-bullet!
-   !begin-bullet!
    Ensure the `tempdir()` exists (via `tempdir(TRUE)`) when writing
    HTML dependencies to a temporary file, because this directory might
    be erased by accident (thanks, Kurt Hornik, and also @karawoo
    #1743).

    !end-bullet!
-   !begin-bullet!
    Added the `slide_level` argument to `slidy_presentation()`
    (https://stackoverflow.com/q/59157211/559676).

    !end-bullet!
-   !begin-bullet!
    Removed the jQuery dependency in `html_document_base()` (#1723). To
    avoid bugs like #1723, Pandoc 2.8 users have to upgrade to Pandoc
    2.9+.

    !end-bullet!
-   !begin-bullet!
    For `pdf_document`, horizontal rules generated by Pandoc (before
    v2.8) stopped working in recent versions of TeX Live, and the same
    fix as the one to https://github.com/jgm/pandoc/issues/5801 (i.e.,
    hard-code `\linethickness` to `0.5pt`) was applied in **rmarkdown**
    (thanks, @cderv, https://stackoverflow.com/a/58646915/559676).

    !end-bullet!

!end-bullets-33!

# rmarkdown 2.0

!begin-bullets-34!

-   !begin-bullet!
    For the output format `pdf_document()`, we no longer adjust the
    vertical spacing of the title area. This means there will be a
    larger spacing above the document title in PDF. If you prefers the
    old (smaller) spacing, please download
    https://github.com/rstudio/rmarkdown/blob/f6961af/inst/rmd/latex/compact-title.tex
    and include it to the preamble via the `includes` option of
    `pdf_document`. However, please note that this means you won't be
    able to have multiple authors in the `author` field of the YAML
    frontmatter, unless you use a custom LaTeX template. With the
    default LaTeX template, you will run into the error in #1716.
    Besides, the `compact-title` option in YAML is no longer supported.

    !end-bullet!
-   !begin-bullet!
    R code in the `header-includes` field in the YAML frontmatter
    stopped working in the previous version of **rmarkdown**. The code
    should be evaluated before passing to Pandoc (thanks, @mcol #1709,
    @cderv #1710).

    !end-bullet!
-   !begin-bullet!
    The `encoding` argument is no longer passed to the
    `intermediates_generator` of R Markdown output formats. The
    `intermediates_generator` function can only accept arguments
    `input_file` and `intermediates_dir` now (see
    `?rmarkdown::output_format`). This is a breaking change to
    developers. If you are an output format developer, you have to
    remove the `encoding` argument in your `intermediates_generator` if
    your output format uses this function.

    !end-bullet!
-   !begin-bullet!
    The `encoding` argument is no longer passed to the `render` element
    of the site generator (see `?rmarkdown::render_site`).

    !end-bullet!
-   !begin-bullet!
    The `encoding` argument has been removed from many of the internal
    functions in the **rmarkdown** package. Now all input files are
    assumed to be encoded in UTF-8. If you see an error message like
    "Error in `FUN(arg = ...)`: unused argument (`arg = ...`)", please
    file an issue (with a reproducible example) to
    https://github.com/rstudio/rmarkdown.

    !end-bullet!
-   !begin-bullet!
    Added a new output format `context_document()` to support ConTeXT
    output (thanks, @RLesur #1725, @jooyoungseo #1713).

    !end-bullet!
-   !begin-bullet!
    `render_site()` can render R scripts in addition to Rmd files if you
    set `autospin: true` in `_site.yml` (thanks, @zeehio, #1564).

    !end-bullet!
-   !begin-bullet!
    Added `ext` argument to `md_document()`. Its default value is ".md".
    This argument is intended to be used together with `variant`
    argument (e.g., `variant = "context"` and `ext = ".pdf"`) (thanks,
    @atusy, #1715).

    !end-bullet!
-   !begin-bullet!
    `ioslides_presentation()` stylesheet is updated for printing.
    Browsers are notified that the presentation should preferentially be
    printed in landscape orientation and without margin (thanks,
    @RLesur, #1718).

    !end-bullet!
-   !begin-bullet!
    Reverted the fix #1703 and applied an alternative fix to #1700,
    because the original fix brought a new bug #1714 (thanks,
    @pablobernabeu @cderv @everron @aronatkins).

    !end-bullet!
-   !begin-bullet!
    Tabsets don't work with Pandoc 2.8 (thanks, @mnazarov, #1723).

    !end-bullet!
-   !begin-bullet!
    The `pdf_document` format failed to work if the `header-includes`
    field in YAML is an empty list (thanks, @cderv, #1728).

    !end-bullet!

!end-bullets-34!

# rmarkdown 1.18

!begin-bullets-35!

-   !begin-bullet!
    For `pdf_document()`, now we patch Pandoc's built-in LaTeX template
    to include the document subtitle (unnecessary with pandoc 2.6
    onwards) and reduce the vertical spacing before title using
    `--include-in-header` rather than overwriting the built-in template,
    avoiding compability problems with newer versions of Pandoc (thanks,
    @adunning, #1563).

    !end-bullet!
-   !begin-bullet!
    `find_external_resources()` works now when multiple files are
    specified in the `includes` option of the output format (thanks,
    @andrie, #1677).

    !end-bullet!
-   !begin-bullet!
    `find_external_resources()` can find external resources specified in
    the output format's `reference_doc` or `reference_docx` option now
    (thanks, @jmcphers, #1696).

    !end-bullet!
-   !begin-bullet!
    `rmarkdown::run(file = NULL, dir = "foo/")` failed to run Rmd files
    under the `foo/` directory (thanks, @jenzopr, #1703).

    !end-bullet!
-   !begin-bullet!
    Reverted the fix for #1692 since it is no longer necessary
    (https://github.com/yihui/tinytex/issues/152#issuecomment-552796864).

    !end-bullet!
-   !begin-bullet!
    The `header-includes` field in the YAML metadata will no longer be
    overwritten by the command-line option `--include-in-header`
    (thanks, @crsh @mnazarov, #1359).

    !end-bullet!
-   !begin-bullet!
    Removed the `xmlns` attribute in the `<html>` tag in the default
    HTML template (thanks, @grady #1640, @spgarbet #995).

    !end-bullet!

!end-bullets-35!

# rmarkdown 1.17

!begin-bullets-36!

-   !begin-bullet!
    `html_vignette()` passes `self_contained` argument value to base
    format (thanks, @cderv, #1668).

    !end-bullet!
-   !begin-bullet!
    `find_external_resources()` works for the `html_vignette` type
    again, this fixes rendering vignettes with external resources in
    pkgdown (regression introduced in rmarkdown 1.16, #1668).

    !end-bullet!
-   !begin-bullet!
    `render(..., clean = TRUE)` may fail to clean the `*_files`
    directory when the output format is `prettydoc::html_pretty`
    (thanks, @yixuan, #1664).

    !end-bullet!
-   !begin-bullet!
    For `ioslides_presentation`, images with atributes (e.g.,
    `![](sample.png){width=80%}`) can be correctly embedded in the
    self-contained mode now (thanks, @hadley, #1687).

    !end-bullet!
-   !begin-bullet!
    Fixed the Pandoc LaTeX templates to avoid the error
    `File`grffile.sty' not found\`. This is because the LaTeX
    **grffile** is no longer available in TeX Live (thanks, @cderv
    #1691, @smmurphy #1692, @JacobD05
    https://github.com/yihui/tinytex/issues/152).

    !end-bullet!

!end-bullets-36!

# rmarkdown 1.16

!begin-bullets-37!

-   !begin-bullet!
    The `pandoc-citeproc` binary can now be found correctly on Windows.
    This fixes an issue with `pandoc_citeproc_convert()` (thanks @cderv,
    #1651).

    !end-bullet!
-   !begin-bullet!
    Added `self_contained` argument to `html_vignette` to keep
    intermediate directory if `self_contained = FALSE` (thanks, @cderv,
    #1641).

    !end-bullet!
-   !begin-bullet!
    It is now possible to add pagebreak in HTML, Word, LaTeX, and ODT
    documents using the `\newpage` or `\pagebreak` command in an Rmd
    file. This is possible thanks to the Pandoc's pagebreak Lua filter.
    See `vignette("lua-filters", package = "rmarkdown")` (thanks,
    @cderv, #1626).

    !end-bullet!
-   !begin-bullet!
    The Pandoc extension `ascii_identifiers` is no longer enabled by
    default. If you still need it, you may use the argument
    `md_extensions = "+ascii_identifiers"` in the output format
    function. However, please note that this will trigger an error in a
    future version of Pandoc.

    !end-bullet!
-   !begin-bullet!
    Output formats can be configured by arbitrary YAML files, which used
    to be restricted to `_output.yml` or `_output.yaml`. They can be
    specified via the `output_yaml` argument of `render()` or the
    `output_yaml` top-level parameter of YAML front matter, and the
    first existing one will be used. If `output_yaml` is specified both
    for `render()` and YAML front matter, then `render()` has the
    priority. If none are found, then `_output.yml` or `_output.yaml`
    will be used if they exist (thanks, @atusy, #1634).

    !end-bullet!
-   !begin-bullet!
    Added a Pandoc Lua filter to convert fenced Divs to LaTeX
    environments when the output format is `latex` or `beamer`.
    Basically a fenced Div `::: {.NAME data-latex="[OPTIONS]"}` is
    converted to `\begin{NAME}[OPTIONS] \end{NAME}` in LaTeX. The
    attribute `data-latex` must be provided, even if it is an empty
    string (meaning that the LaTeX environment does not have any
    optional arguments). For example, `::: {.verbatim data-latex=""}`
    generates a `verbatim` environment, and
    `::: {.minipage data-latex="{.5\textwidth}"}` generates
    `\begin{minipage}{.5\textwidth}`. This Lua filter was originally
    written by @RLesur at
    https://github.com/yihui/bookdown-crc/issues/1. It will allow users
    to create custom blocks that work for both HTML and LaTeX output
    (e.g., info boxes or warning boxes).

    !end-bullet!
-   !begin-bullet!
    Added `keep_html` argument to `github_document` so to save a preview
    HTML file in a working directory (thanks, @atusy, #1650).

    !end-bullet!

!end-bullets-37!

# rmarkdown 1.15

!begin-bullets-38!

-   !begin-bullet!
    Exclude `README.R?md` from files processed by `render_site()`,

    !end-bullet!
-   !begin-bullet!
    `html_document` with `code_folding: hide` supports showing
    individual source code chunks if they are assigned the `fold-show`
    class via the chunk option `class.source="fold-show"` (thanks,
    @atusy, #1602).

    !end-bullet!
-   !begin-bullet!
    The `extra_dependencies` argument only works with
    `template: default` in `pdf_document`. Now it works with any Pandoc
    LaTeX templates as long as the template uses the `header-includes`
    variable.

    !end-bullet!

!end-bullets-38!

# rmarkdown 1.14

!begin-bullets-39!

-   !begin-bullet!
    Fixed a regression in `ioslides_presentation` that background colors
    via the `data-background` attribute on slides stopped working
    (thanks, @ShKlinkenberg, #1265).

    !end-bullet!
-   !begin-bullet!
    Fixed the bug #1577 introduced in **rmarkdown** v1.12: tabsets,
    floating TOC, and code folding in the `html_document` format no
    longer work with the `shiny` runtime (thanks, @RLesur for the fix
    #1587, and @fawda123 @ColinChisholm @JasonAizkalns for the bug
    report).

    !end-bullet!
-   !begin-bullet!
    Added the `keep_md` argument to `pdf_document()` to keep the
    intermediate `.md` output file (thanks, @broomej, #1001).

    !end-bullet!
-   !begin-bullet!
    For `render()`, if the input filename contains special characters
    such as spaces or question marks (as defined in
    `rmarkdown:::.shell_chars_regex`), the file will be temporarily
    renamed with the special characters replaced by `-` (dash) instead
    of `_` (underscore, as in previous versions of **rmarkdown**). This
    change will affect users who render such files with caching (cache
    will be invalidated and regenerated). The change is due to the fact
    that `-` is generally a safer character than `_`, especially for
    LaTeX output (#1396).

    !end-bullet!
-   !begin-bullet!
    Added a **pkgdown** site for the **rmarkdown** package:
    https://rmarkdown.rstudio.com/docs/ (thanks, @apreshill, #1574).

    !end-bullet!
-   !begin-bullet!
    Fixed the bug #1593: in HTML documents, when a MathJax URL is used
    with a custom template, the source code of the MathJax library is
    included in the document. This bug was first declared in
    **bookdown** (thanks, @topepo for the bug report
    rstudio/bookdown#683, and @RLesur for the fix #1594).

    !end-bullet!

!end-bullets-39!

# rmarkdown 1.13

!begin-bullets-40!

-   !begin-bullet!
    For `pdf_document()`, do not override margins to 1 inch when a
    custom document class or geometry settings are specified in the YAML
    front matter (thanks, @adunning, #1550)

    !end-bullet!
-   !begin-bullet!
    The default value of the `encoding` argument in all functions in
    this package (such as `render()` and `render_site()`) has been
    changed from `getOption("encoding")` to `UTF-8`. We have been hoping
    to support UTF-8 only in **rmarkdown**, **knitr**, and other related
    packages in the future. For more info, you may read
    https://yihui.org/en/2018/11/biggest-regret-knitr/.

    !end-bullet!
-   !begin-bullet!
    The option `toc_float: true` for `html_document` now preserves the
    text formatting (thanks, @codetrainee, #1548).

    !end-bullet!
-   !begin-bullet!
    For the `output_file` argument of `render()`, a file extension will
    be automatically added if the filename does not contain an extension
    (e.g., `render('foo.Rmd', 'html_document', output_file = 'bar')`
    will generate `bar.html`); see the help page `?rmarkdown::render`
    for details (thanks, @apreshill, #1551).

    !end-bullet!
-   !begin-bullet!
    TOC items are not correctly indented when `toc_float` is enabled for
    the `html_document` format (thanks, @carolynwclayton #1235 and
    @RLesur #1243).

    !end-bullet!
-   !begin-bullet!
    Fixed rstudio/shiny#2307 where the second execution of a
    `shiny_prerendred` document with `href` dependencies would cause a
    prerender check error (thanks, @schloerke, #1562).

    !end-bullet!
-   !begin-bullet!
    The `*_files` directory is not properly cleared due to the
    inappropriate fix for #1503 and #1472 in the last version (thanks,
    @wxli0 #1553, @cderv #1566).

    !end-bullet!
-   !begin-bullet!
    Added an `output_extensions` argument to `pdf_document()` to make it
    possible to enable/disable Pandoc extensions for the LaTeX output
    format (thanks, @hongyuanjia, rstudio/bookdown#687).

    !end-bullet!

!end-bullets-40!

# rmarkdown 1.12

!begin-bullets-41!

-   !begin-bullet!
    Fixed file extensions of output files when using non-markdown Pandoc
    extensions such as `docx+styles` (#1494, @noamross).

    !end-bullet!
-   !begin-bullet!
    Added a new argument `extra_lines` to `latex_dependency()` to allow
    users to add extra lines of LaTeX code after `\usepackage{}`. Also
    added a helper function `latex_dependency_tikz()` based on
    `latex_dependency()` (#1502, @malcolmbarrett).

    !end-bullet!
-   !begin-bullet!
    Fixed #1529: when the path of an Rmd file contains Unicode
    characters that cannot be represented in the system native encoding
    (especially on Windows), `rmarkdown::render()` may fail.

    !end-bullet!
-   !begin-bullet!
    Applied a correct fix to an old **plotly** issue
    ropensci/plotly#463.

    !end-bullet!
-   !begin-bullet!
    HTML widgets used to be hidden when printing ioslides to PDF in
    Chrome. Now they will be printed correctly.

    !end-bullet!
-   !begin-bullet!
    `render(output_format = 'all')` may delete the figure directories
    that are still needed by certain output formats when one output
    format doesn't need its figure directory (thanks, @rmcd1024 #1472,
    @cderv #1503).

    !end-bullet!
-   !begin-bullet!
    The `<em>` tags in the subtitle, date, and author are removed from
    the default HTML template (thanks, @royfrancis, #1544).

    !end-bullet!

!end-bullets-41!

# rmarkdown 1.11

!begin-bullets-42!

-   !begin-bullet!
    Fixed #1483, which prevented the triangle to be displayed in Firefox
    when `<details><summary>...</summary></details>` was used (#1485,
    @bisaloo)

    !end-bullet!
-   !begin-bullet!
    Provided `rmarkdown.pandoc.args` as a **knitr** package option in
    `knitr::opts_knit` (#1468, @noamross).

    !end-bullet!
-   !begin-bullet!
    Added the exported function `pandoc_exec()`, which returns the path
    of the pandoc binary used by the package (#1465, #1466 @noamross).

    !end-bullet!
-   !begin-bullet!
    `new_session: true` in `_site.yml` causes `render_site()` to render
    each file in a new R session, eliminating some cross-file
    difficulties, such as function masking (#1326, #1443 @jennybc).

    !end-bullet!
-   !begin-bullet!
    Added the LaTeX command `\passthrough` in the default LaTeX template
    for the `--listings` flag of Pandoc (rstudio/bookdown#591).

    !end-bullet!
-   !begin-bullet!
    The icons in `flexdashboard::valueBox()` are not of the full sizes
    due to the upgrade of FontAwesome in #1340 in the previous version
    (#1388, rstudio/flexdashboard#189).

    !end-bullet!
-   !begin-bullet!
    Added the ability to generate tabset dropdowns, usable by adding the
    `.tabset-dropdown` class to a header (e.g.,
    `# Heading {.tabset .tabset-dropdown}`) (#1405). Thanks
    @stefanfritsch for contributing the necessary code for this (#1116).

    !end-bullet!
-   !begin-bullet!
    The `darkly` theme (a darker variant of the Bootswatch `flatly`
    theme) has been added to `html_document` and `html_notebook` (#1409,
    #889).

    !end-bullet!
-   !begin-bullet!
    Fixed a regression that caused scrollbars on code blocks when the
    syntax highlighting theme is not the default (#654, #1399).

    !end-bullet!
-   !begin-bullet!
    Fixed #1407: reactive expressions can break the section headers of
    Shiny R Markdown documents.

    !end-bullet!
-   !begin-bullet!
    Fixed #1431: `render()` with the `intermediates_dir` argument when
    the output format is `powerpoint_presentation` with a custom
    `reference_doc` fails to find the reference document.

    !end-bullet!
-   !begin-bullet!
    Fixed the website navbar not being able to display submenus properly
    (#721, #1426).

    !end-bullet!
-   !begin-bullet!
    Added checks for shiny-prerendered documents to find all html
    dependencies, match all execution packages, and match the major R
    version (#1420).

    !end-bullet!
-   !begin-bullet!
    Added an argument `cache = TRUE` to the internal function
    `rmarkdown:::find_pandoc()`, so that users can invalidate the cached
    path of Pandoc via `rmarkdown:::find_pandoc(cache = FALSE)` (thanks,
    @hammer, #1482).

    !end-bullet!
-   !begin-bullet!
    Added an RStudio project template for simple R Markdown websites, so
    that users can create such websites from RStudio:
    `New Project -> New Directory -> Simple R Markdown Website` (thanks,
    @kevinushey, #1470).

    !end-bullet!
-   !begin-bullet!
    Fixed #1471: Pandoc's (version 2.x) syntax highlighting themes don't
    work well with the Bootstrap style (thanks, @gponce-ars #1471,
    @cderv #1489).

    !end-bullet!
-   !begin-bullet!
    Fixed the warnings in #1224 and #1288 when calling `render()` with
    an absolute `output_dir` or `intermediates_dir`.

    !end-bullet!
-   !begin-bullet!
    Fixed #1300: calling `render()` with `intermediates_dir` may fail
    when the intermediate dir is on a difference device or filesystem.

    !end-bullet!
-   !begin-bullet!
    Fixed #1358: calling `render()` with `intermediates_dir` will fail
    if the Rmd document contains bibliography files that are dynamically
    generated.

    !end-bullet!

!end-bullets-42!

# rmarkdown 1.10

!begin-bullets-43!

-   !begin-bullet!
    Added a new argument `slide_level` to `powerpoint_presentation()`
    (#1270).

    !end-bullet!
-   !begin-bullet!
    The **tinytex** package has become a required dependency (to build R
    Markdown to PDF).

    !end-bullet!
-   !begin-bullet!
    Added `compact-title` variable to the LaTeX default templates to
    control use of LaTeX `titling` package; defaults to `true` (#1284).

    !end-bullet!
-   !begin-bullet!
    `pdf_document(template = NULL)` does not work (#1295).

    !end-bullet!
-   !begin-bullet!
    Restore ability to use any HTML format with R Markdown Websites
    (#1328).

    !end-bullet!
-   !begin-bullet!
    Add `options` argument to `paged_table()` to enable explicit passing
    of display options.

    !end-bullet!
-   !begin-bullet!
    Add `pandoc_citeproc_convert()` function for conversion of
    bibliography files (e.g. BibTeX files).

    !end-bullet!
-   !begin-bullet!
    Update to Font Awesome version 5.0.13 (#1340).

    !end-bullet!
-   !begin-bullet!
    Add `site_resources()` function for computing resource files
    required for a website.

    !end-bullet!
-   !begin-bullet!
    Export `default_site_generator()` function.

    !end-bullet!
-   !begin-bullet!
    The `latex_document()` format should not clean up the figure
    directory (thanks, @emiltb, rstudio/bookdown#582).

    !end-bullet!
-   !begin-bullet!
    Enable post processors that change the output file to specify that
    the base post processor should still be applied to the original
    output file.

    !end-bullet!

!end-bullets-43!

# rmarkdown 1.9

## NEW FEATURES

!begin-bullets-44!

-   !begin-bullet!
    Added a new (experimental) output format `powerpoint_presentation`.
    If you want to test it, you will need Pandoc \>= 2.1 (#1231).
    !end-bullet!

!end-bullets-44!

## MAJOR CHANGES

!begin-bullets-45!

-   !begin-bullet!
    If the **tinytex** package is installed, PDF output is built through
    `tinytex::latexmk()`, otherwise it is generated by
    `rmarkdown:::latexmk()`, which has been factored out and improved in
    the **tinytex** package, so it is recommended that you install the
    **tinytex** package (#1222).
    !end-bullet!

!end-bullets-45!

## BUG FIXES

!begin-bullets-46!

-   !begin-bullet!
    Temporary files created in `render()` may be cleaned up prematurely,
    which can cause problems with Shiny R Markdown documents (#1184).

    !end-bullet!
-   !begin-bullet!
    Further improvements regarding compatibility with Pandoc 2.0,
    e.g. tabbed sections don't work
    (https://community.rstudio.com/t/3019).

    !end-bullet!
-   !begin-bullet!
    When `preserve_yaml = TRUE` in `md_document()`, `toc = TRUE` fails
    to create the table of contents (thanks, @stla, #1216).

    !end-bullet!
-   !begin-bullet!
    Suppress confusing error messages from `knitr::purl()` during
    `rmarkdown::find_external_resources()` (thanks, @aronatkins #1247,
    and @paulobrecht #1154).

    !end-bullet!
-   !begin-bullet!
    Fixed the obscure error
    `Error: path for html_dependency not found:`, which was due to the
    HTML dependency of highlight.js (thanks, @bborgesr, #1213).

    !end-bullet!

!end-bullets-46!

# rmarkdown 1.8

## BUG FIXES

!begin-bullets-47!

-   !begin-bullet!
    `render_site()` does not work with `_site.yml` that does not have
    the `output` setting (#1189).

    !end-bullet!
-   !begin-bullet!
    The variables `input` and `output` do not work in Shiny R Markdown
    documents (#1193).

    !end-bullet!
-   !begin-bullet!
    `ioslides_presentation` fails to embed images (#1197).

    !end-bullet!
-   !begin-bullet!
    With Pandoc 2.x, `github_document()` generates the wrong filename
    extension `.gfm-ascii_identifiers` instead of `.md`, and line height
    of code blocks in the HTML preview is too big (#1200).

    !end-bullet!

!end-bullets-47!

# rmarkdown 1.7

!begin-bullets-48!

-   !begin-bullet!
    Fixed an issue with `df_print: paged` where row names where not
    printed and added support for `rownames.print` option to control
    when they print.

    !end-bullet!
-   !begin-bullet!
    Add `smart` option for `word_document()` format.

    !end-bullet!
-   !begin-bullet!
    Save render intermediates when generating beamer presentations
    (fixes #1106).

    !end-bullet!
-   !begin-bullet!
    Fixed issues when specifying NULL/null/empty parameter values (#729
    and #762).

    !end-bullet!
-   !begin-bullet!
    Better error message when unable to prerender a document. (#1125)

    !end-bullet!
-   !begin-bullet!
    `shiny::renderText()` does not work in Markdown section headings
    (#133).

    !end-bullet!
-   !begin-bullet!
    The `value` argument of `pandoc_variable_arg()` can be missing now
    (#287).

    !end-bullet!
-   !begin-bullet!
    Background colors and images are supported for ioslides
    presentations (#687).

    !end-bullet!
-   !begin-bullet!
    HTML widgets in an Rmd document cannot be rendered if another Rmd
    document is rendered via `rmarkdown::render()` in this document
    (#993).

    !end-bullet!
-   !begin-bullet!
    Try harder to clean up temporary files created during `render()`
    (#820).

    !end-bullet!
-   !begin-bullet!
    Wrong environment for evaluating R code chunks in Shiny R Markdown
    docs (#1162, #1124).

    !end-bullet!
-   !begin-bullet!
    Do not call `bibtex` to create the bibliography when there are no
    citations in the document and the output format is `pdf_document()`
    with `citation_package = 'natbib'` (#1113).

    !end-bullet!
-   !begin-bullet!
    `render()` will stop if the output format is PDF but there are any
    errors during building the index or bibliography (#1166).

    !end-bullet!
-   !begin-bullet!
    `beamer_presentation()` doesn't work when
    `citation_package != 'none'` (#1161).

    !end-bullet!
-   !begin-bullet!
    File-based inputs don't work in parameterized documents (#919).

    !end-bullet!
-   !begin-bullet!
    rmarkdown is compatible with Pandoc 2.0 now (#1120).

    !end-bullet!
-   !begin-bullet!
    `render()` with `intermediates_dir` fails with R plots (#500).

    !end-bullet!
-   !begin-bullet!
    Added two new output formats `latex_document()` and
    `latex_fragment()` (#626).

    !end-bullet!
-   !begin-bullet!
    Relative paths of images in HTML output should not be resolved to
    absolute paths (#808).

    !end-bullet!
-   !begin-bullet!
    `render_site()` does not support multiple output formats for a
    single Rmd (#793).

    !end-bullet!
-   !begin-bullet!
    Unicode characters may be scrambled when downloading the Rmd source
    file using the download button generated by
    `html_document(code_download = TRUE)` (#722).

    !end-bullet!
-   !begin-bullet!
    Upgraded highlight.js from v1.1 to v9.12.0 (#988, #907).

    !end-bullet!
-   !begin-bullet!
    The argument `keep_md = TRUE` actually preserves the Markdown output
    file from `knitr::knit()` now (as documented). Previously, it
    generates a new Markdown file by concatenating the YAML metadata
    (title, author, date) with the body of the original Markdown output
    file (#450).

    !end-bullet!
-   !begin-bullet!
    For `md_document()`, when `variant == 'markdown'` and
    `perserve_yaml = TRUE`, the Pandoc argument `--standalone` should
    not be used (#656).

    !end-bullet!

!end-bullets-48!

# rmarkdown 1.6

!begin-bullets-49!

-   !begin-bullet!
    Fixed an issue where headers with non-ASCII text would not be linked
    to correctly in the table of contents.

    !end-bullet!
-   !begin-bullet!
    Support code folding for bash, python, sql, Rcpp, and Stan chunks.

    !end-bullet!
-   !begin-bullet!
    Provide rmarkdown.pandoc.id_prefix as Knit option

    !end-bullet!
-   !begin-bullet!
    Fixed two issue with `df_print: paged`, one would prevent rendering
    data with lists of lists and the other where the column type would
    get cut off.

    !end-bullet!
-   !begin-bullet!
    Better support for `citation_package: biblatex` in `pdf_document()`
    (#1062).

    !end-bullet!
-   !begin-bullet!
    On certain Windows platforms, compiling LaTeX to PDF may fail
    because `system2(stdout = FALSE)` is not supported, in which case
    the default `system2()` will be used (#1061).

    !end-bullet!
-   !begin-bullet!
    Allow paged tables to render even when page load / visibility has a
    long delay

    !end-bullet!

!end-bullets-49!

# rmarkdown 1.5

!begin-bullets-50!

-   !begin-bullet!
    Fixed an issue where code within Shiny pre-rendered documents was
    not rendered correctly.

    !end-bullet!
-   !begin-bullet!
    Add `includes` parameter to `html_fragment` format.

    !end-bullet!
-   !begin-bullet!
    Use RStudio redirection URL to replace deprecated MathJax CDN

    !end-bullet!

!end-bullets-50!

# rmarkdown 1.4

!begin-bullets-51!

-   !begin-bullet!
    `data.table` expressions involving `:=` are no longer automatically
    printed within R Markdown documents. (#829)

    !end-bullet!
-   !begin-bullet!
    Fix #910: the extra_dependencies argument of pdf_document() does not
    work when no code chunks contain LaTeX dependencies.

    !end-bullet!
-   !begin-bullet!
    The extra_dependencies of pdf_document() can also take a character
    vector of LaTeX package names, or a named list of LaTeX package
    options (with names being package names), which makes it much easier
    to express LaTeX dependencies via YAML.

    !end-bullet!
-   !begin-bullet!
    Automatically ignore packrat directory for render_site

    !end-bullet!
-   !begin-bullet!
    Fix #943: escape end tags in shiny_prerendered code contexts

    !end-bullet!
-   !begin-bullet!
    Add support for sticky tabs in html_document via tabset-sticky class

    !end-bullet!
-   !begin-bullet!
    Process Rmd files with lowercase extension (.rmd) in render_site

    !end-bullet!
-   !begin-bullet!
    Fix stack space consumption issues with large JS payloads in chunks

    !end-bullet!
-   !begin-bullet!
    Add `section_divs` argument to html_document and html_fragment to
    control generation of section tags/divs.

    !end-bullet!
-   !begin-bullet!
    Remove data-context="(data\|server\|server-start)" chunks from HTML
    served to client in shiny_prerendered

    !end-bullet!

!end-bullets-51!

# rmarkdown 1.3

!begin-bullets-52!

-   !begin-bullet!
    Fix v1.2 regression in ordering of CSS for ioslides_presentation.

    !end-bullet!
-   !begin-bullet!
    Fix rendering of pagedtables within html_notebook format.

    !end-bullet!
-   !begin-bullet!
    Ensure that html_prerendered UI is never cached.

    !end-bullet!
-   !begin-bullet!
    Add `citeproc` argument to YAML header; controls whether
    pandoc-citeproc is used (#831)

    !end-bullet!

!end-bullets-52!

# rmarkdown 1.2

!begin-bullets-53!

-   !begin-bullet!
    Add support for df_print to handle additional dplyr classes:
    grouped_df, rowwise_df and tbl_sql.

    !end-bullet!
-   !begin-bullet!
    Add new `runtime: shiny_prerendered` mode for interactive documents.

    !end-bullet!
-   !begin-bullet!
    Prepend "section-" to ids in runtime: shiny\[\_prerendered\] to
    eliminate potential conflicts with shiny output ids

    !end-bullet!
-   !begin-bullet!
    Use html_dependencies for highlight.js, pagedtables, slidy,
    ioslides, & navigation (improved dependency behavior for runtime:
    shiny\[\_prerendered\])

    !end-bullet!
-   !begin-bullet!
    Serialize runtime: shiny\[\_prerendered\] dependencies to JSON
    rather than .rds

    !end-bullet!
-   !begin-bullet!
    ioslides: check for null before concatenating attr\["class"\] (#836)

    !end-bullet!
-   !begin-bullet!
    Add rmarkdown.onKnit/onKnitCompleted package hooks

    !end-bullet!
-   !begin-bullet!
    Non-ASCII keys in yaml file should be marked to UTF8 as well, when
    read into R as the name of a list (#841)

    !end-bullet!
-   !begin-bullet!
    Remove key-column special-case left alignment in pagedtables (#829)

    !end-bullet!
-   !begin-bullet!
    Replace backslashes in floating TOC headings (#849)

    !end-bullet!
-   !begin-bullet!
    Suggests rather than Imports for tibble (R 3.0 compatibility)

    !end-bullet!
-   !begin-bullet!
    Add `paged_table` function for printing paged tables within HTML
    documents

    !end-bullet!
-   !begin-bullet!
    Support `{.active}` attribute for setting initially active tab
    (#789)

    !end-bullet!
-   !begin-bullet!
    Add `knit_root_dir` argument to `render()` and YAML header, a
    convenience for setting knitr's root.dir option

    !end-bullet!
-   !begin-bullet!
    Improve alignment of text in sub-topics for floating TOC

    !end-bullet!
-   !begin-bullet!
    Bibliography file paths in YAML containing forward slashes could not
    be rendered (#875)

    !end-bullet!

!end-bullets-53!

# rmarkdown 1.1

!begin-bullets-54!

-   !begin-bullet!
    Fixed an issue where attempts to render an R Notebook could fail if
    the path contained multibyte characters.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the default Beamer template did not provide
    vertical padding between paragraphs with certain versions of pandoc
    (\<= 1.17.2).

    !end-bullet!
-   !begin-bullet!
    Try to install latexmk automatically on Windows

    !end-bullet!
-   !begin-bullet!
    Added `df_print` option to html_document format for optionally
    printing data frames using `knitr::kable`, the `tibble` package, or
    an arbitrary function

    !end-bullet!
-   !begin-bullet!
    Fix for render_site not showing Chinese characters correctly

    !end-bullet!
-   !begin-bullet!
    Fix for ignoring knit_meta that is explicitly passed to render

    !end-bullet!
-   !begin-bullet!
    Parameter editing: don't allow NULL to overwrite previous state

    !end-bullet!
-   !begin-bullet!
    Parameter editing: fix incorrect name for parameters with
    expressions

    !end-bullet!
-   !begin-bullet!
    Parameter editing: allow multiple values when the parameter is
    configured to use a "multiple" selector

    !end-bullet!
-   !begin-bullet!
    Switched the order in which format dependencies are added for
    `html_document` so that `extra_dependencies` are added at the end,
    after bootstrap, etc. (#737)

    !end-bullet!
-   !begin-bullet!
    `pdf_document(keep_tex = TRUE)` will generate the .tex document even
    if PDF conversion fails (#779).

    !end-bullet!
-   !begin-bullet!
    Move latex header includes to just before \\begin{document}

    !end-bullet!
-   !begin-bullet!
    Special 'global' chunk label for runtime: shiny which designates a
    chunk to be run once and only once in the global environment
    (startup performance improvement for multi-user shiny documents)

    !end-bullet!
-   !begin-bullet!
    Ensure supporting files are writeable (#800)

    !end-bullet!
-   !begin-bullet!
    Make the "show code" buttons more CSS-friendly (#795)

    !end-bullet!
-   !begin-bullet!
    Exclude `output_dir` from site files (#803)

    !end-bullet!
-   !begin-bullet!
    Export `navbar_html` and `yaml_front_matter` functions

    !end-bullet!

!end-bullets-54!

# rmarkdown 1.0

!begin-bullets-55!

-   !begin-bullet!
    `toc_float` no longer automatically sets `toc = TRUE`

    !end-bullet!
-   !begin-bullet!
    Added an argument `error` to `pandoc_available()` to signal an error
    when (if `error = TRUE`) pandoc with the required version is not
    found.

    !end-bullet!
-   !begin-bullet!
    Added `html_notebook` format for creating HTML documents that
    include source code and output.

    !end-bullet!
-   !begin-bullet!
    Added `resolve_output_format` function (useful for front ends that
    need to mirror the default format resolution logic of `render`).

    !end-bullet!
-   !begin-bullet!
    Added `code_download` option to `html_document` to provide an option
    to embed a downloadable copy of the Rmd source code within the
    document.

    !end-bullet!
-   !begin-bullet!
    Added `slide_level` option to ioslides_presentation to set the level
    of heading used for individual slides.

    !end-bullet!
-   !begin-bullet!
    Added `hard_line_breaks` option to `github_document` to deal with
    change in behavior of GitHub's markdown renderer with respect to
    line breaks.

    !end-bullet!
-   !begin-bullet!
    Use "markdown_strict" rather than "markdown" for
    `pandoc_self_contained_html` when pandoc \>= 1.17 (pandoc hanging
    bug was fixed in this version)

    !end-bullet!
-   !begin-bullet!
    Default highlighting engine for `html_document` now highlights bash,
    c++, css, ini, javascript, perl, python, r, ruby, scala, stan and
    xml

    !end-bullet!
-   !begin-bullet!
    Added `print` sub-option to `toc_float` to control whether the table
    of contents appears when user prints out the HTML page.

    !end-bullet!
-   !begin-bullet!
    Added `readme` option to `html_vignette` which automatically creates
    a package level README.md (for GitHub) in addition to rendering the
    vignette.

    !end-bullet!
-   !begin-bullet!
    Support for `keep_md` in `html_vignette` format.

    !end-bullet!
-   !begin-bullet!
    Try to install the latexmk package automatically on Windows if the
    executable latexmk.exe exists.

    !end-bullet!

!end-bullets-55!

# rmarkdown 0.9.6

!begin-bullets-56!

-   !begin-bullet!
    Ability to set `opts_hooks` in `knitr_options()` (#672)

    !end-bullet!
-   !begin-bullet!
    Added `render_site` and related functions for rendering collections
    of documents within a directory as a website.

    !end-bullet!
-   !begin-bullet!
    Ability to define html_document navigation bar using simple yaml
    format.

    !end-bullet!
-   !begin-bullet!
    Added `pre_knit` and `post_knit` hooks for output formats.

    !end-bullet!
-   !begin-bullet!
    Discover `LaTeX` dependencies and add them to the `.tex` preamble
    (#647)

    !end-bullet!
-   !begin-bullet!
    Added new `all_output_formats` function to enumerate all output
    formats registered for an Rmd.

    !end-bullet!
-   !begin-bullet!
    Change `fig_caption` default to TRUE for all formats

    !end-bullet!
-   !begin-bullet!
    Change `fig_retina` to 2 for HTML formats (no longer contingent on
    `fig_caption`)

    !end-bullet!
-   !begin-bullet!
    Ensure pandoc binary exists before binding to pandoc directory
    (#632)

    !end-bullet!
-   !begin-bullet!
    Handle relative paths for 'default_output_format' (#638)

    !end-bullet!
-   !begin-bullet!
    Eliminate duplicate viewport meta tag from html_document

    !end-bullet!
-   !begin-bullet!
    Added biblatex biblio-style support to the LaTeX template for Pandoc
    1.15.2 (#643)

    !end-bullet!
-   !begin-bullet!
    Allow override of header font-size in html_document custom css
    (#652)

    !end-bullet!
-   !begin-bullet!
    Fix for horizontal scrollbars appearing w/ code folding (#654)

    !end-bullet!
-   !begin-bullet!
    Specifying `toc_float` in `html_document` now automatically sets
    `toc = TRUE`

    !end-bullet!
-   !begin-bullet!
    Enable per-header opt-out of `toc-float` via {.toc-ignore} attribute

    !end-bullet!
-   !begin-bullet!
    Correctly handle soft line breaks in ioslides_presentation (#661)

    !end-bullet!
-   !begin-bullet!
    Don't use text-muted for code folding btns (text visibility in
    non-default themes)

    !end-bullet!
-   !begin-bullet!
    Fix for rendering non-HTML formats from .md files (resolve runtime
    before knit)

    !end-bullet!
-   !begin-bullet!
    `html_dependency_bootstrap` now accepts theme = "default" argument

    !end-bullet!
-   !begin-bullet!
    Use pandoc 1.17.0.2 compatible LaTeX template when pandoc \>=
    1.17.0.2

    !end-bullet!
-   !begin-bullet!
    Support custom template for `ioslides_presentation`

    !end-bullet!
-   !begin-bullet!
    Added `analytics` option for `ioslides_presentation` for Google
    Analytics

    !end-bullet!
-   !begin-bullet!
    Removed the extra tag `<p></p>` around HTML output (typically
    generated by htmltools) from code chunks, to avoid invalid HTML like
    `<p><div>...</div><p>` (#685)

    !end-bullet!

!end-bullets-56!

# rmarkdown 0.9.5

!begin-bullets-57!

-   !begin-bullet!
    Added odt_document format for OpenDocument Text output

    !end-bullet!
-   !begin-bullet!
    Added rtf_document format for Rich Text Format output

    !end-bullet!
-   !begin-bullet!
    Added github_document format for GitHub Flavored Markdown output

    !end-bullet!
-   !begin-bullet!
    Only apply white background for themed HTML documents (#588)

    !end-bullet!
-   !begin-bullet!
    Added

    ```{=html}
    <meta name="viewport" content="width=device-width, initial-scale=1">
    ```
    to the default HTML template to make it work better with mobile
    browsers. (#589)

    !end-bullet!
-   !begin-bullet!
    Specify --filter pandoc-citeproc after custom pandoc args

    !end-bullet!
-   !begin-bullet!
    Long lines in code blocks will be wrapped in the `html_vignette()`
    output (#595)

    !end-bullet!
-   !begin-bullet!
    Added new arguments `run_pandoc = TRUE` and `knit_meta = NULL` to
    `render()`. See the help page of `render` for details. (#594)

    !end-bullet!
-   !begin-bullet!
    The `tufte_handout` format now delegates to the `tufte` package and
    no longer provides a base template.

    !end-bullet!
-   !begin-bullet!
    Use pandoc 1.15.2 compatible LaTeX template when pandoc \>= 1.15.2

    !end-bullet!
-   !begin-bullet!
    Fix issue with Beamer template and pandoc 1.15.2

    !end-bullet!
-   !begin-bullet!
    Updated embedded JQuery to v1.11.3 and Bootstrap to v3.3.5.

    !end-bullet!
-   !begin-bullet!
    Expose core HTML dependencies for use by custom R Markdown formats.

    !end-bullet!
-   !begin-bullet!
    New `html_document` themes: "lumen", "paper", "sandstone",
    "simplex", & "yeti".

    !end-bullet!
-   !begin-bullet!
    Ability to include bootstrap navbar for multi-page `html_document`
    websites

    !end-bullet!
-   !begin-bullet!
    Added support for `abstract` field to `html_document` format

    !end-bullet!
-   !begin-bullet!
    Added support for floating table of contents (via tocify) to
    `html_document`

    !end-bullet!
-   !begin-bullet!
    Added support for tabsets via use of {.tabset} class on top-level
    headings

    !end-bullet!
-   !begin-bullet!
    Added support for folding/unfolding of R code chunks in
    `html_document`

    !end-bullet!
-   !begin-bullet!
    Support `url` references in CSS files for `runtime: shiny`

    !end-bullet!
-   !begin-bullet!
    Change name of common options file to `_output.yml`

    !end-bullet!
-   !begin-bullet!
    Tweak pandoc conversion used in `pandoc_self_contained_html` to
    prevent hanging with large script elements (use "markdown" rather
    than "markdown-strict" as input format)

    !end-bullet!
-   !begin-bullet!
    The filename extension .bib will be removed before bibliography
    files are passed to Pandoc when the output is LaTeX/PDF and the
    citation package natbib or biblatex is used on Windows. This is
    because bibtex in MikTeX will always add the extension .bib to
    bibliography files, e.g. it treats foo.bib as foo.bib.bib. (#623)

    !end-bullet!
-   !begin-bullet!
    Render Shiny documents in a clean environment; fixes issue in which
    code in Shiny documents could access internal R Markdown state

    !end-bullet!

!end-bullets-57!

# rmarkdown 0.9.2

!begin-bullets-58!

-   !begin-bullet!
    Added a fix to #580 for Windows users.
    !end-bullet!

!end-bullets-58!

# rmarkdown 0.9.1

!begin-bullets-59!

-   !begin-bullet!
    Fix for a bug causing certain files to be deleted as intermediate
    files. (#580)

    !end-bullet!
-   !begin-bullet!
    PDF/LaTeX output no longer uses natbib as the citation package by
    default. If you do want to use natbib or biblatex, you may still use
    the argument citation_package = 'natbib' or 'biblatex'. (#577)

    !end-bullet!

!end-bullets-59!

# rmarkdown 0.9

!begin-bullets-60!

-   !begin-bullet!
    Fix for JS exception in slidy_presentation when served from the
    filesystem (don't call pushState for file:// urls)

    !end-bullet!
-   !begin-bullet!
    Escape single quotes in file paths

    !end-bullet!
-   !begin-bullet!
    Fix for missing resources when rendering a filename with shell
    characters

    !end-bullet!
-   !begin-bullet!
    For PDF/LaTeX output, citations are processed via natbib or biblatex
    instead of pandoc-citeproc. The ciation package natbib or biblatex
    can be chosen using the argument `citation_package` in
    `pdf_document()`, `beamer_presentation()`, and `tufte_handout()`.
    LaTeX is compiled to PDF via latexmk
    (https://www.ctan.org/pkg/latexmk/); if it is not installed, a
    simple emulation will be used (run pdflatex/xelatex/lualatex,
    bibtex, and makeindex a few times). You are recommended to install
    latexmk, and please note latexmk requires a Perl installation (this
    is important especially for Windows users).

    !end-bullet!
-   !begin-bullet!
    Always use the graphics package for PDF output

    !end-bullet!
-   !begin-bullet!
    Fix for the error "cannot change value of locked binding for
    'metadata'" when one call of rmarkdown::render() is nested in
    another one (#248)

    !end-bullet!
-   !begin-bullet!
    Fix for an issue causing image paths to be rendered incorrectly in
    Windows when rendering an `html_document` with
    `self_contained: false` and a path is passed in argument
    `output_dir`. (#551)

    !end-bullet!
-   !begin-bullet!
    Add always_allow_html option for preventing errors when
    html_dependencies are rendered in non-HTML formats
    (e.g. pdf_document or word_document).

    !end-bullet!
-   !begin-bullet!
    Fix for an issue causing resources not to be discovered in some
    documents containing an empty quoted string (`""`) in an R chunk.

    !end-bullet!

!end-bullets-60!

# rmarkdown 0.8.1

!begin-bullets-61!

-   !begin-bullet!
    Support for table of contents in word_document (requires pandoc \>=
    1.14)

    !end-bullet!
-   !begin-bullet!
    Support for opts_template in knitr options

    !end-bullet!
-   !begin-bullet!
    Don't implicitly discover directories when scanning for dependent
    resources

    !end-bullet!
-   !begin-bullet!
    Fix for slide numbers not showing up in ioslides when served from
    the filesystem (don't call pushState for file:// urls)

    !end-bullet!
-   !begin-bullet!
    Remove inlining of bootstrap CSS (was workaround for bug now fixed
    in pandoc)

    !end-bullet!
-   !begin-bullet!
    Allow specifying an R file in calls to find_all_resources

    !end-bullet!

!end-bullets-61!

# rmarkdown 0.8

!begin-bullets-62!

-   !begin-bullet!
    Add support for keep_md to word_document

    !end-bullet!
-   !begin-bullet!
    Increase pandoc stack size to 512M (often required for base64
    encoding e.g. larger embedded leaflet maps). Stack size can also be
    controlled by the pandoc.stack.size option.

    !end-bullet!
-   !begin-bullet!
    Allow YAML front matter to be terminated with ...

    !end-bullet!
-   !begin-bullet!
    Automatically generate a user-interface (via a Shiny application)
    for user specification of values in parameterized reports.

    !end-bullet!
-   !begin-bullet!
    Add tightlist macro for compatibility with pandoc \>= 1.14

    !end-bullet!
-   !begin-bullet!
    Bugfix: Don't merge render params recursively with knit_params

    !end-bullet!
-   !begin-bullet!
    Bugfix: Handle slashes correctly on Windows for slidy_presentation
    when self_contained = FALSE

    !end-bullet!

!end-bullets-62!

# rmarkdown 0.7

!begin-bullets-63!

-   !begin-bullet!
    Add latex_engine option to beamer_presentation format

    !end-bullet!
-   !begin-bullet!
    Ensure that when LANG=en_US pandoc receives en_US.UTF-8 (prevent
    hang)

    !end-bullet!
-   !begin-bullet!
    Generate MathJax compatible output when using html_fragment format.

    !end-bullet!
-   !begin-bullet!
    Use pandoc built-in template for Beamer

    !end-bullet!
-   !begin-bullet!
    Use pandoc 1.14 compatible LaTeX template when pandoc \>= 1.14

    !end-bullet!
-   !begin-bullet!
    Inline bootstrap.min.css to workaround pandoc 1.14 base64 encoding
    issue

    !end-bullet!
-   !begin-bullet!
    Add support for discovering references to external resources when
    the document output format is PDF

    !end-bullet!
-   !begin-bullet!
    Fix several issues causing pandoc errors when an intermediates
    directory is used, including during render for Shiny documents

    !end-bullet!

!end-bullets-63!

# rmarkdown 0.6

!begin-bullets-64!

-   !begin-bullet!
    Support for parameterized reports. Parameter names and default
    values are defined in YAML and can be specified via the 'params'
    argument to the render function

    !end-bullet!
-   !begin-bullet!
    'md_extensions' option to enable/disable markdown extensions for
    input files

    !end-bullet!
-   !begin-bullet!
    Automatically discover and include dependent resources (e.g. images,
    css, etc.) for interactive documents.

    !end-bullet!
-   !begin-bullet!
    Added pandoc_version function.

    !end-bullet!
-   !begin-bullet!
    Use VignetteEncoding directive in html_vignette format

    !end-bullet!
-   !begin-bullet!
    Fix issues related to use of non-ASCII characters in
    ioslides_presentation

    !end-bullet!
-   !begin-bullet!
    Non-ASCII characters in the YAML data are not marked with the UTF-8
    encoding when they are read into R, so character strings in
    `rmarkdown::metadata` may be displayed incorrectly (#420)

    !end-bullet!
-   !begin-bullet!
    Various improvements to tufte_handout format

    !end-bullet!

!end-bullets-64!

# rmarkdown 0.5.1

!begin-bullets-65!

-   !begin-bullet!
    Add 'dev' option to output formats to specify output device for
    figures

    !end-bullet!
-   !begin-bullet!
    Enable use of footnotes in titles of LaTeX documents

    !end-bullet!
-   !begin-bullet!
    Various improvements related to directory detection/handling on
    Windows

    !end-bullet!

!end-bullets-65!

# rmarkdown 0.4.2

!begin-bullets-66!

-   !begin-bullet!
    Sync to the latest LaTeX and Beamer templates from pandoc-templates

    !end-bullet!
-   !begin-bullet!
    Switched from the Bootstrap 2 web framework to Bootstrap 3. This is
    designed to work with Shiny \>= 0.10.3, which has made the same
    switch

    !end-bullet!
-   !begin-bullet!
    Add CSS to restore responsive image behavior from Bootstrap 2

    !end-bullet!
-   !begin-bullet!
    Use a more subtle treatment for inline code in Bootstrap themed
    documents

    !end-bullet!
-   !begin-bullet!
    Improved support for multiple authors in ioslides

    !end-bullet!
-   !begin-bullet!
    Workaround for poor rendering of ioslides multi-columns lists in
    Safari 8

    !end-bullet!
-   !begin-bullet!
    Serve index.html as fallback default file for rmarkdown::run

    !end-bullet!

!end-bullets-66!

# rmarkdown 0.3.11

Initial release to CRAN

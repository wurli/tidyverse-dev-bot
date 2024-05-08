# roxygen2 (development version)

!begin-bullets-1!

-   !begin-bullet!
    `@includeRmd` now additionally sets `options(cli.hyperlink = FALSE)`
    to make code run in included `.Rmd`s even more consistent across
    sessions (#1620).
    !end-bullet!

!end-bullets-1!

# roxygen2 7.3.1

!begin-bullets-2!

-   !begin-bullet!
    S3 method export warning no longer fails if class contains `{` or
    `}` (#1575).

    !end-bullet!
-   !begin-bullet!
    `@family` lists are now ordered more carefully, "foo1" comes after
    "foo" (#1563, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `@importFrom` works again for quoted non-syntactic names, e.g.
    `@importFrom magrittr "%>%"` or `` @importFrom rlang `:=` `` (#1570,
    @MichaelChirico). The unquoted form `@importFrom magrittr %>%`
    continues to work. Relatedly, `@importFrom` directives matching no
    known functions (e.g. `@importFrom utils plot pdf`) produce valid
    NAMESPACE files again.

    !end-bullet!
-   !begin-bullet!
    Multi-line `@rawNamespace` no longer break re-runs of
    `namespace_roclet()` (#1572, @MichaelChirico).

    !end-bullet!

!end-bullets-2!

# roxygen2 7.3.0

## New features

!begin-bullets-3!

-   !begin-bullet!
    `@docType package` now works more like documenting `"_PACKAGE"`,
    creating a `{packagename}-package` alias and clearly suggesting that
    you should switch to `"_PACKAGE"` instead (#1491).

    !end-bullet!
-   !begin-bullet!
    `_PACKAGE` will no longer generate an alias for your package name if
    a function of the same name exists (#1160).

    !end-bullet!
-   !begin-bullet!
    The NAMESPACE roclet now reports if you have S3 methods that are
    missing an `@export` tag. All S3 methods need to be `@export`ed
    (which confusingly really registers the method) even if the generic
    is not. This avoids rare, but hard to debug, problems (#1175). You
    can suppress the warning with `@exportS3Method NULL` (#1550).

    !end-bullet!
-   !begin-bullet!
    The `NAMESPACE` roclet once again regenerates imports *before*
    loading package code and parsing roxygen blocks. This has been the
    goal for a long time (#372), but we accidentally broke it when
    adding support for code execution in markdown blocks. This resolves
    a family of problems where you somehow bork your `NAMESPACE` and
    can't easily get out of it because you can't re-document the package
    because your code doesn't reload.

    !end-bullet!

!end-bullets-3!

## Minor improvements and bug fixes

!begin-bullets-4!

-   !begin-bullet!
    If you document a function from another package it is automatically
    imported. Additionally, if you set `@rdname` or `@name` you can opt
    out of the default `reexports` topic generation and provide your own
    docs (#1408).

    !end-bullet!
-   !begin-bullet!
    Generate correct usage for S4 methods with non-syntactic class
    names.

    !end-bullet!
-   !begin-bullet!
    The `ROXYGEN_PKG` env var provides the name of the package being
    documented (#1517).

    !end-bullet!
-   !begin-bullet!
    `@describeIn foo` now suggests that you might want `@rdname` instead
    (#1493). It also gives a more informative warning if you use it with
    an unsupported type (#1490).

    !end-bullet!
-   !begin-bullet!
    In `DESCRIPTION`, URLs containing escapes in `URL` and `BugReports`
    are now correctly handled (@HenningLorenzen-ext-bayer, #1415).
    Authors can now have multiple email addresses (@jmbarbone, #1487).

    !end-bullet!
-   !begin-bullet!
    `escape_examples()` is now exported (#1450).

    !end-bullet!
-   !begin-bullet!
    `@exportS3Method` provides the needed metadata to generate correct
    usage for S3 methods, just like `@method` (#1202).

    !end-bullet!
-   !begin-bullet!
    `is_s3_generic()` now ignores non-function objects when looking for
    a candidate function. I believe this is closer to how R operates.

    !end-bullet!
-   !begin-bullet!
    `@import` and friends are now ignored if they try to import from the
    package being documented. This is useful to add self-dependencies in
    standalone files meant to be used in other packages
    (r-lib/usethis#1853).

    !end-bullet!
-   !begin-bullet!
    `@importFrom` throws a friendlier error if you try and import a
    non-existing functions (@MichaelChirico, #1409).

    !end-bullet!
-   !begin-bullet!
    `@include` now gives an informative warning if you use a path that
    doesn't exist (#1497).

    !end-bullet!
-   !begin-bullet!
    `@inherit` can now also inherit from `@format` (#1293).

    !end-bullet!

!end-bullets-4!

# roxygen2 7.2.3

!begin-bullets-5!

-   !begin-bullet!
    roxygen2 now supports HTML blocks in markdown. They are only
    included in the HTML manual. They can also be produced as the output
    of code chunks.

    !end-bullet!
-   !begin-bullet!
    Improved support for RStudio IDE.

    !end-bullet!

!end-bullets-5!

# roxygen2 7.2.2

!begin-bullets-6!

-   !begin-bullet!
    `@includeRmd` calls `local_reproducible_output()` to make code run
    in included `.Rmd`s more consistent with other sources (#1431).

    !end-bullet!
-   !begin-bullet!
    Fix duplicated argument in `roxy_block()` to avoid CRAN removal.

    !end-bullet!

!end-bullets-6!

# roxygen2 7.2.1

## Tags

!begin-bullets-7!

-   !begin-bullet!
    All built-in tags are now documented so that you can do (e.g.)
    `?"@param"` to get a basic description of `@param` and a pointer
    where to learn more (#1165). This is powered by a new `tags_list()`
    lists all tags defined by roxygen2 and `tags_metadata()` provides
    some useful information about them for use by (e.g.) IDEs (#1375).

    !end-bullet!
-   !begin-bullet!
    `@describeIn` can now be used to combine more types of functions
    (generics, methods and other functions) into a single topic. The
    resulting section organises the functions by type (#1181) and
    displays methods like function calls. Methods are recognized only if
    they extend the generic in the destination,or if the destination can
    heuristically be identified as a constructor.

    !end-bullet!
-   !begin-bullet!
    Code evaluated in inline markdown code chunks and `@eval`/`@evalRd`/
    `@evalNamespace` is now evaluated in an environment designed to be
    more reproducible and to suppress output that won't work in Rd
    (e.g. turning off colour and unicode support in cli) (#1351). They
    now also set knitr options `comment = #>` (#1380) and
    `collapse = TRUE` (#1376).

    !end-bullet!
-   !begin-bullet!
    `@export` will now export both the class and constructor function
    when applied to expressions like `foo <- setClass("foo")` (#1216).

    !end-bullet!
-   !begin-bullet!
    `@includeRmd` now gives better feedback when it fails (#1089).

    !end-bullet!

!end-bullets-7!

## (R)markdown

!begin-bullets-8!

-   !begin-bullet!
    New `knitr_chunk_options` option (in the `Roxygen` entry of
    `DESCRIPTION` or in `man/roxygen/meta.R`) is added to the knitr
    chunk options that roxygen2 uses for markdown code blocks and inline
    code (#1390).

    !end-bullet!
-   !begin-bullet!
    PDF figures are only included the PDF manual, and SVG figures are
    only included in the HTML manual (#1399).

    !end-bullet!
-   !begin-bullet!
    You can now use alternative knitr engines in markdown code blocks
    (#1149).

    !end-bullet!
-   !begin-bullet!
    Generated HTML for code blocks never includes "NA" for language
    (#1251).

    !end-bullet!
-   !begin-bullet!
    Using a level 1 heading in the wrong tag now gives a more useful
    warning (#1374).

    !end-bullet!
-   !begin-bullet!
    Fix bug interpolating the results of indented inline RMarkdown
    (#1353).

    !end-bullet!

!end-bullets-8!

## Other

!begin-bullets-9!

-   !begin-bullet!
    If you have a daily build of RStudio, the lists of changed Rd files
    are now clickable so you can immediately see the rendered
    development documentation (#1354).

    !end-bullet!
-   !begin-bullet!
    R6 documentation no longer shows inherited methods if there aren't
    any (#1371), and only links to superclass docs if they're actually
    available (#1236).

    !end-bullet!
-   !begin-bullet!
    Automated usage no longer mangles nbsp in default arguments (#1342).

    !end-bullet!

!end-bullets-9!

# roxygen2 7.2.0

## New features

!begin-bullets-10!

-   !begin-bullet!
    The NAMESPACE roclet now preserves all existing non-import
    directives during it's first pre-processing pass. This eliminates
    the "NAMESPACE has changed" messages and reduces the incidence of
    namespace borking (#1254).

    !end-bullet!
-   !begin-bullet!
    `@inheritParams` now only inherits exact multiparameter matches, so
    if you're inheriting from a function with `@param x,y` you'll only
    get the parameter documentation if your function needs docs for both
    x and y (#950).

    !end-bullet!
-   !begin-bullet!
    All warning messages have been reviewed to be more informative and
    actionable (#1317). `@title` now checks for multiple paragraphs.
    `@export` gives a more informative warning if it contains too many
    lines. (#1074). All tags warn now if only provide whitespace
    (#1228), and problems with the first tag in each block are reported
    with the correct line number (#1235).

    !end-bullet!
-   !begin-bullet!
    If you have a daily build of RStudio, roxygen2 warnings will now
    include a clickable hyperlink that will take you directly to the
    problem (#1323). This technology is under active development across
    the IDE and the cli package but is extremely exciting.

    !end-bullet!

!end-bullets-10!

## Minor improvements and bug fixes

!begin-bullets-11!

-   !begin-bullet!
    roxygen2 can once again read UTF-8 paths on windows (#1277).

    !end-bullet!
-   !begin-bullet!
    `@author`s are de-duplicated in merged documentation (@DanChaltiel,
    #1333).

    !end-bullet!
-   !begin-bullet!
    `@exportS3method pkg::generic` now works when `pkg::generic` isn't
    imported by your package (#1085).

    !end-bullet!
-   !begin-bullet!
    `@includeRmd` is now adapted to change in rmarkdown 2.12 regarding
    math support in `github_document()` (#1304).

    !end-bullet!
-   !begin-bullet!
    `@inherit` and friends perform less aggressive link tweaking,
    eliminating many spurious warnings. Additionally, when you do get a
    warning, you'll now always learn which topic it's coming from
    (#1135). Inherited `\ifelse{}{}{}` tags are now inserted correctly
    (without additional `{}`) (#1062).

    !end-bullet!
-   !begin-bullet!
    `@inherit` now supports inheriting "Notes" with
    `@inherit pkg::fun note` (@pat-s, #1218)

    !end-bullet!
-   !begin-bullet!
    Automatic `@usage` now correctly wraps arguments containing
    syntactically significant whitespace (e.g anonymous functions)
    (#1281) and non-syntactic values surrounded by backticks (#1257).

    !end-bullet!
-   !begin-bullet!
    Markdown:

    !begin-bullets-12!
    -   !begin-bullet!
        Code blocks are always wrapped in `<div class="sourceCode">`
        even if the language is unknown (#1234).

        !end-bullet!
    -   !begin-bullet!
        Links with markup (e.g. `` [foo `bar`][target] ``) now cause an
        informative warning instead of generating invalid Rd.

        !end-bullet!
    -   !begin-bullet!
        Curly braces in links are now escaped (#1259).

        !end-bullet!
    -   !begin-bullet!
        Inline R code is now powered by knitr. Where available, (knit)
        print methods are applied (#1179). This change alters outputs
        and brings roxygen in line with console and R markdown behavior.
        `x <- "foo"` no longer inserts anything into the resulting
        documentation, but `x <- "foo"; x` will. This also means that
        returning a character vector will insert commas between
        components, not newlines.

        !end-bullet!

    !end-bullets-12!
    !end-bullet!
-   !begin-bullet!
    roxygen2 no longer generates invalid HTML (#1290).

    !end-bullet!
-   !begin-bullet!
    DOIs, arXiv links, and urls in the `Description` field of the
    `DESCRIPTION` are now converted to the appropriate Rd markup
    (@dieghernan, #1265, #1164). DOIs in the `URL` field of the
    `DESCRIPTION` are now converted to Rd's special `\doi{}` tag
    (@ThierryO, #1296).

    !end-bullet!

!end-bullets-11!

# roxygen2 7.1.2

!begin-bullets-13!

-   !begin-bullet!
    The new `@examplesIf` tag can be used to create conditional
    examples. These examples only run if a specified condition holds
    (#962).

    !end-bullet!
-   !begin-bullet!
    roxygen2 is now licensed as MIT (#1163).

    !end-bullet!
-   !begin-bullet!
    Bug fix for upcoming stringr 2.0.0 release.

    !end-bullet!
-   !begin-bullet!
    Code blocks with language now add `sourceCode` to the generated div;
    this makes syntax highlighting more consistent across
    downlit/pandoc/knitr/roxygen2.

    !end-bullet!
-   !begin-bullet!
    Percent signs in markdown link targets,
    e.g. `[text](https://foo/ba%20r)` are now handled correctly (#1209).

    !end-bullet!

!end-bullets-13!

# roxygen2 7.1.1

!begin-bullets-14!

-   !begin-bullet!
    When processing cross package markdown links (e.g. `[pkg::fun()]`),
    roxygen2 now looks up the file it needs to link to, instead of
    linking to the topic, to avoid "Non-file package-anchored links"
    `R CMD check` warnings.

    !end-bullet!
-   !begin-bullet!
    R6 methods and re-exported functions are always sorted in the C
    locale; this ensures they're always sorted the same way in every
    environment (#1077).

    !end-bullet!
-   !begin-bullet!
    roxygen2 now supports inline markdown code and code chunks inside Rd
    tags. In particular in `\out{}` (#1115).

    !end-bullet!

!end-bullets-14!

# roxygen2 7.1.0

## New features

!begin-bullets-15!

-   !begin-bullet!
    roxygen2 now supports inline markdown code and also code chunks,
    using the same notation as the knitr package. For example:

    !begin-codeblock!
    ``` r
    #' This manual was generated at: `r Sys.time()`.
    #' ...
    #' `mtcars` is a data frame with `r ncol(mtcars)` columns, here
    #' is a summary of them:
    #'
    #' ```{r}
    #' summary(mtcars)
    #' ```
    ```

    !end-codeblock!
    See `vignette("rd-formatting")` for details.

    !end-bullet!
-   !begin-bullet!
    roxygen2 now keeps using Windows (CR LF) line endings for files that
    already have CR LF line endings, and uses LF for new files (#989).

    !end-bullet!

!end-bullets-15!

## Minor improvements and bug fixes

!begin-bullets-16!

-   !begin-bullet!
    Auto-generated package documentation can now handle author ORCID
    comments containing full url (#1040).

    !end-bullet!
-   !begin-bullet!
    Hyperlinks to R6 methods are also added in the PDF manual (#1006).

    !end-bullet!
-   !begin-bullet!
    Empty annotations (alternate text) for figures added via markdown
    are now omitted. This caused issues when generating pkgdown web
    sites (#1051).

    !end-bullet!
-   !begin-bullet!
    Roxygen metadata can now have a `packages` element, giving a
    character vector of package names to load. This makes it easier to
    use extension package that provide new tags for existing roclets
    (#1013). See `?load_options` for more details.

    !begin-codeblock!
    ``` yaml
    Roxygen: list(markdown = TRUE, packages = "roxygenlabs")
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `@evalNamespace()` works again (#1022).

    !end-bullet!
-   !begin-bullet!
    `@description NULL` and `@details NULL` no longer fail; instead,
    these tags are ignored, except for `@description NULL` in package
    level documentation, where it can be used to suppress the
    auto-generated Description section (#1008).

    !end-bullet!
-   !begin-bullet!
    Multiple `@format` tags are now combined (#1015).

    !end-bullet!
-   !begin-bullet!
    The warning for `@section` titles spanning multiple lines now
    includes a hint that you're missing a colon (@maelle, #994).

    !end-bullet!
-   !begin-bullet!
    Can now document objects created with `delayedAssign()` by forcing
    evaluation at documentation time (#1041)

    !end-bullet!

!end-bullets-16!

# roxygen2 7.0.2

!begin-bullets-17!

-   !begin-bullet!
    `\example{}` escaping has been improved (again!) so that special
    escapes within strings are correctly escaped (#990).
    !end-bullet!

!end-bullets-17!

# roxygen2 7.0.1

!begin-bullets-18!

-   !begin-bullet!
    `@includeRmd` has now an optional second argument, the top level
    section the included file will go to. It defaults to the details
    section (#970). Code chunks are now evaluated in a child of the
    global environment (#972).

    !end-bullet!
-   !begin-bullet!
    `@inheritParams` does a better job of munging links.

    Links of the form `\link[=topic]{text}` are now automatically
    converted to `\link[pkg:topic]{text}` when inherited from other
    packages (#979).

    Internal `has_topic()` helper has a better implementation; this
    means that links should no longer be munged unnecessarily (#973).

    !end-bullet!
-   !begin-bullet!
    `\example{}` escaping has been considerably simplified (#967), and
    is now documented in `escape_example()`.

    !end-bullet!
-   !begin-bullet!
    In `\usage{}`, S3/S4 methods are no longer double-escaped (#976).

    !end-bullet!
-   !begin-bullet!
    Markdown tables with cells that contain multiple elements (e.g. text
    and code) are now rendered correctly (#985).

    !end-bullet!
-   !begin-bullet!
    Markdown code blocks containing operators and other special syntax
    (e.g. `function`, `if`, `+`) now converted to `\code{}` not
    `\verb{}` (#971).

    !end-bullet!

!end-bullets-18!

# roxygen2 7.0.0

## New features

### New tags

!begin-bullets-19!

-   !begin-bullet!
    `@includeRmd {path.Rmd}` converts an `.Rmd`/`.md` file to `.Rd` and
    includes it in the manual page. This allows sharing text between
    vignettes, `README.Rmd`, and the documentation. See `vignette("rd")`
    for details (#902).

    !end-bullet!
-   !begin-bullet!
    `@order {n}` tag controls the order in which blocks are processed.
    You can use it to override the usual ordering which proceeds from
    the top of each file to the bottom. `@order 1` will be processed
    before `@order 2`, and before any blocks that don't have an explicit
    order set (#863).

    !end-bullet!
-   !begin-bullet!
    `@exportS3Method` tag allows you to generate `S3method()` namespace
    directives (note the different in capitalisation) (#796). Its
    primary use is for "delayed" method registration, which allows you
    to define methods for generics found in suggested packages
    (available in R 3.6 and greater). For example,

    !begin-codeblock!
    ``` r
    #' @exportS3Method package::generic
    generic.foo <- function(x, ...) {

    }
    ```

    !end-codeblock!
    will generate

    !begin-codeblock!
        S3method(package::generic, foo)

    !end-codeblock!
    (See `vctrs::s3_register()` you need a version that works for
    earlier versions of R).

    It also has a two argument form allows you generate arbitrary
    `S3method()` directives:

    !begin-codeblock!
    ``` r
    #' @exportS3Method generic class
    NULL
    ```

    !end-codeblock!
    !begin-codeblock!
        S3method(generic, class)

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    New `@returns` is an alias for `@return` (#952).

    !end-bullet!

!end-bullets-19!

### R6

roxygen2 can now document R6 classes (#922). See `vignette("rd")` for
details.

### Markdown improvements

!begin-bullets-20!

-   !begin-bullet!
    Rd comments (`%`) are now automatically escaped. You will need to
    replace any existing uses of `\%` with `%` (#879).

    !end-bullet!
-   !begin-bullet!
    Markdown headings are supported in tags like `@description`,
    `@details`, and `@return` (#907, #908). Level 1 headings create a
    new top-level `\section{}`. Level 2 headings and below create nested
    `\subsections{}`.

    !end-bullet!
-   !begin-bullet!
    Markdown tables are converted to a `\tabular{}` macro (#290).
    roxygen2 supports the GFM table syntax which looks like this:

    !begin-codeblock!
    ``` md
    | foo | bar |
    | --- | --- |
    | baz | bim |
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Markdown code (`` `foofy` ``) is converted to to either `\code{}` or
    `\verb{}`, depending on whether it not it parses as R code. This
    better matches the description of `\code{}` and `\verb{}` macros,
    solves a certain class of escaping problems, and should make it
    easier to include arbitrary "code" snippets in documentation without
    causing Rd failures (#654).

    !end-bullet!
-   !begin-bullet!
    Markdown links can now contain formatting, e.g. `[*mean*][mean]`
    will now generate `\link[=mean]{\emph{mean}}`.

    !end-bullet!
-   !begin-bullet!
    Use of unsupported markdown features (e.g. blockquotes, inline HTML,
    and horizontal rules) generates informative error messages (#804).

    !end-bullet!

!end-bullets-20!

### Default usage

!begin-bullets-21!

-   !begin-bullet!
    The default formatting for function usage that spans multiple lines
    has now changed. Previously, the usage was wrapped to produce the
    smallest number of lines, e.g.:

    !begin-codeblock!
    ``` r
    parse_package(path = ".", env = env_package(path), 
      registry = default_tags(), global_options = list())
    ```

    !end-codeblock!
    Now it is wrapped so that each argument gets its own line (#820):

    !begin-codeblock!
    ``` r
    parse_package(
      path = ".",
      env = env_package(path),
      registry = default_tags(),
      global_options = list()
    )
    ```

    !end-codeblock!
    If you prefer the old behaviour you can put the following in your
    `DESCRIPTION`:

    !begin-codeblock!
        Roxygen: list(old_usage = TRUE)

    !end-codeblock!
    !end-bullet!

!end-bullets-21!

### Code loading

roxygen2 now provides three strategies for loading your code (#822):

!begin-bullets-22!

-   !begin-bullet!
    `load_pkgload()`, the default, uses pkgload. Compared to the
    previous release, this now automatically recompiles your package if
    needed.

    !end-bullet!
-   !begin-bullet!
    `load_source()` attaches required packages and `source()`s all files
    in `R/`. This is a cruder simulation of package loading than pkgload
    (and e.g. is unreliable if you use S4 extensively), but it does not
    require that the package be compiled. Use if the default strategy
    (used in roxygen2 6.1.0 and above) causes you grief.

    !end-bullet!
-   !begin-bullet!
    `load_installed()` assumes you have installed the package. This is
    best used as part of a bigger automated workflow.

    !end-bullet!

!end-bullets-22!

You can override the default either by calling (e.g.)
`roxygenise(load_code = "source"))` or by setting the `load` option in
your DESCRIPTION: `Roxygen: list(load = "source")`.

### Options

!begin-bullets-23!

-   !begin-bullet!
    As well as storing roxygen options in the `Roxygen` field of the
    `DESCRIPTION` you can now also store them in `man/roxygen/meta.R`
    (#889). The evaluation of this file should produce a named list that
    maps option names to values.

    !end-bullet!
-   !begin-bullet!
    roxygen now also looks for templates in `man/roxygen/templates`
    (#888).

    !end-bullet!
-   !begin-bullet!
    New `rd_family_title` option: this should be a named list, and is
    used to overrides the default "Other family:" prefix that `@family`
    generates. For example, to override the prefix generated by
    `@family foo` place
    `rd_family_title <- list(foo = "Custom prefix: ")` in
    `man/roxygen/meta.R` (#830, @kevinushey).

    !end-bullet!

!end-bullets-23!

## Breaking changes

!begin-bullets-24!

-   !begin-bullet!
    Rd comments (`%`) are automatically escaped in markdown formatted
    text. This is a backward incompatible change because you will need
    to replace existing uses of `\%` with `%` (#879).

    !end-bullet!
-   !begin-bullet!
    Using `@docType package` no longer automatically adds `-name`.
    Instead document `_PACKAGE` to get all the defaults for package
    documentation, or use `@name` to override the default file name.

    !end-bullet!
-   !begin-bullet!
    `@S3method` has been removed. It was deprecated in roxygen2 4.0.0
    released 2014-05-02, over 5 years ago.

    !end-bullet!
-   !begin-bullet!
    Using the old `wrap` option will now trigger a warning, as hasn't
    worked for quite some time. Suppress the error by deleting the
    option from your `DESCRIPTION`.

    !end-bullet!

!end-bullets-24!

### Extending roxygen2

The process for extending roxygen2 with new tags and new roclets has
been completely overhauled, and is now documented in
`vignette("extending")`. If you're one of the few people who have
written a roxygen2 extension, this will break your code - but the
documentation, object structure, and print methods are now so much
better that I hope it's not too annoying! Because this interface is now
documented, it will not change in the future without warning and a
deprecation cycle.

If you have previously made a new roclet, the major changes are:

!begin-bullets-25!

-   !begin-bullet!
    The previously internal data structures used to represent blocks and
    tags have been overhauled. They are now documented and stable. See
    `roxy_block()` and `roxy_tag()` for details.

    !end-bullet!
-   !begin-bullet!
    `roclet_tags()` is no longer used; instead define a
    `roxy_tag_parse()` method. For example, if you create a new `@mytag`
    tag, it will generate a class of `roxy_tag_mytag`, and will be
    parsed by `roxy_tag_parse.roxy_tag_mytag()` method. The method
    should return a new `roxy_tag()` object with the `val` field set.

    This means that the `registry` argument is no longer needed and has
    been removed.

    !end-bullet!
-   !begin-bullet!
    `rd_section()` and `roxy_tag_rd()` are now exported so that you can
    more easily extend `rd_roclet()` with your own tags that generate
    output in `.Rd` files.

    !end-bullet!
-   !begin-bullet!
    `global_options` is no longer passed to all roclet methods. Instead,
    use `roxy_meta_get()` to retrieve values stored in the options
    (#918).

    !end-bullet!
-   !begin-bullet!
    `tag_two_part()` and `tag_words()` are now simple functions, not
    function factories.

    !end-bullet!
-   !begin-bullet!
    `tag_markdown_restricted()` has been removed because it did exactly
    the same thing as `tag_markdown()`.

    !end-bullet!

!end-bullets-25!

A big thanks goes to @mikldk for starting on the vignette and motivating
me to make the extension process much more pleasant (#882).

## Bug fixes and minor improvements

!begin-bullets-26!

-   !begin-bullet!
    Empty roxygen2 lines at the start of a block are now silently
    removed (#710).

    !end-bullet!
-   !begin-bullet!
    Whitespace is automatically trimmed off the `RoxygenNote` field when
    comparing the installed version of roxygen2 to the version used to
    generate the documentation (#802).

    !end-bullet!
-   !begin-bullet!
    Files generated on Windows systems now retain their existing line
    endings, or use unix-style line endings for new files (@jonthegeek,
    @jimhester, #840).

    !end-bullet!
-   !begin-bullet!
    roxygen2 now recognises fully qualified S4 functions like
    `methods::setGeneric()`, `methods::setClass()` and
    `methods::setMethod()` (#880).

    !end-bullet!
-   !begin-bullet!
    Package documentation now converts ORCIDs into a useful link (#721).
    The package logo (if found at `man/images/logo.png`) is now scaled
    to 120px wide (@peterdesmet, #834).

    !end-bullet!
-   !begin-bullet!
    Documenting an S4 method that has a `.local()` wrapper no longer
    fails with an obscure error message (#847).

    !end-bullet!
-   !begin-bullet!
    Functions documented in `reexports` are now sorted alphabetically by
    package (#765).

    !end-bullet!
-   !begin-bullet!
    `@describeIn` can now be used with any combination of function types
    (#666, #848).

    !end-bullet!
-   !begin-bullet!
    `@description` and `@detail` tags are automatically generated from
    the leading description block, and now have correct line numbers
    (#917).

    !end-bullet!
-   !begin-bullet!
    `@example` and `@examples` are interwoven in the order in which they
    appear (#868).

    !end-bullet!
-   !begin-bullet!
    In `@examples`, escaped `'` and `"` in strings are no longer doubly
    escaped (#873).

    !end-bullet!
-   !begin-bullet!
    `@family` automatically adds `()` when linking to functions (#815),
    and print each link on its own line (to improve diffs).

    !end-bullet!
-   !begin-bullet!
    When `@inherit`ing from external documentation, `\link{foo}` links
    are automatically transformed to `\link{package}{foo}` so that they
    work in the generated documentation (#635). `\href{}` links in
    external inherited are now inserted correctly (without additional
    `{}`) (#778).

    !end-bullet!
-   !begin-bullet!
    `@inherit`ing a a function with no arguments no longer throws a
    confusing error message (#898).

    !end-bullet!
-   !begin-bullet!
    `@inheritDotParams` automatically ignores arguments that can't be
    inherited through `...` because they are used by the current
    function (@mjskay, #885).

    !end-bullet!
-   !begin-bullet!
    `@inheritDotParams` includes link to function and wraps parameters
    in `\code{}` (@halldc, #842).

    !end-bullet!
-   !begin-bullet!
    `@inheritDotParams` can be repeated to inherit dot docs from
    multiple functions (@gustavdelius, #767).

    !end-bullet!
-   !begin-bullet!
    `@inheritDotParams` avoids multiple `...` arguments (@gustavdelius,
    #857).

    !end-bullet!
-   !begin-bullet!
    `@inheritParams` ignores leading dots when comparing argument names
    (#862).

    !end-bullet!
-   !begin-bullet!
    `@inheritParams` warns if there are no parameters that require
    documentation (#836).

    !end-bullet!
-   !begin-bullet!
    `@param` containing only whitespace gives a clear warning message
    (#869).

    !end-bullet!
-   !begin-bullet!
    Multiple `@usage` statements in a single block now generate a
    warning. Previously, the first was used without a warning.

    !end-bullet!

!end-bullets-26!

# roxygen2 6.1.1

!begin-bullets-27!

-   !begin-bullet!
    Now specifically imports recent version of desc package (\>= 1.2.0)
    to fix various parsing issues (@crsh, #773, #777, #779). Multi-line
    DESCRIPTION collate directives now correctly parsed on windows
    (@brodieG, #790).

    !end-bullet!
-   !begin-bullet!
    `roxygenise()` no longer recompiles packages containing src code
    (#784).

    !end-bullet!
-   !begin-bullet!
    `roxygenise()` now stops with an informative error message when run
    in a directory that's not the package root (@mikmart, #704).

    !end-bullet!

!end-bullets-27!

# roxygen2 6.1.0

## New features

!begin-bullets-28!

-   !begin-bullet!
    The `NAMESPACE` roclet now works in two passes - it first generates
    the `NAMESPACE` containing only import directives because this can
    be generated without evaluating the code in the package. This
    alleviates a problem where it was previously possible to get into a
    state that you could only get out of by carefully editing the
    `NAMESPACE` by hand (#372).

    !end-bullet!
-   !begin-bullet!
    `@evalRd foo()` evaluates `foo()` defined in the package namespace
    and inserts the results into the current block (#645). The code
    should return a character vector with one entry for each line (and
    they should not start with `#'`).

    There are two small limitations to the current implementation:

    1.  The generated roxygen will not affect the `@md`/`@noMd` status
    2.  `@evalRd` does not work inside templates.

    !end-bullet!
-   !begin-bullet!
    `@evalNamespace` does for `NAMESPACE` what `@evalRd` does for Rd
    files: you give it R code that produces a literal entry in
    `NAMESPACE` when run. This should make it easier to export functions
    that are generated by other functions in your package (#531,
    @egnha).

    !end-bullet!
-   !begin-bullet!
    `@inherits` can now inherit examples (#588).

    !end-bullet!
-   !begin-bullet!
    `vignette("rd")` received a thorough updating for current
    best-practices. The vignette still needs more work so pull requests
    are greatly appreciated (#650).

    !end-bullet!
-   !begin-bullet!
    `roxygenise()` uses `pkgload::load_all()` instead of a home grown
    solution to simulate package loading (this is needed because
    roxygen2 uses run-time information to generate the documentation).
    This should reduce S4 related problems and ensures that
    `devtools::document()` and `roxygenise()` always have exactly the
    same behaviour (#568, #595).

    !end-bullet!
-   !begin-bullet!
    If an inherited section cannot be found, the warning contains the
    help page from which that section was requested (#732, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    roxygen2 now always reads and writes using UTF-8 encoding. If used
    with a package that does not have `Encoding: UTF-8` in the
    DESCRIPTION, you'll now get a warning (#564, #592).

    !end-bullet!

!end-bullets-28!

## Extension API

!begin-bullets-29!

-   !begin-bullet!
    Roxygen blocks now have an official structure as encoded in
    `roxy_block()`. It is a named list containing the tags with
    attributes providing other metadata.

    !end-bullet!
-   !begin-bullet!
    The `parsed` argument to `roclet_process()` have been replaced with
    separate `blocks` and `env` arguments.

    !end-bullet!
-   !begin-bullet!
    New `roclet_preprocess()` generic makes it possible for roclets to
    perform actions before code is evaluated.

    !end-bullet!
-   !begin-bullet!
    `parse_package()`, `parse_file()` and `parse_code()` provide an
    exported API that allows you to use roxygen's parsing code
    independently of creating roclets.

    !end-bullet!

!end-bullets-29!

## Minor improvements and bug fixes

!begin-bullets-30!

-   !begin-bullet!
    All tags (including `@alias`) are now de-duplicated and consistently
    sorted. This reduces spurious diffs (#586, @flying-sheep).

    !end-bullet!
-   !begin-bullet!
    `@concept` now generates one `\concept` per tag (#611).

    !end-bullet!
-   !begin-bullet!
    The default `@description` (i.e. the title) is now added much later
    in the process. That means that `@inherit description` now works
    when you have specified a title for the inheritor (#629) and the
    default description is slightly nicer when merging multiple blocks.

    !end-bullet!
-   !begin-bullet!
    `@family` automatically adds its value to concepts (#611).

    !end-bullet!
-   !begin-bullet!
    `@inherits`: The mechanism for extracting inherited Rd does a better
    job of preserving escapes (#624)

    !end-bullet!
-   !begin-bullet!
    Empty `.Rbuildignore` now handled correctly (#576).

    !end-bullet!
-   !begin-bullet!
    Stricter regular expression ensures only files ending with `.R` or
    `.r` are parsed for roxygen comments (#625).

    !end-bullet!
-   !begin-bullet!
    Objects with names starting with a dot are now by default documented
    in files with prefix 'dot-'.

    !end-bullet!
-   !begin-bullet!
    Roclets can now access global options as designed. This allows
    templates to use markdown formatting if set globally (#594).

    !end-bullet!
-   !begin-bullet!
    You can now autogenerate package documentation even if you don't
    have `Authors@R` (#606).

    !end-bullet!
-   !begin-bullet!
    Multiple given and/or family names are now supported in the
    `Authors@R` field of the DESCRIPTION file (#672, @sgibb).

    !end-bullet!
-   !begin-bullet!
    If a package logo exists (`man/figures/logo.png`) it will be
    automatically included in generated package docs (#609).

    !end-bullet!
-   !begin-bullet!
    Usage for data objects now correctly generated, avoiding double
    escaping other components of usage (#562).

    !end-bullet!
-   !begin-bullet!
    Improvements to markdown translation:

    !begin-bullets-31!
    -   !begin-bullet!
        Code in link text is now properly rendered as code (#620,
        @egnha).

        !end-bullet!
    -   !begin-bullet!
        Whitespace between words in link text is now preserved as single
        space for links of the form `[text][fcn]` and `[text](URL)`
        (#628, #754, #760, @egnha and @jennybc).

        !end-bullet!
    -   !begin-bullet!
        `%` in inline code (#640), code blocks (@nteetor, #699) and
        links (#724) is now automatically escaped.

        !end-bullet!
    -   !begin-bullet!
        Parsing of markdown links has been tweaked to reduce false
        positives (#555). If you still get a false positive, you can now
        put `\\` in front of the `[` to avoid it being converted to a
        link (#720). Links can no longer be followed by `{` to avoid
        spurious matches to Rd commands like `\Sexpr{}`.

        !end-bullet!
    -   !begin-bullet!
        Unsupported markdown features now generate a mildly helpful
        warning instead of throwing an utterly useless error (#560).

        !end-bullet!

    !end-bullets-31!
    !end-bullet!
-   !begin-bullet!
    `person()` now supports all MARC Relator role codes (#662,
    @publicus).

    !end-bullet!
-   !begin-bullet!
    `topic_add_usage()` now outputs formatted "Usage" section with max
    width of 80 characters thanks to a now more flexible `wrap_string()`
    (@JoshOBrien, #719).

    !end-bullet!

!end-bullets-30!

# roxygen2 6.0.1

!begin-bullets-32!

-   !begin-bullet!
    Allowing empty lines in .Rbuildignore. Previously, empty lines
    caused all files to be ignored. (#572, @jakob-r)

    !end-bullet!
-   !begin-bullet!
    Automatically generating a usage section for an infix function
    containing "\<-" no longer removes "\<-" from the function name
    (#554).

    !end-bullet!

!end-bullets-32!

# roxygen2 6.0.0

## Markdown

!begin-bullets-33!

-   !begin-bullet!
    Most fields can now be written using Markdown markup instead of the
    traditional Rd language. You can turn on Markdown globally by adding
    `Roxygen: list(markdown = TRUE)` to `DESCRIPTION`. The `@md` /
    `@noMd` tags turn Markdown parsing on / off for the given block. See
    `vignette("markdown")` for more details (#364, #431, #499, #506,
    #507), by @gaborcsardi
    !end-bullet!

!end-bullets-33!

## Improved inheritance

!begin-bullets-34!

-   !begin-bullet!
    New `@inheritDotParams` allows you to automatically generate
    parameter documentation for `...` for the common case where you pass
    `...` on to another function (#512). Because you often override some
    arguments, it comes with a flexible specification for argument
    selection:

    !begin-bullets-35!
    -   !begin-bullet!
        `@inheritDotParams foo` takes all parameters from `foo()`
        !end-bullet!
    -   !begin-bullet!
        `@inheritDotParams foo a b e:h` takes parameters `a`, `b`, and
        all parameters between `e` and `h`
        !end-bullet!
    -   !begin-bullet!
        `@inheritDotParams foo -x -y` takes all parameters except for
        `x` and `y`.
        !end-bullet!

    !end-bullets-35!
    The documentation generated is similar to the style used in `?plot`
    and will eventually be incorporated in to RStudio's autocomplete.

    !end-bullet!
-   !begin-bullet!
    New `@inherit` generalises `@inheritParams`, and allows to you
    inherit parameters, return, references, title, description, details,
    sections, and seealso. The default `@inherit my_fun` will inherit
    all, you can document an object entirely by specifying only the
    `@inherit` tag. Alternatively, you can select specific tags to
    inherit with `@inherit my_fun return params` (#384).

    !end-bullet!
-   !begin-bullet!
    New `@inheritSection fun title` allows you to inherit the contents
    of a single section from another topic (#513).

    !end-bullet!
-   !begin-bullet!
    `@inheritParams` now works recursively, so that you can inherit
    parameters from a function that inherited its parameters from
    somewhere else. It also better handles `\dots` as an alias for `...`
    (#504).

    !end-bullet!

!end-bullets-34!

## Minor improvements and bug fixes

### Tags

!begin-bullets-36!

-   !begin-bullet!
    `@aliases` are no longer sorted alphabetically, but instead match
    the order of their usage. This gives you more control in pkgdown.

    !end-bullet!
-   !begin-bullet!
    `@describeIn` now escapes special characters in function names
    (#450).

    !end-bullet!
-   !begin-bullet!
    `@family` see alsos are added in the same order they appear, not
    alphabetically (#315). Fixed an issue where `.`s were sometimes
    added between words within a `@family` tag (#477, @kevinushey).

    !end-bullet!
-   !begin-bullet!
    `@author` is rendered after `@seealso`.

    !end-bullet!
-   !begin-bullet!
    `@example` gives a nice warning message if you accidentally use it
    instead of `@examples` (#494). Multiple `@examples` sections are
    merged (#472, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Roxygen will no longer write out topics that don't have a name or
    title, and will instead generate a warning. This makes it easier to
    detect if you've accidentally used `@rdname` with an incorrect value
    (#474).

    !end-bullet!

!end-bullets-36!

### S3

!begin-bullets-37!

-   !begin-bullet!
    Non-primitive, internal S3 generics (e.g. 'rbind', 'cbind') are now
    properly detected as S3 generics. (#488, @kevinushey)

    !end-bullet!
-   !begin-bullet!
    Ensure that `functions` with S3 class are still treated as functions
    (#455).

    !end-bullet!
-   !begin-bullet!
    S3 method declarations via `R.methodS3::setMethodS3()` and function
    declarations via `R.oo::setConstructorS3()` are now supported
    (@HenrikBengtsson, #525).

    !end-bullet!

!end-bullets-37!

### S4

!begin-bullets-38!

-   !begin-bullet!
    You can now document `setClassUnion()`s (#514).

    !end-bullet!
-   !begin-bullet!
    The default alias for S4 method now re-adds trailing ANY signatures
    that are sometimes dropped (#460).

    !end-bullet!
-   !begin-bullet!
    Back references are now wrapped over multiple lines, if long (#493,
    @LiNk-NY).

    !end-bullet!

!end-bullets-38!

### Other

!begin-bullets-39!

-   !begin-bullet!
    `"_PACKAGE"` documentation now generates a default `@seealso`
    combining the `URL` and `BugReport` fields, and a default `@author`
    field generated from the `Authors@R` field (#527). It now works from
    `roxygenise()`; before it only worked from `devtools::document()`
    (#439, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Manually created `NAMESPACE` or documentation files are never
    overwritten, even if using `roxygen2` for the first time (@krlmlr,
    #436).

    !end-bullet!
-   !begin-bullet!
    Changes to DESCRIPTION (i.e. `Collate:` and `RoxygenNote`) now use
    the desc package. This will minimise spurious changes (#430).

    !end-bullet!
-   !begin-bullet!
    `default_data_format()` has been renamed to `object_format()`.

    !end-bullet!
-   !begin-bullet!
    New `roclet_find()` provides a more flexible way to specify roclets:
    as roclet name (e.g. "rd_roclet"), in an package
    ("foo::roclet_bar"), or with options ("foo::roclet_bar(baz =
    TRUE)").

    !end-bullet!
-   !begin-bullet!
    The usage of replacement functions uses non-breaking spaces so that
    `<-` will never get put on its own line (#484).

    !end-bullet!
-   !begin-bullet!
    Roxygen now parses nonASCII documentation correctly (as long as
    UTF-8 encoded or specified Encoding in DESCRIPTION) (#532,
    @shrektan), and ignores files listed in `.Rbuildignore` (#446,
    @fmichonneau).

    !end-bullet!

!end-bullets-39!

## Extending roxygen2

!begin-bullets-40!

-   !begin-bullet!
    Deprecated `register.preref.parser()` and
    `register.preref.parsers()` have been removed. `register_tags()` has
    also been removed in favour of a new `roclet_tags()` generic.

    !end-bullet!
-   !begin-bullet!
    `roclet()` (the constructor), `roclet_tags()`, `roclet_process()`
    `roclet_output()`, `roc_clean()` and now exported making it possible
    to create roclets in other packages. Helper functions `roxy_tag()`
    and `roxy_tag_warning()` are also exported.

    !end-bullet!
-   !begin-bullet!
    `new_roclet()` is no longer exported - use `roclet()` instead.

    !end-bullet!

!end-bullets-40!

# roxygen2 5.0.1

!begin-bullets-41!

-   !begin-bullet!
    Use `ls()`, not `names()` to list elements of environment: fixes R
    3.1.0 incompatibility (#422, @kevinushey).

    !end-bullet!
-   !begin-bullet!
    `@export` again allows trailing new line (#415).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `@noRd`, where usage would cause error (#418).

    !end-bullet!

!end-bullets-41!

# roxygen2 5.0.0

## New features

!begin-bullets-42!

-   !begin-bullet!
    Roxygen now records its version in a single place: the `RoxygenNote`
    field in the `DESCRIPTION` (#338). This will be the last time an
    roxygen2 upgrade changes every file in `man/`.

    !end-bullet!
-   !begin-bullet!
    You can now easily re-export functions that you've imported from
    another package:

    !begin-codeblock!
    ``` r
    #' @export
    magrittr::`%>%`
    ```

    !end-codeblock!
    All imported-and-re-exported functions will be documented in the
    same file (`rexports.Rd`), containing a brief description and links
    to the original documentation (#376).

    !end-bullet!
-   !begin-bullet!
    You can more easily generate package documentation by documenting
    the special string "\_PACKAGE" (@krlmlr, #349):

    !begin-codeblock!
    ``` r
    #' @details Details
    "_PACKAGE"
    ```

    !end-codeblock!
    The title and description will be automatically filled in from the
    `DESCRIPTION`.

    !end-bullet!
-   !begin-bullet!
    New tags `@rawRd` and `@rawNamespace` allow you to insert raw
    (unescaped) in Rd and the `NAMESPACE` (this is useful for
    conditional imports). `@evalRd()` is similar, but instead of literal
    Rd, you give it R code that produces literal Rd code when run. This
    should make it easier to experiment with new types of output (#385).

    !end-bullet!
-   !begin-bullet!
    roxygen2 now parses the source code files in the order specified in
    the `Collate` field in `DESCRIPTION`. This improves the ordering of
    the generated documentation when using `@describeIn` and/or
    `@rdname` split across several `.R` files, as often happens when
    working with S4 (#323, #324).

    !end-bullet!

!end-bullets-42!

## Minor features and bug fixes

!begin-bullets-43!

-   !begin-bullet!
    The contents of documented functions are now also parsed for roxygen
    comments. This allows, e.g., documenting a parameter's type close to
    where this type is checked, or documenting implementation details
    close to the source, and simplifies future extensions such as the
    documentation of R6 classes (#397, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    Data objects get a simpler default `@format` that describes only the
    object's class and dimensions. The former default, generated by
    generated by `str()`, didn't usually produce useful output and was
    quite slow. The new S3 generic `default_data_format()` generates the
    format and can be overridden to generate a custom format (#410,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    The roxygen parsers has been completely rewritten in C++ (#295).
    This gives a nice performance boost and gives:

    !begin-bullets-44!
    -   !begin-bullet!
        Better error messages: you now get the exact the line number of
        the tag, not just the start of the block.

        !end-bullet!
    -   !begin-bullet!
        The parser has been simplified a little: tags now must always
        start on a new line. This is recommended practice anyway, and it
        means that escaping inline `@` (with `@@`) is now optional.
        (#235)

        !end-bullet!
    -   !begin-bullet!
        Unknown tags now emit a warning, rather than an error.

        !end-bullet!

    !end-bullets-44!
    !end-bullet!
-   !begin-bullet!
    `@examples` no longer complains about non-matching braces inside
    strings (#329).

    !end-bullet!
-   !begin-bullet!
    `@family` now cross-links each manual page only once, instead of
    linking to all aliases (@gaborcsardi, #283, #367).

    !end-bullet!
-   !begin-bullet!
    The special `@include` parser has also been rewritten in C++, giving
    a performance boost for larger packages (#401). This is particularly
    important because it's also called from `devtools::load_all()`.
    Additionally, a space before `@include` is no longer necessary
    (@krlmlr, #342).

    !end-bullet!
-   !begin-bullet!
    `@inheritParams foo::bar` ensures that `%` remains escaped (#313).

    !end-bullet!
-   !begin-bullet!
    If you document multiple arguments with one `@param`,
    (e.g. `@param a,b,c`) each parameter will get a space after it so it
    can be wrapped in the generated Rd file (#373).

    !end-bullet!
-   !begin-bullet!
    `@section`s with identical titles are now merged together, just like
    `@description` and `@details`. This is useful in conjunction with
    the `@rdname` tag. (@krlmlr, #300).

    !end-bullet!
-   !begin-bullet!
    Automatic `@usage` is now correctly generated for functions with
    string arguments containing `"\""` (#265).

    !end-bullet!
-   !begin-bullet!
    `load_options()` is now exported so `devtools::document()` doesn't
    have to run `update_collate()` twice (#395).

    !end-bullet!
-   !begin-bullet!
    `update_collate()` only rewrites the `Collate` entry in the
    DESCRIPTION file when it changes (#325, #723).

    !end-bullet!
-   !begin-bullet!
    An empty `NAMESPACE` file is written if it is maintained by
    `roxygen2` (@krlmlr, #348).

    !end-bullet!
-   !begin-bullet!
    Data that is not lazy-loaded can be documented (@krlmlr, #390).

    !end-bullet!

!end-bullets-43!

## Internal changes

!begin-bullets-45!

-   !begin-bullet!
    `register.preref.parser()` and `register.preref.parsers()` have been
    deprecated - please use `register_tags()` instead.

    !end-bullet!
-   !begin-bullet!
    Parser callbacks registered with `register_tags()` are now called
    for fields parsed from the "introduction" (the text before the first
    tag) (@gaborcsardi, #370).

    !end-bullet!

!end-bullets-45!

# roxygen2 4.1.1

!begin-bullets-46!

-   !begin-bullet!
    Formatting of the `Authors@R` field in the DESCRIPTION file is now
    retained (@jranke, #330).

    !end-bullet!
-   !begin-bullet!
    The collate roclet falls back to `base::strwrap()` when generating
    the collate field. This makes roxygen2 compatible with the next
    version of stringr.

    !end-bullet!
-   !begin-bullet!
    New "vignette" roclet. This vignette automatically rebuilds all out
    of date vignettes (#314).

    !end-bullet!
-   !begin-bullet!
    An off-by-one error in the C++ Roxygen preparser was fixed.

    !end-bullet!
-   !begin-bullet!
    The new `@backref` tag makes it possible to override the sourceref
    for R code generators like `Rcpp` (@krlmlr, #291, #294).

    !end-bullet!

!end-bullets-46!

# roxygen2 4.1.0

!begin-bullets-47!

-   !begin-bullet!
    The source of the documentation is added to autogenerated `.Rd`
    files.

    !end-bullet!
-   !begin-bullet!
    If there are no `@include` tags, roxygen2 leaves the collate field
    alone. This makes it easier to convert an existing project that uses
    a predefined collate, but if you start with `@include` and later
    remove them, you'll need to also remove the collate field (#302,
    #303).

    !end-bullet!
-   !begin-bullet!
    Protected a `dir()` with `sort_c()` - If you'd noticed an
    inconsistency in ordering between `devtools::document()` and
    `devtools::check()` this was the cause of that.

    !end-bullet!
-   !begin-bullet!
    Fixed broken regular expression that caused problems with stringr
    1.0.0.

    !end-bullet!
-   !begin-bullet!
    The `Authors@R` field in `DESCRIPTION` is now longer
    wrapped(@krlmlr, #284).

    !end-bullet!
-   !begin-bullet!
    `@describeIn` with plain functions now correctly includes the
    function name and can be applied to data documentation. (@jimhester,
    #285, #288).

    !end-bullet!
-   !begin-bullet!
    Works again when called from `Rscript` and `methods` is not loaded
    (@krlmlr, #305).

    !end-bullet!

!end-bullets-47!

# roxygen2 4.0.2

!begin-bullets-48!

-   !begin-bullet!
    If you don't use `@exports` or other namespace directives, your
    namespace file will not be touched (#276).

    !end-bullet!
-   !begin-bullet!
    Methods no longer automatically attempt to inherit parameters from
    their generic. It's too fraught with difficulty (#261).

    !end-bullet!
-   !begin-bullet!
    Roxygen now understands what to do with `setReplaceMethod()` (#266).

    !end-bullet!
-   !begin-bullet!
    Parameter documentation is ordered according to the order of the
    formals, if possible (@krlmlr, #63).

    !end-bullet!
-   !begin-bullet!
    Export `is_s3_method()`.

    !end-bullet!
-   !begin-bullet!
    Roxygen no longer fails when run in non-UTF-8 locales on windows.

    !end-bullet!

!end-bullets-48!

# roxygen2 4.0.1

!begin-bullets-49!

-   !begin-bullet!
    Explicit `updateRoxygen()` is no longer needed - `roxygenize()` does
    the right thing the first time it is run.

    !end-bullet!
-   !begin-bullet!
    Exporting a S4 generic works (#246).

    !end-bullet!
-   !begin-bullet!
    `roxygenise()` no longer complains about absence of `wrap` field
    because it's so unlikely that anyone wants the old behaviour (#245).

    !end-bullet!

!end-bullets-49!

# roxygen2 4.0.0

roxygen2 4.0.0 is a major update to roxygen2 that makes provides
enhanced error handling and considerably safer default behaviour. Now,
roxygen2 will never overwrite a file that it did not create. This means
that before you run it for the first time, you'll need to run
`roxygen2::upgradeRoxygen()`. That will flag all existing files as being
created by roxygen2.

## New features

!begin-bullets-50!

-   !begin-bullet!
    Six vignettes provide a comprehensive overview of using roxygen2 in
    practice. Run `browseVignettes("roxygen2")` to access.

    !end-bullet!
-   !begin-bullet!
    `@describeIn` makes it easier to describe multiple functions in one
    file. This is especially useful if you want to document methods with
    their generic, or with a common class, but it's also useful if you
    want to document multiple related functions in one file (#185).

    !end-bullet!
-   !begin-bullet!
    `@field` documents the fields on a reference class (#181). It works
    the same way as `@slot` for S4 classes.

    !end-bullet!
-   !begin-bullet!
    You can now document objects defined elsewhere (like datasets) by
    documenting their name as a string (#221). For example, to document
    an dataset called `mydata`, you can do:

    !begin-codeblock!
    ``` r
    #' Mydata set
    #'
    #' Some data I collected about myself
    "mydata"
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    roxygen2 now adds a comment to all generated files so that you know
    they've been generated, and should not be hand edited.

    !end-bullet!
-   !begin-bullet!
    roxygen2 no longer wraps the text in Rd files by default, i.e. the
    default option is `wrap = FALSE` now. To override it, you have to
    specify a field `Roxygen: list(wrap = TRUE)` in `DESCRIPTION`
    (#178).

    !end-bullet!
-   !begin-bullet!
    Roxygenise automatically deletes out-of-date Rd files in `man/`.

    !end-bullet!

!end-bullets-50!

## Improved error handling

!begin-bullets-51!

-   !begin-bullet!
    roxygen2 will never overwrite a file that was not generated by
    roxygen2. This means that the first time you use this version of
    roxygen, you'll need to delete all existing Rd files. `roxygenise()`
    gains a clean argument that will automatically remove any files
    previously created by roxygen2.

    !end-bullet!
-   !begin-bullet!
    Parsing is stricter: many issues that were previously warnings are
    now errors. All errors should now give you the line number of the
    roxygen block associated with the error.

    !end-bullet!
-   !begin-bullet!
    Every input is now checked to make sure that you have matching
    braces (e.g. every `{` has a matching `}`). This should prevent
    frustrating errors that require careful reading of `.Rd` files
    (#183).

    !end-bullet!
-   !begin-bullet!
    `@section` titles and `@export` tags can now only span a single line
    to prevent common bugs.

    !end-bullet!
-   !begin-bullet!
    `@S3method` is deprecated - just use `@export` (#198).

    !end-bullet!
-   !begin-bullet!
    Namespace tags now throw parsing errors if you give them bad inputs
    (#220).

    !end-bullet!
-   !begin-bullet!
    Better error message if you try to document something other than
    NULL, an assignment, a class, a generic or a method (#194).

    !end-bullet!

!end-bullets-51!

## Bug fixes and minor improvements

!begin-bullets-52!

-   !begin-bullet!
    Better parsing of non-syntactic function names in other packages
    when used in `@inheritParams` (#236).

    !end-bullet!
-   !begin-bullet!
    Deprecated arguments to `roxygenise()` (`roxygen.dir`,
    `copy.package`, `overwrite`, `unlink.target`) removed.

    !end-bullet!
-   !begin-bullet!
    Remove unneeded codetools and tools dependencies.

    !end-bullet!
-   !begin-bullet!
    Bump required Rcpp version to 0.11.0, and remove custom makefiles.

    !end-bullet!
-   !begin-bullet!
    Non-syntactic argument names (like `_x`) are now surrounded by
    back-ticks in the usage (#191).

    !end-bullet!
-   !begin-bullet!
    The internal parsers are no longer part of the public roxygen2
    interface.

    !end-bullet!
-   !begin-bullet!
    Usage statements in generated roxygen statements non-longer contain
    non-ASCII characters and will be wrapped if long (#180).

    !end-bullet!
-   !begin-bullet!
    By default, reference classes now only document their own methods,
    not their methods of parents (#201).

    !end-bullet!
-   !begin-bullet!
    Default aliases always include the original name of the object, even
    if overridden by `@name`. This also means that `A <- setClass("A")`
    will get two aliases by default: `A` and `A-class` (#202). Use
    `@aliases NULL` to suppress default alias.

    !end-bullet!
-   !begin-bullet!
    Non-syntactic class names (like `<-`) are now escaped in the usage
    section of S4 methods (#205).

    !end-bullet!
-   !begin-bullet!
    Eliminated two more cases where wrapping occurred even when
    `wrap = FALSE`.

    !end-bullet!

!end-bullets-52!

# roxygen2 3.1.0

## Documentation for reference classes

It's now possible to document reference classes, using the "docstring"
convention described in `?setRefClass`. If you want to provide a short
paragraph description of what a method does, make the first component of
the message a string containing the description, e.g.:

!begin-codeblock!

``` r
setRefClass("A", methods = list(
  f = function(a, b) {
    "Take numbers \code{a} and \code{b} and add them together"
    a + b
  }
))
```

!end-codeblock!

Unlike the documentation for R functions, the documentation for methods
can be quite succinct.

Roxygen adopts the convention that documented methods are public, and
will be listed in the man page for the object. Undocumented methods are
private and will not be shown in the documentation. The methods for all
superclasses are also listed, so that you don't need to flip through
multiple pages of documentation to understand what you can do with an
object. All documented methods will be placed in a bulleted list in a
section titled "Methods", the method usage will be automatically
prepended to the docstring.

## Minor fixes and improvements

!begin-bullets-53!

-   !begin-bullet!
    Fixes for Rcpp 0.11.0 compatibility.

    !end-bullet!
-   !begin-bullet!
    `roxygenise()` now invisible returns a list of all files generated
    by individual roclets. This is useful for tools that want to figure
    out if there are extra files in the `man/` directory.

    !end-bullet!
-   !begin-bullet!
    `is_s3_generic()` now recognises group generics (#166).

    !end-bullet!
-   !begin-bullet!
    Don't try and add parameters for data objects (#165).

    !end-bullet!
-   !begin-bullet!
    Sort output of families using C locale (#171).

    !end-bullet!
-   !begin-bullet!
    `@family` now escapes function names in references (#172).

    !end-bullet!

!end-bullets-53!

# roxygen2 3.0.0

roxygen2 now fully supports S4 and RC (reference classes) - you should
no longer need to manually add `@alias` or `@usage` tags for S4 classes,
methods and generics, or for RC classes.

!begin-bullets-54!

-   !begin-bullet!
    The default usage definitions are much better, generating the
    correct usage for data sets (#122), S3 methods (without additional
    `@method` tag), S4 generics, S4 methods, and for replacement (#119)
    and infix functions. Backslashes in function arguments in are
    correctly escaped. Usage statements also use a more sophisticated
    line wrapping algorithm so that they should cause fewer problems
    with the R CMD check line limit. (#89, #125).

    !end-bullet!
-   !begin-bullet!
    S4 classes, S4 methods, and RC classes are given better default
    topics, and the file names corresponding to those topics are
    shorter.

    !end-bullet!
-   !begin-bullet!
    S4 methods will automatically inherit parameter documentation from
    their generic.

    !end-bullet!
-   !begin-bullet!
    `@slot name description` allows you to document the slots of a S4
    class.

    !end-bullet!

!end-bullets-54!

S3 support has also been improved: roxygen2 now figures out whether a
function is a S3 method or generic. (In the rare cases it does so
incorrectly, use `@method` to manually describe the generic and class
associated with a method). This means you can remove existing uses of
`@method`, and can replace `@S3method` with `@export`.

Roxygen now has support for package specific options through the
`Roxygen` field in the `DESCRIPTION`. The value of the field should be R
code that results in a list. Currently only `wrap` and `roclet` values
are supported:

!begin-bullets-55!

-   !begin-bullet!
    Turn off Rd re-wrapping with adding `Roxygen: list(wrap = FALSE)`

    !end-bullet!
-   !begin-bullet!
    Change the default roclets by specifying
    `Roxygen: list(roclets = c("collate", "rd"))`

    !end-bullet!

!end-bullets-55!

Roxygen 3.0 also includes a number of minor fixes and improvements:

!begin-bullets-56!

-   !begin-bullet!
    Infix functions are now escaped correctly in the `NAMESPACE`.
    (Thanks to @crowding, #111)

    !end-bullet!
-   !begin-bullet!
    `roxygenise()` now works more like `devtools::document()` and only
    ever works in the current directory. The arguments `roxygen.dir`,
    `overwrite`, `copy.package` and `unlink.target` have been deprecated
    due to potential data loss problems.

    !end-bullet!
-   !begin-bullet!
    The collate roclet is no longer a roclet: it processes R files using
    custom code (only statically, not dynamically) and is designed to be
    executed before the code is sourced. Run `update_collate()` to
    update the Collate directive based on `@include` tags - if there are
    none present, a collate directive will not be generated.

    !end-bullet!
-   !begin-bullet!
    `@useDynLib` now works with more possible specifications - if you
    include a comma in the tag value, the output will be passed as is.
    This means that `@useDynLib mypackage, .registration = TRUE` will
    now generate `useDynLib(mypackage, .registration = TRUE)` in the
    `NAMESPACE`. (#124)

    !end-bullet!
-   !begin-bullet!
    `inst` directory not created by default (#56).

    !end-bullet!
-   !begin-bullet!
    Explicitly depend on `utils` and `methods` packages to make roxygen
    compatible with `Rscript` (#72). Import `digest` package instead of
    depending on it.

    !end-bullet!
-   !begin-bullet!
    Always use C locale when sorting `NAMESPACE` file or tags in `.Rd`
    files. This ensures a consistent ordering across systems (#127).

    !end-bullet!
-   !begin-bullet!
    Templates with extension `.r` are supported on case-sensitive file
    systems (#115). Template variables now actually work (#160, thanks
    to @bronaugh).

    !end-bullet!
-   !begin-bullet!
    Suppress default aliases, format and usage with `@aliases NULL`,
    `@format NULL` and `@usage NULL`.

    !end-bullet!

!end-bullets-56!

# roxygen2 2.2.2

!begin-bullets-57!

-   !begin-bullet!
    Correctly use keyword `datasets` not `dataset` (Fixes #60)

    !end-bullet!
-   !begin-bullet!
    Reference classes no longer given incorrect docType (data).

    !end-bullet!

!end-bullets-57!

# roxygen2 2.2.1

!begin-bullets-58!

-   !begin-bullet!
    Use unicode escapes in test files so tests pass on all platforms.

    !end-bullet!
-   !begin-bullet!
    Work around bug in `gsub` in C locale by manually specifying
    `Encoding()`.

    !end-bullet!

!end-bullets-58!

# roxygen2 2.2

## New features

!begin-bullets-59!

-   !begin-bullet!
    Package docType will automatically add package alias, if needed.
    (Fixes #4)

    !end-bullet!
-   !begin-bullet!
    Data docType will automatically add `datasets` keyword, default
    usage, and default format. (Fixes #5). Data docType automatically
    added to data objects.

    !end-bullet!
-   !begin-bullet!
    New `@encoding` tag for manually setting non-ASCII encodings when
    needed. (Fixes #7)

    !end-bullet!

!end-bullets-59!

## Bug fixes

!begin-bullets-60!

-   !begin-bullet!
    `write.description()` now tries much harder to respect users'
    original DESCRIPTION field formatting instead of forcibly
    re-wrapping certain fields at 60 characters.

    !end-bullet!
-   !begin-bullet!
    `@details` and `@description` now work correctly

    !end-bullet!
-   !begin-bullet!
    `@useDynLib` now works correctly:

    !begin-codeblock!
         @useDynLib packageName routine1 routine2

    !end-codeblock!
    produces

    !begin-codeblock!
         useDynLib(packageName, routine1)
         useDynLib(packageName, routine2)

    !end-codeblock!
    in the `NAMESPACE` file, instead of separate (wrong) useDynLib
    statements as before.

    !end-bullet!
-   !begin-bullet!
    All namespace import directives now behave in the same way as the
    export directives, producing multiple single directives instead one
    multiple directive: `@importClassesFrom pkg a b` now produces
    `importClassesFrom(pkg, a)` and `importClassesFrom(pkg, b)`

    !end-bullet!
-   !begin-bullet!
    In example files included with `@example` you can now use infix
    operators (e.g. %\*%) or other things with %, because they will be
    preceded by a backslash in the Rd file. This behaviour was already
    in place for examples directly included with `@examples`.

    !end-bullet!
-   !begin-bullet!
    Aliases are no longer quoted, and % is escaped with a backslash
    (Fixes #24). Names also have % escaped (Fixes #50)

    !end-bullet!
-   !begin-bullet!
    Replacement functions (e.g. `foo<-`) now get correct usage
    statements: `foo() <- value` instead of `foo()<-value`. (Fixes #38)

    !end-bullet!
-   !begin-bullet!
    Functions with no arguments now correctly get usage statements
    (Fixes #35)

    !end-bullet!
-   !begin-bullet!
    Indentation in examples now preserved (Fixes #27)

    !end-bullet!
-   !begin-bullet!
    roxygen2 will replace characters that are not valid in filenames
    with a character substitute, e.g. `[]` becomes `sub`, `<-` becomes
    `set` (Fixes #6)

    !end-bullet!
-   !begin-bullet!
    Usage strings use non-breaking spaces to prevent string default
    values containing whitespace to be split across multiple lines. This
    may cause problems in the unlikely event that you have default value
    containing a non-breaking space (\`"`\uA0`{=tex}"') (Fixes #21)

    !end-bullet!
-   !begin-bullet!
    Functions with quoted names now get correct usage statements (Fixes
    #41)

    !end-bullet!
-   !begin-bullet!
    Objects that no longer exist are not documented (Fixes #42)

    !end-bullet!
-   !begin-bullet!
    Errors now display file name and line number of roxygen block to
    help you find the problem. Thanks to code contributions from Renaud
    Gaujoux. (Fixes #13)

    !end-bullet!
-   !begin-bullet!
    Documentation with no untagged text but with `@title`,
    `@description` and `@details` tags now produces correct output.

    !end-bullet!

!end-bullets-60!

# roxygen2 2.1

## New features

!begin-bullets-61!

-   !begin-bullet!
    package dependencies loaded automatically

    !end-bullet!
-   !begin-bullet!
    added support for the `@source` tag

    !end-bullet!

!end-bullets-61!

## Bug fixes

!begin-bullets-62!

-   !begin-bullet!
    `NAMESPACE` file no longer needs to exist

    !end-bullet!
-   !begin-bullet!
    `Collate` field in `DESCRIPTION` no longer needs to exist

    !end-bullet!
-   !begin-bullet!
    `=` now recognised as way of assigning functions

    !end-bullet!
-   !begin-bullet!
    `x$y <- function() {...}` no longer causes error

    !end-bullet!
-   !begin-bullet!
    `@example` no longer added extra new-lines.

    !end-bullet!
-   !begin-bullet!
    Correct directory normalisation under windows fixes broken test.

    !end-bullet!
-   !begin-bullet!
    A special thanks goes to Yihui Xie who contributed all of the fixes
    and improvements (bar one) in this version!

    !end-bullet!

!end-bullets-62!

# roxygen2 2.0

## Major changes

!begin-bullets-63!

-   !begin-bullet!
    now works with run-time details to give more accurate output. This
    requires that the source code that roxygen is documenting be loaded
    prior to documentation. roxygen will attempt to do so, but you need
    to ensure required packages are loaded.

    Run-time data fixes some long standing bugs where roxygen couldn't
    correctly figure out function usage. We are not aware of any cases
    where you still need to use the `@usage` tag.

    !end-bullet!
-   !begin-bullet!
    written in idiomatic R, and uses S3 instead of a homegrown class
    system.

    !end-bullet!
-   !begin-bullet!
    roclets build up an internal data structure instead of writing to
    disk directly. This means that you can now use the `@rdname` tag to
    merge documentation for multiple functions into one file, and that
    only unique namespace directives are written to `NAMESPACE` (which
    makes `@importFrom` much more useful).

    !end-bullet!
-   !begin-bullet!
    some features have been removed, and may or may not (based on your
    feedback) be reincluded. These include the callgraph roclet, and
    `R CMD roxygen`, which only worked on some systems.

    !end-bullet!
-   !begin-bullet!
    a templating system: use the `@template` tag to insert a `brew`
    template stored in `man-roxygen`. Template variables can be set
    using `@templateVar   name value` and retrieved from within the
    template with `<%= name %>`

    !end-bullet!
-   !begin-bullet!
    extensive use of caching to make repeated runs as fast as possible.
    To clear caches and guarantee a complete rebuild, use
    `clear_caches()`.

    !end-bullet!
-   !begin-bullet!
    parsing of "introduction" (the text before the first tag) has
    changed. Now the title consists of the first paragraph (i.e. all
    text before the first empty line), the second paragraph is the
    description and all others are put in the details. Any component can
    be overridden with `@title`, `@description` and `@details` as
    appropriate.

    !end-bullet!

!end-bullets-63!

## Minor changes

!begin-bullets-64!

-   !begin-bullet!
    `@name` is always output as an alias, even if `@aliases` are used.

    !end-bullet!
-   !begin-bullet!
    `@export` correctly uses `@method` to generate `S3method` namespace
    directive

    !end-bullet!

!end-bullets-64!

## New tags

!begin-bullets-65!

-   !begin-bullet!
    `@rdname filename` sets the output filename (without extension). Use
    for functions non-alphanumeric functions (e.g. `[<-`) or if you want
    to document multiple functions in one file

    !end-bullet!
-   !begin-bullet!
    `@template templatename` includes a documentation template (see
    above)

    !end-bullet!
-   !begin-bullet!
    `@section Section title: contents` includes a section with any
    title. Don't forget the colon! That separates the title of the
    section from its contents.

    !end-bullet!
-   !begin-bullet!
    `@description` and `@details` tags allow you to specify description
    and details components in a template

    !end-bullet!
-   !begin-bullet!
    `@family family name` automatically adds see-also cross-references
    between all functions in a family. A function can belong to multiple
    families.

    !end-bullet!
-   !begin-bullet!
    `@inheritParams name` allows you to inherit the documentation for
    parameters from another function, either within the current package
    (`function`) or in any other installed package (`package:function`).
    Currently only supports single inheritance (i.e. you can't inherit
    from a function that inherits from another function), but you can
    have multiple @inheritParams tags.

    !end-bullet!
-   !begin-bullet!
    `@format` has been implemented; it existed in the roxygen package
    but was actually ignored

    !end-bullet!

!end-bullets-65!

# reprex (development version)

!begin-bullet!

The unexported `prex_*()` functions protect the current session from
option changes coming from reprex's own machinery, such as disabling
color (#427).

!end-bullet!

# reprex 2.0.2

!begin-bullets-1!

-   !begin-bullet!
    The ad placed by `reprex(advertise = TRUE)` has been tweaked for
    `venue = "gh"` (and, therefore, for its aliases `"so"` and `"ds"`)
    and `venue = "slack"` (#395).

    !end-bullet!
-   !begin-bullet!
    reprex takes advantage of rlang 1.0.0's improved [support for
    backtraces in knitted
    documents](https://rlang.r-lib.org/reference/rlang_backtrace_on_error.html#errors-in-rmarkdown)
    and sets the option `rlang_backtrace_on_error_report = "full"`
    (#377).

    !end-bullet!
-   !begin-bullet!
    `reprex_rtf()` (a shortcut for `reprex(venue = "rtf")`) now works on
    Windows, even if one of the (possibly temporary) filepaths contains
    a space, e.g. because the username contains a space (#409, @cderv).

    !end-bullet!
-   !begin-bullet!
    The RStudio addin no longer displays a warning about condition
    length when selecting 'current file' as the reprex source (#391,
    @bisaloo).

    !end-bullet!
-   !begin-bullet!
    Internal matters:

    !end-bullet!
    !begin-bullets-2!
    -   !begin-bullet!
        Help files below `man/` have been re-generated, so that they
        give rise to valid HTML5. (This is the impetus for this release,
        to keep the package safely on CRAN.)
        !end-bullet!
    -   !begin-bullet!
        reprex's condition signalling has been updated to use the
        current approaches provided by the cli, rlang, and lifecycle
        packages.
        !end-bullet!

    !end-bullets-2!

!end-bullets-1!

# reprex 2.0.1

!begin-bullet!

`reprex_document()` has been adjusted for compatibility with changes
introduced in Pandoc 2.13 around YAML headers (#375, #383 @cderv).

!end-bullet!

!begin-bullet!

`reprex_rtf()` (and the unexported `prex_rtf()`) work again. One of the
filepaths involved in the highlight call was broken, but now it's not
(#379).

!end-bullet!

!begin-bullet!

The unexported `prex_*()` functions once again write their files to a
temporary directory, as opposed to current working directory (#380).

!end-bullet!

# reprex 2.0.0

## When the clipboard isn't available

!begin-bullet!

We've made reprex more pleasant to use in settings where we cannot
access the user's clipboard from R. Specifically, this applies to use on
RStudio Server and RStudio Cloud.

!end-bullet!

!begin-bullets-3!

-   !begin-bullet!
    When `reprex()` is called without `expr` or `input`, in a context
    where the user's clipboard can't be reached from R, the default is
    now to consult the current selection for reprex source. Previously
    this was only available via the `reprex_selection()` addin. Note
    that this "current selection" default behaviour propagates to
    convenience wrappers around `reprex()`, such as `reprex_locale()`
    and venue-specific functions like `reprex_r()`, and to the
    un-`reprex()` functions, such as `reprex_clean()`.
    !end-bullet!
-   !begin-bullet!
    In this context, the file containing the (un)rendered reprex is
    opened so the user can manually copy its contents.
    !end-bullet!

!end-bullets-3!

## Filepaths

!begin-bullet!

`wd` is a new argument to set the reprex working directory. As a result,
the `outfile` argument is deprecated and the `input` argument has new
significance. Here's how to use `input` and `wd` to control reprex
filepaths:

!end-bullet!

!begin-bullets-4!

-   !begin-bullet!
    To reprex in the current working directory,\
    Previously: `reprex(outfile = NA)`\
    Now: `reprex(wd = ".")`\
    More generally, usage looks like
    `reprex(wd = "path/to/desired/wd")`.
    !end-bullet!
-   !begin-bullet!
    If you really care about reprex filename (and location), write your
    source to `path/to/stuff.R` and call
    `reprex(input = "path/to/stuff.R")`. When `input` is a filepath,
    that filepath determines the working directory and how reprex files
    are named and `wd` is never even consulted.
    !end-bullet!

!end-bullets-4!

!begin-bullet!

Various changes mean that more users will see reprex filepaths.
Therefore, we've revised them to be more self-explanatory and
human-friendly. When reprex needs to invent a file name, it is now based
on a random "adjective-animal" slug. Bring on the `angry-hamster`!

!end-bullet!

## `.Rprofile`

!begin-bullet!

`reprex()` renders the reprex in a separate, fresh R session using
`callr::r()`. As of callr 3.4.0 (released 2019-12-09), the default
became `callr::r(..., user_profile = "project")`, which means that callr
executes a `.Rprofile` found in current working directory. Most reprexes
happen in a temp directory and there will be no such `.Rprofile`. But if
the user intentionally reprexes in an existing project with a
`.Rprofile`, `callr::r()` and therefore `reprex()` honor it. In this
version of reprex:

!end-bullet!

!begin-bullets-5!

-   !begin-bullet!
    We explicitly make sure that the working directory of the
    `callr::r()` call is the same as the effective working directory of
    the reprex.
    !end-bullet!
-   !begin-bullet!
    We alert the user that a local `.Rprofile` has been found.
    !end-bullet!
-   !begin-bullet!
    We indicate the usage of a local `.Rprofile` in the rendered reprex.
    !end-bullet!

!end-bullets-5!

!begin-bullet!

These changes are of special interest to users of the [renv
package](https://rstudio.github.io/renv/), which uses `.Rprofile` to
implement a project-specific R package library. Combined with the
filepath changes (described above), this means an renv user can call
`reprex(wd = ".")`, to render a reprex with respect to a
project-specific library.

!end-bullet!

## Other

!begin-bullet!

HTML preview should work better with more ways of using
`reprex_render()`, i.e. usage that doesn't come via a call to `reprex()`
(#293).

!end-bullet!

## Dependency changes

!begin-bullets-6!

-   !begin-bullet!
    rstudioapi moves from Suggests to Imports. Related to improving the
    experience when reprex cannot access the user's clipboard.

    !end-bullet!
-   !begin-bullet!
    mockr is new in Suggests; it's used in the tests.

    !end-bullet!
-   !begin-bullet!
    We bumped the documented minimum version of Pandoc, because we use
    the `gfm` markdown variant to get GitHub-Flavored Markdown. The
    `gfm` variant was introduced in Pandoc 2.0 (released 2017-10-29).

    !end-bullet!

!end-bullets-6!

# reprex 1.0.0

## Venues

!begin-bullets-7!

-   !begin-bullet!
    `reprex_VENUE(...)` is a new way to call
    `reprex(..., venue = "VENUE")`. For example, `reprex_r()` is
    equivalent to `reprex(venue = "r")`. This makes non-default venues
    easier to access via auto-completion (#256).

    !end-bullet!
-   !begin-bullet!
    `"slack"` is a new venue that tweaks the default Markdown output for
    pasting into Slack messages. It removes the `r` language identifier
    from the opening code fence, simplifies image links and, by default,
    suppresses the ad. Note that `venue = "slack"` or `reprex_slack()`
    work best for people who opt-out of the WYSIWYG message editor: in
    *Preferences \> Advanced*, select "Format messages with markup".

    !end-bullet!
-   !begin-bullet!
    `venue = "so"` (SO = Stack Overflow) has converged with default
    `venue = "gh"` (GitHub). As of January 2019, SO [supports CommonMark
    fenced code
    blocks](https://meta.stackexchange.com/questions/125148/implement-style-fenced-markdown-code-blocks/322000#322000).
    The only remaining difference is that Stack Overflow does not
    support the collapsible details tag that we use on GitHub to reduce
    the clutter from, e.g., session info (#231).

    !end-bullet!
-   !begin-bullet!
    `"rtf"` (Rich Text Format) is a new experimental `venue` for pasting
    into applications like PowerPoint and Keynote. It is experimental
    because it requires a working installation of the highlight command
    line tool, which is left as a somewhat fiddly exercise for the user
    (#331). `venue = "rtf"` is documented in its [own
    article](https://reprex.tidyverse.org/articles/articles/rtf.html).

    !end-bullet!
-   !begin-bullet!
    `reprex.current_venue` is a new read-only option that is set during
    `reprex_render()`. Other packages can use it to generate
    `reprex()`-compatible, `venue`-aware output, such as an renv
    lockfile.

    !end-bullet!

!end-bullets-7!

## Implementation and internals

!begin-bullets-8!

-   !begin-bullet!
    `reprex()` has been internally refactored to make better use of the
    official machinery for extending rmarkdown:

    !end-bullet!
    !begin-bullets-9!
    -   !begin-bullet!
        `reprex_document()` is a new R Markdown output format.
        !end-bullet!
    -   !begin-bullet!
        `reprex_render()` is a newly exported function.
        !end-bullet!
    -   !begin-bullet!
        A `reprex_document()` is designed to be rendered with
        `reprex_render()`. `reprex_render()` is designed to act on a
        `reprex_document()`. This is (still) the heart of what the
        `reprex()` function does, in addition to various interface and
        workflow niceties.
        !end-bullet!
    -   !begin-bullet!
        Two R Markdown templates ship with the package, which an RStudio
        user can access via *File \> New File \> R Markdown ... \> From
        Template*. One is minimal; the other uses lots of reprex
        features. Both include `knit: reprex::reprex_render` in the
        YAML, which causes the RStudio "Knit" button to use
        `reprex_render()`.
        !end-bullet!

    !end-bullets-9!
-   !begin-bullet!
    `prex()`, `prex_VENUE()`, and `prex_render()` are new **unexported**
    functions that, like `reprex()`, render a small bit of code, but
    with much less **re**producibility! The code is evaluated in the
    global workspace of the current process, with the current working
    directory. This pragmatic hack is useful when preparing a series of
    related snippets, e.g., for a Keynote or PowerPoint presentation,
    and there's not enough space to make each one self-contained.

    !end-bullet!
-   !begin-bullet!
    UTF-8 encoding: Following the lead of knitr, reprex makes explicit
    use of UTF-8 internally (#237 @krlmlr, #261).

    !end-bullet!
-   !begin-bullet!
    When the reprex causes R to crash, `reprex(std_out_err = TRUE)` is
    able to provide more information about the crash, in some cases
    (#312).

    !end-bullet!

!end-bullets-8!

## Other changes and improvements

!begin-bullets-10!

-   !begin-bullet!
    The `tidyverse_quiet` argument and `reprex.tidyverse_quiet` option
    also control startup messages from the
    [tidymodels](https://www.tidymodels.org) meta-package (#326,
    @juliasilge).

    !end-bullet!
-   !begin-bullet!
    `reprex_locale()` is a new thin wrapper around `reprex()` that
    renders in a temporarily-altered locale (#250).

    !end-bullet!
-   !begin-bullet!
    The `si` argument of `reprex()` is now `session_info`. Being
    explicit seems more important than saving characters, given
    auto-completion.

    !end-bullet!
-   !begin-bullet!
    The `show` argument of `reprex()` is now `html_preview`, for the
    sake of consistency with other R Markdown output formats.

    !end-bullet!
-   !begin-bullet!
    New article on techniques for making package startup quieter (#187,
    @marionlouveaux).

    !end-bullet!

!end-bullets-10!

## Dependency changes

!begin-bullet!

R 3.1 and R 3.2 are no longer explicitly supported or tested. Our
general practice is to support the current release (4.0, at time of
writing), devel, and the 4 previous versions of R (3.6, 3.5, 3.4, 3.3).

!end-bullet!

!begin-bullets-11!

-   !begin-bullet!
    sessioninfo is new in Suggests, replacing devtools.

    !end-bullet!
-   !begin-bullet!
    glue is new in Imports, replacing whisker.

    !end-bullet!
-   !begin-bullet!
    knitr moves from Suggests to Imports (although it was already a hard
    dependency via rmarkdown), so we can require v1.23 or higher, which
    represents a major switch to UTF-8.

    !end-bullet!
-   !begin-bullet!
    cli is new in Imports.

    !end-bullet!
-   !begin-bullet!
    reprex now relies on testthat \>= 3.0.0 and, specifically, uses
    third edition features.

    !end-bullet!

!end-bullets-11!

# reprex 0.3.0

!begin-bullets-12!

-   !begin-bullet!
    The `crayon.enabled` option is explicitly set to `FALSE` when
    rendering the reprex (#238, #239).

    !end-bullet!
-   !begin-bullet!
    Expression input is once again captured via `substitute()` (as
    opposed to `rlang::enexpr()`), which is more favorable for reprexes
    involving tidy eval (#241).

    !end-bullet!
-   !begin-bullet!
    New venue "html" to render HTML fragments, useful for pasting in
    sites without markdown but that allow HTML (#236 @cwickham).

    !end-bullet!
-   !begin-bullet!
    The YAML of reprex's template has been updated in light of the
    stricter YAML parser used in Pandoc \>= 2.2.2.

    !end-bullet!
-   !begin-bullet!
    `rlang::set_attrs()` has been soft-deprecated and is no longer used
    internally.

    !end-bullet!

!end-bullets-12!

# reprex 0.2.1

!begin-bullets-13!

-   !begin-bullet!
    The reprex ad is formatted as superscript for `venue = "gh"` and
    `venue = "so"`, i.e. it is more subtle (#201).

    !end-bullet!
-   !begin-bullet!
    New experimental venue "rtf" produces syntax highlighted snippets
    suitable for pasting into presentation software such as Keynote or
    PowerPoint. This venue is discussed in [an
    article](https://reprex.tidyverse.org/articles/articles/rtf.html)
    (#26).

    !end-bullet!
-   !begin-bullet!
    Arguments `opts_chunk` and `opts_knit` have been removed from
    `reprex()`. The same effect has always been achievable via roxygen
    comments in the reprex code and the examples have always
    demonstrated this. Overriding knitr options doesn't seem to come up
    often enough in real-world `reprex()` usage to justify these
    arguments.

    !end-bullet!
-   !begin-bullet!
    Internal file system operations use the [fs](https://fs.r-lib.org)
    package. This should not make any user-facing changes in reprex and
    we definitely want to know if it does.

    !end-bullet!

!end-bullets-13!

# reprex 0.2.0

!begin-bullet!

reprex has a website: <https://reprex.tidyverse.org>. It includes a
contributed article from @njtierney (#103).

!end-bullet!

!begin-bullet!

reprex has moved to the [tidyverse
Organization](https://github.com/tidyverse). It is installed as part of
the [tidyverse meta-package](https://www.tidyverse.org) and is
[suggested to those seeking help](https://www.tidyverse.org/help/).

!end-bullet!

!begin-bullet!

`reprex()` gains several arguments and many arguments can now be
controlled via an option, in case a user wants their own defaults.

!end-bullet!

!begin-bullet!

The new `reprex_selection()` add-in reprexes the current selection, with
venue controlled by the option `reprex.venue`. It can be handy to bind
to a keyboard shortcut (#84 @hadley).

!end-bullet!

!begin-bullet!

If reprex can't write to the user's clipboard (e.g. on RStudio server or
Unix-like systems lacking xclip or xsel), it offers to open the output
file for manual copy.

!end-bullet!

## Option-controlled arguments for custom defaults

!begin-bullet!

These look like `reprex(..., arg = opt(DEFAULT), ...)` in the help file.
This is shorthand for `arg = getOption("reprex.arg", DEFAULT)`, i.e. the
option `reprex.arg` is consulted and, if unset, the documented default
is used. Allows user to define their own default behaviour (#116).

!end-bullet!

## New arguments to `reprex()`:

!begin-bullets-14!

-   !begin-bullet!
    `advertise`: toggles inclusion of a footer that describes when and
    how the reprex was created, e.g., "Created on 2017-11-16 by the
    reprex package (v0.1.1.9000)". Defaults to `TRUE` (#121, #69).
    !end-bullet!
-   !begin-bullet!
    `style`: requests code restyling via the newly-Suggested styler
    package. styler can cope with tidyeval syntactical sugar,
    e.g. `df %>% group_by(!! group_var)`. Defaults to `FALSE` (#108,
    #94).
    !end-bullet!
-   !begin-bullet!
    `tidyverse_quiet`: affords control of the startup message of the
    tidyverse meta-package. Defaults to `TRUE`, i.e. suppresses the
    message (important special case of #70, #100).
    !end-bullet!
-   !begin-bullet!
    `std_out_err`: appends output sent to stdout and stderr by the
    reprex rendering process. This can be necessary to reveal output if
    the reprex spawns child processes or has `system()` calls. Defaults
    to `FALSE` (#90, #110).
    !end-bullet!
-   !begin-bullet!
    `render`: determines if the reprex is actually rendered or just
    returns after producing the templated `.R` file. For internal
    testing.
    !end-bullet!

!end-bullets-14!

## Venues

!begin-bullets-15!

-   !begin-bullet!
    Line wrapping is preserved from source via a Pandoc option (#145
    @jimhester, #175).

    !end-bullet!
-   !begin-bullet!
    `venue = "gh"` now targets CommonMark as the standard for GitHub
    Flavored Markdown (#77).

    !end-bullet!
-   !begin-bullet!
    `venue = "so"` has appropriate whitespace at the start.

    !end-bullet!
-   !begin-bullet!
    `venue = "ds"` is a new value, corresponding to
    <https://www.discourse.org>, which is the platform behind
    [community.rstudio.com](https://community.rstudio.com). This is
    currently just an alias for the default `"gh"` GitHub venue, because
    the formatting appears to be compatible. Adding the `"ds"` value so
    Discourse can be documented and to guard against the possibility
    that some formatting is actually unique.

    !end-bullet!

!end-bullets-15!

## Other changes

!begin-bullets-16!

-   !begin-bullet!
    The `keep.source` option is set to `TRUE` when rendering the reprex,
    so reprexes involving srcrefs should work (#152).

    !end-bullet!
-   !begin-bullet!
    The "undo" functions (`reprex_invert()`, `reprex_clean()`,
    `reprex_rescue()`) handle `input` and `outfile` like `reprex()`
    does. The `outfile` argument is new (#129, #68).

    !end-bullet!
-   !begin-bullet!
    The default value for knitr's `upload.fun` is now set according to
    the venue. It is `knitr::imgur_upload()` for all venues except
    `"r"`, where it is `identity` (#125).

    !end-bullet!
-   !begin-bullet!
    The HTML preview should appear in the RStudio Viewer more
    consistently, especially on Windows (#75 @yutannihilation).

    !end-bullet!
-   !begin-bullet!
    More rigorous use of UTF-8 encoding (#76 @yutannihilation).

    !end-bullet!
-   !begin-bullet!
    Expression input handling has been refactored. As a result, formatR
    is no longer Suggested. Trailing comments -- inline and on their own
    line -- are also now retained (#89, #91, #114, @jennybc and
    @jimhester).

    !end-bullet!
-   !begin-bullet!
    Custom prompts are now escaped when used in regexes (#98, #99
    @jimhester). Embedded newlines are now escaped.

    !end-bullet!

!end-bullets-16!

# reprex 0.1.2

!begin-bullet!

This was a non-functioning release created by CRAN maintainers by
commenting out lines of code relating to the clipboard.

!end-bullet!

# reprex 0.1.1

!begin-bullets-17!

-   !begin-bullet!
    Pandoc added to SystemRequirements.
    !end-bullet!

!end-bullets-17!

# reprex 0.1.0

!begin-bullets-18!

-   !begin-bullet!
    `outfile = NA` causes outfiles to be left in working directory.
    Filenames will be based on the `input` file, if there was one.

    !end-bullet!
-   !begin-bullet!
    `reprex()` strips any leading prompts from input code.

    !end-bullet!
-   !begin-bullet!
    Added functions `reprex_clean()`, `reprex_invert()`, and
    `reprex_rescue()` in order to go backwards, i.e. recover source from
    a wild-caught reprex.

    !end-bullet!
-   !begin-bullet!
    `venue = "R"` (or `"r"`) can be used to get an R script back,
    augmented with commented output.

    !end-bullet!
-   !begin-bullet!
    `comment` argument added to specify prefix for commented output.

    !end-bullet!
-   !begin-bullet!
    Added an RStudio addin, accessed via "Render reprex".

    !end-bullet!
-   !begin-bullet!
    `input` argument to `reprex()` and friends handles code as string,
    character vector, or file path.

    !end-bullet!
-   !begin-bullet!
    The reprex is rendered via `callr::r_safe()` and is thus run in a
    clean, separate R process, eliminating any leakage of objects or
    loaded packages to/from the calling session.

    !end-bullet!
-   !begin-bullet!
    `reprex()` gains optional arguments `opts_chunk` and `opts_knit`,
    taking named list as input, in order to supplement or override
    default knitr chunk and package options, respectively. (#33)

    !end-bullet!
    !begin-bullets-19!
    -   !begin-bullet!
        This made the explicit `upload.fun` argument unnecessary, so
        it's gone. The `upload.fun` option defaults to
        `knitr::imgur_upload`, which means figures produced by the
        reprex will be uploaded to [imgur.com](https://imgur.com/) and
        the associated image syntax will be put into the Markdown,
        e.g. `![](https://i.imgur.com/QPU5Cg9.png)`. (#15 @paternogbc)
        !end-bullet!

    !end-bullets-19!
-   !begin-bullet!
    Order of `reprex()` arguments has changed.

    !end-bullet!
-   !begin-bullet!
    `reprex()` gains the `si` argument to request that
    `devtools::session_info()` or `sessionInfo()` be appended to reprex
    code (#6 @dgrtwo). When `si = TRUE` and `venue = "gh"` (the
    default), session info is wrapped in a collapsible details tag. See
    [an example](https://github.com/tidyverse/reprex/issues/55) (#55).

    !end-bullet!
-   !begin-bullet!
    Reprex code can be provided as an R expression. (#6 @dgrtwo, #35)

    !end-bullet!
-   !begin-bullet!
    `reprex()` uses clipboard functionality from
    [`clipr`](https://CRAN.R-project.org/package=clipr) and thus should
    work on Windows and suitably prepared Unix-like systems, in addition
    to Mac OS. (#16 @mdlincoln)

    !end-bullet!

!end-bullets-18!

# reprex 0.0.0.9000

!begin-bullets-20!

-   !begin-bullet!
    I tweeted about this and some people actually used it!
    !end-bullet!

!end-bullets-20!

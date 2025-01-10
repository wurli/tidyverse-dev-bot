# cli (development version)

!begin-bullets-1!

-   !begin-bullet!
    The URI generated for `.file`, `.run`, `.help` and `.vignette`
    hyperlinks can now be configured via options and env vars (@jennybc,
    #739, #744).

    !end-bullet!
-   !begin-bullet!
    `cli_progress_bar()` now accepts `total` = Inf or -Inf which mimics
    the behavior of when `total` is NA.

    !end-bullet!
-   !begin-bullet!
    `num_ansi_colors()` now does not warn in Emacs if the `INSIDE_EMACS`
    environment variable is not a proper version number (@rundel, #689).

    !end-bullet!
-   !begin-bullet!
    `ansi_collapse()` and inline collapsing now uses `last` as the
    separator (without the serial comma) for two-element vectors if
    `sep2` is not given (@rundel, #681).

    !end-bullet!
-   !begin-bullet!
    `ansi_collapse()` is now correct for length-1 vectors with style
    "head" if width is specified (@rundel, #590).

    !end-bullet!
-   !begin-bullet!
    New `hash_xxhash()` etc. functions to calculate the xxHash of
    strings, raw vectors, objects, files.

    !end-bullet!

!end-bullets-1!

# cli 3.6.3

!begin-bullets-2!

-   !begin-bullet!
    cli now builds on ARM Windows.

    !end-bullet!
-   !begin-bullet!
    "Solarized Dark" is now the default syntax highlighting theme in
    terminals.

    !end-bullet!
-   !begin-bullet!
    The `{.obj_type_friendly}` inline style now only shows the first
    class name (#669 @olivroy).

    !end-bullet!
-   !begin-bullet!
    Syntax highlighting now does not fail in RStudio if the rstudioapi
    package is not installed (#697).

    !end-bullet!

!end-bullets-2!

# cli 3.6.2

!begin-bullets-3!

-   !begin-bullet!
    `ansi_collapse(x, trunc = 1, style = "head")` now indeed shows one
    element if `length(x) == 2`, as documented (@salim-b, #572).

    !end-bullet!
-   !begin-bullet!
    `ansi_collapse()` gains a `sep2` argument to specify a seperate
    separator for length-two inputs. It defaults to `" and "` which, in
    conjunction with the other defaults, produces a collapsed string
    that fully adheres to the serial comma rules. (@salim-b, #569)

    !end-bullet!
-   !begin-bullet!
    `ansi_string()` is now an exported function (@multimeric, #573).

    !end-bullet!

!end-bullets-3!

# cli 3.6.1

!begin-bullets-4!

-   !begin-bullet!
    ANSI hyperlinks are now turned off on the RStudio render plane
    (#581).
    !end-bullet!

!end-bullets-4!

# cli 3.6.0

!begin-bullets-5!

-   !begin-bullet!
    The progressr progress handler now reports progress correctly
    (@HenrikBengtsson, #558).

    !end-bullet!
-   !begin-bullet!
    New `hash_*sha1()` functions to calculate the SHA-1 hash of strings,
    objects, files.

    !end-bullet!
-   !begin-bullet!
    cli now shows progress bars after one second by default, if they are
    less than half way at the point. (Or after two seconds,
    unconditionally, as before.) See the the `cli.progress_show_after`
    option in `?cli-config` for details (#542).

    !end-bullet!
-   !begin-bullet!
    `format_inline()` now has a new argument `keep_whitespace`, and it
    keeps whitespace, including newline and form feed characters by
    default.

    !end-bullet!

!end-bullets-5!

# cli 3.5.0

!begin-bullets-6!

-   !begin-bullet!
    New `keypress()` function to read a single key press from a
    terminal.

    !end-bullet!
-   !begin-bullet!
    New function `pretty_print_code()` to print function objects with
    syntax highlighting at the R console.

    !end-bullet!
-   !begin-bullet!
    `col_*` and `bg_*` functions how handle zero-length input correctly
    (#532).

    !end-bullet!
-   !begin-bullet!
    New function `ansi_collapse()` to collapse character vectors into a
    single string.

    !end-bullet!
-   !begin-bullet!
    `ansi_strtrim()` now handles some edge cases better, when `ellipsis`
    has length zero, and when it is wider than `width`.

    !end-bullet!
-   !begin-bullet!
    New `hash_file_md5()` function to calculate the MD5 hash of one or
    more files.

    !end-bullet!

!end-bullets-6!

# cli 3.4.1

!begin-bullets-7!

-   !begin-bullet!
    cli has better error messages now.

    !end-bullet!
-   !begin-bullet!
    New `format_inline()` argument: `collapse`, to collapse multi-line
    output, potentially because of `\f` characters.

    !end-bullet!

!end-bullets-7!

# cli 3.4.0

!begin-bullets-8!

-   !begin-bullet!
    New experimental styles to create ANSI hyperlinks in RStudio and
    terminals that support them. See `?cli::links` for details (#513).

    !end-bullet!
-   !begin-bullet!
    Expressions that start and end with a `{}` substitution are now
    styled correctly. E.g. `{.code {var1} + {var2}}` (#517).

    !end-bullet!
-   !begin-bullet!
    New `{.obj_type_friendly}` inline style to format the type of an R
    object in a user friendly way (#463).

    !end-bullet!
-   !begin-bullet!
    Improved vector collapsing behavior. cli now shows both the
    beginning and end of the collapsed vector, by default (#419).

    !end-bullet!
-   !begin-bullet!
    Nested `cli()` calls work now (#497).

    !end-bullet!
-   !begin-bullet!
    Return values now work as they should within `cli()` calls (#496).

    !end-bullet!
-   !begin-bullet!
    Style attributes with underscores have new names with dashes
    instead: `vec_sep`, `vec_last`, `vec_trunc`, `string-quote`. The old
    names still work, but the new ones take precedence (#483).

    !end-bullet!
-   !begin-bullet!
    cli now does not crash at the end of the R session on Arm Windows
    (#494; @kevinushey)

    !end-bullet!
-   !begin-bullet!
    Vectors are truncated at 20 elements now by default, instead of 100
    (#430).

    !end-bullet!
-   !begin-bullet!
    20 new spinners from the awesome cli-spinners package, and from
    @HenrikBengtsson in #469. Run this to demo them, some need UTF-8 and
    emoji support:

    !begin-codeblock!
    ``` r
    new <- c("dots13", "dots8Bit", "sand", "material", "weather", "christmas",
      "grenade", "point", "layer", "betaWave", "fingerDance", "fistBump",
      "soccerHeader", "mindblown", "speaker", "orangePulse", "bluePulse",
      "orangeBluePulse", "timeTravel", "aesthetic", "growVeriticalDotsLR",
      "growVeriticalDotsRL", "growVeriticalDotsLL", "growVeriticalDotsRR")
    demo_spinners(new)
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    cli exit handlers are now compatible again with the withr package
    (#437).

    !end-bullet!
-   !begin-bullet!
    cli functions now keep trailing `\f` characters as newlines. They
    also keep multiple consecutive `\f` as multiple newlinees (#491).

    !end-bullet!
-   !begin-bullet!
    `{}` substitutions within inline styles are now formatted correctly.
    E.g. `{.code download({url})}` will not add backticks to `url`, and
    `{.val pre-{x}-post}` will format the whole value instead of `x`.
    (#422, #474).

    !end-bullet!
-   !begin-bullet!
    cli now replaces newline characters within `{.class ... }` inline
    styles with spaces. If the `cli.warn_inline_newlines` option is set
    to TRUE, then it also throws a warning. (#417).

    !end-bullet!
-   !begin-bullet!
    `code_highlight` now falls back to the default theme (instead of no
    theme) for unknown RStudio themes (#482, @rossellhayes).

    !end-bullet!
-   !begin-bullet!
    `cli_abort()` now supplies `.frame` to `abort()`. This fixes an
    issue with the `.internal = TRUE` argument (r-lib/rlang#1386).

    !end-bullet!
-   !begin-bullet!
    cli now does a better job at detecting the RStudio build pane, job
    pane and render pane, and their capabilities w.r.t. ANSI colors and
    hyperlinks. Note that this requires a daily build of RStudio (#465).

    !end-bullet!
-   !begin-bullet!
    New functions for ANSI strings: `ansi_grep()`, `ansi_grepl()`,
    `ansi_nzchar()`. They work like the corresponding base R functions,
    but handle ANSI markup.

    !end-bullet!
-   !begin-bullet!
    `style_hyperlink()` (really) no longer breaks if the env variable
    `VTE_VERSION` is of the form `\d{4}`, i.e., 4 consecutive numbers
    (#441, @michaelchirico)

    !end-bullet!
-   !begin-bullet!
    `cli_dl()` and its corresponding `cli_li()` can now style the
    labels.

    !end-bullet!
-   !begin-bullet!
    The behavior cli's inline styling expressions is now more
    predictable. cli does not try to evaluate a styled string as an R
    expression any more. E.g. the meaning of `"{.emph +1}"` is now
    always the "+1", with style `.emph`, even if an `.emph` variable is
    available and the `.emph + 1` expression can be evaluated.

    !end-bullet!
-   !begin-bullet!
    Functions that apply bright background colors
    (e.g. `bg_br_yellow()`) now close themselves. They no longer format
    text after the end of the function (#484, @rossellhayes).

    !end-bullet!

!end-bullets-8!

# cli 3.3.0

!begin-bullets-9!

-   !begin-bullet!
    `style_hyperlink()` no longer breaks if the env variable
    `VTE_VERSION` is of the form `\d{4}`, i.e., 4 consecutive numbers
    (#441, @michaelchirico)

    !end-bullet!
-   !begin-bullet!
    `ansi_*()` functions support ANSI hyperlinks again (#444).

    !end-bullet!
-   !begin-bullet!
    Turning off ANSI colors via the `cli.num_colors` option or the
    `R_CLI_NUM_COLORS` or the `NO_COLOR` environment variable now also
    turns off ANSI hyperlinks (#447).

    !end-bullet!
-   !begin-bullet!
    `symbol` now only has two variants: UTF-8 and ASCII. There are no
    special variants for RStudio and Windows RGui any more (#424).

    !end-bullet!

!end-bullets-9!

# cli 3.2.0

## Breaking change

!begin-bullets-10!

-   !begin-bullet!
    The `cli_theme_dark` option is now known as `cli.theme_dark`, to be
    consistent with all other cli option names (#380).
    !end-bullet!

!end-bullets-10!

## Other changes

!begin-bullets-11!

-   !begin-bullet!
    The preferred names of the S3 classes `ansi_string`, `ansi_style`,
    `boxx`, `rule` and `tree` now have `cli_` prefix: `cli_ansi_string`,
    etc. This will help avoiding name conflicts with other packages
    eventually, but for now the old names are kept as well, for
    compatibility.

    !end-bullet!
-   !begin-bullet!
    `cli_abort()` has been updated to work nicely with rlang 1.0. The
    default `call` and backtrace soft-truncation are set to `.envir`
    (which itself is set to the immediate caller of `cli_abort()` by
    default).

    Line formatting now happens lazily at display time via
    `rlang::cnd_message()` (which is called by the `conditionMessage()`
    method for rlang errors).

    !end-bullet!
-   !begin-bullet!
    New `hash_sha256()` function to calculate SHA-256 hashes. New
    `hash_raw_*()`, `hash_obj_*()` and `hash_file_*()` functions to
    calculate various hashes of raw vectors, R objects and files.

    !end-bullet!
-   !begin-bullet!
    You can use the new `cli.default_num_colors` option to set the
    default number of ANSI colors, only if ANSI support is otherwise
    detected. See the details in the manual of `num_ansi_colors()`.

    !end-bullet!
-   !begin-bullet!
    You can set the new `ESS_BACKGROUND_MODE` environment variable to
    `dark` to indicate dark mode.

    !end-bullet!
-   !begin-bullet!
    cli now handles quotes and comment characters better in the
    semantion `cli_*()` functions that perform glue string interpolation
    (#370).

    !end-bullet!

!end-bullets-11!

# cli 3.1.1

!begin-bullets-12!

-   !begin-bullet!
    `style_hyperlink()` gains a `params=` argument (#384).
    !end-bullet!

!end-bullets-12!

# cli 3.1.0

## Breaking changes

!begin-bullets-13!

-   !begin-bullet!
    The C progress bar API now uses `double` instead of `int` as the
    data type of the progress units (#335).
    !end-bullet!

!end-bullets-13!

## New features

!begin-bullets-14!

-   !begin-bullet!
    Several improvements and changes in the `ansi_*()` functions:

    !begin-bullets-15!
    -   !begin-bullet!
        most `ansi_*()` functions are now implemented in C and they are
        much faster (#316).
        !end-bullet!
    -   !begin-bullet!
        they handle `NA` values better.
        !end-bullet!
    -   !begin-bullet!
        many functions now use UTF-8 graphemes by default instead of
        code points. E.g. `ansi_nchar()` counts graphemes, etc.
        !end-bullet!
    -   !begin-bullet!
        they convert their input to UTF-8 and always return UTF-8
        encoded strings.
        !end-bullet!
    -   !begin-bullet!
        new function `ansi_simplify()` to remove superfluous ANSI tags.
        !end-bullet!
    -   !begin-bullet!
        new function `ansi_html()` to convert ANSI-highlighted strings
        to HTML.
        !end-bullet!
    -   !begin-bullet!
        `ansi_has_any()` and `ansi_strip()` now have `sgr` and `csi`
        arguments to look for SGR tags, CSI tags, or both.
        !end-bullet!

    !end-bullets-15!
    !end-bullet!
-   !begin-bullet!
    New functions that handle UTF-8 encoded strings correctly:
    `utf8_graphemes()`, `utf8_nchar()`, `utf8_substr()`.

    !end-bullet!
-   !begin-bullet!
    Support for palettes, including a colorblind friendly palette. See
    `?ansi_palettes` for details.

    !end-bullet!
-   !begin-bullet!
    True color support: `num_ansi_colors()` now detects terminals with
    24 bit color support, and `make_ansi_style()` uses the exact RGB
    colors on these terminals (#208).

    !end-bullet!
-   !begin-bullet!
    The new `col_br_*()` and `bg_br_()` functions create bright versions
    of eight base ANSI colors (#327).

    !end-bullet!
-   !begin-bullet!
    New function `code_highlight()` to syntax highlight R code. It
    supports several themes out of the box, see `code_theme_list()`
    (#348).

    !end-bullet!
-   !begin-bullet!
    New functions for hashing: `hash_animal()`, `hash_emoji()` and
    `hash_md5()`.

    !end-bullet!
-   !begin-bullet!
    New `diff_chr()` and `diff_str()` functions to calculate the
    difference of character vectors and letters of strings.

    !end-bullet!

!end-bullets-14!

## Smaller improvements

!begin-bullets-16!

-   !begin-bullet!
    Progress bars with `clear = FALSE` now print the last, completed,
    state properly.

    !end-bullet!
-   !begin-bullet!
    The progress bar for Shiny apps now handles output from
    `cli_progress_output()`.

    !end-bullet!
-   !begin-bullet!
    Progress variables in C `format_done` strings work correctly now
    (#337).

    !end-bullet!
-   !begin-bullet!
    `cli_dl()` now works with an empty description, and gives a better
    error for invalid input (#347).

    !end-bullet!
-   !begin-bullet!
    `rule()` is now works better if the labels have ANSI markup.

    !end-bullet!
-   !begin-bullet!
    `cli_spark` objects now have `format()` and `print()` methods.

    !end-bullet!
-   !begin-bullet!
    `cli_process_done()` now does not error without a process (#351).

    !end-bullet!
-   !begin-bullet!
    ANSI markup is now supported in RStudio jobs (#353).

    !end-bullet!
-   !begin-bullet!
    The lack of ANSI support is now again correctly detected if there is
    an active `sink()` (#366).

    !end-bullet!

!end-bullets-16!

# cli 3.0.1

!begin-bullets-17!

-   !begin-bullet!
    `ansi_strtrim()` now correctly keeps `NA` values (#309).

    !end-bullet!
-   !begin-bullet!
    `format_inline()` now uses the correct environment (@rundel, #314).

    !end-bullet!

!end-bullets-17!

# cli 3.0.0

!begin-bullets-18!

-   !begin-bullet!
    New functions for progress bars, please see the new articles at
    https://cli.r-lib.org/articles/ for details.

    !end-bullet!
-   !begin-bullet!
    New `cli_abort()`, `cli_warn()` and `cli_inform()` functions, to
    throw errors with cli pluralization and styling.

    !end-bullet!
-   !begin-bullet!
    New `format_inline()` function to format a cli string without
    emitting it (#278).

    !end-bullet!

!end-bullets-18!

# cli 2.5.0

!begin-bullets-19!

-   !begin-bullet!
    New `style_no_*()` functions to locally undo styling. New
    `col_none()` and `bg_none()` functions to locally undo text color
    and background color.

    !end-bullet!
-   !begin-bullet!
    It is now possible to undo text and background color in a theme, by
    setting them to `NULL` or `"none"`.

    !end-bullet!
-   !begin-bullet!
    `cli_memo()` was renamed to `cli_bullets()`, as it is by default
    formatted as a bullet list (#250).

    !end-bullet!
-   !begin-bullet!
    New `ansi_toupper()`, `ansi_tolower` and `ansi_chartr()` functions,
    the ANSI styling aware variants of `toupper()`, `tolower()` and
    `chartr()` (#248).

    !end-bullet!
-   !begin-bullet!
    New `test_that_cli()` helper function to write testthat tests for
    cli output.

    !end-bullet!
-   !begin-bullet!
    `tree()` now does not produce warnings for tibbles (#238).

    !end-bullet!
-   !begin-bullet!
    New inline style: `.cls` to format class names, e.g.
    `"{.var fit} must be an {.cls lm} object"`.

    !end-bullet!

!end-bullets-19!

# cli 2.4.0

!begin-bullets-20!

-   !begin-bullet!
    New `cli_memo()` function to create a list of items or tasks.

    !end-bullet!
-   !begin-bullet!
    New `cli::cli()` function to create a single cli message from
    multiple cli calls (#170).

    !end-bullet!
-   !begin-bullet!
    cli now highlights weird names, e.g. path names with leading or
    trailing space (#227).

    !end-bullet!
-   !begin-bullet!
    Styling is fixed at several places. In particular, nested lists
    should be now formatted better (#221).

    !end-bullet!
-   !begin-bullet!
    New `spark_bar()` and `spark_line()` functions to draw small bar or
    line charts.

    !end-bullet!

!end-bullets-20!

# cli 2.3.1

!begin-bullets-21!

-   !begin-bullet!
    ANSI color support detection works correctly now in older RStudio,
    and also on older R versions.

    !end-bullet!
-   !begin-bullet!
    `cli_h1()`, `cli_h2()` and `cli_h3()` now work with multiple glue
    substitutions (#218).

    !end-bullet!

!end-bullets-21!

# cli 2.3.0

!begin-bullets-22!

-   !begin-bullet!
    `boxx()` now correctly calculates the width of the box for non-ASCII
    characters.

    !end-bullet!
-   !begin-bullet!
    New `ansi_trimws()` and `ansi_strwrap()` functions, they are similar
    to `trimws()` and `strwrap()` but work on ANSI strings.

    !end-bullet!
-   !begin-bullet!
    New `ansi_columns()` function to format ANSI strings in multiple
    columns.

    !end-bullet!
-   !begin-bullet!
    `ansi_substr()`, `ansi_substring()`, `ansi_strsplit()`,
    `ansi_align()` now always return `cli_ansi_string` objects.

    !end-bullet!
-   !begin-bullet!
    `ansi_nchar()`, `ansi_align()`, `ansi_strtrim()` and the new
    `ansi_strwrap()` as well handle wide Unicode correctly, according to
    their display width.

    !end-bullet!
-   !begin-bullet!
    `boxx()` can now add headers and footers to boxes.

    !end-bullet!

!end-bullets-22!

# cli 2.2.0

!begin-bullets-23!

-   !begin-bullet!
    New `style_hyperlink()` function to add hyperlinks, on terminals
    that support them.

    !end-bullet!
-   !begin-bullet!
    `cli_format_method()` now works properly in knitr, and other
    environments that catch message conditions (#159).

    !end-bullet!
-   !begin-bullet!
    ANSI strings created by `col_*`, `bg_*` and `style_*` now also add
    the `character` class to the result. This fixes issues with code
    that expect `character` objects.

    !end-bullet!
-   !begin-bullet!
    New functions to manipulate ANSI strings: `ansi_aling()`,
    `ansi_has_any()`, `ansi_nchar()`, `ansi_regex()`, `ansi_strip()`,
    `ansi_strsplit()`, `ansi_substr()`, `ansi_substring()`.

    !end-bullet!

!end-bullets-23!

# cli 2.1.0

!begin-bullets-24!

-   !begin-bullet!
    New `cli_vec()` function to allow easier formatting of collapsed
    vectors. It is now also possible to use styling to set the
    collapsing parameters (#129).

    !end-bullet!
-   !begin-bullet!
    New `pluralize()` function to perform pluralization without
    generating cli output (#155).

    !end-bullet!
-   !begin-bullet!
    `console_width()` works better now in RStudio, and also in
    terminals.

    !end-bullet!
-   !begin-bullet!
    Styling of verbatim text work properly now (#147, @tzakharko).

    !end-bullet!
-   !begin-bullet!
    Messages (i.e. `message` conditions) coming from cli now have the
    `cliMessage` class, so you can easily suppress them without
    suppressing other messages (#156).

    !end-bullet!
-   !begin-bullet!
    cli prints the output to `stderr()` now, if there is an output or
    message sink. This is to make interactive and non-interactive
    sessions consistent (#153).

    !end-bullet!
-   !begin-bullet!
    Pluralization works correctly now if the last alternative is the
    empty string (#158).

    !end-bullet!
-   !begin-bullet!
    cli now caches the result of the dark background detection in iTerm
    on macOS. Reload cli to delete the cache (#131).

    !end-bullet!
-   !begin-bullet!
    The `is_dynamic_tty()`, `is_ansi_tty()` and `ansi_hide_cursor()` and
    related functions now default to the `"auto"` stream, which is
    automatically selected to be either `stdout()` or `stderr()`. See
    the manual for details (#144).

    !end-bullet!
-   !begin-bullet!
    The default theme now quotes file names, paths, email addresses if
    they don't start or end with an alphanumeric character or a slash.
    This is to make it easier to spot names that start or end with a
    space (#167).

    !end-bullet!
-   !begin-bullet!
    `make_spinner()` clears the line properly now (@tzakharko, #164).

    !end-bullet!
-   !begin-bullet!
    Semantic cli functions now automatically replace Unicode
    non-breaking space characters (`\u00a0`) with regular space
    characters, right before output. They are still used to calculate
    the line breaks, but not outputted (#161).

    !end-bullet!
-   !begin-bullet!
    Progress bars now respect `is_dynamic_tty()` and do not output `\r`
    when this is false (@jimhester, #177)

    !end-bullet!

!end-bullets-24!

# cli 2.0.2

!begin-bullets-25!

-   !begin-bullet!
    The status bar now does not simplify multiple spaces by a single
    space.

    !end-bullet!
-   !begin-bullet!
    cli now does not crash if it fails to detect whether the RStudio
    theme is a dark theme (#138).

    !end-bullet!
-   !begin-bullet!
    cli now works better with wide Unicode characters, for example
    emojis. In particular, a status bar containing emojis is cleared
    properly (#133).

    !end-bullet!
-   !begin-bullet!
    The status bar now does not flicker when updated, in terminals
    (#135).

    !end-bullet!

!end-bullets-25!

# cli 2.0.1

!begin-bullets-26!

-   !begin-bullet!
    Symbols (`symbol$*`) are now correctly printed in RStudio on Windows
    (#124).

    !end-bullet!
-   !begin-bullet!
    The default theme for `cli_code()` output looks better now,
    especially in RStudio (#123).

    !end-bullet!
-   !begin-bullet!
    Remove spurious newline after a `cli_process_start()` was cleared
    manually, and also at the end of the function.

    !end-bullet!
-   !begin-bullet!
    Use Oxford comma when listing 3 or more items (@jonocarroll, #128).

    !end-bullet!

!end-bullets-26!

# cli 2.0.0

## Semantic command line interface tools

cli 2.0.0 has a new set of functions that help creating a CLI using a
set of higher level elements: headings, paragraphs, lists, alerts, code
blocks, etc. The formatting of all elements can be customized via
themes. See the "Building a semantic CLI" article on the package web
site: https://cli.r-lib.org

## Bug fixes:

!begin-bullets-27!

-   !begin-bullet!
    Fix a bug in `is_dynamic_tty()`, setting `R_CLI_DYNAMIC="FALSE"` now
    properly turns dynamic tty off (#70).
    !end-bullet!

!end-bullets-27!

# cli 1.1.0

!begin-bullets-28!

-   !begin-bullet!
    cli has now functions to add ANSI styles to text. These use the
    crayon package internally, and provide a simpler interface. See the
    `col_*`, `bg_*`, `style_*` and also the `make_ansi_style()` and
    `combine_ansi_styles()` functions (#51).

    !end-bullet!
-   !begin-bullet!
    New `is_dynamic_tty()` function detects if `\r` should be used for a
    stream (#62).

    !end-bullet!
-   !begin-bullet!
    New `is_ansi_tty()` function detects if ANSI control sequences can
    be used for a stream.

    !end-bullet!
-   !begin-bullet!
    New `ansi_hide_cursor()`, `ansi_show_cursor()` and
    `ansi_with_hidden_cursor()` functions to hide and show the cursor in
    terminals.

    !end-bullet!
-   !begin-bullet!
    New `make_spinner()` function helps integrating spinners into your
    functions.

    !end-bullet!
-   !begin-bullet!
    Now `symbol` always uses ASCII symbols when the `cli.unicode` option
    is set to `FALSE`.

    !end-bullet!

!end-bullets-28!

# 1.0.1

!begin-bullets-29!

-   !begin-bullet!
    New `cli_sitrep()` function, situation report about UTF-8 and ANSI
    color support (#53).

    !end-bullet!
-   !begin-bullet!
    Fall back to ASCII only characters on non-Windows platforms without
    UTF-8 support, and also in LaTeX when running knitr (#34).

    !end-bullet!

!end-bullets-29!

# cli 1.0.0

First public release.

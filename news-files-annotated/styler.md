```{=html}
<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->
```
# styler 1.10.2

This release was requested by the CRAN team to fix CRAN warning on
invalid numeric version inputs (#1143).

**Minor changes**

!begin-bullets-1!

-   !begin-bullet!
    Use cli messaging for cache (#1127).
    !end-bullet!
-   !begin-bullet!
    Use latest (and stable!) pre-commit (#1144).
    !end-bullet!
-   !begin-bullet!
    Fix CRAN warning on invalid numeric version inputs (#1143).
    !end-bullet!
-   !begin-bullet!
    Bump JamesIves/github-pages-deploy-action from 4.4.2 to 4.4.3
    (#1139).
    !end-bullet!
-   !begin-bullet!
    fix pre-commit (#1132).
    !end-bullet!
-   !begin-bullet!
    Don't require dplyr anywhere (#1131).
    !end-bullet!

!end-bullets-1!

We thank everyone who helped making this release possible.

\@krlmlr, \@lorenzwalthert, \@MichaelChirico, \@olivroy, \@rkrug, and
\@rossdrucker.

# styler 1.10.1

This release was requested by CRAN due to accidentally populating a user
cache while building vignettes for R \>= 4.3.0.

!begin-bullets-2!

-   !begin-bullet!
    Code quality improvements (#1122).
    !end-bullet!
-   !begin-bullet!
    Bump JamesIves/github-pages-deploy-action from 4.4.1 to 4.4.2
    (#1123).
    !end-bullet!

!end-bullets-2!

Thanks to everyone who contributed to this release: \@olivroy and
\@krlmlr.

# styler 1.10.0

This release contains speed-ups between 20% and 40% depending on your
use case thanks to replacing {base} functionality with {vctrs} (#1114).
With the speed boost introduced in version 1.8.0 in Oct. 2022, {styler}
is now up to 2x as fast as before release 1.8.0.

This release was created upon a request by the CRAN team to actively
manage not just cached files but also the potentially empty cache
directories they live in (#1118). Here are the changes in detail:

!begin-bullets-3!

-   !begin-bullet!
    Require at least R 3.6 (#1101).
    !end-bullet!
-   !begin-bullet!
    Prefer {vctrs} functions over slower {base} equivalents (#1114).
    !end-bullet!
-   !begin-bullet!
    Replace deprecated use of `rlang::with_handlers()` (#1103).
    !end-bullet!
-   !begin-bullet!
    Remove tail recursion in favor of `repeat` (#1113).
    !end-bullet!
-   !begin-bullet!
    split `test-public_api.R` for better sharding (#1109).
    !end-bullet!
-   !begin-bullet!
    0-pad filenames for sharding (#1110)
    !end-bullet!
-   !begin-bullet!
    add missing {testthat} snapshots (#1115).
    !end-bullet!
-   !begin-bullet!
    Bump {touchstone} config (#1104, #1107).
    !end-bullet!
-   !begin-bullet!
    Bump `actions/checkout` to version 3 in GitHub Actions (#1098).
    !end-bullet!

!end-bullets-3!

Thanks for everyone contributing to this release:

\@IndrajeetPatil, \@krlmlr, \@kyleam, \@MichaelChirico, \@mvanaman,
\@olivroy, and \@vvarik.

# styler 1.9.1

**Bug fixes**

!begin-bullets-4!

-   !begin-bullet!
    Fix interaction between cache and stylerignore that could produce
    invalid code (#1072).
    !end-bullet!
-   !begin-bullet!
    Don't remove line break around `{{` and comments that can yield
    invalid code (#1070).
    !end-bullet!
-   !begin-bullet!
    Styling empty roxygen code examples don't cause errors anymore
    (#1096).
    !end-bullet!
-   !begin-bullet!
    Double indent is also kept if there is only one argument (#1094).
    !end-bullet!
-   !begin-bullet!
    Improved blank lines handling for roxygen examples (#1085).
    !end-bullet!
-   !begin-bullet!
    style roxygen examples even if nothing comes after (#1089).
    !end-bullet!

!end-bullets-4!

**Other**

!begin-bullets-5!

-   !begin-bullet!
    Document `"qmd"` as a valid `filetype` (#1091).
    !end-bullet!

!end-bullets-5!

Thanks for everyone who contributed to this release:

\@dpprdan, \@flying-sheep, \@giocomai and \@MichaelChirico.

# styler 1.9.0

**Features**

!begin-bullets-6!

-   !begin-bullet!
    The tidyverse recently introduced double-indention for function
    declarations that don't fit on one line. It indents two levels,
    i.e. 4 spaces if you `indent_by` two spaces.
    !end-bullet!

!end-bullets-6!

!begin-codeblock!

``` r
# old style: remains compliant and won't be re-styled
my_fun <- function(long_argument = 2,
                   indent_up_to_first = "x") {
  # ...
}

# new style: now also compliant and won't be re-styled
my_fun <- function(
    long_argument = 2,
    indent_double = "x") {
  # ...
}
```

!end-codeblock!

You can also use the R package {codegrip} to toggle between the two
modes (#1083).

**Bug fixes**

!begin-bullets-7!

-   !begin-bullet!
    Previously styled code that is now stylerignored should always be
    formatted correctly. It boils down to the requirement that
    stylerignore sequences must always be in the same block (#1082).
    !end-bullet!
-   !begin-bullet!
    styling around `{{` and comments now yields parsable output (#1088).
    !end-bullet!
-   !begin-bullet!
    trailing blank lines in roxygen code examples are removed (#1085).
    !end-bullet!
-   !begin-bullet!
    roxygen code examples that don't have any code following after them
    are now also styled (#1067).
    !end-bullet!

!end-bullets-7!

**Other user-facing changes**

!begin-bullets-8!

-   !begin-bullet!
    Less noisy communication if R option `styler.cache_root` is not set
    (#1063).
    !end-bullet!

!end-bullets-8!

**Infrastructure**

!begin-bullets-9!

-   !begin-bullet!
    use {lintr} config (#1057, #1059) and pre-commit hook (#1064).
    !end-bullet!
-   !begin-bullet!
    use new {pkgdown} hook, check for parsable yaml and mixed line
    ending (#1080, #1081).
    !end-bullet!
-   !begin-bullet!
    update GitHub Actions workflow versions one time (#1073) and add
    dependabot for the future (#1974).
    !end-bullet!
-   !begin-bullet!
    bdr test for additional examples (#1068).
    !end-bullet!
-   !begin-bullet!
    check for link rot regularly (#1077, #1086).
    !end-bullet!

!end-bullets-9!

**Internals**

!begin-bullets-10!

-   !begin-bullet!
    replace retired `purrr::when()` with `if` statements (#1066).
    !end-bullet!
-   !begin-bullet!
    more integer literals (#1054).
    !end-bullet!
-   !begin-bullet!
    Consistently use `@examplesIf` for conditionally running examples
    (#1071).
    !end-bullet!
-   !begin-bullet!
    document imports in a single file (#1060).
    !end-bullet!
-   !begin-bullet!
    format YAML files (#1061).
    !end-bullet!

!end-bullets-10!

A big shout out to anyone who contributed to this release:

\@balthasars, \@hadley, \@IndrajeetPatil, \@juliangrimm225 and \@krlmlr.

# styler 1.8.1

**Features**

!begin-bullets-11!

-   !begin-bullet!
    Expose internals used with other style guides (@Robinlovelace +
    collaborators, #1043, #1052).
    !end-bullet!

!end-bullets-11!

**Other**

!begin-bullets-12!

-   !begin-bullet!
    Bump minimal version requirement on {withr} as `...` in
    `withr::local_options()` was introduced only in v.2.3.0 (#1051).
    !end-bullet!
-   !begin-bullet!
    Rename internal function `set_linebreak_after_ggplot2_plus()` to
    `set_line_break_after_ggplot2_plus()` for consistency (@Polkas,
    #1049).
    !end-bullet!
-   !begin-bullet!
    Reformat contributing guidelines (#1047).
    !end-bullet!
-   !begin-bullet!
    Improve YAML formatting for pkgdown (#1042).
    !end-bullet!
-   !begin-bullet!
    Simplify caching internal's conditionals with `rlang::%||%` (#1041).
    !end-bullet!
-   !begin-bullet!
    Only run {pkgapi} if available (#1039).
    !end-bullet!
-   !begin-bullet!
    Typos (@MichaelChirico, #1038)
    !end-bullet!

!end-bullets-12!

This release was requested by CRAN to resolve an R CMD Check note
(#1044). A big hand to everyone who made this release possible:

Dave Jarvis, \@IndrajeetPatil, \@lorenzwalthert, \@MichaelChirico,
\@Polkas, and \@Robinlovelace.

# styler 1.8.0

{styler} 1.8.0 comes with a host of new features, around 40% speed
improvement, bug fixes and the removal of 8 recursive dependencies. We
also welcome \@IndrajeetPatil as a new contributor to {styler}, who has
contributed significantly to this and and previous releases.

**Features**

!begin-bullets-13!

-   !begin-bullet!
    `style_dir()` and `style_pkg()` now default to styling all supported
    file formats (`.R`, `.Rmd`, `.Rmarkdown`, `.Rnw`, and `.qmd`) in the
    (package) directory (#965, #931, #1033).

    !end-bullet!
-   !begin-bullet!
    `style_pkg()` now excludes the auto-generated `R/cpp11.R` file
    (#977).

    !end-bullet!
-   !begin-bullet!
    minimum needed R version is now bumped to `3.5` (#986).

    !end-bullet!
-   !begin-bullet!
    alignment is now detected for function declaration in a similar way
    as for function calls (#968).

    !end-bullet!
-   !begin-bullet!
    new R option `styler.ignore_alignment` controls if alignment should
    be detected (and preserved) or not (#932).

    !end-bullet!

!end-bullets-13!

**Bug Fixes**

!begin-bullets-14!

-   !begin-bullet!
    alignment is detected in `tibble::tribble()` (and similar) calls
    with more than 3 columns when left aligned (#945).

    !end-bullet!
-   !begin-bullet!
    fix alignment detection for one column, mixed named/unnamed (#1035).

    !end-bullet!
-   !begin-bullet!
    if there are only empty lines in a code chunk, they are all removed
    (#936).

    !end-bullet!
-   !begin-bullet!
    apply rules for \[ to \[\[ and its closing counterpair (#1030)

    !end-bullet!
-   !begin-bullet!
    there is now at most one line break after `{` and before `#` (#952,
    #1022).

    !end-bullet!
-   !begin-bullet!
    line breaks may be added to function calls to ensure indention
    symmetry for round braces (#975).

    !end-bullet!
-   !begin-bullet!
    the cache is also invalidated on changing the stylerignore markers
    (#932).

    !end-bullet!
-   !begin-bullet!
    `{` is not put on a new line after `=` and in `function() {` for
    some edge cases (#939).

    !end-bullet!
-   !begin-bullet!
    `while ({})` statements are now handled the same way as function
    statements with regards to breaking lines (#967).

    !end-bullet!
-   !begin-bullet!
    parsing of {roxygen2} example comments now also works for edge cases
    when there is no literal code immediately following after the end of
    the example section (#940).

    !end-bullet!
-   !begin-bullet!
    files with no tokens in it are now transformed into zero-byte files
    (#962).

    !end-bullet!

!end-bullets-14!

**Documentation**

!begin-bullets-15!

-   !begin-bullet!
    old (and outdated) vignettes have been removed (#955). To access
    them, do `git checkout v1.0.0`.
    !end-bullet!
-   !begin-bullet!
    minor improvements to the documentation (#958).
    !end-bullet!
-   !begin-bullet!
    turned off `styler.colored_print.vertical` in vignettes so ANSI
    output of {prettycode} not messing with {pkgdown} (#956, #957).
    !end-bullet!

!end-bullets-15!

**Performance and code quality improvements**

!begin-bullets-16!

-   !begin-bullet!
    use integer literals and avoid coercions where needed (#994).
    !end-bullet!
-   !begin-bullet!
    don't preserve names for `unlist()` (#998).
    !end-bullet!
-   !begin-bullet!
    remove unused variables (#999).
    !end-bullet!
-   !begin-bullet!
    get rid of lints with performance implications (#1000).
    !end-bullet!
-   !begin-bullet!
    use more efficient match() alternative (#1001).
    !end-bullet!
-   !begin-bullet!
    don't use `nrow` arg in `new_tibble()` calls (#1003).
    !end-bullet!
-   !begin-bullet!
    performance improvements with `if()` + `else()` instead of
    `ifelse()` (#1006).
    !end-bullet!
-   !begin-bullet!
    replace tibbles with data frames to improve performance (#1007).
    !end-bullet!
-   !begin-bullet!
    simplify `styler_df()` signature (#1009).
    !end-bullet!
-   !begin-bullet!
    minor cleanup (#1016).
    !end-bullet!
-   !begin-bullet!
    non-exported and unused functions `odd()` and `even()` were removed
    (#989).
    !end-bullet!
-   !begin-bullet!
    all (R)md files in this project's source code are now formatted with
    default pandoc markdown formatter. This conversion is required when
    using the visual mode in RStudio (#941).
    !end-bullet!
-   !begin-bullet!
    improved code quality by fixing {lintr} warnings (#960, #1028).
    !end-bullet!

!end-bullets-16!

**Dependency related changes**

In total, 8 recursive dependencies are removed: {ellipsis}, {pillar},
{rematch2}, {tibble}, {utf8}, {fansi}, {lifecycle}, {pkgconfig}.

!begin-bullets-17!

-   !begin-bullet!
    don't import entire tibble package (#1007).
    !end-bullet!
-   !begin-bullet!
    drop {rematch2} dependency (#1011).
    !end-bullet!

!end-bullets-17!

**Infrastructure**

!begin-bullets-18!

-   !begin-bullet!
    upgrade testing infra to testthat 3e (#949).
    !end-bullet!
-   !begin-bullet!
    run tests in parallel (#978).
    !end-bullet!
-   !begin-bullet!
    run some tests sequentially (#1031)
    !end-bullet!
-   !begin-bullet!
    better stack tracing for profiling (#979, #980).
    !end-bullet!
-   !begin-bullet!
    add flags to skip code coverage for zzz.R (#1005).
    !end-bullet!
-   !begin-bullet!
    error now on R CMD note (#987).
    !end-bullet!
-   !begin-bullet!
    test on latest Ubuntu instead of Ubuntu 18.04 (#982).
    !end-bullet!
-   !begin-bullet!
    use latest GitHub Actions for R (#1034).
    !end-bullet!
-   !begin-bullet!
    update {pkgdown} action to always build, but only deploy on default
    branch (#946).
    !end-bullet!
-   !begin-bullet!
    remove pre-commit push hook for news entry (#1023).
    !end-bullet!

!end-bullets-18!

A big hand to everyone who made this release possible:

\@behrman, \@EngineerDanny, \@gavinsimpson, \@IndrajeetPatil,
\@jabenninghoff, \@krlmlr, \@lorenzwalthert, \@MichaelChirico,
\@moodymudskipper, \@RaymondBalise, \@Robinlovelace, \@sebffischer,
\@sgorm123, \@stefanoborini, and \@wdkrnls.

# styler 1.7.0

!begin-bullets-19!

-   !begin-bullet!
    if `else` follows directly after `if`, line breaks are removed
    (#935).
    !end-bullet!

!end-bullets-19!

**API changes**

!begin-bullets-20!

-   !begin-bullet!
    new R option `styler.cache_root` (defaulting to `"styler"`) that
    determines the sub-directory under the {R.cache} cache directory
    that {styler} uses. Non- default caches won't be cleaned up by
    {styler}. We suggest `"styler-perm"` (also used by {precommit}).

    !end-bullet!
-   !begin-bullet!
    stylerignore markers are now interpreted as regular expressions
    instead of comments that must match exactly. This allows to specify
    multiple markers in one regular expression for `styler.ignore_start`
    and `styler.ignore_stop`, e.g. to use markers for lintr and styler
    on the same line, you can use
    `options(styler.ignore_start = "nolint start|styler: off"`:

    !begin-codeblock!
    ``` r
    # nolint start, styler: off
    1 +1
    # nolint end
    # styler: on
    ```

    !end-codeblock!
    As a consequence of this approach, the defaults for
    `styler.ignore_start` and `styler.ignore_stop` omit the `#` (#849).

    !end-bullet!

!end-bullets-20!

**Features**

!begin-bullets-21!

-   !begin-bullet!
    {styler} can be ran via GitHub Actions using
    `usethis::use_github_action("style")` (#914).
    !end-bullet!
-   !begin-bullet!
    added guarantee that styled code is parsable (#892).
    !end-bullet!
-   !begin-bullet!
    Developers can now create style guides with indention characters
    other than spaces (#916).
    !end-bullet!

!end-bullets-21!

**Documentation**

!begin-bullets-22!

-   !begin-bullet!
    Add vignette on distributing style guide (#846, #861).
    !end-bullet!
-   !begin-bullet!
    Fix argument name `filetype` in Example for `style_dir()` (#855).
    !end-bullet!

!end-bullets-22!

**Bug fixes**

!begin-bullets-23!

-   !begin-bullet!
    Piped function without brackets `substitute(x %>% y)` don't get `()`
    added anymore for one level deep (not more yet, see #889), as this
    can change outcome of the code (#876).
    !end-bullet!
-   !begin-bullet!
    `.onLoad()` method no longer broken with {cli} \>= 3.1 (#893).
    !end-bullet!
-   !begin-bullet!
    Function calls containing `+` should no longer give any error on
    styling when there are comments and line breaks under certain
    circumstances (#905).
    !end-bullet!
-   !begin-bullet!
    rules that add tokens don't break stylerignore sequences anymore
    (#891).
    !end-bullet!
-   !begin-bullet!
    Alignment detection respects stylerignore (#850).
    !end-bullet!
-   !begin-bullet!
    Unaligned expressions with quoted key (e.g. `c("x" = 2)`) are now
    correctly detected (#881).
    !end-bullet!
-   !begin-bullet!
    `~` causes now indention, like `+`, `-`, `|` etc. (#902).
    !end-bullet!
-   !begin-bullet!
    `Warning: Unknown or uninitialised column:` was fixed (#885).
    !end-bullet!
-   !begin-bullet!
    function calls with unequal number of token on different lines are
    no longer deemed aligned if there are arbitrary spaces around the
    tokens on the lines with most tokens (#902).
    !end-bullet!
-   !begin-bullet!
    if a line starts with `EQ_SUB` (`=`), the corresponding key is moved
    to that line too (#923).
    !end-bullet!
-   !begin-bullet!
    ensure a trailing blank line also if the input is cached (#867).
    !end-bullet!
-   !begin-bullet!
    Preserve trailing blank line in roxygen examples to simplify
    concatenation of examples (#880).
    !end-bullet!
-   !begin-bullet!
    `indenty_by` is now also respected when curly braces are added to an
    if statement by {styler} (#915).
    !end-bullet!
-   !begin-bullet!
    An error is now thrown on styling if input unicode characters can't
    be correctly parsed for Windows and R \< 4.2 (#883).
    !end-bullet!
-   !begin-bullet!
    styling of text does not error anymore when the R option `OutDec` is
    set to a non-default value (#912).
    !end-bullet!

!end-bullets-23!

**Infrastructure**

!begin-bullets-24!

-   !begin-bullet!
    Remove dependency on {xfun} (#866).
    !end-bullet!
-   !begin-bullet!
    Remove {glue} dependency that was only used by {touchstone} script
    and is declared as a dependency already in the respective action
    (#910).
    !end-bullet!
-   !begin-bullet!
    Bump minimal R requirement to 3.4 in line with the tidyverse, which
    allowed to remove the dependency at {backports} and some exception
    handling.
    !end-bullet!
-   !begin-bullet!
    rename default branch to main (#859).
    !end-bullet!
-   !begin-bullet!
    the built package size has been reduced by \~50% by listing
    `*-in_tree` files in `.Rbuildignore` (#879).
    !end-bullet!
-   !begin-bullet!
    Enable pre-commit.ci (#843).
    !end-bullet!
-   !begin-bullet!
    use pre-commit via GitHub Actions (#872).
    !end-bullet!
-   !begin-bullet!
    terminate running jobs on new push to save resources (#888).
    !end-bullet!
-   !begin-bullet!
    Use the {touchstone} GitHub Action instead of the literal script
    (#889).
    !end-bullet!
-   !begin-bullet!
    upgrade R CMD check Github Actions to use `v2`.
    !end-bullet!
-   !begin-bullet!
    {styler} test are relaxed to not assume a specific error message on
    the wrong usage of `_` (#929).
    !end-bullet!

!end-bullets-24!

Thanks to all contributors that made this release possible:

\@bersbersbers, \@daniel-wrench, \@dbykova, \@EngrStudent, \@hadley,
\@IndrajeetPatil, \@jam1015, \@jooyoungseo, \@kalaschnik, \@kaytif,
\@kpagacz, \@krlmlr, \@lionel-, \@lorenzwalthert, \@maelle,
\@MichaelChirico, \@mine-cetinkaya-rundel, \@neuwirthe, \@Polkas,
\@pwang2, \@sebffischer, \@ShixiangWang, \@ssh352, and \@xjtusjtu.

# styler 1.6.2

!begin-bullets-25!

-   !begin-bullet!
    clean up cache files older than one week (#842).
    !end-bullet!

!end-bullets-25!

# styler 1.6.1

!begin-bullets-26!

-   !begin-bullet!
    Files with `.Rmarkdown` extension are now recognized as an R
    markdown files in `style_file()` and friends (#824).

    !end-bullet!
-   !begin-bullet!
    Don't break line before comments in pipes (#822).

    !end-bullet!
-   !begin-bullet!
    Ordinary comments (starting with `#`) that break a roxygen code
    example block (starting with `#'`) are now recognized and preserved
    (#830).

    !end-bullet!
-   !begin-bullet!
    `@examplesIf` conditions longer than one line after styling throw an
    error for compatibility with {roxygen2} (#833).

    !end-bullet!
-   !begin-bullet!
    R Markdown chunk headers are no longer required to be parsable R
    code (#832).

    !end-bullet!
-   !begin-bullet!
    Break the line between `%>%` and `{` inside and outside function
    calls (#825).

    !end-bullet!
-   !begin-bullet!
    Add language server to third-party integration vignette (#835).

    !end-bullet!
-   !begin-bullet!
    improved test setup with fixtures and similar (#798).

    !end-bullet!

!end-bullets-26!

We'd like to thank all people who helped making this release possible:

\@bersbersbers, \@eutwt, \@IndrajeetPatil, \@j-mammen, \@jennybc,
\@JohannesNE, \@jonkeane, \@lorenzwalthert, and \@MichaelChirico.

# styler 1.5.1

## Alignment detection

!begin-bullets-27!

-   !begin-bullet!
    Code with left alignment after `=` in function calls is now
    recognized as aligned and won't be reformatted (#774, #777).

    !begin-codeblock!
        # already detected previously
        call(
          x  = 12345,
          y2 =    17
        )

        # newly detected
        call(
          x  = 12345,
          y2 = 17
        )

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Similarly, left aligned after comma is now detected (#785, #786).

    !begin-codeblock!
        # previously detected
        call(
          x  = 12345, "It's old",
          y2 = 17,      "before"
        )

        tribble(
          ~x,             ~y,
          "another",     1:3,
          "b",       1211234
        )

        # newly detected
        call(
          x = 2,           p = "another",
          y = "hhjkjkbew", x = 3
        )


        tribble(
          ~x,        ~y,
          "another", 1:3,
          "b",       1211234
        )

    !end-codeblock!
    Also see `vignette("detect-alignment")`.

    !end-bullet!

!end-bullets-27!

## Other new features

!begin-bullets-28!

-   !begin-bullet!
    The base R pipe as introduced in R 4.1.0 is now styled the same way
    the magrittr pipe is (#803).
    !end-bullet!
-   !begin-bullet!
    code chunks with explicit `tidy = FALSE` in an Rmd or Rnw code
    header are not styled anymore. This can be handy when the code can't
    be parsed, e.g. within a learnr tutorial (#790).
    !end-bullet!
-   !begin-bullet!
    `#>` is recognized as an output marker and no space is added after
    `#` (#771).
    !end-bullet!

!end-bullets-28!

## Minor changes and fixes

!begin-bullets-29!

-   !begin-bullet!
    No curly braces are added to else statements if they are within a
    pipe, as this can change evaluation logic of code involving the
    magrittr dot in rare cases (#816).
    !end-bullet!
-   !begin-bullet!
    Line breaks between `}` and `else` are removed (#793).
    !end-bullet!
-   !begin-bullet!
    In function calls, code after `= #\n` is indented correctly (#814).
    !end-bullet!
-   !begin-bullet!
    Multi-expressions containing multiple assignments no longer remove
    line breaks if they are not causing blank lines (#809).
    !end-bullet!
-   !begin-bullet!
    `exclude_dirs` in `style_pkg()` is now properly respected if it is a
    sub-directory of a directory that is scheduled for styling (e.g.
    `test/testthat/some/dir`) (#811).
    !end-bullet!
-   !begin-bullet!
    The user is not prompted anymore to confirm the creation of a
    permanent cache as R.cache \>= 0.15.0 uses a standard location in
    line with CRAN policies (#819).
    !end-bullet!
-   !begin-bullet!
    R code chunks in nested non-R chunks in R markdown don't yield an
    error anymore when document is styled, chunks are still not styled
    (#788, #794).
    !end-bullet!
-   !begin-bullet!
    `cache_activate()` and `cache_deactivate()` now respect the R option
    `styler.quiet` (#797).
    !end-bullet!
-   !begin-bullet!
    `multi_line` attribute in parse table is now integer, not boolean
    (#782).
    !end-bullet!
-   !begin-bullet!
    The style guide used in Addin is verified when set via R option
    (#789).
    !end-bullet!
-   !begin-bullet!
    Improve pkgdown author URLs (#775).
    !end-bullet!
-   !begin-bullet!
    Upgrade touchstone infra (#799, #805).
    !end-bullet!
-   !begin-bullet!
    Don't test on R 3.3 anymore as tidyverse supports only four previous
    releases (#804).
    !end-bullet!
-   !begin-bullet!
    Update Github Actions workflow (#810).
    !end-bullet!

!end-bullets-29!

We'd like to thank everyone who has furthered the development of the
latest release of styler through their contributions in issues and pull
requests:

\@ardydavari, \@gadenbuie, \@IndrajeetPatil, \@jasonhan-vassar,
\@laresbernardo, \@lorenzwalthert, \@MichaelChirico, \@Moohan,
\@njtierney, \@pat-s, \@psychelzh, \@pvalders, \@RoyalTS, and
\@russHyde.

# styler 1.4.1

!begin-bullets-30!

-   !begin-bullet!
    fix interaction between cache and `base_indention`. This also fixes
    the Addin for styling a selection with base indention repeatedly
    (#764).
    !end-bullet!
-   !begin-bullet!
    add more examples to `styler_*` helpfiles (#762).
    !end-bullet!
-   !begin-bullet!
    hexadecimal integers now preserve the trailing `L` when styled
    (#761).
    !end-bullet!
-   !begin-bullet!
    add a pre-push hook to make sure news bullets are added to each PR
    (#765).
    !end-bullet!

!end-bullets-30!

Thanks to everyone who contributed to this release:

\@krlmlr, \@lorenzwalthert, and \@renkun-ken.

# styler 1.4.0

## API Changes

**new**

!begin-bullets-31!

-   !begin-bullet!
    `style_file()` and friends gain argument `dry` to control if changes
    should be applied to files or not (#634).

    !end-bullet!
-   !begin-bullet!
    `style_file()` and friends gain argument `base_indention`
    (defaulting to 0) to control by how much the output code is indented
    (#649, #692). The Addin for styling a selection picks that up,
    e.g. you can style a function body and indention is preserved
    (#725).

    !end-bullet!
-   !begin-bullet!
    added an option for disabling all communication when using the
    package (`styler.quiet`) (#640).

    !end-bullet!
-   !begin-bullet!
    `scope` in `tidyverse_style()` can now be specified with higher
    granularity through `I()`, e.g. `I(c('spaces', 'tokens'))` allows us
    to style spaces and tokens without styling line breaks and
    indention. Previously, only a string was allowed and all less
    invasive scopes were included, e.g. if you wanted to style tokens,
    you had to always also style spaces, indention, line breaks as well
    (#705, #707).

    !end-bullet!
-   !begin-bullet!
    added an option (`styler.test_dir_writeable`) that changes test
    behavior to not directly modify test files in the current directory
    (#548).

    !end-bullet!
-   !begin-bullet!
    New argument `transformers_drop` in `create_style_guide()` to be
    populated with new helper function `specify_transformers_drop()` for
    specifying conditions under which transformers are not going to be
    used and can therefore be omitted without effecting the result of
    styling (#711).

    !end-bullet!

!end-bullets-31!

**deprecated**

!begin-bullets-32!

-   !begin-bullet!
    The environment variable `save_after_styling` is deprecated in favor
    of the R option `styler.save_after_styling` to control if a file is
    saved after styling with the RStudio Addin. Note than in RStudio \>=
    1.3.0, you can auto-save edits in general (Code -\> Saving -\>
    Auto-Save), e.g. on idle editor or focus loss, so this feature
    becomes less relevant (#631, #726).
    !end-bullet!

!end-bullets-32!

## Major changes

!begin-bullets-33!

-   !begin-bullet!
    styler is now distributed under the MIT license (#751).

    !end-bullet!
-   !begin-bullet!
    Documentation overhaul: New README, new "Get started" pkgdown page,
    new vignettes on `strict = FALSE`, `Adoption` renamed to
    `Third-party   integrations` (#741), adding search to pkgdown
    (#623), group functions in pkgdown reference page (#625), minor
    other doc improvements (#643, #618, #614, #677, #651, #667, #672,
    #687, #752, #754).

    !end-bullet!
-   !begin-bullet!
    `@exampleIsf` roxygen tag for conditional examples is now supported
    (#743).

    !end-bullet!
-   !begin-bullet!
    blank lines in function calls and headers are now removed, for the
    former only when there are no comments before or after the blank
    line (#629, #630, #635, #723).

    !end-bullet!
-   !begin-bullet!
    speed improvements: 15% faster on new code, 70% on repeated styling
    of compliant code (The latter is not so relevant because it was
    almost instantaneous already). Most relevant contributions were
    #679, #691, #681, #711, #739.

    !end-bullet!
-   !begin-bullet!
    `#<<` is now recognized as the xaringan marker and no space is added
    after`#` (#700).

    !end-bullet!

!end-bullets-33!

## Minor changes and fixes

!begin-bullets-34!

-   !begin-bullet!
    `style_dir()` and `style_pkg()` now apply directory exclusion
    recursively with `exclude_dirs` (#676).

    !end-bullet!
-   !begin-bullet!
    `switch()` now has line breaks after every argument to match the
    tidyverse style guide (#722, #727).

    !end-bullet!
-   !begin-bullet!
    unary `+` before a function call does not give an error anymore, as
    before version 1.3.0 (#697).

    !end-bullet!
-   !begin-bullet!
    certain combinations of `stylerignore` markers and cached
    expressions now don't give an error anymore (#738).

    !end-bullet!
-   !begin-bullet!
    cache is now correctly invalidated when style guide arguments change
    (#647).

    !end-bullet!
-   !begin-bullet!
    empty lines are now removed between pipes and assignments (#645,
    #710).

    !end-bullet!
-   !begin-bullet!
    multiple `@examples` roxygen tags in a code block of `#'` are no
    longer squashed (#748).

    !end-bullet!
-   !begin-bullet!
    roxygen code examples starting on the same line as the `@examples`
    tag are no longer moved to the next line (#748).

    !end-bullet!
-   !begin-bullet!
    always strip trailing spaces and make cache insensitive to it
    (#626).

    !end-bullet!
-   !begin-bullet!
    `style_text()` can now style all input that `is.character()`, not
    just if it inherits from classes `character`, `utf8` or `vertical`
    (#693).

    !end-bullet!
-   !begin-bullet!
    logical operators within square braces are now moved from the start
    of a line to the end of the previous line (#709).

    !end-bullet!
-   !begin-bullet!
    spaces are now removed before `[` and `[[` (#713).

    !end-bullet!
-   !begin-bullet!
    The internal `create_tree()` only used in testing of styler now
    works when the cache is activated (#688).

    !end-bullet!
-   !begin-bullet!
    simplification of internals (#692).

    !end-bullet!

!end-bullets-34!

## Infrastructure changes

!begin-bullets-35!

-   !begin-bullet!
    switched from travis and AppVeyor to GitHub Actions (#653, #660).

    !end-bullet!
-   !begin-bullet!
    Added basic continuous benchmarking with lorenzwalthert/touchstone
    (#674, #684, #698).

    !end-bullet!
-   !begin-bullet!
    include `test-*` files in styling pre-commit hook (#724).

    !end-bullet!

!end-bullets-35!

Thanks to all the people who made this release possible:

\@assignUser, \@ColmanHumphrey, \@davidchall, \@espinielli, \@giko45,
\@hadley, \@IndrajeetPatil, \@intiben, \@jamespeapen, \@jthomasmock,
\@Kalaschnik, \@kevinushey, \@krlmlr, \@lcolladotor, \@MichaelChirico,
\@michaelquinn32, \@mine-cetinkaya-rundel, \@pat-s, \@PMassicotte,
\@QuLogic, \@renkun-ken, \@RichardJActon, \@seed-of-apricot,
\@select-id-from-users, \@SimonDedman, \@stefanoborini, \@swsoyee, and
\@Winterstorm-j.

# styler 1.3.2

Release upon request by the CRAN team.

## Minor changes and fixes

!begin-bullets-36!

-   !begin-bullet!
    Add search and reference sections to pkgdown webpage (#623, #625).
    !end-bullet!
-   !begin-bullet!
    various fixes to handle special cases for caching and stylerignore
    and their interaction (#611, #610, #609, #607, #602, #600).
    !end-bullet!
-   !begin-bullet!
    also test on macOS (#604).
    !end-bullet!
-   !begin-bullet!
    skip timing tests on CRAN as requested by CRAN team because they did
    not pass on all machines (#603).
    !end-bullet!

!end-bullets-36!

# styler 1.3.1

Emergency release. In case multiple expressions are on one line and only
some of them are cached, styler can remove code. To reach this state,
some of the expressions must have been styled previously alone and the
cache must be active. Example:

!begin-codeblock!

    library(styler)
    cache_activate()
    #> Using cache 1.3.0 at ~/.Rcache/styler/1.3.0.
    style_text("1")
    #> 1
    style_text("1 # comment")
    #> # comment

!end-codeblock!

This is obviously detrimental. We have added additional tests and fixed
the problem (#593, #595), but we want repeat the warning from
`?style_file` that all style APIs apart from `style_text()` overwrite
code and that styler can only check the AST remains valid with
`scope < "tokens"`. So use this if you are conservative. Or deactivate
the cache with `deactivate_cache()` until it has fully matured.

We thank the people who have contributed to this release:

\@ellessenne and \@renkun-ken.

# styler 1.3.0

## Breaking changes

!begin-bullets-37!

-   !begin-bullet!
    `style_pkg()` and `style_dir()` gain a new argument `exclude_dirs`
    to exclude directories from styling, by default `renv` and
    `packrat`. Note that the defaults won't change the behavior of
    `style_pkg()` because it does anyways does not style these
    directories and they were set for consistency.

    !end-bullet!
-   !begin-bullet!
    `style_file()` and friends now strip `./` in file paths returned
    invisibly, i.e. `./script.R` becomes `script.R` (#568).

    !end-bullet!

!end-bullets-37!

## New features

!begin-bullets-38!

-   !begin-bullet!
    ignore certain lines using `# styler: off` and `#styler: on` or
    custom markers, see `?stylerignore` (#560).

    !end-bullet!
-   !begin-bullet!
    styler caches results of styling, so applying styler to code it has
    styled before will be instantaneous. This brings large speed boosts
    in many situations, e.g. when `style_pkg()` is run but only a few
    files have changed since the last styling or when using the styler
    pre-commit hook. Because styler caches by expression, you will also
    get speed boosts in large files with many expressions when you only
    change a few of them. See `?caching` for details (#538, #578).

    !end-bullet!
-   !begin-bullet!
    `create_style_guide()` gains two arguments `style_guide_name` and
    `style_guide_version` that are carried as meta data, in particular
    to version third-party style guides and ensure the proper
    functioning of caching. This change is completely invisible to users
    who don't create and distribute their own style guide like
    `tidyverse_style()` (#572).

    !end-bullet!

!end-bullets-38!

## Minor changes and fixes

!begin-bullets-39!

-   !begin-bullet!
    lines are now broken after `+` in `ggplot2` calls for
    `strict = TRUE` (#569).

    !end-bullet!
-   !begin-bullet!
    function documentation now contains many more line breaks due to
    roxygen2 update to version 7.0.1 (#566).

    !end-bullet!
-   !begin-bullet!
    spaces next to the braces in subsetting expressions `[` and `[[` are
    now removed (#580).

    !end-bullet!
-   !begin-bullet!
    Adapt to changes in the R parser to make styler pass R CMD check
    again. (#583).

    !end-bullet!

!end-bullets-39!

Thanks to all contributors involved, in particular \@colearendt,
\@davidski, \@IndrajeetPatil, \@pat-s, and \@programming-wizard.

# styler 1.2.0

## Breaking changes

!begin-bullets-40!

-   !begin-bullet!
    `style_file()` now correctly styles multiple files from different
    directories. We no longer display the file name of the styled file,
    but the absolute path. This is also reflected in the invisible
    return value of the function (#522).

    !end-bullet!
-   !begin-bullet!
    `style_file()` and friends do not write content back to a file when
    styling does not cause any changes in the file. This means the
    modification date of styled files is only changed when the content
    is changed (#532).

    !end-bullet!

!end-bullets-40!

## New features

!begin-bullets-41!

-   !begin-bullet!
    Aligned function calls are detected and remain unchanged if they
    match the styler definition for aligned function calls (#537).

    !end-bullet!
-   !begin-bullet!
    curly-curly (`{{`) syntactic sugar introduced with rlang 0.4.0 is
    now explicitly handled, where previously it was just treated as two
    consecutive curly braces (#528).

    !end-bullet!
-   !begin-bullet!
    `style_pkg()`, `style_dir()` and the Addins can now style
    `.Rprofile`, and hidden files are now also styled (#530).

    !end-bullet!

!end-bullets-41!

## Minor improvements and fixes

!begin-bullets-42!

-   !begin-bullet!
    Roxygen code examples: leverage `roxygen2` for correct escaping of
    expressions that contain `\`, in particular in `dontrun{}` and
    friends, allow quoted braces that are not matched (#729).

    !end-bullet!
-   !begin-bullet!
    Brace expressions in function calls are formatted in a less compact
    way to improve readability. Typical use case: `tryCatch()` (#543).

    !end-bullet!
-   !begin-bullet!
    Arguments in function declarations in a context which is indented
    multiple times should now be correct. This typically affects
    `R6::R6Class()` (#546).

    !end-bullet!
-   !begin-bullet!
    Escape characters in roxygen code examples are now correctly escaped
    (#512).

    !end-bullet!
-   !begin-bullet!
    Special characters such as `\n` in strings are now preserved in text
    and not turned into literal values like a line break (#554).

    !end-bullet!
-   !begin-bullet!
    Style selection Addin now preserves line break when the last line
    selected is an entire line (#520).

    !end-bullet!
-   !begin-bullet!
    Style file Addin can now properly handle cancelling (#511).

    !end-bullet!
-   !begin-bullet!
    The body of a multi-line function declaration is now indented
    correctly for `strict = FALSE` and also wrapped in curly braces for
    `strict = TRUE` (#536).

    !end-bullet!
-   !begin-bullet!
    Advice for contributors in `CONTRIBUTING.md` was updated (#508).

    !end-bullet!

!end-bullets-42!

## Adaption

!begin-bullets-43!

-   !begin-bullet!
    styler is now available through the pre-commit hook `style-files` in
    https://github.com/lorenzwalthert/precommit.
    !end-bullet!

!end-bullets-43!

Thanks to all contributors involved, in particular

\@Banana1530, \@batpigandme, \@cpsievert, \@ellessenne, \@Emiller88,
\@hadley, \@IndrajeetPatil, \@krlmlr, \@lorenzwalthert, \@lwjohnst86,
\@michaelquinn32, \@mine-cetinkaya-rundel, \@Moohan, \@nxskok,
\@oliverbeagley, \@pat-s, \@reddy-ia, and \@russHyde

# styler 1.1.1

This is primarily a maintenance release upon the request of the CRAN
team (#490).

## Major changes

!begin-bullets-44!

-   !begin-bullet!
    Users can now control style configurations for styler Addins (#463,
    #500), using the `Set style` Addin. See `?styler::styler_addins` for
    details.

    !end-bullet!
-   !begin-bullet!
    `return()` is now always put in braces and put on a new line when
    used in a conditional statement (#492).

    !end-bullet!
-   !begin-bullet!
    `%>%` almost always causes a line break now for `strict = TRUE`
    (#503).

    !end-bullet!

!end-bullets-44!

## Minor changes

!begin-bullets-45!

-   !begin-bullet!
    `style_pkg()` now also styles the "demo" directory by default
    (#453).

    !end-bullet!
-   !begin-bullet!
    multi-line strings are now styled more consistently (#459).

    !end-bullet!
-   !begin-bullet!
    indention in roxygen code example styling (#455) and EOF spacing
    (#469) was fixed.

    !end-bullet!
-   !begin-bullet!
    indention for for loop edge case (#457) and comments in pipe chain
    (#482) were fixed.

    !end-bullet!
-   !begin-bullet!
    line-break styling around comma is improved (#479).

    !end-bullet!
-   !begin-bullet!
    bug that can cause an error when the variable `text` in any name
    space before styler on the search path was defined and did not have
    length 1 is fixed (#484).

    !end-bullet!
-   !begin-bullet!
    slightly confusing warning about empty strings caused with roxygen
    code examples and Rmd was removed.

    !end-bullet!
-   !begin-bullet!
    right apostrophe to let package pass R CMD Check in strict Latin-1
    locale was removed (#490, reason for release).

    !end-bullet!

!end-bullets-45!

## Adaption of styler

Since it's never been mentioned in the release notes, we also mention
here where else you can use styler functionality:

!begin-bullets-46!

-   !begin-bullet!
    `usethis::use_tidy_style()` styles your project according to the
    tidyverse style guide.

    !end-bullet!
-   !begin-bullet!
    `reprex::reprex(style = TRUE)` to prettify reprex code before
    printing. To permanently use `style = TRUE` without specifying it
    every time, you can add the following line to your `.Rprofile` (via
    `usethis::edit_r_profile()`): `options(reprex.styler = TRUE)`.

    !end-bullet!
-   !begin-bullet!
    you can pretty-print your R code in RMarkdown reports without having
    styler modifying the source. This feature is implemented as a code
    chunk option in knitr. use `tidy = "styler"` in the header of a code
    chunks (e.g. ```` ```{r   name-of-the-chunk, tidy = "styler"} ````),
    or `knitr::opts_chunk$set(tidy =   "styler")` at the top of your
    RMarkdown script.

    !end-bullet!
-   !begin-bullet!
    pretty-printing of drake workflow data frames with
    `drake::drake_plan_source()`.

    !end-bullet!
-   !begin-bullet!
    Adding styler as a fixer to the ale Plug-in for VIM.

    !end-bullet!

!end-bullets-46!

Thanks to all contributors involved, in particular \@ArthurPERE,
\@hadley, \@igordot, \@IndrajeetPatil, \@jackwasey, \@jcrodriguez1989,
\@jennybc, \@jonmcalder, \@katrinleinweber, \@krlmlr, \@lorenzwalthert,
\@michaelquinn32, \@msberends, \@raynamharris, \@riccardoporreca,
\@rjake, \@Robinlovelace, \@skirmer, \@thalesmello, \@tobiasgerstenberg,
\@tvatter, \@wdearden, \@wmayner, and \@yech1990.

# styler 1.1.0

This release introduces new features and is fully backward-compatible.
It also adapts to changes in the R parser committed into R devel (#419).

## Major Changes

!begin-bullets-47!

-   !begin-bullet!
    styler can now style roxygen code examples in the source code of
    package (#332) as well as Rnw files (#431).

    !end-bullet!
-   !begin-bullet!
    the print method for the output of `style_text()`
    (`print.vertical()`) now returns syntax-highlighted code by default,
    controllable via the option `styler.colored_print.vertical` (#417).

    !end-bullet!
-   !begin-bullet!
    the README was redesigned (#413).

    !end-bullet!
-   !begin-bullet!
    semi-colon expression that contained multiple assignments was fixed
    (#404).

    !end-bullet!

!end-bullets-47!

## Minor Changes

!begin-bullets-48!

-   !begin-bullet!
    cursor position is remembered for styling via Addin (#416).

    !end-bullet!
-   !begin-bullet!
    adapt spacing around tilde for multi-token expressions(#424) and
    brace edge case (#425).

    !end-bullet!
-   !begin-bullet!
    only add brackets to piped function call if RHS is a symbol (#422).

    !end-bullet!
-   !begin-bullet!
    increase coverage again to over 90% (#412).

    !end-bullet!
-   !begin-bullet!
    move rule that turns single quotes into double quotes to token
    modifier in \`tidyverse_style_guide() (#406).

    !end-bullet!
-   !begin-bullet!
    remove line-breaks before commas (#405).

    !end-bullet!
-   !begin-bullet!
    removed package dependency enc in favor of xfun (#442).

    !end-bullet!

!end-bullets-48!

Thanks to all contributors for patches, issues and the like:
@jonmcalder, @krlmlr, @IndrajeetPatil, @kalibera, @Hasnep,
@kiranmaiganji, @dirkschumacher, @ClaytonJY, @wlandau, @maurolepore

# styler 1.0.2

This is a maintenance release without any breaking API changes.

## Major Changes

!begin-bullets-49!

-   !begin-bullet!
    Fixed indention for named multi-line function calls (#372).

    !end-bullet!
-   !begin-bullet!
    Non-R code chunks in `.Rmd` files are now respected and won't get
    styled (#386).

    !end-bullet!

!end-bullets-49!

## Minor Changes

!begin-bullets-50!

-   !begin-bullet!
    Fixing an edge case in which, if very long strings were present in
    the code, tokens could be replaced with wrong text (#384).

    !end-bullet!
-   !begin-bullet!
    Spacing around tilde in formulas depends now on whether there is a
    LHS in the formula (#379).

    !end-bullet!
-   !begin-bullet!
    Spaces are now also added around `EQ_SUB` (`=`) (#380).

    !end-bullet!
-   !begin-bullet!
    Added `CONTRIBUTING.md` to outline guidelines for contributing to
    styler.

    !end-bullet!
-   !begin-bullet!
    More informative error messages for parsing problems (#401, #400).

    !end-bullet!
-   !begin-bullet!
    Improved documentation (#387).

    !end-bullet!

!end-bullets-50!

Thanks to all contributors for patches, issues and the like:
@katrinleinweber, @krlmlr, @dchiu911, @ramnathv, @aedobbyn, @Bio7,
@tonytonov, @samhinshaw, @fny, @vnijs, @martin-mfg, @NGaffney,
@dchiu911.

# styler 1.0.1

This is a maintenance release without any breaking API changes.

## Major & dependency related changes

!begin-bullets-51!

-   !begin-bullet!
    Removed implicit `dplyr` dependency via `purrr:::map_dfr()` (thanks
    @jimhester, #324).

    !end-bullet!
-   !begin-bullet!
    Added required minimal version dependency for purr (`>= 0.2.3`)
    (#338).

    !end-bullet!
-   !begin-bullet!
    We rely on the tibble package which was optimized for speed in
    `v1.4.2` so styler should run \~2x as fast (#348). For that reason,
    styler now depends on `tibble >= 1.4.2`.

    !end-bullet!
-   !begin-bullet!
    In the dependency `enc`, a bug was fixed that removed/changed
    non-ASCII characters. Hence, styler now depends on `enc >= 0.2`
    (#348).

    !end-bullet!

!end-bullets-51!

## Minor changes

!begin-bullets-52!

-   !begin-bullet!
    We're now recognizing and respecting more DSLs used in R comments:
    rplumber (`#*`, #306), shebang `#/!` (#345), knitr chunk headers for
    spinning (`#+` / `#-`, #362).

    !end-bullet!
-   !begin-bullet!
    Named arguments can stay on the first line if call is multi-line
    (#318).

    !end-bullet!
-   !begin-bullet!
    No space anymore with `tidyverse_style()` after `!!` since with
    `rlang 0.2`, `!!` now binds tighter (#322), spacing around `~`
    (#316), no space anymore around `^` (#308).

    !end-bullet!
-   !begin-bullet!
    Code chunks in Rmd documents that don't use the R engine are no
    longer formatted (#313).

    !end-bullet!
-   !begin-bullet!
    Various bug fixes and edge case improvements.

    !end-bullet!

!end-bullets-52!

Thanks to all contributors for patches, issues and the like: @devSJR,
@klrmlr, @yutannihilation, @samhinshaw, @martin-mfg, @jjramsey,
@RMHogervorst, @wlandau, @llrs, @aaronrudkin, @crew102, @jkgrain,
@jennybc, @joranE.

# styler 1.0.0

Initial release.

## stylers

These are functions used to style code. They style a directory, a whole
package, a file or a string.

!begin-codeblock!

    style_dir(path = ".", 
      ..., style = tidyverse_style, transformers = style(...), 
      filetype = "R", recursive = TRUE, exclude_files = NULL
    )

    style_pkg(pkg = ".", 
      ..., style = tidyverse_style, transformers = style(...), filetype = "R", 
      exclude_files = "R/RcppExports.R"
    )


    style_file(path, 
      ..., style = tidyverse_style, transformers = style(...)
    )

    style_text(text, ..., style = tidyverse_style, transformers = style(...))

!end-codeblock!

## style guides

These functions are the style guides implemented.

!begin-codeblock!

    tidyverse_style(
      scope = "tokens", 
      strict = TRUE, 
      indent_by = 2, 
      start_comments_with_one_space = FALSE, 
      reindention = tidyverse_reindention(), 
      math_token_spacing = tidyverse_math_token_spacing()
    )
    tidyverse_reindention()
    tidyverse_math_token_spacing())

!end-codeblock!

## style guide creators

This function is used to create a style guide.

!begin-codeblock!

    create_style_guide(
      initialize = default_style_guide_attributes, 
      line_break = NULL, 
      space = NULL, 
      token = NULL, 
      indention = NULL, 
      use_raw_indention = FALSE, 
      reindention = tidyverse_reindention()
    )

!end-codeblock!

## Helpers

These are helper functions used to specify the style guides in use.

!begin-codeblock!

    specify_math_token_spacing(
      zero = NULL, 
      one = c("'+'", "'-'", "'*'", "'/'", "'^'")
    )

    specify_reindention(
      regex_pattern = NULL, 
      indention = 0, 
      comments_only = TRUE
    )
    initialize_default_attributes(pd_flat)

!end-codeblock!

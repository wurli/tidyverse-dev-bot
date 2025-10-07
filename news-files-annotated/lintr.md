# lintr (development version)

## Deprecations & breaking changes

!begin-bullets-1!

-   !begin-bullet!
    Arguments `allow_cascading_assign=`, `allow_right_assign=`, and
    `allow_pipe_assign=` to `assignment_linter()` are now defunct.
    !end-bullet!
-   !begin-bullet!
    Six linters marked as deprecated with warning in the previous
    release are now fully deprecated: `consecutive_stopifnot_linter()`,
    `extraction_operator_linter()`, `no_tab_linter()`,
    `single_quotes_linter()`, `unnecessary_nested_if_linter()`, and
    `unneeded_concatenation_linter()`. They will be removed in the next
    release.
    !end-bullet!
-   !begin-bullet!
    As previously announced, the following fully-deprecated items are
    now removed from the package:
    !begin-bullets-2!
    -   !begin-bullet!
        `source_file=` argument to `ids_with_token()` and `with_id()`.
        !end-bullet!
    -   !begin-bullet!
        Passing linters by name or as non-`"linter"`-classed functions.
        !end-bullet!
    -   !begin-bullet!
        `linter=` argument of `Lint()`.
        !end-bullet!
    -   !begin-bullet!
        `with_defaults()`.
        !end-bullet!
    -   !begin-bullet!
        Linters `closed_curly_linter()`, `open_curly_linter()`,
        `paren_brace_linter()`, and `semicolon_terminator_linter()`.
        !end-bullet!

    !end-bullets-2!
    !end-bullet!
-   !begin-bullet!
    Argument `interpret_glue` to `object_usage_linter()` is deprecated
    in favor of the more general `interpret_extensions`, in which
    `"glue"` is present by default (#1472, @MichaelChirico). See the
    description below.
    !end-bullet!
-   !begin-bullet!
    The default for `pipe_consistency_linter()` is changed from `"auto"`
    (require one pipe style, either magrittr or native) to `"|>"` (R
    native pipe required) to coincide with the same change in the
    Tidyverse Style Guide (#2707, @MichaelChirico).
    !end-bullet!

!end-bullets-1!

## Bug fixes

!begin-bullets-3!

-   !begin-bullet!
    `Lint()`, and thus all linters, ensures that the returned object's
    `message` attribute is consistently a simple character string (and
    not, for example, an object of class `"glue"`; #2740,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    Files with encoding inferred from settings read more robustly under
    `lint(parse_settings = TRUE)` (#2803, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `assignment_linter()` no longer errors if `"%<>%"` is an allowed
    operator (#2850, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `condition_call_linter()` no longer covers cases where the object
    type in the ellipsis cannot be determined with certainty (#2888,
    #2890, @Bisaloo). In particular, this fixes the known false positive
    of custom conditions created via `errorCondition()` or
    `warningCondition()` not being compatible with the `call.` argument
    in `stop()` or `warning()`.
    !end-bullet!

!end-bullets-3!

## Changes to default linters

!begin-bullets-4!

-   !begin-bullet!
    `pipe_consistency_linter()`, with its new default to enforce the
    native pipe `|>`, is now a default linter, since it corresponds
    directly to a rule in the Tidyverse Style Guide (#2707,
    @MichaelChirico).
    !end-bullet!

!end-bullets-4!

## New and improved features

!begin-bullets-5!

-   !begin-bullet!
    `brace_linter()`' has a new argument `function_bodies` (default
    `"multi_line"`) which controls when to require function bodies to be
    wrapped in curly braces, with the options `"always"`, `"multi_line"`
    (only require curly braces when a function body spans multiple
    lines), `"not_inline"` (only require curly braces when a function
    body starts on a new line) and `"never"` (#1807, #2240, @salim-b).
    !end-bullet!
-   !begin-bullet!
    `seq_linter()`:
    !begin-bullets-6!
    -   !begin-bullet!
        recommends using `seq_along(x)` instead of `seq_len(length(x))`
        (#2577, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        recommends using `sequence()` instead of
        `unlist(lapply(ints, seq))` (#2618, @Bisaloo)
        !end-bullet!

    !end-bullets-6!
    !end-bullet!
-   !begin-bullet!
    `undesirable_operator_linter()`:
    !begin-bullets-7!
    -   !begin-bullet!
        Lints operators in prefix form, e.g. `` `%%`(x, 2) `` (#1910,
        @MichaelChirico). Disable this by setting
        `call_is_undesirable=FALSE`.
        !end-bullet!
    -   !begin-bullet!
        Accepts unnamed entries, treating them as undesirable operators,
        e.g. `undesirable_operator_linter("%%")` (#2536,
        @MichaelChirico).
        !end-bullet!

    !end-bullets-7!
    !end-bullet!
-   !begin-bullet!
    `indentation_linter()` handles `for` un-braced for loops correctly
    (#2564, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    Setting `exclusions` supports globs like `knitr*` to exclude
    files/directories with a pattern (#1554, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `get_source_expression()` captures warnings emitted by the R parser
    (currently always for mis-specified literal integers like `1.1L`)
    and `lint()` returns them as lints (#2065, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `object_name_linter()` and `object_length_linter()` apply to objects
    assigned with `assign()` or generics created with `setGeneric()`
    (#1665, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` gains argument `interpret_extensions` to
    govern which false positive-prone common syntaxes should be checked
    for used objects (#1472, @MichaelChirico). Currently `"glue"`
    (renamed from earlier argument `interpret_glue`) and `"rlang"` are
    supported. The latter newly covers usage of the `.env` pronoun like
    `.env$key`, where `key` was previously missed as being a used
    variable.
    !end-bullet!
-   !begin-bullet!
    `boolean_arithmetic_linter()` finds many more cases like
    `sum(x | y) == 0` where the total of a known-logical vector is
    compared to 0 (#1580, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `expect_lint()` has a new argument `ignore_order` (default `FALSE`),
    which, if `TRUE`, allows the `checks=` to be provided in arbitary
    order vs. how `lint()` produces them (@MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `undesirable_function_linter()` accepts unnamed entries, treating
    them as undesirable functions,
    e.g. `undesirable_function_linter("sum")` (#2536, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `any_duplicated_linter()` is extended to recognize some usages from
    {dplyr} and {data.table} that could be replaced by
    `anyDuplicated()`, e.g. `n_distinct(col) == n()` or
    `uniqueN(col) == .N` (#2482, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    New `gitlab_output()` function to output lints to GitLab format
    (#2858, @lschneiderbauer)
    !end-bullet!
-   !begin-bullet!
    `brace_linter()` requires `test_that()`'s `code=` argument to have
    curly braces (#2292, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `fixed_regex_linter()` recognizes usage of the new (R 4.5.0)
    `grepv()` wrapper of `grep()`; `regex_subset_linter()` also
    recommends `grepv()` alternatives (#2855, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` lints missing packages that may cause false
    positives (#2872, @AshesITR)
    !end-bullet!
-   !begin-bullet!
    New argument `include_s4_slots` for the `xml_find_function_calls()`
    entry in the `get_source_expressions()` to govern whether calls of
    the form `s4Obj@fun()` are included in the result (#2820,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `sprintf_linter()` lints `sprintf()` and `gettextf()` calls when a
    constant string is passed to `fmt` (#2894, @Bisaloo).
    !end-bullet!
-   !begin-bullet!
    `use_lintr()` adds the created `.lintr` file to the `.Rbuildignore`
    if run in a package (#2926, initial work by @MEO265, finalized by
    @Bisaloo).
    !end-bullet!

!end-bullets-5!

### New linters

!begin-bullets-8!

-   !begin-bullet!
    `all_equal_linter()` warns about incorrect use of `all.equal()` in
    `if` clauses or preceded by `!` (#2885, @Bisaloo).
    !end-bullet!
-   !begin-bullet!
    `download_file_linter()` encourages the use of `mode = "wb"` (or
    `mode = "ab"`) when using `download.file()`, rather than
    `mode = "w"` or `mode = "a"`, as the latter can produce broken files
    in Windows (#2882, @Bisaloo).
    !end-bullet!
-   !begin-bullet!
    `lint2df_linter()` encourages the use of the `list2DF()` function,
    or the `data.frame()` function when recycling is required, over the
    slower and less readable `do.call(cbind.data.frame, )` alternative
    (#2834, @Bisaloo).
    !end-bullet!
-   !begin-bullet!
    `coalesce_linter()` encourages the use of the infix operator
    `x %||% y`, which is equivalent to `if (is.null(x)) y else x`
    (#2246, @MichaelChirico). While this has long been used in many
    tidyverse packages (it was added to {ggplot2} in 2008), it became
    part of every R installation from R 4.4.0. Thanks also to
    @emmanuel-ferdman for fixing a false positive before release.
    !end-bullet!

!end-bullets-8!

### Lint accuracy fixes: removing false positives

!begin-bullets-9!

-   !begin-bullet!
    `unnecessary_nesting_linter()`:
    !begin-bullets-10!
    -   !begin-bullet!
        Treats function bodies under the shorthand lambda (`\()`) the
        same as normal function bodies (#2748, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Treats `=` assignment the same as `<-` when deciding to combine
        consecutive `if()` clauses (#2245, @MichaelChirico).
        !end-bullet!

    !end-bullets-10!
    !end-bullet!
-   !begin-bullet!
    `unnecessary_nesting_linter()` treats function bodies under the
    shorthand lambda (`\()`) the same as normal function bodies (#2748,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `string_boundary_linter()` omits lints of patterns like `\\^` which
    have an anchor but are not regular expressions (#2636,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `implicit_integer_linter(allow_colon = TRUE)` is OK with negative
    literals, e.g. `-1:1` or `1:-1` (#2673, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `missing_argument_linter()` allows empty calls like `foo()` even if
    there are comments between `(` and `)` (#2741, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `return_linter()` works on functions that happen to use braced
    expressions in their formals (#2616, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `object_name_linter()` and `object_length_linter()` account for S3
    class correctly when the generic is assigned with `=` (#2507,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `assignment_linter()` with `operator = "="` does a better job of
    skipping implicit assignments, which are intended to be governed by
    `implicit_assignment_linter()` (#2765, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `expect_true_false_linter()` is pipe-aware, so that
    `42 |> expect_identical(x, ignore_attr = TRUE)` no longer lints
    (#1520, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `T_and_F_symbol_linter()` ignores `T` and `F` used as symbols in
    formulas (`y ~ T + F`), which can represent variables in data not
    controlled by the author (#2637, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `implicit_assignment_linter()` with `allow_scoped=TRUE` doesn't lint
    for `if (a <- 1) print(a)` (#2913, @MichaelChirico).
    !end-bullet!

!end-bullets-9!

### Lint accuracy fixes: removing false negatives

!begin-bullets-11!

-   !begin-bullet!
    `todo_comment_linter()` finds comments inside {roxygen2} markup
    comments (#2447, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    Linters with logic around function declarations consistently include
    the R 4.0.0 shorthand `\()` (#2818, continuation of earlier #2190,
    @MichaelChirico).
    !begin-bullets-12!
    -   !begin-bullet!
        `library_call_linter()`
        !end-bullet!
    -   !begin-bullet!
        `terminal_close_linter()`
        !end-bullet!
    -   !begin-bullet!
        `unnecessary_lambda_linter()`
        !end-bullet!

    !end-bullets-12!
    !end-bullet!
-   !begin-bullet!
    More consistency on handling `@` extractions (#2820,
    @MichaelChirico).
    !begin-bullets-13!
    -   !begin-bullet!
        `function_left_parentheses_linter()`
        !end-bullet!
    -   !begin-bullet!
        `indentation_linter()`
        !end-bullet!
    -   !begin-bullet!
        `library_call_linter()`
        !end-bullet!
    -   !begin-bullet!
        `missing_argument_linter()`
        !end-bullet!

    !end-bullets-13!
    !end-bullet!

!end-bullets-11!

## Notes

!begin-bullets-14!

-   !begin-bullet!
    `{lintr}` now has an associated paper at the Journal of Open Source
    Software that you can use to cite the package if you use it in a
    paper - see citation("lintr") for details.
    !end-bullet!
-   !begin-bullet!
    `expect_lint_free()` and other functions that rely on the {testthat}
    framework now have a consistent error message. (#2585, @F-Noelle).
    !end-bullet!
-   !begin-bullet!
    `unnecessary_nesting_linter()` gives a more specific lint message
    identifying:
    !begin-bullets-15!
    -   !begin-bullet!
        the unmatched "exit call" that prompts the recommendation to
        reduce nesting (#2316, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        the specific `if()` statement that can be combined with the
        linted one (#1891, @MichaelChirico).
        !end-bullet!

    !end-bullets-15!
    !end-bullet!
-   !begin-bullet!
    The description in `?paste_linter` of `allow_file_path=` has been
    corrected (#2675, @MichaelChirico). In particular,
    `allow_file_path="never"` is the most strict form,
    `allow_file_path="always"` is the most lax form.
    !end-bullet!
-   !begin-bullet!
    `comment_token` is removed from settings. This was a vestige of the
    now-defunct support for posting GitHub comments.
    !end-bullet!

!end-bullets-14!

# lintr 3.2.0

## Deprecations & breaking changes

!begin-bullets-16!

-   !begin-bullet!
    Various things marked deprecated since {lintr} 3.0.0 have been fully
    deprecated. They will be completely removed in the subsequent
    release. See previous NEWS for advice on how to replace them.
    !begin-bullets-17!
    -   !begin-bullet!
        `source_file=` argument to `ids_with_token()` and `with_id()`.
        !end-bullet!
    -   !begin-bullet!
        Passing linters by name or as non-`"linter"`-classed functions.
        !end-bullet!
    -   !begin-bullet!
        `linter=` argument of `Lint()`.
        !end-bullet!
    -   !begin-bullet!
        `with_defaults()`.
        !end-bullet!
    -   !begin-bullet!
        Linters `closed_curly_linter()`, `open_curly_linter()`,
        `paren_brace_linter()`, and `semicolon_terminator_linter()`.
        !end-bullet!
    -   !begin-bullet!
        Helper `with_defaults()`.
        !end-bullet!

    !end-bullets-17!
    !end-bullet!
-   !begin-bullet!
    `all_linters()` has signature `all_linters(..., packages)` rather
    than `all_linters(packages, ...)` (#2332, @MichaelChirico). This
    forces `packages=` to be supplied by name and will break users who
    rely on supplying `packages=` positionally, of which we found none
    searching GitHub.
    !end-bullet!
-   !begin-bullet!
    Adjusted various lint messages for consistency and readability
    (#1330, @MichaelChirico). In general, we favor lint messages to be
    phrased like "Action, reason" to put the "what" piece of the message
    front-and-center. This may be a breaking change for code that tests
    the specific phrasing of lints.
    !end-bullet!
-   !begin-bullet!
    `extraction_operator_linter()` is deprecated. Although switching
    from `$` to `[[` has some robustness benefits for package code, it
    can lead to non-idiomatic code in many contexts (e.g. R6 classes,
    Shiny applications, etc.) (#2409, @IndrajeetPatil). One reason to
    avoid `$` is that it allows partial matching where `[[` does not.
    Use `options(warnPartialMatchDollar = TRUE)` to disable this feature
    and restore some parity to using `$` vs. `[[`.
    !end-bullet!
-   !begin-bullet!
    `unnecessary_nested_if_linter()` is deprecated and subsumed into the
    new/more general `unnecessary_nesting_linter()`.
    !end-bullet!
-   !begin-bullet!
    Dropped support for posting GitHub comments from inside GitHub
    comment bot, Travis, Wercker, and Jenkins CI tools (spurred by
    #2148, @MichaelChirico). We rely on GitHub Actions for linting in
    CI, and don't see any active users relying on these alternatives. We
    welcome and encourage community contributions to get support for
    different CI systems going again.
    !end-bullet!
-   !begin-bullet!
    `cyclocomp_linter()` is no longer part of the default linters
    (#2555, @IndrajeetPatil) because the tidyverse style guide doesn't
    contain any guidelines on meeting certain complexity requirements.
    With this, we also downgrade {cyclocomp} from `Imports:` to
    `Suggests:`. Note that users with `cyclocomp_linter()` in their
    configs may now need to install {cyclocomp} intentionally, in
    particular in CI/CD pipelines.
    !end-bullet!
-   !begin-bullet!
    `scalar_in_linter()` is now configurable to allow other `%in%`-like
    operators to be linted. The data.table operator `%chin%` is no
    longer linted by default; use `in_operators = "%chin%"` to continue
    linting it. (@F-Noelle)
    !end-bullet!
-   !begin-bullet!
    `lint()` and friends now normalize paths to forward slashes on
    Windows (@olivroy, #2613).
    !end-bullet!
-   !begin-bullet!
    `undesirable_function_linter()`, `undesirable_operator_linter()`,
    and `list_comparison_linter()` were removed from the tag
    `efficiency` (@IndrajeetPatil, #2655). If you use
    `linters_with_tags("efficiency")` to include these linters, you'll
    need to adjust your config to keep linting your code against them.
    We did not find any such users on GitHub.
    !end-bullet!
-   !begin-bullet!
    Arguments `allow_cascading_assign=`, `allow_right_assign=`, and
    `allow_pipe_assign=` to `assignment_linter()` are all deprecated in
    favor of the new `operator=` argument. Usage of a positional first
    argument like `assignment_linter(TRUE)`, of which we found zero
    cases on GitHub, is totally deprecated to allow `operator=` to be
    positionally first. See below about the new argument.
    !end-bullet!

!end-bullets-16!

## Bug fixes

!begin-bullets-18!

-   !begin-bullet!
    `expect_identical_linter()` also skips `expect_equal()` comparison
    to *negative* non-integers like `-1.034` (#2411, @Bisaloo). This is
    a parity fix since *positive* reals have always been skipped because
    "high-precision" comparisons are typically done to get tests within
    `tolerance`, so `expect_identical()` is not a great substitution.
    !end-bullet!
-   !begin-bullet!
    `object_name_linter()` no longer errors when user-supplied
    `regexes=` have capture groups (#2188, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `.lintr` config validation correctly accepts regular expressions
    which only compile under `perl = TRUE` (#2375, @MichaelChirico).
    These have always been valid (since `rex::re_matches()`, which
    powers the lint exclusion logic, also uses this setting), but the
    new up-front validation in v3.1.1 incorrectly used `perl = FALSE`.
    !end-bullet!
-   !begin-bullet!
    `.lintr` configs set by option `lintr.linter_file` or environment
    variable `R_LINTR_LINTER_FILE` can point to subdirectories (#2512,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `indentation_linter()` returns lints with `ranges[1L]==1L` when the
    offending line has 0 spaces (#2550, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `literal_coercion_linter()` doesn't surface a warning about `NA`s
    during coercion for code like `as.integer("a")` (#2566,
    @MichaelChirico).
    !end-bullet!

!end-bullets-18!

## Changes to default linters

!begin-bullets-19!

-   !begin-bullet!
    New default linter `return_linter()` for the style guide rule that
    terminal returns should be left implicit (#1100, #2343, #2354, and
    #2356, @MEO265 and @MichaelChirico).
    !end-bullet!

!end-bullets-19!

## New and improved features

!begin-bullets-20!

-   !begin-bullet!
    New function node caching for big efficiency gains to most linters
    (e.g. overall `lint_package()` improvement of 14-27% and core
    linting improvement up to 30%; #2357, @AshesITR). Most linters are
    written around function usage, and XPath performance searching for
    many functions is poor. The new `xml_find_function_calls()` entry in
    the `get_source_expressions()` output caches all function call nodes
    instead. See the vignette on creating linters for more details on
    how to use it.
    !end-bullet!
-   !begin-bullet!
    `Linter()` has a new argument `linter_level=` (default `NA`). This
    is used by `lint()` to more efficiently check for expression levels
    than the idiom `if (!is_lint_level(...)) { return(list()) }` (#2351,
    @AshesITR).
    !end-bullet!
-   !begin-bullet!
    New `return_linter()` also has arguments for fine-tuning which
    functions get linted:
    !begin-bullets-21!
    -   !begin-bullet!
        `return_style=` (`"implicit"` by default) which checks that all
        functions confirm to the specified return style of `"implicit"`
        or `"explicit"` (#2271 and part of #884, @MichaelChirico,
        @AshesITR and @MEO265).
        !end-bullet!
    -   !begin-bullet!
        `allow_implicit_else=` (default `TRUE`) which, when `FALSE`,
        checks that all terminal `if` statements are paired with a
        corresponding `else` statement (part of #884, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        `return_functions=` to customize which functions are equivalent
        to `return()` as "exit" clauses, e.g. `rlang::abort()` can be
        considered in addition to the default functions like `stop()`
        and `q()` from base (#2271 and part of #884, @MichaelChirico and
        @MEO265).
        !end-bullet!
    -   !begin-bullet!
        `except=` to customize which functions are ignored entirely
        (i.e., whether they have a return of the specified style is not
        checked; #2271 and part of #884, @MichaelChirico and @MEO265).
        Namespace hooks like `.onAttach()` and `.onLoad()` are always
        ignored.
        !end-bullet!
    -   !begin-bullet!
        `except_regex=`, the same purpose as `except=`, but filters
        functions by pattern. This is motivated by {RUnit}, where test
        suites are based on unit test functions matched by pattern,
        e.g. `^Test`, and where explicit return may be awkward (#2335,
        @MichaelChirico).
        !end-bullet!

    !end-bullets-21!
    !end-bullet!
-   !begin-bullet!
    `assignment_linter()` can be fully customized with the new
    `operator=` argument to specify an exact vector of assignment
    operators to allow (#2441, @MichaelChirico and @J-Moravec). The
    default is `<-` and `<<-`; authors wishing to use `=` (only) for
    assignment in their codebase can use `operator = "="`. This
    supersedes several old arguments: to accomplish
    `allow_cascading_assign=TRUE`, add `"<<-"` (and/or `"->>"`) to
    `operator=`; for `allow_right_assign=TRUE`, add `"->"` (and/or
    `"->>"`) to `operator=`; for `allow_pipe_assign=TRUE`, add `"%<>%"`
    to `operator=`. Use `operator = "any"` to denote "ignore all
    assignment operators"; in this case, only the value of
    `allow_trailing=` matters. Implicit assignments with `<-` are always
    ignored by `assignment_linter()`; use `implicit_assignment_linter()`
    to handle linting these.
    !end-bullet!
-   !begin-bullet!
    More helpful errors for invalid configs (#2253, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `library_call_linter()` is extended
    !begin-bullets-22!
    -   !begin-bullet!
        to encourage all packages to be attached with `library(symbol)`,
        not `library("symbol", character.only = TRUE)` or "vectorized"
        approaches looping over package names (part of #884,
        @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        to discourage many consecutive calls to `suppressMessages()` or
        `suppressPackageStartupMessages()` (part of #884,
        @MichaelChirico).
        !end-bullet!

    !end-bullets-22!
    !end-bullet!
-   !begin-bullet!
    `unnecessary_lambda_linter()` is extended to encourage vectorized
    comparisons where possible, e.g. `sapply(x, sum) > 0` instead of
    `sapply(x, function(x) sum(x) > 0)` (part of #884, @MichaelChirico).
    Toggle this behavior with argument `allow_comparison=`.
    !end-bullet!
-   !begin-bullet!
    `backport_linter()` is slightly faster by moving expensive
    computations outside the linting function (#2339, #2348, @AshesITR
    and @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `string_boundary_linter()` recognizes regular expression calls like
    `grepl("^abc$", x)` that can be replaced by using `==` instead
    (#1613, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `unreachable_code_linter()` has an argument `allow_comment_regex=`
    for customizing which "terminal" comments to exclude (#2327,
    @MichaelChirico). Exclusion comments from {lintr} and {covr}
    (e.g. `# nocov end`) are always excluded.
    !end-bullet!
-   !begin-bullet!
    `format()` and `print()` methods for `lint` and `lints` classes get
    a new option `width=` to control the printing width of lint messages
    (#1884, @MichaelChirico). The default is controlled by a new option
    `lintr.format_width`; if unset, no wrapping occurs (matching earlier
    behavior).
    !end-bullet!
-   !begin-bullet!
    `implicit_assignment_linter()` gets a custom message for the case of
    using `(` to induce printing like `(x <- foo())`; use an explicit
    call to `print()` for clarity (#2257, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `todo_comment_linter()` has a new argument `except_regex=` for
    setting *valid* TODO comments, e.g. for forcing TODO comments to be
    linked to GitHub issues like `TODO(#154)` (#2047, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `vector_logic_linter()` is extended to recognize incorrect usage of
    scalar operators `&&` and `||` inside subsetting expressions like
    `dplyr::filter(x, A && B)` (#2166, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `any_is_na_linter()` is extended to catch the unusual usage
    `NA %in% x` (#2113, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `make_linter_from_xpath()` errors up front when `lint_message=` is
    missing (instead of delaying this error until the linter is used,
    #2541, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `paste_linter()` is extended to recommend using `paste()` instead of
    `paste0()` for simply aggregating a character vector with
    `collapse=`, i.e., when `sep=` is irrelevant (#1108,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `expect_no_lint()` was added as new function to cover the typical
    use case of expecting no lint message, akin to the recent {testthat}
    functions like `expect_no_warning()` (#2580, @F-Noelle).
    !end-bullet!
-   !begin-bullet!
    `lint()` and friends emit a message if no lints are found (#2643,
    @IndrajeetPatil).
    !end-bullet!
-   !begin-bullet!
    `commented_code_linter()` can detect commented code that ends with a
    pipe (#2671, @jcken95)
    !end-bullet!

!end-bullets-20!

### New linters

!begin-bullets-23!

-   !begin-bullet!
    `condition_call_linter()` for ensuring consistent use of `call.` in
    `warning()` and `stop()`. The default `call. = FALSE` follows the
    tidyverse guidance of not displaying the call (#2226, @Bisaloo)
    !end-bullet!
-   !begin-bullet!
    `sample_int_linter()` for encouraging `sample.int(n, ...)` over
    equivalents like `sample(1:n, ...)` (part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `stopifnot_all_linter()` discourages tests with `all()` like
    `stopifnot(all(x > 0))`; `stopifnot()` runs `all()` itself, and
    signals a better error message (part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `comparison_negation_linter()` for discouraging negated comparisons
    when a direct negation is preferable, e.g. `!(x == y)` could be
    `x != y` (part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `nzchar_linter()` for encouraging `nzchar()` to test for empty
    strings, e.g. `nchar(x) > 0` can be `nzchar(x)` (part of #884,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `terminal_close_linter()` for discouraging using `close()` to end
    functions (part of #884, @MichaelChirico). Such usages are not
    robust to errors, where `close()` will not be run as intended. Put
    `close()` in an `on.exit()` hook, or use {withr} to manage
    connections with proper cleanup.
    !end-bullet!
-   !begin-bullet!
    `rep_len_linter()` for encouraging use of `rep_len()` directly
    instead of `rep(x, length.out = n)` (part of #884, @MichaelChirico).
    Note that in older versions of R (e.g. pre-4.0), `rep_len()` may not
    copy attributes as expected.
    !end-bullet!
-   !begin-bullet!
    `which_grepl_linter()` for discouraging `which(grepl(ptn, x))` in
    favor of directly using `grep(ptn, x)` (part of #884,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `list_comparison_linter()` for discouraging comparisons on the
    output of `lapply()`, e.g. `lapply(x, sum) > 10` (part of #884,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `print_linter()` for discouraging usage of `print()` on string
    literals like `print("Reached here")` or
    `print(paste("Found", nrow(DF), "rows."))` (#1894, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `unnecessary_nesting_linter()` for discouraging overly-nested code
    where an early return or eliminated sub-expression (inside `{`) is
    preferable (#2317, #2334 and part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `consecutive_mutate_linter()` for encouraging consecutive calls to
    `dplyr::mutate()` to be combined (part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `if_switch_linter()` for encouraging `switch()` over repeated
    `if`/`else` tests (#2322 and part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `nested_pipe_linter()` for discouraging pipes within pipes,
    e.g. `df1 %>% inner_join(df2 %>% select(a, b))` (part of #884,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `nrow_subset_linter()` for discouraging usage like
    `nrow(subset(x, conditions))` in favor of something like
    `with(x, sum(conditions))` which doesn't require a full subset of
    `x` (#2313, #2314 and part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `pipe_return_linter()` for discouraging usage of `return()` inside a
    {magrittr} pipeline (part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `one_call_pipe_linter()` for discouraging one-step pipelines like
    `x |> as.character()` (#2330 and part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `object_overwrite_linter()` for discouraging re-use of upstream
    package exports as local variables (#2344, #2346 and part of #884,
    @MichaelChirico and @AshesITR).
    !end-bullet!

!end-bullets-23!

### Lint accuracy fixes: removing false positives

!begin-bullets-24!

-   !begin-bullet!
    `object_name_linter()` and `object_length_linter()` ignore {rlang}
    name injection like `x |> mutate("{new_name}" := foo(col))` (#1926,
    @MichaelChirico). No checking is applied in such cases. {data.table}
    in-place assignments like `DT[, "sPoNGeBob" := "friend"]` are still
    eligible for lints.
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` finds global variables assigned with `=` or
    `->`, which avoids some issues around "undefined global variables"
    in scripts (#2654, @MichaelChirico).
    !end-bullet!

!end-bullets-24!

## Notes

!begin-bullets-25!

-   !begin-bullet!
    `{lintr}` now has a hex sticker
    (https://github.com/rstudio/hex-stickers/pull/110). Thank you,
    @gregswinehart!
    !end-bullet!
-   !begin-bullet!
    All user-facing messages (including progress bars) are now prepared
    using the `{cli}` package (#2418 and #2641, @IndrajeetPatil). As
    noted above, all messages have been reviewed and updated to be more
    informative and consistent.
    !end-bullet!
-   !begin-bullet!
    File locations in lints and error messages contain clickable
    hyperlinks to improve code navigation (#2645, #2588, @olivroy).
    !end-bullet!
-   !begin-bullet!
    {lintr} now depends on R version 4.0.0. It already does so
    implicitly due to recursive upstream dependencies requiring this
    version; we've simply made that dependency explicit and up-front
    (#2569, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    Some code with parameters accepting regular expressions is less
    strict about whether there are capture groups (#2678,
    @MichaelChirico). In particular, this affects
    `unreachable_code_linter(allow_comment_regex=)` and
    `expect_lint(checks=)`.
    !end-bullet!

!end-bullets-25!

# lintr 3.1.2

## New and improved features

### Lint accuracy fixes: removing false positives

!begin-bullets-26!

-   !begin-bullet!
    `unreachable_code_linter()` ignores reachable code in inline
    functions like `function(x) if (x > 2) stop() else x` (#2259,
    @MEO265).
    !end-bullet!
-   !begin-bullet!
    `unnecessary_lambda_linter()`
    !begin-bullets-27!
    -   !begin-bullet!
        ignores extractions with explicit returns like
        `lapply(l, function(x) foo(x)$bar)` (#2258, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        ignores calls on the RHS of operators like
        `lapply(l, function(x) "a" %in% names(x))` (#2310,
        @MichaelChirico).
        !end-bullet!

    !end-bullets-27!
    !end-bullet!
-   !begin-bullet!
    `vector_logic_linter()` recognizes some cases where bitwise `&`/`|`
    are used correctly (#1453, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `expect_comparison_linter()` ignores faulty usage like
    `expect_true(x, y > z)` (#2083, @MichaelChirico). Note that `y > z`
    is being passed to the `info=` argument, so this is likely a
    mistake.
    !end-bullet!
-   !begin-bullet!
    `consecutive_assertion_linter()` ignores cases where a second
    assertion follows an intervening assignment with `=` (#2444,
    @MichaelChirico).
    !end-bullet!

!end-bullets-26!

### Lint accuracy fixes: removing false negatives

!begin-bullets-28!

-   !begin-bullet!
    `missing_argument_linter()` catches all missing arguments in calls
    with several, e.g. `foo(,,)` gives 3 lints instead of 2 (#2399,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `duplicate_argument_linter()` no longer misses cases with duplicate
    arguments where a comment comes between the argument name and `=`
    (#2402, @MichaelChirico).
    !end-bullet!

!end-bullets-28!

## Notes

!begin-bullets-29!

-   !begin-bullet!
    Fixed a test assuming a specific parser error message that recently
    changed in r-devel (#2527, @IndrajeetPatil).
    !end-bullet!
-   !begin-bullet!
    @MichaelChirico has taken over CRAN maintainer duties for the
    package. Many thanks to @jimhester for more than 10 years and 15
    releases wearing that hat!!
    !end-bullet!

!end-bullets-29!

# lintr 3.1.1

## Breaking changes

!begin-bullets-30!

-   !begin-bullet!
    `infix_spaces_linter()` distinguishes `<-`, `:=`, `<<-` and `->`,
    `->>`, i.e. `infix_spaces_linter(exclude_operators = "->")` will no
    longer exclude `->>` (#2115, @MichaelChirico). This change is
    breaking for users relying on manually-supplied `exclude_operators`
    containing `"<-"` to also exclude `:=` and `<<-`. The fix is to
    manually supply `":="` and `"<<-"` as well. We don't expect this
    change to affect many users, the fix is simple, and the new behavior
    is much more transparent, so we are including this breakage in a
    minor release.
    !end-bullet!
-   !begin-bullet!
    Removed `find_line()` and `find_column()` entries from
    `get_source_expressions()` expression-level objects. These have been
    marked deprecated since version 3.0.0. No users were found on
    GitHub.
    !end-bullet!
-   !begin-bullet!
    There is experimental support for writing config in plain R scripts
    (as opposed to DCF files; #1210, @MichaelChirico). The script is run
    in a new environment and variables matching settings
    (`?default_settings`) are copied over. In particular, this removes
    the need to write R code in a DCF-friendly way, and allows normal R
    syntax highlighting in the saved file. We may eventually deprecate
    the DCF approach in favor of this one; user feedback is welcome on
    strong preferences for either approach, or for a different approach
    like YAML. Generally you should be able to convert your existing
    `.lintr` file to an equivalent R config by replacing the `:`
    key-value separators with assignments (`<-`). By default, such a
    config is searched for in a file named `.lintr.R`. This is a mildly
    breaking change if you happened to be keeping a file `.lintr.R`
    around since that file is given precedence over `.lintr`.
    !begin-bullets-31!
    -   !begin-bullet!
        We also validate config files up-front make it clearer when
        invalid configs are present (#2195, @MichaelChirico). There is a
        warning for "invalid" settings, i.e., settings not part of
        `?default_settings`. We think this is more likely to affect
        users declaring settings in R, since any variable defined in the
        config that's not a setting must be removed to make it clearer
        which variables are settings vs. ancillary.
        !end-bullet!

    !end-bullets-31!
    !end-bullet!

!end-bullets-30!

## Bug fixes

!begin-bullets-32!

-   !begin-bullet!
    `sprintf_linter()` doesn't error in cases where whitespace in `...`
    arguments is significant, e.g. `sprintf("%s", if (A) "" else y)`,
    which won't parse if whitespace is removed (#2131, @MichaelChirico).
    !end-bullet!

!end-bullets-32!

## Changes to default linters

!begin-bullets-33!

-   !begin-bullet!
    `assignment_linter()` lints the {magrittr} assignment pipe `%<>%`
    (#2008, @MichaelChirico). This can be deactivated by setting the new
    argument `allow_pipe_assign` to `TRUE`.
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()`:
    !begin-bullets-34!
    -   !begin-bullet!
        assumes `glue()` is `glue::glue()` when `interpret_glue=TRUE`
        (#2032, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        finds function usages, including infix usage, inside `glue()`
        calls to avoid false positives for "unused objects" (#2029 and
        #2069, @MichaelChirico).
        !end-bullet!

    !end-bullets-34!
    !end-bullet!
-   !begin-bullet!
    `object_name_linter()` no longer attempts to lint strings in
    function calls on the LHS of assignments (#1466, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `infix_spaces_linter()` allows finer control for linting `=` in
    different scenarios using parse tags `EQ_ASSIGN`, `EQ_SUB`, and
    `EQ_FORMALS` (#1977, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `equals_na_linter()` checks for `x %in% NA`, which is a more
    convoluted form of `is.na(x)` (#2088, @MichaelChirico).
    !end-bullet!

!end-bullets-33!

## New and improved features

!begin-bullets-35!

-   !begin-bullet!
    New exclusion sentinel `# nolint next` to signify the next line
    should skip linting (#1791, @MichaelChirico). The usual rules apply
    for excluding specific linters,
    e.g. `# nolint next: assignment_linter.`. The exact string used to
    match a subsequent-line exclusion is controlled by the
    `exclude_next` config entry or R option `"lintr.exclude_next"`.
    !end-bullet!
-   !begin-bullet!
    New `xp_call_name()` helper to facilitate writing custom linters
    (#2023, @MichaelChirico). This helper converts a matched XPath to
    the R function to which it corresponds. This is useful for including
    the "offending" function in the lint's message.
    !end-bullet!
-   !begin-bullet!
    New `make_linter_from_xpath()` to facilitate making simple linters
    directly from a single XPath (#2064, @MichaelChirico). This is
    especially helpful for making on-the-fly/exploratory linters, but
    also extends to any case where the linter can be fully defined from
    a static lint message and single XPath.
    !end-bullet!
-   !begin-bullet!
    Toggle lint progress indicators with argument `show_progress` to
    `lint_dir()` and `lint_package()` (#972, @MichaelChirico). The
    default is still to show progress in `interactive()` sessions.
    Progress is also now shown with a "proper" progress bar
    (`utils::txtProgressBar()`), which in particular solves the issue of
    progress `.` spilling well past the width of the screen in large
    directories.
    !end-bullet!
-   !begin-bullet!
    `lint()`, `lint_dir()`, and `lint_package()` fail more gracefully
    when the user mis-spells an argument name (#2134, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    Quarto files (.qmd) are included by `lint_dir()` by default (#2150,
    @dave-lovell).
    !end-bullet!

!end-bullets-35!

### New linters

!begin-bullets-36!

-   !begin-bullet!
    `library_call_linter()` can detect if all library/require calls are
    not at the top of your script (#2027, #2043, #2163, and #2170,
    @nicholas-masel and @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `keyword_quote_linter()` for finding unnecessary or discouraged
    quoting of symbols in assignment, function arguments, or extraction
    (part of #884, @MichaelChirico). Quoting is unnecessary when the
    target is a valid R name, e.g. `c("a" = 1)` can be `c(a = 1)`. The
    same goes to assignment (`"a" <- 1`) and extraction (`x$"a"`). Where
    quoting is necessary, the linter encourages doing so with backticks
    (e.g. `` x$`a b` `` instead of `x$"a b"`).
    !end-bullet!
-   !begin-bullet!
    `length_levels_linter()` for using the specific function `nlevels()`
    instead of checking `length(levels(x))` (part of #884,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `scalar_in_linter()` for discouraging `%in%` when the right-hand
    side is a scalar, e.g. `x %in% 1` (part of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `if_not_else_linter()` for encouraging `if` statements to be
    structured as `if (A) x else y` instead of `if (!A) y else x` (part
    of #884, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `repeat_linter()` for encouraging `repeat` for infinite loops
    instead of `while (TRUE)` (#2106, @MEO265).
    !end-bullet!
-   !begin-bullet!
    `length_test_linter()` detects the common mistake `length(x == 0)`
    which is meant to be `length(x) == 0` (#1991, @MichaelChirico).
    !end-bullet!

!end-bullets-36!

### Extensions to existing linters

!begin-bullets-37!

-   !begin-bullet!
    `fixed_regex_linter()` gains an option `allow_unescaped` (default
    `FALSE`) to toggle linting regexes not requiring any escapes or
    character classes (#1689, @MichaelChirico). Thus
    `fixed_regex_linter(allow_unescaped = TRUE)` would lint on
    `grepl("[$]", x)` but not on `grepl("a", x)` since the latter does
    not use any regex special characters.
    !end-bullet!
-   !begin-bullet!
    `line_length_linter()` helpfully includes the line length in the
    lint message (#2057, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `conjunct_test_linter()` also lints usage like
    `dplyr::filter(x, A & B)` in favor of using `dplyr::filter(x, A, B)`
    (part of #884; #2110 and #2078, @salim-b and @MichaelChirico).
    Option `allow_filter` toggles when this applies.
    `allow_filter = "always"` drops such lints entirely, while
    `"not_dplyr"` only lints calls explicitly qualified as
    `dplyr::filter()`. The default, `"never"`, assumes all unqualified
    calls to `filter()` are `dplyr::filter()`.
    !end-bullet!
-   !begin-bullet!
    `sort_linter()` checks for code like `x == sort(x)` which is better
    served by using the function `is.unsorted()` (part of #884,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `paste_linter()` gains detection for file paths that are better
    constructed with `file.path()`, e.g. `paste0(dir, "/", file)` would
    be better as `file.path(dir, file)` (part of #884, #2082,
    @MichaelChirico). What exactly gets linted here can be fine-tuned
    with the `allow_file_path` option (`"double_slash"` by default, with
    alternatives `"never"` and `"always"`). When `"always"`, these rules
    are ignored. When `"double_slash"`, paths appearing to construct a
    URL that have consecutive forward slashes (`/`) are skipped. When
    `"never"`, even URLs should be constructed with `file.path()`.
    !end-bullet!
-   !begin-bullet!
    `seq_linter()` recommends `rev()` in the lint message for lints like
    `nrow(x):1` (#1542, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `function_argument_linter()` detects usage of `missing()` for the
    linted argument (#1546, @MichaelChirico). The simplest fix for
    `function_argument_linter()` lints is typically to set that argument
    to `NULL` by default, in which case it's usually preferable to
    update function logic checking `missing()` to check `is.null()`
    instead.
    !end-bullet!
-   !begin-bullet!
    `commas_linter()` gains an option `allow_trailing` (default `FALSE`)
    to allow trailing commas while indexing. (#2104, @MEO265)
    !end-bullet!
-   !begin-bullet!
    `unreachable_code_linter()`
    !begin-bullets-38!
    -   !begin-bullet!
        checks for code inside `if (FALSE)` and other conditional loops
        with deterministically false conditions (#1428, @ME0265).
        !end-bullet!
    -   !begin-bullet!
        checks for unreachable code inside `if`, `else`, `for`, `while`,
        and `repeat` blocks, including combinations with `break` and
        `next` statements. (#2105, @ME0265).
        !end-bullet!

    !end-bullets-38!
    !end-bullet!
-   !begin-bullet!
    `implicit_assignment_linter()` gains an argument `allow_lazy`
    (default `FALSE`) that allows optionally skipping lazy assignments
    like `A && (B <- foo(A))` (#2016, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `unused_import_linter()` gains an argument `interpret_glue` (default
    `TRUE`) paralleling that in `object_usage_linter()` to toggle
    whether `glue::glue()` expressions should be inspected for exported
    object usage (#2042, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `default_undesirable_functions` is updated to also include
    `Sys.unsetenv()` and `structure()` (#2192 and #2228, @IndrajeetPatil
    and @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    Linters with logic around the magrittr pipe `%>%` consistently apply
    it to the other pipes `%!>%`, `%T>%`, `%<>%` (and possibly `%$%`)
    where appropriate (#2008, @MichaelChirico).
    !begin-bullets-39!
    -   !begin-bullet!
        `brace_linter()`
        !end-bullet!
    -   !begin-bullet!
        `pipe_call_linter()`
        !end-bullet!
    -   !begin-bullet!
        `pipe_continuation_linter()`
        !end-bullet!
    -   !begin-bullet!
        `unnecessary_concatenation_linter()`
        !end-bullet!
    -   !begin-bullet!
        `unnecessary_placeholder_linter()`
        !end-bullet!

    !end-bullets-39!
    !end-bullet!
-   !begin-bullet!
    Linters with logic around function declarations consistently include
    the R 4.0.0 shorthand `\()` (#2190, @MichaelChirico).
    !begin-bullets-40!
    -   !begin-bullet!
        `brace_linter()`
        !end-bullet!
    -   !begin-bullet!
        `function_left_parentheses_linter()`
        !end-bullet!
    -   !begin-bullet!
        `indentation_linter()`
        !end-bullet!
    -   !begin-bullet!
        `object_length_linter()`
        !end-bullet!
    -   !begin-bullet!
        `object_name_linter()`
        !end-bullet!
    -   !begin-bullet!
        `package_hooks_linter()`
        !end-bullet!
    -   !begin-bullet!
        `paren_body_linter()`
        !end-bullet!
    -   !begin-bullet!
        `unnecessary_lambda_linter()`
        !end-bullet!
    -   !begin-bullet!
        `unreachable_code_linter()`
        !end-bullet!

    !end-bullets-40!
    !end-bullet!

!end-bullets-37!

### Lint accuracy fixes: removing false positives

!begin-bullets-41!

-   !begin-bullet!
    `fixed_regex_linter()`
    !begin-bullets-42!
    -   !begin-bullet!
        Is pipe-aware, in particular removing false positives around
        piping into {stringr} functions like
        `x |> str_replace(fixed("a"), "b")` (#1811, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Ignores non-string inputs to `pattern=` as a keyword argument
        (#2159, @MichaelChirico).
        !end-bullet!

    !end-bullets-42!
    !end-bullet!
-   !begin-bullet!
    Several linters avoiding false positives in `$` extractions get the
    same exceptions for `@` extractions, e.g. `S4@T` will no longer
    throw a `T_and_F_symbol_linter()` hit (#2039, @MichaelChirico).
    !begin-bullets-43!
    -   !begin-bullet!
        `T_and_F_symbol_linter()`
        !end-bullet!
    -   !begin-bullet!
        `for_loop_index_linter()`
        !end-bullet!
    -   !begin-bullet!
        `literal_coercion_linter()`
        !end-bullet!
    -   !begin-bullet!
        `object_name_linter()`
        !end-bullet!
    -   !begin-bullet!
        `undesirable_function_linter()`
        !end-bullet!
    -   !begin-bullet!
        `unreachable_code_linter()`
        !end-bullet!
    -   !begin-bullet!
        `yoda_test_linter()`
        !end-bullet!

    !end-bullets-43!
    !end-bullet!
-   !begin-bullet!
    `sprintf_linter()` is pipe-aware, so that
    `x %>% sprintf(fmt = "%s")` no longer lints (#1943,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `condition_message_linter()` ignores usages of extracted calls like
    `env$stop(paste(a, b))` (#1455, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `inner_combine_linter()` no longer throws on length-1 calls to `c()`
    like `c(exp(2))` or `c(log(3))` (#2017, @MichaelChirico). Such usage
    is discouraged by `unnecessary_concatenation_linter()`, but
    `inner_combine_linter()` *per se* does not apply.
    !end-bullet!
-   !begin-bullet!
    `sort_linter()` only lints on `order()` of a single vector,
    excluding e.g. `x[order(x, y)]` and `x[order(y, x)]` (#2156,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `redundant_ifelse_linter()` is aware of `dplyr::if_else()`'s
    `missing=` argument, so that
    `if_else(A, TRUE, FALSE, missing = FALSE)` doesn't lint, but
    `if_else(A, TRUE, FALSE, NA)` does (#1941, @MichaelChirico). Note
    that `dplyr::coalesce()` or `tidyr::replace_na()` may still be
    preferable.
    !end-bullet!

!end-bullets-41!

### Lint accuracy fixes: removing false negatives

!begin-bullets-44!

-   !begin-bullet!
    `unreachable_code_linter()` finds unreachable code even in the
    presence of a comment or semicolon after `return()` or `stop()`
    (#2127, @MEO265).
    !end-bullet!
-   !begin-bullet!
    `implicit_assignment_linter()`
    !begin-bullets-45!
    -   !begin-bullet!
        finds assignments in call arguments besides the first one
        (#2136, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        finds assignments in parenthetical expressions like
        `if (A && (B <- foo(A))) { }` (#2138, @MichaelChirico).
        !end-bullet!

    !end-bullets-45!
    !end-bullet!
-   !begin-bullet!
    `unnecessary_lambda_linter()` checks for cases using explicit
    returns, e.g. `lapply(x, \(xi) return(sum(xi)))` (#1567,
    @MichaelChirico).
    !begin-bullets-46!
    -   !begin-bullet!
        thanks to @Bisaloo and @strengejacke for detecting a regression
        in the original fix (#2231, #2247).
        !end-bullet!

    !end-bullets-46!
    !end-bullet!

!end-bullets-44!

# lintr 3.1.0

## Deprecations & Breaking Changes

!begin-bullets-47!

-   !begin-bullet!
    `.lintr` files can now be kept in the directory `.github/linters`
    for better compatibility with Super-Linter. Note that this may be a
    breaking change if you already have a config in `.github/linters`
    inside a subdirectory as well as in your R project's root, since the
    former will now be discovered first where it was ignored before.
    Please see `vignette("lintr")` for details on how configs are
    discovered (#1746, @tonyk7440 and @klmr).
    !end-bullet!
-   !begin-bullet!
    `single_quotes_linter()` is deprecated in favor of the more
    generalizable `quotes_linter()` (#1729, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `unneeded_concatentation_linter()` is deprecated in favor of
    `unnecessary_concatenation_linter()` for naming consistency (#1707,
    @IndrajeetPatil).
    !end-bullet!
-   !begin-bullet!
    `consecutive_stopifnot_linter()` is deprecated in favor of the more
    general (see below) `consecutive_assertion_linter()` (#1604,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `no_tab_linter()` is deprecated in favor of `whitespace_linter()`
    for naming consistency and future generalization (#1954,
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `available_linters()` prioritizes `tags` over `exclude_tags` in the
    case of overlap, i.e., tags listed in both arguments are included,
    not excluded. We don't expect many people to be affected by this,
    and the old behavior was not made explicit in the documentation, but
    make note of it here since it required changing a test in lintr's
    own suite where `linters_with_tags()` implicitly assumed this
    behavior.
    !end-bullet!
-   !begin-bullet!
    `lint()`, `lint_dir()`, and `lint_package()` no longer accept
    certain arguments (`cache=` for `lint()`, `relative_path=` for the
    latter two) positionally. The `warning()` since 3.0.0 has been
    upgraded to an error.
    !end-bullet!

!end-bullets-47!

## Bug fixes

!begin-bullets-48!

-   !begin-bullet!
    `linters_with_tags()` now includes the previously missing spaces
    around "and" when listing missing linters advertised by
    `available_linters()`. This error message may appear e.g. when you
    update lintr to a version with new linters but don't restart your R
    session (#1946, @Bisaloo)

    !end-bullet!
-   !begin-bullet!
    `fixed_regex_linter()` is more robust to errors stemming from
    unrecognized escapes (#1545, #1845, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `get_source_expressions()` can handle Sweave/Rmarkdown documents
    with reference chunks like `<<ref_file>>` (#779, @MichaelChirico).
    Note that these are simply skipped, rather than attempting to
    retrieve the reference and also lint it.

    !end-bullet!
-   !begin-bullet!
    `assignment_linter()` no longer lints assignments in braces that
    include comments when `allow_trailing = FALSE` (#1701, @ashbaldry)

    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()`

    !begin-bullets-49!
    -   !begin-bullet!
        No longer silently ignores usage warnings that don't contain a
        quoted name (#1714, @AshesITR)
        !end-bullet!
    -   !begin-bullet!
        No longer fails on code with comments inside a multi-line call
        to `glue::glue()` (#1919, @MichaelChirico)
        !end-bullet!

    !end-bullets-49!
    !end-bullet!
-   !begin-bullet!
    `namespace_linter()` correctly recognizes backticked operators to be
    exported from respective namespaces (like `` rlang::`%||%` ``)
    (#1752, @IndrajeetPatil)

    !end-bullet!
-   !begin-bullet!
    `lint_package()` correctly finds a package from within a subdir if
    the `path` points to anywhere within the package (#1759, @AshesITR)

    !end-bullet!
-   !begin-bullet!
    Improved error behavior in `Lint()`, `lint()` and
    `xml_nodes_to_lints()` (#1427, #763, @AshesITR)

    !begin-bullets-50!
    -   !begin-bullet!
        `Lint()` validates its inputs more thoroughly, preventing errors
        during `print.Lints` like "Error in rep.int(character, length) :
        invalid 'times' value:".
        !end-bullet!
    -   !begin-bullet!
        `lint()` no longer tries to create an expression tree with
        unexpected end of input errors, because they can be broken.
        !end-bullet!
    -   !begin-bullet!
        `xml_nodes_to_lints()` warns if it can't find lint locations and
        uses dummy locations as a fallback.
        !end-bullet!

    !end-bullets-50!
    !end-bullet!
-   !begin-bullet!
    `linters_with_defaults()` no longer erroneously marks linter
    factories as linters (#1725, @AshesITR).

    !end-bullet!
-   !begin-bullet!
    Row names for `available_linters()` data frame are now contiguous
    (#1781, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `object_name_linter()` allows all S3 group Generics (see
    `?base::groupGeneric`) and S3 generics defined in a different file
    in the same package (#1808, #1841, @AshesITR)

    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` improves identification of the exact source
    of a lint

    !begin-bullets-51!
    -   !begin-bullet!
        for undefined variables in expressions with where the variable
        is used as a symbol in a usual way, for example in a formula or
        in an extraction with `$` (#1914, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        for general usage warnings without location info (#1986 and
        #1917, @AshesITR)
        !end-bullet!

    !end-bullets-51!
    !end-bullet!
-   !begin-bullet!
    `function_left_parentheses_linter()` produces a more specific lint
    (and no longer fails) when the opening parenthesis is on a different
    line than `function` or the call name (#1953, @MichaelChirico).
    Thanks also to @IndrajeetPatil and @lorenzwalthert for identifying a
    regression in the initial fix, #1963.

    !end-bullet!

!end-bullets-48!

## Changes to defaults

!begin-bullets-52!

-   !begin-bullet!
    Set the default for the `except` argument in
    `duplicate_argument_linter()` to `c("mutate", "transmute")`. This
    allows sequential updates like `x |> mutate(a = b + 1, a = log(a))`
    (#1345, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()`

    !begin-bullets-53!
    -   !begin-bullet!
        gains `skip_with` argument to skip code in `with()` expressions.
        To be consistent with `R CMD check`, it defaults to `TRUE`
        (#941, #1458, @IndrajeetPatil).
        !end-bullet!
    -   !begin-bullet!
        Handles backticked symbols inside {glue} expressions correctly,
        e.g. `` glue("{`x`}") `` correctly determines `x` was used
        (#1619, @MichaelChirico)
        !end-bullet!
    -   !begin-bullet!
        Detects problems inside R4.1.0+ lambda functions (`\(...)`)
        (#1933, @MichaelChirico)
        !end-bullet!

    !end-bullets-53!
    !end-bullet!
-   !begin-bullet!
    `spaces_inside_linter()` allows terminal missing keyword arguments
    (e.g. `alist(arg = )`; #540, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `brace_linter()` allows empty braced expression on the same line
    (e.g. `while (updating_condition()) { }`) regardless of
    `allow_single_line` to match the corresponding behavior in {styler}.
    This is an expedient while the style guide on handling this case
    awaits clarification: https://github.com/tidyverse/style/issues/191.
    (#1346, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `undesirable_function_linter()` and `undesirable_operator_linter()`
    now produce an error if empty vector of undesirable functions or
    operators is provided (#1867, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    New linters which are also included as defaults (see "New linters"
    for more details):

    !begin-bullets-54!
    -   !begin-bullet!
        `indentation_linter()`
        !end-bullet!
    -   !begin-bullet!
        `quotes_linter()`
        !end-bullet!
    -   !begin-bullet!
        `unnecessary_concatenation_linter()`
        !end-bullet!
    -   !begin-bullet!
        `whitespace_linter()`
        !end-bullet!

    !end-bullets-54!
    !end-bullet!
-   !begin-bullet!
    `lint_package()` also looks for files in `exec/` (#1950, @jmaspons).

    !end-bullet!

!end-bullets-52!

## New and improved features

!begin-bullets-55!

-   !begin-bullet!
    New `get_r_string()` helper to get the R-equivalent value of a
    string, especially useful for R-4-style raw strings. Previously an
    internal `lintr` helper, now exported to facilitate writing custom
    linters (#1493, @MichaelChirico).

    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` improves lint metadata when detecting
    undefined infix operators, e.g. `%>%` or `:=` (#1497,
    @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `unused_import_linter()` can detect datasets from imported packages
    and no longer warns when a package is imported only for its datasets
    (#1545, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    When a linter triggers an error, `lint()` will provide a more
    actionable summary of where the error occurred, particularly useful
    for cases like `lint_package()` where both the responsible file and
    the responsible linter would be unknown (@MichaelChirico).

    Typically, linters should not themselves cause R to stop -- syntax
    errors lead to error lints, for example. Please report such failures
    as they are likely bugs.

    !end-bullet!
-   !begin-bullet!
    `pipe_continuation_linter()` recognizes violations involving the
    native R pipe `|>` (#1609, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `paste_linter()` also catches usages like
    `paste(rep("*", 10L), collapse = "")` that can be written more
    concisely as `strrep("*", 10L)` (#1108, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `spaces_inside_linter()` produces lints for spaces inside `[[`
    (#1673, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `sprintf_linter()` also applies to `gettextf()` (#1677,
    @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    Documentation for all linters contains examples of code that does
    and does not produce lints (#1492, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `implicit_integer_linter()` gains parameter `allow_colon` to skip
    lints on expressions like `1:10` (#1155, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `infix_spaces_linter()` supports the native R pipe `|>` (#1793,
    @AshesITR)

    !end-bullet!
-   !begin-bullet!
    `unnecessary_concatenation_linter()` (f.k.a.
    `unneeded_concatenation_linter()`) no longer lints on `c(...)`
    (i.e., passing `...` in a function call) when
    `allow_single_expression = FALSE` (#1696, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `object_name_linter()` gains parameter `regexes` to allow custom
    naming conventions (#822, #1421, @AshesITR)

    !end-bullet!
-   !begin-bullet!
    `literal_coercion_linter()` reports a replacement in the lint
    message, e.g. code like `as.integer(1)` will suggest using `1L`
    instead, and code like `as.numeric(NA)` will suggest using
    `NA_real_` instead (#1439, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    Added `format()` functions for `lint` and `lints` (#1784, @AshesITR)

    !end-bullet!
-   !begin-bullet!
    `all_linters()` function provides an easy way to access all
    available linters (#1843, @IndrajeetPatil)

    !end-bullet!
-   !begin-bullet!
    `missing_argument_linter()` allows missing arguments in `quote()`
    calls (#1889, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `get_source_expressions()` correctly extracts indented code chunks
    from R Markdown documents, which helps avoid spurious lints related
    to whitespace (#1945, @MichaelChirico). The convention taken is
    that, within each chunk, all code is anchored relative to the
    leftmost non-whitespace column.

    !end-bullet!
-   !begin-bullet!
    `available_linters()` gives priority to `tags` over `exclude_tags`
    in the case of overlap. In particular, this means that
    `available_linters(tags = "deprecated")` will work to return
    deprecated linters without needing to specify `exclude_tags` (#1959,
    @MichaelChirico).

    !end-bullet!
-   !begin-bullet!
    The {lintr} configuration file is now searched in the system's user
    configuration path; the lintr config filename can also be configured
    explicitly by setting the environment variable `R_LINTR_LINTER_FILE`
    (#460, @klmr)

    !end-bullet!
-   !begin-bullet!
    Errors in the {lintr} configuration file now produce more
    informative error messages (#886, @AshesITR)

    !end-bullet!

!end-bullets-55!

### New linters

!begin-bullets-56!

-   !begin-bullet!
    `matrix_apply_linter()` recommends use of dedicated `rowSums()`,
    `colSums()`, `colMeans()`, `rowMeans()` over `apply(., MARGIN, sum)`
    or `apply(., MARGIN, mean)`. The recommended alternative is much
    more efficient and more readable (#1869, @Bisaloo).

    !end-bullet!
-   !begin-bullet!
    `unnecessary_lambda_linter()`: detect unnecessary lambdas (anonymous
    functions), e.g. `lapply(x, function(xi) sum(xi))` can be
    `lapply(x, sum)` and
    `purrr::map(x, ~quantile(.x, 0.75, na.rm = TRUE))` can be
    `purrr::map(x, quantile, 0.75, na.rm = TRUE)`. Naming `probs = 0.75`
    can further improve readability (#1531, #1866, @MichaelChirico,
    @Bisaloo).

    !end-bullet!
-   !begin-bullet!
    `redundant_equals_linter()` for redundant comparisons to `TRUE` or
    `FALSE` like `is_treatment == TRUE` (#1500, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `lengths_linter()` for encouraging usage of `lengths(x)` instead of
    `sapply(x, length)` (and similar)

    !end-bullet!
-   !begin-bullet!
    `function_return_linter()` for handling issues in function
    `return()` statements. Currently handles assignments within the
    `return()` clause, e.g. `return(x <- foo())` (@MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `boolean_arithmetic_linter()` for identifying places where logical
    aggregations are more appropriate, e.g. `length(which(x == y)) == 0`
    is the same as `!any(x == y)` or even `all(x != y)`
    (@MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `for_loop_index_linter()` to prevent overwriting local variables in
    a `for` loop declared like `for (x in x) { ... }` (@MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `is_numeric_linter()` for redundant checks equivalent to
    `is.numeric(x)` such as `is.numeric(x) || is.integer(x)` or
    `class(x) %in% c("numeric", "integer")` (@MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `empty_assignment_linter()` for identifying empty assignments like
    `x = {}` that are more clearly written as `x = NULL`
    (@MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `unnecessary_placeholder_linter()` for identifying where usage of
    the {magrittr} placeholder `.` could be omitted (@MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `routine_registration_linter()` for identifying native routines that
    don't use registration (`useDynLib` in the `NAMESPACE`;
    @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    `indentation_linter()` for checking that the indentation conforms to
    2-space Tidyverse-style (@AshesITR and @dgkf, #1411, #1792, #1898).

    !end-bullet!
-   !begin-bullet!
    `unnecessary_nested_if_linter()` for checking unnecessary nested
    `if` statements where a single `if` statement with appropriate
    conditional expression would suffice (@IndrajeetPatil and @AshesITR,
    #1778).

    !end-bullet!
-   !begin-bullet!
    `implicit_assignment_linter()` for checking implicit assignments in
    function calls (@IndrajeetPatil and @AshesITR, #1777).

    !end-bullet!
-   !begin-bullet!
    `quotes_linter()` is a generalized version of (now deprecated)
    `single_quotes_linter()`. It accepts an argument `delimiter` to
    specify whether `"` or `'` should be the accepted method for
    delimiting character literals. The default, `"`, reflects the
    Tidyverse style guide recommendation and matches the behavior of
    `single_quotes_linter()`.

    !end-bullet!
-   !begin-bullet!
    `unnecessary_concatenation_linter()` is simply
    `unneeded_concatenation_linter()`, renamed.

    !end-bullet!
-   !begin-bullet!
    `consecutive_assertion_linter()` (f.k.a.
    `consecutive_stopifnot_linter()`) now lints for consecutive calls to
    `assertthat::assert_that()` (as long as the `msg=` argument is not
    used; #1604, @MichaelChirico).

    !end-bullet!
-   !begin-bullet!
    `whitespace_linter()` is simply `no_tab_linter()`, renamed. In the
    future, we plan to extend it to work for different whitespace
    preferences.

    !end-bullet!

!end-bullets-56!

## Notes

!begin-bullets-57!

-   !begin-bullet!
    {lintr} now depends on R version 3.5.0, in line with the tidyverse
    policy for R version compatibility.

    !end-bullet!
-   !begin-bullet!
    `lint()` continues to support Rmarkdown documents. For users of
    custom .Rmd engines, e.g. `marginformat` from {tufte} or `theorem`
    from {bookdown}, note that those engines must be registered in
    {knitr} prior to running `lint()` in order for {lintr} to behave as
    expected, i.e., they should be shown as part of
    `knitr::knit_engines$get()`.

    For {tufte} and {bookdown} in particular, one only needs to load the
    package namespace to accomplish this (i.e., minimally
    `loadNamespace("tufte")` or `loadNamespace("bookdown")`,
    respectively, will register those packages' custom engines; since
    `library()` also runs `loadNamespace()`, running `library()` will
    also work). Note further that {tufte} only added this code to their
    `.onLoad()` recently after our request to do so (see
    https://github.com/rstudio/tufte/issues/117). Therefore, ensure
    you're using a more recent version to get the behavior described
    here for {tufte}.

    More generally, there is no requirement that `loadNamespace()` will
    register a package's custom {knitr} engines, so you may need to work
    with other package authors to figure out a solution for other
    engines.

    Thanks to Yihui and other developers for their helpful discussions
    around this issue (#797, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    The output of `lint()` and `Lint()` gain S3 class `"list"` to assist
    with S3 dispatch (#1494, @MichaelChirico)

    !begin-bullets-58!
    -   !begin-bullet!
        As a corollary, we now register an `as_tibble` method for class
        `lints`, conditional on {tibble} availability, to avoid
        dispatching to the `list` method which does not work with
        `lint()` output (#1997, @MichaelChirico)
        !end-bullet!

    !end-bullets-58!
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` gives a more helpful warning when a `glue()`
    expression fails to evaluate (#1985, @MichaelChirico)

    !end-bullet!
-   !begin-bullet!
    The documentation of `object_name_linter()` now describes how
    `"symbols"` works when passed to the `styles` parameter (#1924,
    @hedsnz).

    !end-bullet!

!end-bullets-57!

# lintr 3.0.2

!begin-bullets-59!

-   !begin-bullet!
    Fix test to avoid leaving behind cache files in the global cache
    directory.
    !end-bullet!

!end-bullets-59!

# lintr 3.0.1

!begin-bullets-60!

-   !begin-bullet!
    Skip multi-byte tests in non UTF-8 locales (#1504)

    !end-bullet!
-   !begin-bullet!
    `modify_defaults()` no longer uses the mistaken `"lintr_function"`
    S3 class, instead applying the `"linter"` class also common to
    `Linter()`. `Linter()` also includes `"function"` in the S3 class of
    its output to facilitate S3 dispatch to `function` methods where
    appropriate (#1392, @MichaelChirico).

    !end-bullet!

!end-bullets-60!

## Changes to defaults

!begin-bullets-61!

-   !begin-bullet!
    `brace_linter()` allows opening curly braces on a new line when
    there is a comment ending the preceding line (#1433 and #1434,
    @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `seq_linter()` produces lint for `seq(...)`, since it also cannot
    properly handle empty edge cases (#1468, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `seq_linter()` additionally lints on `1:n()` (from {dplyr}) and
    `1:.N` (from {data.table}) (#1396, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `literal_coercion_linter()` lints {rlang}'s atomic vector
    constructors (i.e., `int()`, `chr()`, `lgl()`, and `dbl()`) if the
    argument is a scalar (#1437, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `redundant_ifelse_linter()`'s lint message correctly suggests
    negation when the `yes` condition is `0` (#1432, @IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `seq_linter()` provides more specific replacement code in lint
    message (#1475, @IndrajeetPatil).

    !end-bullet!

!end-bullets-61!

## New and improved features

!begin-bullets-62!

-   !begin-bullet!
    New `sort_linter()` to detect `x[order(x)]` and recommend the faster
    and clearer alternative: `sort(x)` (#1528, @Bisaloo)

    !end-bullet!
-   !begin-bullet!
    `unreachable_code_linter()` ignores trailing comments if they match
    a closing nolint block (#1347, @AshesITR).

    !end-bullet!
-   !begin-bullet!
    New `function_argument_linter()` to enforce that arguments with
    defaults appear last in function declarations, see the Tidyverse
    design guide (#450, @AshesITR).

    !end-bullet!
-   !begin-bullet!
    New `allow_trailing` argument added to `assignment_linter()` to
    check when assignment operators are at the end of a line, and the
    value is on the following line (#1491, @ashbaldry)

    !end-bullet!
-   !begin-bullet!
    New `sarif_output()` function to output lints to SARIF output
    (#1424, @shaopeng-gh)

    !end-bullet!
-   !begin-bullet!
    `commented_code_linter()` now lints commented argument code,
    containing a trailing comma, as well (#386, @AshesITR). For example
    a comment containing `#  na.rm = TRUE,` now triggers a lint.

    !end-bullet!

!end-bullets-62!

## Bug fixes

!begin-bullets-63!

-   !begin-bullet!
    `object_length_linter()` does not fail in case there are
    dependencies with no exports (e.g. data-only packages) (#1424,
    #1509, @IndrajeetPatil).
    !end-bullet!
-   !begin-bullet!
    `get_source_expressions()` no longer fails on R files that match a
    knitr pattern (#743, #879, #1406, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    Parse error lints now appear with the linter name `"error"` instead
    of `NA` (#1405, @AshesITR). Also, linting no longer runs if the
    `source_expressions` contain invalid string data that would cause
    error messages in other linters. in other linters.
    !end-bullet!
-   !begin-bullet!
    Prevent `lint()` from hanging on Rmd files with some syntax errors
    (#1443, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `get_source_expressions()` no longer omits trailing non-code lines
    from knitr files (#1400, #1415, @AshesITR). This fixes the location
    information for `trailing_blank_lines_linter()` in RMarkdown
    documents without terminal newlines.
    !end-bullet!
-   !begin-bullet!
    The `vignette("lintr")` incorrectly cited `exclude` as the key for
    setting file exclusions in `.lintr` when it is actually
    `exclusions`. (#1401, @AshesITR)
    !end-bullet!
-   !begin-bullet!
    Fixed file exclusion detection in `lint_dir()` so it no longer
    errors if there are multiple exclusions or no global exclusions
    configured for a single file (#1413, #1442, @AshesITR).
    !end-bullet!

!end-bullets-63!

## Other changes

!begin-bullets-64!

-   !begin-bullet!
    The minimum needed version for soft dependency `{withr}` has been
    bumped to `2.5.0` (#1404, @IndrajeetPatil).
    !end-bullet!
-   !begin-bullet!
    Changed the deprecation warning for `with_defaults()` to also
    mention `modify_defaults()` (#1438, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    Quarto files (`.qmd`) were supported out of the box. The
    documentation and the testing infrastructure are updated to reflect
    this (#1486, @IndrajeetPatil).
    !end-bullet!

!end-bullets-64!

# lintr 3.0.0

## Breaking changes

!begin-bullets-65!

-   !begin-bullet!
    All linters are now function factories (i.e., functions that return
    functions) for consistency. Previously, only linters with
    customizable parameters were factories (#245, @fangly, @AshesITR,
    and @MichaelChirico).

    This means that usage such as `lint("file.R", seq_linter)` should be
    updated to `lint("file.R", seq_linter())`, and the following update
    for custom linters:

    !begin-codeblock!
    ``` r
    my_custom_linter <- function(source_expression) { ... }

    # becomes
    my_custom_linter <- function() Linter(function(source_expression) { ... })
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Exclusions specified in the `.lintr` file are now relative to the
    location of that file and support excluding entire directories
    (#158, #438, @AshesITR).

    !end-bullet!
-   !begin-bullet!
    Removed long-deprecated linters (they've been marked as deprecated
    since v1.0.1 in 2017):

    !begin-bullets-66!
    -   !begin-bullet!
        `absolute_paths_linter()`
        !end-bullet!
    -   !begin-bullet!
        `camel_case_linter()`
        !end-bullet!
    -   !begin-bullet!
        `multiple_dots_linter()`
        !end-bullet!
    -   !begin-bullet!
        `snake_case_linter()`
        !end-bullet!
    -   !begin-bullet!
        `trailing_semicolons_linter()`
        !end-bullet!

    !end-bullets-66!
    !end-bullet!
-   !begin-bullet!
    Removed `return()` from `all_undesirable_functions` because early
    returns (which often improve readability and reduce code complexity)
    require explicit use of `return()`. Follow #1100 for an upcoming
    `return_linter()` to lint unnecessary `return()` statements (#1146,
    @AshesITR).

    Note that you can replicate old behavior by supplying `return` as a
    custom undesirable function:
    `undesirable_function_linter(c(all_undesirable_functions, list(return = NA)))`

    !end-bullet!

!end-bullets-65!

## Deprecations

!begin-bullets-67!

-   !begin-bullet!
    Lints are now marked with the name of the `linter` that caused them
    instead of the name of their implementation function. Deprecated the
    obsolete `linter` argument of `Lint()` (#664, #673, #746,
    @AshesITR). Downstream custom linters should follow suit.
    !end-bullet!
-   !begin-bullet!
    Renamed `semicolon_terminator_linter()` to `semicolon_linter()` for
    better consistency. `semicolon_terminator_linter()` survives but is
    marked for deprecation. The new linter also has a new signature,
    taking arguments `allow_compound` and `allow_trailing` to replace
    the old single argument `semicolon`, again for signature consistency
    with other linters.
    !end-bullet!
-   !begin-bullet!
    The following linters were subsumed into `brace_linter()` and are
    now deprecated; see the item on `brace_linter()` below:
    !begin-bullets-68!
    -   !begin-bullet!
        `closed_curly_linter()`
        !end-bullet!
    -   !begin-bullet!
        `open_curly_linter()`
        !end-bullet!
    -   !begin-bullet!
        `paren_brace_linter()`
        !end-bullet!

    !end-bullets-68!
    !end-bullet!
-   !begin-bullet!
    The `...` argument for `lint()`, `lint_dir()`, and `lint_package()`
    has been promoted to an earlier position to better match the
    Tidyverse design principle of data-\>descriptor-\>details. This
    change enables passing objects to `...` without needing to specify
    non-required arguments, e.g. `lint_dir("/path/to/dir", linter())`
    now works without the need to specify `relative_path`. This affects
    some code that uses positional arguments (#935, @MichaelChirico).
    !begin-bullets-69!
    -   !begin-bullet!
        For `lint()`, `...` is now the 3rd argument, where earlier this
        was `cache`.
        !end-bullet!
    -   !begin-bullet!
        For `lint_dir()` and `lint_package()`, `...` is now the 2nd
        argument, where earlier this was `relative_path`.
        !end-bullet!

    !end-bullets-69!
    !end-bullet!
-   !begin-bullet!
    Deprecated argument `source_file` to exported functions `with_id()`
    and `ids_with_token()`. It has been renamed to `source_expression`
    to better reflect that this argument is typically the output of
    `get_source_expressions()`. For now, the old argument `source_file`
    can still be used (with warning). The now-private functional
    versions of many linters also underwent the same renaming
    (`source_file` -\> `source_expression`). This has no direct effect
    on packages importing lintr, but is mentioned in case custom linters
    imitating `lintr` style had also adopted the `source_file` naming
    and want to adapt to keep in sync.
    !end-bullet!
-   !begin-bullet!
    Deprecated `with_defaults()` in favor of `linters_with_defaults()`,
    and add `modify_defaults()` which is intended to be used more
    generally to modify (i.e., extend, trim, and/or update) a list of
    defaults. Note that the argument corresponding to
    `with_defaults()`'s `default=` is called `defaults=` (i.e.,
    pluralized) in both of these, and that usage like
    `with_defaults(default = NULL, ...)` should be converted to
    `linters_with_defaults(defaults = list(), ...)` (#1029, #1336,
    #1361, @AshesITR and @michaelchirico).
    !end-bullet!
-   !begin-bullet!
    Deprecated the `find_line()` and `find_column()` helpers from the
    item-level `expressions` returned with `get_source_expressions()`.
    These helpers were typically associated with regex-based logic for
    building linters, which is rarely needed and prone to false
    positives; now that lintr almost exclusively uses XPath-based logic
    for linters, these are no longer necessary (#1373, @MichaelChirico).
    !end-bullet!

!end-bullets-67!

## Other changes to defaults

### Updates to `default_linters`

!begin-bullets-70!

-   !begin-bullet!
    New `brace_linter()` which combines several curly brace related
    linters, deprecating the following predecessors (#1041, @AshesITR):
    !begin-bullets-71!
    -   !begin-bullet!
        `closed_curly_linter()`; both now also allow `}]` in addition to
        `})` and `},` as exceptions, i.e., `}` doesn't need to be on its
        own line if paired with a closing square bracket, a closing
        parenthesis, or a comma. Also improved lint metadata so that
        source markers land at the closing brace instead of the closing
        parenthesis to improve the experience of fixing the lint (#583,
        @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        `open_curly_linter()`; both also no longer lint unnecessary
        trailing whitespace (use `trailing_whitespace_linter()` for
        this) and also allow `(`, `,`, and `%>%` on preceding lines as
        exceptions, i.e., `{` can be alone on a line if the previous
        line is terminated with an opening parenthesis, a comma, or a
        pipe (`%>%`) (#487, #1028, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        `paren_brace_linter()`; `brace_linter()` also lints `if`/`else`
        and `repeat` with missing whitespace.
        !end-bullet!
    -   !begin-bullet!
        `brace_linter()` also newly enforces the following rules
        surrounding curly braces (originally Google linters, see below):
        !begin-bullets-72!
        -   !begin-bullet!
            Require `else` to come on the same line as the preceding
            `}`, if present (#884, @MichaelChirico).
            !end-bullet!
        -   !begin-bullet!
            Require functions spanning multiple lines to use curly
            braces (#987, @MichaelChirico).
            !end-bullet!
        -   !begin-bullet!
            Require balanced usage of `{}` in `if`/`else` conditions,
            i.e., if the `if` branch uses braces, then so must the
            `else` branch, and *vice versa* (#983, @MichaelChirico).
            !end-bullet!

        !end-bullets-72!
        !end-bullet!

    !end-bullets-71!
    !end-bullet!
-   !begin-bullet!
    New `paren_body_linter()` checks that there is a space between a
    right parenthesis and a body expression (#809, @kpagacz).
    !end-bullet!
-   !begin-bullet!
    Added `semicolon_linter()` as a default because it enforces a
    tidyverse style guide rule (#683, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `assignment_linter()` (#915, @MichaelChirico):
    !begin-bullets-73!
    -   !begin-bullet!
        Right assignments are now linted by default (`->` and `->>`).
        !end-bullet!
    -   !begin-bullet!
        New argument `allow_cascading_assign` (`TRUE` by default)
        toggles whether to lint `<<-` and `->>`.
        !end-bullet!
    -   !begin-bullet!
        New argument `allow_right_assign` (`FALSE` by default) toggles
        whether to lint `->` and `->>`.
        !end-bullet!

    !end-bullets-73!
    !end-bullet!
-   !begin-bullet!
    `commented_code_linter()`: use the parse tree to find comments,
    eliminating some false positives (#451, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `equals_na_linter()` (#545, @MichaelChirico):
    !begin-bullets-74!
    -   !begin-bullet!
        Extended to lint `x != NA` (before, only `==` was caught) and
        `NA == x` (before, only `NA` on RHS was caught).
        !end-bullet!
    -   !begin-bullet!
        Extended to skip usages in comments like
        `is.na(x) # use is.na(x), not x == NA`.
        !end-bullet!

    !end-bullets-74!
    !end-bullet!
-   !begin-bullet!
    `function_left_parentheses_linter()`: improved location information
    (#1266, #1267, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `infix_spaces_linter()`:
    !begin-bullets-75!
    -   !begin-bullet!
        Added argument `allow_multiple_spaces` (`TRUE` by default) which
        toggles whether to generate a lint for operators used with
        multiple spaces, e.g. `x   +   2`. The default setting allows
        extra spacing to be used to increase line-to-line alignment
        (#940, @f-ritter and @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Extended so that usages like `a~b` and `function(a=1) { ... }`
        are linted (#930, #michaelchirico).
        !end-bullet!
    -   !begin-bullet!
        Added argument `exclude_operators` to disable lints on selected
        infix operators. By default, all "low-precedence" operators
        throw lints; see `?infix_spaces_linter` for an enumeration of
        these. (#914, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Add an exception for `/` usage in `box::use()` declarations
        (#1087, @klmr).
        !end-bullet!

    !end-bullets-75!
    !end-bullet!
-   !begin-bullet!
    `line_length_linter()`: place the source marker at the margin of the
    affected line to improve user experience during de-linting -- just
    press `<kbd>`{=html}Return`</kbd>`{=html} (#735, @AshesITR).\*
    !end-bullet!
-   !begin-bullet!
    `no_tab_linter()`: use more reliable matching (e.g., excluding
    matches found in comments; #441, @russHyde).
    !end-bullet!
-   !begin-bullet!
    `object_length_linter()`: correctly detect generics and only count
    the implementation class towards the length. This prevents false
    positive lints in the case of long generic names, e.g.
    `very_very_very_long_generic_name.short_class` no longer produces a
    lint (#871, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `object_name_linter()`:
    !begin-bullets-76!
    -   !begin-bullet!
        Improved generic detection -- in user-defined method
        `my_method.upstream.class`, `upstream.class` no longer throws a
        lint because the generic (`my_method`) properly uses
        `snake_case` (#737, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Exclude special R namespace hook functions such as `.onLoad()`
        (#500, #614, @AshesITR and @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Correctly detect imported functions when linting packages (#642,
        @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Correctly detect assignment generics like `names<-.class_name`
        (#843, @jonkeane).
        !end-bullet!
    -   !begin-bullet!
        Added new styles `"symbols"` and `"SNAKE_CASE"` (#494, #495,
        #615, #670, @MichaelChirico and @AshesITR).
        !begin-bullets-77!
        -   !begin-bullet!
            `"symbols"` is a new default style which won't lint
            all-symbol object names. In particular, that means operator
            names like `%+%` are allowed.
            !end-bullet!

        !end-bullets-77!
        !end-bullet!
    -   !begin-bullet!
        No longer lints names used in `$` extractions (#582, @AshesITR).
        !end-bullet!

    !end-bullets-76!
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()`:
    !begin-bullets-78!
    -   !begin-bullet!
        Detect global variables if there are top-level
        dollar-assignments (#666, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Report usage warnings spanning multiple lines (#507, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Detect usages inside `glue::glue()` constructs (#942,
        @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Extended to include functions assigned with `=` instead of `<-`
        (#1081, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Detect functions exported by packages that are explicitly
        attached using `library()` or `require()` calls (#1127,
        @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Improved location information in some cases where the previous
        regex-based approach didn't work, e.g. unicode characters in
        variable names (#1285, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Correctly detect functions declared within `assign()` and
        `setMethod()` (#1322, @AshesITR).
        !end-bullet!

    !end-bullets-78!
    !end-bullet!
-   !begin-bullet!
    `spaces_inside_linter()`: ignore spaces preceding trailing comments
    (#636, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `T_and_F_symbol_linter()`:
    !begin-bullets-79!
    -   !begin-bullet!
        Added as a default because it enforces a tidyverse style guide
        rule (#517, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        No longer lint occurrences of `T` and `F` when used for
        subsetting, and give a better message when used as variable
        names (#657, @AshesITR).
        !end-bullet!

    !end-bullets-79!
    !end-bullet!
-   !begin-bullet!
    `trailing_blank_lines_linter()`:
    !begin-bullets-80!
    -   !begin-bullet!
        Extended to lint files without a terminal newline (#675,
        @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Also, running `lint()` on a file without a terminal newline no
        longer throws a `warning()`.
        !end-bullet!

    !end-bullets-80!
    !end-bullet!
-   !begin-bullet!
    `trailing_whitespace_linter()`:
    !begin-bullets-81!
    -   !begin-bullet!
        Extended to also lint completely blank lines by default (#1044,
        @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Added argument `allow_empty_lines` (`FALSE` by default) to
        toggle this behavior.
        !end-bullet!
    -   !begin-bullet!
        Improved so that trailing whitespace inside string literals does
        not trigger a lint (#1045, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Added argument `allow_in_strings` (`TRUE` by default) to toggle
        this behavior.
        !end-bullet!

    !end-bullets-81!
    !end-bullet!
-   !begin-bullet!
    `undesirable_function_linter()`:
    !begin-bullets-82!
    -   !begin-bullet!
        Added new functions to `default_undesirable_functions` related
        to debugging (#876, @MichaelChirico):
        !begin-bullets-83!
        -   !begin-bullet!
            `browser()`
            !end-bullet!
        -   !begin-bullet!
            `debug()`
            !end-bullet!
        -   !begin-bullet!
            `debugcall()`
            !end-bullet!
        -   !begin-bullet!
            `debugonce()`
            !end-bullet!
        -   !begin-bullet!
            `trace()`
            !end-bullet!
        -   !begin-bullet!
            `untrace()`
            !end-bullet!

        !end-bullets-83!
        !end-bullet!
    -   !begin-bullet!
        No longer lints `library()` and `require()` calls attaching a
        package with an undesired name, e.g. `library(foo)` (#814,
        @kpagacz and @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        No longer lints undesirable symbols if they are used as names in
        `$` extractions (#1050, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Added more explanation why certain functions might be
        undesirable and what alternatives to use; ditto for
        `undesirable_operator_linter()` (#1133, #1146, #1159,
        @AshesITR).
        !end-bullet!

    !end-bullets-82!
    !end-bullet!

!end-bullets-70!

### Other noteworthy changes

!begin-bullets-84!

-   !begin-bullet!
    `cyclocomp_linter()`: set the default `complexity_limit` to 15. This
    brings the default into sync with what is enforced via
    `default_linters` (#693, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `lint_package()` now lints files in the `demo` directory by default
    (#703, @dmurdoch).
    !end-bullet!
-   !begin-bullet!
    Moved the default lintr cache directory from `~/.R/lintr_cache`
    (which was a violation of CRAN policy) to
    `R_user_dir("lintr", "cache")`. Note that 3.0.0 is a major version
    update and invalidates the old cache anyway, so it can be safely
    deleted (#1062, @AshesITR).
    !end-bullet!

!end-bullets-84!

## New and improved features

### New linters

!begin-bullets-85!

-   !begin-bullet!
    `backport_linter()` for detecting mismatched R version dependencies
    (#506, #1316, #1318, #1319, @MichaelChirico and @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `duplicate_argument_linter()` similarly checks that there are no
    duplicate arguments supplied to function calls (#850, @renkun-ken).
    !end-bullet!
-   !begin-bullet!
    `missing_argument_linter()` to check for empty (missing) arguments
    in function calls (#563, #1152, @renkun-ken and @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `missing_package_linter()` to check if packages in calls to
    `library()` and friends are missing (#536, #1037, @renkun-ken and
    @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `namespace_linter()` to check for common mistakes in `pkg::symbol`
    usages (#548, @renkun-ken).
    !end-bullet!
-   !begin-bullet!
    `package_hooks_linter()` to run a series of checks also done by
    `R CMD check` on the `.onLoad()`, `.onAttach()`, `.Last.lib()` and
    `.onDetach()` hooks (#882, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `pipe_call_linter()` to enforce that all steps of `magrittr`
    pipelines use explicit calls instead of symbols, e.g. `x %>% mean()`
    instead of `x %>% mean` (#801, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `sprintf_linter()` to check for common mistakes in `sprintf()` usage
    (#544, #624, @renkun-ken and @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `unused_import_linter()` to detect unnecessary `library()` calls in
    R scripts (#239, @jimhester, @AshesITR).
    !end-bullet!

!end-bullets-85!

#### Google linters

Google is a heavy user of lintr internally, and has developed a large
set of linters improving code consistency and correcting common R usage
mistakes. This release includes many of these linters that are of
general interest to the broader R community. More will be included in
future releases. See, e.g. #884, #979, #998, #1011, #1016, #1036, #1051,
#1066, and #1067; special thanks to @MichaelChirico and @michaelquinn32.

!begin-bullets-86!

-   !begin-bullet!
    `any_duplicated_linter()` Require usage of `anyDuplicated(x) > 0L`
    over `any(duplicated(x))` and similar.
    !end-bullet!
-   !begin-bullet!
    `any_is_na_linter()` Require usage of `anyNA(x)` over
    `any(is.na(x))`.
    !end-bullet!
-   !begin-bullet!
    `class_equals_linter()` Prevent comparing `class(x)` with `==`,
    `!=`, or `%in%`, where `inherits()` is typically preferred.
    !end-bullet!
-   !begin-bullet!
    `condition_message_linter()` Prevent condition messages from being
    constructed like `stop(paste(...))` (where just `stop(...)` is
    preferable).
    !end-bullet!
-   !begin-bullet!
    `conjunct_test_linter()` Require usage of
    `expect_true(x); expect_true(y)` over `expect_true(x && y)` and
    similar.
    !end-bullet!
-   !begin-bullet!
    `consecutive_stopifnot_linter()` Require consecutive calls to
    `stopifnot()` to be unified into one.
    !end-bullet!
-   !begin-bullet!
    `expect_comparison_linter()` Require usage of `expect_gt(x, y)` over
    `expect_true(x > y)` and similar.
    !end-bullet!
-   !begin-bullet!
    `expect_identical_linter()` Require usage of `expect_identical()` by
    default, and `expect_equal()` only by exception.
    !end-bullet!
-   !begin-bullet!
    `expect_length_linter()` Require usage of `expect_length(x, n)` over
    `expect_equal(length(x), n)` and similar.
    !end-bullet!
-   !begin-bullet!
    `expect_named_linter()` Require usage of `expect_named(x, n)` over
    `expect_equal(names(x), n)` and similar.
    !end-bullet!
-   !begin-bullet!
    `expect_not_linter()` Require usage of `expect_false(x)` over
    `expect_true(!x)`, and *vice versa*.
    !end-bullet!
-   !begin-bullet!
    `expect_null_linter()` Require usage of `expect_null(x)` over
    `expect_equal(x, NULL)` and similar.
    !end-bullet!
-   !begin-bullet!
    `expect_s3_class_linter()` Require usage of `expect_s3_class(x, k)`
    over `expect_equal(class(x), k)` and similar.
    !end-bullet!
-   !begin-bullet!
    `expect_s4_class_linter()` Require usage of `expect_s4_class(x, k)`
    over `expect_true(methods::is(x, k))`.
    !end-bullet!
-   !begin-bullet!
    `expect_true_false_linter()` Require usage of `expect_true(x)` over
    `expect_equal(x, TRUE)` and similar.
    !end-bullet!
-   !begin-bullet!
    `expect_type_linter()` Require usage of `expect_type(x, t)` over
    `expect_equal(typeof(x), t)` and similar.
    !end-bullet!
-   !begin-bullet!
    `fixed_regex_linter()` Require `fixed = TRUE` or `stringr::fixed()`
    for regular expressions that can be expressed statically,
    e.g. `strsplit(x, "[.]")` can be `strsplit(x, ".", fixed = TRUE)`.
    !begin-bullets-87!
    -   !begin-bullet!
        Added parameter `allow_grepl` (default `FALSE`) to toggle
        whether `grepl()` usages should be linted. These might be
        treated separately because `grepl("^x", NA)` is `FALSE`; the
        `startsWith()` equivalent to get `FALSE` for missing input is
        clunkier, but more explicit: `!is.na(x) & startsWith(x, string)`
        (#1376, @MichaelChirico).
        !end-bullet!

    !end-bullets-87!
    !end-bullet!
-   !begin-bullet!
    `ifelse_censor_linter()` Require usage of `pmax()` / `pmin()` where
    appropriate, e.g. `ifelse(x > y, x, y)` is `pmax(x, y)`.
    !end-bullet!
-   !begin-bullet!
    `inner_combine_linter()` Require inputs to known-vectorized
    functions to be combined first rather than later,
    e.g. `as.Date(c(x, y))` over `c(as.Date(x), as.Date(y))`.
    !end-bullet!
-   !begin-bullet!
    `literal_coercion_linter()` Require using correctly-typed literals
    instead of direct coercion, e.g. `1L` instead of `as.numeric(1)`.
    !end-bullet!
-   !begin-bullet!
    `nested_ifelse_linter()` Prevent nested calls to `ifelse()` like
    `ifelse(A, x, ifelse(B, y, z))`, and similar.
    !end-bullet!
-   !begin-bullet!
    `numeric_leading_zero_linter()` Require a leading `0` in fractional
    numeric constants, e.g. `0.1` instead of `.1`.
    !end-bullet!
-   !begin-bullet!
    `outer_negation_linter()` Require usage of `!any(x)` over `all(!x)`
    and `!all(x)` over `any(!x)`.
    !end-bullet!
-   !begin-bullet!
    `paste_linter()` lint for common mis-use of `paste()` and
    `paste0()`:
    !begin-bullets-88!
    -   !begin-bullet!
        `paste0()` encouraged instead of `paste(sep = "")`.
        !end-bullet!
    -   !begin-bullet!
        `toString()` or `glue::glue_collapse()` encouraged instead of
        `paste(x, collapse = ", ")`.
        !end-bullet!
    -   !begin-bullet!
        Lint `sep=` passed to `paste0()` -- typically a mistake.
        !end-bullet!

    !end-bullets-88!
    !end-bullet!
-   !begin-bullet!
    `redundant_ifelse_linter()` Prevent usage like
    `ifelse(A & B, TRUE, FALSE)` or `ifelse(C, 0, 1)` (the latter is
    `as.numeric(!C)`).
    !end-bullet!
-   !begin-bullet!
    `regex_subset_linter()` Require usage of
    `grep(ptn, x, value = TRUE)` over `x[grep(ptn, x)]` and similar.
    !end-bullet!
-   !begin-bullet!
    `string_boundary_linter()` Require usage of `startsWith(x, ptn)`
    over `grepl("^ptn", x)` or `substr(x, 1, 3) == ptn` and similar.
    !end-bullet!
-   !begin-bullet!
    `strings_as_factors_linter()` Check for code designed to work before
    and after the `stringsAsFactors = FALSE` default change in R 4.0 by
    examining code for `data.frame()` usages susceptible to assumptions
    about the default value of `stringsAsFactors=`.
    !end-bullet!
-   !begin-bullet!
    `system_file_linter()` Prevent usage like
    `file.path(system.file("A", package = "pkg"), "B")` where simply
    `system.file("A", "B", package = "pkg")` is more concise and
    readable.
    !end-bullet!
-   !begin-bullet!
    `unreachable_code_linter()` Prevent code after `return()` and
    `stop()` statements that will never be reached (extended for #1051
    thanks to early user testing, thanks @bersbersbers!).
    !end-bullet!
-   !begin-bullet!
    `vector_logic_linter()` Require use of scalar logical operators
    (`&&` and `||`) inside `if()` conditions and similar.
    !end-bullet!
-   !begin-bullet!
    `yoda_test_linter()` Require usage of `expect_identical(x, 1L)` over
    `expect_equal(1L, x)` and similar.
    !end-bullet!

!end-bullets-86!

### Other features and improvements

!begin-bullets-89!

-   !begin-bullet!
    **Documentation**: Reorganize linter documentation into new
    tag-based Rd pages (#888, #1015, @AshesITR).
    !begin-bullets-90!
    -   !begin-bullet!
        Each linter has its own help page.
        !end-bullet!
    -   !begin-bullet!
        `?linters` also links to tag help pages, collecting linters with
        a similar goal.
        !end-bullet!
    -   !begin-bullet!
        Each linter can have multiple tags.
        !end-bullet!
    -   !begin-bullet!
        `available_linters()`: new function to list available linters
        and their tags. This feature is extensible by package authors
        providing add-on linters for {lintr}.
        !end-bullet!
    -   !begin-bullet!
        `available_tags()`: new function to list available tags.
        !end-bullet!
    -   !begin-bullet!
        `linters_with_tags()`: new function to help build a list of
        linters using tags.
        !end-bullet!

    !end-bullets-90!
    !end-bullet!
-   !begin-bullet!
    **Encodings**: lintr now supports non-system character Encodings.
    The correct encoding is auto-detected from .Rproj or DESCRIPTION
    files in your project. Override the default in the `encoding`
    setting of lintr (#752, #782, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    **Jenkins CI**: Support for writing comments to GitHub repo when
    running in Jenkins CI (#488, @fdlk).
    !end-bullet!
-   !begin-bullet!
    **Performance**: Optimized performance-critical functions in lintr,
    such as `get_source_expressions()` resulting in about 2x speedup in
    our test suite and even more for complex files (#1169, #1197, #1200,
    #1201, #1214, @MichaelChirico and @AshesITR). Average
    `lint_package()` execution time is down about 30% and the median
    package sees about 40% improvement.
    !end-bullet!
-   !begin-bullet!
    **Raw strings**: Several linters tightened internal logic to allow
    for raw strings like `R"( a\string )"` (#1034, #1285,
    @MichaelChirico and @AshesITR).
    !end-bullet!
-   !begin-bullet!
    **Selective exclusion syntax**: New syntax to exclude only selected
    linters from certain lines or passages. Use
    `# nolint: linter_name, linter2_name.` or
    `# nolint start: linter_name, linter2_name.` in source files or
    named lists of line numbers in `.lintr`. Note the terminal `.` is
    required. Also allows for partial matching as long as the supplied
    prefix is unique, e.g. `# nolint: infix_spaces.` works to exclude
    `infix_spaces_linter` (#605, #872, @AshesITR).
    !begin-bullets-91!
    -   !begin-bullet!
        Added the linter name to lintrs output to facilitate discovery
        of the correct name (#1357, @AshesITR).
        !end-bullet!

    !end-bullets-91!
    !end-bullet!
-   !begin-bullet!
    Improved S3 generic detection for non-standard S3 generics where
    `UseMethod()` is called after several preceding expressions (#846,
    @jonkeane).
    !end-bullet!
-   !begin-bullet!
    `extraction_operator_linter()`: no longer lint `x[NULL]` (#1273,
    @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `is_lint_level()`: new exported helper for readably explaining which
    type of expression is required for a custom linter. Some linters are
    written to require the full file's parse tree (for example,
    `single_quotes_linter()`). Others only need single expressions,
    which is more cache-friendly (most linters are written this way to
    leverage caching) (#921, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `lint_dir()` excludes the `renv` and `packrat` directories by
    default (#697, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `lint()`: new optional argument `text` for supplying a line or lines
    directly, e.g. if the file is already in memory or linting is being
    done *ad hoc* (#503, @renkun-ken).
    !end-bullet!
-   !begin-bullet!
    `seq_linter()`: improve lint message to be clearer about the reason
    for linting (#522, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `unneeded_concatenation_linter()`:
    !begin-bullets-92!
    -   !begin-bullet!
        Correctly considers arguments in pipelines (`%>%` or `|>`; #573,
        #1270, @michaelquinn32 and @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        New argument `allow_single_expression`, default `TRUE`, toggling
        whether `c(x)` should be linted, i.e., a call to `c()` with only
        one entry which is not a constant. In some such cases, `c()` can
        simply be dropped, e.g. `c(a:b)`; in others, the parentheses are
        still needed, e.g. `-c(a:b)` should be `-(a:b)`; and in still
        others, `c()` is used for the side-effect of stripping
        attributes, e.g. `c(factor(letters))` or
        `c(matrix(1:10, 5, 2))`. In this last case, `c()` can (and
        should) in most cases be replaced by `as.vector()` or
        `as.integer()` for readability. In fact, we suspect it is
        *always* preferable to do so, and may change the default to
        `allow_single_expression = FALSE` in the future. Please report
        your use case if `as.vector()` does not suit your needs (#1344,
        @MichaelChirico).
        !end-bullet!

    !end-bullets-92!
    !end-bullet!
-   !begin-bullet!
    `use_lintr()`: new exported helper for creating a minimal `.lintr`
    configuration (#902, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `xml_nodes_to_lints()`: new exported helper for converting
    `xml_node` objects obtained using linter logic expressed in XPath
    into `Lint` objects (#1124, #1216, #1234, @MichaelChirico and
    @AshesITR).
    !end-bullet!

!end-bullets-89!

## Bug fixes

!begin-bullets-93!

-   !begin-bullet!
    **RStudio**: Source markers are cleared when there are no lints
    (#520, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    Error message for mismatched starts and ends of exclusion ranges is
    now more helpful. (#571, #860, @AshesITR and @danielinteractive).
    !end-bullet!
-   !begin-bullet!
    Improved location information for R parse errors (#894, #892,
    @renkun-ken and @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `get_source_expressions()`:
    !begin-bullets-94!
    -   !begin-bullet!
        Fix possible error on invalid XML produced by
        `xmlparsedata::xml_parse_data()` (#559, @renkun-ken).
        !end-bullet!
    -   !begin-bullet!
        Fix handling zero-length variable name error (#566,
        @renkun-ken).
        !end-bullet!
    -   !begin-bullet!
        Malformed Rmd files now cause a lint instead of an error (#571,
        @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        No longer fails if `getParseData()` returns a truncated
        (invalid) Unicode character as parsed text (#815, @leogama).
        !end-bullet!
    -   !begin-bullet!
        Fixes the `text` value for `STR_CONST` nodes involving 1- or
        2-width octal escapes (e.g. `"\1"`) to account for an R parser
        bug (https://bugs.r-project.org/show_bug.cgi?id=18323; #1056,
        @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Handle Rmd inputs containing unevaluated code blocks with named
        format specifiers (#472, @russHyde).
        !end-bullet!

    !end-bullets-94!
    !end-bullet!
-   !begin-bullet!
    `line_length_linter()`: fix a bug causing duplicate lints for lines
    containing multiple expressions (#681, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `lint_package()`:
    !begin-bullets-95!
    -   !begin-bullet!
        Warns and returns `NULL` if no package is found (instead of
        giving a peculiar error message; #776, @MichaelChirico).
        !end-bullet!
    -   !begin-bullet!
        Stricter about what is considered to be a package -- folders
        named `DESCRIPTION` are ignored (#702, @MichaelChirico).
        !end-bullet!

    !end-bullets-95!
    !end-bullet!
-   !begin-bullet!
    `linters_with_defaults()` (formerly `with_defaults()`):
    !begin-bullets-96!
    -   !begin-bullet!
        No longer duplicates the `lintr_function` class when it is
        already present (#511, @AshesITR).
        !end-bullet!
    -   !begin-bullet!
        Warns if a named argument is `NULL` but its name is not in
        `defaults` (#1049, @AshesITR).
        !end-bullet!

    !end-bullets-96!
    !end-bullet!
-   !begin-bullet!
    `linters_with_defaults()` handles automatic naming of very long
    arguments correctly (#774, @MichaelChirico).
    !end-bullet!
-   !begin-bullet!
    `save_cache()` will now recursively create the cache directory; this
    avoids errors that could arise if any parent directories do not
    exist (#60, @dankessler).
    !end-bullet!
-   !begin-bullet!
    `spaces_left_parentheses_linter()`: fix a bug causing warnings like
    "In `parent == parent[before_operator_idx]` longer object length is
    not a multiple of shorter object length" in nested expressions
    (#654, @AshesITR).
    !end-bullet!

!end-bullets-93!

## Internals

!begin-bullets-97!

-   !begin-bullet!
    Added a new, more restrictive test workflow - `test-package` - that
    fails on warnings emitted by tests (#1263, #1272, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    Added a secondary, more restrictive lint workflow -
    `lint-changed-files` - for newly written / modified code (#641,
    @dragosmg).
    !end-bullet!
-   !begin-bullet!
    Several optional `Imported` packages have become `Suggested`
    dependencies: `httr`, `testthat`, and `rstudioapi`. This should
    allow snappier CI builds for usages not relying on some more
    "peripheral" features of the package.
    !end-bullet!
-   !begin-bullet!
    Special thanks to @bersbersbers for early testing on the 3.0.0
    changes.
    !end-bullet!
-   !begin-bullet!
    Switched CI from Travis to GitHub Actions, using the full tidyverse
    recommended `R CMD check`. Code coverage and linting are implemented
    using separate GitHub Actions workflows (#572, @dragosmg).
    !end-bullet!
-   !begin-bullet!
    Updated R CMD GitHub Actions workflow to check for R 3.6 on Ubuntu,
    instead of R 3.3, and for R 4.0 on Windows, instead of R 3.6 (#803,
    @ dragosmg).
    !end-bullet!
-   !begin-bullet!
    `lintr` now uses the 3rd edition of `testthat` (@MichaelChirico,
    @AshesITR, #910, #967).
    !end-bullet!

!end-bullets-97!

# lintr 2.0.1

## New features

!begin-bullets-98!

-   !begin-bullet!
    lintr now supports GitHub Actions and will print the lints as
    warning messages if lints are printed during an action.
    !end-bullet!
-   !begin-bullet!
    `lint_package()` will now lint vignettes and data-raw by default
    (#447, @AshesITR).
    !end-bullet!
-   !begin-bullet!
    `lint_dir()` will now include Rmd and Rnw files by default
    (@AshesITR).
    !end-bullet!

!end-bullets-98!

## Minor fixes and features

!begin-bullets-99!

-   !begin-bullet!
    `single_quote_linter()` no longer causes a print issue when open
    quote appears at a column \> than close quote (#457, @jamieRowen)
    !end-bullet!
-   !begin-bullet!
    `absolute_path_linter()` and `nonportable_path_linter()` now handle
    file-paths that are wrapped with double-quotes (#433, #437,
    @russHyde).
    !end-bullet!
-   !begin-bullet!
    `get_source_expressions()` has been changed to handle
    `expr_or_assign_or_help` tokens arising when parsing code containing
    equals-assignments in R-devel (#403, #456, @russHyde).
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter` has been changed to ensure lint-position is
    indicated relative to the start of the file, rather than the start
    of a defining function (#432, @russHyde).
    !end-bullet!
-   !begin-bullet!
    `commas_linter` now allows spaces to come before a comma when used
    to denote a fall-through in a switch statement (#499,
    @MrMallIronmaker)
    !end-bullet!

!end-bullets-99!

# lintr 2.0.0

lintr 2.0.0 is a major release, and incorporates development changes
since the last major release (1.0.0) in 2016-04-16.

## Deprecated functions

!begin-bullets-100!

-   !begin-bullet!
    Deprecated `camel_case_linter()`, `snake_case_linter()` and
    `multiple_dots_linter()` in favor of `object_name_linter()` which
    enforce the given style: snake_case, dotted.case, lowerCamelCalse,
    UpperCamelCase, alllowercase or ALLUPPERCASE (#59, @fangly).
    !end-bullet!
-   !begin-bullet!
    Deprecated absolute_paths_linter() in favor of the new
    `absolute_path_linter()`, with a lax mode for fewer false positive
    lints (#199, @fangly).
    !end-bullet!

!end-bullets-100!

## New linters

!begin-bullets-101!

-   !begin-bullet!
    New `cyclocomp_linter()` identifies overly complex functions (#361,
    @fabian-s)
    !end-bullet!
-   !begin-bullet!
    New `equals_na_linter()` (#143, #326, @jabranham)
    !end-bullet!
-   !begin-bullet!
    New `extraction_operator_linter()` checks that the `[[` operator is
    used when extracting a single element from an object, not `[`
    (subsetting) nor `$` (interactive use) (@fangly).
    !end-bullet!
-   !begin-bullet!
    New `function_left_parentheses_linter()` to check that there is no
    space between a function name and its left parentheses (#204,
    @jrnold).
    !end-bullet!
-   !begin-bullet!
    New `implicit_integer_linter()` detects round numbers not declared
    as integers, i.e. 1 instead of 1L (@fangly).
    !end-bullet!
-   !begin-bullet!
    New `nonportable_path_linter()` identifies paths constructed without
    file.path() (@fangly).
    !end-bullet!
-   !begin-bullet!
    New `paren_brace_linter()` checks that there is a space between
    right parenthesis and an opening curly brace (@bfgray3, #242).
    !end-bullet!
-   !begin-bullet!
    New `pipe_continuation_linter()` to ensure there is a space before
    %\>% and newline afterwards (#216).
    !end-bullet!
-   !begin-bullet!
    New `semicolon_terminator_linter()` reports semicolons at the end of
    a line (#147,
    1)  and between expressions (#181, @fangly).

    !end-bullet!
-   !begin-bullet!
    New `seq_linter()`, finds `1:length(...)` (and similar) expressions
    (#155, 1)
    !end-bullet!
-   !begin-bullet!
    New `todo_comment_linter()` lints TODOs (@fangly).
    !end-bullet!
-   !begin-bullet!
    New `T_and_F_symbol_linter()` warns when using T and F instead of
    TRUE and FALSE (@fangly).
    !end-bullet!
-   !begin-bullet!
    New `undesirable_operator_linter()` and
    `undesirable_function_linter()` lint uses of user-specified
    functions and operators (#48, #149, @fangly).
    !end-bullet!
-   !begin-bullet!
    New `unneeded_concatenation_linter()` lints uses of c() with a
    constant or no arguments (@fangly).
    !end-bullet!

!end-bullets-101!

## New functions for writing linters

!begin-bullets-102!

-   !begin-bullet!
    Export `expect_lint()` (#178, #210)
    !end-bullet!
-   !begin-bullet!
    Export `ids_with_token()` and `with_id()` (#297 @stufield)
    !end-bullet!
-   !begin-bullet!
    linters can use the XML parse tree as well now, via the
    https://github.com/MangoTheCat/xmlparsedata package (#154, 1)
    !end-bullet!

!end-bullets-102!

## New functions for users

!begin-bullets-103!

-   !begin-bullet!
    New `lint_dir()` function to lint files under a given directory
    (@arekbee, #360)
    !end-bullet!
-   !begin-bullet!
    New `summary.lints()` function to summarize the linter results
    (#260, #262, @wlandau).
    !end-bullet!
-   !begin-bullet!
    New `checkstyle_output()` function to output lints to checkstyle XML
    output (#156, @joshkgold)
    !end-bullet!

!end-bullets-103!

## Linter fixes

!begin-bullets-104!

-   !begin-bullet!
    `closed_curly_linter()` now allows closing parenthesis or comma
    after closing curly brace (#167, @Enchufa2)
    !end-bullet!
-   !begin-bullet!
    `commas_linter()` now handles missing arguments calls properly
    (#145)
    !end-bullet!
-   !begin-bullet!
    `commented_code_linter()` now relaxed, it no longer lints comments
    within roxygen blocks and does not consider "-" an R operator to
    avoid too many false positives.
    !end-bullet!
-   !begin-bullet!
    `function_left_parentheses_linter()` now allows spaces if a function
    starts with a left parenthesis (#311)
    !end-bullet!
-   !begin-bullet!
    `no_tab_linter()` now reports proper line in all cases (#134,
    @fangly)
    !end-bullet!
-   !begin-bullet!
    `object_length_linter()` argument `length` now defaults to 30 for
    consistency (#325 @DragosMG)
    !end-bullet!
-   !begin-bullet!
    `object_name_linter()` now works when passed multiple styles (#341,
    @infotroph)
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` has been changed to better detect lexical
    scoping of global variables (#27, #336, #91, #382)
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` now respects `utils::globalVariables()`, so
    it can be used to avoid false positive warnings due to non-standard
    evaluation (#352)
    !end-bullet!
-   !begin-bullet!
    `object_usage_linter()` now ignores top level calls that contain
    function definitions (#26).
    !end-bullet!
-   !begin-bullet!
    `object_linter*()`s now only lint objects declared in the current
    file (#76, #108, #136, #191, #194, #201, @fangly).
    !end-bullet!
-   !begin-bullet!
    `open_curly_linter()` and `closed_curly_linter()` now do not lint
    double curly syntax (#388)
    !end-bullet!
-   !begin-bullet!
    `open_curly_linter()` now allows comments after the curly braces
    (#188)
    !end-bullet!
-   !begin-bullet!
    `pipe_continuation_linter()` now behaves better in nested
    expressions, functions etc. (#366 @russHyde)
    !end-bullet!
-   !begin-bullet!
    `space_inside_linter()` now reports proper line and column numbers
    (#203, @fangly)
    !end-bullet!

!end-bullets-104!

## General improvements and fixes

!begin-bullets-105!

-   !begin-bullet!
    `expect_lint()` now no longer shows Rstudio markers and error
    messages are correctly preserved (#180, #211, @fangly)
    !end-bullet!
-   !begin-bullet!
    `Lint()` / `as.data.frame()` error now fixed (#179, @fangly).
    !end-bullet!
-   !begin-bullet!
    `lint()` no longer errors with inline `\\Sexpr` (#127).
    !end-bullet!
-   !begin-bullet!
    `lint()` no longer errors with '\<% %\>' constructs (#185).
    !end-bullet!
-   !begin-bullet!
    `lint_package()` now works with the cache, as intended (#146,
    @schloerke)
    !end-bullet!
-   !begin-bullet!
    `lint_package()` now excludes `R/RcppExports.R` by default (#282)
    !end-bullet!
-   !begin-bullet!
    `lint_package()` now removes fully excluded files as soon as
    possible
    !end-bullet!
-   !begin-bullet!
    lintr now looks up its configuration in any parent directories as
    well as the package directory (#238, #345)
    !end-bullet!
-   !begin-bullet!
    `seq_linter` is now one of the default linters (#316).
    !end-bullet!
-   !begin-bullet!
    Fix issue in lintr's compatibility with R-devel, due to to a new
    version of the PCRE library (#411.)
    !end-bullet!
-   !begin-bullet!
    `read_settings()` now has a better error message when the config
    file does not end with a newline (#160, #189)
    !end-bullet!
-   !begin-bullet!
    `expect_lint_free()` is now automatically skipped when run on covr
    (#287)
    !end-bullet!
-   !begin-bullet!
    Now lintr only tries to generate comments if running in wercker or
    travis CI (#166)
    !end-bullet!
-   !begin-bullet!
    Add support for overriding GitHub API Token via `GITHUB_TOKEN`
    environment variable (#63, @mattyb)
    !end-bullet!
-   !begin-bullet!
    Config files are now also searched for in the users' home directory
    (#266, @randy3k)
    !end-bullet!
-   !begin-bullet!
    Fixed crash caused by ambiguous cache file paths (#212, @fangly).
    !end-bullet!
-   !begin-bullet!
    RStudio addins to lint current source and project (fixes #264,
    @JhossePaul)
    !end-bullet!
-   !begin-bullet!
    Added proper handling of tab characters (fixes #44, @fangly)
    !end-bullet!
-   !begin-bullet!
    lintr does not need the igraph package any more (#152, 1)
    !end-bullet!
-   !begin-bullet!
    Fixed cache not saved in a directory other than requested (#213,
    @fangly) avoid reading and pre-processing of ignored files
    (@mwaldstein)
    !end-bullet!
-   !begin-bullet!
    Allow for any number of `#` to start a comment. Useful in ESS (#299,
    @prosoitos)
    !end-bullet!
-   !begin-bullet!
    R Markdown files that do not contain chunks are no longer treated as
    code (#370).
    !end-bullet!
-   !begin-bullet!
    Fixed plain-code-block bug in Rmarkdown (#252, @russHyde)
    !end-bullet!
-   !begin-bullet!
    Fixed bug where non-R chunks using {lang} `engine format` were
    parsed from R-markdown (#322, @russHyde)
    !end-bullet!
-   !begin-bullet!
    Ensured `lintr` runs / installs / tests on R-3.6: pinned to github
    `xmlparsedata`; ensure vectors are length-1 when compared using `&&`
    and `||` (#363 #377 #384 #391, @russHyde).
    !end-bullet!

!end-bullets-105!

# lintr 1.0.3

!begin-bullets-106!

-   !begin-bullet!
    Fix tests to work with changes in the parser in R 3.6
    !end-bullet!

!end-bullets-106!

# lintr 1.0.2

!begin-bullets-107!

-   !begin-bullet!
    Fix tests to work with upcoming testthat release.
    !end-bullet!

!end-bullets-107!

# lintr 1.0.1

!begin-bullets-108!

-   !begin-bullet!
    bugfix to work with knitr 1.16.7
    !end-bullet!
-   !begin-bullet!
    `expect_lint_free()` now is always skipped on CRAN. This is
    necessary because the non-binary R source may not be available when
    running tests on CRAN, and those tests may not be run in the package
    directory.
    !end-bullet!

!end-bullets-108!

# lintr 1.0.0

!begin-bullets-109!

-   !begin-bullet!
    bugfix to work with testthat 1.0.0
    !end-bullet!

!end-bullets-109!

# lintr 0.3.3

!begin-bullets-110!

-   !begin-bullet!
    infix_spaces_linter now properly checks `=` in named arguments.
    (#130, @saurfang).
    !end-bullet!
-   !begin-bullet!
    commas_linter now properly recognizes lints when preceded by a blank
    line and points to the missing space rather than the comma (#111,
    #129, @saurfang).
    !end-bullet!
-   !begin-bullet!
    Make spaces_left_parentheses_linter more robust when determining `(`
    type (#128, @saurfang)
    !end-bullet!
-   !begin-bullet!
    commented_code_linter (#83, @jackwasey)
    !end-bullet!
-   !begin-bullet!
    Now trims long comments (#55, reported by @paulstaab)
    !end-bullet!
-   !begin-bullet!
    Automatic commenting of GitHub commits and pull requests when
    linting on Travis-CI
    !end-bullet!
-   !begin-bullet!
    expect_lint_free expectation can be added to testthat unit tests.
    !end-bullet!
-   !begin-bullet!
    Robust configuration system and exclusion logic
    !end-bullet!
-   !begin-bullet!
    Emacs and Sublime Text 3 plugins now available from their respective
    package repositories.
    !end-bullet!
-   !begin-bullet!
    add `names.lints`, `split.lints` (#49, @ttriche)
    !end-bullet!
-   !begin-bullet!
    Fixed bug that caused vim syntastic plugin not to work properly in
    windows (#46, @abossenbroek)
    !end-bullet!
-   !begin-bullet!
    allow lintr customization per project using `.lintr` config files.
    !end-bullet!
-   !begin-bullet!
    use `globalenv()` instead of `baseenv()` for default parent
    environment so that `methods` will be included.
    !end-bullet!
-   !begin-bullet!
    do not check object usage if eval fails. Fixes (#24, reported by
    @fabian-s)
    !end-bullet!
-   !begin-bullet!
    `trailing_whitespace_linter` was reporting the incorrect line number
    !end-bullet!
-   !begin-bullet!
    Use RStudio source marker API to display lints (#37, @jjallaire)
    !end-bullet!
-   !begin-bullet!
    Permit single quotes if they quote literal double quotes (#28,
    @jackwasey)
    !end-bullet!
-   !begin-bullet!
    `# nolint` comments are respected with caching (#68, @krlmlr)
    !end-bullet!
-   !begin-bullet!
    Properly handle all knitr document formats
    !end-bullet!
-   !begin-bullet!
    Allow for (( when linting (#259, @nathaneastwood)
    !end-bullet!
-   !begin-bullet!
    Remove \^ from infix spaces to conform with tidyverse. (#302,
    @nathaneastwood)
    !end-bullet!

!end-bullets-110!

# lintr 0.2.0

!begin-bullets-111!

-   !begin-bullet!
    Initial release
    !end-bullet!

!end-bullets-111!

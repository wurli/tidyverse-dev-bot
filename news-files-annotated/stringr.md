# stringr (development version)

## Breaking changes

!begin-bullets-1!

-   !begin-bullet!
    stringr functions now consistently implement the tidyverse recycling
    rules (#372). Overall this is a fairly minor change as stringi was
    already very close to the tidyverse rules. There are only two major
    changes:

    !begin-bullets-2!
    -   !begin-bullet!
        Only vectors of length 1 are recycled: previously,
        `str_detect(letters, c("x", "y"))` worked, but it now errors.

        !end-bullet!
    -   !begin-bullet!
        `str_c()` ignores `NULLs`, rather than treating them as length 0
        vectors.

        !end-bullet!

    !end-bullets-2!
    Additionally, many more non-vectorised arguments now throw errors,
    rather than warnings, if supplied a vector.

    !end-bullet!
-   !begin-bullet!
    `str_split_fixed()` now pads with `NA` rather than `" "` (#195).

    !end-bullet!
-   !begin-bullet!
    `regex()` and friends now generate class names with `stringr_`
    prefix (#384).

    !end-bullet!

!end-bullets-1!

## New features

!begin-bullets-3!

-   !begin-bullet!
    `str_view()` will use ANSI colouring if available (#370). This works
    in more places than HTML widgets and requires fewer dependencies.
    `str_view()` also no longer requires a pattern so you can use it to
    display strings with special characters. It now highlights
    whitespace characters apart from space since otherwise they are
    often confusing. It's also now vectorised over both `string` and
    `pattern` (#407). It defaults to displaying all matches, making
    `str_view_all()` redundant (and hence deprecated) (#455).

    !end-bullet!
-   !begin-bullet!
    New `vignette("from-base")` by @sastoudt provides a comprehensive
    comparison between base R functions and their stringr equivalents.
    It's designed to help you move to stringr if you're already familiar
    with base R string functions (#266).

    !end-bullet!
-   !begin-bullet!
    New `str_escape()` escapes regular expression metacharacters,
    providing an alternative to `fixed()` if you want to compose a
    pattern from external strings (#408).

    !end-bullet!
-   !begin-bullet!
    New `str_equal()` compares two character vectors using unicode
    rules, and optionally ignores case (#381).

    !end-bullet!
-   !begin-bullet!
    `str_extract()` can now optionally extract a capturing group instead
    of the complete match (#420).

    !end-bullet!
-   !begin-bullet!
    New `str_split_1()` is tailored for the special case of splitting up
    a single string (#409).

    !end-bullet!
-   !begin-bullet!
    New `str_split_i()` function to extract only a single piece from a
    string (#278, @bfgray3).

    !end-bullet!
-   !begin-bullet!
    New `str_like()` function which allows the use of SQL wildcards
    (#280, @rjpat).

    !end-bullet!
-   !begin-bullet!
    New `str_rank()` to complete set of order/rank/sort functions
    (#353).

    !end-bullet!
-   !begin-bullet!
    New `str_sub_all()` to extract multiple substrings from each string.

    !end-bullet!
-   !begin-bullet!
    New `str_unique()` is a wrapper around `stri_unique()` and returns
    unique string values in a character vector (#249, @seasmith).

    !end-bullet!
-   !begin-bullet!
    New `str_width()` returns the display width of a string (#380).

    !end-bullet!
-   !begin-bullet!
    stringr is now licensed as MIT (#351).

    !end-bullet!

!end-bullets-3!

## Minor improvements and bug fixes

!begin-bullets-4!

-   !begin-bullet!
    Better error message if you supply a non-string pattern (#378).

    !end-bullet!
-   !begin-bullet!
    Many typos in `sentences` have been fixed (@romatik, #299)

    !end-bullet!
-   !begin-bullet!
    `str_flatten()` gains a `last` argument that optionally override the
    final separator (#377). It gains a `na.rm` argument to remove
    missing values (since it's a summary function) (#439).

    !end-bullet!
-   !begin-bullet!
    `str_pad()` gains `use_width` argument to control whether to use the
    total code point width or the number of code points as "width" of a
    string (#190).

    !end-bullet!
-   !begin-bullet!
    `str_replace()` and `str_replace_all()` can use standard tidyverse
    formula shorthand for `replacement` function (#331).

    !end-bullet!
-   !begin-bullet!
    `str_starts()` and `str_ends()` now correctly respect regex operator
    precedence (@carlganz).

    !end-bullet!
-   !begin-bullet!
    `str_wrap()` breaks only at whitespace by default; set
    `whitespace_only = FALSE` to return to the previous behaviour (#335,
    @rjpat).

    !end-bullet!
-   !begin-bullet!
    `word()` now returns all the sentence when using a negative `start`
    parameter that is greater or equal than the number of words.
    (@pdelboca, #245)

    !end-bullet!

!end-bullets-4!

# stringr 1.4.1

Hot patch release to resolve R CMD check failures.

# stringr 1.4.0

!begin-bullets-5!

-   !begin-bullet!
    `str_interp()` now renders lists consistently independent on the
    presence of additional placeholders (@amhrasmussen).

    !end-bullet!
-   !begin-bullet!
    New `str_starts()` and `str_ends()` functions to detect patterns at
    the beginning or end of strings (@jonthegeek, #258).

    !end-bullet!
-   !begin-bullet!
    `str_subset()`, `str_detect()`, and `str_which()` get `negate`
    argument, which is useful when you want the elements that do NOT
    match (#259, @yutannihilation).

    !end-bullet!
-   !begin-bullet!
    New `str_to_sentence()` function to capitalize with sentence case
    (@jonthegeek, #202).

    !end-bullet!

!end-bullets-5!

# stringr 1.3.1

!begin-bullets-6!

-   !begin-bullet!
    `str_replace_all()` with a named vector now respects modifier
    functions (#207)

    !end-bullet!
-   !begin-bullet!
    `str_trunc()` is once again vectorised correctly (#203,
    @austin3dickey).

    !end-bullet!
-   !begin-bullet!
    `str_view()` handles `NA` values more gracefully (#217). I've also
    tweaked the sizing policy so hopefully it should work better in
    notebooks, while preserving the existing behaviour in knit documents
    (#232).

    !end-bullet!

!end-bullets-6!

# stringr 1.3.0

## API changes

!begin-bullets-7!

-   !begin-bullet!
    During package build, you may see
    `Error : object ‘ignore.case’ is not exported by 'namespace:stringr'`.
    This is because the long deprecated `str_join()`, `ignore.case()`
    and `perl()` have now been removed.
    !end-bullet!

!end-bullets-7!

## New features

!begin-bullets-8!

-   !begin-bullet!
    `str_glue()` and `str_glue_data()` provide convenient wrappers
    around `glue` and `glue_data()` from the
    [glue](http://glue.tidyverse.org/) package (#157).

    !end-bullet!
-   !begin-bullet!
    `str_flatten()` is a wrapper around `stri_flatten()` and clearly
    conveys flattening a character vector into a single string (#186).

    !end-bullet!
-   !begin-bullet!
    `str_remove()` and `str_remove_all()` functions. These wrap
    `str_replace()` and `str_replace_all()` to remove patterns from
    strings. (@Shians, #178)

    !end-bullet!
-   !begin-bullet!
    `str_squish()` removes spaces from both the left and right side of
    strings, and also converts multiple space (or space-like characters)
    to a single space within strings (@stephlocke, #197).

    !end-bullet!
-   !begin-bullet!
    `str_sub()` gains `omit_na` argument for ignoring `NA`. Accordingly,
    `str_replace()` now ignores `NA`s and keeps the original strings.
    (@yutannihilation, #164)

    !end-bullet!

!end-bullets-8!

## Bug fixes and minor improvements

!begin-bullets-9!

-   !begin-bullet!
    `str_trunc()` now preserves NAs (@ClaytonJY, #162)

    !end-bullet!
-   !begin-bullet!
    `str_trunc()` now throws an error when `width` is shorter than
    `ellipsis` (@ClaytonJY, #163).

    !end-bullet!
-   !begin-bullet!
    Long deprecated `str_join()`, `ignore.case()` and `perl()` have now
    been removed.

    !end-bullet!

!end-bullets-9!

# stringr 1.2.0

## API changes

!begin-bullets-10!

-   !begin-bullet!
    `str_match_all()` now returns NA if an optional group doesn't match
    (previously it returned ""). This is more consistent with
    `str_match()` and other match failures (#134).
    !end-bullet!

!end-bullets-10!

## New features

!begin-bullets-11!

-   !begin-bullet!
    In `str_replace()`, `replacement` can now be a function that is
    called once for each match and whose return value is used to replace
    the match.

    !end-bullet!
-   !begin-bullet!
    New `str_which()` mimics `grep()` (#129).

    !end-bullet!
-   !begin-bullet!
    A new vignette (`vignette("regular-expressions")`) describes the
    details of the regular expressions supported by stringr. The main
    vignette (`vignette("stringr")`) has been updated to give a
    high-level overview of the package.

    !end-bullet!

!end-bullets-11!

## Minor improvements and bug fixes

!begin-bullets-12!

-   !begin-bullet!
    `str_order()` and `str_sort()` gain explicit `numeric` argument for
    sorting mixed numbers and strings.

    !end-bullet!
-   !begin-bullet!
    `str_replace_all()` now throws an error if `replacement` is not a
    character vector. If `replacement` is `NA_character_` it replaces
    the complete string with replaces with `NA` (#124).

    !end-bullet!
-   !begin-bullet!
    All functions that take a locale (e.g. `str_to_lower()` and
    `str_sort()`) default to "en" (English) to ensure that the default
    is consistent across platforms.

    !end-bullet!

!end-bullets-12!

# stringr 1.1.0

!begin-bullets-13!

-   !begin-bullet!
    Add sample datasets: `fruit`, `words` and `sentences`.

    !end-bullet!
-   !begin-bullet!
    `fixed()`, `regex()`, and `coll()` now throw an error if you use
    them with anything other than a plain string (#60). I've clarified
    that the replacement for `perl()` is `regex()` not `regexp()` (#61).
    `boundary()` has improved defaults when splitting on non-word
    boundaries (#58, @lmullen).

    !end-bullet!
-   !begin-bullet!
    `str_detect()` now can detect boundaries (by checking for a
    `str_count()` \> 0) (#120). `str_subset()` works similarly.

    !end-bullet!
-   !begin-bullet!
    `str_extract()` and `str_extract_all()` now work with `boundary()`.
    This is particularly useful if you want to extract logical
    constructs like words or sentences. `str_extract_all()` respects the
    `simplify` argument when used with `fixed()` matches.

    !end-bullet!
-   !begin-bullet!
    `str_subset()` now respects custom options for `fixed()` patterns
    (#79, @gagolews).

    !end-bullet!
-   !begin-bullet!
    `str_replace()` and `str_replace_all()` now behave correctly when a
    replacement string contains `$`s, `\\\\1`, etc. (#83, #99).

    !end-bullet!
-   !begin-bullet!
    `str_split()` gains a `simplify` argument to match
    `str_extract_all()` etc.

    !end-bullet!
-   !begin-bullet!
    `str_view()` and `str_view_all()` create HTML widgets that display
    regular expression matches (#96).

    !end-bullet!
-   !begin-bullet!
    `word()` returns `NA` for indexes greater than number of words
    (#112).

    !end-bullet!

!end-bullets-13!

# stringr 1.0.0

!begin-bullets-14!

-   !begin-bullet!
    stringr is now powered by
    [stringi](https://github.com/Rexamine/stringi) instead of base R
    regular expressions. This improves unicode and support, and makes
    most operations considerably faster. If you find stringr inadequate
    for your string processing needs, I highly recommend looking at
    stringi in more detail.

    !end-bullet!
-   !begin-bullet!
    stringr gains a vignette, currently a straight forward update of the
    article that appeared in the R Journal.

    !end-bullet!
-   !begin-bullet!
    `str_c()` now returns a zero length vector if any of its inputs are
    zero length vectors. This is consistent with all other functions,
    and standard R recycling rules. Similarly, using `str_c("x", NA)`
    now yields `NA`. If you want `"xNA"`, use `str_replace_na()` on the
    inputs.

    !end-bullet!
-   !begin-bullet!
    `str_replace_all()` gains a convenient syntax for applying multiple
    pairs of pattern and replacement to the same vector:

    !begin-codeblock!
    ``` r
    input <- c("abc", "def")
    str_replace_all(input, c("[ad]" = "!", "[cf]" = "?"))
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `str_match()` now returns NA if an optional group doesn't match
    (previously it returned ""). This is more consistent with
    `str_extract()` and other match failures.

    !end-bullet!
-   !begin-bullet!
    New `str_subset()` keeps values that match a pattern. It's a
    convenient wrapper for `x[str_detect(x)]` (#21, @jiho).

    !end-bullet!
-   !begin-bullet!
    New `str_order()` and `str_sort()` allow you to sort and order
    strings in a specified locale.

    !end-bullet!
-   !begin-bullet!
    New `str_conv()` to convert strings from specified encoding to
    UTF-8.

    !end-bullet!
-   !begin-bullet!
    New modifier `boundary()` allows you to count, locate and split by
    character, word, line and sentence boundaries.

    !end-bullet!
-   !begin-bullet!
    The documentation got a lot of love, and very similar functions
    (e.g. first and all variants) are now documented together. This
    should hopefully make it easier to locate the function you need.

    !end-bullet!
-   !begin-bullet!
    `ignore.case(x)` has been deprecated in favour of
    `fixed|regex|coll(x, ignore.case = TRUE)`, `perl(x)` has been
    deprecated in favour of `regex(x)`.

    !end-bullet!
-   !begin-bullet!
    `str_join()` is deprecated, please use `str_c()` instead.

    !end-bullet!

!end-bullets-14!

# stringr 0.6.2

!begin-bullets-15!

-   !begin-bullet!
    fixed path in `str_wrap` example so works for more R installations.

    !end-bullet!
-   !begin-bullet!
    remove dependency on plyr

    !end-bullet!

!end-bullets-15!

# stringr 0.6.1

!begin-bullets-16!

-   !begin-bullet!
    Zero input to `str_split_fixed` returns 0 row matrix with `n`
    columns

    !end-bullet!
-   !begin-bullet!
    Export `str_join`

    !end-bullet!

!end-bullets-16!

# stringr 0.6

!begin-bullets-17!

-   !begin-bullet!
    new modifier `perl` that switches to Perl regular expressions

    !end-bullet!
-   !begin-bullet!
    `str_match` now uses new base function `regmatches` to extract
    matches - this should hopefully be faster than my previous pure R
    algorithm

    !end-bullet!

!end-bullets-17!

# stringr 0.5

!begin-bullets-18!

-   !begin-bullet!
    new `str_wrap` function which gives `strwrap` output in a more
    convenient format

    !end-bullet!
-   !begin-bullet!
    new `word` function extract words from a string given user defined
    separator (thanks to suggestion by David Cooper)

    !end-bullet!
-   !begin-bullet!
    `str_locate` now returns consistent type when matching empty string
    (thanks to Stavros Macrakis)

    !end-bullet!
-   !begin-bullet!
    new `str_count` counts number of matches in a string.

    !end-bullet!
-   !begin-bullet!
    `str_pad` and `str_trim` receive performance tweaks - for large
    vectors this should give at least a two order of magnitude speed up

    !end-bullet!
-   !begin-bullet!
    str_length returns NA for invalid multibyte strings

    !end-bullet!
-   !begin-bullet!
    fix small bug in internal `recyclable` function

    !end-bullet!

!end-bullets-18!

# stringr 0.4

!begin-bullets-19!

-   !begin-bullet!
    all functions now vectorised with respect to string, pattern (and
    where appropriate) replacement parameters
    !end-bullet!
-   !begin-bullet!
    fixed() function now tells stringr functions to use fixed matching,
    rather than escaping the regular expression. Should improve
    performance for large vectors.
    !end-bullet!
-   !begin-bullet!
    new ignore.case() modifier tells stringr functions to ignore case of
    pattern.
    !end-bullet!
-   !begin-bullet!
    str_replace renamed to str_replace_all and new str_replace function
    added. This makes str_replace consistent with all functions.
    !end-bullet!
-   !begin-bullet!
    new str_sub\<- function (analogous to substring\<-) for substring
    replacement
    !end-bullet!
-   !begin-bullet!
    str_sub now understands negative positions as a position from the
    end of the string. -1 replaces Inf as indicator for string end.
    !end-bullet!
-   !begin-bullet!
    str_pad side argument can be left, right, or both (instead of
    center)
    !end-bullet!
-   !begin-bullet!
    str_trim gains side argument to better match str_pad
    !end-bullet!
-   !begin-bullet!
    stringr now has a namespace and imports plyr (rather than requiring
    it)
    !end-bullet!

!end-bullets-19!

# stringr 0.3

!begin-bullets-20!

-   !begin-bullet!
    fixed() now also escapes \|
    !end-bullet!
-   !begin-bullet!
    str_join() renamed to str_c()
    !end-bullet!
-   !begin-bullet!
    all functions more carefully check input and return informative
    error messages if not as expected.
    !end-bullet!
-   !begin-bullet!
    add invert_match() function to convert a matrix of location of
    matches to locations of non-matches
    !end-bullet!
-   !begin-bullet!
    add fixed() function to allow matching of fixed strings.
    !end-bullet!

!end-bullets-20!

# stringr 0.2

!begin-bullets-21!

-   !begin-bullet!
    str_length now returns correct results when used with factors
    !end-bullet!
-   !begin-bullet!
    str_sub now correctly replaces Inf in end argument with length of
    string
    !end-bullet!
-   !begin-bullet!
    new function str_split_fixed returns fixed number of splits in a
    character matrix
    !end-bullet!
-   !begin-bullet!
    str_split no longer uses strsplit to preserve trailing breaks
    !end-bullet!

!end-bullets-21!

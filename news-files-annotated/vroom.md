# vroom (development version)

!begin-bullets-1!

-   !begin-bullet!
    vroom.tidyverse.org is the new home of vroom's website, catching up
    to the much earlier move (April 2022) of vroom's GitHub repository
    from the r-lib organization to the tidyverse. The motivation for
    that was to make it easier to transfer issues between these two
    closely connected packages.

    !end-bullet!
-   !begin-bullet!
    The `path` parameter has been removed from `vroom_write()`. This
    parameter was deprecated in vroom 1.5.0 (2021-06-14) in favor of the
    `file` parameter (#575).

    !end-bullet!
-   !begin-bullet!
    The function `vroom_altrep_opts()` and the argument
    `vroom(altrep_opts =)` have been removed. They were deprecated in
    favor of `vroom_altrep()` and `altrep =`, respectively, in v1.2.0
    (2020-01-13). Also applies to `vroom_fwf(altrep_opts =)` and
    `vroom_lines(altrep_opts =)` (#575).

    !end-bullet!
-   !begin-bullet!
    Columns specified as having type "number" (requested via
    `col_number()` or `"number"` or `'n'`) or "skip" (requested via
    `col_skip()` or `"skip"` or `_` or `-`) now work in the case where 0
    rows of data are parsed (#427, #540, #548).

    !end-bullet!
-   !begin-bullet!
    `vroom()`, `vroom_lines()`, and `vroom_fwf()` now close and destroy
    (instead of leak) the connection in the case where opening the
    connection fails due to, e.g., a nonexistent URL (#488).

    !end-bullet!
-   !begin-bullet!
    vroom takes the recommended approach for phasing out usage of the
    non-API entry points `SETLENGTH` and `SET_TRUELENGTH` (#582).

    !end-bullet!

!end-bullets-1!

# vroom 1.6.7

!begin-bullets-2!

-   !begin-bullet!
    `locale(encoding =)` now warns, instead of errors, when the encoding
    cannot be found in `iconvlist()` return value. This removes an
    unnecessary blocker on platforms like Alpine Linux where the output
    doesn't reflect actual capabilities.

    !end-bullet!
-   !begin-bullet!
    vroom no longer uses `STDVEC_DATAPTR()` and takes the recommended
    approach for phasing out usage of `DATAPTR()` (#561).

    !end-bullet!
-   !begin-bullet!
    `problems()` works normally for vroom-produced objects, even if
    readr is attached (#534, #554).

    !end-bullet!
-   !begin-bullet!
    `problems()` are no longer corrupted if the offending data frame is
    partially materialized, e.g. by viewing a subset, before calling
    `problems()` (#535).

    !end-bullet!

!end-bullets-2!

# vroom 1.6.6

!begin-bullets-3!

-   !begin-bullet!
    Fixed a bad URL in the README at CRAN's request.
    !end-bullet!

!end-bullets-3!

# vroom 1.6.5

!begin-bullets-4!

-   !begin-bullet!
    Internal changes requested by CRAN around format specification
    (#524).
    !end-bullet!

!end-bullets-4!

# vroom 1.6.4

!begin-bullets-5!

-   !begin-bullet!
    It is now possible (again?) to read from a list of connections
    (@bairdj, #514).

    !end-bullet!
-   !begin-bullet!
    Internal change for compatibility with cpp11 \>= 0.4.6
    (@DavisVaughan, #512).

    !end-bullet!

!end-bullets-5!

# vroom 1.6.3

!begin-bullets-6!

-   !begin-bullet!
    No user-facing changes.
    !end-bullet!

!end-bullets-6!

# vroom 1.6.2

!begin-bullets-7!

-   !begin-bullet!
    There was no CRAN release with this version number.
    !end-bullet!

!end-bullets-7!

# vroom 1.6.1

!begin-bullets-8!

-   !begin-bullet!
    `str()` now works in a colorized context in the presence of a column
    of class `integer64`, i.e. parsed with `col_big_integer()` (@bart1,
    #477).

    !end-bullet!
-   !begin-bullet!
    The embedded implementation of the Grisu algorithm for printing
    floating point numbers now uses `snprintf()` instead of `sprintf()`
    and likewise for vroom's own code (@jeroen, #480).

    !end-bullet!

!end-bullets-8!

# vroom 1.6.0

!begin-bullets-9!

-   !begin-bullet!
    `vroom(col_select=)` now handles column selection by numeric
    position when `id` column is provided (#455).

    !end-bullet!
-   !begin-bullet!
    `vroom(id = "path", col_select = a:c)` is treated like
    `vroom(id = "path", col_select = c(path, a:c))`. If an `id` column
    is provided, it is automatically included in the output (#416).

    !end-bullet!
-   !begin-bullet!
    `vroom_write(append = TRUE)` does not modify an existing file when
    appending an empty data frame. In particular, it does not overwrite
    (delete) the existing contents of that file
    (https://github.com/tidyverse/readr/issues/1408, #451).

    !end-bullet!
-   !begin-bullet!
    `vroom::problems()` now defaults to `.Last.value` for its primary
    input, similar to how `readr::problems()` works (#443).

    !end-bullet!
-   !begin-bullet!
    The warning that indicates the existence of parsing problems has
    been improved, which should make it easier for the user to follow-up
    (https://github.com/tidyverse/readr/issues/1322).

    !end-bullet!
-   !begin-bullet!
    `vroom()` reads more reliably from filepaths containing non-ascii
    characters, in a non-UTF-8 locale (#394, #438).

    !end-bullet!
-   !begin-bullet!
    `vroom_format()` and `vroom_write()` only quote values that contain
    a delimiter, quote, or newline. Specifically values that are equal
    to the `na` string (or that start with it) are no longer quoted
    (#426).

    !end-bullet!
-   !begin-bullet!
    Fixed segfault when reading in multiple files and the first file has
    only a header row of column names, but subsequent files have at
    least one row (#430).

    !end-bullet!
-   !begin-bullet!
    Fixed segfault when `vroom_format()` is given an empty data frame
    (#425)

    !end-bullet!
-   !begin-bullet!
    Fixed a segfault that could occur when the final field of the final
    line is missing and the file also does not end in a newline (#429).

    !end-bullet!
-   !begin-bullet!
    Fixed recursive garbage collection error that could occur during
    `vroom_write()` when `output_column()` generates an ALTREP vector
    (#389).

    !end-bullet!
-   !begin-bullet!
    `vroom_progress()` uses `rlang::is_interactive()` instead of
    `base::interactive()`.

    !end-bullet!
-   !begin-bullet!
    `col_factor(levels = NULL)` honors the `na` strings of `vroom()` and
    its own `include_na` argument, as described in the docs, and now
    reproduces the behaviour of readr's first edition parser (#396).

    !end-bullet!

!end-bullets-9!

# vroom 1.5.7

!begin-bullets-10!

-   !begin-bullet!
    Jenny Bryan is now the official maintainer.

    !end-bullet!
-   !begin-bullet!
    Fix uninitialized bool detected by CRAN's UBSAN check
    (https://github.com/tidyverse/vroom/pull/386)

    !end-bullet!
-   !begin-bullet!
    Fix buffer overflow when trying to parse an integer field that is
    over 64 characters long
    (https://github.com/tidyverse/readr/issues/1326)

    !end-bullet!
-   !begin-bullet!
    Fix subset indexing when indexes span a file boundary multiple times
    (#383)

    !end-bullet!

!end-bullets-10!

# vroom 1.5.6

!begin-bullets-11!

-   !begin-bullet!
    `vroom(col_select=)` now works if `col_names = FALSE` as intended
    (#381)

    !end-bullet!
-   !begin-bullet!
    `vroom(n_max=)` now correctly handles cases when reading from a
    connection and the file does *not* end with a newline
    (https://github.com/tidyverse/readr/issues/1321)

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer issues a spurious warning when the parsing needs
    to be restarted due to the presence of embedded newlines
    (https://github.com/tidyverse/readr/issues/1313)

    !end-bullet!
-   !begin-bullet!
    Fix performance issue when materializing subsetted vectors (#378)

    !end-bullet!
-   !begin-bullet!
    `vroom_format()` now uses the same internal multi-threaded code as
    `vroom_write()`, improving its performance in most cases (#377)

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf()` no longer omits the last line if it does *not* end
    with a newline (https://github.com/tidyverse/readr/issues/1293)

    !end-bullet!
-   !begin-bullet!
    Empty files or files with only a header line and no data no longer
    cause a crash if read with multiple files
    (https://github.com/tidyverse/readr/issues/1297)

    !end-bullet!
-   !begin-bullet!
    Files with a header but no contents, or a empty file if
    `col_names = FALSE` no longer cause a hang when `progress = TRUE`
    (https://github.com/tidyverse/readr/issues/1297)

    !end-bullet!
-   !begin-bullet!
    Commented lines with comments at the end of lines no longer hang R
    (https://github.com/tidyverse/readr/issues/1309)

    !end-bullet!
-   !begin-bullet!
    Comment lines containing unpaired quotes are no longer treated as
    unterminated quotations
    (https://github.com/tidyverse/readr/issues/1307)

    !end-bullet!
-   !begin-bullet!
    Values with only a `Inf` or `NaN` prefix but additional data
    afterwards, like `Inform` or no longer inappropriately guessed as
    doubles (https://github.com/tidyverse/readr/issues/1319)

    !end-bullet!
-   !begin-bullet!
    Time types now support `%h` format to denote hour durations greater
    than 24, like readr (https://github.com/tidyverse/readr/issues/1312)

    !end-bullet!
-   !begin-bullet!
    Fix performance issue when materializing subsetted vectors (#378)

    !end-bullet!

!end-bullets-11!

# vroom 1.5.5

!begin-bullets-12!

-   !begin-bullet!
    `vroom()` now supports files with only carriage return newlines
    (`\r`). (#360, https://github.com/tidyverse/readr/issues/1236)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now parses single digit datetimes more consistently as
    readr has done (https://github.com/tidyverse/readr/issues/1276)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now parses `Inf` values as doubles
    (https://github.com/tidyverse/readr/issues/1283)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now parses `NaN` values as doubles
    (https://github.com/tidyverse/readr/issues/1277)

    !end-bullet!
-   !begin-bullet!
    `VROOM_CONNECTION_SIZE` is now parsed as a double, which supports
    scientific notation (#364)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now works around specifying a `\n` as the delimiter (#365,
    https://github.com/tidyverse/dplyr/issues/5977)

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer crashes if given a `col_name` and `col_type`
    both less than the number of columns
    (https://github.com/tidyverse/readr/issues/1271)

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer hangs if given an empty value for
    `locale(grouping_mark=)`
    (https://github.com/tidyverse/readr/issues/1241)

    !end-bullet!
-   !begin-bullet!
    Fix performance regression when guessing with large numbers of rows
    (https://github.com/tidyverse/readr/issues/1267)

    !end-bullet!

!end-bullets-12!

# vroom 1.5.4

!begin-bullets-13!

-   !begin-bullet!
    `vroom(col_types=)` now accepts column type names like those
    accepted by utils::read.table. e.g. vroom::vroom(col_types = list(a
    = "integer", b = "double", c = "skip"))

    !end-bullet!
-   !begin-bullet!
    `vroom()` now respects the `quote` parameter properly in the first
    two lines of the file
    (https://github.com/tidyverse/readr/issues/1262)

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` now always correctly writes its output including
    column names in UTF-8
    (https://github.com/tidyverse/readr/issues/1242)

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` now creates an empty file when given a input without
    any columns (https://github.com/tidyverse/readr/issues/1234)

    !end-bullet!

!end-bullets-13!

# vroom 1.5.3

!begin-bullets-14!

-   !begin-bullet!
    `vroom(col_types=)` now truncates the column types if the user
    passes too many types. (#355)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now always includes the last row when guessing (#352)

    !end-bullet!
-   !begin-bullet!
    `vroom(trim_ws = TRUE)` now trims field content within quotes as
    well as without (#354). Previously vroom explicitly retained field
    content inside quotes regardless of the value of `trim_ws`.

    !end-bullet!

!end-bullets-14!

# vroom 1.5.2

!begin-bullets-15!

-   !begin-bullet!
    `vroom()` now supports inputs with unnamed column types that are
    less than the number of columns (#296)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now outputs the correct column names even in the presence
    of skipped columns (#293, tidyverse/readr#1215)

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf(n_max=)` now works as intended when the input is a
    connection.

    !end-bullet!
-   !begin-bullet!
    `vroom()` and `vroom_write()` now automatically detect the
    compression format regardless of the file extension for bzip2, xzip,
    gzip and zip files (#348)

    !end-bullet!
-   !begin-bullet!
    `vroom()` and `vroom_write()` now automatically support many more
    archive formats thanks to the archive package. These include new
    support for writing zip files, reading and writing 7zip, tar and ISO
    files.

    !end-bullet!
-   !begin-bullet!
    `vroom(num_threads = 1)` will now not spawn any threads. This can be
    used on as a workaround on systems without full thread support.

    !end-bullet!
-   !begin-bullet!
    Threads are now automatically disabled on non-macOS systems
    compiling against clang's libc++. Most systems non-macOS systems use
    the more common gcc libstdc++, so this should not effect most users.

    !end-bullet!

!end-bullets-15!

# vroom 1.5.1

!begin-bullets-16!

-   !begin-bullet!
    Parsers now treat NA values as NA even if they are valid values for
    the types (#342)

    !end-bullet!
-   !begin-bullet!
    Element-wise indexing into lazy (ALTREP) vectors now has much less
    overhead (#344)

    !end-bullet!

!end-bullets-16!

# vroom 1.5.0

## Major improvements

!begin-bullets-17!

-   !begin-bullet!
    New `vroom(show_col_types=)` argument to more simply control when
    column types are shown.

    !end-bullet!
-   !begin-bullet!
    `vroom()`, `vroom_fwf()` and `vroom_lines()` now support multi-byte
    encodings such as UTF-16 and UTF-32 by converting these files to
    UTF-8 under the hood (#138)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now supports skipping comments and blank lines within
    data, not just at the start of the file (#294, #302)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now uses the tzdb package when parsing date-times
    (@DavisVaughan, #273)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now emits a warning of class `vroom_parse_issue` if there
    are non-fatal parsing issues.

    !end-bullet!
-   !begin-bullet!
    `vroom()` now emits a warning of class
    `vroom_mismatched_column_name` if the user supplies a column type
    that does not match the name of a read column (#317).

    !end-bullet!
-   !begin-bullet!
    The vroom package now uses the MIT license, as part of systematic
    relicensing throughout the r-lib and tidyverse packages (#323)

    !end-bullet!

!end-bullets-17!

## Minor improvements and fixes

!begin-bullets-18!

-   !begin-bullet!
    \`vroom() correctly reads double values with comma as decimal
    separator (@kent37 #313)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now correctly skips lines with only one quote if the
    format doesn't use quoting
    (https://github.com/tidyverse/readr/issues/991#issuecomment-616378446)

    !end-bullet!
-   !begin-bullet!
    `vroom()` and `vroom_lines()` now handle files with mixed windows
    and POSIX line endings
    (https://github.com/tidyverse/readr/issues/1210)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now outputs a tibble with the expected number of columns
    and types based on `col_types` and `col_names` even if the file is
    empty (#297).

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer mis-indexes files read from connections with
    windows line endings when the two line endings falls on separate
    sides of the read buffer (#331)

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer crashes if `n_max = 0` and `col_names` is a
    character (#316)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now preserves the spec attribute when vroom and readr are
    both loaded (#303)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now allows specifying column names in `col_types` that
    have been repaired (#311)

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer inadvertently calls `.name_repair` functions
    twice (#310).

    !end-bullet!
-   !begin-bullet!
    `vroom()` is now more robust to quoting issues when tracking the CSV
    state (#301)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now registers the S3 class with `methods::setOldClass()`
    (r-dbi/DBI#345)

    !end-bullet!
-   !begin-bullet!
    `col_datetime()` now supports '%s' format, which represents decimal
    seconds since the Unix epoch.

    !end-bullet!
-   !begin-bullet!
    `col_numeric()` now supports `grouping_mark` and `decimal_mark` that
    are unicode characters, such as U+00A0 which is commonly used as the
    grouping mark for numbers in France
    (https://github.com/tidyverse/readr/issues/796).

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf()` gains a `skip_empty_rows` argument to skip empty lines
    (https://github.com/tidyverse/readr/issues/1211)

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf()` now respects `n_max`, as intended (#334)

    !end-bullet!
-   !begin-bullet!
    `vroom_lines()` gains a `na` argument.

    !end-bullet!
-   !begin-bullet!
    `vroom_write_lines()` no longer escapes or quotes lines.

    !end-bullet!
-   !begin-bullet!
    `vroom_write_lines()` now works as intended (#291).

    !end-bullet!
-   !begin-bullet!
    `vroom_write(path=)` has been deprecated, in favor of `file`, to
    match readr.

    !end-bullet!
-   !begin-bullet!
    `vroom_write_lines()` now exposes the `num_threads` argument.

    !end-bullet!
-   !begin-bullet!
    `problems()` now prints the correct row number of parse errors
    (#326)

    !end-bullet!
-   !begin-bullet!
    `problems()` now throws a more informative error if called on a
    readr object (#308).

    !end-bullet!
-   !begin-bullet!
    `problems()` now de-duplicates identical problems (#318)

    !end-bullet!
-   !begin-bullet!
    Fix an inadvertent performance regression when reading values (#309)

    !end-bullet!
-   !begin-bullet!
    `n_max` argument is correctly respected in edge cases (#306)

    !end-bullet!
-   !begin-bullet!
    factors with implicit levels now work when fields are quoted, as
    intended (#330)

    !end-bullet!
-   !begin-bullet!
    Guessing double types no longer unconditionally ignores leading
    whitespace. Now whitespace is only ignored when `trim_ws` is set.

    !end-bullet!

!end-bullets-18!

# vroom 1.4.0

## Major changes and new functions

!begin-bullets-19!

-   !begin-bullet!
    vroom now tracks indexing and parsing errors like readr. The first
    time an issue is encountered a warning will be signaled. A tibble of
    all found problems can be retrieved with `vroom::problems()`. (#247)

    !end-bullet!
-   !begin-bullet!
    Data with newlines within quoted fields will now automatically
    revert to using a single thread and be properly read (#282)

    !end-bullet!
-   !begin-bullet!
    NUL values in character data are now permitted, with a warning.

    !end-bullet!
-   !begin-bullet!
    New `vroom_write_lines()` function to write a character vector to a
    file (#291)

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` gains a `eol=` parameter to specify the end of line
    character(s) to use. Use `vroom_write(eol = "\r\n")` to write a file
    with Windows style newlines (#263).

    !end-bullet!

!end-bullets-19!

## Minor improvements and fixes

!begin-bullets-20!

-   !begin-bullet!
    Datetime formats used when guessing now match those used when
    parsing (#240)

    !end-bullet!
-   !begin-bullet!
    Quotes are now only valid next to newlines or delimiters (#224)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now signals an R error for invalid date and datetime
    formats, instead of crashing the session (#220).

    !end-bullet!
-   !begin-bullet!
    `vroom(comment = )` now accepts multi-character comments (#286)

    !end-bullet!
-   !begin-bullet!
    `vroom_lines()` now works with empty files (#285)

    !end-bullet!
-   !begin-bullet!
    Vectors are now subset properly when given invalid subscripts (#283)

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` now works when the delimiter is empty,
    e.g. `delim = ""` (#287).

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` now works with all ALTREP vectors, including string
    vectors (#270)

    !end-bullet!
-   !begin-bullet!
    An internal call to `new.env()` now correctly uses the `parent`
    argument (#281)

    !end-bullet!

!end-bullets-20!

# vroom 1.3.2

!begin-bullets-21!

-   !begin-bullet!
    Test failures on R 4.1 related to factors with NA values fixed
    (#262)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now works without error with readr versions of col specs
    (#256, #264, #266)

    !end-bullet!

!end-bullets-21!

# vroom 1.3.1

!begin-bullets-22!

-   !begin-bullet!
    Test failures on R 4.1 related to POSIXct classes fixed (#260)

    !end-bullet!
-   !begin-bullet!
    Column subsetting with double indexes now works again (#257)

    !end-bullet!
-   !begin-bullet!
    `vroom(n_max=)` now only partially downloads files from connections,
    as intended (#259)

    !end-bullet!

!end-bullets-22!

# vroom 1.3.0

!begin-bullets-23!

-   !begin-bullet!
    The Rcpp dependency has been removed in favor of cpp11.

    !end-bullet!
-   !begin-bullet!
    `vroom()` now handles cases when `id` is set and a column in skipped
    (#237)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now supports column selections when there are some empty
    column names (#238)

    !end-bullet!
-   !begin-bullet!
    `vroom()` argument `n_max` now works properly for files with windows
    newlines and no final newline (#244)

    !end-bullet!
-   !begin-bullet!
    Subsetting vectors now works with `View()` in RStudio if there are
    now rows to subset (#253).

    !end-bullet!
-   !begin-bullet!
    Subsetting datetime columns now works with `NA` indices (#236).

    !end-bullet!

!end-bullets-23!

# vroom 1.2.1

!begin-bullets-24!

-   !begin-bullet!
    `vroom()` now writes the column names if given an input with no rows
    (#213)

    !end-bullet!
-   !begin-bullet!
    `vroom()` columns now support indexing with NA values (#201)

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer truncates the last value in a file if the file
    contains windows newlines but no final newline (#219).

    !end-bullet!
-   !begin-bullet!
    `vroom()` now works when the `na` argument is encoded in non ASCII
    or UTF-8 locales *and* the file encoding is not the same as the
    native encoding (#233).

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf()` now verifies that the positions are valid, namely that
    the begin value is always less than the previous end (#217).

    !end-bullet!
-   !begin-bullet!
    `vroom_lines()` gains a `locale` argument so you can control the
    encoding of the file (#218)

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` now supports the `append` argument with R
    connections (#232)

    !end-bullet!

!end-bullets-24!

# vroom 1.2.0

## Breaking changes

!begin-bullets-25!

-   !begin-bullet!
    `vroom_altrep_opts()` and the argument `vroom(altrep_opts =)` have
    been renamed to `vroom_altrep()` and `altrep` respectively. The
    prior names have been deprecated.
    !end-bullet!

!end-bullets-25!

## New Features

!begin-bullets-26!

-   !begin-bullet!
    `vroom()` now supports reading Big Integer values with the `bit64`
    package. Use `col_big_integer()` or the "I" shortcut to read a
    column as big integers. (#198)

    !end-bullet!
-   !begin-bullet!
    `cols()` gains a `.delim` argument and `vroom()` now uses it as the
    delimiter if it is provided (#192)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now supports reading from `stdin()` directly, interpreted
    as the C-level standard input (#106).

    !end-bullet!

!end-bullets-26!

## Minor improvements and fixes

!begin-bullets-27!

-   !begin-bullet!
    `col_date` now parses single digit month and day (@edzer, #123,
    #170)

    !end-bullet!
-   !begin-bullet!
    `fwf_empty()` now uses the `skip` parameter, as intended.

    !end-bullet!
-   !begin-bullet!
    `vroom()` can now read single line files without a terminal newline
    (#173).

    !end-bullet!
-   !begin-bullet!
    `vroom()` can now select the id column if provided (#110).

    !end-bullet!
-   !begin-bullet!
    `vroom()` now correctly copies string data for factor levels (#184)

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer crashes when files have trailing fields, windows
    newlines and the file is not newline or null terminated.

    !end-bullet!
-   !begin-bullet!
    `vroom()` now includes a spec object with the `col_types` class, as
    intended.

    !end-bullet!
-   !begin-bullet!
    `vroom()` now better handles floating point values with very large
    exponents (#164).

    !end-bullet!
-   !begin-bullet!
    `vroom()` now uses better heuristics to guess the delimiter and now
    throws an error if a delimiter cannot be guessed (#126, #141, #167).

    !end-bullet!
-   !begin-bullet!
    `vroom()` now has an improved error message when a file does not
    exist (#169).

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer leaks file handles (#177, #180)

    !end-bullet!
-   !begin-bullet!
    `vroom()` now outputs its messages on `stdout()` rather than
    `stderr()`, which avoids the text being red in RStudio and in the
    Windows GUI.

    !end-bullet!
-   !begin-bullet!
    `vroom()` no longer overflows when reading files with more than 2B
    entries (@wlattner, #183).

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf()` is now more robust if not all lines are the expected
    length (#78)

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf()` and `fwf_empty()` now support passing `Inf` to
    `guess_max()`.

    !end-bullet!
-   !begin-bullet!
    `vroom_str()` now works with S4 objects.

    !end-bullet!
-   !begin-bullet!
    `vroom_fwf()` now handles files with dos newlines properly.

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` now does not try to write anything when given empty
    inputs (#172).

    !end-bullet!
-   !begin-bullet!
    Dates, times, and datetimes now properly consider the locale when
    parsing.

    !end-bullet!
-   !begin-bullet!
    Added benchmarks with *wide* data for both numeric and character
    data (#87, @R3myG)

    !end-bullet!
-   !begin-bullet!
    The delimiter used for parsing is now shown in the message output
    (#95 @R3myG)

    !end-bullet!

!end-bullets-27!

# vroom 1.0.2

## New Features

!begin-bullets-28!

-   !begin-bullet!
    The column created by `id` is now stored as an run length encoded
    Altrep vector, which uses less memory and is much faster for large
    inputs. (#111)
    !end-bullet!

!end-bullets-28!

## Minor improvements and fixes

!begin-bullets-29!

-   !begin-bullet!
    `vroom_lines()` now properly respects the `n_max` parameter (#142)

    !end-bullet!
-   !begin-bullet!
    `vroom()` and `vroom_lines()` now support reading files which do not
    end in newlines by using a file connection (#40).

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` now works with the standard output connection
    `stdout()` (#106).

    !end-bullet!
-   !begin-bullet!
    `vroom_write()` no longer crashes non-deterministically when used on
    Altrep vectors.

    !end-bullet!
-   !begin-bullet!
    The integer parser now returns NA values for invalid inputs (#135)

    !end-bullet!
-   !begin-bullet!
    Fix additional UBSAN issue in the mio project reported by CRAN (#97)

    !end-bullet!
-   !begin-bullet!
    Fix indexing into connections with quoted fields (#119)

    !end-bullet!
-   !begin-bullet!
    Move example files for `vroom()` out of `\dontshow{}`.

    !end-bullet!
-   !begin-bullet!
    Fix integer overflow with very large files (#116, #119)

    !end-bullet!
-   !begin-bullet!
    Fix missing columns and windows newlines (#114)

    !end-bullet!
-   !begin-bullet!
    Fix encoding of column names (#113, #115)

    !end-bullet!
-   !begin-bullet!
    Throw an error message when writing a zip file, which is not
    supported (@metaOO, #145)

    !end-bullet!
-   !begin-bullet!
    Default message output from `vroom()` now uses `Rows` and `Cols`
    (@meta00, #140)

    !end-bullet!

!end-bullets-29!

# vroom 1.0.1

## New Features

!begin-bullets-30!

-   !begin-bullet!
    `vroom_lines()` function added, to (lazily) read lines from a file
    into a character vector (#90).
    !end-bullet!

!end-bullets-30!

## Minor improvements and fixes

!begin-bullets-31!

-   !begin-bullet!
    Fix for a hang on Windows caused by a race condition in the progress
    bar (#98)

    !end-bullet!
-   !begin-bullet!
    Remove accidental runtime dependency on testthat (#104)

    !end-bullet!
-   !begin-bullet!
    Fix to actually return non-Altrep character columns on R 3.2, 3.3
    and 3.4.

    !end-bullet!
-   !begin-bullet!
    Disable colors in the progress bar when running in RStudio, to work
    around an issue where the progress bar would be garbled
    (https://github.com/rstudio/rstudio/issues/4777)

    !end-bullet!
-   !begin-bullet!
    Fix for UBSAN issues reported by CRAN (#97)

    !end-bullet!
-   !begin-bullet!
    Fix for rchk issues reported by CRAN (#94)

    !end-bullet!
-   !begin-bullet!
    The progress bar now only updates every 10 milliseconds.

    !end-bullet!
-   !begin-bullet!
    Getting started vignette index entry now more informative (#92)

    !end-bullet!

!end-bullets-31!

# vroom 1.0.0

!begin-bullets-32!

-   !begin-bullet!
    Initial release

    !end-bullet!
-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.

    !end-bullet!

!end-bullets-32!

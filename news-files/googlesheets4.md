# googlesheets4 (development version)

# googlesheets4 1.0.1

!begin-bullet!

The mere existence of an invalid named range no longer prevents
googlesheets4 from dealing with a Sheet (#175).

!end-bullet!

!begin-bullet!

googlesheets4 now understands that Google Sheets can have 10 million
cells (up from 5 million) (#257).

!end-bullet!

## Internal matters

!begin-bullet!

Help files below `man/` have been re-generated, so that they give rise
to valid HTML5. (This is the impetus for this release, to keep the
package safely on CRAN.)

!end-bullet!

!begin-bullet!

Examples now use `@examplesIf` to express when a token or an interactive
session is required for successful execution.

!end-bullet!

!begin-bullet!

Errors have been revised to (more often) reveal the most appropriate
call, i.e. the high-level function called by the user as opposed to an
internal helper (#255).

!end-bullet!

!begin-bullet!

Informative messages now route through `cli::cli_inform()`, instead of
`cli::cli_bullets()`.

!end-bullet!

# googlesheets4 1.0.0

## User interface

!begin-bullet!

The user interface has gotten more stylish, thanks to the cli package
(<https://cli.r-lib.org>).

!end-bullet!

!begin-bullet!

All informational messages, warnings, and errors are now emitted via
cli, which uses rlang's condition functions under-the-hood.
googlesheets4 now throws errors with class `"googlesheets4_error"`
(#12).

!end-bullet!

!begin-bullet!

`googlesheets4_quiet` is a new option to suppress informational messages
from googlesheets4 (#163). Unless it's explicitly set to `TRUE`, the
default is to message.

!end-bullet!

!begin-bullet!

`local_gs4_quiet()` and `with_gs4_quiet()` are
[withr-style](https://withr.r-lib.org) convenience helpers for setting
`googlesheets4_quiet = TRUE`.

!end-bullet!

## Other changes

!begin-bullet!

The deprecated `sheets_*()` functions have now been removed, as promised
in the warning they have been throwing for over a year. No functionality
has been removed, this is just the result of the function (re-)naming
scheme adopted in googlesheets4 \>= 0.2.0. More details are in [this
developer
documentation](https://googlesheets4.tidyverse.org/articles/articles/function-class-names.html#previous-use-of-sheets-prefix).

!end-bullet!

!begin-bullet!

The `na` argument of `read_sheet()` has become more capable and more
consistent with readr. Specifically, `na = character()` (or the general
lack of `""` among the `na` strings) results in cells with no data
appearing as the empty string `""` within a character vector, as opposed
to `NA` (#174).

!end-bullet!

!begin-bullet!

Explicit `NULL`s are now written properly, i.e. as an empty cell (#203).

!end-bullet!

!begin-bullet!

`sheet_append()` no longer touches any aspect of cell formatting other
than `numberFormat` (#204).

!end-bullet!

!begin-bullet!

`gs4_example()` and `gs4_examples()` now learn the example Sheet ids
from a Google Sheet. This should not change anything for users, but it
means there is an API call the first time either of these functions is
called.

!end-bullet!

## Dependency changes

!begin-bullets-1!

-   !begin-bullet!
    cli is new in Imports.

    !end-bullet!
-   !begin-bullet!
    googlesheets4 Suggests testthat \>= 3.0.0 and, specifically, uses
    third edition features.

    !end-bullet!

!end-bullets-1!

!begin-bullet!

R 3.4 is now the oldest version that is explicitly supported and tested,
as per the [tidyverse
policy](https://www.tidyverse.org/blog/2019/04/r-version-support/).

!end-bullet!

# googlesheets4 0.3.0

!begin-bullet!

All requests are now made with retry capability. Specifically, when a
request fails due to a `429 RESOURCE_EXHAUSTED` error, it is retried a
few times, with suitable delays. Note that if it appears that you
*personally* have exhausted your quota (more than 100 requests in 100
seconds), the initial waiting time is 100 seconds and this indicates you
need to get your own OAuth app or service account.

!end-bullet!

!begin-bullet!

When googlesheets4 and googledrive are used together in the same
session, we alert you if you're logged in to these package with
different Google identities.

!end-bullet!

!begin-bullet!

`gs4_get()` retrieves information about protected ranges.

!end-bullet!

# googlesheets4 0.2.0

!begin-bullet!

googlesheets4 can now write and modify Sheets.

!end-bullet!

!begin-bullet!

Several new articles are available at
[googlesheets4.tidyverse.org](https://googlesheets4.tidyverse.org/articles/index.html).

!end-bullet!

## Function naming scheme

!begin-bullet!

The universal `sheets_` prefix has been replaced by a scheme that
conveys more information about the scope of the function. There are
three prefixes:

!end-bullet!

!begin-bullets-2!

-   !begin-bullet!
    `gs4_`: refers variously to the googlesheets4 package, v4 of the
    Google Sheets API, or to operations on one or more (spread)Sheets
    !end-bullet!
-   !begin-bullet!
    `sheet_`: operations on one or more (work)sheets
    !end-bullet!
-   !begin-bullet!
    `range_`: operations on a range of cells
    !end-bullet!

!end-bullets-2!

!begin-bullet!

The addition of write/edit functionality resulted in many new functions
and the original naming scheme proved to be problematic. The article
[Function and class
names](https://googlesheets4.tidyverse.org/articles/articles/function-class-names.html)
contains more detail.

!end-bullet!

!begin-bullet!

Any function present in the previous CRAN release, v0.1.1, still works,
but triggers a warning with strong encouragement to switch to the
current name.

!end-bullet!

## Write Sheets

!begin-bullet!

googlesheets4 now has very broad capabilities around Sheet creation and
modification. These functions are ready for general use but are still
marked experimental, as they may see some refinement based on user
feedback.

!end-bullet!

!begin-bullets-3!

-   !begin-bullet!
    `gs4_create()` creates a new Google Sheet and, optionally, writes
    one or more data frames into it (#61).
    !end-bullet!
-   !begin-bullet!
    `sheet_write()` (also available as `write_sheet()`) writes a data
    frame into a new or existing (work)sheet, inside an existing (or
    new) (spread)Sheet.
    !end-bullet!
-   !begin-bullet!
    `sheet_append()` adds rows to an existing data table.
    !end-bullet!
-   !begin-bullet!
    `range_write()` writes to a cell range.
    !end-bullet!
-   !begin-bullet!
    `range_flood()` "floods" all cells in a range with the same content.
    `range_clear()` is a wrapper around `range_flood()` for the special
    case of clearing cell values.
    !end-bullet!
-   !begin-bullet!
    `range_delete()` deletes a range of cells.
    !end-bullet!

!end-bullets-3!

## (Work)sheet operations

!begin-bullet!

The `sheet_*()` family of functions operate on the (work)sheets inside
an existing (spread)Sheet:

!end-bullet!

!begin-bullets-4!

-   !begin-bullet!
    (`sheet_write()` and `sheet_append()` are described above.)
    !end-bullet!
-   !begin-bullet!
    `sheet_properties()` returns a tibble of metadata with one row per
    sheet.
    !end-bullet!
-   !begin-bullet!
    `sheet_names()` returns sheet names.
    !end-bullet!
-   !begin-bullet!
    `sheet_add()` adds one or more sheets.
    !end-bullet!
-   !begin-bullet!
    `sheet_copy()` copies a sheet.
    !end-bullet!
-   !begin-bullet!
    `sheet_delete()` deletes one or more sheets.
    !end-bullet!
-   !begin-bullet!
    `sheet_relocate()` moves sheets around.\
    !end-bullet!
-   !begin-bullet!
    `sheet_rename()` renames one sheet.
    !end-bullet!
-   !begin-bullet!
    `sheet_resize()` changes the number of rows or columns in a sheet.
    !end-bullet!

!end-bullets-4!

## Range operations

!begin-bullet!

`range_speedread()` reads from a Sheet using its "export=csv" URL and,
therefore, uses readr-style column type specification. It still supports
fairly general range syntax and auth. For very large Sheets, this can be
substantially faster than `read_sheet()`.

!end-bullet!

!begin-bullet!

`range_read_cells()` (formerly known as `sheets_cells()`) gains two new
arguments that make it possible to get more data on more cells. By
default, we get only the fields needed to parse cells that contain
values. But
`range_read_cells(cell_data = "full", discard_empty = FALSE)` is now
available if you want full cell data, including formatting, even for
cells that have no value (#4).

!end-bullet!

!begin-bullet!

`range_autofit()` adjusts column width or row height to fit the data.
This only affects the display of a sheet and does not change values or
dimensions.

!end-bullet!

## Printing a Sheet ID

!begin-bullet!

The print method for `sheets_id` objects now attempts to reveal the
current Sheet metadata available via `gs4_get()`, i.e. it makes an API
call (but it should never error).

!end-bullet!

## Other changes and additions

!begin-bullet!

`gs_formula()` implements a vctrs S3 class for storing Sheets formulas.

!end-bullet!

!begin-bullet!

`gs4_fodder()` is a convenience function that creates a filler data
frame you can use to make toy sheets you're using to practice on or for
a reprex.

!end-bullet!

## Renamed classes

!begin-bullet!

The S3 class `sheets_Spreadsheet` is renamed to
`googlesheets4_spreadsheet`, a consequence of rationalizing all internal
and external classes (detailed in the article [Function and class
names](https://googlesheets4.tidyverse.org/articles/articles/function-class-names.html)).
`googlesheets4_spreadsheet` is the class that holds metadata for a Sheet
and it is connected to the API's
[`Spreadsheet`](https://developers.google.com/sheets/api/reference/rest/v4/spreadsheets#resource:-spreadsheet)
schema. The return value of `gs4_get()` has this class.

!end-bullet!

## Bug fixes

!begin-bullets-5!

-   !begin-bullet!
    `read_sheet()` passes its `na` argument down to the helpers that
    parse cells, so that `na` actually has the documented effect (#73).
    !end-bullet!

!end-bullets-5!

# googlesheets4 0.1.1

!begin-bullets-6!

-   !begin-bullet!
    Patch release to modify a test fixture, to be compatible with tibble
    v3.0. Related to tibble's increased type strictness.
    !end-bullet!

!end-bullets-6!

# googlesheets4 0.1.0

!begin-bullets-7!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-7!

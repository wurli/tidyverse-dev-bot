# Version 1.9.0.9000

### BUG FIXES

!begin-bullets-1!

-   !begin-bullet!
    [#1090](https://github.com/tidyverse/lubridate/issues/1090)
    timechange has been moved from Depends to Imports.
    !end-bullet!

!end-bullets-1!

# Version 1.9.0

### NEW FEATURES

!begin-bullets-2!

-   !begin-bullet!
    `roll` argument to updating and time-zone manipulation functions is
    deprecated in favor of a new `roll_dst` parameter.
    !end-bullet!
-   !begin-bullet!
    [#1042](https://github.com/tidyverse/lubridate/issues/1042)
    `as_date` with character inputs accepts multiple formats in `format`
    argument. When `format` is supplied, the input string is parsed with
    `parse_date_time` instead of the old `strptime`.
    !end-bullet!
-   !begin-bullet!
    [#1055](https://github.com/tidyverse/lubridate/issues/1055)
    Implement `as.integer` method for Duration, Period and Interval
    classes.
    !end-bullet!
-   !begin-bullet!
    [#1061](https://github.com/tidyverse/lubridate/issues/1061) Make
    `year<-`, `month<-` etc. accessors truly generic. In order to make
    them work with arbitrary class XYZ, it's enough to define a
    `reclass_date.XYZ` method.
    !end-bullet!
-   !begin-bullet!
    [#1061](https://github.com/tidyverse/lubridate/issues/1061) Add
    support for `year<-`, `month<-` etc. accessors for `data.table`'s
    IDate and ITime objects.
    !end-bullet!
-   !begin-bullet!
    [#1017](https://github.com/tidyverse/lubridate/issues/1017)
    `week_start` argument in all lubridate functions now accepts full
    and abbreviated names of the days of the week.
    !end-bullet!
-   !begin-bullet!
    The assignment value `wday<-` can be a string either in English or
    as provided by the current locale.
    !end-bullet!
-   !begin-bullet!
    Date rounding functions accept a date-time `unit` argument for
    rounding to a vector of date-times.
    !end-bullet!
-   !begin-bullet!
    [#1005](https://github.com/tidyverse/lubridate/issues/1005)
    `as.duration` now allows for full roundtrip
    `duration -> as.character -> as.duration`
    !end-bullet!
-   !begin-bullet!
    [#911](https://github.com/tidyverse/lubridate/issues/911) C parsers
    treat multiple spaces as one (just like strptime does)
    !end-bullet!
-   !begin-bullet!
    `stamp` gained new argument `exact=FALSE` to indicate whether
    `orders` argument is an exact strptime formats string or not.
    !end-bullet!
-   !begin-bullet!
    [#1001](https://github.com/tidyverse/lubridate/issues/1001) Add
    `%within` method with signature (Interval, list), which was
    documented but not implemented.
    !end-bullet!
-   !begin-bullet!
    [#941](https://github.com/tidyverse/lubridate/issues/941)
    `format_ISO8601()` gained a new option `usetz="Z"` to format time
    zones with a "Z" and convert the time to the UTC time zone.
    !end-bullet!
-   !begin-bullet!
    [#931](https://github.com/tidyverse/lubridate/issues/931) Usage of
    `Period` objects in rounding functions is explicitly documented.
    !end-bullet!

!end-bullets-2!

### BUG FIXES

!begin-bullets-3!

-   !begin-bullet!
    [#1036](https://github.com/tidyverse/lubridate/issues/1036)
    `%within%` now correctly works with flipped intervals
    !end-bullet!
-   !begin-bullet!
    [#1085](https://github.com/tidyverse/lubridate/issues/1085)
    `as_datetime()` now preserves the time zone of the POSIXt input.
    !end-bullet!
-   !begin-bullet!
    [#1072](https://github.com/tidyverse/lubridate/issues/1072) Names
    are now handled correctly when combining multiple Period or Interval
    objects.
    !end-bullet!
-   !begin-bullet!
    [#1003](https://github.com/tidyverse/lubridate/issues/1003)
    Correctly handle r and R formats in locales which have no p format
    !end-bullet!
-   !begin-bullet!
    [#1074](https://github.com/tidyverse/lubridate/issues/1074) Fix
    concatination of named Period, Interval and Duration vectors.
    !end-bullet!
-   !begin-bullet!
    [#1044](https://github.com/tidyverse/lubridate/issues/1044) POSIXlt
    results returned by `fast_strptime()` and `parse_date_time2()` now
    have a recycled `isdst` field.
    !end-bullet!
-   !begin-bullet!
    [#1069](https://github.com/tidyverse/lubridate/issues/1069) Internal
    code handling the addition of period months and years no longer
    generates partially recycled POSIXlt objects.
    !end-bullet!
-   !begin-bullet!
    Fix rounding of POSIXlt objects
    !end-bullet!
-   !begin-bullet!
    [#1007](https://github.com/tidyverse/lubridate/issues/1007) Internal
    lubridate formats are no longer propagated to stamp formater.
    !end-bullet!
-   !begin-bullet!
    `train` argument in `parse_date_time` now takes effect. It was
    previously ignored.
    !end-bullet!
-   !begin-bullet!
    [#1004](https://github.com/tidyverse/lubridate/issues/1004) Fix
    `c.POSIXct` and `c.Date` on empty single POSIXct and Date vectors.
    !end-bullet!
-   !begin-bullet!
    [#1013](https://github.com/tidyverse/lubridate/issues/1013) Fix
    c(`POSIXct`,`POSIXlt`) heterogeneous concatenation.
    !end-bullet!
-   !begin-bullet!
    [#1002](https://github.com/tidyverse/lubridate/issues/1002) Parsing
    only with format `j` now works on numeric inputs.
    !end-bullet!
-   !begin-bullet!
    `stamp()` now correctly errors when no formats could be guessed.
    !end-bullet!
-   !begin-bullet!
    Updating a date with timezone (e.g. `tzs = "UTC"`) now returns a
    POSIXct.
    !end-bullet!

!end-bullets-3!

### INTERNALS

!begin-bullets-4!

-   !begin-bullet!
    `lubridate` is now relying on `timechange` package for update and
    time-zone computation. Google's CCTZ code is no longer part of the
    package.
    !end-bullet!
-   !begin-bullet!
    `lubridate`'s updating logic is now built on top of `timechange`
    package.
    !end-bullet!
-   !begin-bullet!
    Change implementation of `c.Period`, `c.Duration` and `c.Interval`
    from S4 to S3.
    !end-bullet!

!end-bullets-4!

# Version 1.8.0

### NEW FEATURES

!begin-bullets-5!

-   !begin-bullet!
    [#960](https://github.com/tidyverse/lubridate/issues/960)
    `c.POSIXct` and `c.Date` can deal with heterogeneous object types
    (e.g `c(date, datetime)` works as expected)
    !end-bullet!

!end-bullets-5!

### BUG FIXES

!begin-bullets-6!

-   !begin-bullet!
    [#994](https://github.com/tidyverse/lubridate/issues/994)
    Subtracting two duration or two period objects no longer results in
    an ambiguous dispatch note.

    !end-bullet!
-   !begin-bullet!
    `c.Date` and `c.POSIXct` correctly deal with empty vectors.

    !end-bullet!
-   !begin-bullet!
    `as_datetime(date, tz=XYZ)` returns the date-time object with HMS
    set to 00:00:00 in the corresponding `tz`

    !end-bullet!

!end-bullets-6!

### CHANGES

!begin-bullets-7!

-   !begin-bullet!
    [#966](https://github.com/tidyverse/lubridate/pull/966) Lubridate is
    now built with cpp11 (contribution of @DavisVaughan)
    !end-bullet!

!end-bullets-7!

# Version 1.7.10

### NEW FEATURES

!begin-bullets-8!

-   !begin-bullet!
    [#955](https://github.com/tidyverse/lubridate/pull/955) Add `type`
    argument to `quarter()` for more control over the returned class
    !end-bullet!
-   !begin-bullet!
    `fast_strptime()` and `parse_date_time2()` now accept multiple
    formats and apply them in turn
    !end-bullet!

!end-bullets-8!

### BUG FIXES

!begin-bullets-9!

-   !begin-bullet!
    [#926](https://github.com/tidyverse/lubridate/issues/926) Fix
    incorrect division of intervals by months involving leap years
    !end-bullet!
-   !begin-bullet!
    Fix incorrect skipping of digits during parsing of the `%z` format
    !end-bullet!

!end-bullets-9!

# Version 1.7.9.2

### NEW FEATURES

!begin-bullets-10!

-   !begin-bullet!
    [#914](https://github.com/tidyverse/lubridate/issues/914) New
    `rollforward()` function
    !end-bullet!
-   !begin-bullet!
    [#928](https://github.com/tidyverse/lubridate/issues/928) On startup
    lubridate now resets TZDIR to a proper directory when it is set to
    non-dir values like "internal" or "macOS" (a change introduced in
    R4.0.2)
    !end-bullet!
-   !begin-bullet!
    [#630](https://github.com/tidyverse/lubridate/issues/630) New
    parsing functions `ym()` and `my()`
    !end-bullet!

!end-bullets-10!

### BUG FIXES

!begin-bullets-11!

-   !begin-bullet!
    [#930](https://github.com/tidyverse/lubridate/issues/930)
    `as.period()` on intervals now returns valid Periods with double
    fields (not integers)
    !end-bullet!

!end-bullets-11!

# Version 1.7.9

### NEW FEATURES

!begin-bullets-12!

-   !begin-bullet!
    [#871](https://github.com/tidyverse/lubridate/issues/893) Add
    `vctrs` support
    !end-bullet!

!end-bullets-12!

### BUG FIXES

!begin-bullets-13!

-   !begin-bullet!
    [#890](https://github.com/tidyverse/lubridate/issues/890) Correctly
    compute year in `quarter(..., with_year = TRUE)`
    !end-bullet!
-   !begin-bullet!
    [#893](https://github.com/tidyverse/lubridate/issues/893) Fix
    incorrect parsing of abbreviated months in locales with trailing dot
    (regression in v1.7.8)
    !end-bullet!
-   !begin-bullet!
    [#886](https://github.com/tidyverse/lubridate/issues/886) Fix
    `with_tz()` for POSIXlt objects
    !end-bullet!
-   !begin-bullet!
    [#887](https://github.com/tidyverse/lubridate/issues/887) Error on
    invalid numeric input to `month()`
    !end-bullet!
-   !begin-bullet!
    [#889](https://github.com/tidyverse/lubridate/issues/889) Export new
    dmonth function
    !end-bullet!

!end-bullets-13!

# Version 1.7.8

### NEW FEATURES

!begin-bullets-14!

-   !begin-bullet!
    (breaking) Year and month durations now assume 365.25 days in a year
    consistently in conversion and constructors. Particularly
    `dyears(1) == years(1)` is now `TRUE`.
    !end-bullet!
-   !begin-bullet!
    Format and print methods for 0-length objects are more consistent.
    !end-bullet!
-   !begin-bullet!
    New duration constructor `dmonths()` to complement other duration
    constructors.
    !end-bullet!
-   !begin-bullet!
    !end-bullet!
-   !begin-bullet!
    `duration()` constructor now accepts `months` and `years` arguments.
    !end-bullet!
-   !begin-bullet!
    [#629](https://github.com/tidyverse/lubridate/issues/629) Added
    `format_ISO8601()` methods.
    !end-bullet!
-   !begin-bullet!
    [#672](https://github.com/tidyverse/lubridate/issues/672) Eliminate
    all partial argument matches
    !end-bullet!
-   !begin-bullet!
    [#674](https://github.com/tidyverse/lubridate/issues/674)
    `as_date()` now ignores the `tz` argument
    !end-bullet!
-   !begin-bullet!
    [#675](https://github.com/tidyverse/lubridate/issues/675)
    `force_tz()`, `with_tz()`, `tz<-` convert dates to date-times
    !end-bullet!
-   !begin-bullet!
    [#681](https://github.com/tidyverse/lubridate/issues/681) New
    constants `NA_Date_` and `NA_POSIXct_` which parallel built-in
    primitive constants.
    !end-bullet!
-   !begin-bullet!
    [#681](https://github.com/tidyverse/lubridate/issues/681) New
    constructors `Date()` and `POSIXct()` which parallel built-in
    primitive constructors.
    !end-bullet!
-   !begin-bullet!
    [#695](https://github.com/tidyverse/lubridate/issues/695) Durations
    can now be compared with numeric vectors.
    !end-bullet!
-   !begin-bullet!
    [#707](https://github.com/tidyverse/lubridate/issues/707)
    Constructors return 0-length inputs when called with no arguments
    !end-bullet!
-   !begin-bullet!
    [#713](https://github.com/tidyverse/lubridate/issues/713) (breaking)
    `as_datetime()` always returns a `POSIXct()`
    !end-bullet!
-   !begin-bullet!
    [#717](https://github.com/tidyverse/lubridate/issues/717) Common
    generics are now defined in `generics` dependency package.
    !end-bullet!
-   !begin-bullet!
    [#719](https://github.com/tidyverse/lubridate/issues/719) Negative
    Durations are now displayed with leading `-`.
    !end-bullet!
-   !begin-bullet!
    [#829](https://github.com/tidyverse/lubridate/issues/829) `%within%`
    throws more meaningful messages when applied on unsupported classes
    !end-bullet!
-   !begin-bullet!
    [#831](https://github.com/tidyverse/lubridate/issues/831) Changing
    hour, minute or second of Date object now yields POSIXct.
    !end-bullet!
-   !begin-bullet!
    [#869](https://github.com/tidyverse/lubridate/issues/869) Propagate
    NAs to all internal components of a Period object
    !end-bullet!

!end-bullets-14!

### BUG FIXES

!begin-bullets-15!

-   !begin-bullet!
    [#682](https://github.com/tidyverse/lubridate/issues/682) Fix
    quarter extraction with small `fiscal_start`s.
    !end-bullet!
-   !begin-bullet!
    [#703](https://github.com/tidyverse/lubridate/issues/703)
    `leap_year()` works with objects supported by `year()`.
    !end-bullet!
-   !begin-bullet!
    [#778](https://github.com/tidyverse/lubridate/issues/778)
    `duration()/period()/make_difftime()` work with repeated units
    !end-bullet!
-   !begin-bullet!
    `c.Period` concatenation doesn't fail with empty components.
    !end-bullet!
-   !begin-bullet!
    Honor `exact = TRUE` argument in `parse_date_time2`, which was so
    far ignored.
    !end-bullet!

!end-bullets-15!

# Version 1.7.4

### NEW FEATURES

!begin-bullets-16!

-   !begin-bullet!
    [#658](https://github.com/tidyverse/lubridate/issues/658) `%within%`
    now accepts a list of intervals, in which case an instant is checked
    if it occurs within any of the supplied intervals.
    !end-bullet!

!end-bullets-16!

### CHANGES

!begin-bullets-17!

-   !begin-bullet!
    [#661](https://github.com/tidyverse/lubridate/issues/661) Throw
    error on invalid multi-unit rounding.
    !end-bullet!
-   !begin-bullet!
    [#633](https://github.com/tidyverse/lubridate/issues/633) `%%` on
    intervals relies on `%m+` arithmetic and doesn't produce NAs when
    intermediate computations result in non-existent dates.
    !end-bullet!
-   !begin-bullet!
    `tz()` always returns "UTC" when `tzone` attribute cannot be
    inferred.
    !end-bullet!

!end-bullets-17!

### BUG FIXES

!begin-bullets-18!

-   !begin-bullet!
    [#664](https://github.com/tidyverse/lubridate/issues/664) Fix lookup
    of period functions in `as.period`
    !end-bullet!
-   !begin-bullet!
    [#649](https://github.com/tidyverse/lubridate/issues/664) Fix system
    timezone memoization
    !end-bullet!

!end-bullets-18!

# Version 1.7.3

### BUG FIXES

!begin-bullets-19!

-   !begin-bullet!
    [#643](https://github.com/tidyverse/lubridate/issues/643),
    [#640](https://github.com/tidyverse/lubridate/issues/640),
    [#645](https://github.com/tidyverse/lubridate/issues/645) Fix faulty
    caching of system timezone.
    !end-bullet!

!end-bullets-19!

# Version 1.7.2

### NEW FEATURES

!begin-bullets-20!

-   !begin-bullet!
    Durations, Periods and difftimes are now comparable with each other.
    !end-bullet!
-   !begin-bullet!
    `interval` constructor accepts start and end character vectors in
    ISO 8601 format
    !end-bullet!
-   !begin-bullet!
    [#362](https://github.com/tidyverse/lubridate/issues/362) Add
    support for ISO 8601 formats in interval constructor
    !end-bullet!
-   !begin-bullet!
    [#622](https://github.com/tidyverse/lubridate/issues/622) Add
    support for ISO 8601 formats in periods and durations constructor
    !end-bullet!

!end-bullets-20!

### CHANGES

!begin-bullets-21!

-   !begin-bullet!
    Correct license to the originally intended GPL (\>= 2)
    !end-bullet!

!end-bullets-21!

### BUG FIXES

!begin-bullets-22!

-   !begin-bullet!
    [#605](https://github.com/tidyverse/lubridate/issues/605) Fix wrong
    ceiling of days during DST transition.
    !end-bullet!
-   !begin-bullet!
    [#607](https://github.com/tidyverse/lubridate/issues/607) Re-instate
    `format` argument to `as_date` and `as_datetime` (regression in
    v1.7.1)
    !end-bullet!
-   !begin-bullet!
    Fix intersection of intervals with missing values.
    !end-bullet!
-   !begin-bullet!
    Fix UBSAN errors in update.cpp
    !end-bullet!

!end-bullets-22!

# Version 1.7.1

### BUG FIXES

!begin-bullets-23!

-   !begin-bullet!
    [#575](https://github.com/tidyverse/lubridate/issues/598),
    [#600](https://github.com/tidyverse/lubridate/issues/600),
    [#602](https://github.com/tidyverse/lubridate/issues/602) Fix
    zoneinfo lookup on windows and solaris.
    !end-bullet!
-   !begin-bullet!
    [#598](https://github.com/tidyverse/lubridate/issues/598) Fix broken
    parsing of `ymd_hms` strings by `as_date`.
    !end-bullet!
-   !begin-bullet!
    [#597](https://github.com/tidyverse/lubridate/issues/597) Fix broken
    parsing of `ymd` strings by `as_datetime`.
    !end-bullet!

!end-bullets-23!

# Version 1.7.0

### NEW FEATURES

!begin-bullets-24!

-   !begin-bullet!
    Reduced memory footprint on `trunc_multi_unit` so that it overwrites
    the vector argument `x` versus making a new vector `y`.
    !end-bullet!
-   !begin-bullet!
    [#438](https://github.com/tidyverse/lubridate/issues/438) New
    function `force_tzs` for "enforcement" of heterogeneous time zones.
    !end-bullet!
-   !begin-bullet!
    [#438](https://github.com/tidyverse/lubridate/issues/438) New
    function `local_time` for the retrieval of local day time in
    different time zones.
    !end-bullet!
-   !begin-bullet!
    [#560](https://github.com/tidyverse/lubridate/issues/560) New
    argument `cutoff_2000` for parsing functions to indicate 20th
    century cutoff for `y` format.
    !end-bullet!
-   !begin-bullet!
    [#257](https://github.com/tidyverse/lubridate/issues/257) New
    `week_start` parameter in `wday` and `wday<-` to set week start.
    !end-bullet!
-   !begin-bullet!
    [#401](https://github.com/tidyverse/lubridate/issues/401) New
    parameter `locale` in `wday`. Labels of the returned factors (when
    `label=TRUE`) now respect current locale.
    !end-bullet!
-   !begin-bullet!
    [#485](https://github.com/tidyverse/lubridate/pull/485) `quarter`
    gained a new argument `fiscal_start` to address the issue of
    different fiscal conventions.
    !end-bullet!
-   !begin-bullet!
    [#492](https://github.com/tidyverse/lubridate/issues/492) New
    functions `epiweek` and `epiyear`.
    !end-bullet!
-   !begin-bullet!
    [#508](https://github.com/tidyverse/lubridate/pull/508) New
    parameter `locale` in `month`. Labels of the returned factors (when
    `label=TRUE`) now respect current locale.
    !end-bullet!
-   !begin-bullet!
    [#509](https://github.com/tidyverse/lubridate/issues/509) New
    parameter `week_start` to `floor_date`, `ceiling_date` and
    `round_date`.
    !end-bullet!
-   !begin-bullet!
    [#519](https://github.com/tidyverse/lubridate/issues/519) Support
    fractional units in duration and period string constructors.
    !end-bullet!
-   !begin-bullet!
    [#502](https://github.com/tidyverse/lubridate/issues/502) Support
    rounding to fractions of a seconds.
    !end-bullet!
-   !begin-bullet!
    [#529](https://github.com/tidyverse/lubridate/issues/529) Internal
    parser now ignores the case of alpha months (B format)
    !end-bullet!
-   !begin-bullet!
    [#535](https://github.com/tidyverse/lubridate/issues/535) Rounding
    to `season` is now supported.
    !end-bullet!
-   !begin-bullet!
    [#536](https://github.com/tidyverse/lubridate/issues/536) `as_date`
    and `as_datetime` now understand character vectors.
    !end-bullet!
-   !begin-bullet!
    New parsing parameters to `parse_date_time` - `train=TRUE` and
    `drop=FALSE` which allow more refined control of the format
    guessing. Formats are no longer dropped in the process by default,
    process which resulted in surprising behavior on several occasions
    ([#516](https://github.com/tidyverse/lubridate/issues/516),[#308](https://github.com/tidyverse/lubridate/issues/308),[#307](https://github.com/tidyverse/lubridate/issues/307)).
    !end-bullet!

!end-bullets-24!

### CHANGES

!begin-bullets-25!

-   !begin-bullet!
    [#401](https://github.com/tidyverse/lubridate/issues/401)
    **\[Breaking Change\]** Labels returned by `wday` and `month` are
    now in current locale. The abbreviated labels in English locales
    have been changed to standard abbreviations (Tues -\> Tue, Thurs -\>
    Thu etc.).
    !end-bullet!
-   !begin-bullet!
    [#469](https://github.com/tidyverse/lubridate/issues/469) Throw
    warning in `with_tz` on invalid timezone.
    !end-bullet!
-   !begin-bullet!
    [#572](https://github.com/tidyverse/lubridate/issues/572) `B` and
    `b` formats no longer match numeric months. This corresponds to the
    original intent, and was always documented as such.
    !end-bullet!

!end-bullets-25!

### BUG FIXES

!begin-bullets-26!

-   !begin-bullet!
    [#314](https://github.com/tidyverse/lubridate/issues/314),
    [#407](https://github.com/tidyverse/lubridate/issues/407),
    [#499](https://github.com/tidyverse/lubridate/issues/499) Make
    `days`, `dhours`, `round_date` work when the methods package is not
    loaded.
    !end-bullet!
-   !begin-bullet!
    [#543](https://github.com/tidyverse/lubridate/issues/543) Make
    `wday` work on character inputs as it is the case with all other day
    accessors.
    !end-bullet!
-   !begin-bullet!
    [#566](https://github.com/tidyverse/lubridate/issues/566) Comparing
    durations and periods no-longer infloops.
    !end-bullet!
-   !begin-bullet!
    [#556](https://github.com/tidyverse/lubridate/issues/556) Fix
    incorrect scoring of `y` format when it's the last in format order
    (as in `mdy`).
    !end-bullet!
-   !begin-bullet!
    [#584](https://github.com/tidyverse/lubridate/issues/584) Fix
    interval by period division.
    !end-bullet!
-   !begin-bullet!
    [#559](https://github.com/tidyverse/lubridate/issues/559) Parsing of
    alpha-months in English locales now drops correctly to low level C
    parsing. Thus, parsing with multiple orders containing `m` and `b`
    formats now works correctly.
    !end-bullet!
-   !begin-bullet!
    [#570](https://github.com/tidyverse/lubridate/issues/570),
    [#574](https://github.com/tidyverse/lubridate/issues/574) Fix broken
    `date()` when called with missing argument.
    !end-bullet!
-   !begin-bullet!
    [#567](https://github.com/tidyverse/lubridate/issues/567) Fix year
    update and rounding for leap years.
    !end-bullet!
-   !begin-bullet!
    [#545](https://github.com/tidyverse/lubridate/pull/545) Fix wrong
    locale selection in stamp.
    !end-bullet!
-   !begin-bullet!
    [#466](https://github.com/tidyverse/lubridate/pull/466) Fix wrong
    formats within ymd_h family of functions.
    !end-bullet!
-   !begin-bullet!
    [#472](https://github.com/tidyverse/lubridate/pull/472) Printing
    method for duration doesn't throw format error on fractional
    seconds.
    !end-bullet!
-   !begin-bullet!
    [#475](https://github.com/tidyverse/lubridate/pull/475)
    character\<\> comparisons is no longer slow.
    !end-bullet!
-   !begin-bullet!
    [#483](https://github.com/tidyverse/lubridate/pull/483) Fix
    add_duration_to_date error when duration first element is NA.
    !end-bullet!
-   !begin-bullet!
    [#486](https://github.com/tidyverse/lubridate/issues/486)
    ceiling_date handles `NA` properly.
    !end-bullet!
-   !begin-bullet!
    [#491](https://github.com/tidyverse/lubridate/issues/491)
    `make_datetime` respects `tz` argument and is much faster now.
    !end-bullet!
-   !begin-bullet!
    [#507](https://github.com/tidyverse/lubridate/issues/507) Period and
    duration parsers now understand 0 units.
    !end-bullet!
-   !begin-bullet!
    [#524](https://github.com/tidyverse/lubridate/pull/524) Correctly
    compute length of period in months (issue #490)
    !end-bullet!
-   !begin-bullet!
    [#525](https://github.com/tidyverse/lubridate/pull/525) Fix to
    prevent `day<-`, `minute<-`, etc. from producing an error when
    length(x) is 0 (issue #517)
    !end-bullet!
-   !begin-bullet!
    [#530](https://github.com/tidyverse/lubridate/issues/530)
    `parse_date_time` now throw warnings only for actual parsing errors
    (input with all NAs are silent)
    !end-bullet!
-   !begin-bullet!
    [#534](https://github.com/tidyverse/lubridate/issues/534) Fix
    arithmetics with large numbers
    !end-bullet!
-   !begin-bullet!
    [#554](https://github.com/tidyverse/lubridate/pull/554) Fix tests
    when running in non-English locales
    !end-bullet!

!end-bullets-26!

# Version 1.6.0

### NEW FEATURES

!begin-bullets-27!

-   !begin-bullet!
    [#464](https://github.com/tidyverse/lubridate/issues/464) New
    function `semester` to extract semesters form date-time objects.
    !end-bullet!
-   !begin-bullet!
    [#459](https://github.com/tidyverse/lubridate/issues/459) Flexible
    C-level parsing for periods and durations has been implemented;
    `period` and `duration` constructors now accept string as first
    argument. Same parsing rules apply to the 'unit' parameter in
    rounding functions.
    !end-bullet!
-   !begin-bullet!
    [#459](https://github.com/tidyverse/lubridate/issues/459) Comparison
    between character vectors and periods/durations is now possible.
    !end-bullet!
-   !begin-bullet!
    [#287](https://github.com/tidyverse/lubridate/issues/287) C-level
    and derivative parsers now handle English months (%b and %B formats)
    irrespective of the current locale.
    !end-bullet!
-   !begin-bullet!
    [#327](https://github.com/tidyverse/lubridate/issues/327) C-level
    and derivative parsers now handles English AM/PM indicator
    irrespective of the current locale.
    !end-bullet!
-   !begin-bullet!
    [#417](https://github.com/tidyverse/lubridate/issues/417) `hms`,
    `hm`, `ms` gained new argument `roll=TRUE` which rolls minutes and
    seconds bigger than 59 towards higher units.
    !end-bullet!
-   !begin-bullet!
    [#445](https://github.com/tidyverse/lubridate/issues/445) Division
    of intervals by periods is now accurate.
    !end-bullet!
-   !begin-bullet!
    [#442](https://github.com/tidyverse/lubridate/issues/442)
    `round_date`, `floor_date` and `ceiling_date` now support rounding
    to multiple of units.
    !end-bullet!
-   !begin-bullet!
    [#422](https://github.com/tidyverse/lubridate/issues/422) New
    parsing function `yq` for parsing most common version of quarter
    strings.
    !end-bullet!
-   !begin-bullet!
    [#422](https://github.com/tidyverse/lubridate/issues/422) New format
    `q` for parsing quarters in all lubridate parsing functions.
    !end-bullet!
-   !begin-bullet!
    [#441](https://github.com/tidyverse/lubridate/issues/441) Comparison
    between POSIXt and Date objects is now possible.
    !end-bullet!
-   !begin-bullet!
    [#437](https://github.com/tidyverse/lubridate/issues/437) New
    function `as_datetime` to coerce to POSIXct object. A counterpart of
    `as_date`.
    !end-bullet!
-   !begin-bullet!
    [#412](https://github.com/tidyverse/lubridate/issues/412) New
    function `make_date` to produce Date objects. A counterpart of
    `make_datetime`.
    !end-bullet!
-   !begin-bullet!
    [#443](https://github.com/tidyverse/lubridate/issues/443) Behavior
    of `ceiling_date` for `Date` objects was changed to what most of the
    users expect. Rounding up by months now produces first day of the
    next months even for first day of the month.
    !end-bullet!
-   !begin-bullet!
    [#268](https://github.com/tidyverse/lubridate/issues/268)
    `round_date`, `ceiling_date`, and `floor_date` now accept "quarter",
    "bimonth", and "halfyear" as `unit` options.
    !end-bullet!
-   !begin-bullet!
    [#418](https://github.com/tidyverse/lubridate/issues/418) C level
    parsing functions understand 24:00:00 in datetime strings.
    !end-bullet!

!end-bullets-27!

### CHANGES

!begin-bullets-28!

-   !begin-bullet!
    Low letter specs for HMS (hms,hm,ms) in `parse_date_time` and
    related functions are now deprecated.
    !end-bullet!
-   !begin-bullet!
    [#445](https://github.com/tidyverse/lubridate/issues/445) No more
    warning on occasional imprecise period length conversions. Imprecise
    arithmetics with periods is extensively documented.
    !end-bullet!
-   !begin-bullet!
    `pretty.*` family of functions were renamed and are no longer
    exported. If you need to use them, use `lubridate:::pretty_*`
    versions.
    !end-bullet!
-   !begin-bullet!
    `change_on_boundary` argument in `ceiling_date` does not allow for
    global option anymore.
    !end-bullet!
-   !begin-bullet!
    `as.duration`, `as.numeric` don't show "only estimate" messages on
    conversion from periods. The occasional approximate conversion is
    documented and deemed common knowledge.
    !end-bullet!
-   !begin-bullet!
    `as.numeric` with `unit="month"` now works on duration objects.
    !end-bullet!
-   !begin-bullet!
    [#403](https://github.com/tidyverse/lubridate/issues/403) Update on
    `Date` objects now return `POSIXct` instead of `POSIXlt`.
    !end-bullet!
-   !begin-bullet!
    [#411](https://github.com/tidyverse/lubridate/issues/411) format
    `mdy` or `myd` beginning with `"January"` or `"Jan"` now parsing
    correctly
    !end-bullet!
-   !begin-bullet!
    `here` and `olson_time_zones` were deprecated in favor of `new` and
    base `OlsonNames` respectively.
    !end-bullet!
-   !begin-bullet!
    Internally, S4 Compare and Ops generics were cleaned and simplified.
    !end-bullet!
-   !begin-bullet!
    [#456](https://github.com/tidyverse/lubridate/issues/456) Evaluation
    output in documentation examples was removed.
    !end-bullet!

!end-bullets-28!

### BUG FIXES

!begin-bullets-29!

-   !begin-bullet!
    [#479](https://github.com/tidyverse/lubridate/issues/479) Fix the
    inconsistent behavior in `ceiling_date` when `unit = "week"`
    !end-bullet!
-   !begin-bullet!
    [#463](https://github.com/tidyverse/lubridate/issues/463) Fix NA
    subscripting error in %m+% when rollback is involved.
    !end-bullet!
-   !begin-bullet!
    [#462](https://github.com/tidyverse/lubridate/issues/462)
    Non-numeric or non-character arguments are disallowed as arguments
    to `period` and `duration` constructors.
    !end-bullet!
-   !begin-bullet!
    [#458](https://github.com/tidyverse/lubridate/issues/458) When year
    is missing in parsing, return consistently year 0.
    !end-bullet!
-   !begin-bullet!
    [#448](https://github.com/tidyverse/lubridate/issues/448) Correctly
    handle missing months and days in C parser.
    !end-bullet!
-   !begin-bullet!
    [#450](https://github.com/tidyverse/lubridate/issues/450) Fix
    incorrect handling of DST gaps in `date_decimal` and `decimal_date`.
    !end-bullet!
-   !begin-bullet!
    [#420](https://github.com/tidyverse/lubridate/issues/420)
    `as.numeric` correctly converts periods to (aproximate) numeric time
    lengths.
    !end-bullet!

!end-bullets-29!

# Version 1.5.6

### NEW FEATURES

!begin-bullets-30!

-   !begin-bullet!
    [#390](https://github.com/tidyverse/lubridate/issues/390)
    `ceiling_date` gains new argument `change_on_boundary` to allow
    ceiling on boundary of date-time objects.
    !end-bullet!
-   !begin-bullet!
    C parser can now produce a list of date-time components suitable for
    POSIXlt constructors.
    !end-bullet!
-   !begin-bullet!
    `parse_date_time2` and `fast_strptime` gain new `lt` argument to
    control type of output.
    !end-bullet!
-   !begin-bullet!
    [#373](https://github.com/tidyverse/lubridate/issues/373) New `date`
    and `date<-` additions to the `year`, `month` etc family of
    accessors.
    !end-bullet!
-   !begin-bullet!
    [#365](https://github.com/tidyverse/lubridate/issues/365) New very
    fast datetime constructor `make_datetime` (dropin replacement of
    `ISOdatetime`).
    !end-bullet!
-   !begin-bullet!
    [#344](https://github.com/tidyverse/lubridate/issues/344) `force_tz`
    and `with_tz` can handle data.frames component-wise.
    !end-bullet!
-   !begin-bullet!
    [#355](https://github.com/tidyverse/lubridate/issues/355) New
    `as_date` replacement of `as.Date` with more intuitive behavior with
    non-UTC timezones.
    !end-bullet!
-   !begin-bullet!
    [#333](https://github.com/tidyverse/lubridate/issues/333) `hms`
    parsers now handle negative components.
    !end-bullet!

!end-bullets-30!

### CHANGES

!begin-bullets-31!

-   !begin-bullet!
    [#391](https://github.com/tidyverse/lubridate/issues/391) `ymd`
    family of functions return `Date` object when `tz` argument is NULL
    (new default) and POSIXct otherwise.
    !end-bullet!
-   !begin-bullet!
    [#364](https://github.com/tidyverse/lubridate/issues/364) Remove
    epoch functions.
    !end-bullet!
-   !begin-bullet!
    For consistency with `base:strptime` `fast_strptime` now returns
    `POSIXlt` object. That is, its `lt` argument defaults to `TRUE`.
    !end-bullet!

!end-bullets-31!

### BUG FIXES

!begin-bullets-32!

-   !begin-bullet!
    `interval` constructor treats timezones correctly and works with UTC
    whenever meaningful.
    !end-bullet!
-   !begin-bullet!
    [#371](https://github.com/tidyverse/lubridate/issues/371)
    `as.period` correctly computes months with intervals spanning
    multiple years.
    !end-bullet!
-   !begin-bullet!
    [#388](https://github.com/tidyverse/lubridate/issues/388)
    `time_length` and `add_with_rollback` now work correctly with
    missing intervals.
    !end-bullet!
-   !begin-bullet!
    [#394](https://github.com/tidyverse/lubridate/issues/394)
    `fast_strptime` and `parse_date_time2` correctly treat non-UTC time
    zones.
    !end-bullet!
-   !begin-bullet!
    [#399](https://github.com/tidyverse/lubridate/issues/399)
    `floor_date` and `round_date` are not preserving tz component for
    larger than day units
    !end-bullet!

!end-bullets-32!

# Version 1.5.0

### NEW FEATURES

!begin-bullets-33!

-   !begin-bullet!
    New `time_length` method.
    !end-bullet!
-   !begin-bullet!
    Added `isoyear` function to line up with `isoweek`.
    !end-bullet!
-   !begin-bullet!
    [#326](https://github.com/tidyverse/lubridate/issues/326) Added
    `exact = TRUE` option to `parse_date_time` for faster and much more
    flexible specification of formats.
    !end-bullet!
-   !begin-bullet!
    New `simple` argument to `fit_to_timeline` and `update` methods
    mostly intended for internal use.
    !end-bullet!
-   !begin-bullet!
    [#315](https://github.com/tidyverse/lubridate/issues/315) Implement
    `unique` method for `interval` class.
    !end-bullet!
-   !begin-bullet!
    [#295](https://github.com/tidyverse/lubridate/issues/295) New args
    `preserve_hms` and `roll_to_first` in `rollback` function.
    !end-bullet!
-   !begin-bullet!
    [#303](https://github.com/tidyverse/lubridate/issues/303) New
    `quarter` option in `floor_date` and friends.
    !end-bullet!
-   !begin-bullet!
    [#348](https://github.com/tidyverse/lubridate/issues/348) New
    `as.list.Interval` S3 method.
    !end-bullet!
-   !begin-bullet!
    [#278](https://github.com/tidyverse/lubridate/issues/278) Added
    settors and accessors for `qday` (quarter day).
    !end-bullet!

!end-bullets-33!

### CHANGES

!begin-bullets-34!

-   !begin-bullet!
    New maintainer Vitalie Spinu (@vspinu)
    !end-bullet!
-   !begin-bullet!
    Time span constructors were re-factored; `new_interval`,
    `new_period`, `new_duration`, `new_difftime` were deprecated in
    favour of the more powerful `interval`, `period`, `duration` and
    `make_difftime` functions.
    !end-bullet!
-   !begin-bullet!
    `eseconds`, `eminutes` etc. were deprecated in favour of `dsecons`,
    `dminutes` etc.
    !end-bullet!
-   !begin-bullet!
    Many documentation improvements.
    !end-bullet!
-   !begin-bullet!
    New testthat conventions are adopted. Tests are now in
    `test/testthat`.
    !end-bullet!
-   !begin-bullet!
    Internally `isodate` was replaced with a much faster
    `parse_date_time2(paste(...))` alternative
    !end-bullet!
-   !begin-bullet!
    [#325](https://github.com/tidyverse/lubridate/issues/325)
    `Lubridate`'s `trunc`, `ceiling` and `floor` functions have been
    optimised and now are relying on R's `trunc.POSIXct` whenever
    possible.
    !end-bullet!
-   !begin-bullet!
    [#285](https://github.com/tidyverse/lubridate/issues/285) Algebraic
    computations with negative periods are behaving asymmetrically with
    respect to their positive counterparts.
    !end-bullet!
-   !begin-bullet!
    Made necessary changes to accommodate new zoo-based `fst` objects.
    !end-bullet!

!end-bullets-34!

### BUG FIXES

!begin-bullets-35!

-   !begin-bullet!
    [#360](https://github.com/tidyverse/lubridate/issues/360) Fix c
    parser for Z (zulu) indicator.
    !end-bullet!
-   !begin-bullet!
    [#322](https://github.com/tidyverse/lubridate/issues/322) Explicitly
    encode formatted string with `enc2utf8`.
    !end-bullet!
-   !begin-bullet!
    [#302](https://github.com/tidyverse/lubridate/issues/302) Allow
    parsing long numbers such as 20140911000000 as date+time.
    !end-bullet!
-   !begin-bullet!
    [#349](https://github.com/tidyverse/lubridate/issues/349) Fix broken
    interval -\> period conversion.
    !end-bullet!
-   !begin-bullet!
    [#336](https://github.com/tidyverse/lubridate/issues/336) Fix broken
    interval-\> period conversion with negative diffs.
    !end-bullet!
-   !begin-bullet!
    [#227](https://github.com/tidyverse/lubridate/issues/227) Treat
    "days" and "years" units specially for pretty.point.
    !end-bullet!
-   !begin-bullet!
    [#286](https://github.com/tidyverse/lubridate/issues/286) %m+-%
    correctly handles dHMS period components.
    !end-bullet!
-   !begin-bullet!
    [#323](https://github.com/tidyverse/lubridate/issues/323) Implement
    coercion methods for Duration class.
    !end-bullet!
-   !begin-bullet!
    [#226](https://github.com/tidyverse/lubridate/issues/226) Propagate
    NAs in `int_standardize`
    !end-bullet!
-   !begin-bullet!
    [#235](https://github.com/tidyverse/lubridate/issues/235) Fix
    integer division with months and years.
    !end-bullet!
-   !begin-bullet!
    [#240](https://github.com/tidyverse/lubridate/issues/240) Make
    `ceiling_date` skip day light gap.
    !end-bullet!
-   !begin-bullet!
    [#254](https://github.com/tidyverse/lubridate/issues/254) Don't
    preprocess a/A formats if expressly specified by the user.
    !end-bullet!
-   !begin-bullet!
    [#289](https://github.com/tidyverse/lubridate/issues/289) Check for
    valid day-months combinations in C parser.
    !end-bullet!
-   !begin-bullet!
    [#306](https://github.com/tidyverse/lubridate/issues/306) When
    needed double guess with `preproc_wday=T`.
    !end-bullet!
-   !begin-bullet!
    [#308](https://github.com/tidyverse/lubridate/issues/308) Document
    sparce format guessing in `parse_date_time`.
    !end-bullet!
-   !begin-bullet!
    [#313](https://github.com/tidyverse/lubridate/issues/313) Fixed and
    optimized `fit_to_timeline` function.
    !end-bullet!
-   !begin-bullet!
    [#311](https://github.com/tidyverse/lubridate/issues/311) Always use
    UTC in `isoweek` computation
    !end-bullet!
-   !begin-bullet!
    [#294](https://github.com/tidyverse/lubridate/issues/294) Don't use
    years in `seconds_to_period`.
    !end-bullet!
-   !begin-bullet!
    Values on `$<-` assignment for periods are now properly recycled.
    !end-bullet!
-   !begin-bullet!
    Correctly handle NA subscripting in `round_date`.
    !end-bullet!

!end-bullets-35!

# Version 1.4.0

### CHANGES

!begin-bullets-36!

-   !begin-bullet!
    [#219](https://github.com/tidyverse/lubridate/issues/219) In
    `interval` use UTC when tzone is missing.
    !end-bullet!
-   !begin-bullet!
    [#255](https://github.com/tidyverse/lubridate/issues/255) Parse yy
    \> 68 as 19yy to comply with `strptime`.
    !end-bullet!

!end-bullets-36!

### BUG FIXES

!begin-bullets-37!

-   !begin-bullet!
    [#266](https://github.com/tidyverse/lubridate/issues/266) Include
    `time-zones.R` in `coercion.R`.
    !end-bullet!
-   !begin-bullet!
    [#251](https://github.com/tidyverse/lubridate/issues/251) Correct
    computation of weeks.
    !end-bullet!
-   !begin-bullet!
    [#262](https://github.com/tidyverse/lubridate/issues/262) Document
    that month boundary is the first second of the month.
    !end-bullet!
-   !begin-bullet!
    [#270](https://github.com/tidyverse/lubridate/issues/270) Add check
    for empty unit names in `standardise_lt_names`.
    !end-bullet!
-   !begin-bullet!
    [#276](https://github.com/tidyverse/lubridate/issues/276) Perform
    conversion in `as.period.period` if `unit != NULL`.
    !end-bullet!
-   !begin-bullet!
    [#284](https://github.com/tidyverse/lubridate/issues/284) Compute
    periods in `as.period.interval` without recurring to modulo
    arithmetic.
    !end-bullet!
-   !begin-bullet!
    [#272](https://github.com/tidyverse/lubridate/issues/272) Update
    examples for `hms`, `hm` and `ms` for new printing style.
    !end-bullet!
-   !begin-bullet!
    [#236](https://github.com/tidyverse/lubridate/issues/236) Don't
    allow zeros in month and day during parsing.
    !end-bullet!
-   !begin-bullet!
    [#247](https://github.com/tidyverse/lubridate/issues/247)
    Uninitialized index was mistakenly used in subseting.
    !end-bullet!
-   !begin-bullet!
    [#229](https://github.com/tidyverse/lubridate/issues/229)
    `guess_formats` now matches flex regexp first.
    !end-bullet!
-   !begin-bullet!
    `dmilliseconds` now correctly returns a `Duration` object.
    !end-bullet!
-   !begin-bullet!
    Fixed setdiff for discontinuous intervals.
    !end-bullet!

!end-bullets-37!

# Version 1.3.3

### CHANGES

!begin-bullets-38!

-   !begin-bullet!
    New low level C parser for numeric formats and two new front-end R
    functions parse_date_time2 and fast_strptime. The achieved speed up
    is 50-100x as compared to standard as.POSIXct and strptime
    functions.

    The user level parser functions of ymd_hms family drop to these C
    routines whenever plain numeric formats are detected.

    !end-bullet!

!end-bullets-38!

### BUG FIXES

!begin-bullets-39!

-   !begin-bullet!
    olson_time_zones now supports Solaris OS
    !end-bullet!
-   !begin-bullet!
    infinite recursion on parsing non-existing leap times was fixed
    !end-bullet!

!end-bullets-39!

# Version 1.3.2

!begin-bullets-40!

-   !begin-bullet!
    Lubridate's s4 methods no longer use the representation argument,
    which has been deprecated in R 3.0.0 (see ?setClass). As a result,
    lubridate is no longer backwards compatible with R \<3.0.0.
    !end-bullet!

!end-bullets-40!

# Version 1.3.0

### CHANGES

!begin-bullets-41!

-   !begin-bullet!
    v1.3.0. treats math with month and year Periods more consistently.
    If adding or subtracting n months would result in a non-existent
    date, lubridate will return an NA instead of a day in the following
    month or year. For example, `ymd("2013-01-31") + months(1)` will
    return `NA` instead of `2013-03-04` as in v1.2.0.
    `ymd("2012-02-29") + years(1)` will also return an `NA`. This rule
    change helps ensure that date + timespan - timespan = date (or NA).
    If you'd prefer that such arithmetic just returns the last day of
    the resulting month, see `%m+%` and `%m-%`.
    !end-bullet!
-   !begin-bullet!
    update.POSIXct and update.POSIXlt have been rewritten to be 7x
    faster than their versions in v1.2.0. The speed gain is felt in
    `force_tz`, `with_tz`, `floor_date`, `ceiling_date`, `second<-`,
    `minute<-`, `hour<-`, `day<-`, `month<-`, `year<-`, and other
    functions that rely on update (such as math with Periods).
    !end-bullet!
-   !begin-bullet!
    lubridate includes a Korean translation provided by
    http://korea.gnu.org/gnustats/
    !end-bullet!

!end-bullets-41!

### NEW FEATURES

!begin-bullets-42!

-   !begin-bullet!
    lubridate parser and stamp functions now handle ISO8601 date format
    (e.g., 2013-01-24 19:39:07.880-06:00, 2013-01-24 19:39:07.880Z)
    !end-bullet!
-   !begin-bullet!
    lubridate v1.3.0 comes with a new R vignette. see
    `browseVignettes("lubridate")` to view it.
    !end-bullet!
-   !begin-bullet!
    The accessors `second`, `minute`, `hour`, `day`, `month`, `year` and
    the settors `second<-`, `minute<-`, `hour<-`, `day<-`, `month<-`,
    `year<-` now work on Period class objects
    !end-bullet!
-   !begin-bullet!
    users can control which messages lubridate returns when parsing and
    estimating with the global option lubridate.verbose. Run
    `options(lubridate.verbose = TRUE)` to turn parsing messages on. Run
    `options(lubridate.verbose = FALSE)` to turn estimation and coercion
    messages off.
    !end-bullet!
-   !begin-bullet!
    lubridate parser functions now propagate NA's just as as.POSIXct,
    strptime and other functions do. Previously lubridate's parse
    functions would only return an error.
    !end-bullet!
-   !begin-bullet!
    added \[\[ and \[\[\<- methods for INterval, Period and Duration
    class objects
    !end-bullet!
-   !begin-bullet!
    added `%m+%` and `%m-%` methods for Interval and Duration class
    objects that throw useful errors.
    !end-bullet!
-   !begin-bullet!
    `olson_time_zones` retreives a character vector is Olson-style time
    zone names to use in lubridate
    !end-bullet!
-   !begin-bullet!
    summary methods for Interval, Period, and Duration classes
    !end-bullet!
-   !begin-bullet!
    date_decimal converts a date written as a decimal of a year into a
    POSIXct date-time
    !end-bullet!

!end-bullets-42!

### BUG FIXES

!begin-bullets-43!

-   !begin-bullet!
    fixed bug in way update.POSIXct and update.POSIXlt handle dates that
    occur in the fall daylight savings overlap. update will choose the
    date-time closest to the original date time (on the timeline) when
    two identical clock times exist due to the DST overlap.
    !end-bullet!
-   !begin-bullet!
    fixed bugs that created unintuitive results for `as.interval`,
    `int_overlaps`, `%within%` and the interval methods of `c`,
    `intersect`, `union`, `setdiff`, and `summary`.
    !end-bullet!
-   !begin-bullet!
    parse functions, `as.interval`, `as.period` and `as.duration` now
    handlevectors of NA's without returning errors.
    !end-bullet!
-   !begin-bullet!
    parsers better handle vectors of input that have more than 100
    elements and many NAs
    !end-bullet!
-   !begin-bullet!
    data frames that contain timespan objects with NAs in thme no longer
    fail toprint
    !end-bullet!
-   !begin-bullet!
    `round_date`, `ceiling_date` and `update` now correctly handle input
    of length zero
    !end-bullet!
-   !begin-bullet!
    `decimal_date` no longer returns NaN for first second of the year
    !end-bullet!

!end-bullets-43!

# Version 1.2.0

### CHANGES

!begin-bullets-44!

-   !begin-bullet!
    lubridate 1.2.0 is significantly faster than lubridate 1.1.0. This
    is largely thanks to a parser rewrite submitted by Vitalie Spinu.
    Thank you, Vitalie. Some metrics:

    !begin-bullets-45!
    -   !begin-bullet!
        parser speed up - 60x faster
        !end-bullet!
    -   !begin-bullet!
        `with_tz` speed up - 15x faster
        !end-bullet!
    -   !begin-bullet!
        `force_tz` speed up - 3x faster
        !end-bullet!

    !end-bullets-45!
    !end-bullet!
-   !begin-bullet!
    Development for 1.2.0 has also focused on improving the way we work
    with months. `rollback` rolls dates back to the last day of the
    previous month. provides more options for working with months.
    `days_in_month` finds the number of days in a date's month. And,
    `%m+%` and `%m-%` provide a new way to \### handle unequal month
    lengths while doing arithmetic. See NEW FEATURES for more details

    !end-bullet!
-   !begin-bullet!
    date parsing can now parse multiple date formats within the same
    vector of date-times. Parsing can also recognize a greater variety
    of date-time formats as well as incomplete (truncated) date-times.
    Contributed by Vitalie Spinu. Thank you, Vitalie.

    !end-bullet!
-   !begin-bullet!
    1.2.0 introduces a new display format for periods. The display is
    more math and international friendly.

    !end-bullet!
-   !begin-bullet!
    1.2.0 transforms negative intervals into periods much more
    gracefully (e.g, - 3 days instead of -1 years, 11 months, and 27
    days)

    !end-bullet!
-   !begin-bullet!
    S3 update methods are now exported

    !end-bullet!

!end-bullets-44!

### NEW FEATURES

!begin-bullets-46!

-   !begin-bullet!
    `stamp` allows users to print dates in whatever form they like.
    Contributed by Vitalie Spinu. Thank you, Vitalie.

    !end-bullet!
-   !begin-bullet!
    periods now handle fractional seconds. Contributed by Vitalie Spinu.
    Thank you, Vitalie.

    !end-bullet!
-   !begin-bullet!
    date parsing can now parse multiple date formats within the same
    vector of date-times. Parsing can also recognize a greater variety
    of date-time formats as well as incomplete (truncated) date-times.
    Contributed by Vitalie Spinu. Thank you, Vitalie.

    !end-bullet!
-   !begin-bullet!
    `sort`, `order`, `rank` and `xtfrm` now work with periods

    !end-bullet!
-   !begin-bullet!
    `as.period.Interval` accepts a unit argument. `as.period` will
    convert intervals into periods no larger than the supplied unit.

    !end-bullet!
-   !begin-bullet!
    `days_in_month` takes a date, returns the number of days in the
    date's month. Contributed by Richard Cotton. Thank you, Richard.

    !end-bullet!
-   !begin-bullet!
    `%m+%` and `%m-%` perform addition and subtraction with months (and
    years) without rollover at the end of a month. These can be used in
    place of + and -. These can't be used with periods smaller than a
    month, which should be handled separately. An example of the new
    behavior:

    ymd("2010-01-31") %m+% months(1) \# "2010-02-28 UTC"

    ymd("2010-01-31") + months(1) \# "2010-03-03 UTC"

    ymd("2010-03-31") %m-% months(1) \# "2010-02-28 UTC"

    ymd("2010-01-31") - months(1) \# "2010-03-03 UTC"

    !end-bullet!
-   !begin-bullet!
    `rollback` rolls a date back to the last day of the previous month.

    !end-bullet!
-   !begin-bullet!
    `quarter` returns the fiscal quarter that a date occurs in. Like
    `quartes` in base R, but returns a numeric instead of a character
    string.

    !end-bullet!

!end-bullets-46!

### BUG FIXES

!begin-bullets-47!

-   !begin-bullet!
    date parsers now handle NAs

    !end-bullet!
-   !begin-bullet!
    periods now handle NAs

    !end-bullet!
-   !begin-bullet!
    `[<-` now correctly updates all elements of a period inside a
    vector, list, or data.frame

    !end-bullet!
-   !begin-bullet!
    `period()` now works with unit = "weeks"

    !end-bullet!
-   !begin-bullet!
    `ceiling_date` no longer rounds up if a date is already at a ceiling

    !end-bullet!
-   !begin-bullet!
    the redundant (i.e, repeated) hour of fall daylight savings time now
    displays with the correct time zone

    !end-bullet!
-   !begin-bullet!
    `update.POSIXct` and `update.POSIXlt` handle vectors that sum to
    zero in the days argument

    !end-bullet!
-   !begin-bullet!
    the format method for periods, intervals and duration now accurately
    displays objects of length 0.

    !end-bullet!

!end-bullets-47!

# Version 1.1.0

### CHANGES

!begin-bullets-48!

-   !begin-bullet!
    lubridate no longer overwrites base R methods for +, - , \*, /, %%,
    and %/%. To recreate the previous experience of subtracting two date
    times to create an interval, we've added the interval creation
    function %--%.

    !end-bullet!
-   !begin-bullet!
    lubridate has moved to an S4 object system. Timespans, Intervals,
    Durations, and Periods have each been redefined as an S4 class with
    its own methods.

    !end-bullet!
-   !begin-bullet!
    arithmetic operations will no longer perform implicit class changes
    between timespans. Users must explicitly state how and when they
    wish class changes to occur with as.period(), as.duration(), and
    as.interval(). This makes code written with lubridate more robust,
    as such implicit changes often did not produce consistent behavior
    across a variety of operations. It also allows lubridate to be less
    chatty with fewer console messages. lubridate does not need to
    explain what it is doing, because it no longer attempts to do things
    whose outcome would not be clear. On the other hand, arithmetic
    between multiple time classes will produce informative error
    messages.

    !end-bullet!
-   !begin-bullet!
    the internal structure of lubridate R code has been reorganized at
    https://github.com/tidyverse/lubridate to make lubridate more
    development friendly.

    !end-bullet!

!end-bullets-48!

### NEW FEATURES

!begin-bullets-49!

-   !begin-bullet!
    intervals are now more useful and lubridate has more ways to
    manipulate them. Intervals can be created with %--%; modified with
    int_shift(), int_flip(), and int_standardize(); manipulated with
    intersect(), union(), and setdiff(); and used in logical tests with
    int_aligns(), int_overlaps(), and %within%. lubridate will no longer
    perform arithmetic between two intervals because the correct results
    of such operations is no more obvious than the correct result of
    adding two dates. Instead users are encouraged to use the new set
    operations or to directly modify intervals with int_start() and
    int_end(), which can also be used as settors. lubridate now supports
    negative intervals as well as positive intervals. Intervals also now
    display with a time zone.

    !end-bullet!
-   !begin-bullet!
    Modulo methods for timespans have been changed to return a timespan.
    this allows modulo methods to be used with integer division in an
    intuitive manner, e.g. `a = a %/% b * b + a %% b`

    !end-bullet!

!end-bullets-49!

Users can still acheive a numerical result by using as.numeric() on
input before performing modulo.

!begin-bullets-50!

-   !begin-bullet!
    Periods, durations, and intervals can now all be put into a data
    frame.

    !end-bullet!
-   !begin-bullet!
    Periods, durations, and intervals can be intuitively subset with \$
    and \[\]. These operations also can be used as settors with \<-.

    !end-bullet!
-   !begin-bullet!
    The parsing functions and the as.period method for intervals are now
    slightly faster.

    !end-bullet!
-   !begin-bullet!
    month\<- and wday\<- settors accept names as well as numbers

    !end-bullet!
-   !begin-bullet!
    parsing functions now have a quiet argument to parse without
    messages and a tz argument to directly parse times into the desired
    time zone.

    !end-bullet!
-   !begin-bullet!
    logical comparison methods now work for period objects.

    !end-bullet!

!end-bullets-50!

# Version 0.2.6

!begin-bullets-51!

-   !begin-bullet!
    use `test_package` to avoid incompatibility with current version of
    `testthat`

    !end-bullet!
-   !begin-bullet!
    other minor fixes to pass `R CMD check`

    !end-bullet!

!end-bullets-51!

# Version 0.2.5

!begin-bullets-52!

-   !begin-bullet!
    added ymdThms() for parsing ISO 8061 formatted combned dates and
    times
    !end-bullet!

!end-bullets-52!

### BUG FIXES

!begin-bullets-53!

-   !begin-bullet!
    removed bug in parsing dates with "T" in them

    !end-bullet!
-   !begin-bullet!
    modified as.period.interval() to display periods in positive units

    !end-bullet!

!end-bullets-53!

# Version 0.2.4

!begin-bullets-54!

-   !begin-bullet!
    Add citations to JSS article
    !end-bullet!

!end-bullets-54!

# Version 0.2.3

### NEW FEATURES

!begin-bullets-55!

-   !begin-bullet!
    ymd_hms(), hms(), and ms() functions can now parse dates that
    include decimal values in the seconds element.

    !end-bullet!
-   !begin-bullet!
    milliseconds(), microseconds(), nanoseconds(), and picoseconds()
    create period objects of the specified lengths. dmilliseconds(),
    dmicroseconds(), dnanoseconds(), and dpicoseconds() make duration
    objects of the specified lengths.

    !end-bullet!

!end-bullets-55!

### BUG FIXES

!begin-bullets-56!

-   !begin-bullet!
    lubridate no longer overwrites months(), start(), and end() from
    base R. Start and end have been replaced with int_start() and
    int_end().

    !end-bullet!
-   !begin-bullet!
    lubridate imports plyr and stringr packages, instead of depending on
    them.

    !end-bullet!

!end-bullets-56!

# Version 0.2.2

### NEW FEATURES

!begin-bullets-57!

-   !begin-bullet!
    made division, modulo, and integer division operations compatible
    with difftimes

    !end-bullet!
-   !begin-bullet!
    created c() methods for periods and durations

    !end-bullet!

!end-bullets-57!

### BUG FIXES

!begin-bullets-58!

-   !begin-bullet!
    fixed bug in division, modulo, and integer operations with timespans
    !end-bullet!

!end-bullets-58!

# Version 0.2.1

### NEW FEATURES

!begin-bullets-59!

-   !begin-bullet!
    created parsing functions ymd_hm ymd_h dmy_hms dmy_hm dmy_h mdy_hms
    mdy_hm mdy_h ydm_hms ydm_hm ydm_h, which operate in the same way as
    ymd_hms().
    !end-bullet!

!end-bullets-59!

### BUG FIXES

!begin-bullets-60!

-   !begin-bullet!
    fixed bug in add_dates(). duration objects can now be successfully
    added to numeric objects.
    !end-bullet!

!end-bullets-60!

------------------------------------------------------------------------

# Version 0.2

### NEW FEATURES

!begin-bullets-61!

-   !begin-bullet!
    division between timespans: each timespan class (durations, periods,
    intervals) can be divided by other timespans. For example, how many
    weeks are there between Halloween and Christmas?: (christmas -
    halloween) / weeks(1)

    !end-bullet!
-   !begin-bullet!
    modulo operations between timespans

    !end-bullet!
-   !begin-bullet!
    duration objects now have their own class and display format
    separate from difftimes

    !end-bullet!
-   !begin-bullet!
    interval objects now use an improved data structure and have a
    cleaner display format

    !end-bullet!
-   !begin-bullet!
    lubridate now loads its own namespace

    !end-bullet!
-   !begin-bullet!
    math operations now automatically coerce interval objects to
    duration objects. Allows intervals to be used "right out of the box"
    without error messages.

    !end-bullet!
-   !begin-bullet!
    created start() and end() functions for accessing and changing the
    boundary date-times of an interval

    !end-bullet!
-   !begin-bullet!
    rep() methods for periods, intervals, and durations

    !end-bullet!

!end-bullets-61!

### MINOR CHANGES

!begin-bullets-62!

-   !begin-bullet!
    added a package help page with functions listed by purpose

    !end-bullet!
-   !begin-bullet!
    eseconds(), eminutes(), etc. are aliased to dseconds(), dminutes(),
    etc. to make it easier to remember they are duration objects.

    !end-bullet!
-   !begin-bullet!
    changed leap.years() to leap_years() to maintain consistent naming
    scheme

    !end-bullet!

!end-bullets-62!

### BUG FIXES

!begin-bullets-63!

-   !begin-bullet!
    rewrote as.period() to create only positive periods.

    !end-bullet!
-   !begin-bullet!
    fixed rollover bug in update.POSIXct()

    !end-bullet!
-   !begin-bullet!
    edited make_diff() to display in days when approporiate, not weeks

    !end-bullet!

!end-bullets-63!

# clock (development version)

!begin-bullets-1!

-   !begin-bullet!
    `%Y`, `%F`, `%G`, and `%c` now parse up to 4 *characters* by
    default, rather than 4 *digits*. This is more in line with the C++20
    specification and was a change made in the upstream `<date.h>`
    parser. Practically, this means that negative years such as
    `-1000-01-01` will no longer parse with `%Y-%m-%d`, and instead
    requires `%5Y-%m-%d` to capture the leading `-` (#387).

    !end-bullet!
-   !begin-bullet!
    tzdb \>=0.5.0 is required. Note that older versions of clock are not
    compatible with tzdb 0.5.0 and above, so if you are having issues
    (particularly with parsing) please make sure that both clock and
    tzdb are fully updated (#387).

    !end-bullet!
-   !begin-bullet!
    Fixed `-Wdeprecated-literal-operator` reported by clang (#386,
    @MichaelChirico).

    !end-bullet!

!end-bullets-1!

# clock 0.7.2

!begin-bullets-2!

-   !begin-bullet!
    Added a `diff()` method for time points and calendars to ensure that
    durations are always returned, even in the empty result case (#364).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where clock would not compile on Centos 7 using
    gcc-5.4.0 due to a `constexpr` issue (#357).

    !end-bullet!
-   !begin-bullet!
    Fixed a test that failed due to `seq.Date()` now returning integer
    storage in some cases in the development version of R.

    !end-bullet!

!end-bullets-2!

# clock 0.7.1

!begin-bullets-3!

-   !begin-bullet!
    Removed usage of non-API `STRING_PTR()` in favor of
    `STRING_PTR_RO()`.

    !end-bullet!
-   !begin-bullet!
    Fixed a gcc warning reported by CRAN related to templated C++
    constructors (#371).

    !end-bullet!

!end-bullets-3!

# clock 0.7.0

## New features

!begin-bullets-4!

-   !begin-bullet!
    New `year_week_day()` calendar for specifying a date using the year,
    the week number, and the day of the week, alongside a `start` value
    representing the day of the week that is considered the start of the
    week. Using `start = clock_weekdays$monday` is identical to the
    `iso_year_week_day()` calendar, and using
    `start = clock_weekdays$sunday` is useful for representing the
    Epidemiological calendar used by the US CDC guidelines (similar to
    what is supported by `lubridate::epiweek()` and
    `lubridate::epiyear()`) (#110).

    !end-bullet!
-   !begin-bullet!
    New `date_spanning_seq()` for generating a regular sequence along
    the full span of a date or date-time vector (i.e. along
    `[min(x), max(x)]`). It is similar to `tidyr::full_seq()`, but is a
    bit simpler and currently has better handling of some edge cases.
    Additionally included in the low-level API are
    `calendar_spanning_seq()`, `time_point_spanning_seq()`, and
    `duration_spanning_seq()` (#279).

    !end-bullet!
-   !begin-bullet!
    New `date_time_info()` and `zoned_time_info()` low-level helpers for
    accessing the previous/next transition times, the offset from UTC,
    and the current time zone abbreviation (#295).

    !end-bullet!
-   !begin-bullet!
    `calendar_leap_year()` now supports the year-quarter-day and
    iso-year-week-day calendars (#332, #333).

    !end-bullet!

!end-bullets-4!

## Breaking changes

!begin-bullets-5!

-   !begin-bullet!
    The storage mechanism for the duration, sys-time, naive-time, and
    zoned-time types has been altered to more correctly represent the
    full range of values allowed by the underlying C++ types. This means
    that if you have serialized a value of one of these types with an
    old version of clock, then it will no longer unserialize correctly
    going forward.

    Technically, rather than storing a variable number of integer
    vectors representing ticks, ticks of a day, and ticks of a second,
    we now always store values of these types within two double vectors,
    regardless of the precision. This simplifies the implementation and
    allows us to represent the full range of possible `int64_t` values
    (#331).

    !end-bullet!

!end-bullets-5!

## Lifecycle changes

!begin-bullets-6!

-   !begin-bullet!
    `date_zone()` and `date_set_zone()` have been soft-deprecated in
    favor of `date_time_zone()` and `date_time_set_zone()` (#326).
    !end-bullet!

!end-bullets-6!

## Minor changes and bug fixes

!begin-bullets-7!

-   !begin-bullet!
    clock now compiles significantly faster (on a 2018 Intel Mac, it
    used to take \~70 seconds for a full compilation, and now takes \~25
    seconds) (#322).

    !end-bullet!
-   !begin-bullet!
    `%%` and `%/%` operators now return a missing value when the
    right-hand side is `0`. For `%/%`, this is consistent with
    `2L %/% 0L`, which returns a missing value, rather than with
    `2 %/% 0`, which returns `Inf`, since infinite durations are not
    supported (#349).

    !end-bullet!
-   !begin-bullet!
    `seq()` methods for durations and time points handle the empty
    sequence cases of `from > to && by > 0` and `from < to && by < 0`
    better when `from` and `to` are very far apart (i.e. when they would
    otherwise result in overflow if they were subtracted).

    !end-bullet!
-   !begin-bullet!
    `zoned_time_zone()` and `zoned_time_set_zone()` are no longer
    generic, and now only work for zoned-times.

    !end-bullet!
-   !begin-bullet!
    Documented clock's current stance on leap seconds in the FAQ
    vignette (clock ignores them like POSIXct) (#309).

    !end-bullet!
-   !begin-bullet!
    Duration vectors now work as `.before` and `.after` arguments of
    `slider::slide_index()` and friends (#306).

    !end-bullet!
-   !begin-bullet!
    All `as_*()` generics exported by clock now include `...` in their
    signature to help with extensibility of converting to clock types.
    These are the only clock generics that are currently "blessed" as
    fully extensible (#348).

    !end-bullet!
-   !begin-bullet!
    `as.character()` has been implemented for durations.

    !end-bullet!
-   !begin-bullet!
    Fixed `vec_ptype_full()` and `vec_ptype_abbr()` methods for sys-time
    and naive-time objects (#302).

    !end-bullet!
-   !begin-bullet!
    Many errors have been improved (#219, #286, #595).

    !end-bullet!
-   !begin-bullet!
    Renamed `locale.h` to `fill.h` to avoid clock's `locale.h` being
    chosen over a system header of the same name on some CentOS machines
    (#310).

    !end-bullet!
-   !begin-bullet!
    Skipped a test on 32-bit architectures to work around a bug in base
    R (#312).

    !end-bullet!
-   !begin-bullet!
    R \>=3.5.0 is now required, which is in line with tidyverse
    standards.

    !end-bullet!
-   !begin-bullet!
    vctrs \>=0.6.1 and rlang \>=1.1.0 are now required.

    !end-bullet!

!end-bullets-7!

# clock 0.6.1

!begin-bullets-8!

-   !begin-bullet!
    `date_seq()` and the `seq()` methods for the calendar, time point,
    and duration types now allow `from > to` when `by > 0`. This now
    results in a size zero result rather than an error, which is more in
    line with `rlang::seq2()` and generally has more useful programmatic
    properties (#282).

    !end-bullet!
-   !begin-bullet!
    The sys-time method for `as.POSIXct()` now correctly promotes to a
    precision of at least seconds before attempting the conversion. This
    matches the behavior of the naive-time method (#278).

    !end-bullet!
-   !begin-bullet!
    Removed the dependency on ellipsis in favor of the equivalent
    functions in rlang (#288).

    !end-bullet!
-   !begin-bullet!
    Updated tests related to writing UTF-8 on Windows and testthat 3.1.2
    (#287).

    !end-bullet!
-   !begin-bullet!
    Updated all snapshot tests to use rlang 1.0.0 (#285).

    !end-bullet!
-   !begin-bullet!
    tzdb \>=0.3.0 is now required to get access to the latest time zone
    database information (2022a).

    !end-bullet!
-   !begin-bullet!
    vctrs \>=0.4.1 and rlang \>=1.0.4 are now required (#297).

    !end-bullet!
-   !begin-bullet!
    cpp11 \>=0.4.2 is now required to ensure that a fix related to
    unwind protection is included.

    !end-bullet!
-   !begin-bullet!
    R \>=3.4.0 is now required. This is consistent with the standards of
    the tidyverse.

    !end-bullet!

!end-bullets-8!

# clock 0.6.0

!begin-bullets-9!

-   !begin-bullet!
    New `date_count_between()`, `calendar_count_between()`, and
    `time_point_count_between()` for computing the number of units of
    time between two dates (i.e. the number of years, months, days, or
    seconds). This has a number of uses, like computing the age of an
    individual in years, or determining the number of weeks that have
    passed since the start of the year (#266).

    !end-bullet!
-   !begin-bullet!
    Modulus is now defined between a duration vector and an integer
    vector through `<duration> %% <integer>`. This returns a duration
    vector containing the remainder of the division (#273).

    !end-bullet!
-   !begin-bullet!
    Integer division is now defined for two duration objects through
    `<duration> %/% <duration>`. This always returns an integer vector,
    so be aware that using very precise duration objects (like
    nanoseconds) can easily generate a division result that is outside
    the range of an integer. In that case, an `NA` is returned with a
    warning.

    !end-bullet!

!end-bullets-9!

# clock 0.5.0

!begin-bullets-10!

-   !begin-bullet!
    New `date_time_parse_RFC_3339()` and `sys_time_parse_RFC_3339()` for
    parsing date-time strings in the RFC 3339 format. This format is a
    subset of ISO 8601 representing the most common date-time formats
    seen in internet protocols, and is particularly useful for parsing
    date-time strings returned by an API. The default format parses
    strings like `"2019-01-01T01:02:03Z"` but can be adjusted to parse a
    numeric offset from UTC with the `offset` argument, which can parse
    strings like `"2019-01-01T01:02:03-04:30"` (#254).

    !end-bullet!
-   !begin-bullet!
    To align more with RFC 3339 and ISO 8601 standards, the default
    formats used in many of the date formatting and parsing functions
    have been slightly altered. The following changes have been made:

    !begin-bullets-11!
    -   !begin-bullet!
        Date-times (POSIXct):

        !begin-bullets-12!
        -   !begin-bullet!
            `date_format()` now prints a `T` between the date and time.

            !end-bullet!
        -   !begin-bullet!
            `date_time_parse_complete()` now expects a `T` between the
            date and time by default.

            !end-bullet!

        !end-bullets-12!
        !end-bullet!
    -   !begin-bullet!
        Sys-times:

        !begin-bullets-13!
        -   !begin-bullet!
            `format()` and `as.character()` now print a `T` between the
            date and time.

            !end-bullet!
        -   !begin-bullet!
            `sys_time_parse()` now expects a `T` between the date and
            time by default.

            !end-bullet!

        !end-bullets-13!
        !end-bullet!
    -   !begin-bullet!
        Naive-times:

        !begin-bullets-14!
        -   !begin-bullet!
            `format()` and `as.character()` now print a `T` between the
            date and time.

            !end-bullet!
        -   !begin-bullet!
            `naive_time_parse()` now expects a `T` between the date and
            time by default.

            !end-bullet!

        !end-bullets-14!
        !end-bullet!
    -   !begin-bullet!
        Zoned-times:

        !begin-bullets-15!
        -   !begin-bullet!
            `format()` and `as.character()` now print a `T` between the
            date and time.

            !end-bullet!
        -   !begin-bullet!
            `zoned_time_parse_complete()` now expects a `T` between the
            date and time by default.

            !end-bullet!

        !end-bullets-15!
        !end-bullet!
    -   !begin-bullet!
        Calendars:

        !begin-bullets-16!
        -   !begin-bullet!
            `format()` and `as.character()` now print a `T` between the
            date and time.

            !end-bullet!
        -   !begin-bullet!
            `year_month_day_parse()` now expects a `T` between the date
            and time by default.

            !end-bullet!

        !end-bullets-16!
        !end-bullet!

    !end-bullets-11!
    !end-bullet!
-   !begin-bullet!
    Further improved documentation of undefined behavior resulting from
    attempting to parse sub-daily components of a string that is
    intended to be parsed into a Date (#258).

    !end-bullet!
-   !begin-bullet!
    Bumped required minimum version of tzdb to 0.2.0 to get access to
    the latest time zone database information (2021e) and to fix a
    Unicode bug on Windows.

    !end-bullet!

!end-bullets-10!

# clock 0.4.1

!begin-bullets-17!

-   !begin-bullet!
    Updated a test related to upcoming changes in testthat.
    !end-bullet!

!end-bullets-17!

# clock 0.4.0

!begin-bullets-18!

-   !begin-bullet!
    New `date_start()` and `date_end()` for computing the date at the
    start or end of a particular `precision`, such as the "end of the
    month" or the "start of the year". These are powered by
    `calendar_start()` and `calendar_end()`, which allow for even more
    flexible calendar-specific boundary generation, such as the "last
    moment in the fiscal quarter" (#232).

    !end-bullet!
-   !begin-bullet!
    New `invalid_remove()` for removing invalid dates. This is just a
    wrapper around `x[!invalid_detect(x)]`, but works nicely with the
    pipe (#229).

    !end-bullet!
-   !begin-bullet!
    All clock types now support `is.nan()`, `is.finite()`, and
    `is.infinite()`. Additionally, duration types now support `abs()`
    and `sign()` (#235).

    !end-bullet!
-   !begin-bullet!
    tzdb 0.1.2 is now required, which fixes compilation issues on
    RHEL7/Centos (#234).

    !end-bullet!

!end-bullets-18!

# clock 0.3.1

!begin-bullets-19!

-   !begin-bullet!
    Parsing into a date-time type that is coarser than the original
    string is now considered ambiguous and undefined behavior. For
    example, parsing a string with fractional seconds using
    `date_time_parse(x)` or `naive_time_parse(x, precision = "second")`
    is no longer considered correct. Instead, if you only require second
    precision from such a string, parse the full string, with fractional
    seconds, into a clock type that can handle them, then round to
    seconds using whatever rounding convention is required for your use
    case, such as `time_point_floor()` (#230).

    For example:

    !begin-codeblock!
        x <- c("2019-01-01 00:00:59.123", "2019-01-01 00:00:59.556")

        x <- naive_time_parse(x, precision = "millisecond")
        x
        #> <time_point<naive><millisecond>[2]>
        #> [1] "2019-01-01 00:00:59.123" "2019-01-01 00:00:59.556"

        x <- time_point_round(x, "second")
        x
        #> <time_point<naive><second>[2]>
        #> [1] "2019-01-01 00:00:59" "2019-01-01 00:01:00"

        as_date_time(x, "America/New_York")
        #> [1] "2019-01-01 00:00:59 EST" "2019-01-01 00:01:00 EST"

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Preemptively updated tests related to upcoming changes in testthat
    (#236).

    !end-bullet!

!end-bullets-19!

# clock 0.3.0

!begin-bullets-20!

-   !begin-bullet!
    New `date_seq()` for generating date and date-time sequences (#218).

    !end-bullet!
-   !begin-bullet!
    clock now uses the tzdb package to access the date library's API.
    This means that the experimental API that was to be used for vroom
    has been removed in favor of using the one exposed in tzdb.

    !end-bullet!
-   !begin-bullet!
    `zone_database_names()` and `zone_database_version()` have been
    removed in favor of re-exporting `tzdb_names()` and `tzdb_version()`
    from the tzdb package.

    !end-bullet!

!end-bullets-20!

# clock 0.2.0

!begin-bullets-21!

-   !begin-bullet!
    clock now interprets R's Date class as *naive-time* rather than
    *sys-time*. This means that it no longer assumes that Date has an
    implied time zone of UTC (#203). This generally aligns better with
    how users think Date should work. This resulted in the following
    changes:

    !begin-bullets-22!
    -   !begin-bullet!
        `date_zone()` now errors with Date input, as naive-times do not
        have a specified time zone.

        !end-bullet!
    -   !begin-bullet!
        `date_parse()` now parses into a naive-time, rather than a
        sys-time, before converting to Date. This means that `%z` and
        `%Z` are now completely ignored.

        !end-bullet!
    -   !begin-bullet!
        The Date method for `date_format()` now uses the naive-time
        `format()` method rather than the zoned-time one. This means
        that `%z` and `%Z` are no longer valid format commands.

        !end-bullet!
    -   !begin-bullet!
        The zoned-time method for `as.Date()` now converts to Date
        through an intermediate naive-time, rather than a sys-time. This
        means that the printed date will always be retained, which is
        generally what is expected.

        !end-bullet!
    -   !begin-bullet!
        The Date method for `as_zoned_time()` now converts to zoned-time
        through an intermediate naive-time, rather than a sys-time. This
        means that the printed date will always attempt to be retained,
        if possible, which is generally what is expected. In the rare
        case that daylight saving time makes a direct conversion
        impossible, `nonexistent` and `ambiguous` can be used to resolve
        any issues.

        !end-bullet!

    !end-bullets-22!
    !end-bullet!
-   !begin-bullet!
    New `as_date()` and `as_date_time()` for converting to Date and
    POSIXct respectively. Unlike `as.Date()` and `as.POSIXct()`, these
    functions always treat Date as a naive-time type, which results in
    more consistent and intuitive conversions. Note that `as_date()`
    does conflict with `lubridate::as_date()`, and the lubridate version
    handles Dates differently (#209).

    !end-bullet!
-   !begin-bullet!
    Added two new convenient helpers (#197):

    !begin-bullets-23!
    -   !begin-bullet!
        `date_today()` for getting the current date (Date)

        !end-bullet!
    -   !begin-bullet!
        `date_now()` for getting the current date-time (POSIXct)

        !end-bullet!

    !end-bullets-23!
    !end-bullet!
-   !begin-bullet!
    Fixed a bug where converting from a time point to a Date or POSIXct
    could round incorrectly (#205).

    !end-bullet!
-   !begin-bullet!
    Errors resulting from invalid dates or nonexistent/ambiguous times
    are now a little nicer to read through the usage of an info bullet
    (#200).

    !end-bullet!
-   !begin-bullet!
    Formatting a naive-time with `%Z` or `%z` now warns that there were
    format failures (#204).

    !end-bullet!
-   !begin-bullet!
    Fixed a Solaris ambiguous behavior issue from calling
    `pow(int, int)`.

    !end-bullet!
-   !begin-bullet!
    Linking against cpp11 0.2.7 is now required to fix a rare memory
    leak issue.

    !end-bullet!
-   !begin-bullet!
    Exposed an extremely experimental and limited C++ API for vroom
    (#322).

    !end-bullet!

!end-bullets-21!

# clock 0.1.0

!begin-bullets-24!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-24!

# nycflights13 (development version)

# nycflights13 1.0.2

!begin-bullets-1!

-   !begin-bullet!
    Fixes for R CMD check changes.
    !end-bullet!

!end-bullets-1!

# nycflights13 1.0.1

!begin-bullets-2!

-   !begin-bullet!
    `airports$tz` with values `\N` replaced with `NA` (#36).

    !end-bullet!
-   !begin-bullet!
    `weather$year` and `weather$month` are now integers to match
    `flights$year` and `flights$month` (@jozefhajnala, #34)

    !end-bullet!

!end-bullets-2!

# nycflights13 1.0.0

!begin-bullets-3!

-   !begin-bullet!
    `weather$time_hour` and `flights$time_hour` are now stored in the
    America/New_York timezone (#19).

    !end-bullet!
-   !begin-bullet!
    `weather` data updated from latest Iowa State mesonet (@rmcd1024,
    #24). `wind_gust` is now correctly captured from the underlying
    data, rather than being a copy of `wind_speed`. `precip` is better
    captures the hourly preciptation (which tends to be recorded at 51
    minutes past the hour) (#27)

    !end-bullet!

!end-bullets-3!

# nycflights13 0.2.2

!begin-bullets-4!

-   !begin-bullet!
    Import function from tibble to suppress R CMD check NOTE.
    !end-bullet!

!end-bullets-4!

# nycflights13 0.2.1

!begin-bullets-5!

-   !begin-bullet!
    nycflights imports tibble so you get nice printing even when no
    other tidyverse package is loaded.

    !end-bullet!
-   !begin-bullet!
    `airports` now has a `tzone` column that contains the IANA time zone
    for the airport (#15).

    !end-bullet!

!end-bullets-5!

# nycflights13 0.2.0

!begin-bullets-6!

-   !begin-bullet!
    `airlines`: `carrier` columns are characters instead of factors
    (#2).

    !end-bullet!
-   !begin-bullet!
    `airports`: duplicate entry for BFT removed (#7).

    !end-bullet!
-   !begin-bullet!
    `flights`:

    !begin-bullets-7!
    -   !begin-bullet!
        new `time_hour` variable combines `year`, `month`, `day`, and
        `hour` into a single variable (#11).

        !end-bullet!
    -   !begin-bullet!
        new `sched_dep_time` and `sched_arr_time` variables give
        scheduled departure and arrival times - these are more
        appropriate for connecting to weather data. `hour` and `minute`
        are now computed from the scheduled departure time, not the
        actual departure time.

        !end-bullet!
    -   !begin-bullet!
        missing `tailnum` now recorded as `NA`, not `""` (#10).

        !end-bullet!

    !end-bullets-7!
    !end-bullet!
-   !begin-bullet!
    `weather`:

    !begin-bullets-8!
    -   !begin-bullet!
        Includes weather data for all airports.

        !end-bullet!
    -   !begin-bullet!
        New `time_hour` variable combines `year`, `month`, `day`, `hour`
        into a single POSIXct variable.

        !end-bullet!
    -   !begin-bullet!
        Saved as ungrouped.

        !end-bullet!

    !end-bullets-8!
    !end-bullet!

!end-bullets-6!

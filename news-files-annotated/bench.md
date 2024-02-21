# bench (development version)

# bench 1.1.3

!begin-bullets-1!

-   !begin-bullet!
    Long unnamed `bench_expr` expressions are now truncated correctly
    when used as columns of a tibble (#94).

    !end-bullet!
-   !begin-bullet!
    `bench_mark` tibbles now respect the knitr paged df option (#103).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where macOS specific C code paths were accidentally
    being used on GNU Hurd (#118).

    !end-bullet!
-   !begin-bullet!
    Fixed `-Wstrict-prototypes` warnings, as requested by CRAN (#124).

    !end-bullet!
-   !begin-bullet!
    R \>=3.5.0 is now required, which is aligned with tidyverse
    standards.

    !end-bullet!
-   !begin-bullet!
    bench now uses testthat 3e (#129).

    !end-bullet!
-   !begin-bullet!
    bench no longer Suggests mockery.

    !end-bullet!

!end-bullets-1!

# bench 1.1.2

!begin-bullets-2!

-   !begin-bullet!
    Davis Vaughan is now the maintainer.

    !end-bullet!
-   !begin-bullet!
    `autoplot.bench_mark()` again supports factor levels for
    `expression`, as intended (#82)

    !end-bullet!
-   !begin-bullet!
    `bench::mark()` and `bench::workout()` no longer support unquote and
    splice operators. This fixes inconsistencies in performance results
    with functions like `rlang::list2()` (#61).

    !end-bullet!
-   !begin-bullet!
    bench has been re-licensed as MIT (#101).

    !end-bullet!

!end-bullets-2!

# bench 1.1.1

!begin-bullets-3!

-   !begin-bullet!
    `mark()` columns memory, result and mem_alloc columns are now always
    included, even if they are unused.
    !end-bullet!

!end-bullets-3!

# bench 1.1.0

## New features

!begin-bullets-4!

-   !begin-bullet!
    New `bench_process_memory()` function, to return the current and
    maximum memory used by the current process. This uses system
    functions to track memory, so can measure memory outside of R's GC
    heap.

    !end-bullet!
-   !begin-bullet!
    New `workout_expressions()` function, a low-level function to
    workout a list of expressions, like those obtained via `parse()`
    from a file.

    !end-bullet!
-   !begin-bullet!
    `mark()` gains a `memory` argument to control if it records memory
    allocations, set `memory = FALSE` to disable recording memory
    allocations, which can be helpful when trying to benchmark long
    pieces of code with many allocations (#62).

    !end-bullet!

!end-bullets-4!

## Minor improvements and fixes

!begin-bullets-5!

-   !begin-bullet!
    `mark()` now permits empty arguments, e.g. accidental trailing
    commas (#61).

    !end-bullet!
-   !begin-bullet!
    `mark()` now errors correctly when the expressions deparsed length
    is different.

    !end-bullet!
-   !begin-bullet!
    `bench_expr` objects now work better with the upcoming versions of
    tibble and vctrs (@romainfrancois, #64)

    !end-bullet!
-   !begin-bullet!
    `autoplot.bench_mark()` provides a more informative error if the
    `ggbeeswarm` package is not installed (@coatless, #69).

    !end-bullet!
-   !begin-bullet!
    Update documentation of `bench_mark` columns (@jdblischak, #67).

    !end-bullet!

!end-bullets-5!

# bench 1.0.4

!begin-bullets-6!

-   !begin-bullet!
    `bench_memory()` examples no longer fail if they are run with R that
    does not have memory profiling capability (#56).

    !end-bullet!
-   !begin-bullet!
    `bench_expr` now has a class of `c("bench_expr", "list")` rather
    than `c("bench_expr", "expression")`, as it is really a list of
    calls rather than a true expression object.
    (https://github.com/r-lib/vctrs/issues/559)

    !end-bullet!

!end-bullets-6!

# bench 1.0.3

!begin-bullets-7!

-   !begin-bullet!
    `summary.bench_mark()` gains a `time_unit` argument, so you can
    report all times in a consistent scale if desired (#18, #26).

    !end-bullet!
-   !begin-bullet!
    `bench_mark()` now checks for user interrupts, to allow you to stop
    benchmarking if it takes longer than you were expecting (#49).

    !end-bullet!
-   !begin-bullet!
    New `bench_memory()` to capture just the memory allocated by an
    expression.

    !end-bullet!
-   !begin-bullet!
    `bench_time()` is now an alias for `system_time()`.

    !end-bullet!
-   !begin-bullet!
    `unnest.bench_mark()` is now compatible with the upcoming tidyr
    1.0.0 (#48, #51)

    !end-bullet!
-   !begin-bullet!
    New `hires_time()` allows you to explicitly capture high resolution
    time points.

    !end-bullet!

!end-bullets-7!

# bench 1.0.2

!begin-bullets-8!

-   !begin-bullet!
    `workout()` a new function which makes timing multiple expressions
    in turn simpler.

    !end-bullet!
-   !begin-bullet!
    `mark()` now internally uses a tempfile rather than a
    textConnection, as the latter has a 100,000 character limit on some
    platforms (#27)

    !end-bullet!
-   !begin-bullet!
    `mark()` no longer returns the mean or max values and the column
    order has been tweaked to try and put the most interesting columns
    first (#37)

    !end-bullet!
-   !begin-bullet!
    Errors during evaluation now halt execution (#28, #43)

    !end-bullet!
-   !begin-bullet!
    `scale_bench_time()` and `scale_bench_bytes()` now allow you to use
    a non-logarithmic scale.

    !end-bullet!

!end-bullets-8!

# bench 1.0.1

!begin-bullets-9!

-   !begin-bullet!
    Add support for macOS versions prior to 10.12
    !end-bullet!
-   !begin-bullet!
    Disable load sensitive tests on CRAN, to avoid failures
    !end-bullet!

!end-bullets-9!

# bench 1.0.0

!begin-bullets-10!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-10!

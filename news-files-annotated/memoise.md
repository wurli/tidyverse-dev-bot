# memoise (development version)

!begin-bullets-1!

-   !begin-bullet!
    `omit_args` now also works for default arguments (@mgirlich, #145).
    !end-bullet!

!end-bullets-1!

# memoise 2.0.1

# Version 2.0.0.9000

!begin-bullets-2!

-   !begin-bullet!
    Winston Chang is now the maintainer.

    !end-bullet!
-   !begin-bullet!
    The default value for the `hash` argument of `memoise()` is now
    taken with an indirection in case `memoise()` is called at the
    top-level of a namespace (r-lib/rlang#1177).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in `has_cache()` that caused it to get the value
    unnecessarily. (#123)

    !end-bullet!

!end-bullets-2!

# Version 2.0.0

!begin-bullets-3!

-   !begin-bullet!
    Memoise now uses caching objects from the cachem package by default.
    These caches support automatic pruning, so that they won't grow
    indefinitely. The older-style cache objects in the memoise package
    are still supported, but we suggest using new-style caches from
    cachem. (#115)

    !end-bullet!
-   !begin-bullet!
    Name clashes between function arguments and variables defined when
    memoising no longer occur (@egnha, #43).

    !end-bullet!
-   !begin-bullet!
    Add Google Cloud Storage support via `cache_gcs()`
    (@MarkEdmondson1234, #59)

    !end-bullet!
-   !begin-bullet!
    Add `compress` option for non-memory caches (@coolbutuseless, #71).

    !end-bullet!
-   !begin-bullet!
    Use absolute path in cache file system backend, so user can change
    working directory after using relative path (@xhdong-umd, #51, #65)

    !end-bullet!
-   !begin-bullet!
    Add `drop_cache()` to drop the cached result for particular
    arguments (@richardkunze, #78)

    !end-bullet!
-   !begin-bullet!
    Suppress messages of `aws.s3::head_object` within `cache_s3`'s
    `cache_has_key` to avoid printing of 404 messages for new keys
    (@stelsemeyer, #96).

    !end-bullet!

!end-bullets-3!

# Version 1.1.0

!begin-bullets-4!

-   !begin-bullet!
    Caches now hash the function body along with the arguments, to
    ensure functions with identical arguments use a separate file-system
    cache. (#38)
    !end-bullet!
-   !begin-bullet!
    Handle missing arguments in memoised functions for simple cases not
    using non-standard-evaluation (#19).
    !end-bullet!
-   !begin-bullet!
    `memoise()` gains a `cache=` argument to specify an external cache.
    Two types of caches are available, `cache_s3()` for amazon S3 and
    `cache_filesystem()` for a file system cache (#25, @danielecook).
    !end-bullet!

!end-bullets-4!

# Version 1.0.0

!begin-bullets-5!

-   !begin-bullet!
    `memoise()` now signals an error if an already memoised function is
    used as input (#4, @richierocks).
    !end-bullet!
-   !begin-bullet!
    `has_cache()` function added which returns a boolean depending on if
    the given call is cached or not (#10, @dkesh).
    !end-bullet!
-   !begin-bullet!
    Memoised functions now have a print method which displays the
    original function definition, rather than the memoisation code (#15,
    @jimhester).
    !end-bullet!
-   !begin-bullet!
    A memoised function now has the same interface as the original
    function, if the original function is known when `memoise` is
    called. (Otherwise, the old behavior is invoked, with a warning.)
    (#14, @krlmlr)
    !end-bullet!
-   !begin-bullet!
    The enclosing environment of the memoised function is specified
    explicitly, defaults to `parent.frame()`.
    !end-bullet!
-   !begin-bullet!
    `is.memoised` now checks if the argument is a function.
    !end-bullet!
-   !begin-bullet!
    Testing infrastructure, full test coverage.
    !end-bullet!

!end-bullets-5!

# Version 0.2.1

!begin-bullets-6!

-   !begin-bullet!
    Update to fix outstanding R CMD check issues.
    !end-bullet!

!end-bullets-6!

# Version 0.2 (2010-11-11)

## New features

!begin-bullets-7!

-   !begin-bullet!
    Memoised functions now have an attribute memoised=TRUE, and
    is.memoised() tests whether a function is memoised. (Contributed by
    Sietse Brouwer.)
    !end-bullet!

!end-bullets-7!

## Improvements

!begin-bullets-8!

-   !begin-bullet!
    Documentation is now more elaborate, and hopefully more accessible
    to newcomers. Thanks to Sietse Brouwer for the verbosity.
    !end-bullet!

!end-bullets-8!

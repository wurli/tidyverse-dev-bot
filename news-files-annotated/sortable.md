# sortable 0.5

## Enhancements

!begin-bullets-1!

-   !begin-bullet!
    Add support for `update_rank_list()` and `update_bucket_list()`
    !end-bullet!
-   !begin-bullet!
    Add ability to switch the orientation of `rank_list()` items to
    horizontal. #92
    !end-bullet!

!end-bullets-1!

## Changes

!begin-bullets-2!

-   !begin-bullet!
    A `rank_list` now has a unique CSS id, to allow updating the `text`
    of the container.
    !end-bullet!

!end-bullets-2!

# sortable 0.4.6

## Upgrade sortable.js

!begin-bullets-3!

-   !begin-bullet!
    Include `sortable.js` version 1.15.0
    !end-bullet!

!end-bullets-3!

# sortable 0.4.5

## Upgrade sortable.js

!begin-bullets-4!

-   !begin-bullet!
    Include `sortable.js` version 1.14.0, as suggested by #82 and #73
    !end-bullet!

!end-bullets-4!

## Bug fixes

!begin-bullets-5!

-   !begin-bullet!
    Capture error if bucket_list header is empty #31
    !end-bullet!
-   !begin-bullet!
    Fix rank-list-item that spills outside the container boundary #68
    !end-bullet!
-   !begin-bullet!
    Allow bucket_list to have empty header, and capture error better #69
    !end-bullet!

!end-bullets-5!

## Other changes

!begin-bullets-6!

-   !begin-bullet!
    Upgrade tests to `testthat` version 3
    !end-bullet!

!end-bullets-6!

# sortable 0.4.4

!begin-bullets-7!

-   !begin-bullet!
    No functional changes
    !end-bullet!
-   !begin-bullet!
    This release removes a Suggests dependency on `lifecycle` to comply
    with CRAN policy. The `lifecycle` package was not used in the
    project.
    !end-bullet!

!end-bullets-7!

# sortable 0.4.3

## Breaking changes:

!begin-bullets-8!

-   !begin-bullet!
    Moved the `...` dots argument of `sortable_options()` to the first
    argument, where previously it was the last argument. This is to
    prevent partial name matching resulting in the incorrect sortable
    option being set.
    !end-bullet!

!end-bullets-8!

## Other:

!begin-bullets-9!

-   !begin-bullet!
    Updated `sortable.js` to version 1.10.2

    !end-bullet!
-   !begin-bullet!
    Added examples for using the `sortable.js` plugins, specifically
    multiDrag and swap.

    !end-bullet!
-   !begin-bullet!
    Added vignette on cloning and removing, contributed by Maya Gans

    !end-bullet!

!end-bullets-9!

# sortable 0.4.2

!begin-bullets-10!

-   !begin-bullet!
    First release accepted by CRAN
    !end-bullet!

!end-bullets-10!

# sortable 0.4.0

!begin-bullets-11!

-   !begin-bullet!
    First candidate release to CRAN
    !end-bullet!

!end-bullets-11!

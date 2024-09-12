# sortable 0.5.0.9000

## Enhancements

!begin-bullets-1!

-   !begin-bullet!
    New function `update_bucket_list()` to update the items in a bucket
    list
    !end-bullet!
-   !begin-bullet!
    New functionality to update `labels` in `update_rank_list()`
    !end-bullet!

!end-bullets-1!

## Updates

!begin-bullets-2!

-   !begin-bullet!
    Update `Sortable.js` to version 1.15.3
    !end-bullet!

!end-bullets-2!

# sortable 0.5.0

## Enhancements

!begin-bullets-3!

-   !begin-bullet!
    Add support for `update_rank_list()`
    !end-bullet!
-   !begin-bullet!
    Add ability to switch the orientation of `rank_list()` items to
    horizontal. #92
    !end-bullet!

!end-bullets-3!

## Changes

!begin-bullets-4!

-   !begin-bullet!
    A `rank_list` now has a unique CSS id, to allow updating the `text`
    of the container.
    !end-bullet!

!end-bullets-4!

# sortable 0.4.6

## Upgrade sortable.js

!begin-bullets-5!

-   !begin-bullet!
    Include `sortable.js` version 1.15.0
    !end-bullet!

!end-bullets-5!

# sortable 0.4.5

## Upgrade sortable.js

!begin-bullets-6!

-   !begin-bullet!
    Include `sortable.js` version 1.14.0, as suggested by #82 and #73
    !end-bullet!

!end-bullets-6!

## Bug fixes

!begin-bullets-7!

-   !begin-bullet!
    Capture error if bucket_list header is empty #31
    !end-bullet!
-   !begin-bullet!
    Fix rank-list-item that spills outside the container boundary #68
    !end-bullet!
-   !begin-bullet!
    Allow bucket_list to have empty header, and capture error better #69
    !end-bullet!

!end-bullets-7!

## Other changes

!begin-bullets-8!

-   !begin-bullet!
    Upgrade tests to `testthat` version 3
    !end-bullet!

!end-bullets-8!

# sortable 0.4.4

!begin-bullets-9!

-   !begin-bullet!
    No functional changes
    !end-bullet!
-   !begin-bullet!
    This release removes a Suggests dependency on `lifecycle` to comply
    with CRAN policy. The `lifecycle` package was not used in the
    project.
    !end-bullet!

!end-bullets-9!

# sortable 0.4.3

## Breaking changes:

!begin-bullets-10!

-   !begin-bullet!
    Moved the `...` dots argument of `sortable_options()` to the first
    argument, where previously it was the last argument. This is to
    prevent partial name matching resulting in the incorrect sortable
    option being set.
    !end-bullet!

!end-bullets-10!

## Other:

!begin-bullets-11!

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

!end-bullets-11!

# sortable 0.4.2

!begin-bullets-12!

-   !begin-bullet!
    First release accepted by CRAN
    !end-bullet!

!end-bullets-12!

# sortable 0.4.0

!begin-bullets-13!

-   !begin-bullet!
    First candidate release to CRAN
    !end-bullet!

!end-bullets-13!

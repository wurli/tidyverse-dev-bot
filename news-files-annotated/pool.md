# pool (development version)

# pool 1.0.3

!begin-bullets-1!

-   !begin-bullet!
    Now explicitly requires DBI 1.2.0 (#178) and messages if you're
    using an old dbplyr (#179).
    !end-bullet!

!end-bullets-1!

# pool 1.0.2

!begin-bullets-2!

-   !begin-bullet!
    No longer depends on the withr package, by instead requiring R 3.6.

    !end-bullet!
-   !begin-bullet!
    Add wrappers for dbplyr generics `db_col_types()` (#171) and
    `db_copy_to()` (#172).

    !end-bullet!
-   !begin-bullet!
    Pool no longer generates spurious messages about needing to use
    `in_schema()` or avoiding the use of `ident_q()`.

    !end-bullet!
-   !begin-bullet!
    Add support for new DBI generics that return Arrow objects.

    !end-bullet!

!end-bullets-2!

# pool 1.0.1

!begin-bullets-3!

-   !begin-bullet!
    `copy_to()` now returns a tbl that uses the Pool.

    !end-bullet!
-   !begin-bullet!
    Added missing methods for `sql_join_suffix()` (#165) and
    `sql_query_explain()` (#167).

    !end-bullet!

!end-bullets-3!

# pool 1.0.0

## New features

!begin-bullets-4!

-   !begin-bullet!
    Pool has been re-licensed to MIT (#158).

    !end-bullet!
-   !begin-bullet!
    `dbPool()` gains an `onCreate` parameter that allows you do
    something to every connection that pool creates. This is useful for
    setting options that you want to apply to every connection (#98).

    !end-bullet!
-   !begin-bullet!
    New `localCheckout()` checkouts and then automatically returns an
    object. It only works in function scope.

    !end-bullet!

!end-bullets-4!

## Minor improvements and bug fixes

!begin-bullets-5!

-   !begin-bullet!
    Pools now get a useful print method (#140).

    !end-bullet!
-   !begin-bullet!
    pool now implements the dbplyr 2.0.0 interface, eliminating warnings
    when using pool with dplyr (#132).

    !end-bullet!
-   !begin-bullet!
    Pool errors and warnings have been reviewed with an eye to making
    them more immediately actionable (#145).

    !end-bullet!
-   !begin-bullet!
    Objects are now validated once on first checkout to ensure that the
    object and validation strategy are both ok.

    !end-bullet!
-   !begin-bullet!
    Added support for SAP HANA databases (@marcosci, #103).

    !end-bullet!
-   !begin-bullet!
    `dbPool()` and `poolCreate()` now default to validating every 60s,
    rather than every 600s. This makes pools a little more robust to
    shorter connection timeouts (#149).

    !end-bullet!
-   !begin-bullet!
    `dbPool()`'s `validateQuery` is now actually used (#153).

    !end-bullet!
-   !begin-bullet!
    DBI methods should dispatch correctly in more cases; in particular
    `dbReadTable()` and friends will now work correctly when used with
    `DBI::Id()` (#120).

    !end-bullet!

!end-bullets-5!

# pool 0.1.6

!begin-bullets-6!

-   !begin-bullet!
    `left_join()` and friends once again work with pool objects (#111).

    !end-bullet!
-   !begin-bullet!
    `dbPool()` objects previously could leak memory. (#115)

    !end-bullet!

!end-bullets-6!

# pool 0.1.5

!begin-bullets-7!

-   !begin-bullet!
    dplyr and dbplyr are now Suggests instead of Imports. Thanks,
    @AkhilGNair! (#106)

    !end-bullet!
-   !begin-bullet!
    When used with dbplyr, `tbl`s now store a copy of the pool, not a
    checked out connection. (#107)

    !end-bullet!
-   !begin-bullet!
    `dbListObjects()`, `dbCreateTable()`, `dbAppendTable()`,
    `dbIsReadOnly()`, `dbQuoteLiteral()`, and `dbUnquoteIdentifier()`
    methods are now implemented for pool objects. (#100, #109)

    !end-bullet!

!end-bullets-7!

# pool 0.1.4.3

!begin-bullets-8!

-   !begin-bullet!
    Previously, pool would always set `options(warn=1)` when running
    tasks. It now ensures that the value of `warn` can be 1 or greater.
    This can be useful in debugging, so that `options(warn=2)` can be
    used. (#90)
    !end-bullet!

!end-bullets-8!

# pool 0.1.4.2

!begin-bullets-9!

-   !begin-bullet!
    Update unit test for compatibility with future dbplyr. (#82)
    !end-bullet!

!end-bullets-9!

# pool 0.1.4.1

!begin-bullets-10!

-   !begin-bullet!
    Change package maintainer
    !end-bullet!

!end-bullets-10!

# pool 0.1.4

!begin-bullets-11!

-   !begin-bullet!
    Changed the methods `dbExistsTable()`, `dbRemoveTable()`,
    `dbWriteTable()`, `dbGetQuery()`, `dbExecute()`, `dbListFields()`
    and `dbReadTable()` to dispatch over the first two arguments, as per
    the default definition in DBI. (#57)
    !end-bullet!

!end-bullets-11!

# pool 0.1.3

!begin-bullets-12!

-   !begin-bullet!
    Use `requireNamespace("pkg", quietly = TRUE)` for `RMySQL` and
    `RSQLite` in the examples and tests since these are "Suggests"
    packages (i.e. not "Depends"). (commit 4205feb)
    !end-bullet!

!end-bullets-12!

# pool 0.1.2

### Minor new features and improvements

!begin-bullets-13!

-   !begin-bullet!
    Included more examples in the documentation. (#50)

    !end-bullet!
-   !begin-bullet!
    Fixed the "test-create-destroy.R" test. Previously, this test had to
    be run manually because it uses `later` and its async nature could
    not be captured by `testthat`. However, using `later::run_now()`
    immediately after the relevant code snippet (i.e. still inside the
    first argument of `expect_*`) solves the issue. (#50)

    !end-bullet!
-   !begin-bullet!
    Use `difftime(t1, t0, units = "secs")` when calculating a time
    interval. Unlike the simpler `t1 - t0` method, this guarantees that
    the result will always be consistently the number of *seconds*.
    However, there's no change when calculating a new time (*not* a time
    interval) using `t2 <- t1 - interval`, since we want `t2` to be a
    time, rather than a time interval (which is always what is returned
    by `difftime`). (#50 and #48, thank you @caewok!)

    !end-bullet!

!end-bullets-13!

### Bug fixes

!begin-bullets-14!

-   !begin-bullet!
    Fix all dbplyr wrapper functions that weren't passing in additional
    arguments because the call to the original `dbplyr` function
    included `... = ...` instead of `...`. Also, pass
    `temporary = temporary` in `copy_to.Pool`, so that we don't defeat
    the whole purpose of that wrapper. (#50)

    !end-bullet!
-   !begin-bullet!
    Change the place where the check for the maximum number of objects
    is made. Previously, this chunk of code was misplaced and it would
    result in buggy behavior: namely, once the maximum number of objects
    was reached, no more objects could be checked out (**even if you
    returned any/all objects back to the pool**). The only reason this
    wasn't spotted earlier is because the default `maxSize` is `Inf`
    (and there's usually not a good reason to change it). (#50)

    !end-bullet!

!end-bullets-14!

# pool 0.1.1

### Breaking changes

!begin-bullets-15!

-   !begin-bullet!
    Fix #39: Moved `dplyr` support in `pool` from `dplyr` 0.5.0 to
    `dplyr` 0.7.0, which includes a lot of breaking changes including
    the addition of a brand new package called `dbplyr`. (#42)

    For `pool` users, the main change is that all the `src_*` functions
    are now gone (from `dplyr` and `pool`). Therefore, if you had
    something like:

    !begin-codeblock!
    ``` r
    data <- src_pool(pool) %>% tbl("test")
    ```

    !end-codeblock!
    You can just change it to the simpler:

    !begin-codeblock!
    ``` r
    data <- pool %>% tbl("test")
    ```

    !end-codeblock!
    If you're still on an old version of `dplyr` and want to use `pool`
    as well, please install the package using the tag created for that
    purpose:

    !begin-codeblock!
    ``` r
    devtools::install_github("rstudio/pool@dplyr-pre-0.7.0-compat")
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Changed all time arguments to accept number of ***seconds***,
    instead of milliseconds. This is because this is what the `later`
    package uses and there was no reason for `pool` to be different,
    except backward compatibility. Since both time arguments to `dbPool`
    (`idleTimeout` and `validationInterval`) have default values, we're
    hoping this change won't even be noticed by most users. If you were
    setting either of those directly, however, you will need to update
    your app if you update the `pool` package. (#44)
    `<!--Since this release is already breaking backward compatibility, we're going to town!-->`{=html}

    !end-bullet!
-   !begin-bullet!
    Dropped the Pool methods around `dbConnect` and `dbDisconnect`,
    because these made it easier to lose track of whether you're
    operating on a Pool object or on a database connection directly.
    From now on, only these allow you to get a connection from the pool
    and return it back, respectively: (#44)

    !begin-codeblock!
    ``` r
    con <- poolCheckout(pool)
    poolReturn(con)
    ```

    !end-codeblock!
    !end-bullet!

!end-bullets-15!

### New features

!begin-bullets-16!

-   !begin-bullet!
    Use `later` package for scheduling tasks (#44). This also has the
    side effect of fixing #40 and #43 since `later` allows us to get rid
    of the `naiveScheduler` completely.
    !end-bullet!

!end-bullets-16!

### Library updates

!begin-bullets-17!

-   !begin-bullet!
    Roxygen 5.0.1 to 6.0.1. (commit #9952000)
    !end-bullet!

!end-bullets-17!

# pool 0.1.0

!begin-bullets-18!

-   !begin-bullet!
    Initial release!
    !end-bullet!

!end-bullets-18!

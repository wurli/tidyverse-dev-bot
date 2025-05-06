# promises (development version)

!begin-bullets-1!

-   !begin-bullet!
    Changed the way we create future objects to stay compatible with new
    versions of `{future}`. Apparently the way we were doing it was
    never idiomatic and only worked by accident. (#121)

    !end-bullet!
-   !begin-bullet!
    Fixed #122: Use `future::future(..., lazy = TRUE)` to avoid manual
    capturing of state within `future_promise` (Thank you,
    @HenrikBengtsson! #123)

    !end-bullet!

!end-bullets-1!

# promises 1.3.2

!begin-bullets-2!

-   !begin-bullet!
    Fixed bug introduced in 1.3.1, where promise domains that are active
    at promise resolution time stay active during handler callback, even
    if they weren't active when the handler was registered. This was
    causing stack overflow for long promise chains with many active
    promise domains. (#115)
    !end-bullet!

!end-bullets-2!

# promises 1.3.1

!begin-bullets-3!

-   !begin-bullet!
    Fixed bug where promise domains were forgotten when handlers were
    registered from within other handlers. (#110)
    !end-bullet!

!end-bullets-3!

# promises 1.3.0

!begin-bullets-4!

-   !begin-bullet!
    `is.promising` is now an S3 method. (#104)
    !end-bullet!

!end-bullets-4!

# promises 1.2.1

!begin-bullets-5!

-   !begin-bullet!
    `future_promise()` received a speed improvement when submitting many
    requests with a minimal number of `{future}` workers. If
    `future_promise()` runs out of available `{future}` workers, then
    `future_promise()` will preemptively return for the remainder of the
    current `{later}` execution. While it is possible for `{future}` to
    finish a job before submitting all of the `future_promise()`
    requests, the time saved by not asking `{future}`'s worker
    availability will be faster overall than if a few jobs were
    submitted early. (#78)

    !end-bullet!
-   !begin-bullet!
    Fixed #86: `future_promise()` spuriously reports unhandled errors.
    (#90)

    !end-bullet!
-   !begin-bullet!
    Move `{fastmap}` from `Suggests` to `Imports` for better `{renv}`
    discovery. (#87)

    !end-bullet!

!end-bullets-5!

# promises 1.2.0.1

!begin-bullets-6!

-   !begin-bullet!
    Added `future_promise()` which returns a `promise` that executes the
    expression using `future::future()`. `future_promise()` should
    (typically) be a drop-in replacement for any `future::future()`
    function call. `future_promise()` will not execute `future` work
    faster than `future::future()`, but `future_promise()` will only
    submit `future` jobs if a worker is available. If no workers are
    available, `future_promise()` will hold the expression information
    in a `promise` until a worker does become available to better take
    advantage of computing resources available to the main R session.
    For more information, please see the `future_promise()` article.
    (#62)

    !end-bullet!
-   !begin-bullet!
    Added visibility support for `Promise$then(onFulfilled)`. (#59)

    !end-bullet!

!end-bullets-6!

# promises 1.1.1

!begin-bullets-7!

-   !begin-bullet!
    Fix handling of FutureErrors during `future::resolved()` and
    `future::value()` by discarding the corrupt future. (#37)
    !end-bullet!

!end-bullets-7!

# promises 1.1.0

!begin-bullets-8!

-   !begin-bullet!
    Fixed #49: `promise_all()` previously did not handle `NULL` values
    correctly. (#50))

    !end-bullet!
-   !begin-bullet!
    `new_promise_domain` now takes a `wrapOnFinally` argument, which can
    be used to intercept registration of `finally()`. Previous versions
    treated `finally` as passing the same callback to
    `then(onFulfilled=..., onRejected=...)`, and ignoring the result;
    for backward compatibility, promise domains will still treat
    `finally` that way by default (i.e. if `wrapOnFinally` is `NULL`,
    then `finally` will result in `wrapOnFulfilled` and `wrapOnRejected`
    being called, but if `wrapOnFinally` is provided then only
    `wrapOnFinally` will be called). (#43)

    !end-bullet!

!end-bullets-8!

# promises 1.0.1

!begin-bullets-9!

-   !begin-bullet!
    Initial CRAN release
    !end-bullet!

!end-bullets-9!

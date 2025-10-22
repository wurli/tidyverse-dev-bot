# promises (development version)

# promises 1.4.0

## Breaking changes

!begin-bullets-1!

-   !begin-bullet!
    Nested promise domains now correctly invoke in reverse order.
    Previously, when promise domains were nested, the outer domain would
    incorrectly take precedence over the inner domain in
    `wrapOnFulfilled`/`wrapOnRejected` callbacks. The innermost (most
    recently added) domain now properly wraps the callback first,
    ensuring that nested promise domains behave consistently with the
    expected scoping behavior. (#165)
    !end-bullet!

!end-bullets-1!

## New features

!begin-bullets-2!

-   !begin-bullet!
    `hybrid_then()` synchronously or asynchronously executes
    success/failure callbacks based on whether the input is a promise or
    a regular value. This function is useful for writing code that can
    handle both synchronous and asynchronous inputs seamlessly. (#192)

    !end-bullet!
-   !begin-bullet!
    `then()` gains a `tee` parameter. When `tee = TRUE`, `then()`
    ignores the return value of the callback and returns the original
    value instead. This is useful for performing operations with
    side-effects, particularly logging to the console or a file.
    `finally()` does not support `tee` as the return value is always
    ignored. (#148)

    !end-bullet!

!end-bullets-2!

### OpenTelemetry integration

promises now integrates with the otel package to provide observability
and tracing for asynchronous operations. OpenTelemetry integration is
experimental and subject to change.

!begin-bullets-3!

-   !begin-bullet!
    `with_ospan_async()` creates an OpenTelemetry span, executes the
    given expression within it, and ends the span. This function handles
    both synchronous and asynchronous (promise-based) operations. For
    promises, the span is automatically ended when the promise resolves
    or rejects. To access the OpenTelemetry span within your expression,
    use `otel::get_current_span()`. (#173)

    !end-bullet!
-   !begin-bullet!
    `with_ospan_promise_domain()` creates a promise domain that restores
    the currently active OpenTelemetry span from when a call to `then()`
    is executed. This enables proper tracing context across asynchronous
    operations. (#173)

    !end-bullet!
-   !begin-bullet!
    `local_ospan_promise_domain()` adds an OpenTelemetry span promise
    domain to the local scope. This is useful for `{coro}` operations
    where encapsulating the coro operations inside `with_*()` methods is
    not allowed. (#179)

    !end-bullet!

!end-bullets-3!

## Minor improvements and fixes

!begin-bullets-4!

-   !begin-bullet!
    promises now requires R 4.1 or later. R's native pipe (`|>`) and
    function shorthand (`\(x) fn(x)`) syntax are now preferred over
    promise pipe methods. The promise pipe methods (`%...>%`, `%...!%`,
    `%...T>%`) are now superseded in favor of the R syntax supported in
    R 4.1 or later. (#148)

    !end-bullet!
-   !begin-bullet!
    `catch()` API updated from `catch(promise, onRejected, tee = FALSE)`
    to `catch(promise, onRejected, ..., tee = FALSE)`. The `tee`
    parameter must now be specified as a keyword argument. (#148)

    !end-bullet!
-   !begin-bullet!
    `then(tee=)` and `catch(tee=)` now require a logical value (not just
    a truthy value). (#156)

    !end-bullet!
-   !begin-bullet!
    promises is now a pure R package that does not require compilation.
    We include a test of a C++ interface in `inst/promise_task.cpp` that
    is now dynamically compiled during testing. (#154)

    !end-bullet!
-   !begin-bullet!
    `promise_all()` performance improved by using a counter instead of
    checking completion status of all promises. This changes the time
    complexity from `O(n^2)` to `O(n)` for determining when all promises
    are complete. (#163)

    !end-bullet!
-   !begin-bullet!
    `promise_all()` now preserves duplicate named arguments (or `.list`
    entries). A result will be produced for every promise provided.
    (#163)

    !end-bullet!
-   !begin-bullet!
    `promise_map()` now properly handles `NULL` values being returned.
    (Thank you, @RLesur! #47)

    !end-bullet!
-   !begin-bullet!
    promises no longer imports base packages in DESCRIPTION. (Thank you,
    @shikokuchuo! #186)

    !end-bullet!

!end-bullets-4!

# promises 1.3.3

!begin-bullets-5!

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

!end-bullets-5!

# promises 1.3.2

!begin-bullets-6!

-   !begin-bullet!
    Fixed bug introduced in 1.3.1, where promise domains that are active
    at promise resolution time stay active during handler callback, even
    if they weren't active when the handler was registered. This was
    causing stack overflow for long promise chains with many active
    promise domains. (#115)
    !end-bullet!

!end-bullets-6!

# promises 1.3.1

!begin-bullets-7!

-   !begin-bullet!
    Fixed bug where promise domains were forgotten when handlers were
    registered from within other handlers. (#110)
    !end-bullet!

!end-bullets-7!

# promises 1.3.0

!begin-bullets-8!

-   !begin-bullet!
    `is.promising` is now an S3 method. (#104)
    !end-bullet!

!end-bullets-8!

# promises 1.2.1

!begin-bullets-9!

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

!end-bullets-9!

# promises 1.2.0.1

!begin-bullets-10!

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

!end-bullets-10!

# promises 1.1.1

!begin-bullets-11!

-   !begin-bullet!
    Fix handling of FutureErrors during `future::resolved()` and
    `future::value()` by discarding the corrupt future. (#37)
    !end-bullet!

!end-bullets-11!

# promises 1.1.0

!begin-bullets-12!

-   !begin-bullet!
    Fixed #49: `promise_all()` previously did not handle `NULL` values
    correctly. (#50)

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

!end-bullets-12!

# promises 1.0.1

!begin-bullets-13!

-   !begin-bullet!
    Initial CRAN release
    !end-bullet!

!end-bullets-13!

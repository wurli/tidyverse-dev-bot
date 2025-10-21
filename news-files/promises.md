# promises (development version)

## Breaking changes

* Fixed #165: Nested promise domains now correctly invoke in reverse order. Previously, when promise domains were nested, the outer domain would incorrectly take precedence over the inner domain in `wrapOnFulfilled`/`wrapOnRejected` callbacks. This has been fixed so that the innermost (most recently added) domain now properly wraps the callback first, ensuring that nested promise domains behave consistently with the expected scoping behavior. (#166)

## Enhancements

* Promoted usage of R's native pipe (`|>`) and function shorthand (`\(x) fn(x)`) syntax over promise pipe methods. The promise pipe methods (`%...>%`, `%...!%`, `%...T>%`) are now superseded in favor of the R syntax supported in R 4.1 or later. Promises now requires R 4.1 or later to access these language features. (#148)

* Added `hybrid_then()` function that will synchronously or asynchronously execute a success/failure callbacks based on whether the input is a promise or a regular value. This function is useful for writing code that can handle both synchronous and asynchronous inputs seamlessly. (#192)

* Added `tee=FALSE` parameter to `then()`. When `tee=TRUE`, `then()` will ignore the return value of the callback, and return the original value instead. This is useful for performing operations with side-effects, particularly logging to the console or a file. Adding this parameter gives parity to `catch(tee=)`. `finally()` does not support `tee=` as the return value is always ignored. (#148)

* Updated `catch()` API from `catch(promise, onRejected, tee = FALSE)` to `catch(promise, onRejected, ..., tee = FALSE)`. It requires that `tee=` be specified as a keyword argument. (#148)

* Fixed #156: `then(tee=)` and `catch(tee=)` is now required to be a logical value (not just a *truthy* value). (#157)

* Fixed #154: Makes promises a pure R package that does not require compilation. We include a test of a C++ interface in `inst/promise_task.cpp` that is now dynamically compiled during testing. (#155)

* Fixed #47: `promise_map()` can now properly handle `NULL` values being returned. (Thank you, @RLesur! #138)

* Improved performance of `promise_all()` by using a counter instead of checking completion status of all promises. This changes the time complexity from `O(n^2)` to `O(n)` for determining when all promises are complete. (#163)

* Fixed a bug in `promise_all()` where duplicate named arguments (or `.list` entries) were not preserved. Now, a result will be produced for every promise provided. (#163)


# promises 1.3.3

* Changed the way we create future objects to stay compatible with new versions of `{future}`. Apparently the way we were doing it was never idiomatic and only worked by accident. (#121)

* Fixed #122: Use `future::future(..., lazy = TRUE)` to avoid manual capturing of state within `future_promise` (Thank you, @HenrikBengtsson! #123)


# promises 1.3.2

* Fixed bug introduced in 1.3.1, where promise domains that are active at promise resolution time stay active during handler callback, even if they weren't active when the handler was registered. This was causing stack overflow for long promise chains with many active promise domains. (#115)


# promises 1.3.1

* Fixed bug where promise domains were forgotten when handlers were registered from within other handlers. (#110)


# promises 1.3.0

* `is.promising` is now an S3 method. (#104)


# promises 1.2.1

* `future_promise()` received a speed improvement when submitting many requests with a minimal number of `{future}` workers. If `future_promise()` runs out of available `{future}` workers, then `future_promise()` will preemptively return for the remainder of the current `{later}` execution. While it is possible for `{future}` to finish a job before submitting all of the `future_promise()` requests, the time saved by not asking `{future}`'s worker availability will be faster overall than if a few jobs were submitted early. (#78)

* Fixed #86: `future_promise()` spuriously reports unhandled errors. (#90)

* Move `{fastmap}` from `Suggests` to `Imports` for better `{renv}` discovery. (#87)


# promises 1.2.0.1

* Added `future_promise()` which returns a `promise` that executes the expression using `future::future()`. `future_promise()` should (typically) be a drop-in replacement for any `future::future()` function call. `future_promise()` will not execute `future` work faster than `future::future()`, but `future_promise()` will only submit `future` jobs if a worker is available. If no workers are available, `future_promise()` will hold the expression information in a `promise` until a worker does become available to better take advantage of computing resources available to the main R session. For more information, please see the [`future_promise()` article](https://rstudio.github.io/promises/articles/promises_05b_future_promise.html). (#62)

* Added visibility support for `Promise$then(onFulfilled)`. (#59)

# promises 1.1.1

* Fix handling of FutureErrors during `future::resolved()` and `future::value()` by discarding the corrupt future. (#37)


# promises 1.1.0

* Fixed #49: `promise_all()` previously did not handle `NULL` values correctly. (#50))

* `new_promise_domain` now takes a `wrapOnFinally` argument, which can be used to intercept registration of `finally()`. Previous versions treated `finally` as passing the same callback to `then(onFulfilled=..., onRejected=...)`, and ignoring the result; for backward compatibility, promise domains will still treat `finally` that way by default (i.e. if `wrapOnFinally` is `NULL`, then `finally` will result in `wrapOnFulfilled` and `wrapOnRejected` being called, but if `wrapOnFinally` is provided then only `wrapOnFinally` will be called). (#43)


# promises 1.0.1

* Initial CRAN release

# httr2 (development version)

!begin-bullets-1!

-   !begin-bullet!
    `req_timeout()` now resets the value of `connecttimeout` set by
    curl. This ensures that you can use `req_timeout()` to increase the
    connection timeout past 10s (#395).

    !end-bullet!
-   !begin-bullet!
    `req_retry()` gives a clearer error if `after` returns the wrong
    type of value (#385).

    !end-bullet!
-   !begin-bullet!
    `req_template()` now works when you have a bare `:` in a template
    that uses "uri" style (#389).

    !end-bullet!

!end-bullets-1!

# httr2 1.0.0

## Function lifecycle

!begin-bullets-2!

-   !begin-bullet!
    `local_mock()` and `with_mock()` have been deprecated in favour of
    `local_mocked_responses()` and `with_mocked_responses()` (#301).

    !end-bullet!
-   !begin-bullet!
    `multi_req_perform()` is deprecated in favour of
    `req_perform_parallel()`. `req_stream()` is deprecated in favour of
    `req_perform_stream()` (#314).

    !end-bullet!
-   !begin-bullet!
    `oauth_flow_auth_code()` deprecates `host_name` and `port` arguments
    in favour of using `redirect_uri`. It also deprecates `host_ip`
    since it seems unlikely that changing this is ever useful.

    !end-bullet!
-   !begin-bullet!
    `oauth_flow_auth_code_listen()` now takes a single `redirect_uri`
    argument instead of separate `host_ip` and `port` arguments. This is
    a breaking change but I don't expect anyone to call this function
    directly (which was confirmed by a GitHub search) so I made the
    change without deprecation.

    !end-bullet!
-   !begin-bullet!
    `req_body_form()` and `req_body_multipart()` now require data `...`;
    they no longer accept a single list for compatibility with the 0.1.0
    API.

    !end-bullet!

!end-bullets-2!

## Multiple requests

!begin-bullets-3!

-   !begin-bullet!
    New `req_perform_sequential()` performs a known set of requests
    sequentially. It has an interface similar to
    `req_perform_parallel()` but with no limitations, and the cost of
    being slower (#361).

    !end-bullet!
-   !begin-bullet!
    New `req_perform_iterative()` performs multiple requests, where each
    request is derived from the previous response (@mgirlich, #8).

    !end-bullet!
-   !begin-bullet!
    `req_perform_parallel()` replaces `multi_req_perform()` to match the
    new naming scheme (#314). It gains a `progress` argument.

    !end-bullet!
-   !begin-bullet!
    `req_perform_iterative()`, `req_perform_parallel()`, and
    `req_perform_sequential()` share a new error handling strategy. By
    default, errors will be bubbled up, but you can choose an
    alternative strategy with the `on_error` argument (#372).

    !end-bullet!
-   !begin-bullet!
    A new family of functions `resps_successes()`, `resps_failures()`,
    `resps_requests()` and `resps_data()` make it easier to work with
    lists of responses (#357). Behind the scenes, these work because the
    request is now stored in the response (or error) object (#357).

    !end-bullet!
-   !begin-bullet!
    `resp_body_json()` and `resp_body_xml()` now cache the parsed values
    so that you can use them repeatedly without worrying about the
    performance cost. This supports the design `req_perform_iterative()`
    by avoiding the need to carefully pass around a parsed object.

    !end-bullet!

!end-bullets-3!

## OAuth features

!begin-bullets-4!

-   !begin-bullet!
    A new `vignette("oauth")` gives many more details about how OAuth
    works and how to use it with httr2 (#234), and the OAuth docs have
    been overhauled to make it more clear that you should use
    `req_oauth_*()`, not `oauth_*()` (#330).

    !end-bullet!
-   !begin-bullet!
    If you are using an OAuth token with a refresh token, and that
    refresh token has expired, then httr2 will now re-run the entire
    flow to get you a new token (#349).

    !end-bullet!
-   !begin-bullet!
    New `oauth_cache_path()` returns the path that httr2 uses for
    caching OAuth tokens. Additionally, you can now change the cache
    location by setting the `HTTR2_OAUTH_CACHE` env var. This is now
    more obvious to the user, because httr2 now informs the user
    whenever a token is cached.

    !end-bullet!
-   !begin-bullet!
    `oauth_flow_auth_code()` gains a `redirect_uri` argument rather than
    deriving this URL automatically from the `host_name` and `port`
    (#248). It uses this argument to automatically choose which strategy
    to use to get the\
    auth code, either launching a temporary web server or, new, allowing
    you to manually enter the details with the help of a custom JS/HTML
    page hosted elsewhere, or by copying and pasting the URL you're
    redirected to (@fh-mthomson, #326). The temporary web server now
    also respects the path component of `redirect_uri`, if the API needs
    a specific path (#149).

    !end-bullet!
-   !begin-bullet!
    New `oauth_token_cached()` allows you to get an OAuth token while
    still taking advantage of httr2's caching and auto-renewal features.
    For expert use only (#328).

    !end-bullet!

!end-bullets-4!

## Other new features

!begin-bullets-5!

-   !begin-bullet!
    @mgirlich is now a httr2 contributor in recognition of his many
    contributions.

    !end-bullet!
-   !begin-bullet!
    `req_cache()` gains `max_n`, `max_size`, and `max_age` arguments to
    automatically prune the cache. By default, the cache will stay under
    1 GB (#207).

    !end-bullet!
-   !begin-bullet!
    New `req_body_json_modify()` allows you to iteratively modify a JSON
    body of a request.

    !end-bullet!
-   !begin-bullet!
    New `req_cookie_preserve()` lets you use a file to share cookies
    across requests (#223).

    !end-bullet!
-   !begin-bullet!
    New `req_progress()` adds a progress bar to long downloads or
    uploads (#20).

    !end-bullet!
-   !begin-bullet!
    New `resp_check_content_type()` to check response content types
    (#190). `resp_body_json()` and friends give better errors if no
    `Content-Type` header is present in the response (#284).

    !end-bullet!
-   !begin-bullet!
    New `resp_has_body()` returns a `TRUE` or `FALSE` depending on
    whether or not the response has a body (#205).

    !end-bullet!
-   !begin-bullet!
    New `resp_url()`, `resp_url_path()`, `resp_url_queries()` and
    `resp_url_query()` to extract various part of the response url
    (#57).

    !end-bullet!
-   !begin-bullet!
    `req_url_query()` gains a `.multi` parameter that controls what
    happens when you supply multiple values in a vector. The default
    will continue to error but you can use `.multi = "comma"` to
    separate with commas, `"pipe"` to separate with `|`, and `"explode"`
    to generate one parameter for each value (e.g. `?a=1&a=2`) (#350).

    !end-bullet!
-   !begin-bullet!
    New `secret_encrypt_file()` and `secret_decrypt_file()` for
    encrypting and decrypting files (#237).

    !end-bullet!

!end-bullets-5!

## Minor improvements and bug fixes

!begin-bullets-6!

-   !begin-bullet!
    The httr2 examples now only run on R 4.2 and later so that we can
    use the base pipe and lambda syntax (#345).

    !end-bullet!
-   !begin-bullet!
    OAuth errors containing a url now correctly display that URL
    (instead of the string "uri").

    !end-bullet!
-   !begin-bullet!
    `curl_translate()` now uses the base pipe, and produces escapes with
    single quotes or raw strings in case double quotes can't be used
    (@mgirlich, #264). It gains the argument `simplify_headers` that
    removes some common but unimportant headers, like `Sec-Fetch-Dest`
    or `sec-ch-ua-mobile` (@mgirlich, #256). It also parses the query
    components of the url (@mgirlich, #259) and works with multiline
    commands from the clipboard (@mgirlich, #254).

    !end-bullet!
-   !begin-bullet!
    `local_mocked_responses()` and `with_mocked_responses()` now accept
    a list of responses which will be returned in sequence. They also
    now correctly trigger errors when the mocked response represents an
    HTTP failure (#252).

    !end-bullet!
-   !begin-bullet!
    `oauth_flow_refresh()` now only warns, not errors, if the
    `refresh_token` changes, making it a little easier to use in manual
    workflows (#186).

    !end-bullet!
-   !begin-bullet!
    `obfuscated()` values now display their original call when printed.

    !end-bullet!
-   !begin-bullet!
    `req_body_json()` gains custom content `type` argument and respects
    custom content-type set in header (@mgirlich, #189).

    !end-bullet!
-   !begin-bullet!
    `req_cache()` now combine the headers of the new response with the
    headers of the cached response. In particular, this fixes
    `resp_body_json/xml/html()` on cached responses (@mgirlich, #277).

    !end-bullet!
-   !begin-bullet!
    `req_perform()` now throws error with class
    `httr2_failure/httr2_error` if the request fails, and that error now
    captures the curl error as the parent. If the request succeeds, but
    the response is an HTTP error, that error now also has super class
    `httr2_error`. This means that all errors thrown by httr2 now
    inherit from the `httr2_error` class. See new docs in `?req_error()`
    for more details.

    !end-bullet!
-   !begin-bullet!
    `req_perform()`'s progress bar can be suppressed by setting
    `options(httr2_progress = FALSE)` (#251). Progress bars displayed
    while waiting for some time to pass now tell you why they're waiting
    (#206).

    !end-bullet!
-   !begin-bullet!
    `req_oauth_bearer_jwt()` now includes the claim in the cache key
    (#192).

    !end-bullet!
-   !begin-bullet!
    `req_oauth_device()` now takes a `auth_url` parameter making it
    usable (#331, @taerwin).

    !end-bullet!
-   !begin-bullet!
    `req_url_query()` gains a `.multi` parameter that controls what
    happens when you supply multiple values in a vector. The default
    will continue to error but you can use `.multi = "comma"` to
    separate with commas, `"pipe"` to separate with `|`, and `"explode"`
    to generate one parameter for each value (e.g. `?a=1&a=2`) (#350).

    !end-bullet!

!end-bullets-6!

# httr2 0.2.3

!begin-bullets-7!

-   !begin-bullet!
    New `example_url()` to launch a local server, making tests and
    examples more robust.

    !end-bullet!
-   !begin-bullet!
    New `throttle_status()` to make it a little easier to verify what's
    happening with throttling.

    !end-bullet!
-   !begin-bullet!
    `req_oauth_refresh()` now respects the `refresh_token` for caching
    (@mgirlich, #178).

    !end-bullet!
-   !begin-bullet!
    `req_perform()` now always sleeps before a request, rather than
    after it. It also gains an `error_call` argument and communicates
    more clearly where the error occurred (@mgirlich, #187).

    !end-bullet!
-   !begin-bullet!
    `req_url_path()` and `req_url_path_append()` can now handle `NULL`
    or empty `...` and the elements of `...` can also have length \> 1
    (@mgirlich, #177).

    !end-bullet!
-   !begin-bullet!
    `sys_sleep()` (used by `req_retry()` and `req_throttle()`) gains a
    progress bar (#202).

    !end-bullet!

!end-bullets-7!

# httr2 0.2.2

!begin-bullets-8!

-   !begin-bullet!
    `curl_translate()` can now handle curl copied from Chrome developer
    tools (@mgirlich, #161).

    !end-bullet!
-   !begin-bullet!
    `req_oauth_*()` can now refresh OAuth tokens. One, two, or even more
    times! (@jennybc, #166)

    !end-bullet!
-   !begin-bullet!
    `req_oauth_device()` can now work in non-interactive environments,
    as intendend (@flahn, #170)

    !end-bullet!
-   !begin-bullet!
    `req_oauth_refresh()` and `oauth_flow_refresh()` now use the envvar
    `HTTR2_REFRESH_TOKEN`, not `HTTR_REFRESH_TOKEN` (@jennybc, #169).

    !end-bullet!
-   !begin-bullet!
    `req_proxy()` now uses the appropriate authentication option
    (@jl5000).

    !end-bullet!
-   !begin-bullet!
    `req_url_query()` can now opt out of escaping with `I()` (@boshek,
    #152).

    !end-bullet!
-   !begin-bullet!
    Can now print responses where content type is the empty string
    (@mgirlich, #163).

    !end-bullet!

!end-bullets-8!

# httr2 0.2.1

!begin-bullets-9!

-   !begin-bullet!
    "Wrapping APIs" is now an article, not a vignette.

    !end-bullet!
-   !begin-bullet!
    `req_template()` now appends the path instead of replacing it
    (@jchrom, #133)

    !end-bullet!

!end-bullets-9!

# httr2 0.2.0

## New features

!begin-bullets-10!

-   !begin-bullet!
    `req_body_form()`, `req_body_multipart()`, and `req_url_query()` now
    support multiple arguments with the same name (#97, #107).

    !end-bullet!
-   !begin-bullet!
    `req_body_form()`, `req_body_multipart()`, now match the interface
    of `req_url_query()`, taking name-value pairs in `...`. Supplying a
    single `list()` is now deprecated and will be removed in a future
    version.

    !end-bullet!
-   !begin-bullet!
    `req_body_json()` now overrides the existing JSON body, rather than
    attempting to merge with the previous value (#95, #115).

    !end-bullet!
-   !begin-bullet!
    Implement `req_proxy()` (owenjonesuob, #77).

    !end-bullet!

!end-bullets-10!

## Minor improvements and bug fixes

!begin-bullets-11!

-   !begin-bullet!
    `httr_path` class renamed to `httr2_path` to correctly match package
    name (#99).

    !end-bullet!
-   !begin-bullet!
    `oauth_flow_device()` gains PKCE support (@flahn, #92), and the
    interactive flow is a little more user friendly.

    !end-bullet!
-   !begin-bullet!
    `req_error()` can now correct force successful HTTP statuses to fail
    (#98).

    !end-bullet!
-   !begin-bullet!
    `req_headers()` will now override `Content-Type` set by
    `req_body_*()` (#116).

    !end-bullet!
-   !begin-bullet!
    `req_throttle()` correctly sets throttle rate (@jchrom, #101).

    !end-bullet!
-   !begin-bullet!
    `req_url_query()` never uses scientific notation for queries (#93).

    !end-bullet!
-   !begin-bullet!
    `req_perform()` now respects `httr::with_verbose()` (#85).

    !end-bullet!
-   !begin-bullet!
    `response()` now defaults `body` to `raw(0)` for consistency with
    real responses (#100).

    !end-bullet!
-   !begin-bullet!
    `req_stream()` no longer throws an error for non 200 http status
    codes (@DMerch, #137)

    !end-bullet!

!end-bullets-11!

# httr2 0.1.1

!begin-bullets-12!

-   !begin-bullet!
    Fix R CMD check failures on CRAN

    !end-bullet!
-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.

    !end-bullet!

!end-bullets-12!
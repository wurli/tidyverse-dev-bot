# httr2 (development version)

!begin-bullets-1!

-   !begin-bullet!
    `req_perform_parallel()` handles `progress` argument consistently
    with other functions (#726).
    !end-bullet!
-   !begin-bullet!
    `req_error()` errors with long bodies are now correctly wrapped
    (#727).
    !end-bullet!
-   !begin-bullet!
    `req_perform_stream()` has been soft deprecated.
    !end-bullet!
-   !begin-bullet!
    Deprecated functions `mutli_req_perform()`, `req_stream()`,
    `with_mock()` and `local_mock()` hav been removed. Deprecated
    arguments `req_perform_parallel(pool)` and
    `req_oauth_auth_code(host_name, host_ip, port)`/
    `oauth_flow_auth_code(host_name, host_ip, port)` have been removed.
    !end-bullet!
-   !begin-bullet!
    `req_body_json()` and `req_body_form()` correctly unobfuscated
    inputs, as documented (#754).
    !end-bullet!
-   !begin-bullet!
    `req_perform_iterative()`, `req_perform_sequential()`,
    `req_perform_parallel()`, and `req_perform_promise()` now support
    mocking (#651).
    !end-bullet!
-   !begin-bullet!
    `new_response()` is now exported (#751).
    !end-bullet!
-   !begin-bullet!
    URL construction is now powered by `curl::curl_modify_url()`, and
    hence now (correctly) escapes the `path` component (#732). This
    means that `req_url_path()` now can only affect the path component
    of the URL, not the query params or fragment.
    !end-bullet!
-   !begin-bullet!
    Redacted headers are no longer serialized to disk. This is important
    since it makes it harder to accidentally leak secrets to files on
    disk, but comes at a cost: you can longer perform such requests that
    have been saved and reloaded (#721).
    !end-bullet!
-   !begin-bullet!
    New `req_get_method()` and `req_get_body()` allow you to do some
    limited prediction of what a request *will* do when it's performed
    (#718).
    !end-bullet!
-   !begin-bullet!
    Functions that capture interrutps (like `req_perform_parallel()` and
    friends) are now easier to escape if they're called inside a loop:
    you can press Ctrl + C twice to guarantee an exit (#1810).
    !end-bullet!
-   !begin-bullet!
    New `last_request_json()` and `last_response_json()` to conveniently
    see JSON bodies (#734).
    !end-bullet!
-   !begin-bullet!
    `req_body_json_modify()` can now be used on a request with an empty
    body.
    !end-bullet!
-   !begin-bullet!
    `resp_timing()` exposes timing information about the request
    measured by libcurl (@arcresu, #725).
    !end-bullet!
-   !begin-bullet!
    `req_url_query()` now re-calculates n lengths when using
    `.multi = "explode"` to avoid select/recycling issues (@Kevanness,
    #719).
    !end-bullet!

!end-bullets-1!

# httr2 1.1.2

!begin-bullets-2!

-   !begin-bullet!
    `req_headers()` more carefully checks its input types (#707).
    !end-bullet!
-   !begin-bullet!
    Fix AWS request signing due to `argument 'cache' is missing` error
    (#706, @jcheng5).
    !end-bullet!

!end-bullets-2!

# httr2 1.1.1

## New features

!begin-bullets-3!

-   !begin-bullet!
    `req_perform_parallel()` lifts many of the previous restrictions. It
    supports simplified versions of `req_throttle()` and `req_retry()`,
    can refresh OAuth tokens, and checks the cache before/after each
    request. (#681).
    !end-bullet!
-   !begin-bullet!
    Default verbosity can be controlled by the `HTTR2_VERBOSITY`
    environment variable (#687).
    !end-bullet!
-   !begin-bullet!
    `local_verbosity()` matches the existing `with_verbosity()` and
    allows for local control of verbosity (#687).
    !end-bullet!
-   !begin-bullet!
    `req_dry_run()` and `req_verbose()` display compressed correctly
    (#91, #656) and automatically prettify JSON bodies (#668). You can
    suppress prettification with `options(httr2_pretty_json = FALSE)`
    (#668).
    !end-bullet!
-   !begin-bullet!
    `req_throttle()` implements a new "token bucket" algorithm that
    maintains average rate limits while allowing bursts of higher
    request rates.
    !end-bullet!

!end-bullets-3!

## Minor improvements and bug fixes

!begin-bullets-4!

-   !begin-bullet!
    `aws_v4_signature()` correctly processes URLs containing query
    parameters (@jeffreyzuber, #645).
    !end-bullet!
-   !begin-bullet!
    `oauth_client()` and `oauth_token()` implement improved print
    methods with bulleted lists, similar to other httr2 objects, and
    `oauth_client()` with custom `auth` functions no longer produces
    errors (#648).
    !end-bullet!
-   !begin-bullet!
    `req_dry_run()` omits headers that would vary in tests and can
    prettify JSON output.
    !end-bullet!
-   !begin-bullet!
    `req_headers()` automatically redacts `Authorization` headers (#649)
    and correctly implements case-insensitive modification of existing
    headers (#682).
    !end-bullet!
-   !begin-bullet!
    `req_headers_redacted()` now supports dynamic dots (#647).
    !end-bullet!
-   !begin-bullet!
    `req_oauth_auth_code()` no longer adds trailing "/" characters to
    properly formed `redirect_uri` values (@jonthegeek, #646).
    !end-bullet!
-   !begin-bullet!
    `req_perform_connection()` produces more helpful error messages when
    requests fail at the networking level.
    !end-bullet!
-   !begin-bullet!
    `req_perform_parallel(pool)` now is deprecated in favour of a new
    `max_active` argument (#681).
    !end-bullet!
-   !begin-bullet!
    `req_user_agent()` memoizes the default user agent to improve
    performance, as computing version numbers is relatively slow (300
    µs).
    !end-bullet!
-   !begin-bullet!
    `resp_link_url()` once again respects the case insensitivity for
    header names (@DavidRLovell, #655).
    !end-bullet!
-   !begin-bullet!
    `resp_stream_sse()` automatically retrieves the next event when the
    current event contains no data, and returns data as a single string
    (#650).
    !end-bullet!
-   !begin-bullet!
    `str()` correctly redacts redacted headers (#682).
    !end-bullet!

!end-bullets-4!

# httr2 1.1.0

## Lifecycle changes

!begin-bullets-5!

-   !begin-bullet!
    `req_perform_stream()` is superseded in favor of
    `req_perform_connection()`, which is no longer experimental (#625).

    !end-bullet!
-   !begin-bullet!
    `with_mock()` and `local_mock()` are defunct and will be removed in
    the next release.

    !end-bullet!

!end-bullets-5!

## New features

!begin-bullets-6!

-   !begin-bullet!
    `is_online()` wraps `curl::has_internet()`, making it easy to tell
    if you're currently online (#512).

    !end-bullet!
-   !begin-bullet!
    `req_headers_redacted()` makes it easier to redact sensitive headers
    (#561).

    !end-bullet!
-   !begin-bullet!
    `req_retry()` implements "circuit breaking", which immediatelys
    error after multiple failures to the same server (e.g. because the
    server is down) (#370).

    !end-bullet!
-   !begin-bullet!
    `req_url_relative()` navigates to a relative URL (#449).

    !end-bullet!
-   !begin-bullet!
    `resp_request()` returns the request associated with a response;
    this can be useful when debugging (#604).

    !end-bullet!
-   !begin-bullet!
    `resp_stream_is_complete()` checks if data remains in the stream
    (#559).

    !end-bullet!
-   !begin-bullet!
    `url_modify()`, `url_modify_query()`, and `url_modify_relative()`
    modify URLs (#464); `url_query_parse()` and `url_query_build()`
    parse and build query strings (#425).

    !end-bullet!

!end-bullets-6!

## Bug fixes and minor improvements

!begin-bullets-7!

-   !begin-bullet!
    OAuth response parsing errors now have a dedicated
    `httr2_oauth_parse` error class that includes the original response
    object (@atheriel, #596).

    !end-bullet!
-   !begin-bullet!
    `curl_translate()` converts cookie headers to `req_cookies_set()`
    (#431) and JSON data to `req_body_json_modify()` calls (#258).

    !end-bullet!
-   !begin-bullet!
    `print.request()` escapes `{}` in headers (#586).

    !end-bullet!
-   !begin-bullet!
    `req_auth_aws_v4()` formats the AWS Authorization header correctly
    (#627).

    !end-bullet!
-   !begin-bullet!
    `req_retry()` defaults to `max_tries = 2` when nethier `max_tries`
    nor `max_seconds` is set. If you want to disable retries, set
    `max_tries = 1`.

    !end-bullet!
-   !begin-bullet!
    `req_perform_connection()` gains a `verbosity` argument, which is
    useful for understanding exactly how data is streamed back to you
    (#599). `req_perform_promise()` also gains a `verbosity` argument.

    !end-bullet!
-   !begin-bullet!
    `req_url_query()` can control how spaces are encoded with `.space`
    (#432).

    !end-bullet!
-   !begin-bullet!
    `resp_link_url()` handles multiple `Link` headers (#587).

    !end-bullet!
-   !begin-bullet!
    `resp_stream_sse()` will warn if it recieves a partial event.

    !end-bullet!
-   !begin-bullet!
    `url_parse()` parses relative URLs with new `base_url` argument
    (#449) and the uses faster and more correct `curl::curl_parse_url()`
    (#577).

    !end-bullet!

!end-bullets-7!

# httr2 1.0.7

!begin-bullets-8!

-   !begin-bullet!
    `req_perform_promise()` upgraded to use event-driven async based on
    waiting efficiently on curl socket activity (#579).
    !end-bullet!
-   !begin-bullet!
    New `req_oauth_token_exchange()` and `oauth_flow_token_exchange()`
    functions implement the OAuth token exchange protocol from RFC 8693
    (@atheriel, #460).
    !end-bullet!

!end-bullets-8!

# httr2 1.0.6

!begin-bullets-9!

-   !begin-bullet!
    Fix stochastic test failure, particularly on CRAN (#572)
    !end-bullet!
-   !begin-bullet!
    New `oauth_cache_clear()` is an exported end point to clear the
    OAuth cache.
    !end-bullet!
-   !begin-bullet!
    New `req_auth_aws_v4()` signs request using AWS's special format
    (#562, #566).
    !end-bullet!
-   !begin-bullet!
    `req_cache()` no longer retrieves anything but `GET` requests from
    the cache.
    !end-bullet!
-   !begin-bullet!
    New `resp_stream_aws()` to retrieve AWS's special streaming format.
    With thanks to https://github.com/lifion/lifion-aws-event-stream/
    for a simple reference implementation.
    !end-bullet!

!end-bullets-9!

# httr2 1.0.5

!begin-bullets-10!

-   !begin-bullet!
    `req_perform_parallel()` and `req_perform_promise()` now correctly
    set up the method and body (#549).
    !end-bullet!

!end-bullets-10!

# httr2 1.0.4

!begin-bullets-11!

-   !begin-bullet!
    `req_body_file()` now works with files \>64kb once more (#524) and
    no longer leaks a connection if the response doesn't complete
    succesfully (#534).
    !end-bullet!
-   !begin-bullet!
    `req_body_*()` now give informative error if you attempt to change
    the body type (#451).
    !end-bullet!
-   !begin-bullet!
    `req_cache()` now re-caches the response if the body is hasn't been
    modified but the headers have changed (#442). It also works better
    when `req_perform()` sets a path (#442).
    !end-bullet!
-   !begin-bullet!
    New `req_cookie_set()` allows you to set client side cookies (#369).
    !end-bullet!
-   !begin-bullet!
    `req_perform()` no longer displays a progress bar when sleeping
    during tests. You can override this behaviour by setting the option
    `httr2_progress`.
    !end-bullet!
-   !begin-bullet!
    `req_perform_iterative()` is no longer experimental.
    !end-bullet!
-   !begin-bullet!
    New `req_perform_connection()` for working with streaming data.
    Unlike `req_perform_stream()` which uses callbacks,
    `req_perform_connection()` returns a regular response object with a
    connection as the body. Unlike `req_perform_stream()` it supports
    `req_retry()` (with @jcheng5, #519).
    !end-bullet!
-   !begin-bullet!
    `req_retry()` no longer treates low-level HTTP failures the same way
    as transient errors by default. You can return to the previous
    behaviour with `retry_on_error = TRUE`.
    !end-bullet!
-   !begin-bullet!
    `resp_body_html()` and `resp_body_xml()` now work when
    `req_perform()` is given a path (#448).
    !end-bullet!
-   !begin-bullet!
    New `resp_stream_bytes()`, `resp_stream_lines()`, and
    `resp_stream_sse()` for streaming chunk from a connection response
    (#519).
    !end-bullet!

!end-bullets-11!

# httr2 1.0.3

!begin-bullets-12!

-   !begin-bullet!
    `jwt_encode_hmac()` now calls correct underlying function
    `jose::jwt_encode_hmac()` and has correct default size parameter
    value (@denskh, #508).

    !end-bullet!
-   !begin-bullet!
    `req_cache()` now prunes cache *before* checking if a given key
    exists, eliminating the occassional error about reading from an
    invalid RDS file. It also no longer tests for existence then later
    reads the cache, avoiding potential race conditions.

    !end-bullet!
-   !begin-bullet!
    New `req_perform_promise()` creates a `promises::promise` so a
    request can run in the background (#501, @gergness).

    !end-bullet!
-   !begin-bullet!
    `req_perform_parallel()` now respects error handling in
    `req_error()`.

    !end-bullet!

!end-bullets-12!

# httr2 1.0.2

!begin-bullets-13!

-   !begin-bullet!
    `req_body_file()` now only opens a connection when the request
    actually needs data. In particular, this makes it work better with
    `req_perform_parallel()` (#487).
    !end-bullet!
-   !begin-bullet!
    `req_cache()` no longer fails if the `rds` files are somehow
    corrupted and now defaults the `debug` argument to the
    `httr2_cache_debug` option to make it easier to debug caching buried
    in other people's code (#486).
    !end-bullet!
-   !begin-bullet!
    `req_oauth_password()` now only asks for your password once (#498).
    !end-bullet!
-   !begin-bullet!
    `req_perform_parallel()` now works correctly with `req_cache()`
    (#447) and now works when downloading 0 byte files (#478)
    !end-bullet!
-   !begin-bullet!
    `req_perform_stream()` no longer applies the `callback` to
    unsuccessful responses, instead creating a regular response. It also
    now sets `last_request()` and `last_response()` (#479).
    !end-bullet!
-   !begin-bullet!
    `req_url_query()` now allows you to opt out of escaping for
    multi-value parameters (#404).
    !end-bullet!

!end-bullets-13!

# httr2 1.0.1

!begin-bullets-14!

-   !begin-bullet!
    `req_perform_stream()` gains a `round = c("byte", "line")` argument
    to control how the stream is rounded (#437).

    !end-bullet!
-   !begin-bullet!
    `req_retry()` gives a clearer error if `after` returns the wrong
    type of value (#385).

    !end-bullet!
-   !begin-bullet!
    `req_template()` now works when you have a bare `:` in a template
    that uses "uri" style (#389).

    !end-bullet!
-   !begin-bullet!
    `req_timeout()` now resets the value of `connecttimeout` set by
    curl. This ensures that you can use `req_timeout()` to increase the
    connection timeout past 10s (#395).

    !end-bullet!
-   !begin-bullet!
    `url_parse()` is considerably faster thanks to performance
    optimisations by and discussion with @DyfanJones (#429).

    !end-bullet!

!end-bullets-14!

# httr2 1.0.0

## Function lifecycle

!begin-bullets-15!

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

!end-bullets-15!

## Multiple requests

!begin-bullets-16!

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

!end-bullets-16!

## OAuth features

!begin-bullets-17!

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
    to use to get the auth code, either launching a temporary web server
    or, new, allowing you to manually enter the details with the help of
    a custom JS/HTML page hosted elsewhere, or by copying and pasting
    the URL you're redirected to (@fh-mthomson, #326). The temporary web
    server now also respects the path component of `redirect_uri`, if
    the API needs a specific path (#149).

    !end-bullet!
-   !begin-bullet!
    New `oauth_token_cached()` allows you to get an OAuth token while
    still taking advantage of httr2's caching and auto-renewal features.
    For expert use only (#328).

    !end-bullet!

!end-bullets-17!

## Other new features

!begin-bullets-18!

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

!end-bullets-18!

## Minor improvements and bug fixes

!begin-bullets-19!

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

!end-bullets-19!

# httr2 0.2.3

!begin-bullets-20!

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

!end-bullets-20!

# httr2 0.2.2

!begin-bullets-21!

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

!end-bullets-21!

# httr2 0.2.1

!begin-bullets-22!

-   !begin-bullet!
    "Wrapping APIs" is now an article, not a vignette.

    !end-bullet!
-   !begin-bullet!
    `req_template()` now appends the path instead of replacing it
    (@jchrom, #133)

    !end-bullet!

!end-bullets-22!

# httr2 0.2.0

## New features

!begin-bullets-23!

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

!end-bullets-23!

## Minor improvements and bug fixes

!begin-bullets-24!

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

!end-bullets-24!

# httr2 0.1.1

!begin-bullets-25!

-   !begin-bullet!
    Fix R CMD check failures on CRAN

    !end-bullet!
-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.

    !end-bullet!

!end-bullets-25!

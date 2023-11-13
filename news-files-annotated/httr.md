# httr (development version)

# httr 1.4.7

!begin-bullets-1!

-   !begin-bullet!
    Add support for seeking in uploads (#741).

    !end-bullet!
-   !begin-bullet!
    Suppress another use of httpbin.

    !end-bullet!
-   !begin-bullet!
    More aggressively skip httpbin using tests.

    !end-bullet!
-   !begin-bullet!
    Remove vignette contents and point to httr2.

    !end-bullet!

!end-bullets-1!

# httr 1.4.6

!begin-bullets-2!

-   !begin-bullet!
    Suppress use of httpbin in examples and tests because it has become
    unreliable.
    !end-bullet!

!end-bullets-2!

# httr 1.4.5

!begin-bullets-3!

-   !begin-bullet!
    An internal helper that checks for an interactive session in the OOB
    flow now honors the `"rlang_interactive"` global option, in case
    it's necessary to declare the session to be interactive (enough) for
    OOB (@jennybc, #734).
    !end-bullet!

!end-bullets-3!

# httr 1.4.4

!begin-bullets-4!

-   !begin-bullet!
    Fix intermittent failing test.
    !end-bullet!

!end-bullets-4!

# httr 1.4.3

!begin-bullets-5!

-   !begin-bullet!
    Fix failing test.
    !end-bullet!

!end-bullets-5!

# httr 1.4.2

!begin-bullets-6!

-   !begin-bullet!
    Fix failing test.

    !end-bullet!
-   !begin-bullet!
    `parse_url()` now refers to RFC3986 for the parsing of the URL's
    scheme, with a bit more permissive syntax (@ymarcon, #615).

    !end-bullet!

!end-bullets-6!

# httr 1.4.1

!begin-bullets-7!

-   !begin-bullet!
    Remove the default `cainfo` option on Windows. Providing a CA bundle
    is not needed anymore because `curl` now uses the native schannel
    SSL backend. For recent versions of libcurl, overriding the CA
    bundle actually breaks custom trust certificates on corporate
    networks. (@jeroen, #603)

    !end-bullet!
-   !begin-bullet!
    `http_status()` now throws the correct error message if http status
    code is not in the list of known codes (@Javdat, #567).

    !end-bullet!
-   !begin-bullet!
    `POST()` gains an example on how to use `encode = "raw"` for
    specific json string body (@cderv, #563)

    !end-bullet!
-   !begin-bullet!
    `RETRY()` now throws the correct error message if an error occurs
    during the request (@austin3dickey, #581).

    !end-bullet!
-   !begin-bullet!
    `VERB()` and `RETRY()` now automatically uppercase methods
    (@patr1ckm, #571).

    !end-bullet!

!end-bullets-7!

# httr 1.4.0

## OAuth

OAuth2.0 has been made somewhat more flexible in order to support more
websites:

!begin-bullets-8!

-   !begin-bullet!
    `init_oauth2.0()` passes `use_basic_auth` onwards, enabling basic
    authentication for OAuth 2.0 (@peterhartman, #484).

    !end-bullet!
-   !begin-bullet!
    `oauth2.0_token()` (and `init_oauth2.0()`) gains a `oob_value`
    argument that allows arbitrary values to be sent for the
    `request_uri` parameter during OOB flows (@ctrombley, #493).

    !end-bullet!
-   !begin-bullet!
    `oauth2.0_token()` (and `init_oauth2.0()`) gain a new
    `query_authorize_extra` parameter make it possible to add extra
    query parameters to the authorization URL. This is needed some APIs
    (e.g. fitbit) (@cosmomeese, #503).

    !end-bullet!
-   !begin-bullet!
    `oauth_endpoints()` contains updated urls for Yahoo (@ctrombley,
    #493) and Vimeo (#491).

    !end-bullet!
-   !begin-bullet!
    OAuth 2.0 token refresh gives a more informative error if it fails
    (#516).

    !end-bullet!
-   !begin-bullet!
    Prior to token retrieval from on-disk cache, scopes are
    de-duplicated, sorted, and stripped of names before being hashed.
    This eliminates a source of hash mismatch that causes new tokens to
    be requested, even when existing tokens had the necessary scope.
    (@jennybc, #495)

    !end-bullet!

!end-bullets-8!

Updates to demos:

!begin-bullets-9!

-   !begin-bullet!
    The Facebook OAuth demo now uses device flow (#510). This allows you
    to continue using the FB api from R under their new security policy.

    !end-bullet!
-   !begin-bullet!
    A new Noun Project demo shows how to use one-legged OAuth1 (@cderv,
    #548).

    !end-bullet!
-   !begin-bullet!
    The Vimeo demo has been updated from OAuth 1.0 to 2.0 (#491).

    !end-bullet!

!end-bullets-9!

## Minor changes and improvements

!begin-bullets-10!

-   !begin-bullet!
    `cache_info()` now handles un-named flags, as illustrated by
    "private" when the server returns "private, max-age = 0".

    !end-bullet!
-   !begin-bullet!
    `parse_http_date()` gets a better default value for the `failure`
    argument so that reponses with unparseable dates can be printed
    without error (@shrektan, #544).

    !end-bullet!
-   !begin-bullet!
    `POST()` now uses 22 digits of precision for `body` list elements by
    default (@jmwerner, #490)

    !end-bullet!
-   !begin-bullet!
    `RETRY()` now terminates on any successful request, regardless of
    the value of `terminate_on`. To return to the previous behaviour,
    set `terminate_on_success = FALSE` (#522).

    !end-bullet!
-   !begin-bullet!
    In `RETRY()` and `VERB()`, `HEAD` requests now succeed (#478, #499).

    !end-bullet!
-   !begin-bullet!
    Encoding falls back to UTF-8 if not supplied and content-type
    parsing fails (#500).

    !end-bullet!
-   !begin-bullet!
    Non-http(s) headers are no longer parsed (@billdenney, #537). This
    makes it possible to use httr with protocols other than http,
    although this is not advised, and you're own your own.

    !end-bullet!

!end-bullets-10!

# httr 1.3.1

!begin-bullets-11!

-   !begin-bullet!
    Re-enable on-disk caching (accidentally disabled in #457) (#475)
    !end-bullet!

!end-bullets-11!

# httr 1.3.0

## API changes

!begin-bullets-12!

-   !begin-bullet!
    Deprecated `safe_callback()` has been removed.

    !end-bullet!
-   !begin-bullet!
    `is_interactive` argument to `init_oauth1.0()`, `init_oauth2.0()`
    and `oauth_listener()` has been deprecated, as the R session does
    not actually need to be interactive.

    !end-bullet!

!end-bullets-12!

## New features

!begin-bullets-13!

-   !begin-bullet!
    New `set_callback()` and `get_callback()` set and query callback
    functions that are called right before and after performing an HTTP
    request (@gaborcsardi, #409)

    !end-bullet!
-   !begin-bullet!
    `RETRY()` now retries if an error occurs during the request
    (@asieira, #404), and gains two new arguments:

    !begin-bullets-14!
    -   !begin-bullet!
        `terminate_on` gives you greater control over which status codes
        should it stop retrying. (@asieira, #404)

        !end-bullet!
    -   !begin-bullet!
        `pause_min` allows for sub-second delays. (Use with caution!
        Generally the default is preferred.) (@r2evans)

        !end-bullet!
    -   !begin-bullet!
        If the server returns HTTP status code 429 and specifies a
        `retry-after` value, that value will now be used instead of
        exponential backoff with jitter, unless it's smaller than
        `pause_min`. (@nielsoledam, #472)

        !end-bullet!

    !end-bullets-14!
    !end-bullet!

!end-bullets-13!

## OAuth

!begin-bullets-15!

-   !begin-bullet!
    New oauth cache files are always added to `.gitignore` and, if it
    exists, `.Rbuildignore`. Specifically, this now happens when option
    `httr_oauth_cache = TRUE` or user specifies cache file name
    explicitly. (@jennybc, #436)

    !end-bullet!
-   !begin-bullet!
    `oauth_encode()` now handles UTF-8 characters correctly.
    (@yutannihilation, #424)

    !end-bullet!
-   !begin-bullet!
    `oauth_app()` allows you to specify the `redirect_url` if you need
    to customise it.

    !end-bullet!
-   !begin-bullet!
    `oauth_service_token()` gains a `sub` parameter so you can request
    access on behalf of another user (#410), and accepts a character
    vector of `scopes` as was described in the documentation (#389).

    !end-bullet!
-   !begin-bullet!
    `oauth_signature()` now normalises the URL as described in the
    OAuth1.0a spec (@leeper, #435)

    !end-bullet!
-   !begin-bullet!
    New `oauth2.0_authorize_url()` and `oauth2.0_access_token()`
    functions pull out parts of the OAuth process for reuse elsewhere
    (#457).

    !end-bullet!
-   !begin-bullet!
    `oauth2.0_token()` gains three new arguments:

    !begin-bullets-16!
    -   !begin-bullet!
        `config_init` allows you to supply additional config for the
        initial request. This is needed for some APIs (e.g. reddit)
        which rate limit based on `user_agent` (@muschellij2, #363).

        !end-bullet!
    -   !begin-bullet!
        `client_credentials`, allows you to use the OAauth2 *Client
        Credential Grant*. See [RFC
        6749](https://www.rfc-editor.org/rfc/rfc6749#section-4) for
        details. (@cderv, #384)

        !end-bullet!
    -   !begin-bullet!
        A `credentials` argument that allows you to customise the auth
        flow. For advanced used only (#457)

        !end-bullet!

    !end-bullets-16!
    !end-bullet!
-   !begin-bullet!
    `is_interactive` argument to `init_oauth1.0()`, `init_oauth2.0()`
    and `oauth_listener()` has been deprecated, as the R session does
    not need to be interactive.

    !end-bullet!

!end-bullets-15!

## Minor bug fixes and improvements

!begin-bullets-17!

-   !begin-bullet!
    `BROWSER()` prints a message telling you to browse to the URL if
    called in a non-interactive session.

    !end-bullet!
-   !begin-bullet!
    `find_cert_bundle()` will now correctly find cert bundle in
    "R_HOME/etc" (@jiwalker-usgs, #386).

    !end-bullet!
-   !begin-bullet!
    You can now send lists containing `curl::form_data()` in the `body`
    of requests with \`encoding = "multipart". This makes it possible to
    specify the mime-type of individual components (#430).

    !end-bullet!
-   !begin-bullet!
    `modify_url()` recognises more forms of empty queries. This
    eliminates a source of spurious trailing `?` and `?=` (@jennybc,
    #452).

    !end-bullet!
-   !begin-bullet!
    The `length()` method of the internal `path` class is no longer
    exported (#395).

    !end-bullet!

!end-bullets-17!

# httr 1.2.1

!begin-bullets-18!

-   !begin-bullet!
    Fix bug with new cache creation code: need to check that cache isn't
    an empty file.
    !end-bullet!

!end-bullets-18!

# httr 1.2.0

## New features

!begin-bullets-19!

-   !begin-bullet!
    `oauth_signature()` no longer prepends 'oauth\_' to additional
    parameters. (@jimhester, #373)

    !end-bullet!
-   !begin-bullet!
    All `print()` methods now invisibly return `x` (#355).

    !end-bullet!
-   !begin-bullet!
    `DELETE()` gains a body parameter (#326).

    !end-bullet!
-   !begin-bullet!
    New `encode = "raw"` allows you to do your own encoding for requests
    with bodies.

    !end-bullet!
-   !begin-bullet!
    New `http_type()` returns the content/mime type of a request, sans
    parameters.

    !end-bullet!

!end-bullets-19!

## Bug fixes and minor improvements

!begin-bullets-20!

-   !begin-bullet!
    No longer uses use custom requests for standard `POST` requests
    (#356, #357). This has the side-effect of properly following
    redirects after `POST`, fixing some login issues (eg
    hadley/rvest#133).

    !end-bullet!
-   !begin-bullet!
    Long deprecated `multipart` argument to `POST()`, `PUT()` and
    `PATCH()` has been removed.

    !end-bullet!
-   !begin-bullet!
    The cross-session OAuth cache is now created with permission 0600,
    and should give a better error if it can't be created (#365).

    !end-bullet!
-   !begin-bullet!
    New `RETRY()` function allows you to retry a request multiple times
    until it succeeds (#353).

    !end-bullet!
-   !begin-bullet!
    The default user agent string is now computed once and cached. This
    is a small performance improvement, but important for local
    connections (#322, @richfitz).

    !end-bullet!
-   !begin-bullet!
    `oauth_callback()` gains trailing slash for facebook compatibility
    (#324).

    !end-bullet!
-   !begin-bullet!
    `progress()` gains `con` argument to control where progress bar is
    rendered (#359).

    !end-bullet!
-   !begin-bullet!
    When `use_basic_auth` option is used to obtain a token, token
    refreshes will now use basic authentication too.

    !end-bullet!
-   !begin-bullet!
    Suppress unhelpful "No encoding supplied: defaulting to UTF-8." when
    printing a response (#327).

    !end-bullet!
-   !begin-bullet!
    All auto parser functions now have consistent arguments. This fixes
    problem where `...` is pass on to another function (#330).

    !end-bullet!
-   !begin-bullet!
    `parse_media()` can once again parse multiple parameters (#362,
    #366).

    !end-bullet!
-   !begin-bullet!
    Correctly cast `config` in `POST()`.

    !end-bullet!
-   !begin-bullet!
    Fix in readfunction to close connection when done.

    !end-bullet!

!end-bullets-20!

# httr 1.1.0

## New features

!begin-bullets-21!

-   !begin-bullet!
    `stop_for_status()`, `warn_for_status()` and (new)
    `message_for_status()` replace `message` argument with new `task`
    argument that optionally describes the current task. This allows API
    wrappers to provide more informative error messages on failure
    (#277, #302). `stop_for_status()` and `warn_for_status()` return the
    response if there were no errors. This makes them easier to use in
    pipelines (#278).

    !end-bullet!
-   !begin-bullet!
    `url_ok()` and `url_successful()` have been deprecated in favour of
    the more flexible `http_error()`, which works with urls, responses
    and integer status codes (#299).

    !end-bullet!

!end-bullets-21!

## OAuth

!begin-bullets-22!

-   !begin-bullet!
    `oauth1.0_token()` gains RSA-SHA1 signature support with the
    `private_key` argument (@nathangoulding, #316).

    !end-bullet!
-   !begin-bullet!
    `oauth2.0_token()` throws an error if it fails to get an access
    token (#250) and gains two new arguments:

    !begin-bullets-23!
    -   !begin-bullet!
        `user_params` allows you to pass arbitrary additional parameters
        to the token access endpoint when acquiring or refreshing a
        token (@cornf4ke, #312)

        !end-bullet!
    -   !begin-bullet!
        `use_basic_auth` allows you to pick use http authentication when
        getting a token (#310, @grahamrp).

        !end-bullet!

    !end-bullets-23!
    !end-bullet!
-   !begin-bullet!
    `oauth_service_token()` checks that its arguments are the correct
    types (#282) and anways returns a `request` object (#313,
    @nathangoulding).

    !end-bullet!
-   !begin-bullet!
    `refresh_oauth2.0()` checks for known OAuth2.0 errors and clears the
    locally cached token in the presense of any (@nathangoulding, #315).

    !end-bullet!

!end-bullets-22!

## Bug fixes and minor improvements

!begin-bullets-24!

-   !begin-bullet!
    httr no longer bundles `cacert.pem`, and instead it relies on the
    bundle in openssl. This bundle is only used a last-resort on windows
    with R \<3.2.0.

    !end-bullet!
-   !begin-bullet!
    Switch to 'openssl' package for hashing, hmac, signatures, and
    base64.

    !end-bullet!
-   !begin-bullet!
    httr no longer depends on stringr (#285, @jimhester).

    !end-bullet!
-   !begin-bullet!
    `build_url()` collapses vector `path` with `/` (#280,
    @artemklevtsov).

    !end-bullet!
-   !begin-bullet!
    `content(x)` uses xml2 for XML documents and readr for csv and tsv.

    !end-bullet!
-   !begin-bullet!
    `content(, type = "text")` defaults to UTF-8 encoding if not
    otherwise specified.

    !end-bullet!
-   !begin-bullet!
    `has_content()` correctly tests for the presence/absence of body
    content (#91).

    !end-bullet!
-   !begin-bullet!
    `parse_url()` correctly parses urls like `file:///a/b/c` work
    (#309).

    !end-bullet!
-   !begin-bullet!
    `progress()` returns `TRUE` to fix for 'progress callback must
    return boolean' warning (@jeroenooms, #252).

    !end-bullet!
-   !begin-bullet!
    `upload_file()` supports very large files (\> 2.5 Gb) (@jeroenooms,
    #257).

    !end-bullet!

!end-bullets-24!

# httr 1.0.0

!begin-bullets-25!

-   !begin-bullet!
    httr no longer uses the RCurl package. Instead it uses the curl
    package, a modern binding to libcurl written by Jeroen Ooms (#172).
    This should make httr more reliable and prevent the "easy handle
    already used in multi handle" error. This change shouldn't affect
    any code that uses httr - all the changes have happened behind the
    scenes.

    !end-bullet!
-   !begin-bullet!
    The `oauth_listener` can now listen on a custom IP address and port
    (the previously hardwired ip:port of `127.0.0.1:1410` is now just
    the default). This permits authentication to work under other
    settings, such as inside docker containers (which require localhost
    uses `0.0.0.0` instead). To configure, set the system environmental
    variables `HTTR_LOCALHOST` and `HTTR_PORT` respectively (@cboettig,
    #211).

    !end-bullet!
-   !begin-bullet!
    `POST(encode = 'json')` now automatically turns length-1 vectors
    into json scalars. To prevent this automatic "unboxing", wrap the
    vector in `I()` (#187).

    !end-bullet!
-   !begin-bullet!
    `POST()`, `PUT()` and `PATCH()` now drop `NULL` body elements. This
    is convenient and consistent with the behaviour for url query
    params.

    !end-bullet!

!end-bullets-25!

## Minor improvements and bug fixes

!begin-bullets-26!

-   !begin-bullet!
    `cookies` argument to `handle()` is deprecated - cookies are always
    turned on by default.

    !end-bullet!
-   !begin-bullet!
    `brew_dr()` has been renamed to `httr_dr()` - that's what it
    should've been in the first place!

    !end-bullet!
-   !begin-bullet!
    `content(type = "text")` compares encodings in a case-insensitive
    manner (#209).

    !end-bullet!
-   !begin-bullet!
    `context(type = "auto")` uses a better strategy for text based
    formats (#209). This should allow the `encoding` argument to work
    more reliably.

    !end-bullet!
-   !begin-bullet!
    `config()` now cleans up duplicated options (#213).

    !end-bullet!
-   !begin-bullet!
    Uses `CURL_CA_BUNDLE` environment variable to look for cert bundle
    on Windows (#223).

    !end-bullet!
-   !begin-bullet!
    `safe_callback()` is deprecated - it's no longer needed with curl.

    !end-bullet!
-   !begin-bullet!
    `POST()` and `PUT()` now clean up after themselves when uploading a
    single file (@mtmorgan).

    !end-bullet!
-   !begin-bullet!
    `proxy()` gains an `auth` argument which allows you to pick the type
    of http authentication used by the proxy (#216).

    !end-bullet!
-   !begin-bullet!
    `VERB()` gains `body` and `encode` arguments so you can generate
    arbitrary requests with a body.

    !end-bullet!
-   !begin-bullet!
    tumblr added as an `oauth_endpoint`.

    !end-bullet!

!end-bullets-26!

# httr 0.6.1

!begin-bullets-27!

-   !begin-bullet!
    Correctly parse headers with multiple `:`, thanks to @mmorgan
    (#180).

    !end-bullet!
-   !begin-bullet!
    In `content()`, if no type is provided to function or specified in
    headers, and we can't guess the type from the extension, we now
    assume that it's `application/octet-stream` (#181).

    !end-bullet!
-   !begin-bullet!
    Throw error if `timeout()` is less than 1 ms (#175).

    !end-bullet!
-   !begin-bullet!
    Improved LinkedIn OAuth demo (#173).

    !end-bullet!

!end-bullets-27!

# httr 0.6.0

## New features

!begin-bullets-28!

-   !begin-bullet!
    New `write_stream()` allows you to process the response from a
    server as a stream of raw vectors (#143).

    !end-bullet!
-   !begin-bullet!
    Suport for Google OAuth2 [service
    accounts](https://developers.google.com/identity/protocols/oauth2/service-account).
    (#119, thanks to help from @siddharthab).

    !end-bullet!
-   !begin-bullet!
    `VERB()` allows to you use custom http verbs (#169).

    !end-bullet!
-   !begin-bullet!
    New `handle_reset()` to allow you to reset the handle if you get the
    error "easy handle already used in multi handle" (#112).

    !end-bullet!
-   !begin-bullet!
    Uses R6 instead of RC. This makes it possible to extend the OAuth
    classes from outside of httr (#113).

    !end-bullet!
-   !begin-bullet!
    Now only set `capath` on Windows - system defaults on linux and mac
    ox seem to be adequate (and in some cases better). I've added a
    couple of tests to ensure that this continues to work in the future.

    !end-bullet!

!end-bullets-28!

## Minor improvements and bug fixes

!begin-bullets-29!

-   !begin-bullet!
    `vignette("api-packages")` gains more detailed instructions on
    setting environment variables, thanks to @jennybc.

    !end-bullet!
-   !begin-bullet!
    Add `revoke_all()` to revoke all stored tokens (if possible) (#77).

    !end-bullet!
-   !begin-bullet!
    Fix for OAuth 2 process when using
    `options(httr_oob_default = TRUE)` (#126, @WillemPaling).

    !end-bullet!
-   !begin-bullet!
    New `brew_dr()` checks for common problems. Currently checks if your
    libCurl uses NSS. This is unlikely to work so it gives you some
    advice on how to fix the problem (thanks to @eddelbuettel for
    debugging this problem).

    !end-bullet!
-   !begin-bullet!
    `Content-Type` set to title case to avoid errors in servers which do
    not correctly implement case insensitivity in header names. (#142,
    #146) thanks to Håkon Malmedal (@hmalmedal) and Jim Hester
    (@jimhester).

    !end-bullet!
-   !begin-bullet!
    Correctly parse http status when it only contains two components
    (#162).

    !end-bullet!
-   !begin-bullet!
    Correctly parse http headers when field name is followed by any
    amount (including none) of white space.

    !end-bullet!
-   !begin-bullet!
    Default "Accepts" header set to
    `application/json, text/xml, application/xml, */*`: this should
    slightly increase the likelihood of getting xml back.
    `application/xml` is correctly converted to text before being parsed
    to `XML::xmlParse()` (#160).

    !end-bullet!
-   !begin-bullet!
    Make it again possible to override the content type set up by
    `POST()` when sending data (#140).

    !end-bullet!
-   !begin-bullet!
    New `safe_callback()` function operator that makes R functions safe
    for use as RCurl callbacks (#144).

    !end-bullet!
-   !begin-bullet!
    Added support for passing oauth1 tokens in URL instead of the
    headers (#145, @bogstag).

    !end-bullet!
-   !begin-bullet!
    Default to out-of-band credential exchange when `httpuv` isn't
    installed. (#168)

    !end-bullet!

!end-bullets-29!

## Deprecated and deleted functions

!begin-bullets-30!

-   !begin-bullet!
    `new_token()` has been removed - this was always an internal
    function so you should never have been using it. If you were, switch
    to creating the tokens directly.

    !end-bullet!
-   !begin-bullet!
    Deprecate `guess_media()`, and instead use `mime::guess_type()`
    (#148).

    !end-bullet!

!end-bullets-30!

# httr 0.5

!begin-bullets-31!

-   !begin-bullet!
    You can now save response bodies directly to disk by using the
    `write_disk()` config. This is useful if you want to capture large
    files that don't fit in memory (#44).

    !end-bullet!
-   !begin-bullet!
    Default accept header is now "application/json, text/xml, */*" -
    this should encourage servers to send json or xml if they know how.

    !end-bullet!
-   !begin-bullet!
    `httr_options()` allows you to easily filter the options, e.g. 
    `httr_options("post")`

    !end-bullet!
-   !begin-bullet!
    `POST()` now specifies Curl options more precisely so that Curl
    know's that you're doing a POST and can respond appropriately to
    redirects.

    !end-bullet!

!end-bullets-31!

## Caching

!begin-bullets-32!

-   !begin-bullet!
    Preliminary and experimental support for caching with `cache_info()`
    and `rerequest()` (#129). Be aware that this API is likely to change
    in the future.

    !end-bullet!
-   !begin-bullet!
    `parse_http_date()` parses http dates according RFC2616 spec.

    !end-bullet!
-   !begin-bullet!
    Requests now print the time they were made.

    !end-bullet!
-   !begin-bullet!
    Mime type `application/xml` is automatically parsed with
    \``XML::xmlParse()`. (#128)

    !end-bullet!

!end-bullets-32!

## Minor improvements and bug fixes

!begin-bullets-33!

-   !begin-bullet!
    Now possible to specify both handle and url when making a request.

    !end-bullet!
-   !begin-bullet!
    `content(type = "text")` uses `readBin()` instead of `rawToChar()`
    so that strings with embedded NULLs (e.g. WINDOWS-1252) can be
    re-encoded to UTF-8.

    !end-bullet!
-   !begin-bullet!
    `DELETE()` now returns body of request (#138).

    !end-bullet!
-   !begin-bullet!
    `headers()` is now a generic with a method for response objects.

    !end-bullet!
-   !begin-bullet!
    `parse_media()` failed to take into account that media types are
    case-insenstive - this lead to bad re-encoding for content-types
    like "text/html; Charset=UTF-8"

    !end-bullet!
-   !begin-bullet!
    Typo which broke `set_cookies()` fixed by @hrbrmstr.

    !end-bullet!
-   !begin-bullet!
    `url_ok()` works correctly now, instead of always returning `FALSE`,
    a bug since version 0.4 (#133).

    !end-bullet!
-   !begin-bullet!
    Remove redundant arguments `simplifyDataFrame` and `simplifyMatrix`
    for json parser.

    !end-bullet!

!end-bullets-33!

# httr 0.4

## New features

!begin-bullets-34!

-   !begin-bullet!
    New `headers()` and `cookies()` functions to extract headers and
    cookies from responses. Previoulsy internal `status_code()` function
    now exported to extract `status_code()` from responses.

    !end-bullet!
-   !begin-bullet!
    `POST()`, `PUT()`, and `PATCH()` now use `encode` argument to
    determine how list inputs are encoded. Valid values are "multiple",
    "form" or "json". The `multipart` argument is now deprecated (#103).
    You can stream a single file from disk with `upload_file("path/")`.
    The mime type will be guessed from the extension, or can be supplied
    explicitly as the second argument to `upload_file()`.

    !end-bullet!
-   !begin-bullet!
    `progress()` will display a progress bar, useful if you're doing
    large uploads or downloads (#17).

    !end-bullet!
-   !begin-bullet!
    `verbose()` now uses a custom debug function so that you can see
    exactly what data is sent to the server. Arguments control exactly
    what is included, and the defaults have been selected to be more
    helpful for the most common cases (#102).

    !end-bullet!
-   !begin-bullet!
    `with_verbose()` makes it easier to see verbose information when
    http requests are made within other functions (#87).

    !end-bullet!

!end-bullets-34!

## Documentation improvements

!begin-bullets-35!

-   !begin-bullet!
    New `quickstart` vignette to help you get up and running with httr.

    !end-bullet!
-   !begin-bullet!
    New `api-packages` vignette describes how best practices to follow
    when writing R packages that wrap web APIs.

    !end-bullet!
-   !begin-bullet!
    `httr_options()` lists all known config options, translating between
    their short R names and the full libcurl names. The `curl_doc()`
    helper function allows you to jump directly to the online
    documentation for an option.

    !end-bullet!

!end-bullets-35!

## Minor improvements

!begin-bullets-36!

-   !begin-bullet!
    `authenticate()` now defaults to `type = "basic"` which is pretty
    much the only type of authentication anyone uses.

    !end-bullet!
-   !begin-bullet!
    Updated `cacert.pem` to version at 2014-04-22 (#114).

    !end-bullet!
-   !begin-bullet!
    `content_type()`, `content_type_xml()` and `content_type_json()`
    make it easier to set the content type for `POST` requests (and
    other requests with a body).

    !end-bullet!
-   !begin-bullet!
    `has_content()` tells you if request has any content associated with
    it (#91).

    !end-bullet!
-   !begin-bullet!
    Add `is_interactive()` parameter to `oauth_listener()`,
    `init_oauth1.0()` and `init_oauth2.0()` (#90).

    !end-bullet!
-   !begin-bullet!
    `oauth_signature()` and `oauth_header()` now exported to make it
    easier to construct custom authentication for APIs that use only
    some components of the full OAuth process (e.g. 2 legged OAuth).

    !end-bullet!
-   !begin-bullet!
    NULL `query` parameters are now dropped automatically.

    !end-bullet!
-   !begin-bullet!
    When `print()`ing a response, httr will only attempt to print the
    first few lines if it's a text format (i.e. either the main type is
    text or is application/json). It will also truncate each line so
    that it fits on screen - this should hopefully make it easier to see
    a little bit of the content, without filling the screen with
    gibberish.

    !end-bullet!
-   !begin-bullet!
    `new_bin()` has been removed: it's easier to see what's going on in
    examples with `httpbin.org`.

    !end-bullet!

!end-bullets-36!

## Bug fixes

!begin-bullets-37!

-   !begin-bullet!
    `user_agent()` once again overrides default (closes #97)

    !end-bullet!
-   !begin-bullet!
    `parse(type = "auto")` returns NULL if no content associated with
    request (#91).

    !end-bullet!
-   !begin-bullet!
    Better strategy for resetting Curl handles prevents carry-over of
    error status and other problems (#112).

    !end-bullet!
-   !begin-bullet!
    `set_config()` and `with_config()` now work with `token`s (#111).

    !end-bullet!

!end-bullets-37!

# httr 0.3

## OAuth improvements

OAuth 2.0 has recieved a major overhaul in this version. The
authentication dance now works in more environments (including RStudio),
and is generally a little faster. When working on a remote server, or if
R's internet connection is constrained in other ways, you can now use
out-of-band authentication, copying and pasting from any browser to your
R session. OAuth tokens from endpoints that regularly expire access
tokens can now be refreshed, and will be refresh automatically on
authentication failure.

httr now uses project (working directory) based caching: every time you
create or refresh a token, a copy of the credentials will be saved in
`.httr-oauth`. You can override this default for individual tokens with
the `cache` parameter, or globally with the `httr_oauth_cache` option.
Supply either a logical vector (`TRUE` = always cache, `FALSE` = never
cache, `NA` = ask), or a string (the path to the cache file).

You should NOT include this cache file in source code control - if you
do, delete it, and reset your access token through the corresponding web
interface. To help, httr will automatically add appropriate entries to
`.gitignore` and `.Rbuildignore`.

These changes mean that you should only ever have to authenticate once
per project, and you can authenticate from any environment in which you
can run R. A big thanks go to Craig Citro (@craigcitro) from google, who
contributed much code and many ideas to make this possible.

!begin-bullets-38!

-   !begin-bullet!
    The OAuth token objects are now reference classes, which mean they
    can be updated in place, such as when an access token expires and
    needs to be refreshed. You can manually refresh by calling
    `$refresh()` on the object. You can force reinitialisation (to do
    the complete dance from scratch) by calling `$reinit(force = TRUE)`.

    !end-bullet!
-   !begin-bullet!
    If a signed OAuth2 request fails with a 401 and the credentials have
    a `refresh_token`, then the OAuth token will be automatically
    refreshed (#74).

    !end-bullet!
-   !begin-bullet!
    OAuth tokens are cached locally in a file called `.httr-oauth`
    (unless you opt out). This file should not be included in source
    code control, and httr will automatically add to `.gitignore` and
    `.Rbuildignore`. The caching policy is described in more detail in
    the help for the `Token` class.

    !end-bullet!
-   !begin-bullet!
    The OAuth2 dance can now be performed without running a local
    webserver (#33, thanks to @craigcitro). To make that the default,
    set `options(httr_oob_default = TRUE)`. This is useful when running
    R remotely.

    !end-bullet!
-   !begin-bullet!
    Add support for passing oauth2 tokens in headers instead of the URL,
    and make this the default (#34, thanks to @craigcitro).

    !end-bullet!
-   !begin-bullet!
    OAuth endpoints can store arbitrary extra urls.

    !end-bullet!
-   !begin-bullet!
    Use the httpuv webserver for the OAuth dance instead of the built-in
    httpd server (#32, thanks to @jdeboer). This makes the dance work in
    Rstudio, and also seems a little faster. Rook is no longer required.

    !end-bullet!
-   !begin-bullet!
    `oauth_endpoints()` includes some popular OAuth endpoints.

    !end-bullet!

!end-bullets-38!

## Other improvements

!begin-bullets-39!

-   !begin-bullet!
    HTTP verbs (`GET()`, `POST()` etc) now pass unnamed arguments to
    `config()` and named arguments to `modify_url()` (#81).

    !end-bullet!
-   !begin-bullet!
    The placement of `...` in `POST()`, `PATCH()` and `PUT()` has been
    tweaked so that you must always specify `body` and `multipart`
    arguments with their full name. This has always been recommended
    practice; now it is enforced.

    !end-bullet!
-   !begin-bullet!
    `httr` includes its own copy of `cacert.pem`, which is more recent
    than the version included in RCurl (#67).

    !end-bullet!
-   !begin-bullet!
    Added default user agent which includes versions of Curl, RCurl and
    httr.

    !end-bullet!
-   !begin-bullet!
    Switched to jsonlite from rjson.

    !end-bullet!
-   !begin-bullet!
    Content parsers no longer load packages on to search path.

    !end-bullet!
-   !begin-bullet!
    `stop_for_status()` now raises errors with useful classes so that
    you can use `tryCatch()` to take different actions depending on the
    type of error. See `http_condition()` for more details.

    !end-bullet!
-   !begin-bullet!
    httr now imports the methods package so that it works when called
    with Rscript.

    !end-bullet!
-   !begin-bullet!
    New automatic parsers for mime types `text/tab-separated-values` and
    `text/csv` (#49)

    !end-bullet!
-   !begin-bullet!
    Add support for `fragment` in url building/parsing (#70, thanks to
    @craigcitro).

    !end-bullet!
-   !begin-bullet!
    You can suppress the body entirely in `POST()`, `PATCH()` and
    `PUT()` with `body = FALSE`.

    !end-bullet!

!end-bullets-39!

## Bug fixes

!begin-bullets-40!

-   !begin-bullet!
    If you supply multiple headers of the same name, the value of the
    most recently set header will always be used.

    !end-bullet!
-   !begin-bullet!
    Urls with missing query param values (e.g. `http://x.com/?q=`) are
    now parsed correctly (#27). The names of query params are now also
    escaped and unescaped correctly when parsing and building urls.

    !end-bullet!
-   !begin-bullet!
    Default html parser is now `XML::htmlParse()` which is easier to use
    with xpath (#66).

    !end-bullet!

!end-bullets-40!

# httr 0.2

!begin-bullets-41!

-   !begin-bullet!
    OAuth now uses custom escaping function which is guaranteed to work
    on all platforms (Fixes #21)

    !end-bullet!
-   !begin-bullet!
    When concatenating configs, concatenate all the headers. (Fixes #19)

    !end-bullet!
-   !begin-bullet!
    export `hmac_sha1` since so many authentication protocols need this

    !end-bullet!
-   !begin-bullet!
    `content` will automatically guess what type of output (parsed, text
    or raw) based on the content-type header. It also automatically
    converts text content to UTF-8 (using the charset in the media type)
    and can guess at mime type from extension if server doesn't supply
    one. Media type and encoding can be overridden with the `type` and
    `encoding` arguments respectively.

    !end-bullet!
-   !begin-bullet!
    response objects automatically print content type to aid debugging.

    !end-bullet!
-   !begin-bullet!
    `text_content` has become `context(, "text")` and `parsed_content`
    `content(, "parsed")`. The previous calls are deprecated and will be
    removed in a future version.

    !end-bullet!
-   !begin-bullet!
    In `oauth_listener`, use existing httpd port if help server has
    already been started. This allows the ouath authentication dance to
    work if you're in RStudio. (Fixes #15).

    !end-bullet!
-   !begin-bullet!
    add several functions related to checking the status of an http
    request. Those are : `status`, `url_ok` and `url_success` as well as
    `stop_for_status` and `warn_for_status`.

    !end-bullet!
-   !begin-bullet!
    `build_url`: correctly add params back into full url.

    !end-bullet!

!end-bullets-41!

# httr 0.1.1

!begin-bullets-42!

-   !begin-bullet!
    Add new default config: use the standard SSL certificate

    !end-bullet!
-   !begin-bullet!
    Add recommendation to use custom handles with `authenticate`

    !end-bullet!

!end-bullets-42!

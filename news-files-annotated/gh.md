# gh (development version)

# gh 1.5.0

## BREAKING CHANGES

### Posit Security Advisory(PSA) - PSA-1649

!begin-bullets-1!

-   !begin-bullet!
    Posit acknowledges that the response header may contain sensitive
    information. (#222) Thank you to @foysal1197 for your thorough
    research and responsible disclosure.
    !end-bullet!

!end-bullets-1!

`gh()`, and other functions that use it, now do not save the request
headers in the returned object. Consequently, if you use the
`gh_next()`, `gh_prev()`, `gh_first()` or `gh_last()` functions and
passed `.token` and/or `.send_headers` explicitly to the original `gh()`
(or similar) call, then you'll also need to pass the same `.token`
and/or `.send_headers` to `gh_next()`, `gh_prev()`, `gh_first()` or
`gh_last()`.

## OTHER CHANGES

!begin-bullets-2!

-   !begin-bullet!
    New `gh_token_exists()` tells you if a valid GH token has been set.

    !end-bullet!
-   !begin-bullet!
    `gh()` now uses a cache provided by httr2. This cache lives in
    `tools::R_user_dir("gh", "cache")`, maxes out at 100 MB, and can be
    disabled by setting `options(gh_cache = FALSE)` (#203).

    !end-bullet!
-   !begin-bullet!
    `gh_token()` can now pick up on the viewer's GitHub credentials (if
    any) when running on Posit Connect (@atheriel, #217).

    !end-bullet!

!end-bullets-2!

# gh 1.4.1

!begin-bullets-3!

-   !begin-bullet!
    `gh_next()`, `gh_prev()`, `gh_first()` and `gh_last()` now work
    correctly again (#181).

    !end-bullet!
-   !begin-bullet!
    When the user sets `.destfile` to write the response to disk, gh now
    writes the output to a temporary file, which is then renamed to
    `.destfile` after performing the request, or deleted on error
    (#178).

    !end-bullet!

!end-bullets-3!

# gh 1.4.0

!begin-bullets-4!

-   !begin-bullet!
    `gh()` gains a new `.max_rate` parameter that sets the maximum
    number of requests per second.

    !end-bullet!
-   !begin-bullet!
    gh is now powered by httr2. This should generally have little impact
    on normal operation but if a request fails, you can use
    `httr2::last_response()` and `httr2::last_request()` to debug.

    !end-bullet!
-   !begin-bullet!
    `gh()` gains a new `.max_wait` argument which gives the maximum
    number of minutes to wait if you are rate limited (#67).

    !end-bullet!
-   !begin-bullet!
    New `gh_rate_limits()` function reports on all rate limits for the
    active user.

    !end-bullet!
-   !begin-bullet!
    gh can now validate GitHub fine-grained personal access tokens
    (@jvstein, #171).

    !end-bullet!

!end-bullets-4!

# gh 1.3.1

!begin-bullets-5!

-   !begin-bullet!
    gh now accepts lower-case methods i.e. both
    `gh::gh("get /users/hadley/repos")` and
    `gh::gh("GET /users/hadley/repos")` work (@maelle, #167).

    !end-bullet!
-   !begin-bullet!
    Response headers (`"response_headers"`) and response content
    (`"response_content")` are now returned in error conditions so that
    error handlers can use information, such as the rate limit reset
    header, when handling `github_error`s (@gadenbuie, #117).

    !end-bullet!

!end-bullets-5!

# gh 1.3.0

!begin-bullets-6!

-   !begin-bullet!
    gh now shows the correct number of records in its progress bar when
    paginating (#147).

    !end-bullet!
-   !begin-bullet!
    New `.params` argument in `gh()` to make it easier to pass
    parameters to it programmatically (#140).

    !end-bullet!

!end-bullets-6!

# gh 1.2.1

!begin-bullets-7!

-   !begin-bullet!
    Token validation accounts for the new format announced 2021-03-04
    and implemented on 2021-04-01 (#148, @fmichonneau).
    !end-bullet!

!end-bullets-7!

# gh 1.2.0

!begin-bullets-8!

-   !begin-bullet!
    `gh_gql()` now passes all arguments to `gh()` (#124).

    !end-bullet!
-   !begin-bullet!
    gh now handles responses from pagination better, and tries to
    properly merge them (#136, @rundel).

    !end-bullet!
-   !begin-bullet!
    gh can retrieve a PAT from the Git credential store, where the
    lookup is based on the targeted API URL. This now uses the gitcreds
    package. The environment variables consulted for URL-specific GitHub
    PATs have changed.

    !begin-bullets-9!
    -   !begin-bullet!
        For "https://api.github.com": `GITHUB_PAT_GITHUB_COM` now,
        instead of `GITHUB_PAT_API_GITHUB_COM`
        !end-bullet!
    -   !begin-bullet!
        For "https://github.acme.com/api/v3":
        `GITHUB_PAT_GITHUB_ACME_COM` now, instead of
        `GITHUB_PAT_GITHUB_ACME_COM_API_V3`
        !end-bullet!

    !end-bullets-9!
    See the documentation of the gitcreds package for details.

    !end-bullet!
-   !begin-bullet!
    The keyring package is no longer used, in favor of the Git
    credential store.

    !end-bullet!
-   !begin-bullet!
    The documentation for the GitHub REST API has moved to
    https://docs.github.com/rest and endpoints are now documented using
    the URI template style of RFC 6570:

    !begin-bullets-10!
    -   !begin-bullet!
        Old: `GET /repos/:owner/:repo/issues`
        !end-bullet!
    -   !begin-bullet!
        New: `GET /repos/{owner}/{repo}/issues`
        !end-bullet!

    !end-bullets-10!
    gh accepts and prioritizes the new style. However, it still does
    parameter substitution for the old style.

    !end-bullet!
-   !begin-bullet!
    Fixed an error that occurred when calling `gh()` with
    `.progress = FALSE` (@gadenbuie, #115).

    !end-bullet!
-   !begin-bullet!
    `gh()` accepts named `NA` parameters that are destined for the
    request body (#139).

    !end-bullet!

!end-bullets-8!

# gh 1.1.0

!begin-bullets-11!

-   !begin-bullet!
    Raw responses from GitHub are now returned as raw vector.

    !end-bullet!
-   !begin-bullet!
    Responses may be written to disk by providing a path in the
    `.destfile` argument.

    !end-bullet!
-   !begin-bullet!
    gh now sets `.Last.error` to the error object after an uncaught
    error, and `.Last.error.trace` to the stack trace of the error.

    !end-bullet!
-   !begin-bullet!
    `gh()` now silently drops named `NULL` parameters, and throws an
    error for named `NA` parameters (#21, #84).

    !end-bullet!
-   !begin-bullet!
    `gh()` now returns better values for empty responses, typically
    empty lists or dictionaries (#66).

    !end-bullet!
-   !begin-bullet!
    `gh()` now has an `.accept` argument to make it easier to set the
    `Accept` HTTP header (#91).

    !end-bullet!
-   !begin-bullet!
    New `gh_gql()` function to make it easier to work with the GitHub
    GraphQL API.

    !end-bullet!
-   !begin-bullet!
    gh now supports separate personal access tokens for GitHub
    Enterprise sites. See `?gh_token` for details.

    !end-bullet!
-   !begin-bullet!
    gh now supports storing your GitHub personal access tokens (PAT) in
    the system keyring, via the keyring package. See `?gh_token` for
    details.

    !end-bullet!
-   !begin-bullet!
    `gh()` can now POST raw data, which allows adding assets to releases
    (#56).

    !end-bullet!

!end-bullets-11!

# gh 1.0.1

First public release.

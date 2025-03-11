# plumber (development version)

!begin-bullets-1!

-   !begin-bullet!
    Added support for Arrow IPC Streams (@josiahparry #968)
    !end-bullet!

!end-bullets-1!

# plumber 1.3.0

!begin-bullets-2!

-   !begin-bullet!
    The port many now be specified as an environment variable.
    User-provided ports must be between 1024 and 49151 (following IANA
    guidelines) and may not be a known unsafe port. plumber will now
    throw an error if an invalid port is requested. (@shikokuchuo
    @gadenbuie #963)

    !end-bullet!
-   !begin-bullet!
    Added support for graphic devices provided by {ragg} and {svglite}
    (@thomasp85 #964).

    !end-bullet!
-   !begin-bullet!
    `parse_rds()`, `parse_feather()`, and `parse_parquet()` no longer
    writes data to disk during parsing (@thomasp85, #942).

    !end-bullet!
-   !begin-bullet!
    Returning error messages are now turned off by default rather than
    being turned on if running interactively and turned off if not
    (@thomasp85, #962).

    !end-bullet!
-   !begin-bullet!
    New serializers:

    !begin-bullets-3!
    -   !begin-bullet!
        `serializer_excel()`: Return an object serialized by
        `writexl::write_xlsx` (@r2evans, #973).
        !end-bullet!

    !end-bullets-3!
    !end-bullet!
-   !begin-bullet!
    New request body parsers:

    !begin-bullets-4!
    -   !begin-bullet!
        `parser_excel()`: Parse request body as an excel workbook using
        `readxl::read_excel` (@r2evans, #973). This defaults to loading
        in the first worksheet only, you can use
        `@parse excel list(sheet=NA)` to import all worksheets. This
        always returns a list of frames, even if there is just one
        worksheet.
        !end-bullet!

    !end-bullets-4!
    !end-bullet!
-   !begin-bullet!
    Mounts now have a dynamic `req$PATH_INFO` instead of a pre-computed
    value. (#888)

    !end-bullet!
-   !begin-bullet!
    `validate_api_spec()` now uses `@redocly/cli` to validate the API
    spec. (#986)

    !end-bullet!
-   !begin-bullet!
    Added `operationId` to each operation within the auto-generated
    OpenAPI output. The value is similar to the `PATH-VERB`,
    e.g. `/users/create-POST`. (#986)

    !end-bullet!
-   !begin-bullet!
    Added support for graphic devices provided by ragg and svglite
    (@thomasp85 #964)

    !end-bullet!

!end-bullets-2!

# plumber 1.2.2

!begin-bullets-5!

-   !begin-bullet!
    Allow to set plumber options using environment variables
    `?options_plumber`. (@meztez #934)
    !end-bullet!
-   !begin-bullet!
    Add support for quoted boundary for multipart request parsing.
    (@meztez #924)
    !end-bullet!
-   !begin-bullet!
    Fix #916, related to `parseUTF8` return value attribute `srcfile` on
    Windows. (#930)
    !end-bullet!

!end-bullets-5!

# plumber 1.2.1

!begin-bullets-6!

-   !begin-bullet!
    Update docs for CRAN (#878)
    !end-bullet!

!end-bullets-6!

# plumber 1.2.0

## Breaking changes

!begin-bullets-7!

-   !begin-bullet!
    First line of endpoint comments interpreted as OpenAPI 'summary'
    field and subsequent comment lines interpreted as 'description'
    field. (@wkmor1 #805)
    !end-bullet!

!end-bullets-7!

## New features

!begin-bullets-8!

-   !begin-bullet!
    Static file handler now serves HEAD requests. (#798)

    !end-bullet!
-   !begin-bullet!
    Introduces new GeoJSON serializer and parser. GeoJSON objects are
    parsed into `sf` objects and `sf` or `sfc` objects will be
    serialized into GeoJSON. (@josiahparry, #830)

    !end-bullet!
-   !begin-bullet!
    Add new Octet-Stream serializer. This is a wrapper around the
    Content Type serializer with type `application/octet-stream`. (#864)

    !end-bullet!
-   !begin-bullet!
    Update feather serializer to use the arrow package. The new default
    feather MIME type is `application/vnd.apache.arrow.file`.
    (@pachadotdev #849)

    !end-bullet!
-   !begin-bullet!
    Add parquet serializer and parser by using the arrow package
    (@pachadotdev #849)

    !end-bullet!
-   !begin-bullet!
    Updated example `14-future` to use `promises::future_promise()` and
    added an endpoint that uses `{coro}` to write *simpler* async /
    `{promises}` code (#785)

    !end-bullet!
-   !begin-bullet!
    Add `path` argument to `pr_cookie()` allowing Secure cookies to
    define where they are served (@jtlandis #850)

    !end-bullet!

!end-bullets-8!

## Bug fixes

!begin-bullets-9!

-   !begin-bullet!
    OpenAPI specification collision when using `examples`. (@meztez
    #820)

    !end-bullet!
-   !begin-bullet!
    Static handler returns Last-Modified response header. (#798)

    !end-bullet!
-   !begin-bullet!
    OpenAPI response type detection had a scoping issue. Use serializer
    defined `Content-Type` header instead. (@meztez, #789)

    !end-bullet!
-   !begin-bullet!
    The default shared secret filter returns error responses without
    throwing an error. (#808)

    !end-bullet!
-   !begin-bullet!
    Remove response bodies (and therefore the Content-Length header) for
    status codes which forbid it under the HTTP specification (e.g. 1xx,
    204, 304). (@atheriel #758, @meztez #760)

    !end-bullet!
-   !begin-bullet!
    Decode path URI before attempting to serve static assets (@meztez
    #754).

    !end-bullet!

!end-bullets-9!

# plumber 1.1.0

## Breaking changes

!begin-bullets-10!

-   !begin-bullet!
    Force json serialization of endpoint error responses instead of
    using endpoint serializer. (@meztez, #689)

    !end-bullet!
-   !begin-bullet!
    When plumbing a Plumber file and using a Plumber router modifier
    (`#* @plumber`), an error will be thrown if the original router is
    not returned. (#738)

    !end-bullet!
-   !begin-bullet!
    `options_plumber()` now requires that all options are named. If no
    option name is provided, an error with be thrown. (#746)

    !end-bullet!

!end-bullets-10!

## New features

!begin-bullets-11!

-   !begin-bullet!
    Added option `plumber.trailingSlash`. This option (which is
    **disabled** by default) allows routes to be redirected to route
    definitions with a trailing slash. For example, if a `GET` request
    is submitted to `/test?a=1` with no `/test` route is defined, but a
    `GET` `/test/` route definition does exist, then the original
    request will respond with a `307` to reattempt against `GET`
    `/test/?a=1`. This option will be *enabled* by default in a future
    release. This logic executed for before calling the `404` handler.
    (#746)

    !end-bullet!
-   !begin-bullet!
    Added an experimental option `plumber.methodNotAllowed`. This option
    (which is enabled by default) allows for a status of `405` to be
    returned if an invalid method is used when requesting a valid route.
    This logic executed for before calling the default `404` handler.
    (#746)

    !end-bullet!
-   !begin-bullet!
    Passing `edit = TRUE` to `plumb_api()` will open the API source
    file. (#699)

    !end-bullet!
-   !begin-bullet!
    OpenAPI Specification can be set using a file path. (@meztez #696)

    !end-bullet!
-   !begin-bullet!
    Guess OpenAPI response content type from serializer. (@meztez #684)

    !end-bullet!
-   !begin-bullet!
    Undeprecated `Plumber$run(debug=, swaggerCallback=)` and added the
    parameters for `Plumber$run(docs=, quiet=)` and
    `pr_run(debug=, docs=, swaggerCallback=, quiet=)`. Now, all four
    parameters will not produce lingering effects on the `Plumber`
    router. (@jcheng5 #765)

    !begin-bullets-12!
    -   !begin-bullet!
        Setting `quiet = TRUE` will suppress routine startup messages.
        !end-bullet!
    -   !begin-bullet!
        Setting `debug = TRUE`, will display information when an error
        occurs. See `pr_set_debug()`.
        !end-bullet!
    -   !begin-bullet!
        Setting `docs` will update the visual documentation. See
        `pr_set_docs()`.
        !end-bullet!
    -   !begin-bullet!
        Set `swaggerCallback` to a function which will be called with a
        url to the documentation, or `NULL` to do nothing. See
        `pr_set_docs_callback()`.
        !end-bullet!

    !end-bullets-12!
    !end-bullet!
-   !begin-bullet!
    To update a `PlumberEndpoint` path after initialization, call the
    new `PlumberEndpoint$setPath(path)`. This will update internal path
    matching meta data. (Active bindings were not used to avoid breaking
    changes.) (@blairj09 #770)

    !end-bullet!
-   !begin-bullet!
    `PlumberStep` (and `PlumberEndpoint` and `PlumberFilter`) received a
    new field `$srcref` and method `$getFunc()`. `$srcref` will contain
    the corresponding `srcref` information from original source file.
    `$getFunc()` will return the evaluated function. (#782)

    !end-bullet!
-   !begin-bullet!
    Allow for spaces in `@apiTag` and `@tag` when tag is surrounded by
    single or double quotes. (#685)

    !end-bullet!

!end-bullets-11!

## Bug fixes

!begin-bullets-13!

-   !begin-bullet!
    Ignore regular comments in block parsing. (@meztez #718)

    !end-bullet!
-   !begin-bullet!
    Block parsing comments, tags and responses ordering match plumber
    api ordering. (#722)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where `httpuv` would return a status of `500` with body
    `An exception occurred` if no headers were set on the response
    object. (#745)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where all `pr_*()` returned invisibly. Now all `pr_*()`
    methods will print the router if displayed in the console. (#740)

    !end-bullet!
-   !begin-bullet!
    When calling `Plumber$handle()` and defining a new
    `PlumberEndpoint`, `...` will be checked for invalid names.
    (@meztez, #677)

    !end-bullet!
-   !begin-bullet!
    `/__swagger__/` now always redirects to `/__docs__/`, even when
    Swagger isn't the selected interface. Use
    `options(plumber.legacyRedirects = FALSE)` to disable this behavior.
    (@blairj09 #694)

    !end-bullet!
-   !begin-bullet!
    Fixed `available_apis()` bug where all packages printed all
    available APIs. (@meztez #708)

    !end-bullet!
-   !begin-bullet!
    Fixed Plumber `$routes` resolution bugs. Routes are now returned in
    lexicographical order. (@meztez #702)

    !end-bullet!
-   !begin-bullet!
    Plumber will now display a circular reference if one is found while
    printing. (#738)

    !end-bullet!
-   !begin-bullet!
    Changed `future::plan()` from `multiprocess` to `multisession` in
    example API `14-future` as "Strategy 'multiprocess' is deprecated in
    future (\>= 1.20.0)". (#747)

    !end-bullet!
-   !begin-bullet!
    Setting options `plumber.docs.callback` to `NULL` will also set
    deprecated but supported option `plumber.swagger.url`. (#766)

    !end-bullet!

!end-bullets-13!

# plumber 1.0.0

## New features

### Plumber router

!begin-bullets-14!

-   !begin-bullet!
    Added support for promises in endpoints, filters, and hooks. This
    allows for multi-core execution when paired with `future`. See
    `plumb_api("plumber", "13-promises")` and
    `plumb_api("plumber", "14-future")` for example implementations.
    (#248)

    !end-bullet!
-   !begin-bullet!
    Added a Tidy API for more natural usage with magrittr's `%>%`. For
    example, a plumber object can now be initiated and run with
    `pr() %>% pr_run(port = 8080)`. For more examples, see here
    (@blairj09, #590)

    !end-bullet!
-   !begin-bullet!
    Added support for `#' @plumber` tag to gain programmatic access to
    the `plumber` router via `function(pr) {....}`. See
    `system.file("plumber/06-sessions/plumber.R", package = "plumber")`
    and how it adds cookie support from within `plumber.R`. (@meztez and
    @blairj09, #568)

    !end-bullet!
-   !begin-bullet!
    Added `plumb_api()` for standardizing where to locate
    (`inst/plumber`) and how to run (`plumb_api(package, name)`) plumber
    apis inside an R package. To view the available Plumber APIs, call
    `available_apis()`. (#631)

    !end-bullet!
-   !begin-bullet!
    Improved argument handling in Plumber Endpoint route definitions.
    See
    `system.file("plumber/17-arguments/plumber.R", package = "plumber")`
    to view an example with expected output and
    `plumb_api("plumber", "17-arguments")` to retrieve the api.
    Improvements include:

    !begin-bullets-15!
    -   !begin-bullet!
        The value supplied to `req` and `res` arguments in a route
        definition are now *always* Plumber request and response
        objects. In the past, this was not guaranteed. (#666, #637)
        !end-bullet!
    -   !begin-bullet!
        To assist with conflicts in argument names deriving from
        different locations, `req$argsQuery`, `req$argsPath`, and
        `req$argsBody` have been added to access query, path, and
        `req$body` parameters, respectively. For this reason, we suggest
        defining routes with only `req` and `res` (i.e.,
        `function(req, res) {}`) and accessing argument(s) under these
        new fields to avoid naming conflicts. (#637)
        !end-bullet!
    -   !begin-bullet!
        An error is no longer thrown if multiple arguments are matched
        to an Plumber Endpoint route definition. Instead, Plumber now
        retains the first named argument according to the highest
        priority match (`req$argsQuery` is 1st priority, then
        `req$argsPath`, then `req$argsBody`). (#666)
        !end-bullet!
    -   !begin-bullet!
        Unnamed elements that are added to `req$args` by filters or
        creating `req$argsBody` will no longer throw an error. They will
        only be passed through via `...` (#666)
        !end-bullet!

    !end-bullets-15!
    !end-bullet!

!end-bullets-14!

### OpenAPI

!begin-bullets-16!

-   !begin-bullet!
    API Documentation is now hosted at `/__docs__`. If `swagger`
    documentation is being used, `/__swagger__` will redirect to
    `/__docs__`. (#654)

    !end-bullet!
-   !begin-bullet!
    Added OpenAPI support for array parameters using syntax
    `name:[type]` and new type `list` (synonym df, data.frame).
    (@meztez, #532)

    !end-bullet!
-   !begin-bullet!
    Added user provided OpenAPI Specification handler to Plumber router.
    Use `$setApiSpec()` to provide a function to alter the Plumber
    generated OpenAPI Specification returned by Plumber router method
    `$getApiSpec()`. This also affects `/openapi.json` and
    `/openapi.yaml` (#365)(@meztez, #562)

    !end-bullet!
-   !begin-bullet!
    Added `validate_api_spec()` to validate a Plumber API produces a
    valid OpenAPI Specification. (Experimental!) (#633)

    !end-bullet!

!end-bullets-16!

### Serializers

!begin-bullets-17!

-   !begin-bullet!
    Added `as_attachment(value, filename)` method which allows routes to
    return a file attachment with a custom name. (#585)

    !end-bullet!
-   !begin-bullet!
    Serializer functions can now return `PlumberEndpoint` `preexec` and
    `postexec` hooks in addition to a `serializer` function by using
    `endpoint_serializer()`. This allows for image serializers to turn
    on their corresponding graphics device before the route executes and
    turn the graphics device off after the route executes. (#630)

    !end-bullet!
-   !begin-bullet!
    PNG, JPEG, and SVG image serializers have been exported in methods
    `serializer_png()`, `serializer_jpeg()`, and `serializer_svg()`
    respectively. In addition to these methods, `serializer_tiff()`,
    `serializer_bmp()`, and `serializer_pdf()` have been added. Each
    graphics device serializer wraps around `serializer_device()`, which
    should be used when making more graphics device serializers. (#630)

    !end-bullet!
-   !begin-bullet!
    New serializers

    !begin-bullets-18!
    -   !begin-bullet!
        `serializer_yaml()`: Return an object serialized by `yaml`
        (@meztez, #556)
        !end-bullet!
    -   !begin-bullet!
        `serializer_csv()`: Return a comma separated value
        (@pachamaltese, #520)
        !end-bullet!
    -   !begin-bullet!
        `serializer_tsv()`: Return a tab separated value (#630)
        !end-bullet!
    -   !begin-bullet!
        `serializer_feather()`: Return a object serialized by `feather`
        (#626)
        !end-bullet!
    -   !begin-bullet!
        `serializer_text()`: Return text content (#585)
        !end-bullet!
    -   !begin-bullet!
        `serializer_cat()`: Return text content after calling `cat()`
        (#585)
        !end-bullet!
    -   !begin-bullet!
        `serializer_print()`: Return text content after calling
        `print()` (#585)
        !end-bullet!
    -   !begin-bullet!
        `serializer_format()`: Return text content after calling
        `format()` (#585)
        !end-bullet!
    -   !begin-bullet!
        `serializer_svg()`: Return an image saved as an SVG
        (@pachamaltese, #398)
        !end-bullet!
    -   !begin-bullet!
        `serializer_headers(header_list)`: Method which sets a list of
        static headers for each serialized value. Heavily inspired from
        @ycphs (#455). (#585)
        !end-bullet!
    -   !begin-bullet!
        `serializer_write_file()`: Method which wraps
        `serializer_content_type()`, but orchestrates creating, writing
        serialized content to, reading from, and removing a temp file.
        (#660)
        !end-bullet!

    !end-bullets-18!
    !end-bullet!

!end-bullets-17!

### Body parsing

!begin-bullets-19!

-   !begin-bullet!
    Added support for request body parsing (@meztez, #532)

    !end-bullet!
-   !begin-bullet!
    New request body parsers

    !begin-bullets-20!
    -   !begin-bullet!
        `parser_csv()`: Parse request body as a commas separated value
        (#584)
        !end-bullet!
    -   !begin-bullet!
        `parser_json()`: Parse request body as JSON (@meztez, #532)
        !end-bullet!
    -   !begin-bullet!
        `parser_multi()`: Parse multi part request bodies (@meztez,
        #532) and (#663)
        !end-bullet!
    -   !begin-bullet!
        `parser_octet()`: Parse request body octet stream (@meztez,
        #532)
        !end-bullet!
    -   !begin-bullet!
        `parser_form()`: Parse request body as form input (@meztez,
        #532)
        !end-bullet!
    -   !begin-bullet!
        `parser_rds()`: Parse request body as RDS file input (@meztez,
        #532)
        !end-bullet!
    -   !begin-bullet!
        `parser_text()`: Parse request body plain text (@meztez, #532)
        !end-bullet!
    -   !begin-bullet!
        `parser_tsv()`: Parse request body a tab separated value (#584)
        !end-bullet!
    -   !begin-bullet!
        `parser_yaml()`: Parse request body as `yaml` (#584)
        !end-bullet!
    -   !begin-bullet!
        `parser_none()`: Do not parse the request body (#584)
        !end-bullet!
    -   !begin-bullet!
        `parser_yaml()`: Parse request body (@meztez, #556)
        !end-bullet!
    -   !begin-bullet!
        `parser_feather()`: Parse request body using `feather` (#626)
        !end-bullet!
    -   !begin-bullet!
        Pseudo parser named `"all"` to allow for using all parsers. (Not
        recommended in production!) (#584)
        !end-bullet!

    !end-bullets-20!
    !end-bullet!
-   !begin-bullet!
    The parsed request body values is stored at `req$body`. (#663)

    !end-bullet!
-   !begin-bullet!
    If `multipart/*` content is parsed, `req$body` will contain named
    output from `webutils::parse_multipart()` and add the parsed value
    to each part. Look here for access to all provided information
    (e.g., `name`, `filename`, `content_type`, etc). In addition,
    `req$argsBody` (which is used for route argument matching) will
    contain a named reduced form of this information where `parsed`
    values (and `filename`s) are combined on the same `name`. (#663)

    !end-bullet!

!end-bullets-19!

### Visual Documentation

!begin-bullets-21!

-   !begin-bullet!
    Generalize user interface integration. Plumber can now use other
    OpenAPI compatible user interfaces like `RapiDoc`
    (https://github.com/mrin9/RapiDoc) and `Redoc`
    (https://github.com/Redocly/redoc). Pending CRAN approbations,
    development R packages are available from
    https://github.com/meztez/rapidoc/ and
    https://github.com/meztez/redoc/. (@meztez, #562)

    !end-bullet!
-   !begin-bullet!
    Changed Swagger UI to use swagger R package to display the swagger
    page. (#365)

    !end-bullet!
-   !begin-bullet!
    Added support for swagger for mounted routers (@bradleyhd, #274).

    !end-bullet!

!end-bullets-21!

## Security improvements

!begin-bullets-22!

-   !begin-bullet!
    Secret session cookies are now encrypted using `sodium`. All prior
    `req$session` information will be lost. Please see `?session_cookie`
    for more information. (#404)

    !end-bullet!
-   !begin-bullet!
    Session cookies set the `HttpOnly` flag by default to mitigate
    cross-site scripting (XSS). Please see `?session_cookie` for more
    information. (#404)

    !end-bullet!
-   !begin-bullet!
    Wrap `jsonlite::fromJSON` to ensure that `jsonlite` never reads
    input as a remote address (such as a file path or URL) and attempts
    to parse that. The only known way to exploit this behavior in
    plumber unless an API were using encrypted cookies and an attacker
    knew the encryption key in order to craft arbitrary cookies. (#325)

    !end-bullet!

!end-bullets-22!

## Breaking changes

!begin-bullets-23!

-   !begin-bullet!
    When `plumb()`ing a file (or `Plumber$new(file)`), the working
    directory is set to the file's directory before parsing the file.
    When running the Plumber API, the working directory will be set to
    file's directory before running.(#631)

    !end-bullet!
-   !begin-bullet!
    Plumber's OpenAPI Specification is now defined using OpenAPI 3,
    upgrading from Swagger Specification. (#365)

    !end-bullet!
-   !begin-bullet!
    Plumber router `$run()` method arguments `swagger`,
    `swaggerCallback` and `debug` are now deprecated. User interface and
    url callback are now enabled by default and managed through Plumber
    router `$setDocs()`, `$setDocsCallback()`, and `$setDebug()` methods
    and options `plumber.docs` and `plumber.docs.callback`. (@meztez,
    #562)

    !end-bullet!
-   !begin-bullet!
    `plumb()` now returns an object of class `"Plumber"` (previously
    `"plumber"`). To check if an object is a Plumber router, use new
    method `is_plumber()`. (#653)

    !end-bullet!
-   !begin-bullet!
    `PlumberStatic` objects now have a class of `"PlumberStatic"`
    (previously `"plumberstatic"`). (#653)

    !end-bullet!
-   !begin-bullet!
    The source files used in plumber **must use** the UTF-8 encoding if
    they contain non-ASCII characters (@shrektan, #312, #328).

    !end-bullet!
-   !begin-bullet!
    `options(plumber.debug)` is not set anymore when running the plumber
    application. Instead retrieve the debug value using `$getDebug()` on
    the Plumber router directly. Ex:
    `function(req, res) { req$pr$getDebug() }`. (#639)

    !end-bullet!
-   !begin-bullet!
    `PlumberEndpoint`'s method `$exec()` now has a shape of
    `$exec(req, res)` (vs `$exec(...)`). This allows for fine tune
    control over the arguments being sent to the endpoint function.

    !end-bullet!
-   !begin-bullet!
    When creating a `PlumberFilter` or `PlumberEndpoint`, an error will
    be thrown if `expr` does not evaluate to a function. (#666)

    !end-bullet!

!end-bullets-23!

## Deprecations

!begin-bullets-24!

-   !begin-bullet!
    Shorthand serializers are now deprecated. `@html`, `@json`, `@png`,
    `@jpeg`, `@svg` should be replaced with the `@serializer` syntax.
    Ex: `@serializer html` or `@serializer jpeg` (#630)

    !end-bullet!
-   !begin-bullet!
    `plumber` R6 object has been deprecated and renamed to `Plumber`.
    `PlumberStatic`'s `inherit`ed class has been updated to `Plumber`.
    (#653)

    !end-bullet!
-   !begin-bullet!
    `hookable` R6 object has been deprecated and renamed to `Hookable`.
    `Plumber` and `PlumberStep`'s `inherit`ed class has been updated to
    `Hookable`. (#653)

    !end-bullet!
-   !begin-bullet!
    `addSerializer()` has been deprecated in favor of
    `register_serializer()` (#584)

    !end-bullet!
-   !begin-bullet!
    `getCharacterSet()` has been deprecated in favor of
    `get_character_set()` (#651)

    !end-bullet!
-   !begin-bullet!
    `randomCookieKey()` has been deprecated in favor of
    `random_cookie_key()` (#651)

    !end-bullet!
-   !begin-bullet!
    `sessionCookie()` has been deprecated in favor of `session_cookie()`
    (#651)

    !end-bullet!
-   !begin-bullet!
    DigitalOcean helper functions are now defunct (`do_*()`). The
    functionality and documentation on how to deploy to DigitalOcean has
    been moved to `plumberDeploy` (by @meztez) (#649)

    !end-bullet!

!end-bullets-24!

## Minor new features and improvements

!begin-bullets-25!

-   !begin-bullet!
    Documentation is updated and now presented using `pkgdown` (#570)

    !end-bullet!
-   !begin-bullet!
    New hex logo! Thank you @allisonhorst ! (#570)

    !end-bullet!
-   !begin-bullet!
    Added helper method `is_plumber(pr)` to determine if an object is a
    Plumber router. (#653)

    !end-bullet!
-   !begin-bullet!
    Added support for the `SameSite` Cookie attribute. (@chris-dudley,
    #640)

    !end-bullet!
-   !begin-bullet!
    When calling `include_file()`, the `content_type` is automatically
    inferred from the file extension if `content_type` is not provided.
    (#631)

    !end-bullet!
-   !begin-bullet!
    When `plumb()`ing a file, arguments supplied to parsers and
    serializers may be values defined earlier in the file. (@meztez,
    #620)

    !end-bullet!
-   !begin-bullet!
    Updated Docker files. New Docker repo is now `rstudio/plumber`.
    Updates heavily inspired from @mskyttner (#459). (#589)

    !end-bullet!
-   !begin-bullet!
    Support HTTP 405 Code. (@meztez, #554)

    !end-bullet!
-   !begin-bullet!
    Attached the Plumber router to the incoming request object at
    `req$pr`. (@meztez, #554)

    !end-bullet!
-   !begin-bullet!
    Documented plumber options. Added `options_plumber()`. (@meztez,
    #555)

    !end-bullet!
-   !begin-bullet!
    Update documentation on R6 objects (@meztez, #530)

    !end-bullet!
-   !begin-bullet!
    Fix `plumb()` function when `plumb()`ing a directory so that
    `plumber.R` is not a requirement if a valid `entrypoint.R` file is
    found. (@blairj09, #471).

    !end-bullet!
-   !begin-bullet!
    If cookie information is too large (\> 4093 bytes), a warning will
    be displayed. (#404)

    !end-bullet!
-   !begin-bullet!
    Added new shorthand types for url parameters. (@byzheng, #388)

    !end-bullet!
-   !begin-bullet!
    Plumber files are now only evaluated once. Prior plumber behavior
    sourced endpoint functions twice and non-endpoint code blocks once.
    (#328)

    !end-bullet!
-   !begin-bullet!
    Improve speed of `canServe()` method of the `PlumberEndpoint` class
    (@atheriel, #484)

    !end-bullet!
-   !begin-bullet!
    Get more file extension content types using the `mime` package.
    (#660)

    !end-bullet!
-   !begin-bullet!
    Endpoints that produce images within a `promises::promise()` will
    now use the expected graphics device. (#669)

    !end-bullet!

!end-bullets-25!

## Bug fixes

!begin-bullets-26!

-   !begin-bullet!
    Handle plus signs in URI as space characters instead of actual plus
    signs (@meztez, #618)

    !end-bullet!
-   !begin-bullet!
    Paths that are missing a leading `/` have a `/` prepended to the
    path location. (#656)

    !end-bullet!
-   !begin-bullet!
    Fix possible bugs due to mounted routers without leading slashes
    (@atheriel, #476 #501).

    !end-bullet!
-   !begin-bullet!
    Modified images serialization to use content-type serializer. Fixes
    issue with images pre/postserialize hooks (@meztez, #518).

    !end-bullet!
-   !begin-bullet!
    Fix bug preventing error handling when a serializer fails
    (@antoine-sachet, #490)

    !end-bullet!
-   !begin-bullet!
    Fix URL-decoding of query parameters and URL-encoding/decoding of
    cookies. Both now use `httpuv::decodeURIComponent` instead of
    `httpuv::decodeURI`. (@antoine-sachet, #462)

    !end-bullet!
-   !begin-bullet!
    Fixed bug where functions defined earlier in the file could not be
    found when `plumb()`ing a file. (#416)

    !end-bullet!
-   !begin-bullet!
    A multiline request body is now collapsed to a single line
    (@robertdj, #270 #297).

    !end-bullet!
-   !begin-bullet!
    Bumped version of httpuv to \>= 1.4.5.9000 to address an unexpected
    segfault (@shapenaji, #289)

    !end-bullet!
-   !begin-bullet!
    Date response header is now supplied by httpuv and not plumber.
    Fixes non standard date response header issues when using different
    locales. (@shrektan, #319, #380)

    !end-bullet!
-   !begin-bullet!
    Due to incompatibilities with `multipart` body values,
    `req$postBody` will only be calculated if accessed. It is strongly
    recommended to use `req$bodyRaw` when trying to create content from
    the input body. (#665)

    !end-bullet!

!end-bullets-26!

# plumber 0.4.6

!begin-bullets-27!

-   !begin-bullet!
    BUGFIX: Hooks that accept a `value` argument (`postroute`,
    `preserialize`, and `postserialize`) now modify the incoming value
    as documented.
    !end-bullet!
-   !begin-bullet!
    BUGFIX: The `postserialize` hook is now given the serialized data as
    its `value` parameter.
    !end-bullet!
-   !begin-bullet!
    BUGFIX: properly handle cookie expiration values (#216).
    !end-bullet!
-   !begin-bullet!
    Add support for tags in Swagger docs (#230).
    !end-bullet!
-   !begin-bullet!
    Optional `swaggerCallback` parameter for `run()` to supply a
    callback function for reporting the url for swagger page.
    !end-bullet!
-   !begin-bullet!
    Add RStudio Project Template to package.
    !end-bullet!

!end-bullets-27!

# plumber 0.4.4

!begin-bullets-28!

-   !begin-bullet!
    Support Expiration, HTTPOnly, and Secure flags on cookies (#87).
    **EDIT**: see #216 which prevented expiration from working.
    !end-bullet!
-   !begin-bullet!
    BUGFIX: properly handle named query string and post body arguments
    in mounted subrouters.
    !end-bullet!
-   !begin-bullet!
    Added support for static sizing of images. `@png` and `@jpeg` now
    accept a parenthetical list of arguments that will be passed into
    the `png()` or `jpeg()` call. This enables annotations like
    `#' @png (width = 200, height=500)`.
    !end-bullet!
-   !begin-bullet!
    Enable `ByteCompile` flag
    !end-bullet!
-   !begin-bullet!
    Set working directory for DigitalOcean APIs.
    !end-bullet!
-   !begin-bullet!
    Respect `setErrorHandler`
    !end-bullet!
-   !begin-bullet!
    BUGFIX: export `PlumberStatic`
    !end-bullet!
-   !begin-bullet!
    Case-insensitive matching on `plumber.r` and `entrypoint.r` when
    `plumb()`ing a directory.
    !end-bullet!
-   !begin-bullet!
    Support query strings with keys that appear more than once (#165)
    !end-bullet!
-   !begin-bullet!
    Fix the validation error warning at the bottom of deployed Swagger
    files which would have appeared any time your `swagger.json` file
    was hosted in such a way that a hosted validator service would not
    have been able to access it. For now we just suppress validation of
    swagger.json files. (#149)
    !end-bullet!
-   !begin-bullet!
    Support for floating IPs in DNS check that occurs in
    `do_configure_https()`
    !end-bullet!
-   !begin-bullet!
    Make adding swap file idempotent in `do_provision()` so you can now
    call that on a single droplet multiple times.
    !end-bullet!
-   !begin-bullet!
    Support an `exit` hook which can define a function that will be
    evaluated when the API is interrupted. e.g.
    `pr <- plumb("plumber.R"); pr$registerHook("exit", function(){ print("Bye bye!") })`
    !end-bullet!
-   !begin-bullet!
    Fixed bug in which a single function couldn't support multiple paths
    for a single verb (#203).
    !end-bullet!
-   !begin-bullet!
    Support negative numbers in numeric path segments (#212)
    !end-bullet!
-   !begin-bullet!
    Support `.` in string path segments
    !end-bullet!

!end-bullets-28!

# plumber 0.4.2

!begin-bullets-29!

-   !begin-bullet!
    Development version for 0.4.2. Will be working to move to even/odd
    release cycles, but I had prematurely bumped to 0.4.0 so that one
    might get skipped, making the next CRAN release 0.4.2.
    !end-bullet!

!end-bullets-29!

# plumber 0.4.0

!begin-bullets-30!

-   !begin-bullet!
    BREAKING: Listen on localhost instead of listening publicly by
    default.
    !end-bullet!
-   !begin-bullet!
    BREAKING: We no longer set the `Access-Control-Allow-Origin` HTTP
    header to `*`. This was previously done for convenience but we've
    decided to prioritize security here by removing this default. You
    can still add this header to any route you want to be accessible
    from other origins.
    !end-bullet!
-   !begin-bullet!
    BREAKING: Listen on a random port by default instead of always
    on 8000. This can be controlled using the `port` parameter in
    `run()`, or by setting the `plumber.port` option.
    !end-bullet!
-   !begin-bullet!
    BREAKING: Removed `PlumberProcessor` class and replaced with a
    notion of hooks. See `registerHook` and `registerHooks` on the
    Plumber router.
    !end-bullet!
-   !begin-bullet!
    BREAKING: `addGlobalProcessor` method on Plumber routers now takes a
    list which are added as hooks instead of a Processor. Note that
    `sessionCookie` has also been updated to behave accordingly, meaning
    that the convention of
    `pr$addGlobalProcessor(sessionCookie("secret", "cookieName"))` will
    continue to work for this release.
    !end-bullet!
-   !begin-bullet!
    BREAKING: `sessionCookie` now returns a list instead of a Processor.
    Note that `addGlobalProcessor` has also been updated to behave
    accordingly, meaning that the convention of
    `pr$addGlobalProcessor(sessionCookie("secret", "cookieName"))` will
    continue to work for this release.
    !end-bullet!
-   !begin-bullet!
    DEPRECATION: Deprecated the `addAssets` method on Plumber routers.
    Use `PlumberStatic` and the `mount` method to attach a static
    router.
    !end-bullet!
-   !begin-bullet!
    DEPRECATION: Deprecated the `addEndpoint` method in favor of the
    `handle` method for Plumber routers. Removed support for the
    `processors`, `params`, and `comments` parameters are no longer
    supported.
    !end-bullet!
-   !begin-bullet!
    DEPRECATION: Deprecated the `addFilter` method on Plumber routers in
    favor of the new `filter` method. Removed support for the processor
    parameter.
    !end-bullet!
-   !begin-bullet!
    DEPRECATION: Deprecated the `addGlobalProcessor` method on Plumber
    routers.
    !end-bullet!
-   !begin-bullet!
    The undocumented `setDefaultErrorHandler` method on Plumber routers
    now takes a function that returns the error handler function. The
    top-level function takes a single param named `debug` which is
    managed by the `debug` parameter in the `run()` method.
    !end-bullet!
-   !begin-bullet!
    Added support for `OPTIONS` HTTP requests via the `@options`
    annotation.
    !end-bullet!
-   !begin-bullet!
    Add support for `entrypoint.R` when `plumb()`ing a directory. If
    this file exists, it is expected to return a Plumber router
    representing the API contained in this directory. If it doesn't
    exist, the behavior is unaltered. If both `plumber.R` and
    `entrypoint.R` exist, `entrypoint.R` takes precedence.
    !end-bullet!
-   !begin-bullet!
    `plumb()` the current directory by default if no arguments are
    provided.
    !end-bullet!
-   !begin-bullet!
    Added a `debug` parameter to the `run` method which can be set to
    `TRUE` in order to get more insight into your API errors.
    !end-bullet!

!end-bullets-30!

# plumber 0.3.3

!begin-bullets-31!

-   !begin-bullet!
    `plumb()` now accepts an argument `dir`, referring to a directory
    containing `plumber.R`, which may be provided instead of `file`.
    !end-bullet!

!end-bullets-31!

# plumber 0.3.2

!begin-bullets-32!

-   !begin-bullet!
    Introduced the `do_provision()`, `do_deploy_api()`,
    `do_remove_api()` and `do_configure_https()` functions to provision
    and manage your APIs on a cloud server running on DigitalOcean.
    !end-bullet!
-   !begin-bullet!
    `source()` the referenced R file to plumb inside of a new
    environment that inherits directly from the GlobalEnv. This provides
    more explicit control over exactly how this environment should
    behave.
    !end-bullet!
-   !begin-bullet!
    Added `@serializer htmlwidget` to support rendering and returning a
    self-contained htmlwidget from a plumber endpoint.
    !end-bullet!
-   !begin-bullet!
    Properly handle cookies with no value. (#88)
    !end-bullet!
-   !begin-bullet!
    Don't convert `+` character in a query string to a space.
    !end-bullet!

!end-bullets-32!

# plumber 0.3.1

!begin-bullets-33!

-   !begin-bullet!
    Add a method to consume JSON on post (you can still send a query
    string in the body of a POST request as well).
    !end-bullet!

!end-bullets-33!

# plumber 0.3.0

!begin-bullets-34!

-   !begin-bullet!
    BREAKING CHANGE: serializer factories are now registered instead of
    the serializer themselves. Thus, `addSerializer()` now expects a
    function that returns a serializer, and `Response$new()` now expects
    a serializer itself rather than a character string naming a
    serializer. Internally it is the serializer itself that is attached
    to the response rather than the name of the serializer. This allows
    for a serializer to customize its behavior.
    !end-bullet!
-   !begin-bullet!
    Accept an additional argument on the `@serializer` annotation -- R
    code that will be passed in as an argument to the serializer
    factory. See example `09-content-type`.
    !end-bullet!

!end-bullets-34!

# plumber 0.2.4

!begin-bullets-35!

-   !begin-bullet!
    Add a filter which parses and sets req\$cookies to be a list
    corresponding to the cookies provided with the request.
    !end-bullet!
-   !begin-bullet!
    Responses can set multiple cookies
    !end-bullet!
-   !begin-bullet!
    Bug Fix: convert non-character arguments in setCookie to character
    before URL- encoding.
    !end-bullet!

!end-bullets-35!

# plumber 0.2.3

!begin-bullets-36!

-   !begin-bullet!
    Set options(warn=1) during execution of user code so that warnings
    are immediately visible in the console, rather than storing them
    until the server is stopped.
    !end-bullet!

!end-bullets-36!

# plumber 0.2.2

!begin-bullets-37!

-   !begin-bullet!
    Add `sessionCookie` function to define a processor that can be used
    as a globalProcessor on a router to encrypt values from req\$session
    and store them as an encrypted cookie in on the user's browser.
    !end-bullet!
-   !begin-bullet!
    Added `setCookie` method to response which (primitively) allows you
    to set a cookie to be included in the response.
    !end-bullet!
-   !begin-bullet!
    Add `addGlobalProcessor` method on `plumber` class to support a
    processor that runs a processor only a single time, before and then
    after all other filters and the endpoint.
    !end-bullet!
-   !begin-bullet!
    Document all public params so CHECK passes
    !end-bullet!

!end-bullets-37!

# plumber 0.2.1

!begin-bullets-38!

-   !begin-bullet!
    Add more `roxygen2` documentation for exported functions
    !end-bullet!
-   !begin-bullet!
    Remove the warning in the README as the API seems to be stabilizing.
    !end-bullet!

!end-bullets-38!

# plumber 0.2.0

!begin-bullets-39!

-   !begin-bullet!
    BREAKING: Changed variable-path routing to use bracketed format
    instead of just a colon.
    !end-bullet!
-   !begin-bullet!
    BREAKING: Renamed `PlumberRouter` R6 object to just `Plumber`.
    !end-bullet!
-   !begin-bullet!
    Support `addEndpoint()` and `addFilter()` on the `Plumber` object.
    !end-bullet!
-   !begin-bullet!
    Added support for the `#*` prefix.
    !end-bullet!

!end-bullets-39!

# plumber 0.1.0

!begin-bullets-40!

-   !begin-bullet!
    Initial Release
    !end-bullet!

!end-bullets-40!

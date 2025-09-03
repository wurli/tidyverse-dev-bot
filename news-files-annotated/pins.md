# pins (development version)

!begin-bullets-1!

-   !begin-bullet!
    Added support of the `qs2` format (#865, @atsyplenkov).

    !end-bullet!
-   !begin-bullet!
    Added download progress bar for `board_url()` (#872, @lbm364dl).

    !end-bullet!
-   !begin-bullet!
    Added support for writing pins with multiple types, like
    `type = c("rds", "csv")` (#877, @lbm364dl).

    !end-bullet!

!end-bullets-1!

# pins 1.4.1

!begin-bullets-2!

-   !begin-bullet!
    Support new `preview_data` parameter for pin previews on Posit
    Connect (#850).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in how `pin_upload()` handles pin names (#852).

    !end-bullet!
-   !begin-bullet!
    Improved documentation for S3-compatible object storage (#853).

    !end-bullet!
-   !begin-bullet!
    Prepend 'https://' to Databricks host if missing (#855).

    !end-bullet!
-   !begin-bullet!
    Fixed handling of `rsconnect::accounts()` results (#861).

    !end-bullet!
-   !begin-bullet!
    Escalated gradual deprecation process for legacy pins functions such
    as `pin()` (#864).

    !end-bullet!

!end-bullets-2!

# pins 1.4.0

## Lifecycle changes

!begin-bullets-3!

-   !begin-bullet!
    Changed the function signature of `pin_upload()` to be consistent
    with `pin_write()` i.e. arguments like `tags` must be passed by name
    and not position (#809).

    !end-bullet!
-   !begin-bullet!
    Started gradual deprecation process for legacy pins functions such
    as `pin()` (#844).

    !end-bullet!

!end-bullets-3!

## Other improvements

!begin-bullets-4!

-   !begin-bullet!
    Added example Python code to pin previews for Posit Connect (#806).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in how pins with the same name but different owners on
    Posit Connect were identified (#808).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in handling folders with duplicate names for Google
    Drive (#819, @UchidaMizuki).

    !end-bullet!
-   !begin-bullet!
    Fixed how previously deleted pin versions are detected (#838,
    @MichalLauer).

    !end-bullet!
-   !begin-bullet!
    Added new board for Databricks Volumes `board_databricks()` (#839,
    @edgararuiz).

    !end-bullet!
-   !begin-bullet!
    Switched writing with `type = "parquet"` to use the nanoparquet
    package (#843).

    !end-bullet!

!end-bullets-4!

# pins 1.3.0

## Breaking changes

!begin-bullets-5!

-   !begin-bullet!
    Changed the function signature of `pin_write()` so arguments like
    `type` and `title` must be passed by name and not position (#792).
    !end-bullet!

!end-bullets-5!

## Other improvements

!begin-bullets-6!

-   !begin-bullet!
    Removed content and user caches for Connect altogether. Now, we look
    up usernames and content on the Connect server every time (#793).

    !end-bullet!
-   !begin-bullet!
    Added new `urls` item to metadata for a pin (#795).

    !end-bullet!

!end-bullets-6!

# pins 1.2.2

!begin-bullets-7!

-   !begin-bullet!
    Fixed how dots are checked in `pin_write()` to make user-facing
    messages more clear (#770).

    !end-bullet!
-   !begin-bullet!
    Improved documentation about Connect caches (#771) and deleting pin
    versions (#773).

    !end-bullet!
-   !begin-bullet!
    Added `board_deparse` for `board_url()` (#774).

    !end-bullet!
-   !begin-bullet!
    Fixed how `board_gdrive()` handles dribble objects (#780, @gorkang
    and #782).

    !end-bullet!

!end-bullets-7!

# pins 1.2.1

!begin-bullets-8!

-   !begin-bullet!
    New environment variable `PINS_CACHE_DIR` controls the location of
    the default cache path (#748).

    !end-bullet!
-   !begin-bullet!
    Added new board for Google Drive `board_gdrive()` (#749).

    !end-bullet!
-   !begin-bullet!
    Updated test for new arrow release (#764).

    !end-bullet!

!end-bullets-8!

# pins 1.2.0

## Breaking changes

!begin-bullets-9!

-   !begin-bullet!
    `pin_write()` no longer writes identical pin contents by default,
    and gains a `force_identical_write` argument for writing even when
    the pin contents are identical to the last version (#735).
    !end-bullet!

!end-bullets-9!

## Other improvements

!begin-bullets-10!

-   !begin-bullet!
    The `print` method for boards no longer calls `pin_list()`
    internally (#718).

    !end-bullet!
-   !begin-bullet!
    `board_s3()` now uses pagination for listing and versioning (#719,
    @mzorko).

    !end-bullet!
-   !begin-bullet!
    Added `type = "parquet"` to read and write Parquet files (#729).

    !end-bullet!
-   !begin-bullet!
    Updated error messages and type checking (#731) along with testing
    strategy (#724).

    !end-bullet!
-   !begin-bullet!
    Added new check for whether a new version is the same as the
    previous version, as can happen when writing pin versions very
    quickly (#727).

    !end-bullet!
-   !begin-bullet!
    Added new `headers` argument for `board_url()`, mostly for
    authentication, as well as new board for Connect vanity URLs
    `board_connect_url()` (#732).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `cache_prune()` to correctly find caches for
    `board_url()` (#734).

    !end-bullet!

!end-bullets-10!

# pins 1.1.0

## Breaking changes

!begin-bullets-11!

-   !begin-bullet!
    Change the function `board_rsconnect()` to `board_connect()`,
    following RStudio's rebranding to Posit (#689).

    !end-bullet!
-   !begin-bullet!
    Changed `type = "csv"` to use R's default value for
    `stringsAsFactors` i.e. `FALSE` (#664).

    !end-bullet!
-   !begin-bullet!
    Functions for viewing legacy API pins in the RStudio Viewer pane are
    now deprecated (when possible) or removed (#679).

    !end-bullet!
-   !begin-bullet!
    The functions for accessing Kaggle resource as pins are no longer
    supported. We recommend you use the Kaggle CLI instead (#698).

    !end-bullet!

!end-bullets-11!

## Other improvements

!begin-bullets-12!

-   !begin-bullet!
    Added vignettes describing how to manage custom formats and
    web-based boards (#631, #685, @ijlyttle).

    !end-bullet!
-   !begin-bullet!
    Added new board for Google Cloud Storage `board_gcs()` (#695).

    !end-bullet!
-   !begin-bullet!
    Added new `tags` item to metadata for a pin (#677).

    !end-bullet!
-   !begin-bullet!
    Improved error message for `pin_versions()` (#657).

    !end-bullet!
-   !begin-bullet!
    Switched content and user caches for Connect to use environments
    instead of files on disk. This means caches will no longer persist
    between sessions but will be much less likely to end up in a broken
    state (#667).

    !end-bullet!
-   !begin-bullet!
    Added `write_board_manifest()` to write a manifest file `_pins.yaml`
    recording all pins and their versions to the board's root directory.
    This function only works for boards that are not read-only (#661,
    based on work of @ijlyttle).

    !end-bullet!
-   !begin-bullet!
    Updated `board_url()` to handle versions recorded via a manifest
    file (#681, based on work of @ijlyttle).

    !end-bullet!
-   !begin-bullet!
    Updated code preview on Posit Connect (#690).

    !end-bullet!

!end-bullets-12!

# pins 1.0.3

!begin-bullets-13!

-   !begin-bullet!
    The `arrow` package is now suggested, rather than imported (#644,
    @jonthegeek).

    !end-bullet!
-   !begin-bullet!
    Fixed how Connect usernames are handled in messages, preview, etc
    (#643).

    !end-bullet!
-   !begin-bullet!
    Increased datetime precision to the second, for `pin_versions()` and
    related functions (#642, @tomsing1).

    !end-bullet!
-   !begin-bullet!
    Pass the dots from `pin_write()` through to `s3_upload_file()` and
    `s3_uploade_yaml()` to support S3 tagging, encryption options, etc
    for pins (#648, #652, @fh-mthomson).

    !end-bullet!

!end-bullets-13!

# pins 1.0.2

!begin-bullets-14!

-   !begin-bullet!
    `board_rsconnect()` now correctly finds the created date for pins
    (#623, @bjfletcher).

    !end-bullet!
-   !begin-bullet!
    `pin_upload()` now better handles path expansion (#585, @sellorm).

    !end-bullet!
-   !begin-bullet!
    The `pin_reactive_*()` functions now use the hash (rather than the
    created date) for polling (#595, @thomaszwagerman).

    !end-bullet!

!end-bullets-14!

# pins 1.0.1

!begin-bullets-15!

-   !begin-bullet!
    `board_azure()` now allows you to set a `path` so that multiple
    boards can share the same container (#528, @hongooi73).

    !end-bullet!
-   !begin-bullet!
    `board_deparse()` is more likely to generate runnable code when used
    with `board_rsconnect()` (#553).

    !end-bullet!
-   !begin-bullet!
    `legazy_azure()` works once again (#527).

    !end-bullet!
-   !begin-bullet!
    `legacy_github()` works once again (#549).

    !end-bullet!
-   !begin-bullet!
    `pin_meta()` now includes pin `name` (#544).

    !end-bullet!
-   !begin-bullet!
    `board_register()` works better when called directly, due to
    standardisation of cache paths all computation (#529).

    !end-bullet!
-   !begin-bullet!
    Drop add-ins since they're not tested or documented (#525)

    !end-bullet!

!end-bullets-15!

# pins 1.0.0

pins 1.0.0 includes a new, more explicit, API that includes robust
support for versioning. In the modern API, you create a board object
which is passed to every `pin_` function instead of "registering" a
board that is later refereed to with a string. This leads to code like
this:

!begin-codeblock!

``` r
board <- board_local()
board %>% pin_write(mtcars, "mtcars")
board %>% pin_read("mtcars")
```

!end-codeblock!

The legacy API (`pin()`, `pin_get()`, and `board_register()`) will
continue to work, but new features will only be implemented with the new
API, so we encourage you to switch to the modern API as quickly as
possible. Learn more in `vignette("pins-update")`.

## Modern pin functions

!begin-bullets-16!

-   !begin-bullet!
    `pin_read()` and `pin_write()` replace most uses of `pin_get()` and
    `pin()`. `pin_write()` has a `type` argument that allows you to
    choose how to serialise your R objects to disk, allowing you to
    manage the tradeoffs between speed, generality, and language
    inter-op, and a `metadata` argument that allows you to store
    arbitrary metadata (#430).

    !end-bullet!
-   !begin-bullet!
    `pin_download()` and `pin_upload()` are lower-level versions of
    `pin_read()` and `pin_write()` that work with file paths rather than
    R objects. They replace the use of `pin()` with a path and eliminate
    the type-instability in `pin_get()`, which can return either an R
    object or a character vector of paths.

    !end-bullet!
-   !begin-bullet!
    `pin_browse()` replaces `board_browse()`, and takes you to a
    specific pin, either the original source on the internet, or the
    cached version on your local file system (#435).

    !end-bullet!
-   !begin-bullet!
    `pin_delete()` replaces `pin_remove()`, and can delete multiple pins
    (#433).

    !end-bullet!
-   !begin-bullet!
    `pin_list()` lists all pins in a board.

    !end-bullet!
-   !begin-bullet!
    `pin_meta()` replaces `pin_info()` and retrieves pin metadata
    (#418).

    !end-bullet!
-   !begin-bullet!
    `pin_search()` replaces `pin_find()`. It is much more limited
    because the previous version was based on assumptions that are not
    true for many boards.

    !end-bullet!
-   !begin-bullet!
    `pin_reactive_read()` and `pin_reactive_download()` replace
    `pin_reactive()`.

    !end-bullet!
-   !begin-bullet!
    `pin_exists()` reports whether or not a pin exists.

    !end-bullet!
-   !begin-bullet!
    `pin_version_delete()` allows you to delete a single version.
    `pin_versions_prune()` (#459) allows you to easily prune old
    versions keeping either a specified number of versions, or all
    versions beneath a certain age.

    !end-bullet!

!end-bullets-16!

## Modern boards

This version includes the following modern boards:

!begin-bullets-17!

-   !begin-bullet!
    `board_azure()` stores data in Azure's blob storage. It is built on
    top of AzureStor (#474).

    !end-bullet!
-   !begin-bullet!
    `board_folder()` is a generalised replacement for the legacy local
    board. `board_folder()` can store data in any directory, making it
    possible to share boards using shared network drives or on dropbox
    or similar. If you using pins casually and don't want to pick a
    directory, `board_local()` is a variant of `board_folder()` that
    stores data in a system data directory.

    !end-bullet!
-   !begin-bullet!
    `board_kaggle_dataset()` and `board_kaggle_competition()` allow you
    to download data from Kaggle. The data is automatically cached so
    that it's only downloaded when it changes.

    !end-bullet!
-   !begin-bullet!
    `board_ms365()` allow to pin data to MS One Drive and Sharpoint
    (#498, @hongooi73).

    !end-bullet!
-   !begin-bullet!
    `board_rsconnect()` shares data on RStudio connect. This board
    supports both modern and legacy APIs, so that you and your
    colleagues can use a mixture of pins versions as you transition to
    pins 1.0.0. Note that the compatibility is one directional: you can
    `pin_read()` pins created by `pin()`, but you can't `pin_get()` pins
    created by `pin_write()`.

    !end-bullet!
-   !begin-bullet!
    `board_s3()` stores data in Amazon's S3 service. It is built on top
    of paws.

    !end-bullet!
-   !begin-bullet!
    `board_url()` lets you create a manual board from a vector of URLs.
    This is useful because `pin_download()` and `pin_read()` are cached,
    so they only re-download the data if it has changed since the last
    time you used it (#409). This board is a replacement for `pin()`'s
    ability to work directly with URLs

    !end-bullet!

!end-bullets-17!

The legacy boards will continue to work with the legacy pins API; we
will implement modern versions of the remaining legacy boards based on
user feedback.

## Minor improvements and bug fixes

!begin-bullets-18!

-   !begin-bullet!
    All board objects now have class beginning with `pins_board_` and
    also inherit from common superclass `pins_board`.

    !end-bullet!
-   !begin-bullet!
    Pins no longer works with the connections pane. This automatically
    registered code tended to be either dangerous (because it's easy to
    accidentally leak credentials) or useless (because it relied on
    variables that the connection pane doesn't capture).

    !end-bullet!
-   !begin-bullet!
    Pinned data frames are longer converted to tibbles.

    !end-bullet!
-   !begin-bullet!
    The "packages" board is no longer registered by default; if you want
    to use this you'll need to register with
    `board_register("packages")`. It has been radically simplified so
    that it will no longer download packages, and it `pin_find()` now
    searches all packages that you have installed, rather than a stale
    snapshot of data in CRAN packages. The CRAN files dataset has been
    removed from the package.

    !end-bullet!
-   !begin-bullet!
    `board_browse()` now works with local boards.

    !end-bullet!
-   !begin-bullet!
    `board_rsconnect()` will automatically connect to the current RSC
    pin board when run inside RSC itself (assuming you have version
    1.8.8 or later) (#396).

    !end-bullet!
-   !begin-bullet!
    `cache_browse()`, `cache_info()`, and `cache_prune()` provide some
    basic tooling around the local pins cache maintained by pins (#438).

    !end-bullet!
-   !begin-bullet!
    `pin_fetch()` has been removed

    !end-bullet!
-   !begin-bullet!
    `option(pins.invisible)` is now defunct and ignored.

    !end-bullet!
-   !begin-bullet!
    You can no longer switch from a versioned pin to an unversioned pin
    without first deleting the pin (#410).

    !end-bullet!

!end-bullets-18!

# pins 0.4.5

## Pins

!begin-bullets-19!

-   !begin-bullet!
    Support downloading remote files when service returns incompatible
    `data.txt` file (#310).

    !end-bullet!
-   !begin-bullet!
    Support for pins over 100MB in Windows systems (#313).

    !end-bullet!
-   !begin-bullet!
    Avoid Windows crashing in `pin()` under some locales (#127).

    !end-bullet!

!end-bullets-19!

## Boards

!begin-bullets-20!

-   !begin-bullet!
    Silenced 'no encoding supplied' warning (#330).
    !end-bullet!

!end-bullets-20!

## Local

!begin-bullets-21!

-   !begin-bullet!
    `pin_find()` no longer searches text with an undocumented regular
    expression syntax (#270).
    !end-bullet!

!end-bullets-21!

## S3

!begin-bullets-22!

-   !begin-bullet!
    Default to using HTTPS in S3 boards (#304).

    !end-bullet!
-   !begin-bullet!
    Support for AWS V4 signatures when registering S3 boards with
    `region` parameter (#304)

    !end-bullet!

!end-bullets-22!

## Cloud

!begin-bullets-23!

-   !begin-bullet!
    Support for `path` to register a board under a subpath for Azure,
    DigitalOcean, Google Cloud and S3 boards (#200).

    !end-bullet!
-   !begin-bullet!
    Avoid creating pins named with unsupported characters for Azure,
    DigitalOcean, Google Cloud and S3 boards (#193).

    !end-bullet!

!end-bullets-23!

## GitHub

!begin-bullets-24!

-   !begin-bullet!
    Properly store relative paths when `path` parameter is specified in
    GitHub boards (#199).

    !end-bullet!
-   !begin-bullet!
    Add support for repos with a 'main' branch as default (#336).

    !end-bullet!
-   !begin-bullet!
    Add support for large file in private repo releases (#292).

    !end-bullet!
-   !begin-bullet!
    When a board is registered with `versions = FALSE`, GitHub tags are
    also delete when large files are present (#285).

    !end-bullet!

!end-bullets-24!

## RStudio Connect

!begin-bullets-25!

-   !begin-bullet!
    Invalid 'account' or 'server' parameters show proper errors (#296).

    !end-bullet!
-   !begin-bullet!
    Increase total entries retrieved with `pin_find()`, configurable
    with `pins.search.count` (#296).

    !end-bullet!
-   !begin-bullet!
    Fix regression introduced in pins 0.4.2 (#253) preventing users from
    collaborating on existing pins they have access to (#302).

    !end-bullet!
-   !begin-bullet!
    Avoid deleting pin when upload fails to avoid deleting versions
    (#306).

    !end-bullet!
-   !begin-bullet!
    Support re-creating pins from pins not previously properly updated
    (#308).

    !end-bullet!
-   !begin-bullet!
    Adjust pin preview to only display 1K rows instead of 10K (#315).

    !end-bullet!
-   !begin-bullet!
    Avoid changing columns names on data frame preview (#190).

    !end-bullet!
-   !begin-bullet!
    Improve error message when token authentication fails (#327).

    !end-bullet!

!end-bullets-25!

# pins 0.4.4

## Pins

!begin-bullets-26!

-   !begin-bullet!
    For files bigger than 100MB `pin()` creates symlinks to speed up
    uploads, can be configured using the `pins.link.size` option (#273).

    !end-bullet!
-   !begin-bullet!
    When using `pin(zip = TRUE)` the zip no longer contains local patahs
    (#277).

    !end-bullet!

!end-bullets-26!

## Google Cloud

!begin-bullets-27!

-   !begin-bullet!
    Disable caching on `data.txt` to support creating multiple pins at
    once (#275).
    !end-bullet!

!end-bullets-27!

## RStudio

!begin-bullets-28!

-   !begin-bullet!
    Prevent connections pane from hanging when multiple pins are updated
    at once (#280).
    !end-bullet!

!end-bullets-28!

## Website

!begin-bullets-29!

-   !begin-bullet!
    Support for `pin_get(download = FALSE)` to avoid checking for
    updates.
    !end-bullet!

!end-bullets-29!

## RStudio Connect

!begin-bullets-30!

-   !begin-bullet!
    Support for servers with mismatched `http` vs `https` protocols.

    !end-bullet!
-   !begin-bullet!
    Make use of `RSCONNECT_TAR` when running a report inside RStudio
    Connect (#293).

    !end-bullet!

!end-bullets-30!

# pins 0.4.3

## Boards

!begin-bullets-31!

-   !begin-bullet!
    Properly export `board_pin_versions` to allow custom boards
    extending versions (#265).
    !end-bullet!

!end-bullets-31!

## Website

!begin-bullets-32!

-   !begin-bullet!
    Fix regression creating pins when using a brand new cloud board
    (#268).
    !end-bullet!

!end-bullets-32!

# pins 0.4.2

## Website

!begin-bullets-33!

-   !begin-bullet!
    Fix issue removing pins with custom domain names from cloud boards
    (#234).

    !end-bullet!
-   !begin-bullet!
    Fix warning when using `pin()` against storage locations with custom
    domain name (#237).

    !end-bullet!
-   !begin-bullet!
    Fix issue where datatxt was not refreshing deleted entries (#239).

    !end-bullet!

!end-bullets-33!

## RStudio Connect

!begin-bullets-34!

-   !begin-bullet!
    Support for `versions = FALSE` in `board_register()` to avoid using
    too much space when creating pins (#245).

    !end-bullet!
-   !begin-bullet!
    Prevent administrators from overriding pins they don't own, unless
    the pin is specified as `user/name` (#253).

    !end-bullet!
-   !begin-bullet!
    Support to connect to servers that have a redirect configured when
    the full server URL is not specified in `board_register()` (#256).

    !end-bullet!
-   !begin-bullet!
    Throw error when multiple accounts are associated to the same server
    (#261).

    !end-bullet!

!end-bullets-34!

# pins 0.4.1

## Pin

!begin-bullets-35!

-   !begin-bullet!
    When running in production environments (which usually set the
    `R_CONFIG_ACTIVE` environment variable), avoid using shared caches.

    !end-bullet!
-   !begin-bullet!
    Fix `pin()` failing to update cache when server returns `NULL` etag.

    !end-bullet!
-   !begin-bullet!
    Support for `custom_metadata` in `pin()` to allow saving custom
    fields in `data.txt` file.

    !end-bullet!
-   !begin-bullet!
    Improve performannce for `pin()` from URLs containing large files
    that are already been cached prerviously by `pin()` (#225).

    !end-bullet!
-   !begin-bullet!
    Avoid showing upload or download progress when creating R Markdown
    documents and other non-interactive use cases (#227).

    !end-bullet!
-   !begin-bullet!
    When pin(url) fails and local cache exists, produce warning and
    retrieve cached version (#231).

    !end-bullet!
-   !begin-bullet!
    Support for `pin(zip = TRUE)` to create a zip file of the given path
    before creating the pin (#232).

    !end-bullet!

!end-bullets-35!

## RStudio Connect

!begin-bullets-36!

-   !begin-bullet!
    Fix when overriding pin with corrupt metadata.

    !end-bullet!
-   !begin-bullet!
    Avoid using shared caches when running inside RStudio Connect.

    !end-bullet!
-   !begin-bullet!
    Fixed 'invalid uid' warning when creaating pin undner some Linux
    servers (#263).

    !end-bullet!

!end-bullets-36!

## Kaggle

!begin-bullets-37!

-   !begin-bullet!
    Support to find and download competition datasets.
    !end-bullet!

!end-bullets-37!

# pins 0.4.0

!begin-bullets-38!

-   !begin-bullet!
    Support for versioning in all boards.

    !end-bullet!
-   !begin-bullet!
    Support for DigitalOcean board.

    !end-bullet!

!end-bullets-38!

## Pin

!begin-bullets-39!

-   !begin-bullet!
    Finding pins with `pin_find()` sort results by default (#201).

    !end-bullet!
-   !begin-bullet!
    Avoid `incomplete final line found` warning error wheen reading
    manifests.

    !end-bullet!
-   !begin-bullet!
    Support for using `pin()` across multiple concurrent processes
    (#182).

    !end-bullet!
-   !begin-bullet!
    Support in `pin_get()` to download arbitrary files from cloud boards
    like Azure, DigitalOcean, GitHub, Google Cloud, RStudio Connect, and
    S3.

    !end-bullet!
-   !begin-bullet!
    Fix issue where http HEAD requests could tgimeout and prevent pin
    from downloading in very slow connections.

    !end-bullet!

!end-bullets-39!

## RStudio

!begin-bullets-40!

-   !begin-bullet!
    Support `access_type` parameter for RStudio Connect.

    !end-bullet!
-   !begin-bullet!
    `pin()` now refreshes the connections pane.

    !end-bullet!
-   !begin-bullet!
    `pin_remove()` now refreshes the connections pane.

    !end-bullet!

!end-bullets-40!

## RStudio Connect

!begin-bullets-41!

-   !begin-bullet!
    Support for `code` parameter in `pin()` to customize R code used in
    the UI to retrieve the pin (#77).

    !end-bullet!
-   !begin-bullet!
    Improve error message for `pin_get()` with duplicate names (#171).

    !end-bullet!
-   !begin-bullet!
    Fix board register error when using URL with ports (#195).

    !end-bullet!
-   !begin-bullet!
    Enable retrieving public pins without authentication (#83).

    !end-bullet!

!end-bullets-41!

## GitHub

!begin-bullets-42!

-   !begin-bullet!
    Support for `versions = FALSE` in `board_register()` to also delete
    release files when pin is removed (#91).

    !end-bullet!
-   !begin-bullet!
    Support for `versions = FALSE` in `board_register()` to avoid
    creating versioned GitHub releases (#197).

    !end-bullet!
-   !begin-bullet!
    Support for committing all github files with a single commit (#197).

    !end-bullet!
-   !begin-bullet!
    Support for custom GitHub hosts including GitHub Enterprise using
    the `host` parameter in `board_register_github()` (#163).

    !end-bullet!

!end-bullets-42!

## Websites

!begin-bullets-43!

-   !begin-bullet!
    Using `pin()` now searches for `data.txt` files in URLs when the URL
    contains no file extension, behavior can be turnned off with the
    `pins.search.datatxt` option.
    !end-bullet!

!end-bullets-43!

# pins 0.3.2

## Pins

!begin-bullets-44!

-   !begin-bullet!
    `pin_info()` adds support for `metadata` parameter to avoid
    retrieving pin contents.
    !end-bullet!

!end-bullets-44!

## S3

!begin-bullets-45!

-   !begin-bullet!
    Added support for `host` parameter to configure "s3.amazonaws.com"
    to custom locations.
    !end-bullet!

!end-bullets-45!

## GitHub

!begin-bullets-46!

-   !begin-bullet!
    Fix regression uploading large datasets as release files.
    !end-bullet!

!end-bullets-46!

# pins 0.3.1

## Pins

!begin-bullets-47!

-   !begin-bullet!
    `pin_info()` prints long character strings in their own line.

    !end-bullet!
-   !begin-bullet!
    Fixed issue in `pin_remove()` for S3, Azure, GCloud, Google and
    website boards (#138).

    !end-bullet!
-   !begin-bullet!
    Fixed issue when pinning complex data frames with nested lists
    (#142).

    !end-bullet!

!end-bullets-47!

## Azure

!begin-bullets-48!

-   !begin-bullet!
    Added missing `key` parameter in `board_register_azure()`.
    !end-bullet!

!end-bullets-48!

## RStudio

!begin-bullets-49!

-   !begin-bullet!
    Fixed connection suggested code when caused by `pin_find()` (#137).

    !end-bullet!
-   !begin-bullet!
    Fixed connection launcher for Azure connections.

    !end-bullet!

!end-bullets-49!

## RStudio Connect

!begin-bullets-50!

-   !begin-bullet!
    Fix issue uploading large pins causing
    `is.character(type) is not TRUE` error.

    !end-bullet!
-   !begin-bullet!
    Fix issue affecting boards registered with trailing slash (#151).

    !end-bullet!
-   !begin-bullet!
    Improve error messages when a pin fails to be created (#149).

    !end-bullet!
-   !begin-bullet!
    Added support for `CONNECT_API_KEY` and `CONNECT_SERVER` in place of
    `RSCONNECT_API` and `RSCONNECT_SERVER`, which they are still
    supported for backwards-compatibility.

    !end-bullet!

!end-bullets-50!

# pins 0.3.0

!begin-bullets-51!

-   !begin-bullet!
    Support for Azure board.

    !end-bullet!
-   !begin-bullet!
    Support for Google Cloud board.

    !end-bullet!
-   !begin-bullet!
    Support for S3 board.

    !end-bullet!

!end-bullets-51!

## Pins

!begin-bullets-52!

-   !begin-bullet!
    `pin()` extracts URLs that end in `.gz` and `zip`, which can be
    disabled with `pin("<url>", extract = FALSE)`.

    !end-bullet!
-   !begin-bullet!
    `pin()` no longer prints the pin, you can revert this behavior with
    `options(pins.invisible = FALSE)` (#122).

    !end-bullet!
-   !begin-bullet!
    Show upload progress for files larger than 10mb.

    !end-bullet!
-   !begin-bullet!
    Avoid changing `data.table` when using `pin()` and `get_pin()`.

    !end-bullet!
-   !begin-bullet!
    Support for `pin_info()` to describe a pin and `extended = TRUE` in
    `pin_find()` to show all extended information about each pin.

    !end-bullet!
-   !begin-bullet!
    Support for `extract` parameter in `pin_get()`, `pin()`, and
    `pin_reactive()` to override default file extraction behavior.

    !end-bullet!
-   !begin-bullet!
    Support to extract gzip files when the `R.utils` package is
    installed.

    !end-bullet!
-   !begin-bullet!
    Show download progress for files larger than 10mb.

    !end-bullet!
-   !begin-bullet!
    Support for `I()` to force a pin to be created without additional
    overhead of exporting CSV and other enhancements (#73).

    !end-bullet!
-   !begin-bullet!
    Support creating automatic `name` when using `pin()` and multiple
    URL.

    !end-bullet!

!end-bullets-52!

## Boards

!begin-bullets-53!

-   !begin-bullet!
    Avoid "cannot create dir" warning in systems with an empty cache
    folder.
    !end-bullet!

!end-bullets-53!

## RStudio

!begin-bullets-54!

-   !begin-bullet!
    Gracefully handle errors when a pin's preview can't be created.

    !end-bullet!
-   !begin-bullet!
    Website boards now support the browse menu item in the connection.

    !end-bullet!
-   !begin-bullet!
    Fix data frames previewing character columns with special
    characters.

    !end-bullet!
-   !begin-bullet!
    Fix connection code when a board is registered automatically.

    !end-bullet!

!end-bullets-54!

## RStudio Connect

!begin-bullets-55!

-   !begin-bullet!
    Fix issue where `pin_find()` would not show all available pins.

    !end-bullet!
-   !begin-bullet!
    Fix issue where RStudio Connections pane would not show all pins.

    !end-bullet!
-   !begin-bullet!
    Store all downloaded content under user subfolder insited rsconnect
    cache.

    !end-bullet!
-   !begin-bullet!
    Removed `pin_find()` workaround for beta rsconnect server where
    searching was causing timeout.

    !end-bullet!
-   !begin-bullet!
    Fix for RStudio Connect servers where `/content/` is not used in
    content URLs.

    !end-bullet!
-   !begin-bullet!
    Fix issue expanding pins columns in RStudio for pins with similar
    names in RStudio Connect boards.

    !end-bullet!
-   !begin-bullet!
    Fix issue removing pins with similar names in RStudio Connect
    boards.

    !end-bullet!

!end-bullets-55!

## Python

!begin-bullets-56!

-   !begin-bullet!
    Support for Python 3.
    !end-bullet!

!end-bullets-56!

## Websites

!begin-bullets-57!

-   !begin-bullet!
    The `name` parameter in `board_register_datatxt()` is now optional.

    !end-bullet!
-   !begin-bullet!
    Fix in `pin_find()` to properly search desecription files.

    !end-bullet!

!end-bullets-57!

## GitHub

!begin-bullets-58!

-   !begin-bullet!
    Various fixes for GitHub boards using the `path` parameter when
    registering the board (#121).
    !end-bullet!

!end-bullets-58!

# pins 0.2.0

## RStudio Connect

!begin-bullets-59!

-   !begin-bullet!
    Support for retrieving pins shared by others in RStudio Connect
    boards.

    !end-bullet!
-   !begin-bullet!
    Support for RStudio Connect servers running under a subpath in the
    server.

    !end-bullet!
-   !begin-bullet!
    Add support for `RSCONNECT_SERVER` environment variable to ease
    configuration of automated RStudio Connect reports.

    !end-bullet!
-   !begin-bullet!
    Fix intermittent failure to retrieve pins from RStudio Connect
    boards while creating them.

    !end-bullet!
-   !begin-bullet!
    Fix in RStudio Connect boards to retrieve pins that match other pin
    names (#45).

    !end-bullet!
-   !begin-bullet!
    Fix for data frames with nested data frames in rsconnect boards
    (#36).

    !end-bullet!

!end-bullets-59!

## GitHub

!begin-bullets-60!

-   !begin-bullet!
    `board_register_github()` now checks for the repo to exist (#63).

    !end-bullet!
-   !begin-bullet!
    Adjusted max upload file to 25mb to avoid "server error" in the API,
    larger files than 25mb uploaded as release files. This can be
    configured using the `pins.github.release` option, which deefaults
    to 25.

    !end-bullet!
-   !begin-bullet!
    Allow overriding GitHub pin over a pin that partially failed to be
    created.

    !end-bullet!

!end-bullets-60!

## Boards

!begin-bullets-61!

-   !begin-bullet!
    Using a board will attempt to automatically register, such that
    `pin(iris, board = "rsconnect")` would work for the default
    configuration even when the board is not explicitly registered
    (#50).

    !end-bullet!
-   !begin-bullet!
    Registers "local" board by default, you no longer need to explicitly
    run `board_register_local()` (#56).

    !end-bullet!
-   !begin-bullet!
    Make use of the `rappdirs` package to define the default cache path,
    replaces `~/.pins`. Use `board_cache_path()` to retrieve default
    cache path.

    !end-bullet!

!end-bullets-61!

## Websites

!begin-bullets-62!

-   !begin-bullet!
    Fix for data.txt boards created from GitHub boards using large
    files.
    !end-bullet!

!end-bullets-62!

# pins 0.1.2

!begin-bullets-63!

-   !begin-bullet!
    Support to upload files larger than 50mb in GitHub boards as release
    files.
    !end-bullet!

!end-bullets-63!

# pins 0.1.1

!begin-bullets-64!

-   !begin-bullet!
    Fix CRAN request to explicitly opt-in to use local home path as
    cache by running `board_register_local()`.

    !end-bullet!
-   !begin-bullet!
    Fix error when retrieving pins from Kaggle boards (#31).

    !end-bullet!
-   !begin-bullet!
    Support for large files in GitHub board (#30).

    !end-bullet!

!end-bullets-64!

# pins 0.1.0

!begin-bullets-65!

-   !begin-bullet!
    Support for local board.

    !end-bullet!
-   !begin-bullet!
    Support for Kaggle board.

    !end-bullet!
-   !begin-bullet!
    Support for packages board.

    !end-bullet!
-   !begin-bullet!
    Support for RStudio Connect board.

    !end-bullet!
-   !begin-bullet!
    Support for GitHub board.

    !end-bullet!
-   !begin-bullet!
    Support for website board.

    !end-bullet!

!end-bullets-65!

# leaflet (development version)

!begin-bullets-1!

-   !begin-bullet!
    Color palette improvements. All color palette functions now support
    all `{viridisLite}` palettes ("magma", "inferno", "plasma",
    "viridis", "cividis", "rocket", "mako", and "turbo") (@jack-davison,
    #924).

    !end-bullet!
-   !begin-bullet!
    Updated vignettes to replace `{sp}`/`{raster}` usage with
    `{sf}`/`{terra}` and their corresponding examples. (@jack-davison,
    #928)

    !end-bullet!
-   !begin-bullet!
    Updated vignettes to replace `{sp}`/`{raster}` usage with
    `{sf}`/\`{terra} and their corresponding examples. (@jack-davison,
    #928)

    !end-bullet!
-   !begin-bullet!
    `addProviderTiles()` will now error if the chosen `provider` does
    not match any currently loaded provider (by default, those in
    `providers`). This behaviour can be toggled off by setting the new
    `check` argument to `FALSE` (@jack-davison, #929)

    !end-bullet!

!end-bullets-1!

# leaflet 2.2.2

!begin-bullets-2!

-   !begin-bullet!
    Fixed #893: Correctly call `terra::crs()` when checking the CRS of a
    `SpatVector` object in `pointData()` or `polygonData()` (thanks
    @mkoohafkan, #894).

    !end-bullet!
-   !begin-bullet!
    `{leaflet}` now has a brand new pkgdown site (@olivroy, #902)

    !end-bullet!
-   !begin-bullet!
    Replace `{viridis}` dependency by `{viridisLite}` (@olivroy, #897)

    !end-bullet!
-   !begin-bullet!
    `addRasterImage` now takes `options = gridOptions()`, so that
    arbitrary Leaflet layer options can be controlled. (#692)

    !end-bullet!

!end-bullets-2!

# leaflet 2.2.1

!begin-bullets-3!

-   !begin-bullet!
    When `addProviderTiles()` is used with `{leaflet.providers}` version
    2.0.0 or later, the `leaflet-providers` HTML dependency produced can
    be correctly cached by knitr. When used with older versions of
    `{leaflet.providers}`, the HTML dependency uses temp files that
    break knitr's caching mechanism (thanks @qdread, @jaredlander;
    #884).
    !end-bullet!

!end-bullets-3!

# leaflet 2.2.0

### Features

!begin-bullets-4!

-   !begin-bullet!
    Added support for SpatRaster and SpatVector objects from the terra
    package. (#728)

    !end-bullet!
-   !begin-bullet!
    `leaflet()` now uses jQuery 3.6.0 provided via the
    `{jquerylib}`package. As a result of this change, the HTML
    dependencies for `leaflet()` are included in the `dependencies` item
    of the htmlwidget object it returns. (#817, #821)

    !end-bullet!

!end-bullets-4!

## Bug fixes and improvements

!begin-bullets-5!

-   !begin-bullet!
    Use correct license in OpenStreetMap attribution. (#811)

    !end-bullet!
-   !begin-bullet!
    Use `xfun::base64_uri()` for base64 encoding instead of **markdown**
    and **base64enc**. (#823)

    !end-bullet!
-   !begin-bullet!
    Remove dependencies on rgdal and rgeos. (#837)

    !end-bullet!
-   !begin-bullet!
    Respect option scrollWheelZoom=FALSE. (#827)

    !end-bullet!
-   !begin-bullet!
    Fixed #866: Correctly call `terra::has.RGB()` in `addRasterImage()`
    for a `SpatRaster` object. (#869)

    !end-bullet!

!end-bullets-5!

# leaflet 2.1.2

## Bug fixes and improvements

!begin-bullets-6!

-   !begin-bullet!
    Removed S3 warnings found on R devel (#848)
    !end-bullet!

!end-bullets-6!

# leaflet 2.1.1

## Bug fixes and improvements

!begin-bullets-7!

-   !begin-bullet!
    The default marker icon for `addMarkers` no longer worked, due to
    the CDN we were relying on apparently being retired. Fixed by
    pointing to a new CDN. (#782)

    !end-bullet!
-   !begin-bullet!
    New behavior from tile.openstreetmap.org caused `addTiles` default
    tileset to break when viewed under non-https protocol on recent
    versions of Chrome. Fixed by always using the https protocol to
    connect to openstreetmap. (#786)

    !end-bullet!

!end-bullets-7!

# leaflet 2.1.0

## Bug fixes and improvements

!begin-bullets-8!

-   !begin-bullet!
    Enable JS function literals (wrapped in `htmlwidgets::JS()`) to be
    included in arguments to methods invoked on `leafletProxy` objects.
    (JS function literals could already be included with methods invoked
    on `leaflet` objects, so this change just brings `leafletProxy` to
    parity.) (#420)

    !end-bullet!
-   !begin-bullet!
    Add missing CSS rule to show `<img>` in right-pane and left-pane
    (rstudio/rmarkdown#1949, #770)

    !end-bullet!
-   !begin-bullet!
    Allow for *hidden* but not suspended leaflet maps to queue calls
    (such as add raster images) until they are rendered. If a new
    leaflet map is created, all pending calls are removed. (#771)

    !end-bullet!

!end-bullets-8!

# leaflet 2.0.4.1

## Features

!begin-bullets-9!

-   !begin-bullet!
    Updated proj4.js to 2.6.2
    !end-bullet!

!end-bullets-9!

## Bug fixes and improvements

!begin-bullets-10!

-   !begin-bullet!
    Minor tweaks to example data and tests, required to stay on CRAN

    !end-bullet!
-   !begin-bullet!
    Fixes broken URL (#742) and updated examples to run from system
    files (#576) including updated .Rmd and .html docs.

    !end-bullet!

!end-bullets-10!

# leaflet 2.0.3

## Breaking changes

!begin-bullets-11!

-   !begin-bullet!
    `data("providers")` and `data("providers.details")` no longer exist.
    Please use `leaflet::providers` and `leaflet::providers.details`.
    (#636)
    !end-bullet!

!end-bullets-11!

## Bug fixes and improvements

!begin-bullets-12!

-   !begin-bullet!
    Integrated data from `leaflet.providers` package. See
    leaflet.providers for details. (#636)
    !end-bullet!
-   !begin-bullet!
    Fixed rstudio/crosstalk#58, which caused Leaflet maps that used
    Crosstalk shared data in Shiny apps, to be redrawn at incorrect
    times.
    !end-bullet!
-   !begin-bullet!
    invokeRemote() now resolves html dependencies before passing them to
    shiny::createWebDependency() (#620).
    !end-bullet!
-   !begin-bullet!
    Upgrade leaflet-provider to 1.4.0, enable more map variants such as
    CartoDB.Voyager (#567)
    !end-bullet!
-   !begin-bullet!
    `sf` objects with `names` attributes in the `st_geometry` now
    visualise correctly (#595)
    !end-bullet!
-   !begin-bullet!
    GeoJSON objects missing `properties` can now be displayed (#622)
    !end-bullet!

!end-bullets-12!

# leaflet 2.0.2

## Bug fixes and improvements

!begin-bullets-13!

-   !begin-bullet!
    Require viridis \>= 0.5.1 to avoid namespace issues with viridisLite
    (#557)
    !end-bullet!
-   !begin-bullet!
    Fixed broken mouse events after using leaflet-search from
    leaflet.extras within shiny applications (#563)
    !end-bullet!
-   !begin-bullet!
    Use leaflet namespace on `providers` in `addMiniMap` to make the
    function accessible in other packages. Fixes r-tmap/tmap#231. (#568)
    !end-bullet!
-   !begin-bullet!
    Require scales \>= 1.0.0 to avoid exact color matching issues (#578)
    !end-bullet!

!end-bullets-13!

# leaflet 2.0.1

## Features

!begin-bullets-14!

-   !begin-bullet!
    Added method `addMapPane` to add custom pane layers to have fine
    tune control over layer ordering. New feature from within leaflet.js
    v1.x. (#549)
    !end-bullet!
-   !begin-bullet!
    Exposed htmlwidgets sizingPolicy in leaflet() (#548)
    !end-bullet!

!end-bullets-14!

## Bug fixes and improvements

!begin-bullets-15!

-   !begin-bullet!
    Default marker icon locations will now use unpkg.com instead of the
    leaflet cdn when using https or file protocols. (#544)
    !end-bullet!
-   !begin-bullet!
    `.leaflet-map-pane` `z-index` switched to 'auto'. Allows for map
    panes to appear above the map if they appear later in the dom.
    (#537)
    !end-bullet!
-   !begin-bullet!
    Use correct Leaflet.js scale control remove method. (#547)
    !end-bullet!
-   !begin-bullet!
    Start from world view if using flyTo or flyToBounds. (#552)
    !end-bullet!

!end-bullets-15!

# leaflet 2.0.0

## Breaking changes

!begin-bullets-16!

-   !begin-bullet!
    Update to latest leaflet.js v1.3.1 (#453, 314616f) Please see
    https://web.archive.org/web/20220702182250/https://leafletjs.com/reference-1.3.4.html
    for the latest documentation

    !end-bullet!
-   !begin-bullet!
    All plugins updated to versions compatible with leaflet \> 1.0
    (#458)

    !begin-bullets-17!
    -   !begin-bullet!
        jQuery, https://github.com/jquery/jquery
        !end-bullet!
    -   !begin-bullet!
        Leaflet (JavaScript library), https://github.com/Leaflet/Leaflet
        !end-bullet!
    -   !begin-bullet!
        Leaflet Providers,
        https://github.com/leaflet-extras/leaflet-providers
        !end-bullet!
    -   !begin-bullet!
        leaflet-measure, https://github.com/ljagis/leaflet-measure
        !end-bullet!
    -   !begin-bullet!
        Leaflet.Terminator,
        https://github.com/joergdietrich/Leaflet.Terminator
        !end-bullet!
    -   !begin-bullet!
        Leaflet.SimpleGraticule,
        https://github.com/ablakey/Leaflet.SimpleGraticule
        !end-bullet!
    -   !begin-bullet!
        Leaflet.MagnifyingGlass,
        https://github.com/bbecquet/Leaflet.MagnifyingGlass
        !end-bullet!
    -   !begin-bullet!
        Leaflet.MiniMap, https://github.com/Norkart/Leaflet-MiniMap
        !end-bullet!
    -   !begin-bullet!
        Leaflet.awesome-markers,
        https://github.com/lvoogdt/Leaflet.awesome-markers
        !end-bullet!
    -   !begin-bullet!
        Leaflet.EasyButton,
        https://github.com/CliffCloud/Leaflet.EasyButton/
        !end-bullet!
    -   !begin-bullet!
        Proj4Leaflet, https://github.com/kartena/Proj4Leaflet
        !end-bullet!
    -   !begin-bullet!
        leaflet-locationfilter,
        https://github.com/kajic/leaflet-locationfilter
        !end-bullet!
    -   !begin-bullet!
        leaflet-omnivore, https://github.com/mapbox/leaflet-omnivore
        !end-bullet!
    -   !begin-bullet!
        topojson, https://github.com/topojson/topojson
        !end-bullet!

    !end-bullets-17!
    !end-bullet!
-   !begin-bullet!
    Leaflet.label (https://github.com/Leaflet/Leaflet.labelExtension)

    !begin-bullets-18!
    -   !begin-bullet!
        `L.Label` has been adopted within Leaflet.js to `L.Tooltip`
        !end-bullet!
    -   !begin-bullet!
        Tooltips are now displayed with default Leaflet.js styling
        !end-bullet!
    -   !begin-bullet!
        In custom javascript extensions, change all `*.bindLabel()` to
        `*.bindTooltip()`
        !end-bullet!

    !end-bullets-18!
    !end-bullet!

!end-bullets-16!

## Bug fixes and features

!begin-bullets-19!

-   !begin-bullet!
    Relative protocols are used where possible when adding tiles (#526).
    In RStudio 1.1.x on Linux and Windows, a known issue of 'https://'
    routes fail to load, but works within browsers
    (rstudio/rstudio#2661).

    !end-bullet!
-   !begin-bullet!
    Added more providers for `addProviderTiles()`: "OpenStreetMap.CH",
    "OpenInfraMap", "OpenInfraMap.Power", "OpenInfraMap.Telecom",
    "OpenInfraMap.Petroleum", "OpenInfraMap.Water", "OpenPtMap",
    "OpenRailwayMap", "OpenFireMap", "SafeCast". (4aea447)

    !end-bullet!
-   !begin-bullet!
    `L.multiPolyline` was absorbed into `L.polyline`, which accepts
    multiple an array of polyline information.
    https://web.archive.org/web/20220702182250/https://leafletjs.com/reference-1.3.4.html#polyline.
    (#515)

    !end-bullet!
-   !begin-bullet!
    Fix bug where icons where anchored to the top-center, not
    center-center (2a60751)

    !end-bullet!
-   !begin-bullet!
    Fix bug where markers would not appear in self contained knitr files
    (cc79bc3)

    !end-bullet!
-   !begin-bullet!
    leaflet-label plugin now L.tooltip in leaflet.js. labelOptions() now
    translates old options clickable to interactive and noHide to
    permanent.

    !end-bullet!
-   !begin-bullet!
    Fix a bug where the default `addTiles()` would not work with .html
    files served directly from the filesystem.

    !end-bullet!
-   !begin-bullet!
    Add `groupOptions` function. Currently the only option is letting
    you specify zoom levels at which a group should be visible.

    !end-bullet!
-   !begin-bullet!
    Fix bug with accessing columns in formulas when the data source is a
    Crosstalk SharedData object wrapping a spatial data frame or sf
    object.

    !end-bullet!
-   !begin-bullet!
    Fix strange wrapping behavior for legend, especially common for
    Chrome when browser zoom level is not 100%.

    !end-bullet!
-   !begin-bullet!
    Fix incorrect opacity on NA entry in legend. (PR #425)

    !end-bullet!
-   !begin-bullet!
    Added support for drag events (#405)

    !end-bullet!
-   !begin-bullet!
    Ensure type safety of .indexOf(stamp) (#396)

    !end-bullet!
-   !begin-bullet!
    `validateCoords()` warns on invalid polygon data (#393)

    !end-bullet!
-   !begin-bullet!
    Added `method` argument to `addRasterImage()` to enable nearest
    neighbor interpolation when projecting categorical rasters (#462)

    !end-bullet!
-   !begin-bullet!
    Added an `'auto'` method for `addRasterImage()`. Projected factor
    results are coerced into factors. (9accc7e)

    !end-bullet!
-   !begin-bullet!
    Added `data` parameter to remaining `addXXX()` methods, including
    addLegend. (f273edd, #491, #485)

    !end-bullet!
-   !begin-bullet!
    Added `preferCanvas` argument to `leafletOptions()` (#521)

    !end-bullet!

!end-bullets-19!

# leaflet 1.1.0

!begin-bullets-20!

-   !begin-bullet!
    Add support for sf. sf, sfc, and sfg classes are supported with
    POINT, LINESTRING, MULTILINESTRING, POLYGON, and MULTIPOLYGON
    geometries (note that MULTIPOINT is not currently supported).

    !end-bullet!
-   !begin-bullet!
    Added support for Crosstalk (https://rstudio.github.io/crosstalk/).

    !end-bullet!
-   !begin-bullet!
    Added option to highlight polygons, polylines, circles, and
    rectangles on hover (use highlightOptions parameter).

    !end-bullet!
-   !begin-bullet!
    Fix behavior when data contains NA points, or zero rows. Previously
    this would cause an error.

    !end-bullet!
-   !begin-bullet!
    Added `popupOptions` parameter to all markers and shape layers.

    !end-bullet!
-   !begin-bullet!
    Upgraded existing plugins to their respective latest versions and
    added missing/new functionality from those plugins. (PR #293)

    !end-bullet!
-   !begin-bullet!
    Added Proj4Leaflet plugin (PR #294).

    !end-bullet!
-   !begin-bullet!
    Added EasyButton plugin (PR #295).

    !end-bullet!
-   !begin-bullet!
    Added Graticule plugin (PR #293).

    !end-bullet!
-   !begin-bullet!
    Color palette improvements. All color palette functions now support
    viridis palettes ("viridis", "magma", "inferno", and "plasma").

    !end-bullet!
-   !begin-bullet!
    Color palette functions now support reversing the order in which
    colors are used, via reverse=TRUE.

    !end-bullet!
-   !begin-bullet!
    `colorFactor()` no longer interpolates qualitative RColorBrewer
    palettes, unless the number of factor levels being mapped exceeds
    the number of colors in the specified RColorBrewer palette. (Issue
    #300)

    !end-bullet!
-   !begin-bullet!
    Upgrade leaflet.js to 0.7.7.1 (PR #359)

    !end-bullet!
-   !begin-bullet!
    Added a way for the Map instance to be instantiated via a factory.

    !end-bullet!

!end-bullets-20!

# leaflet 1.0.2

!begin-bullets-21!

-   !begin-bullet!
    When used with `leafletProxy`, `fitBounds` did not return its input
    object as output, so magrittr chains would break after `fitBounds`
    was called.

    !end-bullet!
-   !begin-bullet!
    Add `addMeasure()`/`removeMeasure()` functions to allow users to
    measure lines and areas, via the leaflet-measure plugin by @ljagis.
    (PR #171. Thanks, Kenton Russell!)

    !end-bullet!
-   !begin-bullet!
    Add `input${mapid}_center` Shiny event.

    !end-bullet!
-   !begin-bullet!
    Add support for labels on most layers, that show either statically
    or on hover. (PR #181. Thanks Bhaskar Karambelkar!)

    !end-bullet!
-   !begin-bullet!
    Add support for markers with configurable colors and icons, via the
    Leaflet.awesome-markers plugin by @lvoogdt. See
    `?addAwesomeMarkers`. (PR #184. Great work, Bhaskar!)

    !end-bullet!
-   !begin-bullet!
    Add support for the Leaflet.Terminator plugin by @joergdietrich.
    Overlays day and night regions on a map. See `?addTerminator`. (PR
    #184, thanks Bhaskar!)

    !end-bullet!
-   !begin-bullet!
    Add support for Leaflet.SimpleGraticule plugin by @ablakey. See
    `?addSimpleGraticule`. (PR #184, thanks again Bhaskar!)

    !end-bullet!
-   !begin-bullet!
    Add support for Leaflet.MagnifyingGlass plugin by @bbecquet. Adds a
    configurable magnifying glass that displays the area under the
    cursor at an increased zoom level. See `?addMagnifyingGlass`. (PR
    #184, still Bhaskar!)

    !end-bullet!
-   !begin-bullet!
    Add support for Leaflet-MiniMap plugin by @Norkart. Adds a mini map
    to the corner that can be used to see or change the bounds of the
    main map. See `?addMiniMap`. (PR #184, Bhaskar again!)

    !end-bullet!
-   !begin-bullet!
    `addScaleBar` and related functions added, for showing Leaflet's
    built-in scale bar in one of the corners of the map. (PR #201.
    Thanks Kent Johnson!)

    !end-bullet!

!end-bullets-21!

# leaflet 1.0.1

!begin-bullets-22!

-   !begin-bullet!
    Fix #242: Compatibility with htmlwidgets 0.6 (thanks byzheng).
    !end-bullet!

!end-bullets-22!

# leaflet 1.0.0

!begin-bullets-23!

-   !begin-bullet!
    Initial release
    !end-bullet!

!end-bullets-23!

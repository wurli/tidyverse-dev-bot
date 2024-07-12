# ggplot2 (development version)

!begin-bullets-1!

-   !begin-bullet!
    Missing values from discrete palettes are no longer translated
    (@teunbrand, #5929).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `facet_grid(margins = TRUE)` when using expresssions
    (@teunbrand, #1864).

    !end-bullet!
-   !begin-bullet!
    `geom_step()` now supports the `orientation` argument (@teunbrand,
    #5936).

    !end-bullet!
-   !begin-bullet!
    `position_dodge()` and `position_jitterdodge()` now have a `reverse`
    argument (@teunbrand, #3610)

    !end-bullet!
-   !begin-bullet!
    `coord_radial(r.axis.inside)` can now take a numeric value to
    control placement of internally placed radius axes (@teunbrand,
    #5805).

    !end-bullet!
-   !begin-bullet!
    (internal) default labels are derived in `ggplot_build()` rather
    than in `ggplot_add.Layer()` (@teunbrand, #5894)

    !end-bullet!
-   !begin-bullet!
    An attempt is made to use a variable's label attribute as default
    label (@teunbrand, #4631)

    !end-bullet!
-   !begin-bullet!
    Themes gain an additional `header_family` argument to easily set the
    font for headers and titles (#5886).

    !end-bullet!
-   !begin-bullet!
    The `plot.subtitle`, `plot.caption` and `plot.tag` theme elements
    now inherit from the root `text` element instead of the `title`
    element (#5886).

    !end-bullet!
-   !begin-bullet!
    ggplot2 no longer imports {glue} (@teunbrand, #5986).

    !end-bullet!
-   !begin-bullet!
    `geom_rect()` can now derive the required corners positions from
    `x`/`width` or `y`/`height` parameterisation (@teunbrand, #5861).

    !end-bullet!
-   !begin-bullet!
    All position scales now use the same definition of `x` and `y`
    aesthetics. This lets uncommon aesthetics like `xintercept` expand
    scales as usual. (#3342, #4966, @teunbrand)

    !end-bullet!
-   !begin-bullet!
    Bare numeric values provided to Date or Datetime scales get
    inversely transformed (cast to Date/POSIXct) with a warning
    (@teunbrand).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` now accepts functions for argument `breaks` (@aijordan,
    #4561)

    !end-bullet!
-   !begin-bullet!
    (internal) The plot's layout now has a coord parameter that is used
    to prevent setting up identical panel parameters (#5427)

    !end-bullet!
-   !begin-bullet!
    (internal) rearranged the code of `Facet$draw_panels()` method
    (@teunbrand).

    !end-bullet!
-   !begin-bullet!
    `geom_rug()` prints a warning when `na.rm = FALSE`, as per
    documentation (@pn317, #5905)

    !end-bullet!
-   !begin-bullet!
    `position_dodge(preserve = "single")` now handles multi-row geoms
    better, such as `geom_violin()` (@teunbrand based on @clauswilke's
    work, #2801).

    !end-bullet!
-   !begin-bullet!
    `position_jitterdodge()` now dodges by `group` (@teunbrand, #3656)

    !end-bullet!
-   !begin-bullet!
    The `arrow.fill` parameter is now applied to more line-based
    functions: `geom_path()`, `geom_line()`, `geom_step()`
    `geom_function()`, line geometries in `geom_sf()` and
    `element_line()`.

    !end-bullet!
-   !begin-bullet!
    Fixed bug where binned guides would keep out-of-bounds breaks
    (@teunbrand, #5870).

    !end-bullet!
-   !begin-bullet!
    The size of the `draw_key_polygon()` glyph now reflects the
    `linewidth` aesthetic (#4852).

    !end-bullet!
-   !begin-bullet!
    New function `complete_theme()` to replicate how themes are handled
    during plot building (#5801).

    !end-bullet!
-   !begin-bullet!
    Special getter and setter functions have been renamed for
    consistency, allowing for better tab-completion with `get_*`- and
    `set_*`-prefixes. The old names remain available for backward
    compatibility (@teunbrand, #5568).

      New name               Old name
      ---------------------- -------------------
      `get_theme()`          `theme_get()`
      `set_theme()`          `theme_set()`
      `replace_theme()`      `theme_replace()`
      `update_theme()`       `theme_update()`
      `get_last_plot()`      `last_plot()`
      `get_layer_data()`     `layer_data()`
      `get_layer_grob()`     `layer_grob()`
      `get_panel_scales()`   `layer_scales()`

    !end-bullet!
-   !begin-bullet!
    Discrete scales now support `minor_breaks`. This may only make sense
    in discrete position scales, where it affects the placement of minor
    ticks and minor gridlines (#5434).

    !end-bullet!
-   !begin-bullet!
    Discrete position scales now expose the `palette` argument, which
    can be used to customise spacings between levels (@teunbrand,
    #5770).

    !end-bullet!
-   !begin-bullet!
    The default `se` parameter in layers with `geom = "smooth"` will be
    `TRUE` when the data has `ymin` and `ymax` parameters and `FALSE` if
    these are absent. Note that this does not affect the default of
    `geom_smooth()` or `stat_smooth()` (@teunbrand, #5572).

    !end-bullet!
-   !begin-bullet!
    The bounded density option in `stat_density()` uses a wider range to
    prevent discontinuities (#5641).

    !end-bullet!
-   !begin-bullet!
    `geom_raster()` now falls back to rendering as `geom_rect()` when
    coordinates are not Cartesian (#5503).

    !end-bullet!
-   !begin-bullet!
    `stat_ecdf()` now has an optional `weight` aesthetic (@teunbrand,
    #5058).

    !end-bullet!
-   !begin-bullet!
    Position scales combined with `coord_sf()` can now use functions in
    the `breaks` argument. In addition, `n.breaks` works as intended and
    `breaks = NULL` removes grid lines and axes (@teunbrand, #4622).

    !end-bullet!
-   !begin-bullet!
    (Internal) Applying defaults in `geom_sf()` has moved from the
    internal `sf_grob()` to `GeomSf$use_defaults()` (@teunbrand).

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()` has new options for the `dir` argument to more
    precisely control panel directions. Internally `dir = "h"` or
    `dir = "v"` is deprecated (@teunbrand, #5212).

    !end-bullet!
-   !begin-bullet!
    Prevented `facet_wrap(..., drop = FALSE)` from throwing spurious
    errors when a character facetting variable contained `NA`s
    (@teunbrand, #5485).

    !end-bullet!
-   !begin-bullet!
    When facets coerce the faceting variables to factors, the 'ordered'
    class is dropped (@teunbrand, #5666).

    !end-bullet!
-   !begin-bullet!
    `geom_curve()` now appropriately removes missing data instead of
    throwing errors (@teunbrand, #5831).

    !end-bullet!
-   !begin-bullet!
    `update_geom_defaults()` and `update_stat_defaults()` have a reset
    mechanism when using `new = NULL` and invisible return the previous
    defaults (#4993).

    !end-bullet!
-   !begin-bullet!
    Fixed regression in axes where `breaks = NULL` caused the axes to
    disappear instead of just rendering the axis line (@teunbrand,
    #5816).

    !end-bullet!
-   !begin-bullet!
    `geom_point()` can be dodged vertically by using
    `position_dodge(..., orientation = "y")` (@teunbrand, #5809).

    !end-bullet!
-   !begin-bullet!
    Fixed bug where `na.value` was incorrectly mapped to non-`NA` values
    (@teunbrand, #5756).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `guide_custom()` that would throw error with
    `theme_void()` (@teunbrand, #5856).

    !end-bullet!
-   !begin-bullet!
    New helper function `gg_par()` to translate ggplot2's interpretation
    of graphical parameters to {grid}'s interpretation (@teunbrand,
    #5866).

    !end-bullet!
-   !begin-bullet!
    `scale_{x/y}_discrete()` can now accept a `sec.axis`. It is
    recommended to only use `dup_axis()` to set custom breaks or labels,
    as discrete variables cannot be transformed (@teunbrand, #3171).

    !end-bullet!
-   !begin-bullet!
    `stat_density()` has the new computed variable: `wdensity`, which is
    calculated as the density times the sum of weights (@teunbrand,
    #4176).

    !end-bullet!
-   !begin-bullet!
    `theme()` gets new `spacing` and `margins` arguments that all other
    spacings and (non-text) margins inherit from (@teunbrand, #5622).

    !end-bullet!
-   !begin-bullet!
    `geom_ribbon()` can have varying `fill` or `alpha` in linear
    coordinate systems (@teunbrand, #4690).

    !end-bullet!
-   !begin-bullet!
    `geom_tile()` computes default widths and heights per panel instead
    of per layer (@teunbrand, #5740).

    !end-bullet!
-   !begin-bullet!
    The `fill` of the `panel.border` theme setting is ignored and forced
    to be transparent (#5782).

    !end-bullet!
-   !begin-bullet!
    `stat_align()` skips computation when there is only 1 group and
    therefore alignment is not necessary (#5788).

    !end-bullet!
-   !begin-bullet!
    `position_stack()` skips computation when all `x` values are unique
    and therefore stacking is not necessary (#5788).

    !end-bullet!
-   !begin-bullet!
    A new `ggplot_build()` S3 method for `<ggplot_built>`{=html} classes
    was added, which returns input unaltered (@teunbrand, #5800).

    !end-bullet!
-   !begin-bullet!
    `width` is implemented as aesthetic instead of parameter in
    `geom_col()` and `geom_bar()` (#3142).

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `position_jitterdodge()` where different jitters would
    be applied to different position aesthetics of the same axis
    (@teunbrand, #5818).

    !end-bullet!
-   !begin-bullet!
    In `stat_bin()`, the default `boundary` is now chosen to better
    adhere to the `nbin` argument (@teunbrand, #5882, #5036)

    !end-bullet!
-   !begin-bullet!
    `after_stat()` and `after_scale()` throw warnings when the computed
    aesthetics are not of the correct length (#5901).

    !end-bullet!
-   !begin-bullet!
    `guide_colourbar()` now correctly hands off `position` and
    `available_aes` parameters downstream (@teunbrand, #5930)

    !end-bullet!
-   !begin-bullet!
    `geom_hline()` and `geom_vline()` now have `position` argument
    (@yutannihilation, #4285).

    !end-bullet!
-   !begin-bullet!
    New function `get_strip_labels()` to retrieve facet labels
    (@teunbrand, #4979)

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `position_dodge2()`'s identification of range overlaps
    (@teunbrand, #5938, #4327).

    !end-bullet!
-   !begin-bullet!
    Fixed bug where empty discrete scales weren't recognised as such
    (@teunbrand, #5945).

    !end-bullet!

!end-bullets-1!

# ggplot2 3.5.1

This is a small release focusing on fixing regressions from 3.5.0 and
documentation updates.

## Bug fixes

!begin-bullets-2!

-   !begin-bullet!
    Fixed bug where discrete scales could not map aesthetics only
    consisting of `NA`s (#5623)
    !end-bullet!
-   !begin-bullet!
    Fixed spurious warnings from `sec_axis()` with `breaks = NULL`
    (#5713).
    !end-bullet!
-   !begin-bullet!
    Patterns and gradients are now also enabled in `geom_sf()`
    (@teunbrand, #5716).
    !end-bullet!
-   !begin-bullet!
    The default behaviour of `resolution()` has been reverted to
    pre-3.5.0 behaviour. Whether mapped discrete vectors should be
    treated as having resolution of 1 is controlled by the new
    `discrete` argument.
    !end-bullet!
-   !begin-bullet!
    Fixed bug in `guide_bins()` and `guide_coloursteps()` where discrete
    breaks, such as the levels produced by `cut()`, were ordered
    incorrectly (@teunbrand, #5757).
    !end-bullet!

!end-bullets-2!

## Improvements

!begin-bullets-3!

-   !begin-bullet!
    When facets coerce the faceting variables to factors, the 'ordered'
    class is dropped (@teunbrand, #5666).
    !end-bullet!
-   !begin-bullet!
    `coord_map()` and `coord_polar()` throw informative warnings when
    used with the guide system (#5707).
    !end-bullet!
-   !begin-bullet!
    When passing a function to `stat_contour(breaks)`, that function is
    used to calculate the breaks even if `bins` and `binwidth` are
    missing (@teunbrand, #5686).
    !end-bullet!
-   !begin-bullet!
    `geom_step()` now supports `lineend`, `linejoin` and `linemitre`
    parameters (@teunbrand, #5705).
    !end-bullet!
-   !begin-bullet!
    Fixed performance loss when the `.data` pronoun is used in `aes()`
    (#5730).
    !end-bullet!
-   !begin-bullet!
    Facet evaluation is better at dealing with inherited errors
    (@teunbrand, #5670).
    !end-bullet!
-   !begin-bullet!
    `stat_bin()` deals with non-finite breaks better (@teunbrand,
    #5665).
    !end-bullet!
-   !begin-bullet!
    While axes in `coord_radial()` don't neatly fit the
    top/right/bottom/left organisation, specifying `position = "top"` or
    `position = "right"` in the scale will flip the placement of the
    radial axis (#5735)
    !end-bullet!
-   !begin-bullet!
    Theme elements that do not exist now throw warnings instead of
    errors (#5719).
    !end-bullet!
-   !begin-bullet!
    Fixed bug in `coord_radial()` where full circles were not treated as
    such (@teunbrand, #5750).
    !end-bullet!
-   !begin-bullet!
    When legends detect the presence of values in a layer, `NA` is now
    detected if the data contains values outside the given breaks
    (@teunbrand, #5749).
    !end-bullet!
-   !begin-bullet!
    `annotate()` now warns about `stat` or `position` arguments
    (@teunbrand, #5151)
    !end-bullet!
-   !begin-bullet!
    `guide_coloursteps(even.steps = FALSE)` now works with discrete data
    that has been formatted by `cut()` (@teunbrand, #3877).
    !end-bullet!

!end-bullets-3!

# ggplot2 3.5.0

This is a minor release that turned out quite beefy. It is focused on
overhauling the guide system: the system responsible for displaying
information from scales in the guise of axes and legends. As part of
that overhaul, new guides have been implemented and existing guides have
been refined. The look and feel of guides has been mostly preserved, but
their internals and styling options have changed drastically.

Briefly summarising other highlights, we also welcome `coord_radial()`
as a successor of `coord_polar()`. Initial support for newer graphical
features, such as pattern fills has been added. The API has changed how
`I()`/`<AsIs>` vectors interact with the scale system, namely: not at
all.

## Breaking changes

!begin-bullets-4!

-   !begin-bullet!
    The guide system. As a whole. See 'new features' for more
    information. While the S3 guide generics are still in place, the S3
    methods for `guide_train()`, `guide_merge()`, `guide_geom()`,
    `guide_transform()`, `guide_gengrob()` have been superseded by the
    respective ggproto methods. In practice, this will mean that
    `NextMethod()` or sub-classing ggplot2's guides with the S3 system
    will no longer work.

    !end-bullet!
-   !begin-bullet!
    By default, `guide_legend()` now only draws a key glyph for a layer
    when the value is in the layer's data. To revert to the old
    behaviour, you can still set `show.legend = c({aesthetic} = TRUE)`
    (@teunbrand, #3648).

    !end-bullet!
-   !begin-bullet!
    In the `scale_{colour/fill}_gradient2()` and
    `scale_{colour/fill}_steps2()` functions, the `midpoint` argument is
    transformed by the scale transformation (#3198).

    !end-bullet!
-   !begin-bullet!
    The `legend.key` theme element is set to inherit from the
    `panel.background` theme element. The default themes no longer set
    the `legend.key` element. This causes a visual change with the
    default `theme_gray()` (#5549).

    !end-bullet!
-   !begin-bullet!
    The `scale_name` argument in `continuous_scale()`,
    `discrete_scale()` and `binned_scale()` is soft-deprecated. If you
    have implemented custom scales, be advised to double-check that
    unnamed arguments ends up where they should (@teunbrand, #1312).

    !end-bullet!
-   !begin-bullet!
    The `legend.text.align` and `legend.title.align` arguments in
    `theme()` are deprecated. The `hjust` setting of the `legend.text`
    and `legend.title` elements continues to fulfill the role of text
    alignment (@teunbrand, #5347).

    !end-bullet!
-   !begin-bullet!
    'lines' units in `geom_label()`, often used in the `label.padding`
    argument, are now are relative to the text size. This causes a
    visual change, but fixes a misalignment issue between the textbox
    and text (@teunbrand, #4753)

    !end-bullet!
-   !begin-bullet!
    `coord_flip()` has been marked as superseded. The recommended
    alternative is to swap the `x` and `y` aesthetic and/or using the
    `orientation` argument in a layer (@teunbrand, #5130).

    !end-bullet!
-   !begin-bullet!
    The `trans` argument in scales and secondary axes has been renamed
    to `transform`. The `trans` argument itself is deprecated. To access
    the transformation from the scale, a new `get_transformation()`
    method is added to Scale-classes (#5558).

    !end-bullet!
-   !begin-bullet!
    Providing a numeric vector to `theme(legend.position)` has been
    deprecated. To set the default legend position inside the plot use
    `theme(legend.position = "inside", legend.position.inside = c(...))`
    instead.

    !end-bullet!

!end-bullets-4!

## New features

!begin-bullets-5!

-   !begin-bullet!
    Plot scales now ignore `AsIs` objects constructed with `I(x)`,
    instead of invoking the identity scale. This allows these columns to
    co-exist with other layers that need a non-identity scale for the
    same aesthetic. Also, it makes it easy to specify relative positions
    (@teunbrand, #5142).

    !end-bullet!
-   !begin-bullet!
    The `fill` aesthetic in many geoms now accepts grid's patterns and
    gradients. For developers of layer extensions, this feature can be
    enabled by switching from `fill = alpha(fill, alpha)` to
    `fill = fill_alpha(fill, alpha)` when providing fills to
    `grid::gpar()` (@teunbrand, #3997).

    !end-bullet!
-   !begin-bullet!
    New function `check_device()` for testing the availability of
    advanced graphics features introduced in R 4.1.0 onward (@teunbrand,
    #5332).

    !end-bullet!
-   !begin-bullet!
    `coord_radial()` is a successor to `coord_polar()` with more
    customisation options. `coord_radial()` can:

    !begin-bullets-6!
    -   !begin-bullet!
        integrate with the new guide system via a dedicated
        `guide_axis_theta()` to display the angle coordinate.
        !end-bullet!
    -   !begin-bullet!
        in addition to drawing full circles, also draw circle sectors by
        using the `end` argument.
        !end-bullet!
    -   !begin-bullet!
        avoid data vanishing in the center of the plot by setting the
        `donut` argument.
        !end-bullet!
    -   !begin-bullet!
        adjust the `angle` aesthetic of layers, such as `geom_text()`,
        to align with the coordinate system using the `rotate_angle`
        argument.
        !end-bullet!

    !end-bullets-6!
    !end-bullet!

!end-bullets-5!

### The guide system

The guide system encompassing axes and legends, as the last remaining
chunk of ggplot2, has been rewritten to use the `<ggproto>` system
instead of the S3 system. This change was a necessary step to officially
break open the guide system for extension package developers. The axes
and legends now inherit from a `<Guide>` class, which makes them
extensible in the same manner as geoms, stats, facets and coords (#3329,
@teunbrand)

!begin-bullets-7!

-   !begin-bullet!
    The most user-facing change is that the styling of guides is rewired
    through the theme system. Guides now have a `theme` argument that
    can style individual guides, while `theme()` has gained additional
    arguments to style guides. Theme elements declared in the guide
    override theme elements set through the plot. The new theme elements
    for guides are: `legend.key.spacing{.x/.y}`, `legend.frame`,
    `legend.axis.line`, `legend.ticks`, `legend.ticks.length`,
    `legend.text.position` and `legend.title.position`. Previous style
    options in the arguments of `guide_*()` functions are
    soft-deprecated.

    !end-bullet!
-   !begin-bullet!
    Unfortunately, we could not fully preserve the function of
    pre-existing guide extensions written in the S3 system. A fallback
    for these old guides is encapsulated in the `<GuideOld>` class,
    which calls the old S3 generics. The S3 methods have been removed as
    part of cleaning up, so the old guides will still work if the S3
    methods are reimplemented, but we encourage to switch to the new
    system (#2728).

    !end-bullet!
-   !begin-bullet!
    The `order` argument of guides now strictly needs to be a length-1
    integer (#4958).

    !end-bullet!

!end-bullets-7!

#### Axes

!begin-bullets-8!

-   !begin-bullet!
    New `guide_axis_stack()` to combine other axis guides on top of one
    another.

    !end-bullet!
-   !begin-bullet!
    New `guide_axis_theta()` to draw an axis in a circular arc in
    `coord_radial()`. The guide can be controlled by adding
    `guides(theta = guide_axis_theta(...))` to a plot.

    !end-bullet!
-   !begin-bullet!
    New `guide_axis_logticks()` can be used to draw logarithmic tick
    marks as an axis. It supersedes the `annotation_logticks()` function
    (@teunbrand, #5325).

    !end-bullet!
-   !begin-bullet!
    `guide_axis()` gains a `minor.ticks` argument to draw minor ticks
    (#4387).

    !end-bullet!
-   !begin-bullet!
    `guide_axis()` gains a `cap` argument that can be used to trim the
    axis line to extreme breaks (#4907).

    !end-bullet!
-   !begin-bullet!
    Primary axis titles are now placed at the primary guide, so that
    `guides(x = guide_axis(position = "top"))` will display the title at
    the top by default (#4650).

    !end-bullet!
-   !begin-bullet!
    The default `vjust` for the `axis.title.y.right` element is now 1
    instead of

    0.  

    !end-bullet!
-   !begin-bullet!
    Unknown secondary axis guide positions are now inferred as the
    opposite of the primary axis guide when the latter has a known
    `position` (#4650).

    !end-bullet!

!end-bullets-8!

#### Legends

!begin-bullets-9!

-   !begin-bullet!
    New `guide_custom()` function for drawing custom graphical objects
    (grobs) unrelated to scales in legend positions (#5416).

    !end-bullet!
-   !begin-bullet!
    All legends have acquired a `position` argument, that allows
    individual guides to deviate from the `legend.position` set in the
    `theme()` function. This means that legends can now be placed at
    multiple sides of the plot (#5488).

    !end-bullet!
-   !begin-bullet!
    The spacing between legend keys and their labels, in addition to
    legends and their titles, is now controlled by the text's `margin`
    setting. Not specifying margins will automatically add appropriate
    text margins. To control the spacing within a legend between keys,
    the new `legend.key.spacing.{x/y}` argument can be used in
    `theme()`. This leaves the `legend.spacing` theme setting dedicated
    to solely controlling the spacing between different guides (#5455).

    !end-bullet!
-   !begin-bullet!
    `guide_colourbar()` and `guide_coloursteps()` gain an `alpha`
    argument to set the transparency of the bar (#5085).

    !end-bullet!
-   !begin-bullet!
    New `display` argument in `guide_colourbar()` supplants the `raster`
    argument. In R 4.1.0 and above, `display = "gradient"` will draw a
    gradient.

    !end-bullet!
-   !begin-bullet!
    Legend keys that can draw arrows have their size adjusted for
    arrows.

    !end-bullet!
-   !begin-bullet!
    When legend titles are larger than the legend, title justification
    extends to the placement of keys and labels (#1903).

    !end-bullet!
-   !begin-bullet!
    Glyph drawing functions of the `draw_key_*()` family can now set
    `"width"` and `"height"` attributes (in centimetres) to the produced
    keys to control their displayed size in the legend.

    !end-bullet!
-   !begin-bullet!
    `coord_sf()` now uses customisable guides provided in the scales or
    `guides()` function (@teunbrand).

    !end-bullet!

!end-bullets-9!

## Improvements

!begin-bullets-10!

-   !begin-bullet!
    `guide_coloursteps(even.steps = FALSE)` now draws one rectangle per
    interval instead of many small ones (#5481).

    !end-bullet!
-   !begin-bullet!
    `draw_key_label()` now better reflects the appearance of labels
    (#5561).

    !end-bullet!
-   !begin-bullet!
    `position_stack()` no longer silently removes missing data, which is
    now handled by the geom instead of position (#3532).

    !end-bullet!
-   !begin-bullet!
    The `minor_breaks` function argument in scales can now also take a
    function with two arguments: the scale's limits and the scale's
    major breaks (#3583).

    !end-bullet!
-   !begin-bullet!
    Failing to fit or predict in `stat_smooth()` now gives a warning and
    omits the failed group, instead of throwing an error (@teunbrand,
    #5352).

    !end-bullet!
-   !begin-bullet!
    `labeller()` now handles unspecified entries from lookup tables
    (@92amartins, #4599).

    !end-bullet!
-   !begin-bullet!
    `fortify.default()` now accepts a data-frame-like object granted the
    object exhibits healthy `dim()`, `colnames()`, and `as.data.frame()`
    behaviours (@hpages, #5390).

    !end-bullet!
-   !begin-bullet!
    `geom_violin()` gains a `bounds` argument analogous to
    `geom_density()`s (@eliocamp, #5493).

    !end-bullet!
-   !begin-bullet!
    To apply dodging more consistently in violin plots,
    `stat_ydensity()` now has a `drop` argument to keep or discard
    groups with 1 observation.

    !end-bullet!
-   !begin-bullet!
    `geom_boxplot()` gains a new argument, `staplewidth` that can draw
    staples at the ends of whiskers (@teunbrand, #5126)

    !end-bullet!
-   !begin-bullet!
    `geom_boxplot()` gains an `outliers` argument to switch outliers on
    or off, in a manner that does affects the scale range. For hiding
    outliers that does not affect the scale range, you can continue to
    use `outlier.shape = NA` (@teunbrand, #4892).

    !end-bullet!
-   !begin-bullet!
    Nicer error messages for xlim/ylim arguments in coord-\* functions
    (@92amartins, #4601, #5297).

    !end-bullet!
-   !begin-bullet!
    You can now omit either `xend` or `yend` from `geom_segment()` as
    only one of these is now required. If one is missing, it will be
    filled from the `x` and `y` aesthetics respectively. This makes
    drawing horizontal or vertical segments a little bit more convenient
    (@teunbrand, #5140).

    !end-bullet!
-   !begin-bullet!
    When `geom_path()` has aesthetics varying within groups, the
    `arrow()` is applied to groups instead of individual segments
    (@teunbrand, #4935).

    !end-bullet!
-   !begin-bullet!
    `geom_text()` and `geom_label()` gained a `size.unit` parameter that
    set the text size to millimetres, points, centimetres, inches or
    picas (@teunbrand, #3799).

    !end-bullet!
-   !begin-bullet!
    `geom_label()` now uses the `angle` aesthetic (@teunbrand, #2785)

    !end-bullet!
-   !begin-bullet!
    The `label.padding` argument in `geom_label()` now supports inputs
    created with the `margin()` function (#5030).

    !end-bullet!
-   !begin-bullet!
    `ScaleContinuous$get_breaks()` now only calls `scales::zero_range()`
    on limits in transformed space, rather than in data space (#5304).

    !end-bullet!
-   !begin-bullet!
    Scales throw more informative messages (@teunbrand, #4185, #4258)

    !end-bullet!
-   !begin-bullet!
    `scale_*_manual()` with a named `values` argument now emits a
    warning when none of those names match the values found in the data
    (@teunbrand, #5298).

    !end-bullet!
-   !begin-bullet!
    The `name` argument in most scales is now explicitly the first
    argument (#5535)

    !end-bullet!
-   !begin-bullet!
    The `translate_shape_string()` internal function is now exported for
    use in extensions of point layers (@teunbrand, #5191).

    !end-bullet!
-   !begin-bullet!
    To improve `width` calculation in bar plots with empty factor
    levels, `resolution()` considers `mapped_discrete` values as having
    resolution 1 (@teunbrand, #5211)

    !end-bullet!
-   !begin-bullet!
    In `theme()`, some elements can be specified with `rel()` to inherit
    from `unit`-class objects in a relative fashion (@teunbrand, #3951).

    !end-bullet!
-   !begin-bullet!
    `theme()` now supports splicing a list of arguments (#5542).

    !end-bullet!
-   !begin-bullet!
    In the theme element hierarchy, parent elements that are a strict
    subclass of child elements now confer their subclass upon the
    children (#5457).

    !end-bullet!
-   !begin-bullet!
    New `plot.tag.location` in `theme()` can control placement of the
    plot tag in the `"margin"`, `"plot"` or the new `"panel"` option
    (#4297).

    !end-bullet!
-   !begin-bullet!
    `coord_munch()` can now close polygon shapes (@teunbrand, #3271)

    !end-bullet!
-   !begin-bullet!
    Aesthetics listed in `geom_*()` and `stat_*()` layers now point to
    relevant documentation (@teunbrand, #5123).

    !end-bullet!
-   !begin-bullet!
    The new argument `axes` in `facet_grid()` and `facet_wrap()`
    controls the display of axes at interior panel positions.
    Additionally, the `axis.labels` argument can be used to only draw
    tick marks or fully labelled axes (@teunbrand, #4064).

    !end-bullet!
-   !begin-bullet!
    `coord_polar()` can have free scales in facets (@teunbrand, #2815).

    !end-bullet!
-   !begin-bullet!
    The `get_guide_data()` function can be used to extract position and
    label information from the plot (#5004).

    !end-bullet!
-   !begin-bullet!
    Improve performance of layers without positional scales (@zeehio,
    #4990)

    !end-bullet!
-   !begin-bullet!
    More informative error for mismatched
    `direction`/`theme(legend.direction = ...)` arguments (#4364,
    #4930).

    !end-bullet!

!end-bullets-10!

## Bug fixes

!begin-bullets-11!

-   !begin-bullet!
    Fixed regression in `guide_legend()` where the `linewidth` key size
    wasn't adapted to the width of the lines (#5160).

    !end-bullet!
-   !begin-bullet!
    In `guide_bins()`, the title no longer arbitrarily becomes offset
    from the guide when it has long labels.

    !end-bullet!
-   !begin-bullet!
    `guide_colourbar()` and `guide_coloursteps()` merge properly when
    one of the aesthetics is dropped (#5324).

    !end-bullet!
-   !begin-bullet!
    When using `geom_dotplot(binaxis = "x")` with a discrete y-variable,
    dots are now stacked from the y-position rather than from 0
    (@teunbrand, #5462)

    !end-bullet!
-   !begin-bullet!
    `stat_count()` treats `x` as unique in the same manner `unique()`
    does (#4609).

    !end-bullet!
-   !begin-bullet!
    The plot's title, subtitle and caption now obey horizontal text
    margins (#5533).

    !end-bullet!
-   !begin-bullet!
    Contour functions will not fail when `options("OutDec")` is not `.`
    (@eliocamp, #5555).

    !end-bullet!
-   !begin-bullet!
    Lines where `linewidth = NA` are now dropped in `geom_sf()` (#5204).

    !end-bullet!
-   !begin-bullet!
    `ggsave()` no longer sometimes creates new directories, which is now
    controlled by the new `create.dir` argument (#5489).

    !end-bullet!
-   !begin-bullet!
    Legend titles no longer take up space if they've been removed by
    setting `legend.title = element_blank()` (@teunbrand, #3587).

    !end-bullet!
-   !begin-bullet!
    `resolution()` has a small tolerance, preventing spuriously small
    resolutions due to rounding errors (@teunbrand, #2516).

    !end-bullet!
-   !begin-bullet!
    `stage()` now works correctly, even with aesthetics that do not have
    scales (#5408)

    !end-bullet!
-   !begin-bullet!
    `stat_ydensity()` with incomplete groups calculates the default
    `width` parameter more stably (@teunbrand, #5396)

    !end-bullet!
-   !begin-bullet!
    The `size` argument in `annotation_logticks()` has been deprecated
    in favour of the `linewidth` argument (#5292).

    !end-bullet!
-   !begin-bullet!
    Binned scales now treat `NA`s in limits the same way continuous
    scales do (#5355).

    !end-bullet!
-   !begin-bullet!
    Binned scales work better with `trans = "reverse"` (#5355).

    !end-bullet!
-   !begin-bullet!
    Integers are once again valid input to theme arguments that expect
    numeric input (@teunbrand, #5369)

    !end-bullet!
-   !begin-bullet!
    Legends in `scale_*_manual()` can show `NA` values again when the
    `values` is a named vector (@teunbrand, #5214, #5286).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `coord_sf()` where graticule lines didn't obey
    `panel.grid.major`'s linewidth setting (@teunbrand, #5179)

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `annotation_logticks()` when no suitable tick positions
    could be found (@teunbrand, #5248).

    !end-bullet!
-   !begin-bullet!
    The default width of `geom_bar()` is now based on panel-wise
    resolution of the data, rather than global resolution (@teunbrand,
    #4336).

    !end-bullet!
-   !begin-bullet!
    `stat_align()` is now applied per panel instead of globally,
    preventing issues when facets have different ranges (@teunbrand,
    #5227).

    !end-bullet!
-   !begin-bullet!
    A stacking bug in `stat_align()` was fixed (@teunbrand, #5176).

    !end-bullet!
-   !begin-bullet!
    `stat_contour()` and `stat_contour_filled()` now warn about and
    remove duplicated coordinates (@teunbrand, #5215).

    !end-bullet!
-   !begin-bullet!
    `guide_coloursteps()` and `guide_bins()` sort breaks (#5152).

    !end-bullet!

!end-bullets-11!

## Internal changes

!begin-bullets-12!

-   !begin-bullet!
    The `ScaleContinuous$get_breaks()` method no longer censors the
    computed breaks.

    !end-bullet!
-   !begin-bullet!
    The ggplot object now contains `$layout` which points to the
    `Layout` ggproto object and will be used by the
    `ggplot_build.ggplot` method. This was exposed so that package
    developers may extend the behaviour of the `Layout` ggproto object
    without needing to develop an entirely new `ggplot_build` method
    (@jtlandis, #5077).

    !end-bullet!
-   !begin-bullet!
    Guide building is now part of `ggplot_build()` instead of
    `ggplot_gtable()` to allow guides to observe unmapped data (#5483).

    !end-bullet!
-   !begin-bullet!
    The `titleGrob()` function has been refactored to be faster and less
    complicated.

    !end-bullet!
-   !begin-bullet!
    The `scales_*()` functions related to managing the `<ScalesList>`
    class have been implemented as methods in the `<ScalesList>` class,
    rather than stray functions (#1310).

    !end-bullet!

!end-bullets-12!

# ggplot2 3.4.4

This hotfix release adapts to a change in r-devel's `base::is.atomic()`
and the upcoming retirement of maptools.

!begin-bullets-13!

-   !begin-bullet!
    `fortify()` for sp objects (e.g., `SpatialPolygonsDataFrame`) is now
    deprecated and will be removed soon in support of the upcoming
    retirement of rgdal, rgeos, and maptools. In advance of the whole
    removal, `fortify(<SpatialPolygonsDataFrame>, region = ...)` no
    longer works as of this version (@yutannihilation, #5244).
    !end-bullet!

!end-bullets-13!

# ggplot2 3.4.3

This hotfix release addresses a version comparison change in r-devel.
There are no user-facing or breaking changes.

# ggplot2 3.4.2

This is a hotfix release anticipating changes in r-devel, but folds in
upkeep changes and a few bug fixes as well.

## Minor improvements

!begin-bullets-14!

-   !begin-bullet!
    Various type checks and their messages have been standardised
    (@teunbrand, #4834).

    !end-bullet!
-   !begin-bullet!
    ggplot2 now uses `scales::DiscreteRange` and
    `scales::ContinuousRange`, which are available to write scale
    extensions from scratch (@teunbrand, #2710).

    !end-bullet!
-   !begin-bullet!
    The `layer_data()`, `layer_scales()` and `layer_grob()` now have the
    default `plot = last_plot()` (@teunbrand, #5166).

    !end-bullet!
-   !begin-bullet!
    The `datetime_scale()` scale constructor is now exported for use in
    extension packages (@teunbrand, #4701).

    !end-bullet!

!end-bullets-14!

## Bug fixes

!begin-bullets-15!

-   !begin-bullet!
    `update_geom_defaults()` and `update_stat_defaults()` now return
    properly classed objects and have updated docs (@dkahle, #5146).

    !end-bullet!
-   !begin-bullet!
    For the purposes of checking required or non-missing aesthetics,
    character vectors are no longer considered non-finite (@teunbrand,
    @4284).

    !end-bullet!
-   !begin-bullet!
    `annotation_logticks()` skips drawing ticks when the scale range is
    non-finite instead of throwing an error (@teunbrand, #5229).

    !end-bullet!
-   !begin-bullet!
    Fixed spurious warnings when the `weight` was used in
    `stat_bin_2d()`, `stat_boxplot()`, `stat_contour()`,
    `stat_bin_hex()` and `stat_quantile()` (@teunbrand, #5216).

    !end-bullet!
-   !begin-bullet!
    To prevent changing the plotting order, `stat_sf()` is now computed
    per panel instead of per group (@teunbrand, #4340).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `coord_sf()` where graticule lines didn't obey
    `panel.grid.major`'s linewidth setting (@teunbrand, #5179).

    !end-bullet!
-   !begin-bullet!
    `geom_text()` drops observations where `angle = NA` instead of
    throwing an error (@teunbrand, #2757).

    !end-bullet!

!end-bullets-15!

# ggplot2 3.4.1

This is a small release focusing on fixing regressions in the 3.4.0
release and minor polishes.

## Breaking changes

!begin-bullets-16!

-   !begin-bullet!
    The computed variable `y` in `stat_ecdf()` has been superseded by
    `ecdf` to prevent incorrect scale transformations (@teunbrand, #5113
    and #5112).
    !end-bullet!

!end-bullets-16!

## New features

!begin-bullets-17!

-   !begin-bullet!
    Added `scale_linewidth_manual()` and `scale_linewidth_identity()` to
    support the `linewidth` aesthetic (@teunbrand, #5050).

    !end-bullet!
-   !begin-bullet!
    `ggsave()` warns when multiple `filename`s are given, and only
    writes to the first file (@teunbrand, #5114).

    !end-bullet!

!end-bullets-17!

## Bug fixes

!begin-bullets-18!

-   !begin-bullet!
    Fixed a regression in `geom_hex()` where aesthetics were replicated
    across bins (@thomasp85, #5037 and #5044).

    !end-bullet!
-   !begin-bullet!
    Using two ordered factors as facetting variables in
    `facet_grid(..., as.table = FALSE)` now throws a warning instead of
    an error (@teunbrand, #5109).

    !end-bullet!
-   !begin-bullet!
    Fixed misbehaviour of `draw_key_boxplot()` and `draw_key_crossbar()`
    with skewed key aspect ratio (@teunbrand, #5082).

    !end-bullet!
-   !begin-bullet!
    Fixed spurious warning when `weight` aesthetic was used in
    `stat_smooth()` (@teunbrand based on @clauswilke's suggestion,
    #5053).

    !end-bullet!
-   !begin-bullet!
    The `lwd` alias is now correctly replaced by `linewidth` instead of
    `size` (@teunbrand based on @clauswilke's suggestion #5051).

    !end-bullet!
-   !begin-bullet!
    Fixed a regression in `Coord$train_panel_guides()` where names of
    guides were dropped (@maxsutton, #5063).

    !end-bullet!

!end-bullets-18!

In binned scales:

!begin-bullets-19!

-   !begin-bullet!
    Automatic breaks should no longer be out-of-bounds, and automatic
    limits are adjusted to include breaks (@teunbrand, #5082).

    !end-bullet!
-   !begin-bullet!
    Zero-range limits no longer throw an error and are treated akin to
    continuous scales with zero-range limits (@teunbrand, #5066).

    !end-bullet!
-   !begin-bullet!
    The `trans = "date"` and `trans = "time"` transformations were made
    compatible (@teunbrand, #4217).

    !end-bullet!

!end-bullets-19!

# ggplot2 3.4.0

This is a minor release focusing on tightening up the internals and
ironing out some inconsistencies in the API. The biggest change is the
addition of the `linewidth` aesthetic that takes of sizing the width of
any line from `size`. This change, while attempting to be as
non-breaking as possible, has the potential to change the look of some
of your plots.

Other notable changes is a complete redo of the error and warning
messaging in ggplot2 using the cli package. Messaging is now better
contextualised and it should be easier to identify which layer an error
is coming from. Last, we have now made the switch to using the vctrs
package internally which means that support for vctrs classes as
variables should improve, along with some small gains in rendering
speed.

## Breaking changes

!begin-bullets-20!

-   !begin-bullet!
    A `linewidth` aesthetic has been introduced and supersedes the
    `size` aesthetic for scaling the width of lines in line based geoms.
    `size` will remain functioning but deprecated for these geoms and it
    is recommended to update all code to reflect the new aesthetic. For
    geoms that have *both* point sizing and linewidth sizing
    (`geom_pointrange()` and `geom_sf`) `size` now **only** refers to
    sizing of points which can leads to a visual change in old code
    (@thomasp85, #3672)

    !end-bullet!
-   !begin-bullet!
    The default line width for polygons in `geom_sf()` have been
    decreased to 0.2 to reflect that this is usually used for demarking
    borders where a thinner line is better suited. This change was made
    since we already induced a visual change in `geom_sf()` with the
    introduction of the `linewidth` aesthetic.

    !end-bullet!
-   !begin-bullet!
    The dot-dot notation (`..var..`) and `stat()`, which have been
    superseded by `after_stat()`, are now formally deprecated
    (@yutannihilation, #3693).

    !end-bullet!
-   !begin-bullet!
    `qplot()` is now formally deprecated (@yutannihilation, #3956).

    !end-bullet!
-   !begin-bullet!
    `stage()` now properly refers to the values without scale
    transformations for the stage of `after_stat`. If your code requires
    the scaled version of the values for some reason, you have to apply
    the same transformation by yourself, e.g. `sqrt()` for
    `scale_{x,y}_sqrt()` (@yutannihilation and @teunbrand, #4155).

    !end-bullet!
-   !begin-bullet!
    Use `rlang::hash()` instead of `digest::digest()`. This update may
    lead to changes in the automatic sorting of legends. In order to
    enforce a specific legend order use the `order` argument in the
    guide. (@thomasp85, #4458)

    !end-bullet!
-   !begin-bullet!
    referring to `x` in backquoted expressions with `label_bquote()` is
    no longer possible.

    !end-bullet!
-   !begin-bullet!
    The `ticks.linewidth` and `frame.linewidth` parameters of
    `guide_colourbar()` are now multiplied with `.pt` like elsewhere in
    ggplot2. It can cause visual changes when these arguments are not
    the defaults and these changes can be restored to their previous
    behaviour by adding `/ .pt` (@teunbrand #4314).

    !end-bullet!
-   !begin-bullet!
    `scale_*_viridis_b()` now uses the full range of the viridis scales
    (@gregleleu, #4737)

    !end-bullet!

!end-bullets-20!

## New features

!begin-bullets-21!

-   !begin-bullet!
    `geom_col()` and `geom_bar()` gain a new `just` argument. This is
    set to `0.5` by default; use `just = 0`/`just = 1` to place columns
    on the left/right of the axis breaks. (@wurli, #4899)

    !end-bullet!
-   !begin-bullet!
    `geom_density()` and `stat_density()` now support `bounds` argument
    to estimate density with boundary correction (@echasnovski, #4013).

    !end-bullet!
-   !begin-bullet!
    ggplot now checks during statistical transformations whether any
    data columns were dropped and warns about this. If stats intend to
    drop data columns they can declare them in the new field
    `dropped_aes`. (@clauswilke, #3250)

    !end-bullet!
-   !begin-bullet!
    `...` supports `rlang::list2` dynamic dots in all public functions.
    (@mone27, #4764)

    !end-bullet!
-   !begin-bullet!
    `theme()` now has a `strip.clip` argument, that can be set to
    `"off"` to prevent the clipping of strip text and background borders
    (@teunbrand, #4118)

    !end-bullet!
-   !begin-bullet!
    `geom_contour()` now accepts a function in the `breaks` argument
    (@eliocamp, #4652).

    !end-bullet!

!end-bullets-21!

## Minor improvements and bug fixes

!begin-bullets-22!

-   !begin-bullet!
    Fix a bug in `position_jitter()` where infinity values were dropped
    (@javlon, #4790).

    !end-bullet!
-   !begin-bullet!
    `geom_linerange()` now respects the `na.rm` argument (#4927,
    @thomasp85)

    !end-bullet!
-   !begin-bullet!
    Improve the support for `guide_axis()` on `coord_trans()`
    (@yutannihilation, #3959)

    !end-bullet!
-   !begin-bullet!
    Added `stat_align()` to align data without common x-coordinates
    prior to stacking. This is now the default stat for `geom_area()`
    (@thomasp85, #4850)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `stat_contour_filled()` where break value differences
    below a certain number of digits would cause the computations to
    fail (@thomasp85, #4874)

    !end-bullet!
-   !begin-bullet!
    Secondary axis ticks are now positioned more precisely, removing
    small visual artefacts with alignment between grid and ticks
    (@thomasp85, #3576)

    !end-bullet!
-   !begin-bullet!
    Improve `stat_function` documentation regarding `xlim` argument.
    (@92amartins, #4474)

    !end-bullet!
-   !begin-bullet!
    Fix various issues with how `labels`, `breaks`, `limits`, and
    `show.limits` interact in the different binning guides (@thomasp85,
    #4831)

    !end-bullet!
-   !begin-bullet!
    Automatic break calculation now squishes the scale limits to the
    domain of the transformation. This allows `scale_{x/y}_sqrt()` to
    find breaks at 0\
    when appropriate (@teunbrand, #980).

    !end-bullet!
-   !begin-bullet!
    Using multiple modified aesthetics correctly will no longer trigger
    warnings. If used incorrectly, the warning will now report the
    duplicated aesthetic instead of `NA` (@teunbrand, #4707).

    !end-bullet!
-   !begin-bullet!
    `aes()` now supports the `!!!` operator in its first two arguments
    (#2675). Thanks to @yutannihilation and @teunbrand for draft
    implementations.

    !end-bullet!
-   !begin-bullet!
    Require rlang \>= 1.0.0 (@billybarc, #4797)

    !end-bullet!
-   !begin-bullet!
    `geom_violin()` no longer issues "collapsing to unique 'x' values"
    warning (@bersbersbers, #4455)

    !end-bullet!
-   !begin-bullet!
    `annotate()` now documents unsupported geoms (`geom_abline()`,
    `geom_hline()` and `geom_vline()`), and warns when they are
    requested (@mikmart, #4719)

    !end-bullet!
-   !begin-bullet!
    `presidential` dataset now includes Trump's presidency (@bkmgit,
    #4703).

    !end-bullet!
-   !begin-bullet!
    `position_stack()` now works fully with `geom_text()` (@thomasp85,
    #4367)

    !end-bullet!
-   !begin-bullet!
    `geom_tile()` now correctly recognises missing data in `xmin`,
    `xmax`, `ymin`, and `ymax` (@thomasp85 and @sigmapi, #4495)

    !end-bullet!
-   !begin-bullet!
    `geom_hex()` will now use the binwidth from `stat_bin_hex()` if
    present, instead of deriving it (@thomasp85, #4580)

    !end-bullet!
-   !begin-bullet!
    `geom_hex()` now works on non-linear coordinate systems (@thomasp85)

    !end-bullet!
-   !begin-bullet!
    Fixed a bug throwing errors when trying to render an empty plot with
    secondary axes (@thomasp85, #4509)

    !end-bullet!
-   !begin-bullet!
    Axes are now added correctly in `facet_wrap()` when
    `as.table = FALSE` (@thomasp85, #4553)

    !end-bullet!
-   !begin-bullet!
    Better compatibility of custom device functions in `ggsave()`
    (@thomasp85, #4539)

    !end-bullet!
-   !begin-bullet!
    Binning scales are now more resilient to calculated limits that ends
    up being `NaN` after transformations (@thomasp85, #4510)

    !end-bullet!
-   !begin-bullet!
    Strip padding in `facet_grid()` is now only in effect if
    `strip.placement = "outside"` *and* an axis is present between the
    strip and the panel (@thomasp85, #4610)

    !end-bullet!
-   !begin-bullet!
    Aesthetics of length 1 are now recycled to 0 if the length of the
    data is 0 (@thomasp85, #4588)

    !end-bullet!
-   !begin-bullet!
    Setting `size = NA` will no longer cause `guide_legend()` to error
    (@thomasp85, #4559)

    !end-bullet!
-   !begin-bullet!
    Setting `stroke` to `NA` in `geom_point()` will no longer impair the
    sizing of the points (@thomasp85, #4624)

    !end-bullet!
-   !begin-bullet!
    `stat_bin_2d()` now correctly recognises the `weight` aesthetic
    (@thomasp85, #4646)

    !end-bullet!
-   !begin-bullet!
    All geoms now have consistent exposure of linejoin and lineend
    parameters, and the guide keys will now respect these settings
    (@thomasp85, #4653)

    !end-bullet!
-   !begin-bullet!
    `geom_sf()` now respects `arrow` parameter for lines (@jakeruss,
    #4659)

    !end-bullet!
-   !begin-bullet!
    Updated documentation for `print.ggplot` to reflect that it returns
    the original plot, not the result of `ggplot_build()`. (@r2evans,
    #4390)

    !end-bullet!
-   !begin-bullet!
    `scale_*_manual()` no longer displays extra legend keys, or changes
    their order, when a named `values` argument has more items than the
    data. To display all `values` on the legend instead, use
    `scale_*_manual(values = vals, limits = names(vals))`. (@teunbrand,
    @banfai, #4511, #4534)

    !end-bullet!
-   !begin-bullet!
    Updated documentation for `geom_contour()` to correctly reflect
    argument precedence between `bins` and `binwidth`. (@eliocamp,
    #4651)

    !end-bullet!
-   !begin-bullet!
    Dots in `geom_dotplot()` are now correctly aligned to the baseline
    when `stackratio != 1` and `stackdir != "up"` (@mjskay, #4614)

    !end-bullet!
-   !begin-bullet!
    Key glyphs for `geom_boxplot()`, `geom_crossbar()`,
    `geom_pointrange()`, and `geom_linerange()` are now
    orientation-aware (@mjskay, #4732)

    !end-bullet!
-   !begin-bullet!
    Updated documentation for `geom_smooth()` to more clearly describe
    effects of the `fullrange` parameter (@thoolihan, #4399).

    !end-bullet!

!end-bullets-22!

# ggplot2 3.3.6

This is a very small release only applying an internal change to comply
with R 4.2 and its deprecation of `default.stringsAsFactors()`. There
are no user facing changes and no breaking changes.

# ggplot2 3.3.5

This is a very small release focusing on fixing a couple of untenable
issues that surfaced with the 3.3.4 release

!begin-bullets-23!

-   !begin-bullet!
    Revert changes made in #4434 (apply transform to intercept in
    `geom_abline()`) as it introduced undesirable issues far worse than
    the bug it fixed (@thomasp85, #4514)
    !end-bullet!
-   !begin-bullet!
    Fixes an issue in `ggsave()` when producing emf/wmf files
    (@yutannihilation, #4521)
    !end-bullet!
-   !begin-bullet!
    Warn when grDevices specific arguments are passed to ragg devices
    (@thomasp85, #4524)
    !end-bullet!
-   !begin-bullet!
    Fix an issue where `coord_sf()` was reporting that it is non-linear
    even when data is provided in projected coordinates (@clauswilke,
    #4527)
    !end-bullet!

!end-bullets-23!

# ggplot2 3.3.4

This is a larger patch release fixing a huge number of bugs and
introduces a small selection of feature refinements.

## Features

!begin-bullets-24!

-   !begin-bullet!
    Alt-text can now be added to a plot using the `alt` label, i.e
    `+ labs(alt = ...)`. Currently this alt text is not automatically
    propagated, but we plan to integrate into Shiny, RMarkdown, and
    other tools in the future. (@thomasp85, #4477)

    !end-bullet!
-   !begin-bullet!
    Add support for the BrailleR package for creating descriptions of
    the plot when rendered (@thomasp85, #4459)

    !end-bullet!
-   !begin-bullet!
    `coord_sf()` now has an argument `default_crs` that specifies the
    coordinate reference system (CRS) for non-sf layers and scale/coord
    limits. This argument defaults to `NULL`, which means non-sf layers
    are assumed to be in projected coordinates, as in prior ggplot2
    versions. Setting `default_crs = sf::st_crs(4326)` provides a simple
    way to interpret x and y positions as longitude and latitude,
    regardless of the CRS used by `coord_sf()`. Authors of extension
    packages implementing `stat_sf()`-like functionality are encouraged
    to look at the source code of `stat_sf()`'s `compute_group()`
    function to see how to provide scale-limit hints to `coord_sf()`
    (@clauswilke, #3659).

    !end-bullet!
-   !begin-bullet!
    `ggsave()` now uses ragg to render raster output if ragg is
    available. It also handles custom devices that sets a default unit
    (e.g. `ragg::agg_png`) correctly (@thomasp85, #4388)

    !end-bullet!
-   !begin-bullet!
    `ggsave()` now returns the saved file location invisibly (#3379,
    @eliocamp). Note that, as a side effect, an unofficial hack
    `<ggplot object> + ggsave()` no longer works (#4513).

    !end-bullet!
-   !begin-bullet!
    The scale arguments `limits`, `breaks`, `minor_breaks`, `labels`,
    `rescaler` and `oob` now accept purrr style lambda notation
    (@teunbrand, #4427). The same is true for `as_labeller()` (and
    therefore also `labeller()`) (@netique, #4188).

    !end-bullet!
-   !begin-bullet!
    Manual scales now allow named vectors passed to `values` to contain
    fewer elements than existing in the data. Elements not present in
    values will be set to `NA` (@thomasp85, #3451)

    !end-bullet!
-   !begin-bullet!
    Date and datetime position scales support out-of-bounds (oob)
    arguments to control how limits affect data outside those limits
    (@teunbrand, #4199).

    !end-bullet!

!end-bullets-24!

## Fixes

!begin-bullets-25!

-   !begin-bullet!
    Fix a bug that `after_stat()` and `after_scale()` cannot refer to
    aesthetics if it's specified in the plot-global mapping
    (@yutannihilation, #4260).

    !end-bullet!
-   !begin-bullet!
    Fix bug in `annotate_logticks()` that would cause an error when used
    together with `coord_flip()` (@thomasp85, #3954)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `geom_abline()` that resulted in `intercept` not being
    subjected to the transformation of the y scale (@thomasp85, #3741)

    !end-bullet!
-   !begin-bullet!
    Extent the range of the line created by `geom_abline()` so that line
    ending is not visible for large linewidths (@thomasp85, #4024)

    !end-bullet!
-   !begin-bullet!
    Fix bug in `geom_dotplot()` where dots would be positioned wrong
    with `stackgroups = TRUE` (@thomasp85, #1745)

    !end-bullet!
-   !begin-bullet!
    Fix calculation of confidence interval for locfit smoothing in
    `geom_smooth()` (@topepo, #3806)

    !end-bullet!
-   !begin-bullet!
    Fix bug in `geom_text()` where `"outward"` and `"inward"`
    justification for some `angle` values was reversed (@aphalo, #4169,
    #4447)

    !end-bullet!
-   !begin-bullet!
    `ggsave()` now sets the default background to match the fill value
    of the `plot.background` theme element (@karawoo, #4057)

    !end-bullet!
-   !begin-bullet!
    It is now deprecated to specify `guides(<scale> = FALSE)` or
    `scale_*(guide = FALSE)` to remove a guide. Please use
    `guides(<scale> = "none")` or `scale_*(guide = "none")` instead
    (@yutannihilation, #4097)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `guide_bins()` where keys would disappear if the guide
    was reversed (@thomasp85, #4210)

    !end-bullet!
-   !begin-bullet!
    Fix bug in `guide_coloursteps()` that would repeat the terminal bins
    if the breaks coincided with the limits of the scale (@thomasp85,
    #4019)

    !end-bullet!
-   !begin-bullet!
    Make sure that default labels from default mappings doesn't
    overwrite default labels from explicit mappings (@thomasp85, #2406)

    !end-bullet!
-   !begin-bullet!
    Fix bug in `labeller()` where parsing was turned off if
    `.multiline = FALSE` (@thomasp85, #4084)

    !end-bullet!
-   !begin-bullet!
    Make sure `label_bquote()` has access to the calling environment
    when evaluating the labels (@thomasp85, #4141)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in the layer implementation that introduced a new state
    after the first render which could lead to a different look when
    rendered the second time (@thomasp85, #4204)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in legend justification where justification was lost of
    the legend dimensions exceeded the available size (@thomasp85,
    #3635)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `position_dodge2()` where `NA` values in thee data
    would cause an error (@thomasp85, #2905)

    !end-bullet!
-   !begin-bullet!
    Make sure `position_jitter()` creates the same jittering independent
    of whether it is called by name or with constructor (@thomasp85,
    #2507)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `position_jitter()` where different jitters would be
    applied to different position aesthetics of the same axis
    (@thomasp85, #2941)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `qplot()` when supplying `c(NA, NA)` as axis limits
    (@thomasp85, #4027)

    !end-bullet!
-   !begin-bullet!
    Remove cross-inheritance of default discrete colour/fill scales and
    check the type and aesthetic of function output if `type` is a
    function (@thomasp85, #4149)

    !end-bullet!
-   !begin-bullet!
    Fix bug in `scale_[x|y]_date()` where custom breaks functions that
    resulted in fractional dates would get misaligned (@thomasp85,
    #3965)

    !end-bullet!
-   !begin-bullet!
    Fix bug in `scale_[x|y]_datetime()` where a specified timezone would
    be ignored by the scale (@thomasp85, #4007)

    !end-bullet!
-   !begin-bullet!
    Fix issue in `sec_axis()` that would throw warnings in the absence
    of any secondary breaks (@thomasp85, #4368)

    !end-bullet!
-   !begin-bullet!
    `stat_bin()`'s computed variable `width` is now documented (#3522).

    !end-bullet!
-   !begin-bullet!
    `stat_count()` now computes width based on the full dataset instead
    of per group (@thomasp85, #2047)

    !end-bullet!
-   !begin-bullet!
    Extended `stat_ecdf()` to calculate the cdf from either x or y
    instead from y only (@jgjl, #4005)

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `stat_summary_bin()` where one more than the requested
    number of bins would be created (@thomasp85, #3824)

    !end-bullet!
-   !begin-bullet!
    Only drop groups in `stat_ydensity()` when there are fewer than two
    data points and throw a warning (@andrewwbutler, #4111).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in strip assembly when theme has
    `strip.text = element_blank()` and plots are faceted with
    multi-layered strips (@teunbrand, #4384).

    !end-bullet!
-   !begin-bullet!
    Using `theme(aspect.ratio = ...)` together with free space in
    `facet_grid()` now correctly throws an error (@thomasp85, #3834)

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in `labeller()` so that `.default` is passed to
    `as_labeller()` when labellers are specified by naming faceting
    variables. (@waltersom, #4031)

    !end-bullet!
-   !begin-bullet!
    Updated style for example code (@rjake, #4092)

    !end-bullet!
-   !begin-bullet!
    ggplot2 now requires R \>= 3.3 (#4247).

    !end-bullet!
-   !begin-bullet!
    ggplot2 now uses `rlang::check_installed()` to check if a suggested
    package is installed, which will offer to install the package before
    continuing (#4375,

    1)  

    !end-bullet!
-   !begin-bullet!
    Improved error with hint when piping a `ggplot` object into a facet
    function (#4379, @mitchelloharawild).

    !end-bullet!

!end-bullets-25!

# ggplot2 3.3.3

This is a small patch release mainly intended to address changes in R
and CRAN. It further changes the licensing model of ggplot2 to an MIT
license.

!begin-bullets-26!

-   !begin-bullet!
    Update the ggplot2 licence to an MIT license (#4231, #4232, #4233,
    and #4281)

    !end-bullet!
-   !begin-bullet!
    Use vdiffr conditionally so ggplot2 can be tested on systems without
    vdiffr

    !end-bullet!
-   !begin-bullet!
    Update tests to work with the new `all.equal()` defaults in R
    \>4.0.3

    !end-bullet!
-   !begin-bullet!
    Fixed a bug that `guide_bins()` mistakenly ignore `override.aes`
    argument (@yutannihilation, #4085).

    !end-bullet!

!end-bullets-26!

# ggplot2 3.3.2

This is a small release focusing on fixing regressions introduced in
3.3.1.

!begin-bullets-27!

-   !begin-bullet!
    Added an `outside` option to `annotation_logticks()` that places
    tick marks outside of the plot bounds. (#3783, @kbodwin)

    !end-bullet!
-   !begin-bullet!
    `annotation_raster()` adds support for native rasters. For large
    rasters, native rasters render significantly faster than arrays
    (@kent37, #3388)

    !end-bullet!
-   !begin-bullet!
    Facet strips now have dedicated position-dependent theme elements
    (`strip.text.x.top`, `strip.text.x.bottom`, `strip.text.y.left`,
    `strip.text.y.right`) that inherit from `strip.text.x` and
    `strip.text.y`, respectively. As a consequence, some theme stylings
    now need to be applied to the position-dependent elements rather
    than to the parent elements. This change was already introduced in
    ggplot2 3.3.0 but not listed in the changelog. (@thomasp85, #3683)

    !end-bullet!
-   !begin-bullet!
    Facets now handle layers containing no data (@yutannihilation,
    #3853).

    !end-bullet!
-   !begin-bullet!
    A newly added geom `geom_density_2d_filled()` and associated stat
    `stat_density_2d_filled()` can draw filled density contours
    (@clauswilke, #3846).

    !end-bullet!
-   !begin-bullet!
    A newly added `geom_function()` is now recommended to use in
    conjunction with/instead of `stat_function()`. In addition,
    `stat_function()` now works with transformed y axes,
    e.g. `scale_y_log10()`, and in plots containing no other data or
    layers (@clauswilke, #3611, #3905, #3983).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in `geom_sf()` that caused problems with legend-type
    autodetection (@clauswilke, #3963).

    !end-bullet!
-   !begin-bullet!
    Support graphics devices that use the `file` argument instead of
    `fileneame` in `ggsave()` (@bwiernik, #3810)

    !end-bullet!
-   !begin-bullet!
    Default discrete color scales are now configurable through the
    `options()` of `ggplot2.discrete.colour` and
    `ggplot2.discrete.fill`. When set to a character vector of colour
    codes (or list of character vectors) with sufficient length, these
    colours are used for the default scale. See
    `help(scale_colour_discrete)` for more details and examples
    (@cpsievert, #3833).

    !end-bullet!
-   !begin-bullet!
    Default continuous colour scales (i.e., the `options()`
    `ggplot2.continuous.colour` and `ggplot2.continuous.fill`, which
    inform the `type` argument of `scale_fill_continuous()` and
    `scale_colour_continuous()`) now accept a function, which allows
    more control over these default `continuous_scale()`s (@cpsievert,
    #3827).

    !end-bullet!
-   !begin-bullet!
    A bug was fixed in `stat_contour()` when calculating breaks based on
    the `bins` argument (@clauswilke, #3879, #4004).

    !end-bullet!
-   !begin-bullet!
    Data columns can now contain `Vector` S4 objects, which are widely
    used in the Bioconductor project. (@teunbrand, #3837)

    !end-bullet!

!end-bullets-27!

# ggplot2 3.3.1

This is a small release with no code change. It removes all malicious
links to a site that got hijacked from the readme and pkgdown site.

# ggplot2 3.3.0

This is a minor release but does contain a range of substantial new
features, along with the standard bug fixes. The release contains a few
visual breaking changes, along with breaking changes for extension
developers due to a shift in internal representation of the position
scales and their axes. No user breaking changes are included.

This release also adds Dewey Dunnington (@paleolimbot) to the core team.

## Breaking changes

There are no user-facing breaking changes, but a change in some internal
representations that extension developers may have relied on, along with
a few breaking visual changes which may cause visual tests in downstream
packages to fail.

!begin-bullets-28!

-   !begin-bullet!
    The `panel_params` field in the `Layout` now contains a list of list
    of `ViewScale` objects, describing the trained coordinate system
    scales, instead of the list object used before. Any extensions that
    use this field will likely break, as will unit tests that checks
    aspects of this.

    !end-bullet!
-   !begin-bullet!
    `element_text()` now issues a warning when vectorized arguments are
    provided, as in `colour = c("red", "green", "blue")`. Such use is
    discouraged and not officially supported (@clauswilke, #3492).

    !end-bullet!
-   !begin-bullet!
    Changed `theme_grey()` setting for legend key so that it creates no
    border (`NA`) rather than drawing a white one. (@annennenne, #3180)

    !end-bullet!
-   !begin-bullet!
    `geom_ribbon()` now draws separate lines for the upper and lower
    intervals if `colour` is mapped. Similarly, `geom_area()` and
    `geom_density()` now draw the upper lines only in the same case by
    default. If you want old-style full stroking, use
    `outline.type = "full"` (@yutannihilation, #3503 / @thomasp85,
    #3708).

    !end-bullet!

!end-bullets-28!

## New features

!begin-bullets-29!

-   !begin-bullet!
    The evaluation time of aesthetics can now be controlled to a finer
    degree. `after_stat()` supersedes the use of `stat()` and
    `..var..`-notation, and is joined by `after_scale()` to allow for
    mapping to scaled aesthetic values. Remapping of the same aesthetic
    is now supported with `stage()`, so you can map a data variable to a
    stat aesthetic, and remap the same aesthetic to something else after
    statistical transformation (@thomasp85, #3534)

    !end-bullet!
-   !begin-bullet!
    All `coord_*()` functions with `xlim` and `ylim` arguments now
    accept vectors with `NA` as a placeholder for the minimum or maximum
    value (e.g., `ylim = c(0, NA)` would zoom the y-axis from 0 to the
    maximum value observed in the data). This mimics the behaviour of
    the `limits` argument in continuous scale functions (@paleolimbot,
    #2907).

    !end-bullet!
-   !begin-bullet!
    Allowed reversing of discrete scales by re-writing `get_limits()`
    (@AnneLyng, #3115)

    !end-bullet!
-   !begin-bullet!
    All geoms and stats that had a direction (i.e. where the x and y
    axes had different interpretation), can now freely choose their
    direction, instead of relying on `coord_flip()`. The direction is
    deduced from the aesthetic mapping, but can also be specified
    directly with the new `orientation` argument (@thomasp85, #3506).

    !end-bullet!
-   !begin-bullet!
    Position guides can now be customized using the new `guide_axis()`,
    which can be passed to position `scale_*()` functions or via
    `guides()`. The new axis guide (`guide_axis()`) comes with arguments
    `check.overlap` (automatic removal of overlapping labels), `angle`
    (easy rotation of axis labels), and `n.dodge` (dodge labels into
    multiple rows/columns) (@paleolimbot, #3322).

    !end-bullet!
-   !begin-bullet!
    A new scale type has been added, that allows binning of aesthetics
    at the scale level. It has versions for both position and
    non-position aesthetics and comes with two new guides (`guide_bins`
    and `guide_coloursteps`) (@thomasp85, #3096)

    !end-bullet!
-   !begin-bullet!
    `scale_x_continuous()` and `scale_y_continuous()` gains an
    `n.breaks` argument guiding the number of automatic generated breaks
    (@thomasp85, #3102)

    !end-bullet!
-   !begin-bullet!
    Added `stat_contour_filled()` and `geom_contour_filled()`, which
    compute and draw filled contours of gridded data (@paleolimbot,
    #3044). `geom_contour()` and `stat_contour()` now use the isoband
    package to compute contour lines. The `complete` parameter (which
    was undocumented and has been unused for at least four years) was
    removed (@paleolimbot, #3044).

    !end-bullet!
-   !begin-bullet!
    Themes have gained two new parameters, `plot.title.position` and
    `plot.caption.position`, that can be used to customize how plot
    title/subtitle and plot caption are positioned relative to the
    overall plot (@clauswilke, #3252).

    !end-bullet!

!end-bullets-29!

## Extensions

!begin-bullets-30!

-   !begin-bullet!
    `Geom` now gains a `setup_params()` method in line with the other
    ggproto classes (@thomasp85, #3509)

    !end-bullet!
-   !begin-bullet!
    The newly added function `register_theme_elements()` now allows
    developers of extension packages to define their own new theme
    elements and place them into the ggplot2 element tree (@clauswilke,
    #2540).

    !end-bullet!

!end-bullets-30!

## Minor improvements and bug fixes

!begin-bullets-31!

-   !begin-bullet!
    `coord_trans()` now draws second axes and accepts `xlim`, `ylim`,
    and `expand` arguments to bring it up to feature parity with
    `coord_cartesian()`. The `xtrans` and `ytrans` arguments that were
    deprecated in version 1.0.1 in favour of `x` and `y` were removed
    (@paleolimbot, #2990).

    !end-bullet!
-   !begin-bullet!
    `coord_trans()` now calculates breaks using the expanded range
    (previously these were calculated using the unexpanded range, which
    resulted in differences between plots made with `coord_trans()` and
    those made with `coord_cartesian()`). The expansion for discrete
    axes in `coord_trans()` was also updated such that it behaves
    identically to that in `coord_cartesian()` (@paleolimbot, #3338).

    !end-bullet!
-   !begin-bullet!
    `expand_scale()` was deprecated in favour of `expansion()` for
    setting the `expand` argument of `x` and `y` scales (@paleolimbot).

    !end-bullet!
-   !begin-bullet!
    `geom_abline()`, `geom_hline()`, and `geom_vline()` now issue more
    informative warnings when supplied with set aesthetics (i.e.,
    `slope`, `intercept`, `yintercept`, and/or `xintercept`) and mapped
    aesthetics (i.e., `data` and/or `mapping`).

    !end-bullet!
-   !begin-bullet!
    Fix a bug in `geom_raster()` that squeezed the image when it went
    outside scale limits (#3539, @thomasp85)

    !end-bullet!
-   !begin-bullet!
    `geom_sf()` now determines the legend type automatically (@microly,
    #3646).

    !end-bullet!
-   !begin-bullet!
    `geom_sf()` now removes rows that can't be plotted due to `NA`
    aesthetics (#3546, @thomasp85)

    !end-bullet!
-   !begin-bullet!
    `geom_sf()` now applies alpha to linestring geometries (#3589,
    @yutannihilation).

    !end-bullet!
-   !begin-bullet!
    `gg_dep()` was deprecated (@perezp44, #3382).

    !end-bullet!
-   !begin-bullet!
    Added function `ggplot_add.by()` for lists created with `by()`,
    allowing such lists to be added to ggplot objects (#2734,
    @Maschette)

    !end-bullet!
-   !begin-bullet!
    ggplot2 no longer depends on reshape2, which means that it no longer
    (recursively) needs plyr, stringr, or stringi packages.

    !end-bullet!
-   !begin-bullet!
    Increase the default `nbin` of `guide_colourbar()` to place the
    ticks more precisely (#3508, @yutannihilation).

    !end-bullet!
-   !begin-bullet!
    `manual_scale()` now matches `values` with the order of `breaks`
    whenever `values` is an unnamed vector. Previously, unnamed `values`
    would match with the limits of the scale and ignore the order of any
    `breaks` provided. Note that this may change the appearance of plots
    that previously relied on the unordered behaviour (#2429,
    @idno0001).

    !end-bullet!
-   !begin-bullet!
    `scale_manual_*(limits = ...)` now actually limits the scale (#3262,
    @yutannihilation).

    !end-bullet!
-   !begin-bullet!
    Fix a bug when `show.legend` is a named logical vector (#3461,
    @yutannihilation).

    !end-bullet!
-   !begin-bullet!
    Added weight aesthetic option to `stat_density()` and made scaling
    of weights the default (@annennenne, #2902)

    !end-bullet!
-   !begin-bullet!
    `stat_density2d()` can now take an `adjust` parameter to scale the
    default bandwidth. (#2860, @haleyjeppson)

    !end-bullet!
-   !begin-bullet!
    `stat_smooth()` uses `REML` by default, if `method = "gam"` and
    `gam`'s method is not specified (@ikosmidis, #2630).

    !end-bullet!
-   !begin-bullet!
    stacking text when calculating the labels and the y axis with
    `stat_summary()` now works (@ikosmidis, #2709)

    !end-bullet!
-   !begin-bullet!
    `stat_summary()` and related functions now support rlang-style
    lambda functions (#3568, @dkahle).

    !end-bullet!
-   !begin-bullet!
    The data mask pronoun, `.data`, is now stripped from default labels.

    !end-bullet!
-   !begin-bullet!
    Addition of partial themes to plots has been made more predictable;
    stepwise addition of individual partial themes is now equivalent to
    addition of multple theme elements at once (@clauswilke, #3039).

    !end-bullet!
-   !begin-bullet!
    Facets now don't fail even when some variable in the spec are not
    available in all layers (@yutannihilation, #2963).

    !end-bullet!

!end-bullets-31!

# ggplot2 3.2.1

This is a patch release fixing a few regressions introduced in 3.2.0 as
well as fixing some unit tests that broke due to upstream changes.

!begin-bullets-32!

-   !begin-bullet!
    `position_stack()` no longer changes the order of the input data.
    Changes to the internal behaviour of `geom_ribbon()` made this
    reordering problematic with ribbons that spanned `y = 0` (#3471)
    !end-bullet!
-   !begin-bullet!
    Using `qplot()` with a single positional aesthetic will no longer
    title the non-specified scale as `"NULL"` (#3473)
    !end-bullet!
-   !begin-bullet!
    Fixes unit tests for sf graticule labels caused by changes to sf
    !end-bullet!

!end-bullets-32!

# ggplot2 3.2.0

This is a minor release with an emphasis on internal changes to make
ggplot2 faster and more consistent. The few interface changes will only
affect the aesthetics of the plot in minor ways, and will only
potentially break code of extension developers if they have relied on
internals that have been changed. This release also sees the addition of
Hiroaki Yutani (@yutannihilation) to the core developer team.

With the release of R 3.6, ggplot2 now requires the R version to be at
least 3.2, as the tidyverse is committed to support 5 major versions of
R.

## Breaking changes

!begin-bullets-33!

-   !begin-bullet!
    Two patches (#2996 and #3050) fixed minor rendering problems. In
    most cases, the visual changes are so subtle that they are difficult
    to see with the naked eye. However, these changes are detected by
    the vdiffr package, and therefore any package developers who use
    vdiffr to test for visual correctness of ggplot2 plots will have to
    regenerate all reference images.

    !end-bullet!
-   !begin-bullet!
    In some cases, ggplot2 now produces a warning or an error for code
    that previously produced plot output. In all these cases, the
    previous plot output was accidental, and the plotting code uses the
    ggplot2 API in a way that would lead to undefined behavior. Examples
    include a missing `group` aesthetic in `geom_boxplot()` (#3316),
    annotations across multiple facets (#3305), and not using aesthetic
    mappings when drawing ribbons with `geom_ribbon()` (#3318).

    !end-bullet!

!end-bullets-33!

## New features

!begin-bullets-34!

-   !begin-bullet!
    This release includes a range of internal changes that speeds up
    plot generation. None of the changes are user facing and will not
    break any code, but in general ggplot2 should feel much faster. The
    changes includes, but are not limited to:

    !begin-bullets-35!
    -   !begin-bullet!
        Caching ascent and descent dimensions of text to avoid
        recalculating it for every title.

        !end-bullet!
    -   !begin-bullet!
        Using a faster data.frame constructor as well as faster indexing
        into data.frames

        !end-bullet!
    -   !begin-bullet!
        Removing the plyr dependency, replacing plyr functions with
        faster equivalents.

        !end-bullet!

    !end-bullets-35!
    !end-bullet!
-   !begin-bullet!
    `geom_polygon()` can now draw polygons with holes using the new
    `subgroup` aesthetic. This functionality requires R 3.6.0
    (@thomasp85, #3128)

    !end-bullet!
-   !begin-bullet!
    Aesthetic mappings now accept functions that return `NULL`
    (@yutannihilation, #2997).

    !end-bullet!
-   !begin-bullet!
    `stat_function()` now accepts rlang/purrr style anonymous functions
    for the `fun` parameter (@dkahle, #3159).

    !end-bullet!
-   !begin-bullet!
    `geom_rug()` gains an "outside" option to allow for moving the rug
    tassels to outside the plot area (@njtierney, #3085) and a `length`
    option to allow for changing the length of the rug lines
    (@daniel-wells, #3109).

    !end-bullet!
-   !begin-bullet!
    All geoms now take a `key_glyph` paramter that allows users to
    customize how legend keys are drawn (@clauswilke, #3145). In
    addition, a new key glyph `timeseries` is provided to draw nice
    legends for time series (@mitchelloharawild, #3145).

    !end-bullet!

!end-bullets-34!

## Extensions

!begin-bullets-36!

-   !begin-bullet!
    Layers now have a new member function `setup_layer()` which is
    called at the very beginning of the plot building process and which
    has access to the original input data and the plot object being
    built. This function allows the creation of custom layers that
    autogenerate aesthetic mappings based on the input data or that
    filter the input data in some form. For the time being, this feature
    is not exported, but it has enabled the development of a new layer
    type, `layer_sf()` (see next item). Other special-purpose layer
    types may be added in the future (@clauswilke, #2872).

    !end-bullet!
-   !begin-bullet!
    A new layer type `layer_sf()` can auto-detect and auto-map sf
    geometry columns in the data. It should be used by extension
    developers who are writing new sf-based geoms or stats (@clauswilke,
    #3232).

    !end-bullet!
-   !begin-bullet!
    `x0` and `y0` are now recognized positional aesthetics so they will
    get scaled if used in extension geoms and stats (@thomasp85, #3168)

    !end-bullet!
-   !begin-bullet!
    Continuous scale limits now accept functions which accept the
    default limits and return adjusted limits. This makes it possible to
    write a function that e.g. ensures the limits are always a multiple
    of 100, regardless of the data (@econandrew, #2307).

    !end-bullet!

!end-bullets-36!

## Minor improvements and bug fixes

!begin-bullets-37!

-   !begin-bullet!
    `cut_width()` now accepts `...` to pass further arguments to
    `base::cut.default()` like `cut_number()` and `cut_interval()`
    already did (@cderv, #3055)

    !end-bullet!
-   !begin-bullet!
    `coord_map()` now can have axes on the top and right (@karawoo,
    #3042).

    !end-bullet!
-   !begin-bullet!
    `coord_polar()` now correctly rescales the secondary axis
    (@linzi-sg, #3278)

    !end-bullet!
-   !begin-bullet!
    `coord_sf()`, `coord_map()`, and `coord_polar()` now squash `-Inf`
    and `Inf` into the min and max of the plot (@yutannihilation,
    #2972).

    !end-bullet!
-   !begin-bullet!
    `coord_sf()` graticule lines are now drawn in the same thickness as
    panel grid lines in `coord_cartesian()`, and seting panel grid lines
    to `element_blank()` now also works in `coord_sf()` (@clauswilke,
    #2991, #2525).

    !end-bullet!
-   !begin-bullet!
    `economics` data has been regenerated. This leads to some changes in
    the values of all columns (especially in `psavert`), but more
    importantly, strips the grouping attributes from `economics_long`.

    !end-bullet!
-   !begin-bullet!
    `element_line()` now fills closed arrows (@yutannihilation, #2924).

    !end-bullet!
-   !begin-bullet!
    Facet strips on the left side of plots now have clipping turned on,
    preventing text from running out of the strip and borders from
    looking thicker than for other strips (@karawoo, #2772 and #3061).

    !end-bullet!
-   !begin-bullet!
    ggplot2 now works in Turkish locale (@yutannihilation, #3011).

    !end-bullet!
-   !begin-bullet!
    Clearer error messages for inappropriate aesthetics (@clairemcwhite,
    #3060).

    !end-bullet!
-   !begin-bullet!
    ggplot2 no longer attaches any external packages when using
    functions that depend on packages that are suggested but not
    imported by ggplot2. The affected functions include `geom_hex()`,
    `stat_binhex()`, `stat_summary_hex()`, `geom_quantile()`,
    `stat_quantile()`, and `map_data()` (@clauswilke, #3126).

    !end-bullet!
-   !begin-bullet!
    `geom_area()` and `geom_ribbon()` now sort the data along the x-axis
    in the `setup_data()` method rather than as part of `draw_group()`
    (@thomasp85, #3023)

    !end-bullet!
-   !begin-bullet!
    `geom_hline()`, `geom_vline()`, and `geom_abline()` now throw a
    warning if the user supplies both an `xintercept`, `yintercept`, or
    `slope` value and a mapping (@RichardJActon, #2950).

    !end-bullet!
-   !begin-bullet!
    `geom_rug()` now works with `coord_flip()` (@has2k1, #2987).

    !end-bullet!
-   !begin-bullet!
    `geom_violin()` no longer throws an error when quantile lines fall
    outside the violin polygon (@thomasp85, #3254).

    !end-bullet!
-   !begin-bullet!
    `guide_legend()` and `guide_colorbar()` now use appropriate spacing
    between legend key glyphs and legend text even if the legend title
    is missing (@clauswilke, #2943).

    !end-bullet!
-   !begin-bullet!
    Default labels are now generated more consistently; e.g., symbols no
    longer get backticks, and long expressions are abbreviated with
    `...` (@yutannihilation, #2981).

    !end-bullet!
-   !begin-bullet!
    All-`Inf` layers are now ignored for picking the scale
    (@yutannihilation, #3184).

    !end-bullet!
-   !begin-bullet!
    Diverging Brewer colour palette now use the correct mid-point colour
    (@dariyasydykova, #3072).

    !end-bullet!
-   !begin-bullet!
    `scale_color_continuous()` now points to `scale_colour_continuous()`
    so that it will handle `type = "viridis"` as the documentation
    states (@hlendway, #3079).

    !end-bullet!
-   !begin-bullet!
    `scale_shape_identity()` now works correctly with `guide = "legend"`
    (1, #3029)

    !end-bullet!
-   !begin-bullet!
    `scale_continuous` will now draw axis line even if the length of
    breaks is 0 (@thomasp85, #3257)

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` will now error when the number of bins exceeds 1e6 to
    avoid accidentally freezing the user session (@thomasp85).

    !end-bullet!
-   !begin-bullet!
    `sec_axis()` now places ticks accurately when using nonlinear
    transformations (@dpseidel, #2978).

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()` and `facet_grid()` now automatically remove NULL from
    facet specs, and accept empty specs (@yutannihilation, #3070,
    #2986).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` now handles data with only one unique value
    (@yutannihilation #3047).

    !end-bullet!
-   !begin-bullet!
    `sec_axis()` now accepts functions as well as formulas
    (@yutannihilation, #3031).

    !end-bullet!
-   !begin-bullet!
    New theme elements allowing different ticks lengths for each axis.
    For instance, this can be used to have inwards ticks on the x-axis
    (`axis.ticks.length.x`) and outwards ticks on the y-axis
    (`axis.ticks.length.y`) (@pank, #2935).

    !end-bullet!
-   !begin-bullet!
    The arguments of `Stat*$compute_layer()` and
    `Position*$compute_layer()` are now renamed to always match the ones
    of `Stat$compute_layer()` and `Position$compute_layer()`
    (@yutannihilation, #3202).

    !end-bullet!
-   !begin-bullet!
    `geom_*()` and `stat_*()` now accepts purrr-style lambda notation
    (@yutannihilation, #3138).

    !end-bullet!
-   !begin-bullet!
    `geom_tile()` and `geom_rect()` now draw rectangles without notches
    at the corners. The style of the corner can be controlled by
    `linejoin` parameters (@yutannihilation, #3050).

    !end-bullet!

!end-bullets-37!

# ggplot2 3.1.0

## Breaking changes

This is a minor release and breaking changes have been kept to a
minimum. End users of ggplot2 are unlikely to encounter any issues.
However, there are a few items that developers of ggplot2 extensions
should be aware of. For additional details, see also the discussion
accompanying issue #2890.

!begin-bullets-38!

-   !begin-bullet!
    In non-user-facing internal code (specifically in the `aes()`
    function and in the `aesthetics` argument of scale functions),
    ggplot2 now always uses the British spelling for aesthetics
    containing the word "colour". When users specify a "color" aesthetic
    it is automatically renamed to "colour". This renaming is also
    applied to non-standard aesthetics that contain the word "color".
    For example, "point_color" is renamed to "point_colour". This
    convention makes it easier to support both British and American
    spelling for novel, non-standard aesthetics, but it may require some
    adjustment for packages that have previously introduced non-standard
    color aesthetics using American spelling. A new function
    `standardise_aes_names()` is provided in case extension writers need
    to perform this renaming in their own code (@clauswilke, #2649).

    !end-bullet!
-   !begin-bullet!
    Functions that generate other functions (closures) now force the
    arguments that are used from the generated functions, to avoid
    hard-to-catch errors. This may affect some users of manual scales
    (such as `scale_colour_manual()`, `scale_fill_manual()`, etc.) who
    depend on incorrect behavior (@krlmlr, #2807).

    !end-bullet!
-   !begin-bullet!
    `Coord` objects now have a function `backtransform_range()` that
    returns the panel range in data coordinates. This change may affect
    developers of custom coords, who now should implement this function.
    It may also affect developers of custom geoms that use the `range()`
    function. In some applications, `backtransform_range()` may be more
    appropriate (@clauswilke, #2821).

    !end-bullet!

!end-bullets-38!

## New features

!begin-bullets-39!

-   !begin-bullet!
    `coord_sf()` has much improved customization of axis tick labels.
    Labels can now be set manually, and there are two new parameters,
    `label_graticule` and `label_axes`, that can be used to specify
    which graticules to label on which side of the plot (@clauswilke,
    #2846, #2857, #2881).

    !end-bullet!
-   !begin-bullet!
    Two new geoms `geom_sf_label()` and `geom_sf_text()` can draw labels
    and text on sf objects. Under the hood, a new
    `stat_sf_coordinates()` calculates the x and y coordinates from the
    coordinates of the sf geometries. You can customize the calculation
    method via `fun.geometry` argument (@yutannihilation, #2761).

    !end-bullet!

!end-bullets-39!

## Minor improvements and fixes

!begin-bullets-40!

-   !begin-bullet!
    `benchplot()` now uses tidy evaluation (@dpseidel, #2699).

    !end-bullet!
-   !begin-bullet!
    The error message in `compute_aesthetics()` now only provides the
    names of aesthetics with mismatched lengths, rather than all
    aesthetics (@karawoo, #2853).

    !end-bullet!
-   !begin-bullet!
    For faceted plots, data is no longer internally reordered. This
    makes it safer to feed data columns into `aes()` or into parameters
    of geoms or stats. However, doing so remains discouraged
    (@clauswilke, #2694).

    !end-bullet!
-   !begin-bullet!
    `coord_sf()` now also understands the `clip` argument, just like the
    other coords (@clauswilke, #2938).

    !end-bullet!
-   !begin-bullet!
    `fortify()` now displays a more informative error message for
    `grouped_df()` objects when dplyr is not installed (@jimhester,
    #2822).

    !end-bullet!
-   !begin-bullet!
    All `geom_*()` now display an informative error message when
    required aesthetics are missing (@dpseidel, #2637 and #2706).

    !end-bullet!
-   !begin-bullet!
    `geom_boxplot()` now understands the `width` parameter even when
    used with a non-standard stat, such as `stat_identity()`
    (@clauswilke, #2893).

    !end-bullet!
-   !begin-bullet!
    `geom_hex()` now understands the `size` and `linetype` aesthetics
    (@mikmart, #2488).

    !end-bullet!
-   !begin-bullet!
    `geom_hline()`, `geom_vline()`, and `geom_abline()` now work
    properly with `coord_trans()` (@clauswilke, #2149, #2812).

    !end-bullet!
-   !begin-bullet!
    `geom_text(..., parse = TRUE)` now correctly renders the expected
    number of items instead of silently dropping items that are empty
    expressions, e.g. the empty string "". If an expression spans
    multiple lines, we take just the first line and drop the rest. This
    same issue is also fixed for `geom_label()` and the axis labels for
    `geom_sf()` (@slowkow, #2867).

    !end-bullet!
-   !begin-bullet!
    `geom_sf()` now respects `lineend`, `linejoin`, and `linemitre`
    parameters for lines and polygons (@alistaire47, #2826).

    !end-bullet!
-   !begin-bullet!
    `ggsave()` now exits without creating a new graphics device if
    previously none was open (@clauswilke, #2363).

    !end-bullet!
-   !begin-bullet!
    `labs()` now has named arguments `title`, `subtitle`, `caption`, and
    `tag`. Also, `labs()` now accepts tidyeval (@yutannihilation,
    #2669).

    !end-bullet!
-   !begin-bullet!
    `position_nudge()` is now more robust and nudges only in the
    direction requested. This enables, for example, the horizontal
    nudging of boxplots (@clauswilke, #2733).

    !end-bullet!
-   !begin-bullet!
    `sec_axis()` and `dup_axis()` now return appropriate breaks for the
    secondary axis when applied to log transformed scales (@dpseidel,
    #2729).

    !end-bullet!
-   !begin-bullet!
    `sec_axis()` now works as expected when used in combination with
    tidy eval (@dpseidel, #2788).

    !end-bullet!
-   !begin-bullet!
    `scale_*_date()`, `scale_*_time()` and `scale_*_datetime()` can now
    display a secondary axis that is a **one-to-one** transformation of
    the primary axis, implemented using the `sec.axis` argument to the
    scale constructor (@dpseidel, #2244).

    !end-bullet!
-   !begin-bullet!
    `stat_contour()`, `stat_density2d()`, `stat_bin2d()`,
    `stat_binhex()` now calculate normalized statistics including
    `nlevel`, `ndensity`, and `ncount`. Also, `stat_density()` now
    includes the calculated statistic `nlevel`, an alias for `scaled`,
    to better match the syntax of `stat_bin()` (@bjreisman, #2679).

    !end-bullet!

!end-bullets-40!

# ggplot2 3.0.0

## Breaking changes

!begin-bullets-41!

-   !begin-bullet!
    ggplot2 now supports/uses tidy evaluation (as described below). This
    is a major change and breaks a number of packages; we made this
    breaking change because it is important to make ggplot2 more
    programmable, and to be more consistent with the rest of the
    tidyverse. The best general (and detailed) introduction to tidy
    evaluation can be found in the meta programming chapters in Advanced
    R.

    The primary developer facing change is that `aes()` now contains
    quosures (expression + environment pairs) rather than symbols, and
    you'll need to take a different approach to extracting the
    information you need. A common symptom of this change are errors
    "undefined columns selected" or "invalid 'type' (list) of argument"
    (#2610). As in the previous version, constants (like `aes(x = 1)` or
    `aes(colour = "smoothed")`) are stored as is.

    In this version of ggplot2, if you need to describe a mapping in a
    string, use `quo_name()` (to generate single-line strings; longer
    expressions may be abbreviated) or `quo_text()` (to generate
    non-abbreviated strings that may span multiple lines). If you do
    need to extract the value of a variable instead use
    `rlang::eval_tidy()`. You may want to condition on
    `(packageVersion("ggplot2") <= "2.2.1")` so that your code can work
    with both released and development versions of ggplot2.

    We recognise that this is a big change and if you're not already
    familiar with rlang, there's a lot to learn. If you are stuck, or
    need any help, please reach out on https://forum.posit.co/.

    !end-bullet!
-   !begin-bullet!
    Error: Column `y` must be a 1d atomic vector or a list

    Internally, ggplot2 now uses `as.data.frame(tibble::as_tibble(x))`
    to convert a list into a data frame. This improves ggplot2's support
    for list-columns (needed for sf support), at a small cost: you can
    no longer use matrix-columns. Note that unlike tibble we still allow
    column vectors such as returned by `base::scale()` because of their
    widespread use.

    !end-bullet!
-   !begin-bullet!
    Error: More than one expression parsed

    Previously `aes_string(x = c("a", "b", "c"))` silently returned
    `aes(x = a)`. Now this is a clear error.

    !end-bullet!
-   !begin-bullet!
    Error: `data` must be uniquely named but has duplicate columns

    If layer data contains columns with identical names an error will be
    thrown. In earlier versions the first occurring column was chosen
    silently, potentially masking that the wrong data was chosen.

    !end-bullet!
-   !begin-bullet!
    Error: Aesthetics must be either length 1 or the same as the data

    Layers are stricter about the columns they will combine into a
    single data frame. Each aesthetic now must be either the same length
    as the data frame or a single value. This makes silent recycling
    errors much less likely.

    !end-bullet!
-   !begin-bullet!
    Error: `coord_*` doesn't support free scales

    Free scales only work with selected coordinate systems; previously
    you'd get an incorrect plot.

    !end-bullet!
-   !begin-bullet!
    Error in f(...) : unused argument (range = c(0, 1))

    This is because the `oob` argument to scale has been set to a
    function that only takes a single argument; it needs to take two
    arguments (`x`, and `range`).

    !end-bullet!
-   !begin-bullet!
    Error: unused argument (output)

    The function `guide_train()` now has an optional parameter
    `aesthetic` that allows you to override the `aesthetic` setting in
    the scale. To make your code work with the both released and
    development versions of ggplot2 appropriate, add `aesthetic = NULL`
    to the `guide_train()` method signature.

    !begin-codeblock!
    ``` r
    # old
    guide_train.legend <- function(guide, scale) {...}

    # new 
    guide_train.legend <- function(guide, scale, aesthetic = NULL) {...}
    ```

    !end-codeblock!
    Then, inside the function, replace `scale$aesthetics[1]`,
    `aesthetic %||% scale$aesthetics[1]`. (The %\|\|% operator is
    defined in the rlang package).

    !begin-codeblock!
    ``` r
    # old
    setNames(list(scale$map(breaks)), scale$aesthetics[1])

    # new
    setNames(list(scale$map(breaks)), aesthetic %||% scale$aesthetics[1])
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    The long-deprecated `subset` argument to `layer()` has been removed.

    !end-bullet!

!end-bullets-41!

## Tidy evaluation

!begin-bullets-42!

-   !begin-bullet!
    `aes()` now supports quasiquotation so that you can use `!!`, `!!!`,
    and `:=`. This replaces `aes_()` and `aes_string()` which are now
    soft-deprecated (but will remain around for a long time).

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()` and `facet_grid()` now support `vars()` inputs. Like
    `dplyr::vars()`, this helper quotes its inputs and supports
    quasiquotation. For instance, you can now supply faceting variables
    like this: `facet_wrap(vars(am, cyl))` instead of
    `facet_wrap(~am + cyl)`. Note that the formula interface is not
    going away and will not be deprecated. `vars()` is simply meant to
    make it easier to create functions around `facet_wrap()` and
    `facet_grid()`.

    The first two arguments of `facet_grid()` become `rows` and `cols`
    and now support `vars()` inputs. Note however that we took special
    care to ensure complete backward compatibility. With this change
    `facet_grid(vars(cyl), vars(am, vs))` is equivalent to
    `facet_grid(cyl ~ am + vs)`, and `facet_grid(cols = vars(am, vs))`
    is equivalent to `facet_grid(. ~ am + vs)`.

    One nice aspect of the new interface is that you can now easily
    supply names:
    `facet_grid(vars(Cylinder = cyl), labeller = label_both)` will give
    nice label titles to the facets. Of course, those names can be
    unquoted with the usual tidy eval syntax.

    !end-bullet!

!end-bullets-42!

### sf

!begin-bullets-43!

-   !begin-bullet!
    ggplot2 now has full support for sf with `geom_sf()` and
    `coord_sf()`:

    !begin-codeblock!
    ``` r
    nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
    ggplot(nc) +
      geom_sf(aes(fill = AREA))
    ```

    !end-codeblock!
    It supports all simple features, automatically aligns CRS across
    layers, sets up the correct aspect ratio, and draws a graticule.

    !end-bullet!

!end-bullets-43!

## New features

!begin-bullets-44!

-   !begin-bullet!
    ggplot2 now works on R 3.1 onwards, and uses the vdiffr package for
    visual testing.

    !end-bullet!
-   !begin-bullet!
    In most cases, accidentally using `%>%` instead of `+` will generate
    an informative error (#2400).

    !end-bullet!
-   !begin-bullet!
    New syntax for calculated aesthetics. Instead of using
    `aes(y = ..count..)` you can (and should!) use
    `aes(y = stat(count))`. `stat()` is a real function with
    documentation which hopefully will make this part of ggplot2 less
    confusing (#2059).

    `stat()` is particularly nice for more complex calculations because
    you only need to specify it once:
    `aes(y = stat(count / max(count)))`, rather than
    `aes(y = ..count.. / max(..count..))`

    !end-bullet!
-   !begin-bullet!
    New `tag` label for adding identification tags to plots, typically
    used for labelling a subplot with a letter. Add a tag with
    `labs(tag = "A")`, style it with the `plot.tag` theme element, and
    control position with the `plot.tag.position` theme setting
    (@thomasp85).

    !end-bullet!

!end-bullets-44!

### Layers: geoms, stats, and position adjustments

!begin-bullets-45!

-   !begin-bullet!
    `geom_segment()` and `geom_curve()` have a new `arrow.fill`
    parameter which allows you to specify a separate fill colour for
    closed arrowheads (@hrbrmstr and @clauswilke, #2375).

    !end-bullet!
-   !begin-bullet!
    `geom_point()` and friends can now take shapes as strings instead of
    integers, e.g. `geom_point(shape = "diamond")` (@daniel-barnett,
    #2075).

    !end-bullet!
-   !begin-bullet!
    `position_dodge()` gains a `preserve` argument that allows you to
    control whether the `total` width at each `x` value is preserved
    (the current default), or ensure that the width of a `single`
    element is preserved (what many people want) (#1935).

    !end-bullet!
-   !begin-bullet!
    New `position_dodge2()` provides enhanced dodging for boxplots.
    Compared to `position_dodge()`, `position_dodge2()` compares `xmin`
    and `xmax` values\
    to determine which elements overlap, and spreads overlapping
    elements evenly within the region of overlap. `position_dodge2()` is
    now the default position adjustment for `geom_boxplot()`, because it
    handles `varwidth = TRUE`, and will be considered for other geoms in
    the future.

    The `padding` parameter adds a small amount of padding between
    elements (@karawoo, #2143) and a `reverse` parameter allows you to
    reverse the order of placement (@karawoo, #2171).

    !end-bullet!
-   !begin-bullet!
    New `stat_qq_line()` makes it easy to add a simple line to a Q-Q
    plot, which makes it easier to judge the fit of the theoretical
    distribution (@nicksolomon).

    !end-bullet!

!end-bullets-45!

### Scales and guides

!begin-bullets-46!

-   !begin-bullet!
    Improved support for mapping date/time variables to `alpha`, `size`,
    `colour`, and `fill` aesthetics, including `date_breaks` and
    `date_labels` arguments (@karawoo, #1526), and new `scale_alpha()`
    variants (@karawoo, #1526).

    !end-bullet!
-   !begin-bullet!
    Improved support for ordered factors. Ordered factors throw a
    warning when mapped to shape (unordered factors do not), and do not
    throw warnings when mapped to size or alpha (unordered factors do).
    Viridis is used as the default colour and fill scale for ordered
    factors (@karawoo, #1526).

    !end-bullet!
-   !begin-bullet!
    The `expand` argument of `scale_*_continuous()` and
    `scale_*_discrete()` now accepts separate expansion values for the
    lower and upper range limits. The expansion limits can be specified
    using the convenience function `expand_scale()`.

    Separate expansion limits may be useful for bar charts, e.g. if one
    wants the bottom of the bars to be flush with the x axis but still
    leave some (automatically calculated amount of) space above them:

    !begin-codeblock!
    ``` r
    ggplot(mtcars) +
        geom_bar(aes(x = factor(cyl))) +
        scale_y_continuous(expand = expand_scale(mult = c(0, .1)))
    ```

    !end-codeblock!
    It can also be useful for line charts, e.g. for counts over time,
    where one wants to have a 'hard' lower limit of y = 0 but leave the
    upper limit unspecified (and perhaps differing between panels), with
    some extra space above the highest point on the line (with
    symmetrical limits, the extra space above the highest point could in
    some cases cause the lower limit to be negative).

    The old syntax for the `expand` argument will, of course, continue
    to work (@huftis, #1669).

    !end-bullet!
-   !begin-bullet!
    `scale_colour_continuous()` and `scale_colour_gradient()` are now
    controlled by global options `ggplot2.continuous.colour` and
    `ggplot2.continuous.fill`. These can be set to `"gradient"` (the
    default) or `"viridis"` (@karawoo).

    !end-bullet!
-   !begin-bullet!
    New `scale_colour_viridis_c()`/`scale_fill_viridis_c()` (continuous)
    and `scale_colour_viridis_d()`/`scale_fill_viridis_d()` (discrete)
    make it easy to use Viridis colour scales (@karawoo, #1526).

    !end-bullet!
-   !begin-bullet!
    Guides for `geom_text()` now accept custom labels with
    `guide_legend(override.aes = list(label = "foo"))` (@brianwdavis,
    #2458).

    !end-bullet!

!end-bullets-46!

### Margins

!begin-bullets-47!

-   !begin-bullet!
    Strips gain margins on all sides by default. This means that to
    fully justify text to the edge of a strip, you will need to also set
    the margins to 0 (@karawoo).

    !end-bullet!
-   !begin-bullet!
    Rotated strip labels now correctly understand `hjust` and `vjust`
    parameters at all angles (@karawoo).

    !end-bullet!
-   !begin-bullet!
    Strip labels now understand justification relative to the direction
    of the text, meaning that in y facets, the strip text can be placed
    at either end of the strip using `hjust` (@karawoo).

    !end-bullet!
-   !begin-bullet!
    Legend titles and labels get a little extra space around them, which
    prevents legend titles from overlapping the legend at large font
    sizes (@karawoo, #1881).

    !end-bullet!

!end-bullets-47!

## Extension points

!begin-bullets-48!

-   !begin-bullet!
    New `autolayer()` S3 generic (@mitchelloharawild, #1974). This is
    similar to `autoplot()` but produces layers rather than complete
    plots.

    !end-bullet!
-   !begin-bullet!
    Custom objects can now be added using `+` if a `ggplot_add` method
    has been defined for the class of the object (@thomasp85).

    !end-bullet!
-   !begin-bullet!
    Theme elements can now be subclassed. Add a `merge_element` method
    to control how properties are inherited from the parent element. Add
    an `element_grob` method to define how elements are rendered into
    grobs (@thomasp85, #1981).

    !end-bullet!
-   !begin-bullet!
    Coords have gained new extension mechanisms.

    If you have an existing coord extension, you will need to revise the
    specification of the `train()` method. It is now called
    `setup_panel_params()` (better reflecting what it actually does) and
    now has arguments `scale_x`, and `scale_y` (the x and y scales
    respectively) and `param`, a list of plot specific parameters
    generated by `setup_params()`.

    What was formerly called `scale_details` (in coords), `panel_ranges`
    (in layout) and `panel_scales` (in geoms) are now consistently
    called `panel_params` (#1311). These are parameters of the coord
    that vary from panel to panel.

    !end-bullet!
-   !begin-bullet!
    `ggplot_build()` and `ggplot_gtable()` are now generics, so
    ggplot-subclasses can define additional behavior during the build
    stage.

    !end-bullet!
-   !begin-bullet!
    `guide_train()`, `guide_merge()`, `guide_geom()`, and
    `guide_gengrob()` are now exported as they are needed if you want to
    design your own guide. They are not currently documented; use at
    your own risk (#2528).

    !end-bullet!
-   !begin-bullet!
    `scale_type()` generic is now exported and documented. Use this if
    you want to extend ggplot2 to work with a new type of vector.

    !end-bullet!

!end-bullets-48!

## Minor bug fixes and improvements

### Faceting

!begin-bullets-49!

-   !begin-bullet!
    `facet_grid()` gives a more informative error message if you try to
    use a variable in both rows and cols (#1928).

    !end-bullet!
-   !begin-bullet!
    `facet_grid()` and `facet_wrap()` both give better error messages if
    you attempt to use an unsupported coord with free scales (#2049).

    !end-bullet!
-   !begin-bullet!
    `label_parsed()` works once again (#2279).

    !end-bullet!
-   !begin-bullet!
    You can now style the background of horizontal and vertical strips
    independently with `strip.background.x` and `strip.background.y`
    theme settings (#2249).

    !end-bullet!

!end-bullets-49!

### Scales

!begin-bullets-50!

-   !begin-bullet!
    `discrete_scale()` documentation now inherits shared definitions
    from `continuous_scale()` (@alistaire47, #2052).

    !end-bullet!
-   !begin-bullet!
    `guide_colorbar()` shows all colours of the scale (@has2k1, #2343).

    !end-bullet!
-   !begin-bullet!
    `scale_identity()` once again produces legends by default (#2112).

    !end-bullet!
-   !begin-bullet!
    Tick marks for secondary axes with strong transformations are more
    accurately placed (@thomasp85, #1992).

    !end-bullet!
-   !begin-bullet!
    Missing line types now reliably generate missing lines (with
    standard warning) (#2206).

    !end-bullet!
-   !begin-bullet!
    Legends now ignore set aesthetics that are not length one (#1932).

    !end-bullet!
-   !begin-bullet!
    All colour and fill scales now have an `aesthetics` argument that
    can be used to set the aesthetic(s) the scale works with. This makes
    it possible to apply a colour scale to both colour and fill
    aesthetics at the same time, via `aesthetics = c("colour", "fill")`
    (@clauswilke).

    !end-bullet!
-   !begin-bullet!
    Three new generic scales work with any aesthetic or set of
    aesthetics: `scale_continuous_identity()`,
    `scale_discrete_identity()`, and `scale_discrete_manual()`
    (@clauswilke).

    !end-bullet!
-   !begin-bullet!
    `scale_*_gradient2()` now consistently omits points outside limits
    by rescaling after the limits are enforced (@foo-bar-baz-qux,
    #2230).

    !end-bullet!

!end-bullets-50!

### Layers

!begin-bullets-51!

-   !begin-bullet!
    `geom_label()` now correctly produces unbordered labels when
    `label.size` is 0, even when saving to PDF (@bfgray3, #2407).

    !end-bullet!
-   !begin-bullet!
    `layer()` gives considerably better error messages for incorrectly
    specified `geom`, `stat`, or `position` (#2401).

    !end-bullet!
-   !begin-bullet!
    In all layers that use it, `linemitre` now defaults to 10 (instead
    of 1) to better match base R.

    !end-bullet!
-   !begin-bullet!
    `geom_boxplot()` now supplies a default value if no `x` aesthetic is
    present (@foo-bar-baz-qux, #2110).

    !end-bullet!
-   !begin-bullet!
    `geom_density()` drops groups with fewer than two data points and
    throws a warning. For groups with two data points, density values
    are now calculated with `stats::density` (@karawoo, #2127).

    !end-bullet!
-   !begin-bullet!
    `geom_segment()` now also takes a `linejoin` parameter. This allows
    more control over the appearance of the segments, which is
    especially useful for plotting thick arrows (@Ax3man, #774).

    !end-bullet!
-   !begin-bullet!
    `geom_smooth()` now reports the formula used when `method = "auto"`
    (@davharris #1951). `geom_smooth()` now orders by the `x` aesthetic,
    making it easier to pass pre-computed values without manual ordering
    (@izahn, #2028). It also now knows it has `ymin` and `ymax`
    aesthetics (#1939). The legend correctly reflects the status of the
    `se` argument when used with stats other than the default
    (@clauswilke, #1546).

    !end-bullet!
-   !begin-bullet!
    `geom_tile()` now once again interprets `width` and `height`
    correctly (1, #2510).

    !end-bullet!
-   !begin-bullet!
    `position_jitter()` and `position_jitterdodge()` gain a `seed`
    argument that allows the specification of a random seed for
    reproducible jittering (@krlmlr, #1996 and @slowkow, #2445).

    !end-bullet!
-   !begin-bullet!
    `stat_density()` has better behaviour if all groups are dropped
    because they are too small (#2282).

    !end-bullet!
-   !begin-bullet!
    `stat_summary_bin()` now understands the `breaks` parameter
    (@karawoo, #2214).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` now accepts functions for `binwidth`. This allows
    better binning when faceting along variables with different ranges
    (@botanize).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` and `geom_histogram()` now sum correctly when using the
    `weight` aesthetic (@jiho, #1921).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` again uses correct scaling for the computed variable
    `ndensity` (@timgoodman, #2324).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` and `stat_bin_2d()` now properly handle the `breaks`
    parameter when the scales are transformed (@has2k1, #2366).

    !end-bullet!
-   !begin-bullet!
    `update_geom_defaults()` and `update_stat_defaults()` allow American
    spelling of aesthetic parameters (@foo-bar-baz-qux, #2299).

    !end-bullet!
-   !begin-bullet!
    The `show.legend` parameter now accepts a named logical vector to
    hide/show only some aesthetics in the legend (@tutuchan, #1798).

    !end-bullet!
-   !begin-bullet!
    Layers now silently ignore unknown aesthetics with value `NULL`
    (#1909).

    !end-bullet!

!end-bullets-51!

### Coords

!begin-bullets-52!

-   !begin-bullet!
    Clipping to the plot panel is now configurable, through a `clip`
    argument to coordinate systems, e.g. `coord_cartesian(clip = "off")`
    (@clauswilke, #2536).

    !end-bullet!
-   !begin-bullet!
    Like scales, coordinate systems now give you a message when you're
    replacing an existing coordinate system (#2264).

    !end-bullet!
-   !begin-bullet!
    `coord_polar()` now draws secondary axis ticks and labels
    (@dylan-stark, #2072), and can draw the radius axis on the right
    (@thomasp85, #2005).

    !end-bullet!
-   !begin-bullet!
    `coord_trans()` now generates a warning when a transformation
    generates non-finite values (@foo-bar-baz-qux, #2147).

    !end-bullet!

!end-bullets-52!

### Themes

!begin-bullets-53!

-   !begin-bullet!
    Complete themes now always override all elements of the default
    theme (@has2k1, #2058, #2079).

    !end-bullet!
-   !begin-bullet!
    Themes now set default grid colour in `panel.grid` rather than
    individually in `panel.grid.major` and `panel.grid.minor`
    individually. This makes it slightly easier to customise the theme
    (#2352).

    !end-bullet!
-   !begin-bullet!
    Fixed bug when setting strips to `element_blank()` (@thomasp85).

    !end-bullet!
-   !begin-bullet!
    Axes positioned on the top and to the right can now customize their
    ticks and lines separately (@thomasp85, #1899).

    !end-bullet!
-   !begin-bullet!
    Built-in themes gain parameters `base_line_size` and
    `base_rect_size` which control the default sizes of line and
    rectangle elements (@karawoo, #2176).

    !end-bullet!
-   !begin-bullet!
    Default themes use `rel()` to set line widths (@baptiste).

    !end-bullet!
-   !begin-bullet!
    Themes were tweaked for visual consistency and more graceful
    behavior when changing the base font size. All absolute heights or
    widths were replaced with heights or widths that are proportional to
    the base font size. One relative font size was eliminated
    (@clauswilke).

    !end-bullet!
-   !begin-bullet!
    The height of descenders is now calculated solely on font metrics
    and doesn't change with the specific letters in the string. This
    fixes minor alignment issues with plot titles, subtitles, and legend
    titles (#2288, @clauswilke).

    !end-bullet!

!end-bullets-53!

### Guides

!begin-bullets-54!

-   !begin-bullet!
    `guide_colorbar()` is more configurable: tick marks and color bar
    frame can now by styled with arguments `ticks.colour`,
    `ticks.linewidth`, `frame.colour`, `frame.linewidth`, and
    `frame.linetype` (@clauswilke).

    !end-bullet!
-   !begin-bullet!
    `guide_colorbar()` now uses `legend.spacing.x` and
    `legend.spacing.y` correctly, and it can handle multi-line titles.
    Minor tweaks were made to `guide_legend()` to make sure the two
    legend functions behave as similarly as possible (@clauswilke, #2397
    and #2398).

    !end-bullet!
-   !begin-bullet!
    The theme elements `legend.title` and `legend.text` now respect the
    settings of `margin`, `hjust`, and `vjust` (@clauswilke, #2465,
    #1502).

    !end-bullet!
-   !begin-bullet!
    Non-angle parameters of `label.theme` or `title.theme` can now be
    set in `guide_legend()` and `guide_colorbar()` (@clauswilke, #2544).

    !end-bullet!

!end-bullets-54!

### Other

!begin-bullets-55!

-   !begin-bullet!
    `fortify()` gains a method for tbls (@karawoo, #2218).

    !end-bullet!
-   !begin-bullet!
    `ggplot` gains a method for `grouped_df`s that adds a `.group`
    variable, which computes a unique value for each group. Use it with
    `aes(group = .group)` (#2351).

    !end-bullet!
-   !begin-bullet!
    `ggproto()` produces objects with class `c("ggproto", "gg")`,
    allowing for a more informative error message when adding layers,
    scales, or other ggproto objects (@jrnold, #2056).

    !end-bullet!
-   !begin-bullet!
    `ggsave()`'s DPI argument now supports 3 string options: "retina"
    (320 DPI), "print" (300 DPI), and "screen" (72 DPI)
    (@foo-bar-baz-qux, #2156). `ggsave()` now uses full argument names
    to avoid partial match warnings (#2355), and correctly restores the
    previous graphics device when several graphics devices are open
    (#2363).

    !end-bullet!
-   !begin-bullet!
    `print.ggplot()` now returns the original ggplot object, instead of
    the output from `ggplot_build()`. Also, the object returned from
    `ggplot_build()` now has the class `"ggplot_built"` (#2034).

    !end-bullet!
-   !begin-bullet!
    `map_data()` now works even when purrr is loaded (tidyverse#66).

    !end-bullet!
-   !begin-bullet!
    New functions `summarise_layout()`, `summarise_coord()`, and
    `summarise_layers()` summarise the layout, coordinate systems, and
    layers of a built ggplot object (#2034, @wch). This provides a
    tested API that (e.g.) shiny can depend on.

    !end-bullet!
-   !begin-bullet!
    Updated startup messages reflect new resources (#2410,
    @mine-cetinkaya-rundel).

    !end-bullet!

!end-bullets-55!

# ggplot2 2.2.1

!begin-bullets-56!

-   !begin-bullet!
    Fix usage of `structure(NULL)` for R-devel compatibility (#1968).
    !end-bullet!

!end-bullets-56!

# ggplot2 2.2.0

## Major new features

### Subtitle and caption

Thanks to @hrbrmstr plots now have subtitles and captions, which can be
set with the `subtitle` and `caption` arguments to `ggtitle()` and
`labs()`. You can control their appearance with the theme settings
`plot.caption` and `plot.subtitle`. The main plot title is now
left-aligned to better work better with a subtitle. The caption is
right-aligned (@hrbrmstr).

### Stacking

`position_stack()` and `position_fill()` now sort the stacking order to
match grouping order. This allows you to control the order through
grouping, and ensures that the default legend matches the plot (#1552,
#1593). If you want the opposite order (useful if you have horizontal
bars and horizontal legend), you can request reverse stacking by using
`position = position_stack(reverse = TRUE)` (#1837).

`position_stack()` and `position_fill()` now accepts negative values
which will create stacks extending below the x-axis (#1691).

`position_stack()` and `position_fill()` gain a `vjust` argument which
makes it easy to (e.g.) display labels in the middle of stacked bars
(#1821).

### Layers

`geom_col()` was added to complement `geom_bar()` (@hrbrmstr). It uses
`stat="identity"` by default, making the `y` aesthetic mandatory. It
does not support any other `stat_()` and does not provide fallback
support for the `binwidth` parameter. Examples and references in other
functions were updated to demonstrate `geom_col()` usage.

When creating a layer, ggplot2 will warn if you use an unknown aesthetic
or an unknown parameter. Compared to the previous version, this is
stricter for aesthetics (previously there was no message), and less
strict for parameters (previously this threw an error) (#1585).

### Facetting

The facet system, as well as the internal panel class, has been
rewritten in ggproto. Facets are now extendable in the same manner as
geoms and stats, as described in `vignette("extending-ggplot2")`.

We have also added the following new features.

!begin-bullets-57!

-   !begin-bullet!
    `facet_grid()` and `facet_wrap()` now allow expressions in their
    faceting formulas (@DanRuderman, #1596).

    !end-bullet!
-   !begin-bullet!
    When `facet_wrap()` results in an uneven number of panels, axes will
    now be drawn underneath the hanging panels (fixes #1607)

    !end-bullet!
-   !begin-bullet!
    Strips can now be freely positioned in `facet_wrap()` using the
    `strip.position` argument (deprecates `switch`).

    !end-bullet!
-   !begin-bullet!
    The relative order of panel, strip, and axis can now be controlled
    with the theme setting `strip.placement` that takes either `inside`
    (strip between panel and axis) or `outside` (strip after axis).

    !end-bullet!
-   !begin-bullet!
    The theme option `panel.margin` has been deprecated in favour of
    `panel.spacing` to more clearly communicate intent.

    !end-bullet!

!end-bullets-57!

### Extensions

Unfortunately there was a major oversight in the construction of ggproto
which lead to extensions capturing the super object at package build
time, instead of at package run time (#1826). This problem has been
fixed, but requires re-installation of all extension packages.

## Scales

!begin-bullets-58!

-   !begin-bullet!
    The position of x and y axes can now be changed using the `position`
    argument in `scale_x_*`and `scale_y_*` which can take `top` and
    `bottom`, and `left` and `right` respectively. The themes of top and
    right axes can be modified using the `.top` and `.right` modifiers
    to `axis.text.*` and `axis.title.*`.
    !end-bullet!

!end-bullets-58!

### Continuous scales

!begin-bullets-59!

-   !begin-bullet!
    `scale_x_continuous()` and `scale_y_continuous()` can now display a
    secondary axis that is a **one-to-one** transformation of the
    primary axis (e.g. degrees Celcius to degrees Fahrenheit). The
    secondary axis will be positioned opposite to the primary axis and
    can be controlled with the `sec.axis` argument to the scale
    constructor.

    !end-bullet!
-   !begin-bullet!
    Scales worry less about having breaks. If no breaks can be computed,
    the plot will work instead of throwing an uninformative error
    (#791). This is particularly helpful when you have facets with free
    scales, and not all panels contain data.

    !end-bullet!
-   !begin-bullet!
    Scales now warn when transformation introduces infinite values
    (#1696).

    !end-bullet!

!end-bullets-59!

### Date time

!begin-bullets-60!

-   !begin-bullet!
    `scale_*_datetime()` now supports time zones. It will use the
    timezone attached to the variable by default, but can be overridden
    with the `timezone` argument.

    !end-bullet!
-   !begin-bullet!
    New `scale_x_time()` and `scale_y_time()` generate reasonable
    default breaks and labels for hms vectors (#1752).

    !end-bullet!

!end-bullets-60!

### Discrete scales

The treatment of missing values by discrete scales has been thoroughly
overhauled (#1584). The underlying principle is that we can naturally
represent missing values on discrete variables (by treating just like
another level), so by default we should.

This principle applies to:

!begin-bullets-61!

-   !begin-bullet!
    character vectors
    !end-bullet!
-   !begin-bullet!
    factors with implicit NA
    !end-bullet!
-   !begin-bullet!
    factors with explicit NA
    !end-bullet!

!end-bullets-61!

And to all scales (both position and non-position.)

Compared to the previous version of ggplot2, there are three main
changes:

1.  `scale_x_discrete()` and `scale_y_discrete()` always show discrete
    NA, regardless of their source

2.  If present, `NA`s are shown in discrete legends.

3.  All discrete scales gain a `na.translate` argument that allows you
    to control whether `NA`s are translated to something that can be
    visualised, or should be left as missing. Note that if you don't
    translate (i.e.  `na.translate = FALSE)` the missing values will
    passed on to the layer, which will warning that it's dropping
    missing values. To suppress the warnings, you'll also need to add
    `na.rm = TRUE` to the layer call.

There were also a number of other smaller changes

!begin-bullets-62!

-   !begin-bullet!
    Correctly use scale expansion factors.
    !end-bullet!
-   !begin-bullet!
    Don't preserve space for dropped levels (#1638).
    !end-bullet!
-   !begin-bullet!
    Only issue one warning when when asking for too many levels (#1674).
    !end-bullet!
-   !begin-bullet!
    Unicode labels work better on Windows (#1827).
    !end-bullet!
-   !begin-bullet!
    Warn when used with only continuous data (#1589)
    !end-bullet!

!end-bullets-62!

## Themes

!begin-bullets-63!

-   !begin-bullet!
    The `theme()` constructor now has named arguments rather than
    ellipses. This should make autocomplete substantially more useful.
    The documentation (including examples) has been considerably
    improved.

    !end-bullet!
-   !begin-bullet!
    Built-in themes are more visually homogeneous, and match
    `theme_grey` better. (@jiho, #1679)

    !end-bullet!
-   !begin-bullet!
    When computing the height of titles, ggplot2 now includes the height
    of the descenders (i.e. the bits of `g` and `y` that hang beneath
    the baseline). This improves the margins around titles, particularly
    the y axis label (#1712). I have also very slightly increased the
    inner margins of axis titles, and removed the outer margins.

    !end-bullet!
-   !begin-bullet!
    Theme element inheritance is now easier to work with as modification
    now overrides default `element_blank` elements (#1555, #1557, #1565,
    #1567)

    !end-bullet!
-   !begin-bullet!
    Horizontal legends (i.e. legends on the top or bottom) are
    horizontally aligned by default (#1842). Use
    `legend.box = "vertical"` to switch back to the previous behaviour.

    !end-bullet!
-   !begin-bullet!
    `element_line()` now takes an `arrow` argument to specify arrows at
    the end of lines (#1740)

    !end-bullet!

!end-bullets-63!

There were a number of tweaks to the theme elements that control
legends:

!begin-bullets-64!

-   !begin-bullet!
    `legend.justification` now controls appearance will plotting the
    legend outside of the plot area. For example, you can use
    `theme(legend.justification = "top")` to make the legend align with
    the top of the plot.

    !end-bullet!
-   !begin-bullet!
    `panel.margin` and `legend.margin` have been renamed to
    `panel.spacing` and `legend.spacing` respectively, to better
    communicate intent (they only affect spacing between legends and
    panels, not the margins around them)

    !end-bullet!
-   !begin-bullet!
    `legend.margin` now controls margin around individual legends.

    !end-bullet!
-   !begin-bullet!
    New `legend.box.background`, `legend.box.spacing`, and
    `legend.box.margin` control the background, spacing, and margin of
    the legend box (the region that contains all legends).

    !end-bullet!

!end-bullets-64!

## Bug fixes and minor improvements

!begin-bullets-65!

-   !begin-bullet!
    ggplot2 now imports tibble. This ensures that all built-in datasets
    print compactly even if you haven't explicitly loaded tibble or
    dplyr (#1677).

    !end-bullet!
-   !begin-bullet!
    Class of aesthetic mapping is preserved when adding `aes()` objects
    (#1624).

    !end-bullet!
-   !begin-bullet!
    `+.gg` now works for lists that include data frames.

    !end-bullet!
-   !begin-bullet!
    `annotation_x()` now works in the absense of global data (#1655)

    !end-bullet!
-   !begin-bullet!
    `geom_*(show.legend = FALSE)` now works for `guide_colorbar`.

    !end-bullet!
-   !begin-bullet!
    `geom_boxplot()` gains new `outlier.alpha` (@jonathan-g) and
    `outlier.fill` (@schloerke, #1787) parameters to control the
    alpha/fill of outlier points independently of the alpha of the
    boxes.

    !end-bullet!
-   !begin-bullet!
    `position_jitter()` (and hence `geom_jitter()`) now correctly
    computes the jitter width/jitter when supplied by the user (#1775,
    @has2k1).

    !end-bullet!
-   !begin-bullet!
    `geom_contour()` more clearly describes what inputs it needs
    (#1577).

    !end-bullet!
-   !begin-bullet!
    `geom_curve()` respects the `lineend` parameter (#1852).

    !end-bullet!
-   !begin-bullet!
    `geom_histogram()` and `stat_bin()` understand the `breaks`
    parameter once more. (#1665). The floating point adjustment for
    histogram bins is now actually used - it was previously
    inadvertently ignored (#1651).

    !end-bullet!
-   !begin-bullet!
    `geom_violin()` no longer transforms quantile lines with the alpha
    aesthetic (@mnbram, #1714). It no longer errors when quantiles are
    requested but data have zero range (#1687). When `trim = FALSE` it
    once again has a nice range that allows the density to reach zero
    (by extending the range 3 bandwidths to either side of the data)
    (#1700).

    !end-bullet!
-   !begin-bullet!
    `geom_dotplot()` works better when faceting and binning on the
    y-axis. (#1618, @has2k1).

    !end-bullet!
-   !begin-bullet!
    `geom_hexbin()` once again supports `..density..` (@mikebirdgeneau,
    #1688).

    !end-bullet!
-   !begin-bullet!
    `geom_step()` gives useful warning if only one data point in layer
    (#1645).

    !end-bullet!
-   !begin-bullet!
    `layer()` gains new `check.aes` and `check.param` arguments. These
    allow geom/stat authors to optional suppress checks for known
    aesthetics/parameters. Currently this is used only in `geom_blank()`
    which powers `expand_limits()` (#1795).

    !end-bullet!
-   !begin-bullet!
    All `stat_*()` display a better error message when required
    aesthetics are missing.

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` and `stat_summary_hex()` now accept length 1 `binwidth`
    (#1610)

    !end-bullet!
-   !begin-bullet!
    `stat_density()` gains new argument `n`, which is passed to
    underlying function `stats::density` ("number of equally spaced
    points at which the density is to be estimated"). (@hbuschme)

    !end-bullet!
-   !begin-bullet!
    `stat_binhex()` now again returns `count` rather than `value`
    (#1747)

    !end-bullet!
-   !begin-bullet!
    `stat_ecdf()` respects `pad` argument (#1646).

    !end-bullet!
-   !begin-bullet!
    `stat_smooth()` once again informs you about the method it has
    chosen. It also correctly calculates the size of the largest group
    within facets.

    !end-bullet!
-   !begin-bullet!
    `x` and `y` scales are now symmetric regarding the list of
    aesthetics they accept: `xmin_final`, `xmax_final`, `xlower`,
    `xmiddle` and `xupper` are now valid `x` aesthetics.

    !end-bullet!
-   !begin-bullet!
    `Scale` extensions can now override the `make_title` and
    `make_sec_title` methods to let the scale modify the axis/legend
    titles.

    !end-bullet!
-   !begin-bullet!
    The random stream is now reset after calling `.onAttach()` (#2409).

    !end-bullet!

!end-bullets-65!

# ggplot2 2.1.0

## New features

!begin-bullets-66!

-   !begin-bullet!
    When mapping an aesthetic to a constant (e.g. 
    `geom_smooth(aes(colour = "loess")))`), the default guide title is
    the name of the aesthetic (i.e. "colour"), not the value
    (i.e. "loess") (#1431).

    !end-bullet!
-   !begin-bullet!
    `layer()` now accepts a function as the data argument. The function
    will be applied to the data passed to the `ggplot()` function and
    must return a data.frame (#1527, @thomasp85). This is a more general
    version of the deprecated `subset` argument.

    !end-bullet!
-   !begin-bullet!
    `theme_update()` now uses the `+` operator instead of `%+replace%`,
    so that unspecified values will no longer be `NULL`ed out.
    `theme_replace()` preserves the old behaviour if desired
    (@oneillkza, #1519).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` has been overhauled to use the same algorithm as ggvis,
    which has been considerably improved thanks to the advice of Randy
    Prium (@rpruim). This includes:

    !begin-bullets-67!
    -   !begin-bullet!
        Better arguments and a better algorithm for determining the
        origin. You can now specify either `boundary` or the `center` of
        a bin. `origin` has been deprecated in favour of these
        arguments.

        !end-bullet!
    -   !begin-bullet!
        `drop` is deprecated in favour of `pad`, which adds extra
        0-count bins at either end (needed for frequency polygons).
        `geom_histogram()` defaults to `pad = FALSE` which considerably
        improves the default limits for the histogram, especially when
        the bins are big (#1477).

        !end-bullet!
    -   !begin-bullet!
        The default algorithm does a (somewhat) better job at picking
        nice widths and origins across a wider range of input data.

        !end-bullet!
    -   !begin-bullet!
        `bins = n` now gives a histogram with `n` bins, not `n + 1`
        (#1487).

        !end-bullet!

    !end-bullets-67!
    !end-bullet!

!end-bullets-66!

## Bug fixes

!begin-bullets-68!

-   !begin-bullet!
    All `\donttest{}` examples run.

    !end-bullet!
-   !begin-bullet!
    All `geom_()` and `stat_()` functions now have consistent argument
    order: data + mapping, then geom/stat/position, then `...`, then
    specific arguments, then arguments common to all layers (#1305).
    This may break code if you were previously relying on partial name
    matching, but in the long-term should make ggplot2 easier to use. In
    particular, you can now set the `n` parameter in `geom_density2d()`
    without it partially matching `na.rm` (#1485).

    !end-bullet!
-   !begin-bullet!
    For geoms with both `colour` and `fill`, `alpha` once again only
    affects fill (Reverts #1371, #1523). This was causing problems for
    people.

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()`/`facet_grid()` works with multiple empty panels of
    data (#1445).

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()` correctly swaps `nrow` and `ncol` when faceting
    vertically (#1417).

    !end-bullet!
-   !begin-bullet!
    `ggsave("x.svg")` now uses svglite to produce the svg (#1432).

    !end-bullet!
-   !begin-bullet!
    `geom_boxplot()` now understands `outlier.color` (#1455).

    !end-bullet!
-   !begin-bullet!
    `geom_path()` knows that "solid" (not just 1) represents a solid
    line (#1534).

    !end-bullet!
-   !begin-bullet!
    `geom_ribbon()` preserves missing values so they correctly generate
    a gap in the ribbon (#1549).

    !end-bullet!
-   !begin-bullet!
    `geom_tile()` once again accepts `width` and `height` parameters
    (#1513). It uses `draw_key_polygon()` for better a legend, including
    a coloured outline (#1484).

    !end-bullet!
-   !begin-bullet!
    `layer()` now automatically adds a `na.rm` parameter if none is
    explicitly supplied.

    !end-bullet!
-   !begin-bullet!
    `position_jitterdodge()` now works on all possible dodge aesthetics,
    e.g. `color`, `linetype` etc. instead of only based on `fill`
    (@bleutner)

    !end-bullet!
-   !begin-bullet!
    `position = "nudge"` now works (although it doesn't do anything
    useful) (#1428).

    !end-bullet!
-   !begin-bullet!
    The default scale for columns of class "AsIs" is now "identity"
    (#1518).

    !end-bullet!
-   !begin-bullet!
    `scale_*_discrete()` has better defaults when used with purely
    continuous data (#1542).

    !end-bullet!
-   !begin-bullet!
    `scale_size()` warns when used with categorical data.

    !end-bullet!
-   !begin-bullet!
    `scale_size()`, `scale_colour()`, and `scale_fill()` gain date and
    date-time variants (#1526).

    !end-bullet!
-   !begin-bullet!
    `stat_bin_hex()` and `stat_bin_summary()` now use the same
    underlying algorithm so results are consistent (#1383).
    `stat_bin_hex()` now accepts a `weight` aesthetic. To be consistent
    with related stats, the output variable from `stat_bin_hex()` is now
    value instead of count.

    !end-bullet!
-   !begin-bullet!
    `stat_density()` gains a `bw` parameter which makes it easy to get
    consistent smoothing between facets (@jiho)

    !end-bullet!
-   !begin-bullet!
    `stat-density-2d()` no longer ignores the `h` parameter, and now
    accepts `bins` and `binwidth` parameters to control the number of
    contours (#1448, @has2k1).

    !end-bullet!
-   !begin-bullet!
    `stat_ecdf()` does a better job of adding padding to -Inf/Inf, and
    gains an argument `pad` to suppress the padding if not needed
    (#1467).

    !end-bullet!
-   !begin-bullet!
    `stat_function()` gains an `xlim` parameter (#1528). It once again
    works with discrete x values (#1509).

    !end-bullet!
-   !begin-bullet!
    `stat_summary()` preserves sorted x order which avoids artefacts
    when display results with `geom_smooth()` (#1520).

    !end-bullet!
-   !begin-bullet!
    All elements should now inherit correctly for all themes except
    `theme_void()`. (@Katiedaisey, #1555)

    !end-bullet!
-   !begin-bullet!
    `theme_void()` was completely void of text but facets and legends
    still need labels. They are now visible (@jiho).

    !end-bullet!
-   !begin-bullet!
    You can once again set legend key and height width to unit
    arithmetic objects (like `2 * unit(1, "cm")`) (#1437).

    !end-bullet!
-   !begin-bullet!
    Eliminate spurious warning if you have a layer with no data and no
    aesthetics (#1451).

    !end-bullet!
-   !begin-bullet!
    Removed a superfluous comma in `theme-defaults.r` code (@jschoeley)

    !end-bullet!
-   !begin-bullet!
    Fixed a compatibility issue with `ggproto` and R versions prior to
    3.1.2. (#1444)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `coord_map()` fails when given an explicit
    `parameters` argument (@tdmcarthur, #1729)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `geom_errorbarh()` had a required `x` aesthetic
    (#1933)

    !end-bullet!

!end-bullets-68!

# ggplot2 2.0.0

## Major changes

!begin-bullets-69!

-   !begin-bullet!
    ggplot no longer throws an error if your plot has no layers. Instead
    it automatically adds `geom_blank()` (#1246).

    !end-bullet!
-   !begin-bullet!
    New `cut_width()` is a convenient replacement for the verbose
    `plyr::round_any()`, with the additional benefit of offering finer
    control.

    !end-bullet!
-   !begin-bullet!
    New `geom_count()` is a convenient alias to `stat_sum()`. Use it
    when you have overlapping points on a scatterplot. `stat_sum()` now
    defaults to using counts instead of proportions.

    !end-bullet!
-   !begin-bullet!
    New `geom_curve()` adds curved lines, with a similar specification
    to `geom_segment()` (@veraanadi, #1088).

    !end-bullet!
-   !begin-bullet!
    Date and datetime scales now have `date_breaks`, `date_minor_breaks`
    and `date_labels` arguments so that you never need to use the long
    `scales::date_breaks()` or `scales::date_format()`.

    !end-bullet!
-   !begin-bullet!
    `geom_bar()` now has it's own stat, distinct from `stat_bin()` which
    was also used by `geom_histogram()`. `geom_bar()` now uses
    `stat_count()` which counts values at each distinct value of x
    (i.e. it does not bin the data first). This can be useful when you
    want to show exactly which values are used in a continuous variable.

    !end-bullet!
-   !begin-bullet!
    `geom_point()` gains a `stroke` aesthetic which controls the border
    width of shapes 21-25 (#1133, @SeySayux). `size` and `stroke` are
    additive so a point with `size = 5` and `stroke = 5` will have a
    diameter of 10mm. (#1142)

    !end-bullet!
-   !begin-bullet!
    New `position_nudge()` allows you to slightly offset labels (or
    other geoms) from their corresponding points (#1109).

    !end-bullet!
-   !begin-bullet!
    `scale_size()` now maps values to *area*, not radius. Use
    `scale_radius()` if you want the old behaviour (not recommended,
    except perhaps for lines).

    !end-bullet!
-   !begin-bullet!
    New `stat_summary_bin()` works like `stat_summary()` but on binned
    data. It's a generalisation of `stat_bin()` that can compute any
    aggregate, not just counts (#1274). Both default to `mean_se()` if
    no aggregation functions are supplied (#1386).

    !end-bullet!
-   !begin-bullet!
    Layers are now much stricter about their arguments - you will get an
    error if you've supplied an argument that isn't an aesthetic or a
    parameter. This is likely to cause some short-term pain but in the
    long-term it will make it much easier to spot spelling mistakes and
    other errors (#1293).

    This change does break a handful of geoms/stats that used `...` to
    pass additional arguments on to the underlying computation. Now
    `geom_smooth()`/`stat_smooth()` and
    `geom_quantile()`/`stat_quantile()` use `method.args` instead
    (#1245, #1289); and `stat_summary()` (#1242), `stat_summary_hex()`,
    and `stat_summary2d()` use `fun.args`.

    !end-bullet!

!end-bullets-69!

### Extensibility

There is now an official mechanism for defining Stats, Geoms, and
Positions in other packages. See `vignette("extending-ggplot2")` for
details.

!begin-bullets-70!

-   !begin-bullet!
    All Geoms, Stats and Positions are now exported, so you can inherit
    from them when making your own objects (#989).

    !end-bullet!
-   !begin-bullet!
    ggplot2 no longer uses proto or reference classes. Instead, we now
    use ggproto, a new OO system designed specifically for ggplot2.
    Unlike proto and RC, ggproto supports clean cross-package
    inheritance. Creating a new OO system isn't usually the right way to
    solve a problem, but I'm pretty sure it was necessary here. Read
    more about it in the vignette.

    !end-bullet!
-   !begin-bullet!
    `aes_()` replaces `aes_q()`. It also supports formulas, so the most
    concise SE version of `aes(carat, price)` is now
    `aes_(~carat, ~price)`. You may want to use this form in packages,
    as it will avoid spurious `R CMD check` warnings about undefined
    global variables.

    !end-bullet!

!end-bullets-70!

### Text

!begin-bullets-71!

-   !begin-bullet!
    `geom_text()` has been overhauled to make labelling your data a
    little easier. It:

    !begin-bullets-72!
    -   !begin-bullet!
        `nudge_x` and `nudge_y` arguments let you offset labels from
        their corresponding points (#1120).

        !end-bullet!
    -   !begin-bullet!
        `check_overlap = TRUE` provides a simple way to avoid
        overplotting of labels: labels that would otherwise overlap are
        omitted (#1039).

        !end-bullet!
    -   !begin-bullet!
        `hjust` and `vjust` can now be character vectors: "left",
        "center", "right", "bottom", "middle", "top". New options
        include "inward" and "outward" which align text towards and away
        from the center of the plot respectively.

        !end-bullet!

    !end-bullets-72!
    !end-bullet!
-   !begin-bullet!
    `geom_label()` works like `geom_text()` but draws a rounded
    rectangle underneath each label (#1039). This is useful when you
    want to label plots that are dense with data.

    !end-bullet!

!end-bullets-71!

### Deprecated features

!begin-bullets-73!

-   !begin-bullet!
    The little used `aes_auto()` has been deprecated.

    !end-bullet!
-   !begin-bullet!
    `aes_q()` has been replaced with `aes_()` to be consistent with SE
    versions of NSE functions in other packages.

    !end-bullet!
-   !begin-bullet!
    The `order` aesthetic is officially deprecated. It never really
    worked, and was poorly documented.

    !end-bullet!
-   !begin-bullet!
    The `stat` and `position` arguments to `qplot()` have been
    deprecated. `qplot()` is designed for quick plots - if you need to
    specify position or stat, use `ggplot()` instead.

    !end-bullet!
-   !begin-bullet!
    The theme setting `axis.ticks.margin` has been deprecated: now use
    the margin property of `axis.text`.

    !end-bullet!
-   !begin-bullet!
    `stat_abline()`, `stat_hline()` and `stat_vline()` have been
    removed: these were never suitable for use other than with
    `geom_abline()` etc and were not documented.

    !end-bullet!
-   !begin-bullet!
    `show_guide` has been renamed to `show.legend`: this more accurately
    reflects what it does (controls appearance of layer in legend), and
    uses the same convention as other ggplot2 arguments (i.e. a `.`
    between names). (Yes, I know that's inconsistent with function names
    with use `_`, but it's too late to change now.)

    !end-bullet!

!end-bullets-73!

A number of geoms have been renamed to be internally consistent:

!begin-bullets-74!

-   !begin-bullet!
    `stat_binhex()` and `stat_bin2d()` have been renamed to
    `stat_bin_hex()` and `stat_bin_2d()` (#1274). `stat_summary2d()` has
    been renamed to `stat_summary_2d()`,
    `geom_density2d()`/`stat_density2d()` has been renamed to
    `geom_density_2d()`/`stat_density_2d()`.

    !end-bullet!
-   !begin-bullet!
    `stat_spoke()` is now `geom_spoke()` since I realised it's a
    reparameterisation of `geom_segment()`.

    !end-bullet!
-   !begin-bullet!
    `stat_bindot()` has been removed because it's so tightly coupled to
    `geom_dotplot()`. If you happened to use `stat_bindot()`, just
    change to `geom_dotplot()` (#1194).

    !end-bullet!

!end-bullets-74!

All defunct functions have been removed.

### Default appearance

!begin-bullets-75!

-   !begin-bullet!
    The default `theme_grey()` background colour has been changed from
    "grey90" to "grey92": this makes the background a little less
    visually prominent.

    !end-bullet!
-   !begin-bullet!
    Labels and titles have been tweaked for readability:

    !begin-bullets-76!
    -   !begin-bullet!
        Axes labels are darker.

        !end-bullet!
    -   !begin-bullet!
        Legend and axis titles are given the same visual treatment.

        !end-bullet!
    -   !begin-bullet!
        The default font size dropped from 12 to 11. You might be
        surprised that I've made the default text size smaller as it was
        already hard for many people to read. It turns out there was a
        bug in RStudio (fixed in 0.99.724), that shrunk the text of all
        grid based graphics. Once that was resolved the defaults seemed
        too big to my eyes.

        !end-bullet!
    -   !begin-bullet!
        More spacing between titles and borders.

        !end-bullet!
    -   !begin-bullet!
        Default margins scale with the theme font size, so the
        appearance at larger font sizes should be considerably improved
        (#1228).

        !end-bullet!

    !end-bullets-76!
    !end-bullet!
-   !begin-bullet!
    `alpha` now affects both fill and colour aesthetics (#1371).

    !end-bullet!
-   !begin-bullet!
    `element_text()` gains a margins argument which allows you to add
    additional padding around text elements. To help see what's going on
    use `debug = TRUE` to display the text region and anchors.

    !end-bullet!
-   !begin-bullet!
    The default font size in `geom_text()` has been decreased from 5mm
    (14 pts) to 3.8 mm (11 pts) to match the new default theme sizes.

    !end-bullet!
-   !begin-bullet!
    A diagonal line is no longer drawn on bar and rectangle legends.
    Instead, the border has been tweaked to be more visible, and more
    closely match the size of line drawn on the plot.

    !end-bullet!
-   !begin-bullet!
    `geom_pointrange()` and `geom_linerange()` get vertical (not
    horizontal) lines in the legend (#1389).

    !end-bullet!
-   !begin-bullet!
    The default line `size` for `geom_smooth()` has been increased from
    0.5 to 1 to make it easier to see when overlaid on data.

    !end-bullet!
-   !begin-bullet!
    `geom_bar()` and `geom_rect()` use a slightly paler shade of grey so
    they aren't so visually heavy.

    !end-bullet!
-   !begin-bullet!
    `geom_boxplot()` now colours outliers the same way as the boxes.

    !end-bullet!
-   !begin-bullet!
    `geom_point()` now uses shape 19 instead of 16. This looks much
    better on the default Linux graphics device. (It's very slightly
    smaller than the old point, but it shouldn't affect any graphics
    significantly)

    !end-bullet!
-   !begin-bullet!
    Sizes in ggplot2 are measured in mm. Previously they were converted
    to pts (for use in grid) by multiplying by 72 / 25.4. However, grid
    uses printer's points, not Adobe (big pts), so sizes are now
    correctly multiplied by 72.27 / 25.4. This is unlikely to noticeably
    affect display, but it's technically correct
    (https://youtu.be/hou0lU8WMgo).

    !end-bullet!
-   !begin-bullet!
    The default legend will now allocate multiple rows (if vertical) or
    columns (if horizontal) in order to make a legend that is more
    likely to fit on the screen. You can override with the `nrow`/`ncol`
    arguments to `guide_legend()`

    !begin-codeblock!
    ``` r
    p <- ggplot(mpg, aes(displ,hwy, colour = model)) + geom_point()
    p
    p + theme(legend.position = "bottom")
    # Previous behaviour
    p + guides(colour = guide_legend(ncol = 1))
    ```

    !end-codeblock!
    !end-bullet!

!end-bullets-75!

### New and updated themes

!begin-bullets-77!

-   !begin-bullet!
    New `theme_void()` is completely empty. It's useful for plots with
    non- standard coordinates or for drawings (@jiho, #976).

    !end-bullet!
-   !begin-bullet!
    New `theme_dark()` has a dark background designed to make colours
    pop out (@jiho, #1018)

    !end-bullet!
-   !begin-bullet!
    `theme_minimal()` became slightly more minimal by removing the axis
    ticks: labels now line up directly beneath grid lines (@tomschloss,
    #1084)

    !end-bullet!
-   !begin-bullet!
    New theme setting `panel.ontop` (logical) make it possible to place
    background elements (i.e., gridlines) on top of data. Best used with
    transparent `panel.background` (@noamross. #551).

    !end-bullet!

!end-bullets-77!

### Labelling

The facet labelling system was updated with many new features and a more
flexible interface (@lionel-). It now works consistently across grid and
wrap facets. The most important user visible changes are:

!begin-bullets-78!

-   !begin-bullet!
    `facet_wrap()` gains a `labeller` option (#25).

    !end-bullet!
-   !begin-bullet!
    `facet_grid()` and `facet_wrap()` gain a `switch` argument to
    display the facet titles near the axes. When switched, the labels
    become axes subtitles. `switch` can be set to "x", "y" or "both"
    (the latter only for grids) to control which margin is switched.

    !end-bullet!

!end-bullets-78!

The labellers (such as `label_value()` or `label_both()`) also get some
new features:

!begin-bullets-79!

-   !begin-bullet!
    They now offer the `multi_line` argument to control whether to
    display composite facets (those specified as `~var1 + var2`) on one
    or multiple lines.

    !end-bullet!
-   !begin-bullet!
    In `label_bquote()` you now refer directly to the names of
    variables. With this change, you can create math expressions that
    depend on more than one variable. This math expression can be
    specified either for the rows or the columns and you can also
    provide different expressions to each margin.

    As a consequence of these changes, referring to `x` in backquoted
    expressions is deprecated.

    !end-bullet!
-   !begin-bullet!
    Similarly to `label_bquote()`, `labeller()` now take `.rows` and
    `.cols` arguments. In addition, it also takes `.default`.
    `labeller()` is useful to customise how particular variables are
    labelled. The three additional arguments specify how to label the
    variables are not specifically mentioned, respectively for rows,
    columns or both. This makes it especially easy to set up a
    project-wide labeller dispatcher that can be reused across all your
    plots. See the documentation for an example.

    !end-bullet!
-   !begin-bullet!
    The new labeller `label_context()` adapts to the number of factors
    facetted over. With a single factor, it displays only the values,
    just as before. But with multiple factors in a composite margin
    (e.g. with `~cyl + am`), the labels are passed over to
    `label_both()`. This way the variables names are displayed with the
    values to help identifying them.

    !end-bullet!

!end-bullets-79!

On the programming side, the labeller API has been rewritten in order to
offer more control when faceting over multiple factors (e.g. with
formulae such as `~cyl + am`). This also means that if you have written
custom labellers, you will need to update them for this version of
ggplot.

!begin-bullets-80!

-   !begin-bullet!
    Previously, a labeller function would take `variable` and `value`
    arguments and return a character vector. Now, they take a data frame
    of character vectors and return a list. The input data frame has one
    column per factor facetted over and each column in the returned list
    becomes one line in the strip label. See documentation for more
    details.

    !end-bullet!
-   !begin-bullet!
    The labels received by a labeller now contain metadata: their margin
    (in the "type" attribute) and whether they come from a wrap or a
    grid facet (in the "facet" attribute).

    !end-bullet!
-   !begin-bullet!
    Note that the new `as_labeller()` function operator provides an easy
    way to transform an existing function to a labeller function. The
    existing function just needs to take and return a character vector.

    !end-bullet!

!end-bullets-80!

## Documentation

!begin-bullets-81!

-   !begin-bullet!
    Improved documentation for `aes()`, `layer()` and much much more.

    !end-bullet!
-   !begin-bullet!
    I've tried to reduce the use of `...` so that you can see all the
    documentation in one place rather than having to integrate multiple
    pages. In some cases this has involved adding additional arguments
    to geoms to make it more clear what you can do:

    !begin-bullets-82!
    -   !begin-bullet!
        `geom_smooth()` gains explicit `method`, `se` and `formula`
        arguments.

        !end-bullet!
    -   !begin-bullet!
        `geom_histogram()` gains `binwidth`, `bins`, `origin` and
        `right` arguments.

        !end-bullet!
    -   !begin-bullet!
        `geom_jitter()` gains `width` and `height` arguments to make it
        easier to control the amount of jittering without using the
        lengthy `position_jitter()` function (#1116)

        !end-bullet!

    !end-bullets-82!
    !end-bullet!
-   !begin-bullet!
    Use of `qplot()` in examples has been minimised (#1123, @hrbrmstr).
    This is inline with the 2nd edition of the ggplot2 box, which
    minimises the use of `qplot()` in favour of `ggplot()`.

    !end-bullet!
-   !begin-bullet!
    Tightly linked geoms and stats (e.g. `geom_boxplot()` and
    `stat_boxplot()`) are now documented in the same file so you can see
    all the arguments in one place. Variations of the same idea
    (e.g. `geom_path()`, `geom_line()`, and `geom_step()`) are also
    documented together.

    !end-bullet!
-   !begin-bullet!
    It's now obvious that you can set the `binwidth` parameter for
    `stat_bin_hex()`, `stat_summary_hex()`, `stat_bin_2d()`, and
    `stat_summary_2d()`.

    !end-bullet!
-   !begin-bullet!
    The internals of positions have been cleaned up considerably. You're
    unlikely to notice any external changes, although the documentation
    should be a little less confusing since positions now don't list
    parameters they never use.

    !end-bullet!

!end-bullets-81!

## Data

!begin-bullets-83!

-   !begin-bullet!
    All datasets have class `tbl_df` so if you also use dplyr, you get a
    better print method.

    !end-bullet!
-   !begin-bullet!
    `economics` has been brought up to date to 2015-04-01.

    !end-bullet!
-   !begin-bullet!
    New `economics_long` is the economics data in long form.

    !end-bullet!
-   !begin-bullet!
    New `txhousing` dataset containing information about the Texas
    housing market. Useful for examples that need multiple time series,
    and for demonstrating model+vis methods.

    !end-bullet!
-   !begin-bullet!
    New `luv_colours` dataset which contains the locations of all
    built-in `colors()` in Luv space.

    !end-bullet!
-   !begin-bullet!
    `movies` has been moved into its own package, ggplot2movies, because
    it was large and not terribly useful. If you've used the movies
    dataset, you'll now need to explicitly load the package with
    `library(ggplot2movies)`.

    !end-bullet!

!end-bullets-83!

## Bug fixes and minor improvements

!begin-bullets-84!

-   !begin-bullet!
    All partially matched arguments and `$` have been been replaced with
    full matches (@jimhester, #1134).

    !end-bullet!
-   !begin-bullet!
    ggplot2 now exports `alpha()` from the scales package (#1107), and
    `arrow()` and `unit()` from grid (#1225). This means you don't need
    attach scales/grid or do `scales::`/`grid::` for these commonly used
    functions.

    !end-bullet!
-   !begin-bullet!
    `aes_string()` now only parses character inputs. This fixes bugs
    when using it with numbers and non default `OutDec` settings
    (#1045).

    !end-bullet!
-   !begin-bullet!
    `annotation_custom()` automatically adds a unique id to each grob
    name, making it easier to plot multiple grobs with the same name
    (e.g. grobs of ggplot2 graphics) in the same plot (#1256).

    !end-bullet!
-   !begin-bullet!
    `borders()` now accepts xlim and ylim arguments for specifying the
    geographical region of interest (@markpayneatwork, #1392).

    !end-bullet!
-   !begin-bullet!
    `coord_cartesian()` applies the same expansion factor to limits as
    for scales. You can suppress with `expand = FALSE` (#1207).

    !end-bullet!
-   !begin-bullet!
    `coord_trans()` now works when breaks are suppressed (#1422).

    !end-bullet!
-   !begin-bullet!
    `cut_number()` gives error message if the number of requested bins
    can be created because there are two few unique values (#1046).

    !end-bullet!
-   !begin-bullet!
    Character labels in `facet_grid()` are no longer (incorrectly)
    coerced into factors. This caused problems with custom label
    functions (#1070).

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()` and `facet_grid()` now allow you to use non-standard
    variable names by surrounding them with backticks (#1067).

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()` more carefully checks its `nrow` and `ncol` arguments
    to ensure that they're specified correctly (@richierocks, #962)

    !end-bullet!
-   !begin-bullet!
    `facet_wrap()` gains a `dir` argument to control the direction the
    panels are wrapped in. The default is "h" for horizontal. Use "v"
    for vertical layout (#1260).

    !end-bullet!
-   !begin-bullet!
    `geom_abline()`, `geom_hline()` and `geom_vline()` have been
    rewritten to have simpler behaviour and be more consistent:

    !begin-bullets-85!
    -   !begin-bullet!
        `stat_abline()`, `stat_hline()` and `stat_vline()` have been
        removed: these were never suitable for use other than with
        `geom_abline()` etc and were not documented.

        !end-bullet!
    -   !begin-bullet!
        `geom_abline()`, `geom_vline()` and `geom_hline()` are bound to
        `stat_identity()` and `position_identity()`

        !end-bullet!
    -   !begin-bullet!
        Intercept parameters can no longer be set to a function.

        !end-bullet!
    -   !begin-bullet!
        They are all documented in one file, since they are so closely
        related.

        !end-bullet!

    !end-bullets-85!
    !end-bullet!
-   !begin-bullet!
    `geom_bin2d()` will now let you specify one dimension's breaks
    exactly, without touching the other dimension's default breaks at
    all (#1126).

    !end-bullet!
-   !begin-bullet!
    `geom_crossbar()` sets grouping correctly so you can display
    multiple crossbars on one plot. It also makes the default `fatten`
    argument a little bigger to make the middle line more obvious
    (#1125).

    !end-bullet!
-   !begin-bullet!
    `geom_histogram()` and `geom_smooth()` now only inform you about the
    default values once per layer, rather than once per panel (#1220).

    !end-bullet!
-   !begin-bullet!
    `geom_pointrange()` gains `fatten` argument so you can control the
    size of the point relative to the size of the line.

    !end-bullet!
-   !begin-bullet!
    `geom_segment()` annotations were not transforming with scales
    (@BrianDiggs, #859).

    !end-bullet!
-   !begin-bullet!
    `geom_smooth()` is no longer so chatty. If you want to know what the
    default smoothing method is, look it up in the documentation!
    (#1247)

    !end-bullet!
-   !begin-bullet!
    `geom_violin()` now has the ability to draw quantile lines
    (@DanRuderman).

    !end-bullet!
-   !begin-bullet!
    `ggplot()` now captures the parent frame to use for evaluation,
    rather than always defaulting to the global environment. This should
    make ggplot more suitable to use in more situations (e.g. with
    knitr)

    !end-bullet!
-   !begin-bullet!
    `ggsave()` has been simplified a little to make it easier to
    maintain. It no longer checks that you're printing a ggplot2 object
    (so now also works with any grid grob) (#970), and always requires a
    filename. Parameter `device` now supports character argument to
    specify which supported device to use ('pdf', 'png', 'jpeg', etc.),
    for when it cannot be correctly inferred from the file extension
    (for example when a temporary filename is supplied server side in
    shiny apps) (@sebkopf, #939). It no longer opens a graphics device
    if one isn't already open - this is annoying when you're running
    from a script (#1326).

    !end-bullet!
-   !begin-bullet!
    `guide_colorbar()` creates correct legend if only one color
    (@krlmlr, #943).

    !end-bullet!
-   !begin-bullet!
    `guide_colorbar()` no longer fails when the legend is empty -
    previously this often masked misspecifications elsewhere in the plot
    (#967).

    !end-bullet!
-   !begin-bullet!
    New `layer_data()` function extracts the data used for plotting for
    a given layer. It's mostly useful for testing.

    !end-bullet!
-   !begin-bullet!
    User supplied `minor_breaks` can now be supplied on the same scale
    as the data, and will be automatically transformed with by scale
    (#1385).

    !end-bullet!
-   !begin-bullet!
    You can now suppress the appearance of an axis/legend title (and the
    space that would allocated for it) with `NULL` in the `scale_`
    function. To use the default label, use `waiver()` (#1145).

    !end-bullet!
-   !begin-bullet!
    Position adjustments no longer warn about potentially varying ranges
    because the problem rarely occurs in practice and there are
    currently a lot of false positives since I don't understand exactly
    what FP criteria I should be testing.

    !end-bullet!
-   !begin-bullet!
    `scale_fill_grey()` now uses red for missing values. This matches
    `scale_colour_grey()` and makes it obvious where missing values lie.
    Override with `na.value`.

    !end-bullet!
-   !begin-bullet!
    `scale_*_gradient2()` defaults to using Lab colour space.

    !end-bullet!
-   !begin-bullet!
    `scale_*_gradientn()` now allows `colours` or `colors` (#1290)

    !end-bullet!
-   !begin-bullet!
    `scale_y_continuous()` now also transforms the `lower`, `middle` and
    `upper` aesthetics used by `geom_boxplot()`: this only affects
    `geom_boxplot(stat = "identity")` (#1020).

    !end-bullet!
-   !begin-bullet!
    Legends no longer inherit aesthetics if `inherit.aes` is FALSE
    (#1267).

    !end-bullet!
-   !begin-bullet!
    `lims()` makes it easy to set the limits of any axis (#1138).

    !end-bullet!
-   !begin-bullet!
    `labels = NULL` now works with `guide_legend()` and
    `guide_colorbar()`. (#1175, #1183).

    !end-bullet!
-   !begin-bullet!
    `override.aes` now works with American aesthetic spelling,
    e.g. color

    !end-bullet!
-   !begin-bullet!
    Scales no longer round data points to improve performance of colour
    palettes. Instead the scales package now uses a much faster colour
    interpolation algorithm (#1022).

    !end-bullet!
-   !begin-bullet!
    `scale_*_brewer()` and `scale_*_distiller()` add new `direction`
    argument of `scales::brewer_pal`, making it easier to change the
    order of colours (@jiho, #1139).

    !end-bullet!
-   !begin-bullet!
    `scale_x_date()` now clips dates outside the limits in the same way
    as `scale_x_continuous()` (#1090).

    !end-bullet!
-   !begin-bullet!
    `stat_bin()` gains `bins` arguments, which denotes the number of
    bins. Now you can set `bins=100` instead of `binwidth=0.5`. Note
    that `breaks` or `binwidth` will override it (@tmshn, #1158, #102).

    !end-bullet!
-   !begin-bullet!
    `stat_boxplot()` warns if a continuous variable is used for the `x`
    aesthetic without also supplying a `group` aesthetic (#992,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `stat_summary_2d()` and `stat_bin_2d()` now share exactly the same
    code for determining breaks from `bins`, `binwidth`, and `origin`.

    !end-bullet!
-   !begin-bullet!
    `stat_summary_2d()` and `stat_bin_2d()` now output in tile/raster
    compatible form instead of rect compatible form.

    !end-bullet!
-   !begin-bullet!
    Automatically computed breaks do not lead to an error for
    transformations like "probit" where the inverse can map to infinity
    (#871, @krlmlr)

    !end-bullet!
-   !begin-bullet!
    `stat_function()` now always evaluates the function on the original
    scale. Previously it computed the function on transformed scales,
    giving incorrect values (@BrianDiggs, #1011).

    !end-bullet!
-   !begin-bullet!
    `strip_dots` works with anonymous functions within calculated
    aesthetics (e.g. `aes(sapply(..density.., function(x) mean(x))))`
    (#1154, @NikNakk)

    !end-bullet!
-   !begin-bullet!
    `theme()` gains `validate = FALSE` parameter to turn off validation,
    and hence store arbitrary additional data in the themes. (@tdhock,
    #1121)

    !end-bullet!
-   !begin-bullet!
    Improved the calculation of segments needed to draw the curve
    representing a line when plotted in polar coordinates. In some
    cases, the last segment of a multi-segment line was not drawn
    (@BrianDiggs, #952)

    !end-bullet!

!end-bullets-84!

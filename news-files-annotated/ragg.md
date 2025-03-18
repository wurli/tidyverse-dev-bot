# ragg (development version)

!begin-bullets-1!

-   !begin-bullet!
    Added `agg_record()` for optimised plot recording
    !end-bullet!
-   !begin-bullet!
    Added support for hold and flushing, mainly in service of Positron
    !end-bullet!

!end-bullets-1!

# ragg 1.3.3

!begin-bullets-2!

-   !begin-bullet!
    Fixed a regression from upstream changes in Freetype (#172)
    !end-bullet!

!end-bullets-2!

# ragg 1.3.2

!begin-bullets-3!

-   !begin-bullet!
    Fix a bug in how groups are defined and recalled
    !end-bullet!

!end-bullets-3!

# ragg 1.3.1

!begin-bullets-4!

-   !begin-bullet!
    Make sure the linejoin/linemitre setting is honored when drawing
    rectangles (#162)
    !end-bullet!
-   !begin-bullet!
    Fix a bug with resetting clipping during group and pattern rendering
    !end-bullet!
-   !begin-bullet!
    Fix scaling of raster glyphs in drawGlyph
    !end-bullet!

!end-bullets-4!

# ragg 1.3.0

!begin-bullets-5!

-   !begin-bullet!
    Added supported for new graphics enigine features: Groups, paths,
    luminance masks, and glyphs
    !end-bullet!
-   !begin-bullet!
    Add a switch (defaults to on) to snapping rectangles to the pixel
    grid when they are only drawn with fill (no stroke)
    !end-bullet!
-   !begin-bullet!
    Fixed a bug causing repeated warnings when using a font at 0 size
    (#130)
    !end-bullet!
-   !begin-bullet!
    Silence a bug in clang-ASAN that incorrectly reported sanitiser
    issues
    !end-bullet!

!end-bullets-5!

# ragg 1.2.7

!begin-bullets-6!

-   !begin-bullet!
    Fix a stack imbalance bug
    !end-bullet!

!end-bullets-6!

# ragg 1.2.6

!begin-bullets-7!

-   !begin-bullet!
    Fix symbol rendering bug on windows (#132)
    !end-bullet!
-   !begin-bullet!
    Add support for `dev.capabilities()` (#105)
    !end-bullet!
-   !begin-bullet!
    Prepare for Arm Windows
    !end-bullet!

!end-bullets-7!

# ragg 1.2.5

!begin-bullets-8!

-   !begin-bullet!
    Fix a bug when rendering glyphs from a colour font that also provide
    greyscale glyphs (#105)
    !end-bullet!
-   !begin-bullet!
    Move `sprintf()` to `snprintf()` in the AGG source code to comply
    with Arm64 deprecation
    !end-bullet!
-   !begin-bullet!
    Better guard against bad input (#116)
    !end-bullet!

!end-bullets-8!

# ragg 1.2.4

!begin-bullets-9!

-   !begin-bullet!
    Fixed a regression that turned off line mitre support (#119)
    !end-bullet!

!end-bullets-9!

# ragg 1.2.3

!begin-bullets-10!

-   !begin-bullet!
    Second attempt at rendering jpegs with transparent background. Now,
    the buffer is filled with solid white before any drawing happens.
    !end-bullet!
-   !begin-bullet!
    Fixed a bug that resulted in newlines being rendered as missing
    glyphs on some Linux versions (#111)
    !end-bullet!

!end-bullets-10!

# ragg 1.2.2

!begin-bullets-11!

-   !begin-bullet!
    MacOS: configure script now uses the local system dependencies
    provided by CRAN via pkg-config. Autobrew libs are used as fallback
    on non-cran servers only.
    !end-bullet!

!end-bullets-11!

# ragg 1.2.1

!begin-bullets-12!

-   !begin-bullet!
    Fix bug that caused R to crash when writing tiff files with
    transparent background (#97)
    !end-bullet!

!end-bullets-12!

# ragg 1.2.0

!begin-bullets-13!

-   !begin-bullet!
    Add support for new graphic engine features:
    !begin-bullets-14!
    -   !begin-bullet!
        Arbitrary clipping paths
        !end-bullet!
    -   !begin-bullet!
        Alpha masks
        !end-bullet!
    -   !begin-bullet!
        Linear and radial gradients
        !end-bullet!
    -   !begin-bullet!
        Tiling patterns
        !end-bullet!

    !end-bullets-14!
    !end-bullet!
-   !begin-bullet!
    Use white as background when passing in a fully transparent
    background colour to devices that doesn't support alpha (notably
    jpeg) (#91)
    !end-bullet!
-   !begin-bullet!
    ragg now defers symbol font resolving to systemfonts which makes it
    possible to register alternative symbol fonts using
    `register_font()` (#90)
    !end-bullet!
-   !begin-bullet!
    Filenames in UTF-8 are now treated correctly on Windows (#87)
    !end-bullet!
-   !begin-bullet!
    Fix size selection of non-scalable fonts when the requested size is
    bigger than the available
    !end-bullet!

!end-bullets-13!

# ragg 1.1.3

!begin-bullets-15!

-   !begin-bullet!
    Use int32_t instead of int32 in old code
    !end-bullet!
-   !begin-bullet!
    Prepare for UCRT
    !end-bullet!
-   !begin-bullet!
    Better error message when failing to allocate memory for the buffer
    (#82)
    !end-bullet!
-   !begin-bullet!
    Increase storage size limits for paths (#80)
    !end-bullet!

!end-bullets-15!

# ragg 1.1.2

!begin-bullets-16!

-   !begin-bullet!
    Fix bug in `agg_capture()` that resulted in premultiplied colour
    values being returned
    !end-bullet!

!end-bullets-16!

# ragg 1.1.1

!begin-bullets-17!

-   !begin-bullet!
    Fix a bug in glyph dimension lookup that could cause system crashes
    !end-bullet!
-   !begin-bullet!
    Fix bug in font caching when multiple ragg devices are used
    simultaneously
    !end-bullet!

!end-bullets-17!

# ragg 1.1.0

!begin-bullets-18!

-   !begin-bullet!
    Major version release to signify the much improved text support that
    includes full support for right-to-left scripts and bidirectional
    text (mix of RtL and LtR scripts). It further adds full support for
    OpenType features and non-scalable fonts.
    !end-bullet!
-   !begin-bullet!
    Re-exporting `register_font()`, `register_variant()`, and
    `font_feature()` from systemfonts
    !end-bullet!
-   !begin-bullet!
    Re-exporting `get_font_features()` from textshaping
    !end-bullet!
-   !begin-bullet!
    Use new textshaping API and handle font fallback correctly
    !end-bullet!
-   !begin-bullet!
    Add support for rendering colour fonts (#1)
    !end-bullet!

!end-bullets-18!

# ragg 0.4.1

!begin-bullets-19!

-   !begin-bullet!
    Skip text tests on CRAN as no text is plottet on the CRAN solaris
    machine
    !end-bullet!
-   !begin-bullet!
    Fixed a bug resulting in system crash on certain systems, as well as
    clang-ASAN error. (#59)
    !end-bullet!

!end-bullets-19!

# ragg 0.4.0

!begin-bullets-20!

-   !begin-bullet!
    ragg now requires the Harfbuzz and Fribidi libraries to be available
    when installing from source due to their dependency in the
    textshaping package.
    !end-bullet!
-   !begin-bullet!
    Move text shaping to the new textshaping package.
    !end-bullet!
-   !begin-bullet!
    Fix `agg_capture()` on big endian systems (#49, @QuLogic)
    !end-bullet!
-   !begin-bullet!
    Fix use of symbol font on Windows by moving to Segoe UI Symbol which
    has a Unicode charmap (#51)
    !end-bullet!
-   !begin-bullet!
    Better compatibility with knitr and `ggplot2::ggsave()`
    !end-bullet!

!end-bullets-20!

# ragg 0.3.1

!begin-bullets-21!

-   !begin-bullet!
    Roll back support for new clipping options in the graphic engine as
    it was buggy.
    !end-bullet!

!end-bullets-21!

# ragg 0.3.0

!begin-bullets-22!

-   !begin-bullet!
    Fix a bug when plotting partially transparent raster (#44)
    !end-bullet!
-   !begin-bullet!
    Add a `scaling` argument to all devices allowing you to change
    relative scaling of output.
    !end-bullet!
-   !begin-bullet!
    Horizontal and vertical text are now snapped to the pixel grid in
    order to improve rendering quality.
    !end-bullet!
-   !begin-bullet!
    Internal changes to prepare for coming updates to the graphic engine
    !end-bullet!

!end-bullets-22!

# ragg 0.2.0

!begin-bullets-23!

-   !begin-bullet!
    Fix compilation on R \<= 3.3 by including Rdynload.h explicitly
    !end-bullet!
-   !begin-bullet!
    Fix a performance regression when plotting text (#33)
    !end-bullet!
-   !begin-bullet!
    Fix erroneous width calculations of strings starting with a space on
    windows (#32)
    !end-bullet!
-   !begin-bullet!
    Fix a bug in `agg_capture()` where the output became mangled if
    device height != width
    !end-bullet!
-   !begin-bullet!
    Fix a bug in raster support where raster data did not get
    premultiplied before rendering (#38, @yixuan)
    !end-bullet!
-   !begin-bullet!
    Fix an integer overflow issue in the AGG source code
    !end-bullet!

!end-bullets-23!

# ragg 0.1.5

!begin-bullets-24!

-   !begin-bullet!
    Fix compilation on macOS
    !end-bullet!

!end-bullets-24!

# ragg 0.1.4

!begin-bullets-25!

-   !begin-bullet!
    Fix a bug in AGG's font manager that ignored the font index when it
    stored and retrieved cached faces
    !end-bullet!

!end-bullets-25!

# ragg 0.1.3

!begin-bullets-26!

-   !begin-bullet!
    Fix bug preventing ragg from displaying 50% transparent black
    !end-bullet!
-   !begin-bullet!
    Another attempt at fixing compilation on mac build machines
    !end-bullet!

!end-bullets-26!

# ragg 0.1.2

!begin-bullets-27!

-   !begin-bullet!
    Fix compilation on certain Linux systems by preferring dynamic
    libraries over static ones (#25, @jimhester).
    !end-bullet!

!end-bullets-27!

# ragg 0.1.1

!begin-bullets-28!

-   !begin-bullet!
    Avoid a bug when the call to start a device included too many
    characters (#16)
    !end-bullet!
-   !begin-bullet!
    Fix integer overflow runtime errors in agg source code
    (`agg_scanline_storage_aa.h`), by changing storage to `long`
    !end-bullet!
-   !begin-bullet!
    Remove benchmarking vignettes as it was causing too much trouble on
    stripped down systems... They are still available on
    https://ragg.r-lib.org
    !end-bullet!
-   !begin-bullet!
    Better build setup to properly build on all macOS systems
    !end-bullet!

!end-bullets-28!

# ragg 0.1.0

!begin-bullets-29!

-   !begin-bullet!
    Basic setup of package. png, tiff, ppm, and buffer capture support
    !end-bullet!
-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-29!

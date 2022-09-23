# rvest (development version)

# rvest 1.0.3

!begin-bullets-1!

-   !begin-bullet!
    Re-document to fix HTML issues in `.Rd`.
    !end-bullet!

!end-bullets-1!

# rvest 1.0.2

!begin-bullets-2!

-   !begin-bullet!
    Fixes for CRAN

    !end-bullet!
-   !begin-bullet!
    `html_table()` converts empty tables to empty tibbles (@epiben,
    #327).

    !end-bullet!

!end-bullets-2!

# rvest 1.0.1

!begin-bullets-3!

-   !begin-bullet!
    `html_table()` correctly handles tables with cells that contain
    blank values for `rowspan` and/or `colspan`, so that
    e.g. `<td rowspan="">` is parsed as `<td rowspan=1>` (@epiben,
    #323).

    !end-bullet!
-   !begin-bullet!
    Fix broken example

    !end-bullet!

!end-bullets-3!

# rvest 1.0.0

## New features

!begin-bullets-4!

-   !begin-bullet!
    New `html_text2()` provides a more natural rendering of HTML nodes
    into text, converting `<br>` into "`\n`{=tex}", and removing
    non-significant whitespace (#175). By default, it also converts
    `&nbsp;` into regular spaces, which you can suppress with
    `preserve_nbsp = TRUE` (#284).

    !end-bullet!
-   !begin-bullet!
    `html_table()` has been re-written from scratch to more closely
    mimic the algorithm that browsers use for parsing tables. This
    should mean that there are far fewer tables for which it fails to
    produce some output (#63, #204, #215). The `fill` argument has been
    deprecated since it is no longer needed. `html_table()` now returns
    a tibble rather than a data frame to be compatible with the rest of
    the tidyverse (#199). Its performance has been considerably improved
    (#237). It also gains a `na.strings` argument to control what values
    are converted to `NA` (#107), and a `convert` argument to control
    whether to run the conversion (#311).

    !end-bullet!
-   !begin-bullet!
    New `html_form_submit()` allows you to submit a form directly,
    without needing to create a session (#300).

    !end-bullet!
-   !begin-bullet!
    rvest is now licensed as MIT (#287).

    !end-bullet!

!end-bullets-4!

## API changes

!begin-bullet!

Since this is the 1.0.0 release, I included a large number of API
changes to make rvest more compatible with current tidyverse
conventions. Older functions have been deprecated, so existing code will
continue to work (albeit with a few new warnings).

!end-bullet!

!begin-bullets-5!

-   !begin-bullet!
    rvest now imports xml2 rather than depending on it. This is cleaner
    because it avoids attaching all the xml2 functions that you're less
    likely to use. To reduce the change of breakages, rvest re-exports
    xml2 functions `read_html()` and `url_absolute()`, but your code may
    now need an explicit `library(xml2)`.

    !end-bullet!
-   !begin-bullet!
    `html_form()` now returns an object with class `rvest_form` (instead
    of form). Fields within a form now have class `rvest_field`, instead
    of a variety of classes that were lacking the `rvest_` prefix. All
    functions for working with forms have a common `html_form_` prefix:
    `set_values()` became `html_form_set()`. `submit_form()` was renamed
    to `session_submit()` because it returns a session.

    !end-bullet!
-   !begin-bullet!
    `html_node()` and `html_nodes()` have been superseded in favor of
    `html_element()` and `html_elements()` since they (almost) always
    return elements, not nodes (#298).

    !end-bullet!
-   !begin-bullet!
    `html_session()` is now `session()` and returns an object of class
    `rvest_session` (instead of `session`). All functions that work with
    session objects now have a common `session_` prefix.

    !end-bullet!
-   !begin-bullet!
    Long deprecated `html()`, `html_tag()`, `xml()` functions have been
    removed.

    !end-bullet!
-   !begin-bullet!
    `minimal_html()` (which doesn't appear to be used by any other
    package) has had its arguments flipped to make it more intuitive.

    !end-bullet!
-   !begin-bullet!
    `guess_encoding()` has been renamed to `html_encoding_guess()` to
    avoid a clash with `stringr::guess_encoding()` (#209).
    `repair_encoding()` has been deprecated because it doesn't appear to
    work.

    !end-bullet!
-   !begin-bullet!
    `pluck()` is no longer exported to avoid a clash with
    `purrr::pluck()`; if you need it use `purrr::map_chr()` and friends
    instead (#209).

    !end-bullet!
-   !begin-bullet!
    `xml_tag()`, `xml_node()`, and `xml_nodes()` have been formally
    deprecated in favor of their `html_` equivalents.

    !end-bullet!

!end-bullets-5!

## Minor improvements and bug fixes

!begin-bullets-6!

-   !begin-bullet!
    The "harvesting the web" vignette has been rewritten to focus more
    on basics rvest, eliminating the screenshots to keep the installed
    package as svelte as possible. It's also been renamed to
    `vignette("rvest")` since it's the vignette that you should read
    first.

    !end-bullet!
-   !begin-bullet!
    The SelectorGadget vignette is now a web-only article,
    <https://rvest.tidyverse.org/articles/articles/selectorgadget.html>,
    so we can be more generous with screenshots since they're no longer
    bundled with every install of the package. Together with the rewrite
    of the other vignette, this means that rvest is now \~90 Kb instead
    of \~1.1 Mb.

    !end-bullet!
-   !begin-bullet!
    All uses of IMDB have been eliminated since the site explicitly
    prohibits scraping (#195).

    !end-bullet!
-   !begin-bullet!
    `session_submit()` errors if `form` doesn't have a `url` (#288).

    !end-bullet!
-   !begin-bullet!
    New `session_forward()` function to complement `session_back()`. It
    now allows you to pick the submission button by position (#156). The
    `...` argument is deprecated; please use `config` instead.

    !end-bullet!
-   !begin-bullet!
    `html_form_set()` can now accept character vectors allowing you to
    select multiple checkboxes in a set or select multiple values from a
    multi-`<select>` (#127, with help from @juba). It also uses dynamic
    dots so that you can use `!!!` if you have a list of values (#189).

    !end-bullet!

!end-bullets-6!

# rvest 0.3.6

!begin-bullets-7!

-   !begin-bullet!
    Remove failing example
    !end-bullet!

!end-bullets-7!

# rvest 0.3.5

!begin-bullets-8!

-   !begin-bullet!
    Use web archive to fix broken example.
    !end-bullet!

!end-bullets-8!

# rvest 0.3.4

!begin-bullets-9!

-   !begin-bullet!
    Remove unneeded `read_xml.response()` method (#242).
    !end-bullet!

!end-bullets-9!

# rvest 0.3.3

!begin-bullets-10!

-   !begin-bullet!
    Fix `R CMD check` failure

    !end-bullet!
-   !begin-bullet!
    `submit_request()` now checks for empty form-field-types to select
    the correct submit fields (@rentrop, #159)

    !end-bullet!

!end-bullets-10!

# rvest 0.3.2

!begin-bullets-11!

-   !begin-bullet!
    Fixes to `follow_link()` and `back()` to correctly manage session
    history.

    !end-bullet!
-   !begin-bullet!
    If you're using xml2 1.0.0, `html_node()` will now return a "missing
    node".

    !end-bullet!
-   !begin-bullet!
    Parse rowspans and colspans effectively by filling using repetition
    from left to right (for colspan) and top to bottom (rowspan) (#111)

    !end-bullet!
-   !begin-bullet!
    Updated a few examples and demos where the website structure has
    changed.

    !end-bullet!
-   !begin-bullet!
    Made compatible with both xml2 0.1.2 and 1.0.0.

    !end-bullet!

!end-bullets-11!

# rvest 0.3.1

!begin-bullets-12!

-   !begin-bullet!
    Fix invalid link for SSA example.

    !end-bullet!
-   !begin-bullet!
    Parse `<options>` that don't have value attribute (#85).

    !end-bullet!
-   !begin-bullet!
    Remove all remaining uses of `html()` in favor of `read_html()`
    (@jimhester, #113).

    !end-bullet!

!end-bullets-12!

# rvest 0.3.0

!begin-bullets-13!

-   !begin-bullet!
    rvest has been rewritten to take advantage of the new xml2 package.
    xml2 provides a fresh binding to libxml2, avoiding many of the
    work-arounds previously needed for the XML package. Now rvest
    depends on the xml2 package, so all the xml functions are available,
    and rvest adds a thin wrapper for html.

    !end-bullet!
-   !begin-bullet!
    A number of functions have change names. The old versions still
    work, but are deprecated and will be removed in rvest 0.4.0.

    !end-bullet!
    !begin-bullets-14!
    -   !begin-bullet!
        `html_tag()` -\> `html_name()`
        !end-bullet!
    -   !begin-bullet!
        `html()` -\> `read_html()`
        !end-bullet!

    !end-bullets-14!
-   !begin-bullet!
    `html_node()` now throws an error if there are no matches, and a
    warning if there's more than one match. I think this should make it
    more likely to fail clearly when the structure of the page changes.

    !end-bullet!
-   !begin-bullet!
    `xml_structure()` has been moved to xml2. New `html_structure()`
    (also in xml2) highlights id and class attributes (#78).

    !end-bullet!
-   !begin-bullet!
    `submit_form()` now works with forms that use GET (#66).

    !end-bullet!
-   !begin-bullet!
    `submit_request()` (and hence `submit_form()`) is now
    case-insensitive, and so will find `<input type=SUBMIT>` as well
    as`<input type="submit">`.

    !end-bullet!
-   !begin-bullet!
    `submit_request()` (and hence `submit_form()`) recognizes forms with
    `<input type="image">` as a valid form submission button.

    !end-bullet!

!end-bullets-13!

# rvest 0.2.0

## New features

!begin-bullets-15!

-   !begin-bullet!
    `html()` and `xml()` pass `...` on to `httr::GET()` so you can more
    finely control the request (#48).

    !end-bullet!
-   !begin-bullet!
    Add xml support: parse with `xml()`, then work with using
    `xml_node()`, `xml_attr()`, `xml_attrs()`, `xml_text()` and
    `xml_tag()` (#24).

    !end-bullet!
-   !begin-bullet!
    `xml_structure()`: new function that displays the structure
    (i.e. tag and attribute names) of a xml/html object (#10).

    !end-bullet!

!end-bullets-15!

## Bug fixes

!begin-bullets-16!

-   !begin-bullet!
    `follow_link()` now accepts css and xpath selectors. (#38, #41, #42)

    !end-bullet!
-   !begin-bullet!
    `html()` does a better job of dealing with encodings (passing the
    problem on to `XML::parseHTML()`) instead of trying to do it itself
    (#25, #50).

    !end-bullet!
-   !begin-bullet!
    `html_attr()` returns default value when input is NULL (#49)

    !end-bullet!
-   !begin-bullet!
    Add missing `html_node()` method for session.

    !end-bullet!
-   !begin-bullet!
    `html_nodes()` now returns an empty list if no elements are found
    (#31).

    !end-bullet!
-   !begin-bullet!
    `submit_form()` converts relative paths to absolute URLs (#52). It
    also deals better with 0-length inputs (#29).

    !end-bullet!

!end-bullets-16!

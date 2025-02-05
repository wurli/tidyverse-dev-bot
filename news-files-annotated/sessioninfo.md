# sessioninfo (development version)

!begin-bullets-1!

-   !begin-bullet!
    `session_info()` no longer produces an error when `info` has length
    \> 1 (@nash-delcamp-slp, #96).

    !end-bullet!
-   !begin-bullet!
    Update pkgdown url to sessioninfo.r-lib.org.

    !end-bullet!
-   !begin-bullet!
    `session_diff()` now accepts the URL to a GitHub Actions log as the
    source for `new` and/or `old` (@jennybc, #68).

    !end-bullet!
-   !begin-bullet!
    `session_info()` output now includes an explanation for symbol
    highlighting packages attached to the search path (@IndrajeetPatil).

    !end-bullet!
-   !begin-bullet!
    `session_info()` and `platform_info()` now print the host name if
    the `sessioninfo.include_hostname` global option is set to `TRUE`
    (@certara-jcraig, #99).

    !end-bullet!
-   !begin-bullet!
    sessioninfo now does not leave behind detritus in the temporary
    directory.

    !end-bullet!

!end-bullets-1!

# sessioninfo 1.2.2

!begin-bullets-2!

-   !begin-bullet!
    This version does not add an emoji hash to the output.

    !end-bullet!
-   !begin-bullet!
    The `source` column of the output data frame of `package_info()`
    (also part of `session_info()`), now contains the full SHA for
    packages installed from GitHub, instead of only the first seven
    characters. This makes it easier to use the SHA programmatically.
    Note that this does not affect formatting and printing, which still
    use the abbreviated SHA. (@muschellij2, #61).

    !end-bullet!
-   !begin-bullet!
    RStudio Package Manager (RSPM) and other repository sources are now
    shown in the `source` column, if they set the `Repository` field in
    `DESCRIPTION`.

    !end-bullet!

!end-bullets-2!

# sessioninfo 1.2.1

!begin-bullets-3!

-   !begin-bullet!
    `package_info()` and `session_info()` now do not fail if the version
    number of an installed package is invalid.

    !end-bullet!
-   !begin-bullet!
    Better aliases for the list of attached, loaded and installed
    packages in `package_inf()` and `session_info()`.

    !end-bullet!

!end-bullets-3!

# sessioninfo 1.2.0

!begin-bullets-4!

-   !begin-bullet!
    New function `external_info()`, information about external software.
    It can be also requested with the new `info` argument of
    `session_info()` (@llrs).

    !end-bullet!
-   !begin-bullet!
    New function `python_info()`, information about Python
    configuration. It is automatically included in `session_info()` if
    the reticulate package is loaded and Python is available. You can
    also request it manually via the new `info` argument of
    `session_info()` (#33).

    !end-bullet!
-   !begin-bullet!
    The output of `session_info()` now has an emoji hash, consisting of
    three emojis. This allows quick comparison of two session infos
    (#26).

    !end-bullet!
-   !begin-bullet!
    All `*_info()` functions use ANSI colors on systems that support
    them. In particular, it highlights unusual package versions and
    sources, and possible package problems (#3).

    !end-bullet!
-   !begin-bullet!
    New `session_diff()` function, to compare two session infos from
    various sources (#6).

    !end-bullet!
-   !begin-bullet!
    `session_info()` has a new argument named `info`, to select which
    parts of the session information should be printed.

    !end-bullet!
-   !begin-bullet!
    `session_info()` now has a `to_file` argument, to write the output
    to a file (#30).

    !end-bullet!
-   !begin-bullet!
    `session_inf()` has a `dependencies` argument now, and passes it to
    `package_info()`.

    !end-bullet!
-   !begin-bullet!
    `package_info()` and `session_info()` can now list the attached or
    installed packages, see the `pkgs` argument in the manual for
    details (#42).

    !end-bullet!
-   !begin-bullet!
    `platform_info()` and `session_info()` now include the Windows build
    number in the output (#40).

    !end-bullet!
-   !begin-bullet!
    sessioninfo now never wraps the output if the screen is too narrow
    (#31).

    !end-bullet!
-   !begin-bullet!
    All `*_info()` functions have a `format()` S3 method now.

    !end-bullet!
-   !begin-bullet!
    `platform_info()` and `session_info()` now include the RStudio
    version if the R session is in RStudio (#29).

    !end-bullet!
-   !begin-bullet!
    The `source` column of the package list is now more informative.

    !end-bullet!

!end-bullets-4!

# sessioninfo 1.1.1

!begin-bullets-5!

-   !begin-bullet!
    `package_info()` and `session_info()` now detect locally installed
    packages correctly if they have an empty `biocViews` field in
    \`DESCRIPTION (@llrs, #25)

    !end-bullet!
-   !begin-bullet!
    `package_info()` and `session_info()` now handle the case when a
    loaded package was removed from the disk.

    !end-bullet!

!end-bullets-5!

# sessioninfo 1.1.0

!begin-bullets-6!

-   !begin-bullet!
    `package_info()` now has a `dependencies` argument, to filter the
    type of dependent packages in the output (#22).

    !end-bullet!
-   !begin-bullet!
    `session_info()` and `package_info()` now show the library search
    path, and also which library each package was loaded from. They also
    warn if the on-disk version of the package has a different path than
    the loaded version (#9, #20).

    !end-bullet!
-   !begin-bullet!
    `package_info()`'s `ondiskversion` entry is now correct.

    !end-bullet!
-   !begin-bullet!
    `session_info()` and `package_info()` now verify the MD5 hashes of
    DLL files on Windows, and warns for micmatches, as these are usually
    broken packages (#12, #16).

    !end-bullet!
-   !begin-bullet!
    We use now the cli package, instead of clisymbols, and this fixes
    printing bugs in LaTeX documents (#14).

    !end-bullet!
-   !begin-bullet!
    `session_info()` and `platform_info()` now include the `LC_CTYPE`
    locale category (@patperry, #11)

    !end-bullet!
-   !begin-bullet!
    `session_info()` and `package_info()` now print source of the CRAN
    packages in uppercase, always, even if they were installed by
    devtools.

    !end-bullet!
-   !begin-bullet!
    `session_info()` and `platform_info()` now handle the case when
    `utils::sessionInfo()$running` is `NULL` (@HenrikBengtsson, #7).

    !end-bullet!
-   !begin-bullet!
    `session_info()` and `package_info()` now only list loaded versions
    for namespaces which are already loaded. This only makes a
    difference if the `pkgs` argument is given (#4).

    !end-bullet!
-   !begin-bullet!
    Do not consult the `max.print` option, for platform and package info
    (@jennybc, #13).

    !end-bullet!

!end-bullets-6!

# sessioninfo 1.0.0

First public release.

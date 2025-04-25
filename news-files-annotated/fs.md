# fs (development version)

!begin-bullets-1!

-   !begin-bullet!
    `path_has_parent()` now expands `~` (#412).

    !end-bullet!
-   !begin-bullet!
    New `path_select_components()` function to select components of one
    or more paths (#326, @Tazinho).

    !end-bullet!
-   !begin-bullet!
    `dir_exists()` follows relative symlinks in non-current directories
    (@heavywatal, #395).

    !end-bullet!

!end-bullets-1!

# fs 1.6.6

!begin-bullets-2!

-   !begin-bullet!
    No changes.
    !end-bullet!

!end-bullets-2!

# fs 1.6.5

!begin-bullets-3!

-   !begin-bullet!
    `path_ext()` and `path_ext_remove()` return correct extension and
    path, respectively, when multiple dots are present in file name
    (@IndrajeetPatil, #452, #453).

    !end-bullet!
-   !begin-bullet!
    `path_rel()` provides an informative error message when multiple
    starting directory paths are specified (@IndrajeetPatil, #454).

    !end-bullet!

!end-bullets-3!

# fs 1.6.4

!begin-bullets-4!

-   !begin-bullet!
    No changes.
    !end-bullet!

!end-bullets-4!

# fs 1.6.3

!begin-bullets-5!

-   !begin-bullet!
    No user visible changes.
    !end-bullet!

!end-bullets-5!

# fs 1.6.2

!begin-bullets-6!

-   !begin-bullet!
    `path_ext_set()` can now handle extensions that contain a `.`,
    e.g. `csv.gz` (@mgirlich, #415).
    !end-bullet!

!end-bullets-6!

# fs 1.6.1

No user visible changes.

# fs 1.6.0

!begin-bullets-7!

-   !begin-bullet!
    inputs to `path_real()` and `path_join()` are coerced to character
    for consistency with other functions (@raymondben, #370)

    !end-bullet!
-   !begin-bullet!
    fs uses libuv 1.44.2 now.

    !end-bullet!

!end-bullets-7!

# fs 1.5.2

!begin-bullets-8!

-   !begin-bullet!
    `file_create()` and `dir_create()` now return the correct path when
    `...` arguments are used (@davidchall, #333).

    !end-bullet!
-   !begin-bullet!
    `dir_create(recurse = FALSE)` now correctly handles `...` arguments
    (@davidchall, #333).

    !end-bullet!
-   !begin-bullet!
    `file_exists()` now expands `~` again (#325).

    !end-bullet!
-   !begin-bullet!
    `dir_copy()` works when `path` has length \>1 (#360).

    !end-bullet!

!end-bullets-8!

# fs 1.5.1

!begin-bullets-9!

-   !begin-bullet!
    Gábor Csárdi is now the maintainer.

    !end-bullet!
-   !begin-bullet!
    fs is now licensed as MIT (#301).

    !end-bullet!
-   !begin-bullet!
    `dir_create()` now restores the previous umask (#293)

    !end-bullet!
-   !begin-bullet!
    `file_exists()` is now much faster (#295)

    !end-bullet!
-   !begin-bullet!
    `options(fs.fs_path.shorten)` can now be used to control how paths
    are shortened in tibbles. The default value is "front", valid
    alternatives are "back", "middle" and "abbreviate". (#335)

    !end-bullet!
-   !begin-bullet!
    `options(fs.use_tibble = FALSE)` can now be used to disable use of
    tibbles (#295).

    !end-bullet!
-   !begin-bullet!
    `path_tidy()` now works with non-UTF8 encoded paths (@shrektan,
    #321).

    !end-bullet!

!end-bullets-9!

# fs 1.5.0

!begin-bullets-10!

-   !begin-bullet!
    The libuv release used by fs was updated to 1.38.1

    !end-bullet!
-   !begin-bullet!
    `dir_create()` now consults the process umask so the mode during
    directory creation works like `mkdir` does (#284).

    !end-bullet!
-   !begin-bullet!
    `fs_path`, `fs_bytes` and `fs_perms` objects are now compatible with
    vctrs 0.3.0 (#266)

    !end-bullet!
-   !begin-bullet!
    `fs_path` objects now sort properly when there is a mix of ASCII and
    unicode elements (#279)

    !end-bullet!

!end-bullets-10!

# fs 1.4.2

!begin-bullets-11!

-   !begin-bullet!
    `file_info(..., follow = TRUE)`, `is_dir()`, and `is_file()` follow
    relative symlinks in non-current directories (@heavywatal, #280)

    !end-bullet!
-   !begin-bullet!
    `dir_map()` now grows its internal list safely, the 1.4.0 release
    introduced an unsafe regression (#268)

    !end-bullet!
-   !begin-bullet!
    `file_info()` returns a tibble if the tibble package is installed,
    and subsets work when it is a `data.frame` (#265)

    !end-bullet!
-   !begin-bullet!
    `path_real()` always fails if the file does not exist. Thus it can
    no longer be used to resolve symlinks further up the path hierarchy
    for files that do not yet exist. This reverts the feature introduced
    in 1.2.7 (#144, #221, #231)

    !end-bullet!

!end-bullets-11!

# fs 1.4.1

!begin-bullets-12!

-   !begin-bullet!
    Fix compilation on Solaris.
    !end-bullet!

!end-bullets-12!

# fs 1.4.0

!begin-bullets-13!

-   !begin-bullet!
    `[[.fs_path`, `[[.fs_bytes` and `[[.fs_perms` now preserve their
    classes after subsetting (#254).

    !end-bullet!
-   !begin-bullet!
    `path_has_parent()` now recycles both the `path` and `parent`
    arguments (#253).

    !end-bullet!
-   !begin-bullet!
    `path_ext_set()` now recycles both the `path` and `ext` arguments
    (#250).

    !end-bullet!
-   !begin-bullet!
    Internally fs no longer depends on Rcpp

    !end-bullet!

!end-bullets-13!

# fs 1.3.2

!begin-bullets-14!

-   !begin-bullet!
    fs now passes along `CPPFLAGS` during compilation of libuv, fixing
    an issue that could prevent compilation from source on macOS
    Catalina. (@kevinushey, #229)

    !end-bullet!
-   !begin-bullet!
    fs now compiles on alpine linux (#210)

    !end-bullet!
-   !begin-bullet!
    `dir_create()` now works with absolute paths and `recurse = FALSE`
    (#204).

    !end-bullet!
-   !begin-bullet!
    `dir_tree()` now works with paths that need tilde expansion
    (@dmurdoch, @jennybc, #203).

    !end-bullet!
-   !begin-bullet!
    `file_info()` now returns file sizes with the proper classes
    ("fs_bytes" and "numeric"), rather than just "fs_bytes" (#239)

    !end-bullet!
-   !begin-bullet!
    `get_dirent_type()` gains a `fail` argument (@bellma-lilly, #219)

    !end-bullet!
-   !begin-bullet!
    `is_dir()`, `is_file()`, `is_file_empty()` and `file_info()` gain a
    `follow` argument, to follow links and return information about the
    linked file rather than the link itself (#198)

    !end-bullet!
-   !begin-bullet!
    `path()` now follows "tidy" recycling rules, namely only consistent
    or length 1 inputs are recycled. (#238)

    !end-bullet!
-   !begin-bullet!
    `path()` now errors if the path given or constructed will exceed
    `PATH_MAX` (#233).

    !end-bullet!
-   !begin-bullet!
    `path_ext_set()` now works with multiple paths (@maurolepore, #208).

    !end-bullet!

!end-bullets-14!

# fs 1.3.1

!begin-bullets-15!

-   !begin-bullet!
    Fix missed test with UTF-8 characters, which now passes on a strict
    Latin-1 locale.

    !end-bullet!
-   !begin-bullet!
    Fix undefined behavior when casting -1 to `size_t`.

    !end-bullet!

!end-bullets-15!

# fs 1.3.0

## Breaking changes

!begin-bullets-16!

-   !begin-bullet!
    `dir_ls()`, `dir_map()`, `dir_walk()`, `dir_info()` and `dir_tree()`
    gain a `recurse` argument, which can be either a `TRUE` or `FALSE`
    (as was supported previously) *or* a number of levels to recurse.
    The previous argument `recursive` has been deprecated.
    !end-bullet!

!end-bullets-16!

## New features

!begin-bullets-17!

-   !begin-bullet!
    `dir_copy()` gains a `overwrite` argument, to overwrite a given
    directory (@pasipasi123, #193)
    !end-bullet!

!end-bullets-17!

## Minor improvements and fixes

!begin-bullets-18!

-   !begin-bullet!
    `dir_create()` now throws a more accurate error message when you try
    to create a directory in a non-writeable location (#196).

    !end-bullet!
-   !begin-bullet!
    `fs_path` objects now always show 10 characters by default when
    printed in tibbles (#191).

    !end-bullet!
-   !begin-bullet!
    `path_file()`, `path_dir()` and `path_ext()` now return normal
    character vectors rather than tidy paths (#194).

    !end-bullet!
-   !begin-bullet!
    `path_package()` now works with paths in development packages
    automatically (#175).

    !end-bullet!
-   !begin-bullet!
    tests now pass successfully when run in strict Latin-1 locale

    !end-bullet!

!end-bullets-18!

# fs 1.2.7

## New features

!begin-bullets-19!

-   !begin-bullet!
    `file_size()` function added as a helper for
    `file_info("file")$size` (#171)

    !end-bullet!
-   !begin-bullet!
    `is_file_empty()` function added to test for empty files\` (#171)

    !end-bullet!
-   !begin-bullet!
    `dir_tree()` function added to print a command line representation
    of a directory tree, analogous to the unix `tree` program (#82).

    !end-bullet!
-   !begin-bullet!
    Add a comparison vignette to quickly compare base R, fs and shell
    alternatives (@xvrdm, #168).

    !end-bullet!

!end-bullets-19!

## Minor improvements and fixes

!begin-bullets-20!

-   !begin-bullet!
    `path_ext_set()` and `file_temp()` now treat extensions with a
    leading `.` and those without equally.
    e.g. `path_ext_set("foo", ext = "bar")` and
    `path_ext_set("foo", ext = ".bar")` both result in "foo.bar"

    !end-bullet!
-   !begin-bullet!
    Tidy paths are now always returned with uppercase drive letters on
    Windows (#174).

    !end-bullet!
-   !begin-bullet!
    `format.bench_bytes()` now works with `str()` in R 3.5.1+ (#155).

    !end-bullet!
-   !begin-bullet!
    `path_ext()`, `path_ext_remove()`, and `path_ext_set()` now work on
    paths with no extension, and `file_temp()` now prepends a `.` to the
    file extension (#153).

    !end-bullet!
-   !begin-bullet!
    Link with -pthread by default and fix on BSD systems (#128, #145,
    #146).

    !end-bullet!
-   !begin-bullet!
    `file_chown()` can now take a `group_id` parameter as character
    (@cderv, #162).

    !end-bullet!
-   !begin-bullet!
    Parameter `browser` in `file_show()` now works as described in the
    documentation (@GegznaV, #154).

    !end-bullet!
-   !begin-bullet!
    `path_real()` now works even if the file does not exist, but there
    are symlinks further up the path hierarchy (#144).

    !end-bullet!
-   !begin-bullet!
    `colourise_fs_path()` now returns paths uncolored if the colors
    argument / `LS_COLORS` is malformed (#135).

    !end-bullet!

!end-bullets-20!

# fs 1.2.6

!begin-bullets-21!

-   !begin-bullet!
    This is a small bugfix only release.

    !end-bullet!
-   !begin-bullet!
    `file_move()` now fall back to copying, then removing files when
    moving files between devices (which would otherwise fail) (#131,
    https://github.com/r-lib/usethis/issues/438).

    !end-bullet!
-   !begin-bullet!
    Fix for a double free when using `warn = TRUE` (#132)

    !end-bullet!

!end-bullets-21!

# fs 1.2.5

!begin-bullets-22!

-   !begin-bullet!
    Patch release to fix tests which left files in the R session
    directory
    !end-bullet!

!end-bullets-22!

# fs 1.2.4

## New Features

!begin-bullets-23!

-   !begin-bullet!
    New `path_wd()` generates paths from the current working directory
    (#122).

    !end-bullet!
-   !begin-bullet!
    New `path_has_parent()` determines if a path has a given parent
    (#116).

    !end-bullet!
-   !begin-bullet!
    New `file_touch()` used to change access and modification times for
    a file (#98).

    !end-bullet!
-   !begin-bullet!
    `dir_ls()`, `dir_map()`, `dir_walk()`, `dir_info()` and
    `file_info()` gain a `fail` parameter, to signal warnings rather
    than errors if they are called on a path which is unavailable due to
    permissions or locked resources (#105).

    !end-bullet!

!end-bullets-23!

## Minor improvements and fixes

!begin-bullets-24!

-   !begin-bullet!
    `path_tidy()` now always includes a trailing slash for the windows
    root directory, e.g. `C:/` (#124).

    !end-bullet!
-   !begin-bullet!
    `path_ext()`, `path_ext_set()` and `path_ext_remove()` now handle
    paths with non-ASCII characters (#120).

    !end-bullet!
-   !begin-bullet!
    `fs_path` objects now print (without colors) even if the user does
    not have permission to stat them (#121).

    !end-bullet!
-   !begin-bullet!
    compatibility with upcoming gcc 8 based Windows toolchain (#119)

    !end-bullet!

!end-bullets-24!

# fs 1.2.3

## Features

!begin-bullets-25!

-   !begin-bullet!
    Experimental support for `/` and `+` methods for `fs_path` objects
    (#110).

    !end-bullet!
-   !begin-bullet!
    `file_create()` and `dir_create()` now take `...`, which is passed
    to `path()` to make construction a little nicer (#80).

    !end-bullet!

!end-bullets-25!

## Bugfixes

!begin-bullets-26!

-   !begin-bullet!
    `path_ext()`, `path_ext_set()` and `path_ext_remove()` now handle
    paths with directories including hidden files without extensions
    (#92).

    !end-bullet!
-   !begin-bullet!
    `file_copy()` now copies files into the directory if the target is a
    directory (#102).

    !end-bullet!

!end-bullets-26!

# fs 1.2.2

## Features

!begin-bullets-27!

-   !begin-bullet!
    fs no longer needs a C++11 compiler, it now works with compilers
    which support only C++03 (#90).
    !end-bullet!

!end-bullets-27!

## Bugfixes

!begin-bullets-28!

-   !begin-bullet!
    `fs_path` `fs_bytes` and `fs_perm` objects now use
    `methods::setOldClass()` so that S4 dispatch to their base classes
    works as intended (#91).

    !end-bullet!
-   !begin-bullet!
    Fix allocation bug in `path_exists()` using `delete []` when we
    should have used `free()`.

    !end-bullet!

!end-bullets-28!

# fs 1.2.1

## Features

!begin-bullets-29!

-   !begin-bullet!
    `path_abs()` gains a `start` argument, to specify where the absolute
    path should be calculated from (#87).
    !end-bullet!

!end-bullets-29!

## Bugfixes

!begin-bullets-30!

-   !begin-bullet!
    `path_ext()` now returns `character()` if given 0 length inputs
    (#89)

    !end-bullet!
-   !begin-bullet!
    Fix for a memory issue reported by ASAN and valgrind.

    !end-bullet!

!end-bullets-30!

# fs 1.2.0

## Breaking changes

!begin-bullets-31!

-   !begin-bullet!
    `path_expand()` and `path_home()` now use `USERPROFILE` or
    `HOMEDRIVE`/`HOMEPATH` as the user home directory on Windows. This
    differs from the definition used in `path.expand()` but is
    consistent with definitions from other programming environments such
    as python and rust. This is also more compatible with external tools
    such as git and ssh, both of which put user-level files in
    `USERPROFILE` by default. To mimic R's (and previous) behavior there
    are functions `path_expand_r()` and `path_home_r()`.

    !end-bullet!
-   !begin-bullet!
    Handling missing values are more consistent. In general `is_*`
    functions always return `FALSE` for missing values, `path_*`
    functions always propagate NA values (NA inputs become NA outputs)
    and `dir_*` `file_*` and `link_*` functions error with NA inputs.

    !end-bullet!
-   !begin-bullet!
    fs functions now preserve tildes in their outputs. Previously paths
    were always returned with tildes expanded. Users can use
    `path_expand()` to expand tildes if desired.

    !end-bullet!

!end-bullets-31!

## Bugfixes

!begin-bullets-32!

-   !begin-bullet!
    Fix crash when a files user or group id did not exist in the
    respective database (#84, #58)
    !end-bullet!
-   !begin-bullet!
    Fix home expansion on systems without readline (#60).
    !end-bullet!
-   !begin-bullet!
    Fix propagation of NA values in `path_norm()` (#63).
    !end-bullet!

!end-bullets-32!

## Features

!begin-bullets-33!

-   !begin-bullet!
    `file_chmod()` is now vectorized over both of its arguments (#71).
    !end-bullet!
-   !begin-bullet!
    `link_create()` now fails silently if an identical link already
    exists (#77).
    !end-bullet!
-   !begin-bullet!
    `path_package()` function created as an analog to `system.file()`
    which always fails if the package or file does not exist (#75)
    !end-bullet!

!end-bullets-33!

# fs 1.1.0

## Breaking changes

!begin-bullets-34!

-   !begin-bullet!
    Tidy paths no longer expand `~`.

    !end-bullet!
-   !begin-bullet!
    Filesystem modification functions now error for NA inputs. (#48)

    !end-bullet!
-   !begin-bullet!
    `path()` now returns 0 length output if given any 0 length inputs
    (#54).

    !end-bullet!

!end-bullets-34!

## New features

!begin-bullets-35!

-   !begin-bullet!
    Removed the autotool system dependency on non-windows systems.
    !end-bullet!

!end-bullets-35!

## Bugfixes

!begin-bullets-36!

-   !begin-bullet!
    `dir_delete()` now correctly expands paths (#47).

    !end-bullet!
-   !begin-bullet!
    `dir_delete()` now correctly deletes hidden files and directories
    (#46).

    !end-bullet!
-   !begin-bullet!
    `link_path()` now checks for an error before trying to make a
    string, avoiding a crash (#43).

    !end-bullet!
-   !begin-bullet!
    libuv return paths now marked as UTF-8 strings in C code, fixing
    encoding issues on windows. (#42)

    !end-bullet!
-   !begin-bullet!
    `dir_copy()` now copies the directory inside the target if the
    target is a directory (#51).

    !end-bullet!
-   !begin-bullet!
    `dir_copy()` now works correctly with absolute paths and no longer
    removes files when `overwrite = TRUE`.

    !end-bullet!

!end-bullets-36!

# fs 1.0.0

!begin-bullets-37!

-   !begin-bullet!
    Removed the libbsd system dependency on linux
    !end-bullet!
-   !begin-bullet!
    Initial release
    !end-bullet!
-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.
    !end-bullet!

!end-bullets-37!

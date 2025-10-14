# reticulate (development version)

!begin-bullets-1!

-   !begin-bullet!
    Reticulate now clears its cache automatically every 120 days.
    Configure the interval in `.Rprofile` with:
    `options(reticulate.max_cache_age = as.difftime(30, units = "days"))`.

    !end-bullet!
-   !begin-bullet!
    `install_miniconda()` now installs miniforge instead of miniconda
    (#1800, #1820).

    !end-bullet!
-   !begin-bullet!
    New helpers for reading and writing requirements files,
    `py_write_requirements()` and `py_read_requirements()` (#1846).

    !end-bullet!
-   !begin-bullet!
    Adds support for requesting Python versions with a wildcard pattern
    `x.x.*` such as `==3.12.*` in `virtualenv_starter()`,
    `py_require()`, and related functions (#1825)

    !end-bullet!
-   !begin-bullet!
    Restored compatability with `uv` versions \>= 0.8.0 (#1818).

    !end-bullet!
-   !begin-bullet!
    `py_require()` now gives a better message when a user erroneously
    declares a module from the Python standard library as a required
    package (@lazappi, #1788)

    !end-bullet!
-   !begin-bullet!
    Positron's reticulate integration will now be automatically enabled
    when the reticulate package is loaded in Positron (#1822).

    !end-bullet!
-   !begin-bullet!
    `with()` now forwards errors to Python context manager exit handlers
    (e.g., so database transactions can roll back cleanly) (#1840,
    #1841)

    !end-bullet!
-   !begin-bullet!
    Fixed `!!` in string literals being wrongly expanded to a `%system`
    magic in `repl_python()`. Added support for assigning `%system`
    command output to multiple variables via unpacking (#1844).

    !end-bullet!

!end-bullets-1!

# reticulate 1.43.0

!begin-bullets-2!

-   !begin-bullet!
    Fixed usage of micromamba and mamba, next-generation conda
    environment management tools. reticulate now prefers to use
    micromamba, mamba, then conda when managing environments (@gdevenyi,
    #1771).

    !end-bullet!
-   !begin-bullet!
    Added `str()`, `dim()`, and `t()` S3 methods for NumPy Arrays.

    !end-bullet!
-   !begin-bullet!
    Fixed a segfault observed on R session exit (#1785, #1786).

    !end-bullet!
-   !begin-bullet!
    Added check in `install_miniconda()` if existing files will be
    overwritten. (#1794, #1796)

    !end-bullet!
-   !begin-bullet!
    Fixed error in `install_python()` under R 4.5 when the requested
    Python version has a `":latest"` suffix, as it does by default.
    (#1792, #1797)

    !end-bullet!
-   !begin-bullet!
    Fixed error in `get_python_conda_info()` when conda not found
    through `conda-meta/history` and `NULL` is passed to `normalizePath`
    (#1184)

    !end-bullet!
-   !begin-bullet!
    Hotfix to pin `uv` version resolved by reticulate to `<0.8.0`.
    (#1812)

    !end-bullet!
-   !begin-bullet!
    Python discovery by `uv` is much faster now. The internal utility
    `uv_python_list()` searches only for managed python environments by
    default. Users can request discovery of system pythons by setting
    `UV_PYTHON_PREFERENCE`. Also, `uv_python_list()` will now discover
    pyenv pythons and python binaries installed by `install_python()` if
    a system python is requested. (#1810)

    !end-bullet!

!end-bullets-2!

# reticulate 1.42.0

!begin-bullets-3!

-   !begin-bullet!
    Fixed an issue in RStudio on Windows where interrupts were ignored
    while Python code was executing (#1753).

    !end-bullet!
-   !begin-bullet!
    Updates for Positron to fix issues with `repl_python()` and
    Variables Pane (#1755).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `[` received Python objects as slice arguments.
    e.g., `x[start:end]` when `start` or `end` were Python objects
    (#1731).

    !end-bullet!
-   !begin-bullet!
    The `[` method will now translate symbol `..` to a Python Ellipsis
    `...`. (#1763)

    !end-bullet!
-   !begin-bullet!
    The `[` method can now accept index values greater than 2\^31
    (#1769)

    !end-bullet!
-   !begin-bullet!
    Reticulate-managed `uv` can now resolve system-installed Pythons,
    supporting platforms where pre-built binaries are unavailable, such
    as musl-based Alpine Linux (#1751, #1752).

    !end-bullet!
-   !begin-bullet!
    `uv_run_tool()` gains an `exclude_newer` argument (#1748).

    !end-bullet!
-   !begin-bullet!
    `py_register_load_hook()` is now exported to enable usage described
    in the "Using reticulate in an R package vignette" (#1754).
    https://rstudio.github.io/reticulate/articles/package.html

    !end-bullet!
-   !begin-bullet!
    Internal changes to support R-devel (4.5) and R API updates (#1747,
    #1774).

    !end-bullet!
-   !begin-bullet!
    Internal fixes to prevent reticulate-managed `uv` from writing
    outside reticulates cache directory (#1745).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue with pointing reticulate at a pyenv shim python
    (#1758)

    !end-bullet!

!end-bullets-3!

# reticulate 1.41.0

!begin-bullets-4!

-   !begin-bullet!
    New `py_require()` function for declaring Python requirements for
    the current R session. For details, see updated vignettes and help:

    !begin-bullets-5!
    -   !begin-bullet!
        Installing Python Packages:
        https://rstudio.github.io/reticulate/dev/articles/python_packages.html
        !end-bullet!
    -   !begin-bullet!
        Using reticulate in an R Package:
        https://rstudio.github.io/reticulate/dev/articles/package.html
        !end-bullet!
    -   !begin-bullet!
        `py_require()` help:
        https://rstudio.github.io/reticulate/dev/reference/py_require.html
        !end-bullet!

    !end-bullets-5!
    !end-bullet!
-   !begin-bullet!
    New `uv_run_tool()` function for running command line tools
    distributed via Python packages.

    !end-bullet!
-   !begin-bullet!
    Raw R arrays and NumPy arrays with dtype "V1" ("void8") now convert
    between each other. Use `r_to_py(as.array(x))` to efficiently
    convert raw vectors to NumPy arrays, and `py_to_r(array$view("V1"))`
    to efficiently convert NumPy arrays to raw vectors. (#1734)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue with using Python 3.12 on Linux (#1712, #1714).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `virtualenv_starter()` would not discover a
    custom built Python (#1704).

    !end-bullet!

!end-bullets-4!

# reticulate 1.40.0

!begin-bullets-6!

-   !begin-bullet!
    The S3 classes for some (rarely encountered) Python objects have
    changed. Only Python objects with non-standard `__module__` values
    are affected. If a Python object's parent class's `__module__`
    attribute does not resolve to a string, reticulate:

    !begin-bullets-7!
    -   !begin-bullet!
        Attempts to resolve it from the class's class, if it's a
        metaclass.
        !end-bullet!
    -   !begin-bullet!
        If no string can be resolved, reticulate no longer implicitly
        prepends 'python.builtin.' as the class prefix, instead it uses
        just the `__name__`. (See #1686 for more context)
        !end-bullet!

    !end-bullets-7!
    !end-bullet!
-   !begin-bullet!
    Added support for Python 3.13. Note that Python 3.13 removed support
    for `classmethod` descriptors, which may affect the S3 class of some
    Python objects that use metaclass properties to resolve a class's
    `__module__` or `__name__` attribute. (#1686, #1698)

    !end-bullet!
-   !begin-bullet!
    `py_is_null_xptr()` and `[[` now load delayed modules (#1688).

    !end-bullet!
-   !begin-bullet!
    Fixed error when attempting to use a python venv created with `uv`
    (#1678)

    !end-bullet!
-   !begin-bullet!
    Resolved an issue where `py_discover_config()` attempted to detect
    Windows App Store Python installations. These are now excluded from
    discovery by both `py_discover_config()` and `virtualenv_starter()`
    (#1656, #1673).

    !end-bullet!
-   !begin-bullet!
    Fixed an error when converting an empty NumPy char array to R
    (#1662).

    !end-bullet!
-   !begin-bullet!
    Fixed an error when using reticulate with radian (#1668, #1670).

    !end-bullet!
-   !begin-bullet!
    Fixed a segfault encountered when running the Python session
    finalizer (#1663, #1664).

    !end-bullet!
-   !begin-bullet!
    Resolved a segfault in RStudio when rapidly switching between R and
    Python chunks in a Quarto document (#1665).

    !end-bullet!
-   !begin-bullet!
    Improved behavior when the conda binary used to create an
    environment cannot be resolved (contributed by @tl-hbk, #1654,
    #1659).

    !end-bullet!
-   !begin-bullet!
    Added Positron support for the Variables Pane and `repl_python()`
    (#1692, #1641, #1648, #1658, #1681, #1687).

    !end-bullet!

!end-bullets-6!

# reticulate 1.39.0

!begin-bullets-8!

-   !begin-bullet!
    Python background threads can now run in parallel with the R session
    (#1641).

    !end-bullet!
-   !begin-bullet!
    `py_main_thread_func()` is deprecated; every R function can now
    safely be called from background Python threads (#1648).

    !end-bullet!
-   !begin-bullet!
    Calls from Python threads into R now notify the main thread using
    R's native event loop, ensuring that these calls are handled even
    when the main thread is engaged in non-Python tasks (#1648).

    !end-bullet!
-   !begin-bullet!
    The knitr engine now avoids overwriting Altair's default chart
    dimensions with the values of `ut.width.px` and `ut.height.px`. Use
    `altair.fig.height`, `altair.fig.width`, or Altair's `width` and
    `height` parameters to adjust chart dimensions (contributed by
    @joelostblom, #1646).

    !end-bullet!
-   !begin-bullet!
    New `as.character()` method for `python.builtin.str` with support
    for handling embedded NULs in strings (#1653).

    !end-bullet!
-   !begin-bullet!
    New `as.raw()` method for `python.builtin.bytes` (#1649, #1652).

    !end-bullet!
-   !begin-bullet!
    `as.character()` method for `python.builtin.bytes` gains a `nul`
    argument, allowing for convenient handling of embedded NULs in the
    string (#1652).

    !end-bullet!
-   !begin-bullet!
    Reticulate now uses the `RETICULATE_VIRTUALENV_ROOT` environment
    variable when determining where to resolve virtual environments
    (#1657).

    !end-bullet!
-   !begin-bullet!
    `conda_run2()` is now exported (contributed by @dramanica, #1637).

    !end-bullet!
-   !begin-bullet!
    The Python session is now finalized when the R session exits
    (#1648).

    !end-bullet!
-   !begin-bullet!
    Internal updates for NumPy 2.1 (#1651).

    !end-bullet!
-   !begin-bullet!
    Fixed error when importing a module named `config` (#1628).

    !end-bullet!
-   !begin-bullet!
    Fixes for CRAN check failures on macOS-oldrel (#1645).

    !end-bullet!
-   !begin-bullet!
    Fixed an error where opening a Python subprocess in Positron on
    Windows resulted in "OSError: \[WinError 6\] The handle is invalid."
    (#1658, posit-dev/positron#4457).

    !end-bullet!

!end-bullets-8!

# reticulate 1.38.0

!begin-bullets-9!

-   !begin-bullet!
    Python Exceptions converted to R conditions are now R lists instead
    of R environments, for compatability with {rlang} and {purrr}.
    (tidyverse/purrr#1104, r-lib/rlang#1664, #1617)

    !end-bullet!
-   !begin-bullet!
    Internal updates for NumPy 2.0 (#1621)

    !end-bullet!
-   !begin-bullet!
    Added support for converting NumPy StringDType arrays to R character
    arrays. (#1623)

    !end-bullet!
-   !begin-bullet!
    Internal updates for compliance with R's upcoming formalized C API.
    (#1625)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempting to convert a NumPy array with a
    non-simple dtype to R would signal an error. (#1613, fixed in
    #1614).

    !end-bullet!

!end-bullets-9!

# reticulate 1.37.0

!begin-bullets-10!

-   !begin-bullet!
    Interrupting Python no longer leads to segfaults. (#1601, fixed in
    #1602)

    !end-bullet!
-   !begin-bullet!
    Print method for Python callables now includes the callable's
    signature. (#1605, #1607)

    !end-bullet!
-   !begin-bullet!
    Reticulate now installs successfully on Windows ARM64. (#1609,
    contributed by @andrjohns)

    !end-bullet!
-   !begin-bullet!
    `virtualenv_starter()` no longer warns when encountering broken
    symlinks. (#1598)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where configuration for reticulate `conda_*`
    functions to use the executable `mamba` instead of `conda` was
    ignored. (#1608, contributed by @AlexandreGuinaudeau)

    !end-bullet!

!end-bullets-10!

# reticulate 1.36.1

!begin-bullets-11!

-   !begin-bullet!
    Fix issue where `py_to_r()` method for Pandas DataFrames would error
    if `py_to_r()` S3 methods were defined for Pandas subtypes, (as done
    by {anndata}) (#1591).

    !end-bullet!
-   !begin-bullet!
    "Python Dependencies" vignette edits (@salim-b, #1586)

    !end-bullet!
-   !begin-bullet!
    Added an option for extra command-line arguments in `conda_create()`
    and `conda_install()` (#1585).

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `conda_install()` would ignore user-specified
    channels during Python installation (#1594).

    !end-bullet!

!end-bullets-11!

# reticulate 1.36.0

!begin-bullets-12!

-   !begin-bullet!
    Internal refactoring and optimizations now give a faster experience,
    especially for workflows that frequently access Python objects
    from R. For example, simple attribute access like `sys$path` is
    \~2.5x times faster, and a sample workload of
    `py_to_r(np_array(1:3) + np_array(1:3))` benchmarks \~3.5x faster
    when compared to the previous CRAN release.

    !end-bullet!
-   !begin-bullet!
    Fixed issue where callable python objects created with
    `convert = FALSE` would not be wrapped in an R function (#1522).

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `py_to_r()` S3 methods would not be called on
    arguments supplied to R functions being called from Python (#1522).

    !end-bullet!
-   !begin-bullet!
    `install_python()` will now build optimized versions of Python on
    macOS and Linux (#1567)

    !end-bullet!
-   !begin-bullet!
    Default Python version installed by `install_python()` is now 3.10
    (was 3.9) (#1574).

    !end-bullet!
-   !begin-bullet!
    Output of `reticulate::py_last_error()` now includes a hint, showing
    how to access the full R call stack (#1572).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where nested `py_capture_output()` calls result in a
    lost reference to the original `sys.stdout` and `sys.stderr`,
    resulting in no further visible output from Python, and eventually,
    a segfault. (#1564)

    !end-bullet!
-   !begin-bullet!
    Fixed issues reported by rchk, as requested by CRAN (#1581).

    !end-bullet!
-   !begin-bullet!
    `py_to_r(x)` now returns `x` unmodified if `x` is not a Python
    object, instead of signaling an error.

    !end-bullet!
-   !begin-bullet!
    New `as.data.frame()` method exported for Python Polars DataFrames
    (#1568)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where printing a delayed module
    (`import("foo", delay_load = TRUE)`) would output `<pointer: 0x0>`.

    !end-bullet!
-   !begin-bullet!
    `py_validate_xptr()` will now attempt to resolve delayed modules
    before signaling an error (#1561).

    !end-bullet!
-   !begin-bullet!
    R packages can now express multiple preferred Python environments to
    search for and use if they exist, by supplying a character vector to
    `import()`:
    `import("foo", delay_load = list(environment = c("r-foo", "r-bar")))`
    (#1559)

    !end-bullet!
-   !begin-bullet!
    Reticulate will no longer warn about ignored
    `use_python(,required = FALSE)` calls (#1562).

    !end-bullet!
-   !begin-bullet!
    `reticulate` now prefers using the agg matplotlib backend when the R
    session is non-interactive. The backend can also be overridden via
    the `MPLBACKEND` or `RETICULATE_MPLBACKEND` environment variables
    when necessary (#1556).

    !end-bullet!
-   !begin-bullet!
    `attr(x, "tzone")` attributes are (better) preserved when converting
    POSIXt to Python. POSIXt types with a non-empty `tzone` attr convert
    to a `datetime.datetime`, otherwise they convert to NumPy
    `datetime64[ns]` arrays.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where calling `py_set_item()` on a subclassed dict
    would not invoke a custom `__setitem__` method.

    !end-bullet!
-   !begin-bullet!
    `py_del_attr(x, name)` now returns `x` invisibly

    !end-bullet!
-   !begin-bullet!
    `source_python()` no longer exports the `r` symbol to the R global
    environment. (the "R Interface Object" that is used by Python code
    get a reference to the R `globalenv()`)

    !end-bullet!
-   !begin-bullet!
    Fixed hang encountered (sometimes) when attempting to call
    `iterate()` on an exhausted `py_iterator()` object multiple times
    (#1539).

    !end-bullet!
-   !begin-bullet!
    `iterate(simplify=TRUE)` rewritten in C for speed improvements
    (#1539).

    !end-bullet!
-   !begin-bullet!
    Update for Pandas 2.2 deprecation of `Index.format()` (#1537,
    #1538).

    !end-bullet!
-   !begin-bullet!
    Updates for CRAN R-devel (R 4.4) (#1554).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `py_discover_config()` would discover `python`
    (v2) on the PATH in preference of `python3` on the PATH. (#1547)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate would error when using conda
    environments created with the (new) `conda env create` command.
    (#1535, #1543)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate would error when using a conda
    environment where the original conda binary that was used to create
    the environment is no longer available (#1555)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where a user would be unable to accept the prompt to
    create the default "r-reticulate" venv (#1557).

    !end-bullet!
-   !begin-bullet!
    `is_py_object()` is now exported (#1573).

    !end-bullet!

!end-bullets-12!

# reticulate 1.35.0

!begin-bullets-13!

-   !begin-bullet!
    Subclassed Python list and dict objects are no longer automatically
    converted to R vectors. Additionally, the S3 R `class` attribute for
    Python objects is now constructed using the Python `type(object)`
    directly, rather than from the `object.__class__` attribute. See
    #1531 for details and context.

    !end-bullet!
-   !begin-bullet!
    R external pointers (EXTPTRSXP objects) now round-trip through
    `py_to_r(r_to_py(x))` successfully. (reported in #1511, fixed in
    #1519, contributed by @llaniewski).

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `virtualenv_create()` would error on Ubuntu 22.04
    when using the system python as a base. (#1495, fixed in #1496).

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `csc_matrix` objects with unsorted indices could
    not be converted to a dgCMatrix. (related to #727, fixed in #1524,
    contributed by @rcannood).

    !end-bullet!
-   !begin-bullet!
    Added support for partially unexpanded variables like `$USER` in
    `XDG_DATA_HOME` and similar (#1513, #1514)

    !end-bullet!

!end-bullets-13!

## Knitr Python Engine Changes:

!begin-bullets-14!

-   !begin-bullet!
    The knitr python engine now formats captured python exceptions to
    include the exception type and any exception notes when chunk
    options `error = TRUE` is set (reported in #1520, fixed in #1527).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the knitr python engine would fail to include
    figures from python chunks if a custom `root.dir` chunk option was
    set. (reported in #1526, fixed in #1529)

    !end-bullet!
-   !begin-bullet!
    knitr engine gains the ability to save chunk figures in multiple
    files/formats (Contributed by @Rumengol in #1507)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where matplotlib figures generated in the initial
    chunk where matplotlib was first imported would be the wrong size
    (reported in #1523, fixed in #1530)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the knitr engine would not correctly display
    altair compound charts if more than one were present in a document
    (#1500, #1532).

    !end-bullet!

!end-bullets-14!

# reticulate 1.34.0

# reticulate 1.33.0

!begin-bullets-15!

-   !begin-bullet!
    Fixed issue where `asyncio`, (and modules that use `asyncio`), would
    error on Windows when running under RStudio (#1478, #1479).

    !end-bullet!
-   !begin-bullet!
    Added compatability with Python 3.12.

    !end-bullet!
-   !begin-bullet!
    `condaenv_exists()` is now exported.

    !end-bullet!

!end-bullets-15!

# reticulate 1.32.0

!begin-bullets-16!

-   !begin-bullet!
    reticulate now supports casting R data.frames to Pandas data.frames
    using nullable data types, allowing users to preserve NA's from R
    atomic vectors. This feature is opt-in and can be enabled by setting
    the R option `reticulate.pandas_use_nullable_dtypes` to `TRUE`.
    (#1439)

    !end-bullet!
-   !begin-bullet!
    reticulate now exports a `chooseOpsMethod()` method, allowing for
    Ops dispatch to more specialized Ops methods defined for Python
    objects.

    !end-bullet!
-   !begin-bullet!
    `py_discover_config()` will now warn instead of error upon
    encountering a broken Python installation. (#1441, #1459)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where Python would raise exception "OSError: \[WinError
    6\] The handle is invalid" when opening a subprocess while running
    in Rstudio on Windows. (#1448, #518)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where the multiprocessing Python module would crash or
    hang when spawning a `Process()` on Windows. (#1430, #1346, fixed in
    #1461)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `virtualenv_create()` would fail to discover a
    'virtualenv' module in the system Python installation on Ubuntu.
    Reticulate will no longer discover and attempt to use the `venv`
    module stub present on Ubuntu systems where the `python3-venv` apt
    package has not been installed. (mlverse/pysparklyr#11, #1437,
    #1455)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where the user was prompted to create an 'r-reticulate'
    venv in the RStudio IDE before reticulate was requested to
    initialize Python. (#1450, #1456)

    !end-bullet!
-   !begin-bullet!
    Improved error message when reticulate attempts to initialize a
    virtual environment after the Python installation it was created
    from is no longer available. (#1149, #1457)

    !end-bullet!
-   !begin-bullet!
    Improved error message on Fedora when attempting to create a virtual
    environment from the system python before running
    `dnf install python3-pip`.

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `install_python()` on macOS in the RStudio IDE
    would fail to discover and use brew for Python build dependencies.

    !end-bullet!
-   !begin-bullet!
    Fixed error with `virtualenv_create(python = "/usr/bin/python")` on
    centos7. (#1467)

    !end-bullet!

!end-bullets-16!

# reticulate 1.31

## Python Installation Management

!begin-bullets-17!

-   !begin-bullet!
    reticulate will no longer prompt users to install miniconda.
    Instead, reticulate will now prompt users to create a default
    `r-reticulate` venv.

    !end-bullet!
-   !begin-bullet!
    The search that reticulate conducts to select which Python
    installation to load has changed. See the updated Python "Order of
    Discover" in the "versions" vignette.
    `vignette("versions", package = "reticulate")`.

    !end-bullet!
-   !begin-bullet!
    Updated recommendations in the "python_dependencies" vignette for
    how R packages can approach Python dependency management.
    `vignette("python_dependencies", package = "reticulate")`

    !end-bullet!
-   !begin-bullet!
    New function `virtualenv_starter()`, which can be used to find a
    suitable python binary for creating a virtual environment. This is
    now the default method for finding the python binary when calling
    `virtualenv_create(version = <version>)`.

    !end-bullet!
-   !begin-bullet!
    `virtualenv_create()` and `virtualenv_install()` gain a
    `requirements` argument, accepting a filepath to a python
    requirements file.

    !end-bullet!
-   !begin-bullet!
    `virtualenv_create()` gains a `force` argument.

    !end-bullet!
-   !begin-bullet!
    `virtualenv_install()` gains a `python_version` argument, allowing
    users to customize which python version is used when bootstrapping a
    new virtual environment.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the list of available python versions used by
    `install_python()` would be out-of-date.

    !end-bullet!
-   !begin-bullet!
    `install_python()` now gives a better error message if git is not
    installed.

    !end-bullet!
-   !begin-bullet!
    `install_python()` on macOS will now will use brew, if it's
    available, to install build dependencies, substantially speeding up
    python build times.

    !end-bullet!
-   !begin-bullet!
    New function `conda_search()`, contributed by @mkoohafkan in PR
    #1364.

    !end-bullet!

!end-bullets-17!

## Language

!begin-bullets-18!

-   !begin-bullet!
    New `[` and `[<-` methods that invoke Python `__getitem__`,
    `__setitem__` and `__delitem__`. The R generics `[` and `[<-` now
    accept python-style slice syntax like `x[1:2:3]`. See examples in
    `?py_get_item`.

    !end-bullet!
-   !begin-bullet!
    `py_iterator()` gains a `prefetch` argument, primarily to avoid
    deadlocks where the main thread is blocked, waiting for the
    iterator, which is waiting to run on the main thread, as encountered
    in TensorFlow/Keras. (#1405).

    !end-bullet!
-   !begin-bullet!
    String columns from Pandas data frames containing `None`, `pd.NA` or
    `np.nan` are now simplified into character vectors and missing
    values replaced by `NA` (#1428).

    !end-bullet!
-   !begin-bullet!
    Converting from Pandas data frames containing columns with Pandas
    nullable data types are now correctly converted into R data.frames
    preserving the missing values (#1427).

    !end-bullet!

!end-bullets-18!

## Knitr

!begin-bullets-19!

-   !begin-bullet!
    The knitr engine gains a `jupyter_compat` option, enabling
    reticulate to better match the behavior of Jupyter. When this chunk
    option is set to `TRUE`, only the return value from the last
    expression in a chunk is auto-printed. (#1391, #1394, contributed by
    @matthew-brett)

    !end-bullet!
-   !begin-bullet!
    The knitr engine now more reliably detects and displays matplotlib
    pending plots, without the need for a matplotlib artist object to be
    returned as a top-level expression. E.g., the knitr engine will now
    display plots when the matplotlib api returns something other than
    an artist object, (`plt.bar()`), or the matplotlib return value is
    not auto-printed due to being assigned, (`x = plt.plot()`), or
    suppressed with a `;`, (`plt.plot();`). (#1391, #1401, contributed
    by @matthew-brett)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where knitr engine would not respect chunk options
    `fig.width` / `fig.height` when rendering matplotlib plots. (#1398)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the reticulate knitr engine would not capture
    output printed from python. (PR #1412, fixing #1378, #331)

    !end-bullet!

!end-bullets-19!

## Miscellanous

!begin-bullets-20!

-   !begin-bullet!
    Reticulate now periodically flushes python `stdout` and `stderr`
    buffers even while the main thread is blocked executing Python code.
    Streaming output from a long-running Python function call will now
    appear in the R console while the Python function is still
    executing. (Previously, output might not appear until the Python
    function had finished and control of the main thread had returned to
    R).

    !end-bullet!
-   !begin-bullet!
    Updated sparse matrix conversion routines for compatibility with
    scipy 1.11.0.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where a py capsule finalizer could access the R API
    from a background thread. (#1406)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where R would segfault (crash) in long-lived R sessions
    where both rpy2 and reticulate were in use (#1236).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where exceptions from reticulate would not be
    formatted properly when running tests under testthat
    (r-lib/rlang#1637, #1413).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `py_get_attr(silent = TRUE)` would not return
    an R `NULL`, if the attribute was missing, as documented. (#1413)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `py_get_attr(silent = TRUE)` would leave a
    python global exception set if the attribute was missing, resulting
    in fatal errors when running python under debug mode. (#1396)

    !end-bullet!

!end-bullets-20!

# reticulate 1.30

!begin-bullets-21!

-   !begin-bullet!
    Fix compilation error on R 3.5. Bump minimum R version dependency to
    3.5.
    !end-bullet!

!end-bullets-21!

# reticulate 1.29

### Exceptions and Errors:

!begin-bullets-22!

-   !begin-bullet!
    R error information (call, message, other attributes) is now
    preserved as an R error condition traverses the R \<-\> Python
    boundary.

    !end-bullet!
-   !begin-bullet!
    Python Exceptions now inherit from `error` and `condition`, and can
    be passed directly to `base::stop()` to signal an error in R and
    raise an exception in Python.

    !end-bullet!
-   !begin-bullet!
    Raised Python Exceptions are now used directly to signal an R error.
    For example, in the following code, `e` is now an object that
    inherits from `python.builtin.Exception` as well as `error` and
    `condition`:
    `r     e <- tryCatch(py_func_that_raises_exception(),                   error = function(e) e)`
    Use `base::conditionCall()` and `base::conditionMessage()` to access
    the original R call and error message.

    !end-bullet!
-   !begin-bullet!
    `py_last_error()` return object contains `r_call`, `r_trace` and/or
    `r_class` if the Python Exception was raised by an R function called
    from Python.

    !end-bullet!
-   !begin-bullet!
    The hint to run `reticulate::py_last_error()` after an exception is
    now clickable in the RStudio IDE.

    !end-bullet!
-   !begin-bullet!
    Filepaths to Python files in the print output from `py_last_error()`
    are now clickable links in the RStudio IDE.

    !end-bullet!
-   !begin-bullet!
    Python exceptions encountered in `repl_python()` are now printed
    with the full Python traceback by default. In the RStudio IDE,
    filepaths in the tracebacks are rendered as clickable links. (#1240)

    !end-bullet!

!end-bullets-22!

### Language:

!begin-bullets-23!

-   !begin-bullet!
    Converted Python callables gain support for dynamic dots from the
    rlang package. New features:

    !begin-bullets-24!
    -   !begin-bullet!
        splicing (unpacking) arguments: `fn(!!!kwargs)`
        !end-bullet!
    -   !begin-bullet!
        dynamic names: `nm <- "key"; fn("{nm}" := value)`
        !end-bullet!
    -   !begin-bullet!
        trailing commas ignored (matching Python syntax): `fn(a, )`
        identical to `fn(a)`
        !end-bullet!

    !end-bullets-24!
    !end-bullet!
-   !begin-bullet!
    New Ops group generics for Python objects: `+`, `-`, `*`, `/`, `^`,
    `%%`, `%/%`, `&`, `|`, `!`, `%*%`. Methods for all the Ops group
    generics are now defined for Python objects. (#1187, #1363) E.g.,
    this now works:

    !begin-codeblock!
    ``` r
    np <- reticulate::import("numpy", convert = FALSE)
    x <- np$array(1:5)
    y <- np$array(6:10)
    x + y
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Fixed two issues with R comparison operator methods (`==`, `!=`,
    `<`, `<=`, `>=`, `>`):

    !begin-bullets-25!
    -   !begin-bullet!
        The operators no longer error on Python objects that define
        "rich comparison" Python methods that don't return a single
        bool. (e.g., numpy arrays).
        !end-bullet!
    -   !begin-bullet!
        The operators now respect the 'convert' value of the supplied
        Python objects. Note, this may be a breaking change as, e.g,
        `==`, may now no long return an R scalar logical if one of the
        Python object being compared was created with `convert = FALSE`.
        Wrap the result of the comparison with `py_bool()` to restore
        the previous behavior. (#1187, #1363)
        !end-bullet!

    !end-bullets-25!
    !end-bullet!
-   !begin-bullet!
    R functions wrapping Python callables now have formals matching
    those of the Python callable signature, enabling better
    autocompletion in more contexts (#1361).

    !end-bullet!
-   !begin-bullet!
    new `nameOfClass()` S3 method for Python types, enabling usage:
    `base::inherits(x, <python-type-object>)` (requires R \>= 4.3.0)

    !end-bullet!
-   !begin-bullet!
    `py_run_file()` and `source_python()` now prepend the script
    directory to the Python module search path, `sys.path`, while the
    requested script is executing. This allows the Python scripts to
    resolve imports of modules defined in the script directory, matching
    the behavior of `python <script>` at the command line. (#1347)

    !end-bullet!

!end-bullets-23!

### knitr:

!begin-bullets-26!

-   !begin-bullet!
    The knitr engine now suppresses warnings from Python code if
    `warning=FALSE` is set in the chunk options. (quarto-dev/quarto#125,
    #1358)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where reticulate's knitr engine would attach comments in
    a code chunk to the wrong code chunk (requires Python\>=3.8)
    (#1223).

    !end-bullet!
-   !begin-bullet!
    The knitr Python engine now respects the `strip.white` option
    (#1273).

    !end-bullet!
-   !begin-bullet!
    Fixed issue where the knitr engine would show an additional plot
    from a chunk if the user called `matplotlib.pyplot.show()` (#1380,
    #1383)

    !end-bullet!

!end-bullets-26!

### Misc:

!begin-bullets-27!

-   !begin-bullet!
    `py_to_r()` now succeeds when converting subtypes of the built-in
    types (e.g. `list`, `dict`, `str`). (#1352, #1348, #1226, #1354,
    #1366)

    !end-bullet!
-   !begin-bullet!
    New `pillar::type_sum()` method now exported for Python objects.
    That ensures the full object class name is printing in R tracebacks
    and tibbles containing Python objects.

    !end-bullet!
-   !begin-bullet!
    `py_load_object()` gains a `convert` argument. If `convert = FALSE`,
    the returned Python object will not be converted to an R object.

    !end-bullet!
-   !begin-bullet!
    Fixed error `r_to_py()` with Pandas\>=2.0 and R data.frames with a
    factor column containing levels with `NA`.

    !end-bullet!
-   !begin-bullet!
    `r_to_py()` now succeeds for many additional types of R objects.
    Objects that reticulate doesn't know how to convert are presented to
    the Python runtime as a pycapsule (an opaque pointer to the
    underlying R object). Previously this would error. This allows for R
    code to pass R objects that cannot be safely converted to Python
    through the Python runtime to other R code. (e.g, to an R function
    called by Python code). (#1304)

    !end-bullet!
-   !begin-bullet!
    reticulate gains the ability to bind to micromamba Python
    installations (#1378, #1176, #1382, #1379, thanks to Zia Khan,
    @zia1138)

    !end-bullet!
-   !begin-bullet!
    Default Python version used by `install_miniconda()` and friends is
    now 3.9 (was 3.8).

    !end-bullet!

!end-bullets-27!

# reticulate 1.28

!begin-bullets-28!

-   !begin-bullet!
    Fixed issue where `source_python()` (and likely many other
    entrypoints) would error if reticulate was built with Rcpp 1.0.10.
    Exception and error handling has been updated to accommodate usage
    of `R_ProtectUnwind()`. (#1328, #1329).

    !end-bullet!
-   !begin-bullet!
    Fixed issue where reticulate failed to discover Python 3.11 on
    Windows. (#1325)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where reticulate would error by attempting to bind to a
    cygwin/msys2 installation of Python on Windows (#1325).

    !end-bullet!

!end-bullets-28!

# reticulate 1.27

!begin-bullets-29!

-   !begin-bullet!
    `py_run_file()` now ensures the `__file__` dunder is visible to the
    executing python code. (#1283, #1284)

    !end-bullet!
-   !begin-bullet!
    Fixed errors with `install_miniconda()` and `conda_install()`, on
    Windows (#1286, #1287, conda/conda#11795, #1312, #1297), and on
    Linux and macOS (#1306, conda/conda#10431)

    !end-bullet!
-   !begin-bullet!
    Fixed error when activating a conda env from a UNC drive on Windows
    (#1303).

    !end-bullet!

!end-bullets-29!

# reticulate 1.26

!begin-bullets-30!

-   !begin-bullet!
    Fixed issue where reticulate failed to bind to python2. (#1241,
    #1229)

    !end-bullet!
-   !begin-bullet!
    A warning is now issued when reticulate binds to python2 that
    python2 support will be removed in an upcoming reticulate release.

    !end-bullet!
-   !begin-bullet!
    `py_id()` now returns a character string, instead of an R integer
    (#1216).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `py_to_r()` would not convert elements of a
    dictionary (#1221).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where setting `RETICULATE_PYTHON` or
    `RETICULATE_PYTHON_FALLBACK` on Windows to the pyenv-win
    `python.bat` shim would result in an error (#1263).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `datetime.datetime` objects with a `tzinfo`
    attribute was not getting converted to R correctly (#1266).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where pandas `pandas.Categorical(,ordered=True)`
    Series were not correctly converted to an R ordered factor (#1234).

    !end-bullet!
-   !begin-bullet!
    The `reticulate` Python engine no longer halts on error for Python
    chunks containing parse errors when the `error=TRUE` chunk option is
    set. (#583)

    !end-bullet!
-   !begin-bullet!
    `install_python()` now leverages brew for python build dependencies
    like openssl@1.1 if brew is already installed and on the PATH,
    substantially speeding up `install_python()` on macOS systems with
    brew configured.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate would fail to bind to a conda
    environment on macOS or linux if conda installed a non-POSIX
    compliant activation script into the conda environment. (#1255)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the python knitr engine would error when
    printing to HTML a constructor of class instances with a
    `_repr_html_` or `to_html` method (e.g., `pandas.DataFrame`; #1249,
    #1250).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the python knitr engine would error when
    printing a plotly figure to an HTML document in some (head-less)
    linux environments (#1250).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `conda_install(pip=TRUE)` would install
    packages into a user Python library instead of the conda env if the
    environment variable `PIP_USER=true` was set. `py_install()`,
    `virtualenv_install()`, and `conda_install()` now always specify
    `--no-user` when invoking `pip install`. (#1209)

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `py_last_error()` would return unconverted Python
    objects (#1233)

    !end-bullet!
-   !begin-bullet!
    The Knitr engine now supports printing Python objects with
    `_repr_markdown_` methods. (via quarto-dev/quarto-cli#1501)

    !end-bullet!
-   !begin-bullet!
    `sys.executable` on Windows now correctly reports the path to the
    Python executable instead of the launching R executable. (#1258)

    !end-bullet!
-   !begin-bullet!
    The `sys` module is no longer automatically imported in `__main__`
    by reticulate.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue on Windows where reticulate would fail to find Python
    installations from pyenv installed via scoop.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `configure_environment()` would error on
    Windows. (#1247)

    !end-bullet!
-   !begin-bullet!
    Updated docs for compatibility with HTML5 / R 4.2.

    !end-bullet!
-   !begin-bullet!
    Updated r_to_py.sparseMatrix() method for compatibility with Matrix
    1.4-2.

    !end-bullet!

!end-bullets-30!

# reticulate 1.25

!begin-bullets-31!

-   !begin-bullet!
    Fixed an issue where reticulate would fail if R was running embedded
    under rpy2. reticulate now ensures the Python GIL is acquired before
    calling into Python. (#1188, #1203)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate would fail to bind to an ArcGIS Pro
    conda environment (#1200, @philiporlando).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate would fail to bind to an Anaconda
    base environment on Windows.

    !end-bullet!
-   !begin-bullet!
    All commands that create, modify, or delete a Python environment now
    echo the system command about to be executed. Affected:
    virtualenv\_{create,install,remove}
    conda\_{create,clone,remove,install,update} py_install

    !end-bullet!
-   !begin-bullet!
    `install_python()` and `create_virtualenv()` gain the ability to
    automatically select the latest patch of a requested Python version.
    e.g.: `install_python("3.9:latest")`,
    `create_virtualenv("my-env", version = "3.9:latest")`

    !end-bullet!
-   !begin-bullet!
    `install_python()` `version` arg gains default value of
    `"3.9:latest"`. `install_python()` can now be called with no
    arguments.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate would fail to bind to a conda python
    if the user didn't have write permissions to the conda installation
    (#1156).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate would fail to bind to a conda python
    if spaces were present in the file path to the associated conda
    binary (#1154).

    !end-bullet!
-   !begin-bullet!
    `use_python(, required = TRUE)` now issues a warning if the request
    will be ignored (#1150).

    !end-bullet!
-   !begin-bullet!
    New function `py_repr()` (#1157)

    !end-bullet!
-   !begin-bullet!
    `print()` and related changes (#1148, #1157):

    !begin-bullets-32!
    -   !begin-bullet!
        The default `print()` method for Python objects now invokes
        `py_repr()` instead of `str()`.
        !end-bullet!
    -   !begin-bullet!
        All Python objects gain a default `format()` method that invokes
        `py_str()`.
        !end-bullet!
    -   !begin-bullet!
        `py_str()` default method no longer strips the object memory
        address.
        !end-bullet!
    -   !begin-bullet!
        `print()` now returns the printed object invisibly, for
        composability with `%>%`.
        !end-bullet!

    !end-bullets-32!
    !end-bullet!
-   !begin-bullet!
    Exception handling changes (#1142, @t-kalinowski):

    !begin-bullets-33!
    -   !begin-bullet!
        R error messages from Python exceptions are now truncated
        differently to satisfy `getOption("warning.length")`. A hint to
        call `reticulate::py_last_error()` is shown if the exception
        message was truncated.

        !end-bullet!
    -   !begin-bullet!
        Python buffers `sys.stderr` and `sys.stdout` are now flushed
        when Python exceptions are raised.

        !end-bullet!

    !end-bullets-33!
    \-`py_last_error()`:

    !begin-bullets-34!
    -   !begin-bullet!
        Return object is now an S3 object 'py_error', includes a default
        print method.

        !end-bullet!
    -   !begin-bullet!
        The python Exception object ('python.builtin.Exception') is
        available as an R attribute.

        !end-bullet!
    -   !begin-bullet!
        Gains the ability to restore a previous exception if provided in
        a call `py_last_error(previous_error)`

        !end-bullet!
    -   !begin-bullet!
        Python traceback objects gain a default `format()` S3 method.

        !end-bullet!

    !end-bullets-34!
    !end-bullet!
-   !begin-bullet!
    Fixed `py_to_r()` for scipy matrices when scipy \>= 1.8.0, since
    sparse matrices are now deprecated.

    !end-bullet!
-   !begin-bullet!
    Fixed `r_to_py()` for small scipy matrices.

    !end-bullet!
-   !begin-bullet!
    New maintainer: Tomasz Kalinowski

    !end-bullet!

!end-bullets-31!

# reticulate 1.24

!begin-bullets-35!

-   !begin-bullet!
    Fixed an issue where `reticulate` would fail to bind to the system
    version of Python on macOS if command line tools were installed, but
    Xcode was not.
    !end-bullet!

!end-bullets-35!

# reticulate 1.23

!begin-bullets-36!

-   !begin-bullet!
    `use_condaenv()` gains the ability to accept an absolute path to a
    python binary for `envname`.

    !end-bullet!
-   !begin-bullet!
    All python objects gain a `length()` method, that returns either
    `py_len(x)`, or if that fails, `as.integer(py_bool(x))`.

    !end-bullet!
-   !begin-bullet!
    `conda_create()` default for `python_version` changed from `NULL` to
    `miniconda_python_version()` (presently, 3.8).

    !end-bullet!
-   !begin-bullet!
    New function `py_bool()`, for evaluating Python "truthiness" of an
    object.

    !end-bullet!
-   !begin-bullet!
    `reticulate` gains the function `py_list_packages()`, and can be
    used to list the Python modules available and installed in a
    particular Python environment. (#933)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now supports conversion of Python datatable objects.
    (#1081)

    !end-bullet!
-   !begin-bullet!
    `repl_python()` gains support for invoking select magic and system
    commands like `!ls` and `%cd <dir>`. See `?repl_python()` for
    details and examples.

    !end-bullet!
-   !begin-bullet!
    The development branch for `reticulate` has moved to the "main"
    branch.

    !end-bullet!
-   !begin-bullet!
    `reticulate` gains `reticulate::conda_update()`, for updating the
    version of `conda` in a particular `conda` installation.

    !end-bullet!
-   !begin-bullet!
    `reticulate` gains `reticulate::miniconda_uninstall()`, for
    uninstalling the reticulate-managed version of Miniconda. (#1077)

    !end-bullet!
-   !begin-bullet!
    `reticulate::use_python()` and friends now assume `required = TRUE`
    by default. For backwards compatibility, when `use_python()` is
    called as part of a package load hook, the default value will
    instead be `FALSE`.

    !end-bullet!
-   !begin-bullet!
    `reticulate` now provides support for Python environments managed by
    poetry. For projects containing a `pyproject.toml` file,
    `reticulate` will attempt to find and use the virtual environment
    managed by Poetry for that project. (#1031)

    !end-bullet!
-   !begin-bullet!
    The default version of Python used for the `r-reticulate` Miniconda
    environment installed via `reticulate::install_miniconda()` has
    changed from 3.6 to 3.8.

    !end-bullet!
-   !begin-bullet!
    `reticulate::install_miniconda()` now prefers installing the latest
    arm64 builds of miniforge. See
    https://conda-forge.org/blog/posts/2020-10-29-macos-arm64/ for more
    details.

    !end-bullet!
-   !begin-bullet!
    `reticulate::conda_create()` gains the `environment` argument, used
    when creating a new conda environment based on an exported
    environment definition (e.g. `environment.yml` or
    `environment.json`).

    !end-bullet!
-   !begin-bullet!
    `reticulate` gains the function, `conda_export()`, for exporting a
    conda environment definition as YAML. Environments are exported as
    via the `conda env export` command. (#779)

    !end-bullet!
-   !begin-bullet!
    `reticulate::find_conda()` will now locate miniforge Conda
    installations located within the default install locations.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue that caused `reticulate::conda_install(pip = TRUE)`
    to fail on windows. (#1053, @t-kalinowski)

    !end-bullet!

!end-bullets-36!

# reticulate 1.22

!begin-bullets-37!

-   !begin-bullet!
    Fixed a regression that caused
    `reticulate::conda_install(pip = TRUE)` to fail. (#1052)
    !end-bullet!

!end-bullets-37!

# reticulate 1.21

!begin-bullets-38!

-   !begin-bullet!
    `use_condaenv("base")` can now be used to activate the base Anaconda
    environment.

    !end-bullet!
-   !begin-bullet!
    `reticulate` will now execute any hooks registered via
    `setHook("reticulate.onPyInit", <...>)` after Python has been
    initialized. This can be useful for packages that need to take some
    action after `reticulate` has initialized Python.

    !end-bullet!
-   !begin-bullet!
    Further refined interrupt handling.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempting to bind `reticulate` to
    `/usr/bin/python3` on macOS could fail if Xcode was not installed.
    (#1017)

    !end-bullet!
-   !begin-bullet!
    The `reticulate` Python REPL no longer exits when a top-level
    interrupt is sent (e.g. via Ctrl + C).

    !end-bullet!
-   !begin-bullet!
    The miniconda auto-installer now supports aarch64 Linux machines.
    (#1012)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where matplotlib plots were incorrectly overwritten
    when multiple Python chunks in the same R Markdown document included
    plot output. (#1010)

    !end-bullet!
-   !begin-bullet!
    `reticulate` can now use the version of Python configured in
    projects using pipenv. If the project contains a `Pipfile` at the
    root directory (as understood by `here::here()`), then `reticulate`
    will invoke `pipenv --venv` to determine the path to the Python
    virtual environment associated with the project. Note that the
    `RETICULATE_PYTHON` environment variable, as well as usages of
    `use_python(..., force = TRUE)`, will still take precedence. (#1006)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate::py_run_string(..., local = TRUE)`
    failed to return the dictionary of defined Python objects in some
    cases.

    !end-bullet!

!end-bullets-38!

# reticulate 1.20

!begin-bullets-39!

-   !begin-bullet!
    Fixed an issue causing tests to fail on CRAN's M1mac machine.
    !end-bullet!

!end-bullets-39!

# reticulate 1.19

!begin-bullets-40!

-   !begin-bullet!
    Fixed an issue where `reticulate`'s interrupt handlers could cause
    issues with newer versions of Python.

    !end-bullet!
-   !begin-bullet!
    `reticulate` now better handles Pandas categorical variables
    containing `NA` values. (#942)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now supports converting `pandas.NA` objects into R `NA`
    objects. (#950)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now sets the `PYTHONIOENCODING` environment variable to
    UTF-8 when running within RStudio. This should allow UTF-8 input and
    output to be handled more appropriately.

    !end-bullet!
-   !begin-bullet!
    `reticulate` gains the `install_python()` function, used to install
    different versions of Python via pyenv (pyenv-windows on Windows).

    !end-bullet!
-   !begin-bullet!
    Interrupt signals (e.g. those generated by `Ctrl + C`) are now
    better handled by `reticulate`. In particular, when `repl_python()`
    is active, `Ctrl + C` can be used to interrupt a pending Python
    computation.

    !end-bullet!
-   !begin-bullet!
    `virtualenv_create()` gains the `pip_version` and
    `setuptools_version` arguments, allowing users to control the
    versions of `pip` and `setuptools` used when initializing the
    virtual environment. The `extra` argument can also now be used to
    pass arbitrary command line arguments when necessary.

    !end-bullet!
-   !begin-bullet!
    `virtualenv_create()` gains the `module` argument, used to control
    whether `virtualenv` or `venv` is used to create the requested
    virtual environment.

    !end-bullet!
-   !begin-bullet!
    `py_to_r.datetime.datetime` no longer errs when `tzname` is `NULL`,
    and instead assumes the time is formatted for `UTC`. (#876)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now supports the rendering of plotly plots and Altair
    charts in rendered R Markdown documents. (#711)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now avoids invoking property methods when inferring the
    type for Python class members, for auto-completion systems. (#907)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now attempts to set the `QT_QPA_PLATFORM_PLUGIN_PATH`
    environment variable when initializing a Conda installation of
    Python, when that associated plugins directory exists. (#586)

    !end-bullet!
-   !begin-bullet!
    The `reticulate` Python engine now supports the `results = "hold"`
    knitr chunk option. When set, any generated outputs are "held" and
    then displayed after the associated chunk's source code. (#530)

    !end-bullet!
-   !begin-bullet!
    `conda_create()` gains the `python_version` argument, making it
    easier to request that Conda environments are created with a
    pre-specified version of Python. (#766)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate::conda_install()` would attempt to
    re-install the default Python package, potentially upgrading or
    downgrading the version of Python used in an environment.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate` invoked its
    `reticulate.initialized` hook too early.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where Python modules loaded on a separate thread
    could cause a crash. (#885)

    !end-bullet!
-   !begin-bullet!
    `conda_install()` now allows version specifications for the
    `python_version` argument;
    e.g. `conda_install(python_version = ">=3.6")`. (#880)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `conda_install()` failed to pass along `forge`
    and `channel` in calls to `conda_create()`. (#878)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where Python's auto-loader hooks could fail when
    binding to a Python 2.7 installation.

    !end-bullet!

!end-bullets-40!

# reticulate 1.18

!begin-bullets-41!

-   !begin-bullet!
    Fixed an issue where `python_config()` could throw an error when
    attempting to query information about a Python 2.6 installation.
    !end-bullet!

!end-bullets-41!

# reticulate 1.17

!begin-bullets-42!

-   !begin-bullet!
    `reticulate` now checks for and disallows installation of Python
    packages during `R CMD check`.

    !end-bullet!
-   !begin-bullet!
    `reticulate` no longer injects the `r` helper object into the main
    module if another variable called `r` has already been defined.

    !end-bullet!
-   !begin-bullet!
    The function `py_help_handler()` has now been exported, to be used
    by front-ends and other tools which need to provide help for Python
    objects in different contexts. (#864)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where timezone information could be lost when
    converting Python datetime objects to R. (#829)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where numeric (rather than integer) dimensions could
    cause issues when converting SciPy sparse matrices to their R
    counterparts. (#844)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where R `data.frame`s with non-ASCII column names
    could not be converted to Pandas DataFrames. (#834)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the `pip_ignore_installed` argument in
    `conda_install()` was silently being ignored.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate::conda_install()` could re-install
    Python into an environment when not explicitly requested by the
    user.

    !end-bullet!
-   !begin-bullet!
    `reticulate` now sets `LD_LIBRARY_PATH` when discovering Python.
    (#836)

    !end-bullet!
-   !begin-bullet!
    `reticulate` is now better at capturing Python logger streams (those
    that write to stdout or stderr) when `py_capture_output()` is set.
    (#825)

    !end-bullet!
-   !begin-bullet!
    `reticulate` no longer calls `utils::loadhistory()` after each REPL
    iteration.

    !end-bullet!
-   !begin-bullet!
    `reticulate` now better detects when Python modules are loaded.

    !end-bullet!
-   !begin-bullet!
    `reticulate::import_from_path()` now accepts the `delay_load`
    parameter, allowing modules which should be loaded from a
    pre-specified path to be lazy-loaded.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate` load hooks (normally defined via
    `setHook("reticulate::<module>::load", ...)`) would segfault if
    those hooks attempted to load the hooked module.

    !end-bullet!
-   !begin-bullet!
    `reticulate` now attempts to resolve the conda binary used to create
    the associated Conda environment in calls to `py_install()`. This
    should fix use cases where Conda environments are placed outside of
    the Conda installation itself.

    !end-bullet!
-   !begin-bullet!
    `reticulate` now sets `PYTHONPATH` before loading Python, to ensure
    modules are looked up in the same locations where a regular Python
    interpreter would find them on load. This should fix issues where
    `reticulate` was unable to bind to a Python virtual environment in
    some cases.

    !end-bullet!
-   !begin-bullet!
    `reticulate::virtualenv_create()` gains the `packages` argument,
    allowing one to choose a set of packages to be installed (via
    `pip install`) after the virtual environment has been created.

    !end-bullet!
-   !begin-bullet!
    `reticulate::virtualenv_create()` gains the `system_site_packages`
    argument, allowing one to control whether the
    `--system-site-packages` flag is passed along when creating a new
    virtual environment. The default value can be customized via the
    `"reticulate.virtualenv.system_site_packages"` option and now
    defaults to `FALSE` when unset.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate::configure_environment()` would
    fail when attempting to configure an Anaconda environment. (#794)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now avoids presenting a Miniconda prompt for
    interactive sessions during R session initialization.

    !end-bullet!
-   !begin-bullet!
    Fixed unsafe usages of `Rprintf()` and `REprintf()`.

    !end-bullet!
-   !begin-bullet!
    `reticulate::py_install()` better respects the `method` argument,
    when `py_install()` is called without an explicit environment name.
    (#777)

    !end-bullet!
-   !begin-bullet!
    `reticulate:::pip_freeze()` now better handles `pip` direct
    references. (#775)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where output generated from `repl_python()` would be
    buffered until the whole submitted command had completed. (#739,
    @randy3k)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now explicitly qualifies symbols used from TinyThread
    with `tthread::`, to avoid issues with symbol conflicts during
    compilation. (#773)

    !end-bullet!
-   !begin-bullet!
    `reticulate` will now prefer an existing Miniconda installation over
    a `conda` binary on the PATH, when looking for Conda. (#790)

    !end-bullet!

!end-bullets-42!

# reticulate 1.16

!begin-bullets-43!

-   !begin-bullet!
    TinyThread now calls `Rf_error()` rather than `std::terminate()`
    when an internal error occurs.

    !end-bullet!
-   !begin-bullet!
    Conversion of Pandas DataFrames to R no longer emits deprecation
    warnings with pandas \>= 0.25.0. (#762)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now properly handles the version strings returned by
    beta versions of `pip`. (#757)

    !end-bullet!
-   !begin-bullet!
    `conda_create()` gains the `forge` and `channel` arguments,
    analogous to those already in `conda_install()`. (#752, @jtilly)

    !end-bullet!

!end-bullets-43!

# reticulate 1.15

!begin-bullets-44!

-   !begin-bullet!
    `reticulate` now ensures SciPy `csr_matrix` objects are sorted
    before attempting to convert them to their R equivalent. (#738,
    @paulofelipe)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where calling `input()` from Python with no prompt
    would fail. (#728)

    !end-bullet!
-   !begin-bullet!
    Lines ending with a semi-colon are no longer auto-printed in the
    `reticulate` REPL. (#717, @jsfalk)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now searches for Conda binaries in /opt/anaconda and
    /opt/miniconda. (#713)

    !end-bullet!
-   !begin-bullet!
    The `conda` executable used by `reticulate` can now be configured
    using an R option. Use `options(reticulate.conda_binary = <...>)` to
    force `reticulate` to use a particular `conda` executable.

    !end-bullet!
-   !begin-bullet!
    `reticulate::use_condaenv()` better handles cases where no matching
    environment could be found. (#687)

    !end-bullet!
-   !begin-bullet!
    `reticulate` gains the `py_ellipsis()` function, used to access the
    Python `Ellipsis` builtin. (#700, @skeydan)

    !end-bullet!
-   !begin-bullet!
    `reticulate::configure_environment()` now only allows environment
    configuration within interactive R sessions, and ensures that the
    version of Python that has been initialized by Python is indeed
    associated with a virtual environment or Conda environment. Use
    `reticulate::configure_environment(force = TRUE)` to force
    environment configuration within non-interactive R sessions.

    !end-bullet!
-   !begin-bullet!
    `reticulate` now automatically flushes output written to Python's
    stdout / stderr, as a top-level task added by `addTaskCallback()`.
    This behavior is controlled with the `options(reticulate.autoflush)`
    option. (#685)

    !end-bullet!
-   !begin-bullet!
    `reticulate::install_miniconda()` no longer attempts to modify the
    system PATH or registry when installing Miniconda. (#681)

    !end-bullet!
-   !begin-bullet!
    `reticulate::conda_install()` gains the `channel` argument, allowing
    custom Conda channels to be used when installing Python packages.
    (#443)

    !end-bullet!
-   !begin-bullet!
    `reticulate::configure_environment()` can now be used to configure a
    non-Miniconda Python environment. (#682; @skeydan)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where matplotlib plots would be included using
    absolute paths, which fails in non-standalone documents rendered to
    HTML. (#669)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate` would attempt to flush a
    non-existent stdout / stderr stream. (#584)

    !end-bullet!

!end-bullets-44!

# reticulate 1.14

!begin-bullets-45!

-   !begin-bullet!
    Fixed an issue where `rmarkdown::render()` could fail when including
    matplotlib plots when `knit_root_dir` is set. (#645)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now scans for Conda installations within the \~/opt
    folder, as per the updated installers distributed for macOS. (#661)

    !end-bullet!
-   !begin-bullet!
    Python classes can now be defined directly from R using the
    `PyClass()` function. (#635; @dfalbel)

    !end-bullet!
-   !begin-bullet!
    reticulate is now compatible with Python 3.9. (#630, @skeydan)

    !end-bullet!
-   !begin-bullet!
    Pandas DataFrames with a large number of columns should now be
    converted to R data.frames more quickly. (#620, @skeydan)

    !end-bullet!
-   !begin-bullet!
    Python loggers are now better behaved in the Python chunks of R
    Markdown documents. (#386)

    !end-bullet!
-   !begin-bullet!
    reticulate will now attempt to bind to `python3` rather than
    `python`, when no other version of Python has been explicitly
    requested by e.g. `use_python()`.

    !end-bullet!
-   !begin-bullet!
    reticulate now provides R hooks for Python's `input()` and
    `raw_input()` functions. It should now be possible to read user
    input from Python scripts loaded by reticulate. (#610)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now more consistently normalizes the paths reported by
    `py_config()`. (#609)

    !end-bullet!
-   !begin-bullet!
    `reticulate` now provides a mechanism for allowing client packages
    to declare their Python package dependencies. Packages should
    declare the Python packages they require as part of the
    `Config/reticulate` field in their `DESCRIPTION` file. Currently,
    this only activated when using Miniconda; as the assumption is that
    users will otherwise prefer to manually manage their Python
    environments. Please see `vignette("python_dependencies")` for more
    details.

    !end-bullet!
-   !begin-bullet!
    `reticulate` will now prompt the user to create and use a Miniconda
    environment when no other suitable Python environment has already
    been requested. This should help ease some of the trouble in setting
    up a Python environment on different platforms. The installer code
    was contributed by @hafen, from the rminiconda package.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `virtualenv_create(..., python = "<python>")`
    could fail to use the requested version of Python when `venv` is not
    installed. (#399)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where iterable Python objects could not be iterated
    with `iter_next()` due to a missing class. (#603)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where Conda environments could be mis-detected as
    virtual environments.

    !end-bullet!
-   !begin-bullet!
    R functions wrapping Python functions now inherit the formal
    arguments as specified by Python, making autocompletion more
    reliable. (#573, @flying-sheep)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempts to query Conda for environments could
    fail on Windows. (#576; #575; @dfalbel)

    !end-bullet!
-   !begin-bullet!
    Properly check for NULL keyword arguments in `call_r_function()`.
    (#562, @dfalbel)

    !end-bullet!

!end-bullets-45!

# reticulate 1.13

!begin-bullets-46!

-   !begin-bullet!
    Fixed an issue where subsetting with `[.python.builtin.object` could
    fail when `convert = TRUE` is set on the associated Python object.
    (#554)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the wrong definition of
    `[[.python.builtin.object` was being exported. (#554)

    !end-bullet!
-   !begin-bullet!
    `py_install()` now accepts `python_version`, and can be used if a
    particular version of Python is required for a Conda environment.
    (This argument is ignored for virtual environments.) (#549)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate could segfault in some cases
    (e.g. when using the `iterate()` function). (#551)

    !end-bullet!
-   !begin-bullet!
    It is now possible to compile `reticulate` with support for debug
    versions of Python by setting the `RETICULATE_PYTHON_DEBUG`
    preprocessor define during compilation. (#548)

    !end-bullet!
-   !begin-bullet!
    reticulate now warns if it did not honor the user's request to load
    a particular version of Python, as through
    e.g. `reticulate::use_python()`. (#545)

    !end-bullet!
-   !begin-bullet!
    `py_save_object()` and `py_load_object()` now accept `...`
    arguments. (#542)

    !end-bullet!
-   !begin-bullet!
    `py_install()` has been revamped, and now better detects available
    Python tooling (virtualenv vs. venv vs. Conda). (#544)

    !end-bullet!
-   !begin-bullet!
    reticulate now flushes stdout / stderr after calls to
    `py_run_file()` and `py_run_string()`.

    !end-bullet!
-   !begin-bullet!
    Python tuples are now converted recursively, in the same way that
    Python lists are. This means that the sub-elements of the tuple will
    be converted to R objects when possible. (#525, @skeydan)

    !end-bullet!
-   !begin-bullet!
    Python OrderedDict objects with non-string keys are now properly
    converted to R. (#516)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where reticulate could crash after a failed attempt
    to load NumPy. (#497, @ecoughlan)

    !end-bullet!

!end-bullets-46!

# reticulate 1.12

!begin-bullets-47!

-   !begin-bullet!
    Fixed an issue where Python objects within Python lists would not be
    converted to R objects as expected.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where single-row data.frames with row names could not
    be converted. (#468)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `reticulate` could fail to query Anaconda
    environment names with Anaconda 3.7.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where vectors of R Dates were not converted
    correctly. (#454)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where R Dates could not be passed to Python
    functions. (#458)

    !end-bullet!

!end-bullets-47!

# reticulate 1.11.1

!begin-bullets-48!

-   !begin-bullet!
    Fixed a failing virtual environment test on CRAN.
    !end-bullet!

!end-bullets-48!

# reticulate 1.11

!begin-bullets-49!

-   !begin-bullet!
    Fixed an issue where attempts to activate virtual environments
    created with virtualenv 16.4.1 would fail. (#437)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where conversion of Pandas Categorical variables to R
    objects would fail. (#389)

    !end-bullet!
-   !begin-bullet!
    Textual output generated when adding items to a matplotlib plot
    object are now suppressed.

    !end-bullet!
-   !begin-bullet!
    If the last statement in a Python chunk returns a matplotlib plot
    object, the plot will now be auto-shown as in other environments.

    !end-bullet!
-   !begin-bullet!
    The reticulate function help handler now returns function arguments
    for Python builtin functions.

    !end-bullet!
-   !begin-bullet!
    Top-level Python statements can now include leading indent when
    submitted with `repl_python()`.

    !end-bullet!
-   !begin-bullet!
    The current `matplotlib` figure is now cleared as each Python chunk
    in an R Markdown document is run.

    !end-bullet!
-   !begin-bullet!
    The `r` helper object (used for evaluating R code from Python) now
    better handles conversion of R functions. (#383)

    !end-bullet!
-   !begin-bullet!
    The `use_virtualenv()` function now understands how to bind to
    virtual environments created by the Python `venv` module.

    !end-bullet!
-   !begin-bullet!
    Reticulate better handles conversions of R lists to Python, and
    similarly, Python lists to R. We now call `r_to_py()` on each
    sub-element of an R list, and similarly, `py_to_r()` on each
    sub-element of a Python list.

    !end-bullet!
-   !begin-bullet!
    Reticulate now always converts R `Date` objects into Python
    `datetime` objects. Note that these conversions can be inefficient
    -- if you would prefer conversion to NumPy `datetime64` objects /
    arrays, you should convert your date to `POSIXct` first.

    !end-bullet!
-   !begin-bullet!
    Python chunks containing errors will cause execution to halt if
    'error=FALSE' during render, conforming with the default knitr
    behavior for R chunks.

    !end-bullet!
-   !begin-bullet!
    The output of bare statements (e.g. `1 + 1`) is now emitted as
    output when using the reticulate Python engine.

    !end-bullet!
-   !begin-bullet!
    Remapping of Python output streams to be R can now be explicitly
    enabled by setting the environment variable
    `RETICULATE_REMAP_OUTPUT_STREAMS` to 1. (#335)

    !end-bullet!
-   !begin-bullet!
    Allow syntax errors in Python chunks with 'eval = FALSE' (#343)

    !end-bullet!
-   !begin-bullet!
    Avoid dropping blank lines in Python chunks (#328)

    !end-bullet!
-   !begin-bullet!
    Use "agg" matplotlib backend when running under RStudio Desktop
    (avoids crashes when attempting to generate Python plots)

    !end-bullet!
-   !begin-bullet!
    Add `as.character()` S3 method for Python bytes (defaults to
    converting using UTF-8 encoding)

    !end-bullet!
-   !begin-bullet!
    Add `py_main_thread_func()` for providing R callbacks to Python
    libraries that may invoke the function on a Python background
    thread.

    !end-bullet!
-   !begin-bullet!
    Add `py_to_r` S3 methods for Scipy sparse matrices: CSR to
    dgRMatrix, COO to dgTMatrix, and for all other sparse matrices,
    conversion via CSC/dgCMatrix.

    !end-bullet!

!end-bullets-49!

# reticulate 1.10

!begin-bullets-50!

-   !begin-bullet!
    Output is now properly displayed when using the `reticulate` REPL
    with Windows + Python 2.7.

    !end-bullet!
-   !begin-bullet!
    Address memory protection issues identified by rchk

    !end-bullet!
-   !begin-bullet!
    Make variables defined using `%as%` operator in `with()` available
    after execution of the with block (same behavior as Python).

    !end-bullet!
-   !begin-bullet!
    Check for presence of "**module**" property before reading in
    `as_r_class()`

    !end-bullet!
-   !begin-bullet!
    Only update pip in `virtualenv_install()` when version is \< 8.1

    !end-bullet!
-   !begin-bullet!
    Support converting Python `OrderedDict` to R

    !end-bullet!
-   !begin-bullet!
    Support for iterating all types of Python iterable

    !end-bullet!
-   !begin-bullet!
    Add `conda_python()` and `virtualenv_python()` functions for finding
    the python binary associated with an environment.

    !end-bullet!

!end-bullets-50!

# reticulate 1.9

!begin-bullets-51!

-   !begin-bullet!
    Detect python 3 in environments where there is no python 2
    (e.g. Ubuntu 18.04)

    !end-bullet!
-   !begin-bullet!
    Always call r_to_py S3 method when converting objects from Python to
    R

    !end-bullet!
-   !begin-bullet!
    Handle NULL module name when determining R class for Python objects

    !end-bullet!
-   !begin-bullet!
    Convert RAW vectors to Python bytearray; Convert Python bytearray to
    RAW

    !end-bullet!
-   !begin-bullet!
    Use importlib for detecting modules (rather than imp) for Python \>=
    3.4

    !end-bullet!
-   !begin-bullet!
    Close text connection used for reading Python configuration probe

    !end-bullet!

!end-bullets-51!

# reticulate 1.8

!begin-bullets-52!

-   !begin-bullet!
    `source_python()` now flushes stdout and stderr after running the
    associated Python script, to ensure that `print()`-ed output is
    output to the console. (#284)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where logical R matrices would not be converted
    correctly to their NumPy counterpart. (#280)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where Python chunks containing multiple statements on
    the same line would be evaluated and printed multiple times.

    !end-bullet!
-   !begin-bullet!
    Added `py_get_item()`, `py_set_item()`, and `py_del_item()` as
    lower-level APIs for directly accessing the items of e.g. a Python
    dictionary or a Pandas DataFrame.

    !end-bullet!
-   !begin-bullet!
    Fix issue with Pandas column names that clash with built in methods
    (e.g. 'pop')

    !end-bullet!
-   !begin-bullet!
    Improve default `str()` output for Python objects (print `__dict__`
    if available)

    !end-bullet!

!end-bullets-52!

# reticulate 1.7

!begin-bullets-53!

-   !begin-bullet!
    Improved filtering of non-numeric characters in Python / NumPy
    versions.

    !end-bullet!
-   !begin-bullet!
    Added `py_func()` to wrap an R function in a Python function with
    the same signature as that of the original R function.

    !end-bullet!
-   !begin-bullet!
    Added support for conversion between `Matrix::dgCMatrix` objects in
    R and `Scipy` CSC matrices in Python.

    !end-bullet!
-   !begin-bullet!
    `source_python()` can now source a Python script from a URL into R
    environments.

    !end-bullet!
-   !begin-bullet!
    Always run `source_python()` in the main Python module.

    !end-bullet!
-   !begin-bullet!
    `py_install()` function for installing Python packages into
    virtualenvs and conda envs

    !end-bullet!
-   !begin-bullet!
    Automatically create conda environment for `conda_install()`

    !end-bullet!
-   !begin-bullet!
    Removed `delay_load` parameter from `import_from_path()`

    !end-bullet!

!end-bullets-53!

# reticulate 1.6

!begin-bullets-54!

-   !begin-bullet!
    `repl_python()` function implementing a lightweight Python REPL in
    R.

    !end-bullet!
-   !begin-bullet!
    Support for converting Pandas objects (`Index`, `Series`,
    `DataFrame`)

    !end-bullet!
-   !begin-bullet!
    Support for converting Python `datetime` objects.

    !end-bullet!
-   !begin-bullet!
    `py_dict()` function to enable creation of dictionaries based on
    lists of keys and values.

    !end-bullet!
-   !begin-bullet!
    Provide default base directory (e.g. '\~/.virtualenvs') for
    environments specified by name in `use_virtualenv()`.

    !end-bullet!
-   !begin-bullet!
    Fail when environment not found with
    `use_condaenv(..., required = TRUE)`

    !end-bullet!
-   !begin-bullet!
    Ensure that `use_*` python version is satisfied when using
    `eng_python()`

    !end-bullet!
-   !begin-bullet!
    Forward `required` argument from `use_virtualenv()` and
    `use_condaenv()`

    !end-bullet!
-   !begin-bullet!
    Fix leak which occurred when assigning R objects into Python
    containers

    !end-bullet!
-   !begin-bullet!
    Add support for Conda Forge (enabled by default) to
    `conda_install()`

    !end-bullet!
-   !begin-bullet!
    Added functions for managing Python virtual environments
    (virtualenv)

    !end-bullet!

!end-bullets-54!

# reticulate 1.5

!begin-bullets-55!

-   !begin-bullet!
    Remove implicit documentation extraction for Python classes

    !end-bullet!
-   !begin-bullet!
    Add `Library\bin` to PATH on Windows to ensure Anaconda can find MKL

    !end-bullet!
-   !begin-bullet!
    New `source_python()` function for sourcing Python scripts into R
    environments.

    !end-bullet!

!end-bullets-55!

# reticulate 1.4

!begin-bullets-56!

-   !begin-bullet!
    Support for `RETICULATE_DUMP_STACK_TRACE` environment variable which
    can be set to the number of milliseconds in which to output into
    stderr the call stacks from all running threads.

    !end-bullet!
-   !begin-bullet!
    Provide hook to change target module when delay loading

    !end-bullet!
-   !begin-bullet!
    Scan for conda environments in system-level installations

    !end-bullet!
-   !begin-bullet!
    Support for miniconda environments

    !end-bullet!
-   !begin-bullet!
    Implement `eval`, `echo`, and `include` knitr chunk options for
    Python engine

    !end-bullet!

!end-bullets-56!

# reticulate 1.3.1

!begin-bullets-57!

-   !begin-bullet!
    Bugfix: ensure single-line Python chunks that produce no output
    still have source code emitted.
    !end-bullet!

!end-bullets-57!

# reticulate 1.3

!begin-bullets-58!

-   !begin-bullet!
    Use existing instance of Python when reticulate is loaded within an
    embedded Python environment (e.g. rpy2, rice, etc.)

    !end-bullet!
-   !begin-bullet!
    Force use of Python specified in PYTHON_SESSION_INITIALIZED (defined
    by rpy2)

    !end-bullet!
-   !begin-bullet!
    Define R_SESSION_INITIALIZED (used by rpy2)

    !end-bullet!
-   !begin-bullet!
    Force use of Python when `required = TRUE` in `use_python` functions

    !end-bullet!
-   !begin-bullet!
    Force use of Python specified by RETICULATE_PYTHON

    !end-bullet!
-   !begin-bullet!
    `dict`: Don't scan parent frame for Python objects if a single
    unnamed list is passed.

    !end-bullet!
-   !begin-bullet!
    Wait as long as required for scheduling generator calls on the main
    thread

    !end-bullet!
-   !begin-bullet!
    Refine stripping of object addresses from output of `py_str()`
    method

    !end-bullet!
-   !begin-bullet!
    Added `py_id()` function to get globally unique ids for Python
    objects

    !end-bullet!
-   !begin-bullet!
    Added `py_len()` function and S3 `length()` method for Python lists
    (already had `length()` methods for dicts, tuples, and NumPy
    arrays).

    !end-bullet!
-   !begin-bullet!
    Exported `py` object (reference to Python main module)

    !end-bullet!
-   !begin-bullet!
    Added `eng_python()` (knitr engine for Python chunks)

    !end-bullet!
-   !begin-bullet!
    Improved compatibility with strings containing high unicode
    characters when running under Python 2

    !end-bullet!
-   !begin-bullet!
    Remove `dim` methods for NumPy arrays (semantics of NumPy reshaping
    are different from R reshaping)

    !end-bullet!
-   !begin-bullet!
    Added `array_reshape` function for reshaping R arrays using NumPy
    (row-major) semantics.

    !end-bullet!
-   !begin-bullet!
    Provide mechanism for custom R wrapper objects for Python objects

    !end-bullet!
-   !begin-bullet!
    Added interface to pickle (`py_save_object()` and
    `py_load_object()`)

    !end-bullet!
-   !begin-bullet!
    Catch and print errors which occur in generator functions

    !end-bullet!
-   !begin-bullet!
    Write using Rprintf when providing custom Python output streams
    (enables correct handling of terminal control characters)

    !end-bullet!
-   !begin-bullet!
    Implement `isatty` when providing custom Python output streams

    !end-bullet!

!end-bullets-58!

# reticulate 1.2

!begin-bullets-59!

-   !begin-bullet!
    Add `np_array` function for creating NumPy arrays and converting the
    data type, dimensions, and in-memory ordering of existing NumPy
    arrays.

    !end-bullet!
-   !begin-bullet!
    Add `dim` and `length` functions for NumPy arrays

    !end-bullet!
-   !begin-bullet!
    Add `py_set_seed` function for setting Python and NumPy random
    seeds.

    !end-bullet!
-   !begin-bullet!
    Search in additional locations for Anaconda on Linux/Mac

    !end-bullet!
-   !begin-bullet!
    Improved support for UTF-8 conversions (always use UTF-8 when
    converting from Python to R)

    !end-bullet!
-   !begin-bullet!
    Ignore private ("\_" prefixed) attributes of dictionaries for
    .DollarNames

    !end-bullet!
-   !begin-bullet!
    Provide "\`function\`" rather than "function" in completions.

    !end-bullet!
-   !begin-bullet!
    Fail gracefully if call to conda in `conda_list` results in an error

    !end-bullet!
-   !begin-bullet!
    Add `pip_ignore_installed` option to `conda_install` function.

    !end-bullet!

!end-bullets-59!

# reticulate 1.1

!begin-bullets-60!

-   !begin-bullet!
    Allow `dict()` function to accept keys with mixed alpha/numeric
    characters

    !end-bullet!
-   !begin-bullet!
    Use `conda_list()` to discover conda environments on Windows (slower
    but much more reliable than scanning the filesystem)

    !end-bullet!
-   !begin-bullet!
    Add interface for registering F1 help handlers for Python modules

    !end-bullet!
-   !begin-bullet!
    Provide virtual/conda env hint mechanism for delay loaded imports

    !end-bullet!

!end-bullets-60!

# reticulate 1.0

!begin-bullets-61!

-   !begin-bullet!
    Search WORKON_HOME (used by virtualenv_wrapper) for Python
    environments

    !end-bullet!
-   !begin-bullet!
    Support `priority` field for delay loaded modules.

    !end-bullet!
-   !begin-bullet!
    Use json output from conda_list (handle spaces in path of conda env)

    !end-bullet!
-   !begin-bullet!
    Look for callable before iterable when converting Python objects to
    R

    !end-bullet!
-   !begin-bullet!
    Correct propagation of errors in R functions called from Python

    !end-bullet!
-   !begin-bullet!
    Support for generators (creating Python iterators from R functions)

    !end-bullet!
-   !begin-bullet!
    Changed default `completed` value for `iter_next()` to `NULL` (was
    `NA`)

    !end-bullet!
-   !begin-bullet!
    Support for converting 16-bit floats (NPY_HALF) to R

    !end-bullet!
-   !begin-bullet!
    Don't throw error when probing Python \<= 2.6

    !end-bullet!
-   !begin-bullet!
    Copy Python dictionary before converting to R named list (fixes
    issue with dictionaries that are mutated during iteration,
    e.g. sys.modules)

    !end-bullet!
-   !begin-bullet!
    Ensure that existing warning filters aren't reset by
    py_suppress_warnings

    !end-bullet!

!end-bullets-61!

# reticulate 0.9

!begin-bullets-62!

-   !begin-bullet!
    Detect older versions of Anaconda during registry scanning.

    !end-bullet!
-   !begin-bullet!
    Don't probe python versions on windows when no executable is found

    !end-bullet!
-   !begin-bullet!
    Poll for interrupts every 500ms rather than 100ms

    !end-bullet!
-   !begin-bullet!
    Provide sys.stdout and sys.stderr when they are None (e.g. in R GUI)

    !end-bullet!
-   !begin-bullet!
    Add Scripts directory to PATH on Windows

    !end-bullet!
-   !begin-bullet!
    Add iter_next function for element-by-element access to iterators

    !end-bullet!
-   !begin-bullet!
    Eliminate special print method for iterators/generators

    !end-bullet!
-   !begin-bullet!
    Added `py_help()` function for printing documentation on Python
    objects

    !end-bullet!
-   !begin-bullet!
    Added `conda_version()` function.

    !end-bullet!
-   !begin-bullet!
    Search `dict()` parent frames for symbols; only use symbols which
    inherit from python.builtin.object as keys.

    !end-bullet!

!end-bullets-62!

# reticulate 0.8

!begin-bullets-63!

-   !begin-bullet!
    Add `import_from_path()` function for importing Python modules from
    the filesystem.

    !end-bullet!
-   !begin-bullet!
    Add `py_discover_config()` function to determine which versions of
    Python will be discovered and which one will be used by reticulate.

    !end-bullet!
-   !begin-bullet!
    Add `py_function_docs()` amd `py_function_wrapper()` utility
    functions for scaffolding R wrappers for Python functions.

    !end-bullet!
-   !begin-bullet!
    Add `py_last_error()` function for retrieving last Python error.

    !end-bullet!
-   !begin-bullet!
    Convert 0-dimension NumPy arrays (scalars) to single element R
    vectors

    !end-bullet!
-   !begin-bullet!
    Convert "callable" Python objects to R functions

    !end-bullet!
-   !begin-bullet!
    Automatically add Python bin directory to system PATH for consistent
    version usage in reticulate and calls to system

    !end-bullet!
-   !begin-bullet!
    Added `length()` method for tuple objects

    !end-bullet!
-   !begin-bullet!
    Enable specification of `__name__` for R functions converted to
    Python functions.

    !end-bullet!
-   !begin-bullet!
    Give priority to the first registered delay load module (previously
    the last registered module was given priority)

    !end-bullet!
-   !begin-bullet!
    Add additional safety checks to detect use of NULL xptr objects
    (i.e. objects from a previous session). This should mean that S3
    methods no longer need to check whether they are handling an xptr.

    !end-bullet!
-   !begin-bullet!
    Added `py_eval()` function for evaluating simple Python statements.

    !end-bullet!
-   !begin-bullet!
    Add `local` option to `py_run_string()` and `py_run_file()`. Modify
    behavior to return local execution dictionary (rather than a
    reference to the main module).

    !end-bullet!
-   !begin-bullet!
    Use `PyImport_Import` rather than `PyImport_ImportModule` for
    `import()`

    !end-bullet!
-   !begin-bullet!
    Added ability to customize mapping of Python classes to R classes
    via the `as` argument to `import()` and the
    `register_class_filter()` function

    !end-bullet!
-   !begin-bullet!
    Added separate `on_load` and `on_error` functions for `delay_load`

    !end-bullet!
-   !begin-bullet!
    Scan customary root directories for virtualenv installations

    !end-bullet!
-   !begin-bullet!
    Allow calling `__getitem__` via `[[` operator (zero-based to match
    Python style indexing)

    !end-bullet!
-   !begin-bullet!
    Added `conda_*` family of functions for using conda utilities from
    within R.

    !end-bullet!
-   !begin-bullet!
    Implement comparison operators (e.g. `==`, `>=`, etc.) for Python
    objects

    !end-bullet!
-   !begin-bullet!
    Implement `names()` generic for Python objects

    !end-bullet!
-   !begin-bullet!
    Improve performance for marshalling of large Python dictionaries and
    iterators that return large numbers of items.

    !end-bullet!
-   !begin-bullet!
    Implement `str` methods for Python List, Dict, and Tuple (to prevent
    printing of very large collections via default `str` method)

    !end-bullet!
-   !begin-bullet!
    Use `grepl()` rather than `endsWith()` for compatibility with R \<=
    3.2

    !end-bullet!
-   !begin-bullet!
    Use `inspect.getmro` rather than `__bases__` for enumerating the
    base classes of Python objects.

    !end-bullet!
-   !begin-bullet!
    Fix `PROTECT`/`UNPROTECT` issue detected by CRAN

    !end-bullet!
-   !begin-bullet!
    Correct conversion of strings with Unicode characters on Windows

    !end-bullet!
-   !begin-bullet!
    Fix incompatibility with system-wide Python installations on Windows

    !end-bullet!
-   !begin-bullet!
    Fix issue with Python dictionary keys that shared names with
    primitive R functions (don't check environment inheritance chain
    when looking for dictionary key objects by name).

    !end-bullet!
-   !begin-bullet!
    Propagate `convert` parameter for modules with `delay_load`

    !end-bullet!

!end-bullets-63!

# reticulate 0.7

!begin-bullets-64!

-   !begin-bullet!
    Initial CRAN release
    !end-bullet!

!end-bullets-64!

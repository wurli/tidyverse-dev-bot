# renv (development version)

!begin-bullets-1!

-   !begin-bullet!
    `renv` now prefers appending, rather than prepending, Bioconductor
    repositories to the current set of repositories when installing
    packages. This implies that if you're using a repository that also
    provides Bioconductor packages, this repository will be preferred as
    opposed to the "default" Bioconductor repositories. (#2128)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` now ignores the `Repository` field on lockfile
    entries when the `repos.override` configuration option is set.
    (#2127)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` now transforms binary repository URLs
    appropriately, for installed packages which were recorded as
    installed from an alternate binary repository URL. (#2127)

    !end-bullet!

!end-bullets-1!

# renv 1.1.5

!begin-bullets-2!

-   !begin-bullet!
    Fixed an issue where `renv::dependencies()` could fail for chunks
    which had a `label` which was not a length-one character vector.
    (#2144)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `file.rename()` could fail when unpacking a
    package during installation in certain Windows environments. (#2156)

    !end-bullet!
-   !begin-bullet!
    `renv`'s dependency discovery now supports usages of `base::use()`.
    (#2130)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could fail to parse remote references
    containing an `@` character. (#2135)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::sysreqs(distro = <...>)` could fail when
    passed an alternate distribution without a version specifier.
    (#2105)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where multimode R documents containing chunk headers
    which did not parse to an R list could cause dependency inference to
    fail. (#2110)

    !end-bullet!

!end-bullets-2!

# renv 1.1.4

!begin-bullets-3!

-   !begin-bullet!
    Fixed an issue where `renv` could erroneously record packages
    installed from Posit Package Manager snapshots as being installed
    from CRAN. (#2104)

    !end-bullet!
-   !begin-bullet!
    `renv` now only checks for archived packages during installation
    when `options(renv.install.allowArchivedPackages = TRUE)` is set.
    This fixes an issue where `renv` could erroneously discover that
    Rcpp 1.3 was available when using the Posit Package Manager
    repository.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::dependencies()` could fail with an
    unhelpful error message if the scanned document contained a YAML
    header whose contents was not a map. (#2117)

    !end-bullet!

!end-bullets-3!

# renv 1.1.3

!begin-bullets-4!

-   !begin-bullet!
    Fixed an issue where `renv::hydrate()` could fail to install
    packages discovered in the user library during `renv::init()`.
    (#2109)

    !end-bullet!
-   !begin-bullet!
    `renv::update()` now only updates the packages installed in the
    project library by default. `renv::update(all = TRUE)` can be used
    to also check if packages installed in the default library are
    out-of-date, and install updated copies into the project library.
    (#2108)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where package installation could fail on Arch Linux
    with the error message "don't know how to check sysreqs on this
    system". (#2107)

    !end-bullet!
-   !begin-bullet!
    `renv` now supports profile-specific comments within `.gitignore`
    and `.renvignore` files. These are comments of the form `#| <code>`,
    where `<code>` is R code which should indicate if the `.renvignore`
    rules should apply. Typically, this should be of the form
    `#| profile == "extra"`, or `#| profile %in% c("extra", "other")`.
    Note that only a small subset of base R functions are available for
    evaluation in this context. Note that the first section in a
    `.renvignore` implicitly applies to all profiles -- if you want to
    limit it to just the default profile, you can use
    `#| profile == "default"` for the first line. (#1662)

    !end-bullet!
-   !begin-bullet!
    The environment variable `RENV_PATHS_VERSION` can now be used to
    substitute the R version component normally used in library / cache
    paths. The provided path can include placeholders like `%V` for the
    full R version including the patch level, and `%v` for the R version
    without the patch level. Defaults to `R-%v` when unset. (#1687)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` gains the `transactional` argument, for parity
    with `renv::restore()`. (#1109)

    !end-bullet!

!end-bullets-4!

# renv 1.1.2

!begin-bullets-5!

-   !begin-bullet!
    `renv` gains the `sysreqs()` function, which can be used to query
    the system packages required by a set of R packages. Functionality
    is currently available for Debian-based distributions, as well as
    Red Hat distributions.

    !end-bullet!
-   !begin-bullet!
    On Linux, `renv` now uses the database from
    https://github.com/rstudio/r-system-requirements when determining if
    an R package's required system libraries are installed, and notifies
    the user which packages (if any) are missing during install /
    restore.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could fail to retrieve credentials
    registered for 'github.com' when querying URLs at 'api.github.com'.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could stall when loading a project and
    validating that the configured version of Bioconductor is compatible
    with the version of R currently in use.

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` no longer fails to generate a new lockfile if the
    project contains a lockfile which could not be read or parsed.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where lockfiles containing unicode characters were
    not correctly written or read with versions of R (\< 4.2.0) on
    Windows. (#2091)

    !end-bullet!

!end-bullets-5!

# renv 1.1.1

!begin-bullets-6!

-   !begin-bullet!
    Fixed an issue where very long lockfiles could be truncated on
    write. (#2089)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` inadvertently made web requests in tests
    during `R CMD check`.

    !end-bullet!

!end-bullets-6!

# renv 1.1.0

## Major Changes

!begin-bullets-7!

-   !begin-bullet!
    `renv` now includes additional package DESCRIPTION fields in the
    lockfile. This can be useful for validating the provenance of
    packages recorded in the lockfile, and also for applications using
    `renv` which would like to recompute the hash used for package
    caching from the lockfile itself.

    If needed, old-style lockfiles can be generated by setting the
    option `options(renv.lockfile.version = 1)`. Note that this version
    of `renv` remains compatible both with the older (minimal)
    lockfiles, as well as with the newer lockfiles in this release.
    (#2057)

    !end-bullet!

!end-bullets-7!

## Other Fixes

!begin-bullets-8!

-   !begin-bullet!
    The `renv` sandbox is now unlocked on exit after a call to
    `renv::use()`. This should alleviate issues seen where R's attempts
    to clean up the temporary directory could fail due to inadequate
    permissions on the sandbox directory. (#2076)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::restore()` did not respect the named
    repository within the lockfile when installing packages from the
    archives of the configured package repositories. (#2081)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::snapshot()` could fail if invoked within
    a project containing empty or invalid `.ipynb` files. (#2073)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where R package installation could fail if the
    project depended on a package whose current version available from
    the configured package repositories required on a newer version of R
    than what was currently installed, even if that package need not be
    updated. (#2071)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `RENV_CONFIG_EXTERNAL_LIBRARIES` was
    incorrectly split when using Windows paths. (#2069)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` failed to restore packages installed
    from r-universe when the associated lockfile record had no
    `RemoteRef` field. (#2068)

    !end-bullet!
-   !begin-bullet!
    `renv` now detects dependencies from usages of `utils::citation()`.
    (#2047)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where packages installed from r-universe via an
    explicit URL remote could not be restored. (#2060)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the repositories provided to `renv::init()`
    were ignored when also initializing `renv` with a specific version
    of Bioconductor.

    !end-bullet!
-   !begin-bullet!
    `renv::install()` gains the `include` parameter, which can be useful
    when you'd like to install a subset of dependencies within a project
    while also respecting any declared remotes in that project's
    `DESCRIPTION` file. (#2055)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could fail to check for updates for
    packages installed using `pak` without an explicit branch specified.
    (#2040)

    !end-bullet!
-   !begin-bullet!
    `renv::use()` no longer re-installs packages which are already
    installed and compatible with the requested packages. (#2044)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::init()` could fail when using named
    remotes in a DESCRIPTION file's `Remotes:` field. (#2055)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where ignore rules of the form `!*.*` were not parsed
    and handled correctly during dependency discovery. (#2052)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` erroneously reported that installed
    packages were cached when the cache was not writable. (#2041).

    !end-bullet!
-   !begin-bullet!
    `renv` now supports updating of currently-installed packages via
    `renv::install()` when configured to use `pak`. (#2037)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` library paths were not properly reset
    following a suspend / resume in RStudio Server. (#2036)

    !end-bullet!
-   !begin-bullet!
    `renv::run()` gains the `args` parameter, which can be used to pass
    command-line arguments to a script. (#2015)

    !end-bullet!
-   !begin-bullet!
    `renv` now infers a dependency on `rmarkdown` and `knitr` for R
    scripts which include YAML front-matter. (#2023)

    !end-bullet!
-   !begin-bullet!
    The performance of `renv`'s built-in JSON reader has been improved.
    (#2021)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could erroneously create a binding
    called 'object' in the global environment on startup. (#2017)

    !end-bullet!

!end-bullets-8!

# renv 1.0.11

!begin-bullets-9!

-   !begin-bullet!
    Fixed an issue where headers were not properly passed to
    `available.packages()` during `renv` bootstrap. (#1942)

    !end-bullet!
-   !begin-bullet!
    `renv` now assumes that Artifactory package repositories will use a
    CRAN-like layout of packages for packages in the archive. (#1996)

    !end-bullet!
-   !begin-bullet!
    `renv` now includes compiled extensions on Linux + macOS. These
    extensions are primarily used to improve the performance of
    `renv::dependencies()` and other static analysis code. Support for
    Windows may come in a future release.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::snapshot()` could fail if the project
    contained a call to `module()` with no arguments. (#2007)

    !end-bullet!
-   !begin-bullet!
    On Linux, `renv` now emits a message on load if the R temporary
    directory is within a folder that has been mounted as 'noexec'. This
    message can be suppressed by setting the
    `RENV_TEMPDIR_NOEXEC_CHECK=FALSE` environment variable.

    !end-bullet!

!end-bullets-9!

# renv 1.0.10

!begin-bullets-10!

-   !begin-bullet!
    Fixed a performance regression in `renv::dependencies()`. (#1999)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` tests could fail if the `parallel`
    package was loaded during test execution.

    !end-bullet!
-   !begin-bullet!
    `renv` now determines a package repository's type through the HTTP
    headers provided when accessing `src/contrib/PACKAGES`. This is
    mainly relevant when detecting Nexus and Artifactory repositories.

    !end-bullet!

!end-bullets-10!

# renv 1.0.9

!begin-bullets-11!

-   !begin-bullet!
    Fixed an issue where repository URLs were inappropriately
    transformed into binary repository URLs on Linux. (#1991)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where code following `source("renv/activate.R")` in
    the project `.Rprofile` was not invoked for projects using RStudio.
    (#1990)

    !end-bullet!

!end-bullets-11!

# renv 1.0.8

!begin-bullets-12!

-   !begin-bullet!
    `renv` now infers a dependency on the `ragg` package when the
    `ragg_png` device is used in R Markdown / Quarto documents, for
    documents using the code `knitr::opts_chunk$set(dev = "ragg_png")`.
    (#1985)

    !end-bullet!
-   !begin-bullet!
    `renv` now automatically generates a lockfile when loading a project
    containing a `manifest.json` file (typical for application bundles
    published to Posit Connect). (#1980, @toph-allen)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now errs if an incompatible `type` argument is
    provided.

    !end-bullet!
-   !begin-bullet!
    `renv::checkout()` now also checks out the version of `renv`
    available and associated with the requested snapshot date. (#1966)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::hydrate()` did not hydrate packages
    which were also listed as dependencies within a project's
    `DESCRIPTION` file. (#1970)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::checkout()` omitted some fields from
    lockfile records when using `actions = c("snapshot", "restore")`.
    (#1969)

    !end-bullet!
-   !begin-bullet!
    `renv` gains the function `renv::retrieve()`, which can be used to
    download packages without installing them. This is primarily useful
    in CI / CD scenarios, where you might want to download packages in a
    single stage before attempting to install / restore them. (#1965)

    !end-bullet!
-   !begin-bullet!
    `renv` now preserves `Remote` fields present on packages installed
    from public package repositories (e.g. https://r-universe.dev/).
    (#1961)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::load()` could fail to load an alternate
    project when `options(renv.config.autoloader.enabled = FALSE)` was
    set. (#1959)

    !end-bullet!
-   !begin-bullet!
    `renv` now emits clickable hyperlinks for runnable code snippets and
    help, for front-ends which support the `ide:run` and `ide:help` ANSI
    escapes.

    !end-bullet!
-   !begin-bullet!
    `renv::init(bioc = "<version>")` now prompts the user in interactive
    sessions when requesting a version of Bioconductor which is not
    compatible with the current version of R. (#1943)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` gains the `transactional` argument, which can be
    used to control whether `renv` will allow successfully-installed
    packages remain in the project library even if a package fails to
    install during a later step. (#1109)

    !end-bullet!
-   !begin-bullet!
    `renv` now infers a dependency on the `xml2` package for projects
    using the `testthat::JunitReporter` for tests. (#1936)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::dependencies()` could emit a warning
    when attempting to parse chunks using chunk options like
    `#| eval: c(1, 2)`. (#1906)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now properly delegates the `type` and `rebuild`
    arguments to `pak` when `options(renv.config.pak.enabled = TRUE)` is
    set. (#1924)

    !end-bullet!
-   !begin-bullet!
    `renv` now infers a dependency on the `svglite` package if it
    detects calls of the form `ggsave(filename = "path.svg")`. (#1930)

    !end-bullet!
-   !begin-bullet!
    `renv` now supports setting of GitHub authentication credentials via
    any of `GITHUB_TOKEN`, `GITHUB_PAT`, and `GH_TOKEN`. (#1937)

    !end-bullet!
-   !begin-bullet!
    `renv` now also passes any custom headers available to
    `utils::available.packages()` during bootstrap. (#1942)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could fail during installation of
    packages stored within repository sub-directories, if that
    repository also contained a top-level DESCRIPTION file. (#1941)

    !end-bullet!
-   !begin-bullet!
    `renv` now normalizes lockfile entries for Bioconductor packages
    installed via `pak::pkg_install()`, to help prevent spurious diffs
    being produced via `renv::status()`. (#1920)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now respects the `prompt` parameter when `pak` is
    enabled, as via `options(renv.config.pak.enabled = TRUE)`. (#1907)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue with `renv`'s `pak` integration where `renv` could
    install the wrong version of a GitHub package during restore if
    `options(renv.config.pak.enabled = TRUE)` was set. (#1883)

    !end-bullet!
-   !begin-bullet!
    `renv` no longer interacts with the user during autoloading, which
    coincides with R startup. If the IDE offers a session init hook
    (RStudio does), loading is deferred until startup is complete and
    interaction is possible. Otherwise, any suggested renv actions, such
    as `renv::restore()`, are emitted as a message for the user to act
    on. (#1879, #1915).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where installation of packages from local sources, as
    via `install("<package>", repos = NULL, type = "source")`, could
    fail. (#1880)

    !end-bullet!
-   !begin-bullet!
    A new function, `renv::lockfile_validate()`, can be used to validate
    your `renv.lock` against a default or custom schema. (#1889)

    !end-bullet!

!end-bullets-12!

# renv 1.0.7

!begin-bullets-13!

-   !begin-bullet!
    Fixed an issue where `renv`'s activate script failed to report
    version conflict errors when starting up. (#1874)
    !end-bullet!

!end-bullets-13!

# renv 1.0.6

!begin-bullets-14!

-   !begin-bullet!
    Fixed an issue where downloads could fail with curl \>= 8.7.1.
    (#1869)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::snapshot()` did not properly normalize
    package records generated from packages installed using the `pak`
    package, e.g. via `pak::pkg_install("cran::<package>")`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could incorrectly prompt the user to
    record a version of `renv` installed from GitHub in some cases.
    (#1857)

    !end-bullet!
-   !begin-bullet!
    `renv::load()` now delegates to `base::load()` when it detects that
    the call was likely intended for `base::load()`, but `renv::load()`
    was used instead (e.g. because `base::load()` was masked by
    `renv::load()`).

    !end-bullet!
-   !begin-bullet!
    `renv::update()` gains the `lock` argument, which can be used to
    instruct `renv` to automatically update the lockfile after the
    requested packages have been updated. (#1849)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could fail to update the project
    autoloader after calling `renv::upgrade()`. (#1837)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempts to install binary packages from older
    PPM snapshots could fail. (#1839)

    !end-bullet!
-   !begin-bullet!
    `renv` now uses a platform-specific prefix on Linux for library and
    cache paths by default with R (\>= 4.4.0). This is equivalent to
    setting `RENV_PATHS_PREFIX_AUTO = TRUE`. If necessary, this behavior
    can be disabled by setting `RENV_PATHS_PREFIX_AUTO = FALSE` in an
    appropriate R startup file. (#1211)

    !end-bullet!

!end-bullets-14!

# renv 1.0.5

!begin-bullets-15!

-   !begin-bullet!
    `renv` now only writes a `.renvignore` file into the cache directory
    if the cache appears to be part of the current project.

    !end-bullet!
-   !begin-bullet!
    `renv` now reports missing system libraries as part of its ABI
    checks in `renv::diagnostics()`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install(lock = TRUE)` produced lockfiles
    containing records with extraneous data. (#1828)

    !end-bullet!

!end-bullets-15!

# renv 1.0.4

!begin-bullets-16!

-   !begin-bullet!
    `renv::install()` gains the `lock` argument. When `TRUE`, the
    project lockfile will be updated after the requested packages have
    been successfully installed. (#1811)

    !end-bullet!
-   !begin-bullet!
    `renv` now supports the use of GitHub Enterprise servers with the
    `gitcreds` package for authentication credentials. (#1814)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` now treats `#| eval: !expr <...>` chunk
    options as truthy by default, implying that such chunks are scanned
    for their R package dependencies. (#1816)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` now requires usages of the import package to
    be namespace-qualified in order to be handled via static analysis;
    that is, `import::from(<pkg>)` is parsed for dependencies, but
    `from(pkg)` is not. (#1815)

    !end-bullet!
-   !begin-bullet!
    `renv::load()` gains the `profile` argument, allowing one to
    explicitly load a specific profile associated with an `renv`
    project. See `vignette("profiles", package = "renv")` or
    https://rstudio.github.io/renv/articles/profiles.html for more
    details.

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` no longer includes `R` dependency versions
    declared from a `DESCRIPTION` file in its output. (#1806)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could fail to infer dependencies from R
    Markdown code chunks using engine 'R' (upper-case) rather than 'r'
    (lower-case). (#1803)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` did not report out-of-sync packages when
    one or more packages used in the project were not installed. (#1788)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` could over-aggressively activate P3M
    repositories when initializing a project. (#1782)

    !end-bullet!
-   !begin-bullet!
    `renv::status()` now notifies the user if the version of R recorded
    in the lockfile does not match the version of R currently in use.
    (#1779)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where packages could appear multiple times in the
    lockfile, if that package was installed into multiple library paths.
    (#1781)

    !end-bullet!
-   !begin-bullet!
    Installation of historical binaries of packages is once again
    enabled, now using the Posit Public Package Manager (P3M) service
    instead of Microsoft's (now defunct) MRAN service.

    !end-bullet!
-   !begin-bullet!
    `renv::init()` now respects the `Remotes:` field declared in a
    project's `DESCRIPTION` file, if any. (#1522)

    !end-bullet!
-   !begin-bullet!
    `renv::embed()` now supports Quarto Markdown (`.qmd`) files. (#1700)

    !end-bullet!
-   !begin-bullet!
    renv now sets the `R_INSTALL_TAR` environment variable to match the
    default `tar` executable (if any) when installing packages. (#1724)

    !end-bullet!
-   !begin-bullet!
    renv now uses `--ssl-revoke-best-effort` by default when downloading
    files using `curl` on Windows. (#1739)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install()` could fail to detect
    incompatible recursive package dependencies. (#1671)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now records remote information for packages
    installed from CRAN-like repositories, and uses that information
    when generating a lockfile and restoring those packages. This helps
    ensure that packages installed within an renv project via calls like
    `renv::install("<pkg>", repos = "<repos>")` can still be
    successfully restored in future sessions. (#1765)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now lazily resolves project remotes. (#1755)

    !end-bullet!
-   !begin-bullet!
    `renv::init()` now respects Remotes declared within a project's
    `DESCRIPTION` file, if any.

    !end-bullet!
-   !begin-bullet!
    Calling `renv::activate()` without explicitly providing the
    `profile` argument now preserves the current profile, if any. Use
    `renv::activate(profile = "default")` if you'd like to re-activate a
    project using the default profile. (#1217)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv` would try to prompt for the installation
    of `BiocManager` when activating a project using Bioconductor.
    (#1754)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where directories containing a large number of files
    could cause `renv` to fail to activate a project. (#1733)

    !end-bullet!
-   !begin-bullet!
    Expanded the set of Linux distributions detected for automatic
    transformation of Posit Package Manager URLs to install binary
    packages. `renv` now correctly detects Red Hat Enterprise Linux 9,
    Rocky Linux 8 and 9, SLES 15 SP4 and SP5, Debian 11 and 12,
    AlmaLinux 8 and 9, and Amazon Linux 2. (#1720, #1721)

    !end-bullet!

!end-bullets-16!

# renv 1.0.3

!begin-bullets-17!

-   !begin-bullet!
    Fixed an issue where `renv` could warn the project appeared to be
    out-of-sync when using packages installed without an explicit source
    recorded. (#1683)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` gains the `exclude` argument, which can be useful
    when installing a subset of project dependencies.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where PPM repositories were not appropriately
    transformed into the correct binary repository in `renv::restore()`
    when using pak.

    !end-bullet!
-   !begin-bullet!
    `renv::init()` no longer prompts the user for the intended action
    for projects containing a library with only renv installed. (#1668)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where non-interactive usages of `renv::init()` could
    fail with projects containing a DESCRIPTION file. (#1663)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue that could cause code within a project `.Rprofile` to
    execute before the project had been loaded in RStudio. (#1650)

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` and `renv::status()` gain the `dev` argument.
    This can be used when you'd like to capture package dependencies
    from the *Suggests* field of your package's DESCRIPTION file.
    (#1019)

    !end-bullet!

!end-bullets-17!

# renv 1.0.2

!begin-bullets-18!

-   !begin-bullet!
    renv now parses package `NAMESPACE` files for imported dependencies.
    (#1637)

    !end-bullet!
-   !begin-bullet!
    renv no longer locks the sandbox by default.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv used the wrong library paths when
    attempting to activate the watchdog. This could cause a 10 second
    delay when activating the sandbox.

    !end-bullet!

!end-bullets-18!

# renv 1.0.1

!begin-bullets-19!

-   !begin-bullet!
    Fixed an issue where authentication headers could be duplicated when
    using the `libcurl` download method. (#1605)

    !end-bullet!
-   !begin-bullet!
    `renv::use()` now defaults to setting `isolate = TRUE` when
    `sandbox = TRUE`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the renv watchdog could fail to load, leading
    to slowness in activating the sandbox on startup. (#1617)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv did not display warnings / errors from
    `renv::snapshot()` when `options(renv.verbose = FALSE)` was set. The
    display of these messages is now controlled via the
    `renv.caution.verbose` R option. (#1607, #1608)

    !end-bullet!
-   !begin-bullet!
    `renv::load()` now notifies the user if the synchronization check
    took an excessive amount of time due to the number of files being
    scanned in the project. (#1573)

    !end-bullet!
-   !begin-bullet!
    `renv::init()` gains the `load` argument, making it possible to
    initialize a project without explicitly loading it. (#1583)

    !end-bullet!
-   !begin-bullet!
    renv now uses a lock when synchronizing installed packages with the
    cache. This should help alleviate issues that can arise when
    multiple R processes are installing and caching packages
    concurrently. (#1571)

    !end-bullet!
-   !begin-bullet!
    Fixed a regression in parsing expressions within R Markdown chunk
    options. (#1558)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue that prevented `renv::install()` from functioning
    when source-only repositories were included. (#1578)

    !end-bullet!
-   !begin-bullet!
    Fixed a logic error in reading `RENV_AUTOLOAD_ENABLED`. (#1580)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` no longer runs without prompting on load if the
    library is empty. (#1543)

    !end-bullet!
-   !begin-bullet!
    `renv::repair()` now checks for installed packages which lack a
    known remote source, and updates their `DESCRIPTION` files if it can
    infer an appropriate remote source. This typically occurs when a
    package is installed from local sources, but appears to be
    maintained or published on a remote repository (e.g. GitHub). This
    was previously done in `renv::snapshot()`, but we've rolled back
    that change as the prompting was over-aggressive. (#1574)

    !end-bullet!
-   !begin-bullet!
    `renv::status()` now first reports on uninstalled packages, before
    reporting on used \<-\> installed mismatches. (#1538)

    !end-bullet!
-   !begin-bullet!
    When the `RENV_STARTUP_DIAGNOSTICS` environment variable is set to
    `TRUE`, renv now displays a short diagnostics report after a
    project's autoloader has been run. This can be useful when
    diagnosing why renv is slow to load in certain projects. (#1557)

    !end-bullet!
-   !begin-bullet!
    renv now ensures the sandbox is activated on load, for R processes
    which are launched with the renv sandbox on the library paths.
    (#1565)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` no longer erroneously prompts when determining the
    packages which need to be installed. (#1544)

    !end-bullet!
-   !begin-bullet!
    `renv::update()` now ensures the `prompt` parameter is properly
    respected during package installation. (#1540)

    !end-bullet!
-   !begin-bullet!
    `renv::activate()` no longer erroneously preserves the previous
    library paths after restarting the session within RStudio. (#1530)

    !end-bullet!
-   !begin-bullet!
    Use correct spelling of IRkernel package (#1528).

    !end-bullet!
-   !begin-bullet!
    Honor `R_LIBCURL_SSL_REVOKE_BEST_EFFORT` when using an external
    `curl.exe` binary to download files. (#1624)

    !end-bullet!

!end-bullets-19!

# renv 1.0.0

## New features

!begin-bullets-20!

-   !begin-bullet!
    New `renv::checkout()` installings the latest-available packages
    from a repository. For example,
    `renv::checkout(date = "2023-02-08")` will install the packages
    available on 2023-02-08 from the Posit Package Manager repository.
    The `actions` argument allows you choose whether a lockfile is
    generated from the provided repositories ("snapshot"), or whether
    packages are installed from the provided repositories ("restore").

    !end-bullet!
-   !begin-bullet!
    `renv::deactivate()` gains a `clean` argument: when `TRUE` it will
    delete all renv files/directories, leaving the project the way it
    was found.

    !end-bullet!
-   !begin-bullet!
    `renv::init()` now uses Posit Public Package Manager by default, for
    new projects where the repositories have not already been configured
    externally. See the options `renv.config.ppm.enabled`,
    `renv.config.ppm.default`, and `renv.config.ppm.url` in `?config`
    for more details (#430).

    !end-bullet!
-   !begin-bullet!
    `renv::lockfile_create()`, `renv::lockfile_read()`,
    `renv::lockfile_write()` and `renv::lockfile_modify()` provide a
    small family of functions for interacting with renv lockfiles
    programmatically (#1438).

    !end-bullet!
-   !begin-bullet!
    Handling of development dependencies has been refined.
    `renv::snapshot()` and `renv::status()` no longer track development
    dependencies, while `install()` continues to install them (#1019).
    `Suggested` packages listed in `DESCRIPTION` files are declared as
    development dependencies regardless of whether or not they're a
    "package" project.

    !end-bullet!
-   !begin-bullet!
    MRAN integration is now disabled by default, pending the upcoming
    shutdown of Microsoft's MRAN service. Users who require binaries of
    older R packages on Windows + macOS can consider using the instance
    of CRAN mirrored by the Posit Public Package Manager (#1343).

    !end-bullet!

!end-bullets-20!

## Bug fixes and minor improvements

!begin-bullets-21!

-   !begin-bullet!
    Development versions of renv are now tracked using the Git SHA of
    the current commit, rather than a version number that's incremented
    on every change (#1327). This shouldn't have any user facing impact,
    but makes renv maintenance a little easier.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue causing "restarting interrupted promise evaluation"
    warnings to be displayed when querying available packages failed.
    (#1260)

    !end-bullet!
-   !begin-bullet!
    `renv::activate()` uses a three option menu that hopefully make your
    choices more clear (#1372).

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` now discovers R package dependencies inside
    Jupyter notebooks (#929).

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` includes packages used by user profile
    (`~/.Rprofile`) if `renv::config$user.profile()` is `TRUE`. They are
    set as development dependencies, which means that they will be
    installed by `install()` but not recorded in the snapshot.

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` only extracts dependencies from text in YAML
    headers that looks like valid R code (#1288).

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` no longer treats `box::use(module/file)` as
    using package `module` (#1377).

    !end-bullet!
-   !begin-bullet!
    `renv::init()` now prompts the user to select a snapshot type if the
    project contains a top-level DESCRIPTION file (#1485).

    !end-bullet!
-   !begin-bullet!
    `renv::install(type = "source")` now ensures source repositories are
    used in projects using PPM. (#927)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` activates Bioconductor repositories when
    installing a package from a remote (e.g. GitHub) which declares a
    Bioconductor dependency (via a non-empty 'biocViews' field) (#934).

    !end-bullet!
-   !begin-bullet!
    `renv::install()` respects the project snapshot type, if set.

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now keeps source when installing packages from
    source (#522).

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now validates that binary packages can be loaded
    after installation, in a manner similar to source packages (#1275).

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now supports Bioconductor remotes of the form
    `bioc::<BiocVersion>/<Package>`, for installing packages from a
    particular version of Bioconductor. Aliases like 'release' and
    'devel' are also supported (#1195).

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now requires interactive confirmation that you
    want to install packages (#587).

    !end-bullet!
-   !begin-bullet!
    `renv::load()` gives a more informative message if a lockfile is
    present but no packages are installed (#353).

    !end-bullet!
-   !begin-bullet!
    `renv::load()` no longer attempts to query package repositories when
    checking if a project is synchronized (#812).

    !end-bullet!
-   !begin-bullet!
    `renv::load()` no longer duplicates entries on the `PATH`
    environment variable (#1095).

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` can now use `pak::pkg_install()` to install
    packages when `pak` integration is enabled. Set
    `RENV_CONFIG_PAK_ENABLED = TRUE` in your project's `.Renviron` if
    you'd like to opt-in to this behavior. Note that this requires a
    nightly build of `pak` (\>= 0.4.0-9000); see
    https://pak.r-lib.org/dev/reference/install.html for more details.

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` now emits an error if called within a project that
    does not contain a lockfile (#1474).

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` correctly restores packages downloaded and
    installed from r-universe (#1359).

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` now standardises pak metadata so CRAN packages
    installed via pak look the same as CRAN packages installed with renv
    or `install.packages()` (#1239).

    !end-bullet!
-   !begin-bullet!
    If `renv::snapshot()` finds missing packages, a new prompt allows
    you to install them before continuing (#1198).

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` no longer requires confirmation when writing the
    first snapshot, since that's an action that can easily be undone (by
    deleting `renv.lock`) (#1281).

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` reports if the R version changes, even if no
    packages change (#962).

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot(exclude = <...>)` no longer warns when attempting to
    exclude a package that is not installed (#1396).

    !end-bullet!
-   !begin-bullet!
    `renv::status()` now uses a more compact display when packages have
    some inconsistent combination of being installed, used, and
    recorded.

    !end-bullet!
-   !begin-bullet!
    `renv::status()` now works more like `renv::restore()` when package
    versions are different (#675).

    !end-bullet!
-   !begin-bullet!
    `renv::update()` can now update packages installed from GitLab
    (#136) and BitBucket (#1194).

    !end-bullet!
-   !begin-bullet!
    `renv::settings$package.dependency.fields()` now only affects
    packages installed directly by the user, not downstream dependencies
    of those packages.

    !end-bullet!
-   !begin-bullet!
    renv functions give a clearer error if `renv.lock` has somehow
    become corrupted (#1027).

    !end-bullet!

!end-bullets-21!

# renv 0.17.3

!begin-bullets-22!

-   !begin-bullet!
    Fixed an issue where `renv::install("bioc::<package>")` could fail
    if `BiocManager` was not already installed. (#1184)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where package names were not included in the output
    of `renv::diagnostics()`. (#1182)

    !end-bullet!
-   !begin-bullet!
    The clarity of the message printed by `renv::status()` has been
    improved; in particular, renv should better report the recommended
    actions when a package required by the project is not installed.

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` gains the `exclude` argument, for explicitly
    excluding certain packages from the generated lockfile.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv was passing the wrong argument name to
    `installed.packages()`, causing usages of renv to fail with R (\<=
    3.4.0). (#1173)

    !end-bullet!
-   !begin-bullet!
    renv now sets the `SDKROOT` environment variable on macOS if it
    detects that R was built using an LLVM build of `clang` on macOS.

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now parses the remotes included within, for
    example, a `DESCRIPTION` file's `Config/Needs/...` field.

    !end-bullet!
-   !begin-bullet!
    renv now checks that the index directory is writable before
    attempting to use it, e.g. for the `R` available packages index
    maintained by renv. (#1171)

    !end-bullet!
-   !begin-bullet!
    renv now checks that the version of `curl` used for downloads
    appears to be functional, and reports a warning if it does not (for
    example, because a requisite system library is missing). The version
    of `curl` used for downloads can also be configured via the
    `RENV_CURL_EXECUTABLE` environment variable.

    !end-bullet!

!end-bullets-22!

# renv 0.17.2

!begin-bullets-23!

-   !begin-bullet!
    Fixed a regression that caused package hashes to be computed
    incorrectly in some cases. This was a regression in the 0.17.1
    release. (#1168)
    !end-bullet!

!end-bullets-23!

# renv 0.17.1

!begin-bullets-24!

-   !begin-bullet!
    renv gains the configuration option `install.remotes`, which can be
    used to control whether renv attempts to read and use the `Remotes:`
    field included with installed packages. This can be set to `FALSE`
    if you'd like to ignore this field; e.g. because you know they will
    not be accessible. (#1133)

    !end-bullet!
-   !begin-bullet!
    General performance optimizations. In particular,
    `renv::update(check = TRUE)` should now execute much faster.

    !end-bullet!
-   !begin-bullet!
    renv now stores project settings within `renv/settings.json` rather
    than `renv/settings.dcf`. Old settings will be automatically
    migrated.

    !end-bullet!
-   !begin-bullet!
    The renv sandbox is now placed within the renv cache directory.
    (#1158)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::status()` could erroneously report a
    project was out-of-sync when using explicit snapshots. (#1159)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::hydrate()` would print spurious
    warnings. (#1160)

    !end-bullet!
-   !begin-bullet!
    `renv::status()` now suggests running `renv::restore()` if there are
    no packages installed in the project library. (#1060)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv would fail to query r-universe
    repositories. (#1156)

    !end-bullet!
-   !begin-bullet!
    renv no longer tries to set the `SDKROOT` environment variable on
    macOS for R (\>= 4.0.0).

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where installation of Bioconductor packages could
    fail when `BiocManager` was not installed. (#1156, #1155)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the amount of time elapsed reported by
    `renv::install()` failed to include the time spent retrieving
    packages.

    !end-bullet!

!end-bullets-24!

# renv 0.17.0

!begin-bullets-25!

-   !begin-bullet!
    The performance of `renv::snapshot()` has improved.

    !end-bullet!
-   !begin-bullet!
    renv now maintains an index of available packages, as retrieved from
    the active package repositories, that is shared across `R` sessions.
    This should improve renv's performance when querying for available
    packages across multiple different `R` sessions.

    !end-bullet!
-   !begin-bullet!
    `renv::hydrate()` gains the `prompt` parameter. When `TRUE` (the
    default), renv will prompt for confirmation before attempting to
    hydrate the active library.

    !end-bullet!
-   !begin-bullet!
    Improved handling of package installation via SSH URLs with `git`.
    (#667)

    !end-bullet!
-   !begin-bullet!
    Improved handling of R version validation when using projects with
    Bioconductor. If you find renv is erroneously reporting that your
    version of R is incompatible with the version of Bioconductor you
    are using, you can set `options(renv.bioconductor.validate = FALSE)`
    to disable this validation behaviour. (#1148)

    !end-bullet!
-   !begin-bullet!
    Package names can now be associated with remotes in
    `renv::install()`; for example, you can use
    `renv::install("igraph=igraph/rigraph")` to install the `igraph`
    package. This is mainly important when using the `renv.auth`
    authentication tools, where the package name of a remote needs to be
    declared explicitly. (#667)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue that could prevent `renv::restore()` from functioning
    when attempting to install packages which had been archived on CRAN.
    (#1141)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` gains the `dependencies` argument, which behaves
    similarly to the equivalent argument in `remotes::install_*()`. In
    particular, this can be set to fields like `Config/Needs/dev` to
    tell renv to use custom DESCRIPTION fields for dependency resolution
    in installation.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the function variant of the `renv.auth` option
    was not resolved correctly. (#667)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now supports remotes with a trailing slash -- such
    slashes are now removed. (#1135)

    !end-bullet!
-   !begin-bullet!
    Integration with the RStudio (Posit) Package Manager is now disabled
    by default on aarch64 Linux instances.

    !end-bullet!
-   !begin-bullet!
    The `RENV_CACHE_MODE` environment variable can now also be used to
    adjust the permissions set on downloaded package tarballs /
    binaries. (#988)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where fields of the form `Remotes.1` could enter
    lockfile records for older versions of R. (#736)

    !end-bullet!
-   !begin-bullet!
    Fixed the performance of `renv::update()` in cases where integration
    with MRAN is enabled.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where package installation using `pak` could fail in
    some cases.

    !end-bullet!
-   !begin-bullet!
    `renv_file_find()` can now scan up to the root directory in Docker
    containers. (#1115)

    !end-bullet!
-   !begin-bullet!
    renv no longer uses the R temporary directory on Windows for the
    sandbox. The sandbox directory can be customized via the
    `RENV_PATHS_SANDBOX` environment variable if required. (#835)

    !end-bullet!
-   !begin-bullet!
    renv now reports the elapsed time when installing packages. (#1104)

    !end-bullet!
-   !begin-bullet!
    For projects using "explicit" snapshots, renv now reports if a
    package is required by the project, but the package is not currently
    installed. (#949)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::snapshot()` could fail to detect when no
    changes had been made to the lockfile.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could emit JSON lockfiles which could not
    be parsed by external JSON readers. (#1102)

    !end-bullet!
-   !begin-bullet!
    renv now marks the sandbox as non-writable, which should hopefully
    alleviate issues where attempts to update installed packages would
    inadvertently install the updated package into the sandbox. (#1090)

    !end-bullet!
-   !begin-bullet!
    `renv::use()` gains the `sandbox` argument, which allows one to
    control whether the system library is sandboxed after a call to
    `renv::use()`. (#1083)

    !end-bullet!
-   !begin-bullet!
    The path to the Conda `environment.yml` file created by renv can now
    be customized via the `RENV_PATHS_CONDA_EXPORT` environment
    variable. We recommend setting this within your project-local
    `.Renviron` file as appropriate. (#1089)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the renv sandbox location did not respect the
    active renv profile. (#1088)

    !end-bullet!

!end-bullets-25!

# renv 0.16.0

!begin-bullets-26!

-   !begin-bullet!
    renv now supports installation of packages with remotes of the form
    `<package>=<remote>`. However, the provided package name is ignored
    and is instead parsed from the remote itself. (#1064)

    !end-bullet!
-   !begin-bullet!
    renv now passes along the headers produced by the
    `renv.download.headers` option when bootstrapping itself in the call
    to `utils::download.file()`. (#1084)

    !end-bullet!
-   !begin-bullet!
    renv now reports if `renv::snapshot()` will change or update the
    version of R recorded in the lockfile. (#1069)

    !end-bullet!
-   !begin-bullet!
    renv now supports the `install.packages.check.source` R option,
    which is used to allow R to query source repositories even if the
    option `options(pkgType = "binary")` is set. (#1074)

    !end-bullet!
-   !begin-bullet!
    renv better handles packages containing git submodules when
    installed from GitHub remotes. (#1075)

    !end-bullet!
-   !begin-bullet!
    renv now handles local sources within the current working directory.
    (#1079)

    !end-bullet!
-   !begin-bullet!
    The renv sandbox is once again enabled by default. On Unix, the
    sandbox is now created by default within the project's
    `renv/sandbox` library. On Windows, the sandbox is created within
    the R session's `tempdir()`. The path to the renv sandbox can be
    customized via the `RENV_PATHS_SANDBOX` environment variable if
    required.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::status()` could report spurious changes
    when comparing packages installed using `pak` in some cases. (#1070)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` now also ensures the project activate script is
    updated after a successful restore. (#1066)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could attempt to install a package from
    the repository archives even when `type = "binary"` was set. (#1046)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where package installation could fail when the R
    session is configured to use multiple repositories, some of which do
    not provide any information on available packages for certain binary
    arms of the repository. (#1045)

    !end-bullet!
-   !begin-bullet!
    renv now uses `jsonlite` for reading lockfiles when loaded. This
    should help ensure useful errors are provided for manually-edited
    lockfiles which contain a JSON parsing error. If the `jsonlite`
    package is not loaded, renv will fall back to its own internal JSON
    parser. (#1027)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue that would cause renv to fail to source the user
    `~/.Rprofile` if it attempted to register global calling handlers,
    e.g. as `prompt::set_prompt()` does. (#1036)

    !end-bullet!
-   !begin-bullet!
    (Linux only) renv now resets ACLs on packages copied to the cache,
    to avoid persisting default ACLs that might have been inherited on
    packages installed into a local project library. If desired, this
    behavior can be disabled by setting the `RENV_CACHE_ACLS`
    environment variable to `FALSE`. If you need finer control over ACLs
    set on packages moved into the cache, consider defining a custom
    callback via the `renv.cache.callback` R option. (#1025)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `.gitignore` inclusion rules for
    sub-directories were not parsed correctly by renv for dependency
    discovery. (#403)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could report spurious diffs within
    `renv::status()` when comparing package records installed from `pak`
    versus the default R package installer. (#998)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::use_python()` could cause the
    Requirements field for packages in the lockfile to be
    unintentionally dropped. (#974)

    !end-bullet!
-   !begin-bullet!
    The R option `renv.cache.callback` can now be set, to run a
    user-defined callback after a package has been copied into the
    cache. This can be useful if you'd like to take some action on the
    cached package's contents after the package has been moved into the
    cache.

    !end-bullet!
-   !begin-bullet!
    (Unix only) The `RENV_CACHE_MODE` environment variable can now be
    used to change the access permissions of packages copied into the
    cache. When set, after a package is copied into the cache, renv will
    use `chmod -Rf` to try and change the permissions of the cache entry
    to the requested permissions.

    !end-bullet!
-   !begin-bullet!
    (Unix only) The `RENV_CACHE_USER` environment variable can now be
    used to change the ownership of folders copied into the cache. When
    set, after a package is copied into the cache, renv will use
    `chown -Rf` to try and change the ownership of that cache entry to
    the requested user account.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where repositories containing multiple packages in
    sub-directories could fail to install. (#1016)

    !end-bullet!

!end-bullets-26!

# renv 0.15.5

!begin-bullets-27!

-   !begin-bullet!
    Fixed an issue where indexing of packages in the package cellar
    could be slow. (#1014)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where installation of packages from Bioconductor's
    binary Linux package repositories could fail. (#1013)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` now supports restoration of packages installed
    from R-Forge. (#671)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::init(bioconductor = TRUE)` would not
    update the version of Bioconductor used if a project setting had
    already been set.

    !end-bullet!
-   !begin-bullet!
    It is now possible to "update" an existing lockfile by using
    `renv::snapshot(update = TRUE)`. When set, any records existing in
    the old lockfile, but not the new lockfile, will be preserved.
    (#727)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to parse Git remotes for users
    whose username contains a number. (#1004)

    !end-bullet!
-   !begin-bullet!
    renv no longer infers a dependency on the "quarto" R package in
    projects containing a `_quarto.yml` file. (#995)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to download a package from MRAN
    if a compatible source package of the same version was available
    from the active R repositories. (#990)

    !end-bullet!
-   !begin-bullet!
    renv now reports permission errors during download more clearly.
    (#985)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `RENV_PATHS_LIBRARY_ROOT_ASIS` was not
    interpreted correctly. (#976)

    !end-bullet!
-   !begin-bullet!
    `renv::modify()` gains the `changes` argument, which can be used to
    modify a project lockfile non-interactively.

    !end-bullet!
-   !begin-bullet!
    `renv::clean()` now returns the project directory, as documented.
    (#922)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to parse embedded YAML chunk
    options in R Markdown documents. (#963)

    !end-bullet!
-   !begin-bullet!
    renv now sets default placeholder names for the `repos` R option,
    for any repository URLs which happen to be unnamed. (#964)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv didn't respect the `PATH` ordering when
    discovering Python installations via `renv_python_discover()`.
    (#961)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to install packages containing
    multibyte unicode characters in their DESCRIPTION file. (#956)

    !end-bullet!
-   !begin-bullet!
    Fixed detection of Rtools 4.2 (#1002)

    !end-bullet!

!end-bullets-27!

# renv 0.15.4

!begin-bullets-28!

-   !begin-bullet!
    Fixed an issue where package installation could fail when
    referencing the cache via a tilde-aliased path,
    e.g. `~/.local/share/renv`. (#953)
    !end-bullet!

!end-bullets-28!

# renv 0.15.3

!begin-bullets-29!

-   !begin-bullet!
    A variety of fixes for R CMD check.

    !end-bullet!
-   !begin-bullet!
    renv gains an experimental function, `renv::autoload()`, to be used
    as a helper for automatically loading a project for R processes
    launched within a sub-directory of that project. See
    `?renv::autoload` for more details.

    !end-bullet!
-   !begin-bullet!
    renv will now print a warning message when attempting to read a
    lockfile containing merge conflict markers (as from e.g. a git
    merge). (#945)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install()` could install into the wrong
    library path on Windows, if the R installation had a site-wide
    profile that mutated the library paths. (#941)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install()` would fail to find a package
    within the cache when using an abbreviated commit hash for
    installation. (#943)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv's automatic snapshot was not run after
    calls to `renv::install()` in some cases. (#939)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv would incorrectly copy a package from the
    cache, if the cached version of the package and the requested
    version of the package had the same package version, even if they
    were retrieved from different sources. (#938)

    !end-bullet!
-   !begin-bullet!
    The path to an renv tarball can now be set via the environment
    variable `RENV_BOOTSTRAP_TARBALL`, to be used to help renv bootstrap
    from local sources. This can either be the path to a directory
    containing renv source tarballs, or the path to the tarball itself.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the R site library would not be appropriately
    masked for resumed RStudio sessions. (#936)

    !end-bullet!

!end-bullets-29!

# renv 0.15.2

!begin-bullets-30!

-   !begin-bullet!
    Fixed issues encountered in R CMD check.
    !end-bullet!

!end-bullets-30!

# renv 0.15.1

!begin-bullets-31!

-   !begin-bullet!
    Fixed an issue where renv inadvertently inserted extra newlines into
    a `DESCRIPTION` file when adding `Remotes` fields after install.
    (#914)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where packages installed from a remote sub-directory
    would fail to install when later re-installed from the cache. (#913)

    !end-bullet!
-   !begin-bullet!
    renv now recognizes YAML chunk options of the form `#| key: value`
    when used in R Markdown documents. (#912)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the R site library was visible in renv projects
    with the system library sandbox disabled.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could update the wrong `.gitignore` in R
    processes launched by `callr` (e.g. in `devtools::install`). (#910)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to read mis-encoded DESCRIPTION
    files. (#908)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `config$cache.symlinks()` would report `NULL`
    when unset. (#906)

    !end-bullet!

!end-bullets-31!

# renv 0.15.0

!begin-bullets-32!

-   !begin-bullet!
    The development branch for renv has moved from master to main.

    !end-bullet!
-   !begin-bullet!
    renv package records in the lockfile now include a `Requirements`
    entry, which gives a list of R packages this package depends on in
    some way. This is primarily for internal use by the `pak` package.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where packages containing DESCRIPTION files using a
    latin1 encoding would not be read correctly by renv.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue that could cause `renv::dependencies()` to fail when
    a malformed `DESCRIPTION` file was encountered. (#892)

    !end-bullet!
-   !begin-bullet!
    The path to the project-local renv folder can now be configured via
    the `RENV_PATHS_RENV` environment variable. This can be useful if
    you'd prefer to store your project's renv resources within an
    alternate location in the project. (#472)

    !end-bullet!
-   !begin-bullet!
    renv now uses an external library by default for R package projects,
    with the library located within
    `tools::R_user_dir("renv", "cache")`. This directory can be
    configured via the `RENV_PATHS_LIBRARY_ROOT` environment variable if
    desired. See `vignette("packages", package = "renv")` for more
    details. (#384)

    !end-bullet!
-   !begin-bullet!
    renv now uses the repositories as defined within the project
    lockfile (if any) when attempting to bootstrap itself in a project.
    (#820)

    !end-bullet!
-   !begin-bullet!
    The renv sandbox is now disabled by default -- see #614 for more
    details.

    !end-bullet!
-   !begin-bullet!
    renv gains the function `repair()`, to be used to attempt to repair
    the project library when links into the global package cache appear
    to be broken. (#378)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the staging library used during install could
    fail to inherit the same directory permissions as the target library
    itself. (#331)

    !end-bullet!
-   !begin-bullet!
    Fixed an regression which caused `renv::history()` to fail. (#886)

    !end-bullet!
-   !begin-bullet!
    renv gains experimental support for the pak package. Set
    `RENV_CONFIG_PAK_ENABLED = TRUE` in an appropriate `.Renviron` file
    to enable `pak` integration. When enabled, calls to
    `renv::install()` will use `pak` to download and install packages.

    !end-bullet!
-   !begin-bullet!
    `renv::init()` gains the `bioconductor` argument, to be used to
    initialize a project with a particular Bioconductor release. You can
    also use `renv::init(bioconductor = TRUE)` to initialize with the
    latest-available release for the version of R being used.

    !end-bullet!
-   !begin-bullet!
    Project settings can now be overridden by setting an R option of the
    same name. For example, one could force a project to use
    Bioconductor 3.14 by setting
    `options(renv.settings.bioconductor.version = "3.14")` within the
    project `.Rprofile` (or similar startup R profile).

    !end-bullet!
-   !begin-bullet!
    The ad-hoc package repository called "local sources" has been
    renamed to the "package cellar". In addition, the path to the cellar
    is now controlled by the `RENV_PATHS_CELLAR` environment variable,
    rather than `RENV_PATHS_LOCAL`. This change was made to reduce
    confusion between "local sources" of packages located somewhere on
    the filesystem, as opposed to packages explicitly placed in this
    ad-hoc repository. `RENV_PATHS_LOCAL` remains supported for
    backwards compatibility.

    !end-bullet!
-   !begin-bullet!
    The `RENV_PATHS_CELLAR` environment variable can now be set to
    multiple paths. Use `;` as a separator between paths; for example,
    `RENV_PATHS_LOCAL=/path/to/sources/v1;/path/to/sources/v2`. (#550)

    !end-bullet!
-   !begin-bullet!
    Packages installed via e.g. `renv::install("./path/to/package")`
    will now retain the relative path to that package within the
    lockfile. (#873)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where invalid `config` option values were not
    properly reported. (#773)

    !end-bullet!
-   !begin-bullet!
    renv now supports restoration of packages installed via one of the
    r-universe repositories.

    !end-bullet!
-   !begin-bullet!
    renv gains the `bioconductor.version` project setting, used to
    freeze the version of Bioconductor used in a particular project.
    When set, this will override any version that might be selected via
    the `BiocManager` package. (#864)

    !end-bullet!
-   !begin-bullet!
    renv now infers that parameterized R Markdown documents have a
    dependency on the `shiny` package. In addition, R code included
    within the `params:` list will be parsed for dependencies. (#859)

    !end-bullet!
-   !begin-bullet!
    renv now ignores hidden directories during dependency discovery by
    default. If you want to force a particular hidden directory to be
    included for discovery, you can use a `.renvignore` file with an
    explicit inclusion criteria; e.g. `!.hidden/`.

    !end-bullet!
-   !begin-bullet!
    renv now supports the `*release` remotes specifier for GitHub
    repositories, for requesting installation of the latest declared
    release of a package from GitHub. (#792)

    !end-bullet!
-   !begin-bullet!
    renv now handles packages stored within the sub-directory of a Git
    repository better. (#793)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::history()` would fail to resolve the
    correct lockfile path if the working directory was changed. (#834)

    !end-bullet!
-   !begin-bullet!
    Refined dependency discovery within `glue::glue()` expressions.

    !end-bullet!
-   !begin-bullet!
    renv now parses packages referenced via the `base_format` field
    within an R Markdown document's YAML header. (#854)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv would fail to produce the appropriate
    binary repository URL for RSPM repositories built using Red Hat
    Enterprise Linux.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::snapshot()` could cause the environment
    name and / or path associated with a Python environment to be
    omitted from the lockfile. (#843)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::restore()` could fail to restore
    packages which referred to their source via an explicit path in the
    `Source` field. (#849)

    !end-bullet!
-   !begin-bullet!
    renv no longer requires explicit user consent when used within
    Singularity containers. (#824, @kiwiroy)

    !end-bullet!
-   !begin-bullet!
    renv now respects the `R_PROFILE_USER` environment variable, in
    addition to the `user.profile` configuration option, when
    considering whether the user `.Rprofile` should be examined for
    package dependencies. (#821)

    !end-bullet!
-   !begin-bullet!
    The renv auto-loader can now be disabled by setting the environment
    variable `RENV_AUTOLOADER_ENABLED = FALSE`. This can be useful if
    you'd like to explicitly control how a project is loaded, e.g. by
    calling `renv::load()` explicitly.

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` gains the `repos` argument, to be used to force
    the lockfile to be generated with the requested set of R
    repositories encoded within.

    !end-bullet!
-   !begin-bullet!
    renv now validates that the `repos` option, as used by
    `renv::snapshot()`, is a named vector. (#811)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv's shims, e.g. for `install.packages()`,
    failed to pass along other optional arguments to the shimmed
    function correctly. (#808)

    !end-bullet!

!end-bullets-32!

# renv 0.14.0

!begin-bullets-33!

-   !begin-bullet!
    renv now uses `tools::R_user_dir()` to resolve the default path to
    the global renv cache, for R installations 4.0.0 or greater. If the
    renv cache still exists at the old location, that location will be
    used instead. This change should only affect brand new installations
    of renv on newer versions of `R`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue with renv tests failing with R (\>= 4.2.0).

    !end-bullet!
-   !begin-bullet!
    renv will no longer auto-activate itself within R processes launched
    via `R CMD INSTALL`. This behavior can be controlled if necessary
    via the `RENV_ACTIVATE_PROJECT` environment variable -- set this to
    `TRUE` to force the project in the current working directory to be
    activated, and `FALSE` to suppress the renv auto-loader altogether.
    (#804)

    !end-bullet!
-   !begin-bullet!
    Added dependency discovery support for R utility scripts identified
    by a shebang line instead of a file extension. (#801; @klmr)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install("<package>", type = "both")`
    would attempt to install the package from sources, even if the
    current system did not have the requisite build tools available.
    (#800)

    !end-bullet!
-   !begin-bullet!
    `renv::scaffold()` gains the `settings` argument, used to create a
    project scaffolding with some default project options set. (#791)

    !end-bullet!
-   !begin-bullet!
    renv now determines the default branch name for packages installed
    from GitLab without an explicit reference supplied; for example, as
    in `renv::install("gitlab::<user>/<repo>")`. (#795)

    !end-bullet!
-   !begin-bullet!
    renv now infers a dependency on the `bslib` package for R Markdown
    documents using custom themes. (#790)

    !end-bullet!
-   !begin-bullet!
    renv will now prompt users to activate the current project when
    calling `renv::snapshot()` or `renv::restore()` from within a
    project that has not yet been activated. (#777)

    !end-bullet!
-   !begin-bullet!
    renv now has improved handling for `git` remotes. (#776;
    @matthewstrasiotto)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` gains the `exclude` argument, used to exclude a
    subset of packages during restore. (#746)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::dependencies()` could fail to parse
    dependencies in calls to `glue::glue()` that used custom open and
    close delimiters. (#772)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::init(bare = TRUE)` would unnecessarily
    scour the project for R package dependencies. (#771)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to install packages located on
    GitHub within sub-subdirectories. (#759)

    !end-bullet!
-   !begin-bullet!
    renv gains the function `embed()`, used to embed a lockfile with an
    R document (via a call to `renv::use()`).

    !end-bullet!
-   !begin-bullet!
    `renv::use()` gains the lockfile argument. This can be useful for R
    Markdown documents and scripts that you'd like to run with the
    context for a particular lockfile applied.

    !end-bullet!
-   !begin-bullet!
    `renv::rebuild()` gains the `type` parameter, for parity with
    `renv::install()`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could incorrectly copy an incompatible
    version of an R package from a site library into the project library
    during install. (#750)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` can now parse (some) usages of
    `parsnip::set_engine()`.

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` now has improved handling for piped
    expressions.

    !end-bullet!
-   !begin-bullet!
    Fixed crash during dependency discovery when encountering
    `box::use()` declarations that use a trailing comma, and no longer
    treat `.` and `..` as package names. (@klmr)

    !end-bullet!
-   !begin-bullet!
    `renv::clean()` no longer attempts to clean the system library by
    default. (#737)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `install.packages()` could fail when used
    within an renv project to install a package from local sources.
    (#724)

    !end-bullet!
-   !begin-bullet!
    The chunk `renv.ignore` parameter can now be set to `FALSE`. When
    set, renv will explicitly parse dependencies from chunks even if
    other chunk metadata would have told renv to ignore it (e.g. because
    it was marked with `eval=F`). (#722)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where chunks with the chunk option `eval=F` would
    still be scanned for dependencies. (#421)

    !end-bullet!
-   !begin-bullet!
    In interactive sessions, `renv::use_python()` will now prompt for
    the version of Python to be used. Python installations in a set of
    common locations will be searched. See `?renv::use_python()` for
    more details.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv would fail to retrieve packages from the
    archives if the lockfile entry was tagged with a `RemoteSha` field.

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` will now prefer restoring packages from the
    repository named in the `Repository` field if available. The name is
    matched against the repository names set in the R `repos` option, or
    as encoded in the renv lockfile. (#701)

    !end-bullet!
-   !begin-bullet!
    renv now supports the discovery of dependencies within interpolated
    strings as used by the `glue` package.

    !end-bullet!
-   !begin-bullet!
    `RENV_CONFIG_EXTERNAL_LIBRARIES` can now be configured to use
    multiple library paths, delimited by either `:`, `;`, or `,`. (#700)

    !end-bullet!
-   !begin-bullet!
    renv gains the configuration option, `exported.functions`,
    controlling which functions and objects are placed on the R search
    path when renv is attached (e.g. via `library(renv)`). Set this to
    `NULL` to instruct renv not to place any functions on the search
    path. This helps avoid issues with, for example, `renv::load()`
    masking `base::load()`. When set, all usages of renv APIs must be
    explicitly qualified with the `renv::` prefix.

    !end-bullet!

!end-bullets-33!

# renv 0.13.2

!begin-bullets-34!

-   !begin-bullet!
    `renv::install("user/repo/subdir with spaces")` now works as
    expected. (#694)

    !end-bullet!
-   !begin-bullet!
    renv can now parse package dependencies declared by
    `targets::tar_option_set(packages = <...>)`. (#698)

    !end-bullet!
-   !begin-bullet!
    renv no longer performs an automatic snapshot following a
    user-canceled renv action -- for example, if `renv::restore()` is
    canceled, the next automatic snapshot will be suppressed. (#697)

    !end-bullet!
-   !begin-bullet!
    Added the `vcs.ignore.local` project setting, to control whether the
    project's `renv/local` folder is added to renv's VCS ignore file
    (e.g. `renv/.gitignore`). (#696)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv's bootstrapping code could inadvertently
    bootstrap with the wrong version of renv, if the source and binary
    versions of renv on CRAN were not in sync. (#695)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::status()` could provide a misleading
    message for packages which are recorded in the lockfile, but not
    explicitly required by the project. (#684)

    !end-bullet!

!end-bullets-34!

# renv 0.13.1

!begin-bullets-35!

-   !begin-bullet!
    `renv::clean()` gains the `actions` argument, allowing the caller to
    control which specific actions are taken during a `clean()`
    operation.

    !end-bullet!
-   !begin-bullet!
    renv no longer performs an automatic snapshot after a call to
    `renv::status()`. (#651)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempts to transform RSPM repository URLs
    could fail if the copy of R was installed without a local
    `CRAN_mirrors.csv` file.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::init()` could fail when passed a
    relative path to a directory. (#673)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::dependencies()` would miss dependencies
    in R Markdown YAML headers containing multiple output formats.
    (#674)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now better respects the `Remotes` field in a
    project `DESCRIPTION` file, if available. (#670)

    !end-bullet!
-   !begin-bullet!
    `RENV_DOWNLOAD_METHOD` is now treated as an alias for
    `RENV_DOWNLOAD_FILE_METHOD`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv would fail to load if the `~/.Rprofile`
    existed but was an empty file.

    !end-bullet!

!end-bullets-35!

# renv 0.13.0

!begin-bullets-36!

-   !begin-bullet!
    `renv::snapshot()` no longer creates an `renv/activate.R` file in
    the project folder if one does not already exist. (#655)

    !end-bullet!
-   !begin-bullet!
    The `renv::hydrate()` function gains the `update` argument, used to
    control whether `renv::hydrate()` chooses to update packages when
    invoked. When set to `TRUE`, if the version of a package installed
    in the source library is newer than that of the project library,
    then renv will copy that version of the package into the project
    library. (#647)

    !end-bullet!
-   !begin-bullet!
    The `RENV_PATHS_PREFIX_AUTO` environment variable can now be set to
    instruct renv to include an OS-specific component as part of the
    library and cache paths. This is primarily useful for Linux systems,
    where one might want to share a global cache with multiple different
    operating systems. The path component is constructed from the `ID`
    and `VERSION_CODENAME` / `VERSION_ID` components of the system's
    `/etc/os-release` file.

    !end-bullet!
-   !begin-bullet!
    renv's dependency discovery machinery now has preliminary support
    for packages imported via the box package;
    e.g. `box::use(dplyr[...])`.

    !end-bullet!
-   !begin-bullet!
    Multiple cache paths can now be specified, with each cache path
    separated by either a `;` or `:`. This can be useful when you'd like
    to use multiple package caches within the same project; for example,
    because you'd like to share a read-only cache with a set of
    projects. (#653, @vandenman)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to discover dependencies in
    directories with very large `.gitignore` or `.renvignore` files.
    (#652)

    !end-bullet!
-   !begin-bullet!
    renv gains a new configuration option, `install.shortcuts`. When
    enabled, if renv discovers that a package to be installed is already
    available in the user or site libraries, renv will instead install a
    copy of that package into the project library. (#636)

    !end-bullet!
-   !begin-bullet!
    renv gains a new function, `renv::use()`, used to download, install,
    and load a set of packages directly within an R script.
    `renv::use()` can make it easier to share a standalone R script,
    with the packages required to install that script embedded directly
    in the script. It is inspired in part by the groundhog package.

    !end-bullet!
-   !begin-bullet!
    `renv::install(".")` can now be used to install a package from
    sources within the current working directory. (#634)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::update()` could fail if a package
    installed from GitHub was missing the `RemoteHost` field in its
    DESCRIPTION file. (#632)

    !end-bullet!
-   !begin-bullet!
    renv now has support for custom project profiles. Profiles can be
    used to activate different sets of project libraries + lockfiles for
    different workflows in a given project. See
    `vignette("profiles", package = "renv")` for more details.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempts to initialize an renv project in a
    path containing non-ASCII characters could fail on Windows. (#629)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install("<package>")` could fail if renv
    chose to install the package from MRAN rather than from one of the
    active package repositories. (#627)

    !end-bullet!
-   !begin-bullet!
    renv again defaults to using the project's `renv/staging` folder for
    staged / transactional installs. Use the
    `RENV_PATHS_LIBRARY_STAGING` environment variable if more granular
    control over the staging library path is required. This fixes issues
    on Windows with creating junction points to the global package cache
    on Windows. (#584)

    !end-bullet!
-   !begin-bullet!
    renv no longer skips downloading a requested source package if an
    existing cached download exists and appears to be valid. This should
    help avoid issues when attempting to install a package whose
    associated tarball has changed remotely. (#504)

    !end-bullet!
-   !begin-bullet!
    During bootstrap, renv will now attempt to download and unpack a
    binary copy of renv if available from the specified package
    repositories.

    !end-bullet!
-   !begin-bullet!
    renv now always attempts to bootstrap itself from the R Project's
    Cloud package repository, as a fallback in case no other repository
    is available. (#613)

    !end-bullet!
-   !begin-bullet!
    `renv::rebuild(<package>)` now uses the latest-available version of
    the requested package(s) if those packages are not currently
    installed.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::restore(library = "/path/to/lib")` would
    fail to restore packages, if those packages were already installed
    on the active library paths (as reported by `.libPaths()`). (#612)

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` gains the `reprex` argument. Set this to `TRUE`
    if you'd like to embed an renv lockfile as part of a reproducible
    example, as generated by the `reprex` package.

    !end-bullet!
-   !begin-bullet!
    `renv::status()` now reports packages that are referenced in a
    project's scripts, but are neither installed in the project library
    nor recorded in the lockfile. (#588)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where package installation could fail if the
    `configure.vars` option was set to be a named character, rather than
    a named list. (#609)

    !end-bullet!

!end-bullets-36!

# renv 0.12.5

!begin-bullets-37!

-   !begin-bullet!
    Fixed an issue where renv would fail to bootstrap. (#608)
    !end-bullet!

!end-bullets-37!

# renv 0.12.4

!begin-bullets-38!

-   !begin-bullet!
    renv now invalidates the available packages cache if the
    `https_proxy` environment variable changes. (#579)

    !end-bullet!
-   !begin-bullet!
    `renv::install(<pkg>)` will now install the latest-available version
    of that package from local sources, if that package is available and
    newer than any package available on the active package repositories.
    (#591)

    !end-bullet!
-   !begin-bullet!
    The configuration option `startup.quiet` has been added, allowing
    one to control whether renv will display the typical startup banner
    when a project is loaded.

    !end-bullet!
-   !begin-bullet!
    renv now better handles being unloaded and reloaded within the same
    R session. In particular, warnings related to a corrupted lazy-load
    database should no longer occur. (#600)

    !end-bullet!
-   !begin-bullet!
    renv no longer reinstalls packages that are already installed and
    up-to-date in bare calls to `renv::install()`.

    !end-bullet!
-   !begin-bullet!
    renv now uses the R temporary directory for staging, when performing
    transactional restores / installs. If you need to control the path
    used for staged installs, please set the
    `RENV_PATHS_LIBRARY_STAGING` environment variable.

    !end-bullet!
-   !begin-bullet!
    The `install.verbose` configuration option has been added. When set
    to `TRUE`, renv will stream the output generated by R when
    performing a package installation. This can be helpful in some cases
    when diagnosing a failed restore / install. (#330)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to parse R Markdown chunk
    headers with an empty label. (#598)

    !end-bullet!
-   !begin-bullet!
    The environment variable `RENV_PATHS_LIBRARY_ROOT_ASIS` can now be
    used to control whether the project name should be used as-is when
    forming the library path within the `RENV_PATHS_LIBRARY_ROOT`
    folder. Set this to `"TRUE"` if you would prefer renv did not append
    a unique identifier to your project's library path. (#593)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where GitLab references were not URL encoded. (#590)

    !end-bullet!
-   !begin-bullet!
    renv no longer emits warnings when parsing multi-mode R files that
    make use of re-used knitr chunks (those specified as `<<label>>`).
    (#586)

    !end-bullet!
-   !begin-bullet!
    The library used for staged installs can now be configured via the
    `RENV_PATHS_LIBRARY_STAGING` environment variable. (#584)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where bootstrapping an older version of renv could
    fail if the R repositories had not been appropriately set.

    !end-bullet!

!end-bullets-38!

# renv 0.12.3

!begin-bullets-39!

-   !begin-bullet!
    Fixed an issue where `renv::dependencies()` could give an error if
    called with a `path` argument of length \> 1.

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` gains the `rebuild` argument, allowing users to
    control whether packages should be rebuilt on `restore()` rather
    than installed via links or copies from the cache, or other sources
    providing already-installed packages.

    !end-bullet!
-   !begin-bullet!
    renv will now attempt to bootstrap itself from CRAN, in addition to
    any repositories declared via `getOption("repos")`. If you'd prefer
    to disable this behavior, you can set
    `options(renv.bootstrap.repos = character())`.

    !end-bullet!
-   !begin-bullet!
    The renv setting `r.version` has been added. This can be set if
    you'd like to associate a particular project with a specific version
    of R, independent of the version of R actually used when subsequent
    lockfiles are created via `renv::snapshot()`. For example, setting
    `renv::settings$r.version("4.0")` will ensure that R version `"4.0"`
    is encoded in the lockfile for future calls to `renv::snapshot()` in
    a project. (#254)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` now detects the usage of R packages within
    dotfiles; e.g. the project `.Rprofile`. (#569)

    !end-bullet!
-   !begin-bullet!
    `renv::status()` gains the `cache` argument, used to control whether
    `renv::status()` also performs diagnostics on the global package
    cache. (#570)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::status()` would make an un-necessary
    call to `renv::dependencies()`. (#570)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where
    `renv::install("bioc::<package>", rebuild = TRUE)` would fail to
    install the requested package. (#565)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the repository name for a package installed
    from an R package repository was sometimes incorrect. (#402)

    !end-bullet!
-   !begin-bullet!
    When `RENV_PATHS_LIBRARY_ROOT` is set, renv will now disambiguate
    library paths based on a hash of the project's path. (#564)

    !end-bullet!

!end-bullets-39!

# renv 0.12.2

!begin-bullets-40!

-   !begin-bullet!
    renv no longer errs when running tests with
    `_R_CHECK_SUGGESTS_ONLY_=false`.
    !end-bullet!

!end-bullets-40!

# renv 0.12.1

!begin-bullets-41!

-   !begin-bullet!
    renv now ensures all of its dependencies are loaded eagerly when
    running tests, to avoid issues with missing + lazily-loaded
    packages.

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` now accepts library paths specified with a
    relative path. (#562)

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` no longer excludes the project itself, for `R`
    package projects that use golem. (#538)

    !end-bullet!
-   !begin-bullet!
    The renv configuration option `cache.symlinks` can now be used to
    control whether renv used symlinks into the cache, as opposed to
    full package copies. Please see `?renv::config` for more details.
    (#556)

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` gains the `packages` argument, to be used when
    creating a lockfile that captures a specific set of packages and
    their dependencies. renv will use the currently-installed versions
    of those packages when determining the package records to be written
    to the lockfile. (#554)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` now accepts an R function as the first
    argument, for finding the packages used by a particular function.
    Currently, package usages must be prefixed with `::` to be detected.
    (#554)

    !end-bullet!
-   !begin-bullet!
    `renv::record(<package>)` now ensures that the latest-available
    version of that package is recorded in the lockfile. Previously, a
    package record without any specified version was added instead. For
    existing records without a recorded version, the latest-available
    version on the package repositories will be used during `restore()`
    instead. (#540)

    !end-bullet!
-   !begin-bullet!
    renv now reads the default branch tagged for repositories created on
    GitHub, ensuring that calls of the form
    `renv::install("<user>/<repo>")` resolve to the declared default
    branch, rather than always defaulting to `"master"`. (#557)

    !end-bullet!
-   !begin-bullet!
    renv now only installs packages from sources if it detects that
    build tools are available. This determination is done by checking
    whether `make` is available on the `PATH`. (#552)

    !end-bullet!
-   !begin-bullet!
    Warnings related to unknown sources can now be suppressed by setting
    `options(renv.warnings.unknown_sources = FALSE)`. (#546)

    !end-bullet!
-   !begin-bullet!
    renv now ignores chunks with the parameter `exercise=TRUE` set,
    under the assumption that such chunks might contain errors and so
    otherwise be un-parsable.

    !end-bullet!
-   !begin-bullet!
    renv now warns if sandbox generation takes a long time (\> 30
    seconds).

    !end-bullet!
-   !begin-bullet!
    renv now provides an optional locking mechanism, to help minimize
    the chance of interprocess conflicts when multiple R processes need
    to use the same renv project. The option is currently disabled by
    default; it can be enabled by setting
    `options(renv.config.locking.enabled = TRUE)` in an appropriate R
    startup file. (#525)

    !end-bullet!

!end-bullets-41!

# renv 0.12.0

!begin-bullets-42!

-   !begin-bullet!
    renv now uses R's internal tar implementation by default on Windows.
    This is done to avoid issues that may occur when a version of
    `tar.exe` on the `PATH` exists, but does not accept Windows-style
    paths. The `TAR` environment variable can be set if one needs to
    explicitly force the use of a particular `tar.exe` executable.
    (#521)

    !end-bullet!
-   !begin-bullet!
    renv now prepends `renv (<version>)` to the user agent string. This
    should help ensure that package binaries are located when installing
    packages from RSPM outside of RStudio. (#520)

    !end-bullet!
-   !begin-bullet!
    renv now uses a task callback to detect mutations to the project
    library when the `auto.snapshot` configuration option is enabled.
    This will help ensure that automatic snapshots occur when packages
    are installed via a mechanism not explicitly understood by renv.
    (#501)

    !end-bullet!
-   !begin-bullet!
    renv now treats the user + site libraries as package sources during
    a restore. If renv sees that a package already installed in one of
    these libraries is compatible with the record requested via
    `renv::install()` or `renv::restore()`, that copy of the package
    will be copied and used. (#492)

    !end-bullet!
-   !begin-bullet!
    renv now performs a lighter-weight check as to whether the project
    lockfile is synchronized with the project library on load. The
    default value for the `synchronized.check` config option has been
    changed back to `TRUE`. (#496)

    !end-bullet!
-   !begin-bullet!
    renv now handles the `remotes` syntax for installing packages lying
    within the sub-directory of a GitHub repository; that is,
    `renv::install("user/repo/subdir")` should work as expected. (#497)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv did not construct the correct URL for
    packages to be installed from Bitbucket remotes. (#494)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where the `RENV_PATHS_PREFIX` environment variable
    was inappropriately normalized when renv was loaded. (#465)

    !end-bullet!

!end-bullets-42!

# renv 0.11.0

!begin-bullets-43!

-   !begin-bullet!
    Fixed an issue where `renv::install(..., type = "binary")` would
    still attempt to install packages from sources in some cases. (#461)

    !end-bullet!
-   !begin-bullet!
    renv now always writes `renv/.gitignore`, to ensure that the
    appropriate directories are ignored for projects which initialize
    `git` after renv itself is initialized. (#462)

    !end-bullet!
-   !begin-bullet!
    R Markdown documents with the `.Rmarkdown` file extension are now
    parsed for dependencies.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where setting the `external.libraries` configuration
    option would trigger a warning. (#452)

    !end-bullet!
-   !begin-bullet!
    Improved handling of unicode paths on Windows. (#451)

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot(project = <path>)` now properly respects
    `.gitignore` / `.renvignore` files, even when that project has not
    yet been explicitly initialized yet. (#439)

    !end-bullet!
-   !begin-bullet!
    The default value of the `synchronized.check` option has been
    changed from TRUE to FALSE.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where packages downloaded from Bitbucket and GitLab
    did not record the associated commit hash.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempting to install packages from GitLab
    could fail to install the correct version of the package. (#436)

    !end-bullet!
-   !begin-bullet!
    `renv::snapshot()` now preserves records in a lockfile that are only
    available for a different operating system. This should make it
    easier to share lockfiles that make use of platform-specific
    packages. (#419)

    !end-bullet!
-   !begin-bullet!
    renv better handles files that are removed during an invocation to
    `renv::dependencies()`. (#429)

    !end-bullet!
-   !begin-bullet!
    The configuration option `install.staged` has been renamed to
    `install.transactional`, to better reflect its purpose.
    `install.staged` remains supported as a deprecated alias.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv could fail to parse non-ASCII content on
    Windows. (#421)

    !end-bullet!
-   !begin-bullet!
    `renv::update()` gains the `exclude` argument, useful in cases where
    one would like to update all packages used in a project, except for
    a small subset of excluded packages. (#425)

    !end-bullet!
-   !begin-bullet!
    `renv::update()` now respects the project `ignored.packages`
    setting. (#425)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where RSPM binary URL transformations could fail for
    Ubuntu Trusty. (#423)

    !end-bullet!
-   !begin-bullet!
    renv now records the `OS_type` reported in a package's `DESCRIPTION`
    file (if any), and ignores packages incompatible with the current
    operating system during restore. (#394)

    !end-bullet!

!end-bullets-43!

# renv 0.10.0

!begin-bullets-44!

-   !begin-bullet!
    `renv::install()` gains the `type` argument, used to control whether
    renv should attempt to install packages from sources (`"source"`) or
    using binaries (`"binary"`).

    !end-bullet!
-   !begin-bullet!
    renv now knows how to find and activate Rtools40, for R 4.0.0
    installations on Windows.

    !end-bullet!
-   !begin-bullet!
    The `RENV_PATHS_PREFIX` environment variable can now be used to
    prepend an optional path component to the project library and global
    cache paths. This is primarily useful for users who want to share
    the renv cache across multiple operating systems on Linux, but need
    to disambigutate these paths according to the operating system in
    use. See `?renv::paths` for more details.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install()` could fail for packages from
    GitHub whose DESCRIPTION files contained Windows-style line endings.
    (#408)

    !end-bullet!
-   !begin-bullet!
    `renv::update()` now also checks and updates any Bioconductor
    packages used within a project. (#392)

    !end-bullet!
-   !begin-bullet!
    renv now properly parses negated entries within a `.gitignore`; e.g.
    `!script.R` will indicate that renv should include `script.R` when
    parsing dependencies. (#403)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where packages which had only binaries available on a
    package repository were not detected as being from a package
    repository. (#402)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where calls of the form `p_load(char = <vctr>)`
    caused a failure when enumerating dependencies. (#401)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::install()` could fail when multiple
    versions of a package are available from a single repository, but
    some versions of those packages are incompatible with the current
    version of R. (#252)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where downloads could fail when the associated
    pre-flight HEAD request failed as well. (#390)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where empty records within a DESCRIPTION file could
    cause `renv::dependencies()` to fail. (#382)

    !end-bullet!
-   !begin-bullet!
    renv will now download binaries of older packages from MRAN when
    possible.

    !end-bullet!
-   !begin-bullet!
    renv will now attempt to re-generate the system library sandbox if
    it is deleted while a session is active. (#361)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where Python packages referenced using
    `reticulate::import()` were incorrectly tagged as R package
    dependencies. Similarly, renv now only considers calls to
    `modules::import()` if those calls occur within a call to
    `modules::module()`. (#359)

    !end-bullet!
-   !begin-bullet!
    `renv::scaffold()` now also generates a lockfile when invoked.
    (#351)

    !end-bullet!
-   !begin-bullet!
    The argument `confirm` has been renamed to `prompt` in all places
    where it is used. `confirm` remains supported for backwards
    compatibility, but is no longer explicitly documented. (#347)

    !end-bullet!
-   !begin-bullet!
    The continuous integration renv vignette now also contains a
    template for using renv together with GitLab CI. (#348,
    @artemklevtsov)

    !end-bullet!
-   !begin-bullet!
    renv now properly resets the session library paths when calling
    `renv::deactivate()` from within RStudio. (#219)

    !end-bullet!
-   !begin-bullet!
    `renv::init()` now restores the associated project library when
    called in a project containing a lockfile but no project library nor
    any pre-existing project infrastructure.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue on Windows where attempts to download packages from
    package repositories referenced with a `file://` scheme could fail.

    !end-bullet!
-   !begin-bullet!
    The configuration option `dependency.errors` has been added,
    controlling how errors are handled during dependency enumeration.
    This is used, for example, when enumerating dependencies during a
    call to `renv::snapshot()`. By default, errors are reported, and
    (for interactive sessions) the user is prompted to continue. (#342)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` gains two new arguments: the `progress`
    argument controls whether renv reports progress while enumerating
    dependencies, and `errors` controls how renv handles and reports
    errors encountered during dependency discovery. The `quiet` argument
    is now soft-deprecated, but continues to be supported for backwards
    compatibility. Specifying `quiet = TRUE` is equivalent to specifying
    `progress = FALSE` and `errors = "ignored"`. Please see the
    documentation in `?dependencies` for more details. (#342)

    !end-bullet!
-   !begin-bullet!
    The environment variable `RENV_PATHS_LIBRARY_ROOT` can now be set,
    to instruct renv to use a particular directory as a host for any
    project libraries that are used by renv. This can be useful for
    certain cases where it is cumbersome to include the project library
    within the project itself; for example, when developing an R
    package. (#345)

    !end-bullet!
-   !begin-bullet!
    The code used to bootstrap renv (that is, the code used to install
    renv into a project) has been overhauled. (#344)

    !end-bullet!
-   !begin-bullet!
    renv no longer unsets an error handler set within the user profile
    when loading a project. (#343)

    !end-bullet!
-   !begin-bullet!
    renv gains the "explicit" snapshot type, wherein only packages
    explicitly listed as dependencies within the project `DESCRIPTION`
    file (and those package's transitive dependencies) will enter the
    lockfile when `renv::snapshot()` is called. (#338)

    !end-bullet!
-   !begin-bullet!
    renv will now transform RSPM source URLs into binary URLs as
    appropriate, allowing renv to use RSPM's binary repositories during
    restore. See `?config` for more details. (#124)

    !end-bullet!
-   !begin-bullet!
    renv will now infer a dependency on `hexbin` in projects that make
    use of the `ggplot2::geom_hex()` function.

    !end-bullet!
-   !begin-bullet!
    renv now tries to place Rtools on the PATH when a package is
    installed with the `install.packages()` hook active. (#335)

    !end-bullet!

!end-bullets-44!

# renv 0.9.3

!begin-bullets-45!

-   !begin-bullet!
    Fixed an issue where attempts to specify `RENV_PATHS_RTOOLS` would
    be ignored by renv. (#335)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where downloads could fail when using the `wininet`
    downloader, typically with a message of the form "InternetOpenUrl
    failed: 'The requested header was not found'".

    !end-bullet!
-   !begin-bullet!
    renv better handles projects containing special characters on
    Windows. (#334)

    !end-bullet!
-   !begin-bullet!
    renv better handles unnamed repositories. (#333)

    !end-bullet!
-   !begin-bullet!
    renv gains the config option `hydrate.libpaths`, allowing one to
    control the library paths used by default for `renv::hydrate()`.
    (#329)

    !end-bullet!
-   !begin-bullet!
    `renv::hydrate()` gains the `sources` argument, used to control the
    library paths used by renv when hydrating a project. (#329)

    !end-bullet!
-   !begin-bullet!
    renv now sandboxes the system library by default on Windows.

    !end-bullet!
-   !begin-bullet!
    renv now validates that the Xcode license has been accepted before
    attempting to install R packages from sources. (#296)

    !end-bullet!
-   !begin-bullet!
    The R option `renv.download.override` can now be used to override
    the machinery used by renv when downloading files. For example,
    setting `options(renv.download.override = utils::download.file)`
    would instruct renv to use R's own downloader when downloading files
    from the internet. This can be useful when configuration of `curl`
    is challenging or intractable in your environment, or you've already
    configured the base R downloader suitably.

    !end-bullet!
-   !begin-bullet!
    `renv::use_python("~/path/to/python")` now works as expected.

    !end-bullet!
-   !begin-bullet!
    renv now properly expands `R_LIBS_SITE` and `R_LIBS_USER` when set
    within a startup `.Renviron` file. (#318)

    !end-bullet!
-   !begin-bullet!
    The `renv.download.headers` option can now be used to provide
    arbitrary HTTP headers when downloading files. See the
    **Authentication** section in `vignette("renv")` for more details.
    (#307)

    !end-bullet!
-   !begin-bullet!
    renv gains the project setting `package.dependency.fields`, for
    controlling which fields in an R package's `DESCRIPTION` file are
    examined when discovering recursive package dependencies. This can
    be useful when you'd like to instruct renv to track, for example,
    the `Suggests` dependencies of the packages used in your project.
    (#315)

    !end-bullet!
-   !begin-bullet!
    renv now better handles repositories referenced using file URIs.

    !end-bullet!
-   !begin-bullet!
    Packages installed from GitHub using `renv::install()` will now also
    have `Github*` fields added, in addition to the default `Remote*`
    fields. This should help fix issues when attempting to deploy
    projects to RStudio Connect requiring packages installed by renv.
    (#397)

    !end-bullet!
-   !begin-bullet!
    renv now prefers using a RemoteType field (if any) when attempting
    to determine a package's source. (#306)

    !end-bullet!
-   !begin-bullet!
    renv gains a new function `renv::scaffold()`, for generating renv
    project infrastructure without explicitly loading the project.
    (#303)

    !end-bullet!
-   !begin-bullet!
    renv now updates its local `.gitignore` file, when part of a git
    repository whose git root lives in a parent directory. (#300)

    !end-bullet!

!end-bullets-45!

# renv 0.9.2

!begin-bullets-46!

-   !begin-bullet!
    Fixed an issue in invoking `find` on Solaris.
    !end-bullet!

!end-bullets-46!

# renv 0.9.1

!begin-bullets-47!

-   !begin-bullet!
    Fixed an issue in invoking `cp` on Solaris.
    !end-bullet!

!end-bullets-47!

# renv 0.9.0

!begin-bullets-48!

-   !begin-bullet!
    renv gains a new function `renv::record()`, for recording new
    packages within an existing lockfile. This can be useful when one or
    more of the recorded packages need to be modified for some reason.

    !end-bullet!
-   !begin-bullet!
    An empty `.renvignore` no longer erroneously ignores all files
    within a directory. (#286)

    !end-bullet!
-   !begin-bullet!
    renv now warns if the version of renv loaded within a project does
    not match the version declared within the renv autoloader. (#285)

    !end-bullet!
-   !begin-bullet!
    renv gains a new function `renv::run()`, for running R scripts
    within a particular project's context inside an R subprocess. (#126)

    !end-bullet!
-   !begin-bullet!
    The algorithm used by renv for hashing packages has changed.
    Consider using `renv::rehash()` to migrate packages from the old
    renv cache to the new renv cache.

    !end-bullet!
-   !begin-bullet!
    `renv::status()` now reports packages which are referenced in your
    project code, but are not currently installed. (#271)

    !end-bullet!
-   !begin-bullet!
    renv is now able to restore packages with a recorded URL remote.
    (#272)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` can now parse R package dependencies used as
    custom site generator in an Rmd yaml header. (#269, @cderv)

    !end-bullet!
-   !begin-bullet!
    renv now properly respects a downloader requested by the environment
    variable `RENV_DOWNLOAD_FILE_METHOD`.

    !end-bullet!
-   !begin-bullet!
    renv no longer sources the user profile (normally located at
    `~/.Rprofile`) by default. If you desire this behavior, you can
    opt-in by setting `RENV_CONFIG_USER_PROFILE = TRUE`; e.g. within
    your project or user `.Renviron` file. (#261)

    !end-bullet!
-   !begin-bullet!
    `renv::restore()` gains the `packages` argument, to be used to
    restore a subset of packages recorded within the lockfile. (#260)

    !end-bullet!
-   !begin-bullet!
    renv now tries harder to preserve the existing structure in
    infrastructure files (e.g. the project `.Rprofile`) that it
    modifies. (#259)

    !end-bullet!
-   !begin-bullet!
    renv now warns if any Bioconductor packages used in the project
    appear to be from a different Bioconductor release than the one
    currently active and stored in the lockfile. (#244)

    !end-bullet!
-   !begin-bullet!
    renv now normalizes any paths set in the `RENV_PATHS_*` family of
    environment variables when renv is loaded.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv would not properly clean up after a failed
    attempt to call `Sys.junction()`. (#251)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where renv would, in some cases, copy rather than
    link from the package cache when the library path had been
    customized with the `RENV_PATHS_LIBRARY` environment variable.
    (#245)

    !end-bullet!
-   !begin-bullet!
    The method renv uses when copying directories can now be customized.
    When copying directories, renv now by default uses `robocopy` on
    Windows, and `cp` on Unix. This should improve robustness when
    attempting to copy files in some contexts; e.g. when copying across
    network shares.

    !end-bullet!
-   !begin-bullet!
    renv now tracks the version of Bioconductor used within a project
    (if applicable), and uses that when retrieving the set of
    repositories to be used during `renv::restore()`.

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` can now parse R package dependencies declared
    and used by the `modules` package. (#238, @labriola)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv::restore()` could fail in Docker
    environments, usually with an error message like 'Invalid
    cross-device link'. (#243)

    !end-bullet!
-   !begin-bullet!
    `renv::install()` disables staged package install when running with
    the Windows Subsystem for Linux. (#239)

    !end-bullet!

!end-bullets-48!

# renv 0.8.3

!begin-bullets-49!

-   !begin-bullet!
    `renv::dependencies()` gains a new argument `dev`, indicating
    whether development dependencies should also be included in the set
    of discovered package dependencies. By default, only runtime
    dependencies will be reported.

    !end-bullet!
-   !begin-bullet!
    renv has gained the function `renv::diagnostics()`, which can
    occasionally be useful in understanding and diagnosing renv
    (mis)behaviors.

    !end-bullet!
-   !begin-bullet!
    `renv::equip()` can now be used on macOS to install the R LLVM
    toolchain normally used when compiling packages from source. renv
    will also use this toolchain as appropriate when building packages
    from source.

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now provides a custom Makevars when building
    packages on macOS with Apple Clang, to avoid issues due to the use
    of '-fopenmp' during compilation.

    !end-bullet!
-   !begin-bullet!
    `renv::install()` now respects explicit version requests when
    discovered in a project's DESCRIPTION file. (#233)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `renv:::actions()` would fail to report any
    actions if the project lockfile was empty. (#232)

    !end-bullet!
-   !begin-bullet!
    When using renv for R package development, renv will no longer
    attempt to write the package being developed to the lockfile. (#231)

    !end-bullet!
-   !begin-bullet!
    Fixes for checks run on CRAN.

    !end-bullet!
-   !begin-bullet!
    renv will now search for Rtools in more locations. (#225)

    !end-bullet!
-   !begin-bullet!
    `renv::load()` now ensures that the version of renv associated with
    the loaded project is loaded when possible. In addition,
    experimental support for switching between projects with
    `renv::load()` has been implemented. (#229)

    !end-bullet!
-   !begin-bullet!
    `renv::dependencies()` no longer treats folders named with the
    extension `.Rmd` as though they were regular files. (#228)

    !end-bullet!
-   !begin-bullet!
    It is now possible to install source packages contained within
    `.zip` archives using `renv::install()`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where attempts to call `renv::restore()` with the
    path to the lockfile explicitly provided would fail. (#227)

    !end-bullet!

!end-bullets-49!

# renv 0.8.2

!begin-bullets-50!

-   !begin-bullet!
    Further fixes for checks run on CRAN.
    !end-bullet!

!end-bullets-50!

# renv 0.8.1

!begin-bullets-51!

-   !begin-bullet!
    Fixes for checks run on CRAN.
    !end-bullet!

!end-bullets-51!

# renv 0.8.0

!begin-bullets-52!

-   !begin-bullet!
    Initial CRAN release.
    !end-bullet!

!end-bullets-52!

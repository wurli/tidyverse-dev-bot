# pak (development version)

!begin-bullets-1!

-   !begin-bullet!
    pak is now more tolerant with extraneous whitespace in `PACKAGES*`
    metadata files (https://github.com/r-lib/pak/issues/785).

    !end-bullet!
-   !begin-bullet!
    pak now builds again on FreeBSD (#790).

    !end-bullet!
-   !begin-bullet!
    Installing dependencies of a package file with `deps::<filename>`
    works again (#784).

    !end-bullet!
-   !begin-bullet!
    pak now always uses the correct working directory in the subprocess;
    this was a common source of errors.

    !end-bullet!
-   !begin-bullet!
    New (nightly) binary builds for aarch64 Windows.

    !end-bullet!
-   !begin-bullet!
    We do not build binary builds for the release candidate of pak any
    more, only for stable and devel pak. `rc` is an alias to `stable`
    now.

    !end-bullet!

!end-bullets-1!

# pak 0.9.0

!begin-bullets-2!

-   !begin-bullet!
    pak now supports HTTP basic authentication for CRAN-like
    repositories. See 'Authenticated repositories' in the reference
    manual.

    !end-bullet!
-   !begin-bullet!
    New function `scan_deps()` to auto-detect package dependencies from
    R code. `deps::.` automatically uses detected dependencies now if no
    `DESCRIPTION` file is found.

    !end-bullet!
-   !begin-bullet!
    The dependency solver now uses better heuristics, that works better
    (=faster) with multiple repositories with large overlaps
    (https://github.com/r-lib/pkgdepends/pull/392).

    !end-bullet!
-   !begin-bullet!
    pak is now much better at detecting the correct Linux distribution
    when deciding about PPM and system requirements support.

    !end-bullet!
-   !begin-bullet!
    pak now uses the `use_bioconductor` configuration option in
    `meta_*()` and `repo_*()` functions (#295, #726, @meztez).

    !end-bullet!

!end-bullets-2!

# pak 0.8.0.2

No changes.

# pak 0.8.0.1

No changes.

# pak 0.8.0

!begin-bullets-3!

-   !begin-bullet!
    `pkg_deps()` now accepts a vector of package names.

    !end-bullet!
-   !begin-bullet!
    The metadata cache now does not use source URLs for packages in
    `Archive` on Posit Package Manager repositories. This URLs may serve
    a different package, even a source package when the main URL for the
    same package serves a binary package. The alternative URLs are not
    needed on PPM, anyway, because PPM is in a consistent state w.r.t.
    metadata and package files (#623).

    !end-bullet!
-   !begin-bullet!
    pak now supports `gitlab::` package sources better, by adding
    explicit syntax to specify subdirectories
    (https://github.com/r-lib/pkgdepends/issues/353, @dgkf).

    !end-bullet!
-   !begin-bullet!
    `gitlab::` and `git::` package sources now support git submodules if
    the `git-submodules` configuration option is set to `TRUE`. See
    `?"pak-config"` (https://github.com/r-lib/pkgdepends/issues/354).

    !end-bullet!
-   !begin-bullet!
    The new `?ignore-unavailable` parameter makes it easy to ignore soft
    dependencies that are unavailable (#606).

    !end-bullet!
-   !begin-bullet!
    pak now automatically ignores soft dependencies that have an
    incompatible OS type (`OS_type` entry in `DESCRIPTION`) when
    installing packages.

    !end-bullet!
-   !begin-bullet!
    `repo_add()` and the `ppm_*()` functions, e.g. `ppm_snapshots()`,
    now work again after the PPM API changes
    (https://github.com/r-lib/pkgcache/issues/110,
    https://github.com/r-lib/pkgcache/issues/115).

    !end-bullet!

!end-bullets-3!

# pak 0.7.2

!begin-bullets-4!

-   !begin-bullet!
    pak now supports using parameters for all packages with the
    `*=?<param>` form. E.g. `*=?source` installs all packages from
    source.

    !end-bullet!
-   !begin-bullet!
    pak now supports R 4.4.0 again, and also Rtools44.

    !end-bullet!

!end-bullets-4!

# pak 0.7.1

!begin-bullets-5!

-   !begin-bullet!
    pak can now handle the case when `Config/Needs/*` dependencies are
    requested for package from a repository.

    !end-bullet!
-   !begin-bullet!
    pak uses safer `*printf()` format strings now.

    !end-bullet!

!end-bullets-5!

# pak 0.7.0

!begin-bullets-6!

-   !begin-bullet!
    pak now correctly handles the latest GitHub release with the
    `@*release` notation (@pawelru,
    https://github.com/r-lib/pkgdepends/pull/321)

    !end-bullet!
-   !begin-bullet!
    pak now correctly handles having multiple instances of the same
    package in the metadata, with different R version requirements
    (#534, #538, https://github.com/r-lib/pkgdepends/pull/331).

    !end-bullet!
-   !begin-bullet!
    `git::` package references work better now for Azure DevOps
    (@jameslairdsmith, https://github.com/r-lib/pkgdepends/pull/333,
    https://github.com/r-lib/pkgdepends/pull/342).

    !end-bullet!
-   !begin-bullet!
    pak now does a better job at accepting installed packages, and
    avoids reinstalling more packages than needed when using a lock file
    (https://github.com/r-lib/actions/issues/759,
    https://github.com/r-lib/pkgdepends/pull/338).

    !end-bullet!

!end-bullets-6!

# pak 0.6.0

!begin-bullets-7!

-   !begin-bullet!
    pak now requires R \>= 3.5.0.

    !end-bullet!
-   !begin-bullet!
    Many improvements in system requirements support:

    !begin-bullets-8!
    -   !begin-bullet!
        New functions:
        !begin-bullets-9!
        -   !begin-bullet!
            `pkg_sysreqs()`: calculate system requirements of packages.
            !end-bullet!
        -   !begin-bullet!
            `sysreqs_db_list()`, `sysreqs_db_match()`,
            `sysreqs_db_update()`: query the system requirements
            database.
            !end-bullet!
        -   !begin-bullet!
            `sysreqs_list_system_packages()`,
            `sysreqs_check_installed()`, `sysreqs_fix_installed()`:
            query and install missing system packages.
            !end-bullet!
        -   !begin-bullet!
            `sysreqs_platforms()`: list supported platforms.
            !end-bullet!

        !end-bullets-9!
        !end-bullet!
    -   !begin-bullet!
        The installation proposal, printed before installation, now
        includes required and missing system packages, on supported
        platforms.
        !end-bullet!
    -   !begin-bullet!
        New `sysreqs_platform` configuration option to override the
        auto-detected platform.
        !end-bullet!
    -   !begin-bullet!
        Faster, asynchronous system requirements lookup.
        !end-bullet!
    -   !begin-bullet!
        pak now does not reinstall system requirements by default, if
        they are already installed. (You can force a reinstall/upgrade
        with the `sysreqs_update` configuration option.)
        !end-bullet!

    !end-bullets-8!
    !end-bullet!
-   !begin-bullet!
    New `gitlab::` package source to install packages from GitLab
    (https://github.com/r-lib/pkgdepends/pull/315).

    !end-bullet!
-   !begin-bullet!
    pak now correctly parses multiple `git::` packages at once
    (https://github.com/r-lib/pkgdepends/issues/318).

    !end-bullet!
-   !begin-bullet!
    `git::` package sources now support version 1 of the git protocol.
    E.g. the Bioconductor git repositories now work:
    `git::https://git.bioconductor.org/packages/limma`
    (https://github.com/r-lib/pkgdepends/issues/314).

    !end-bullet!
-   !begin-bullet!
    The `platforms` config parameter now works correctly with `deps::`
    package sources (#522).

    !end-bullet!
-   !begin-bullet!
    New `include_linkingto` config parameter to always include
    `LinkingTo` packages in the solution, even for binaries
    (https://github.com/r-lib/pkgdepends/issues/485).

    !end-bullet!
-   !begin-bullet!
    `pkg_name_check()` now does not include Acromine results, because
    the web site was unstable.

    !end-bullet!
-   !begin-bullet!
    In `repo_add()` and `repo_resolve()` the `MRAN@` prefix is now
    deprecated and resolves to PPM, because MRAN will be retired soon.
    See more at
    https://posit.co/blog/migrating-from-mran-to-posit-package-manager/.

    !end-bullet!
-   !begin-bullet!
    The metadata cache now has `SystemRequirements` information for
    Bioconductor packages.

    !end-bullet!

!end-bullets-7!

# pak 0.5.1

!begin-bullets-10!

-   !begin-bullet!
    No user visible changes.
    !end-bullet!

!end-bullets-10!

# pak 0.5.0

!begin-bullets-11!

-   !begin-bullet!
    The `meta_*()` functions now consider the `platforms`, `cran_mirror`
    and `r_versions` config entries, see `?"pak-config"`.

    !end-bullet!
-   !begin-bullet!
    Better Posit Package Manager (PPM) support. New
    `+ppm_has_binaries()`, `ppm_r_versions()`, `ppm_repo_url()`,
    `ppm_snapshots()` and `ppm_platforms()` functions to help
    interacting with PPM. See the new 'pkgcache and Posit Package
    Manager on Linux' article at https://r-lib.github.io/pkgcache.
    (r-lib/pkgcache#47 and r-lib/pkgdepends#186).

    !end-bullet!
-   !begin-bullet!
    New `system_r_platform()` and `system_r_platform_data()` functions
    to query the current platform.

    !end-bullet!
-   !begin-bullet!
    pak now support git repositories as package references. E.g.
    `git::https://github.com/r-lib/pak.git`.

    !end-bullet!
-   !begin-bullet!
    pak now supports versioned CRAN packages, e.g. `dplyr@1.1.1` will
    always install dplyr 1.1.1. Note that only CRAN packages are
    supported, Bioconductor packages are not (yet).

    !end-bullet!
-   !begin-bullet!
    pak now has an alternative system requirements lookup
    implementation. It supports Fedora and Debian systems as well, in
    addition to Debian, Ubuntu, SUSE and RedHat derivatives. You can
    switch to this implementation by setting the `R_PKG_SYSREQS2`
    environment variable to `true`.

    !end-bullet!
-   !begin-bullet!
    pak now does a better job looking up dependencies for hand-selected
    dependency types. E.g. `dependencies = "LinkingTo"`.

    !end-bullet!
-   !begin-bullet!
    pak now removes `?ignore`-d packages from dependencies, and uses the
    correct version comparison for `?ignore-before.r`
    (https://github.com/r-lib/actions/issues/708).

    !end-bullet!
-   !begin-bullet!
    pak now does not fail for circular soft dependencies (#306).

    !end-bullet!
-   !begin-bullet!
    pak now reports dependency solver failures better in some cases
    (#305, https://github.com/r-lib/pak/issues/474).

    !end-bullet!
-   !begin-bullet!
    pak now uses locally built CRAN binaries from the cache. Use the
    `?nocache` parameter to opt out from this, or
    `cache_delete(package = ...)` to remove a package from the cache.

    !end-bullet!

!end-bullets-11!

# pak 0.4.0

!begin-bullets-12!

-   !begin-bullet!
    pak has much improved and more informative error messages now. This
    work is not yet finished, so if you find an unclear error message,
    please open an issue. Thank you!

    !end-bullet!
-   !begin-bullet!
    The solver is now more robust for non-canonical input
    (e.g. `DESCRIPTION` files)
    (https://github.com/r-lib/pak/issues/423).

    !end-bullet!
-   !begin-bullet!
    Better installation output. Standard output and error are now
    collected together
    (https://github.com/r-lib/pkgdepends/commit/0669f0f8c).

    !end-bullet!
-   !begin-bullet!
    The solver is now doing a better job when multiple versions of the
    same package are present in the same repository
    (https://github.com/r-lib/actions/issues/559).

    !end-bullet!
-   !begin-bullet!
    `pkg_name_check()` now works again, it needed a fix after changes at
    https://crandb.r-pkg.org.

    !end-bullet!
-   !begin-bullet!
    Explicit package names in local and URL package sources, as in
    `package=local::...` or `package=url::...` are now parsed correctly
    in dependencies.

    !end-bullet!
-   !begin-bullet!
    pak is now more robust to `Archs` fields missing from the CRAN
    metadata for packages with compiled code
    (https://github.com/r-lib/pak/issues/448).

    !end-bullet!
-   !begin-bullet!
    `url::` packages now always work correctly, even if the digest
    package is not installed (https://github.com/r-lib/pak/issues/433).

    !end-bullet!
-   !begin-bullet!
    pak is now more robust when installing packages from subdirectories
    of GitHub repositories (https://github.com/r-lib/pak/issues/431,
    @paleolimbot).

    !end-bullet!
-   !begin-bullet!
    Parameters `?reinstall`, `?source` and `?ignore` now work correctly
    when specified in the `package=?parameter` format (#294).

    !end-bullet!
-   !begin-bullet!
    The `?ignore` parameter works correctly now.

    !end-bullet!
-   !begin-bullet!
    Dependency resolution now does not fail if a package is not found.

    !end-bullet!
-   !begin-bullet!
    pak can now install `url::` remotes from GitHub.

    !end-bullet!
-   !begin-bullet!
    pak now does not fail when the package of a `.tar.gz` GitHub
    snapshot is in a subdirectory, or in a subdirectory of a
    subdirectory.

    !end-bullet!
-   !begin-bullet!
    pak now errors early if it cannot deduce the name of the package
    from a `Remotes` or `Config/Needs/*` entry.

    !end-bullet!
-   !begin-bullet!
    Solver failures now include details in some cases where previously
    they did not.

    !end-bullet!
-   !begin-bullet!
    pak can now update packages in Docker containers where the old
    version was installed in the different Docker later
    (https://github.com/r-lib/pak/issues/251)

    !end-bullet!
-   !begin-bullet!
    Update R version -\> Bioconductor version mapping. R 4.2.x now maps
    to Bioconductor 3.16.

    !end-bullet!

!end-bullets-12!

# pak 0.3.1

!begin-bullets-13!

-   !begin-bullet!
    The `?ignore` parameter works correctly now.

    !end-bullet!
-   !begin-bullet!
    Dependency resolution now does not fail if a package is not found.

    !end-bullet!
-   !begin-bullet!
    pak can now install `url::` remotes from GitHub.

    !end-bullet!
-   !begin-bullet!
    pak now does not fail when the package of a `.tar.gz` GitHub
    snapshot is in a subdirectory, or in a subdirectory of a
    subdirectory.

    !end-bullet!
-   !begin-bullet!
    pak now errors early if it cannot deduce the name of the package
    from a `Remotes` or `Config/Needs/*` entry.

    !end-bullet!
-   !begin-bullet!
    Solver failures now include details in some cases where previously
    they did not.

    !end-bullet!
-   !begin-bullet!
    pak can now update packages in Docker containers where the old
    version was installed in the different Docker later (#251)

    !end-bullet!
-   !begin-bullet!
    pak errors are now user friendlier and better formatted.

    !end-bullet!
-   !begin-bullet!
    pak now does not load tibble and its dependencies in the pak
    subprocess, so their dlls are not locked by the pak subprocess on
    Windows.

    !end-bullet!
-   !begin-bullet!
    pak now does not fail when installing a package that uses a
    non-UTF-8 encoding on R 4.3.x and later (#404).

    !end-bullet!

!end-bullets-13!

# pak 0.3.0

!begin-bullets-14!

-   !begin-bullet!
    pak functions that used to return tibbles return data frames now.
    While data frames and tibbles are very similar, they are not
    completely compatible. To convert the outputs of pak functions to
    tibbles call the `tibble::as_tibble()` function on them. If the
    pillar package is loaded, it improves the printing of the returned
    data frames.

    Relatedly, `pak::pak_install_extra()` installs pillar now, instead
    of tibble.

    !end-bullet!
-   !begin-bullet!
    pak now supports `file://` repositories.

    !end-bullet!
-   !begin-bullet!
    pak now uses HTTP 1.1 to download packages on Linux, in addition to
    macOS. This fixes HTTP issues with some servers (#358).

    !end-bullet!
-   !begin-bullet!
    New `?ignore-before-r` parameter to ignore optional dependencies
    that need a newer R version
    (https://github.com/r-lib/pkgdepends/issues/243).

    !end-bullet!
-   !begin-bullet!
    New `?ignore` parameter to ignore an optional dependency.

    !end-bullet!
-   !begin-bullet!
    Allow specifying downstream package parameters with the
    `package=?param` syntax.

    !end-bullet!
-   !begin-bullet!
    `lockfile_install()` now works better for `any::` refs, and pak
    always install the version it has planned for.

    !end-bullet!
-   !begin-bullet!
    System requirement installation is now more robust and works for
    Unix shell expressions (#347).

    !end-bullet!
-   !begin-bullet!
    CRAN-like resolution is more robust now if a repository is missing
    the usual metadata.

    !end-bullet!
-   !begin-bullet!
    The lock file is pretty JSON now.

    !end-bullet!
-   !begin-bullet!
    pak now handles all version requirement types properly: '\<', '\<=',
    `==`, `>=`, `>`.

    !end-bullet!
-   !begin-bullet!
    The dependency solver now uses better heuristics and does not
    (effectively) freeze if multiple repositories have multiple versions
    of the same packages (e.g. RSPM and CRAN)
    (https://github.com/r-lib/pkgdepends/pull/277)

    !end-bullet!

!end-bullets-14!

# pak 0.2.1

No user visible changes.

# pak 0.2.0

Lots of news, too much to list. This is a completely new package now.

# pak 0.1.2

First version on CRAN.

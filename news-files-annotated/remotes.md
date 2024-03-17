# remotes development version

!begin-bullets-1!

-   !begin-bullet!
    `install_github()` now uses credentials from the git credential
    store, if `GITHUB_PAT` and `GITHUB_TOKEN` are not set.
    !end-bullet!
-   !begin-bullet!
    The `Remotes` field in `DESCRIPTION` now accepts explicit package
    names: `<pkgname>=<type>::<username>/<repo>` (#719, @heavywatal).
    !end-bullet!
-   !begin-bullet!
    `dev_package_deps()` noq has a `remote_precedence` parameter which
    allows the user to choose whether remote sources should have a
    priority over CRAN sources (#732, @maksymiuks).
    !end-bullet!
-   !begin-bullet!
    `dev_package_deps()` now works for packages with `Enhances`
    dependencies (#711, @maksymiuks).
    !end-bullet!
-   !begin-bullet!
    `dev_package_deps()` now has an `additional_repositories` parameter
    which allows the user to choose whether `Additional_repositories`
    should be extracted from the `DESCRIPTION` file and appended to
    repos (#782, @maksymiuks).
    !end-bullet!
-   !begin-bullet!
    `install_dev()` now ignores a trailing slash (#692, @krlmlr).
    !end-bullet!
-   !begin-bullet!
    System requirements now support Ubuntu 22.04.
    !end-bullet!
-   !begin-bullet!
    `local_package_deps()` now errors for non-existent directories
    (#772, @MatthieuStigler).
    !end-bullet!

!end-bullets-1!

# remotes 2.4.2

!begin-bullets-2!

-   !begin-bullet!
    Gábor Csárdi is now the maintainer.
    !end-bullet!
-   !begin-bullet!
    `bioc_version()` now points to the most recent (2021-10-27)
    Bioconductor release, `v3.14` (@stufield, #664).
    !end-bullet!
-   !begin-bullet!
    Fix regex to handle user names in URL in `git_remote`, add
    regression tests (@achimgaedke, #646).
    !end-bullet!

!end-bullets-2!

# remotes 2.4.1

!begin-bullets-3!

-   !begin-bullet!
    pkgbuild is no longer accidentally loaded even in standalone mode
    (#548)
    !end-bullet!
-   !begin-bullet!
    The internal GitHub token used to increase rate limits has been
    regenerated.
    !end-bullet!
-   !begin-bullet!
    Using `remote_package_name.git2r_remote` now passes credentials when
    looking up the package `DESCRIPTION` (#633, @rnorberg)
    !end-bullet!
-   !begin-bullet!
    Using `remote_package_name.git2r_remote` and
    `remote_package_name.xgit_remote`, http responses returning an
    invalid `DESCRIPTION` or that redirect to another page will now
    fallback to return `NA` instead of throwing an error when trying to
    parse the unexpected content (#628, @dgkf).
    !end-bullet!
-   !begin-bullet!
    Fix regex that breaks git protocol in `git_remote` (@niheaven #630).
    !end-bullet!
-   !begin-bullet!
    Clarify `github_pull()` documentation (@ms609 #640).
    !end-bullet!

!end-bullets-3!

# remotes 2.4.0

!begin-bullets-4!

-   !begin-bullet!
    Re-license as MIT. (#551)

    !end-bullet!
-   !begin-bullet!
    Fix bug in install_bioc() when using version='devel'. The code will
    now pull from the git HEAD, not a branch named 'HEAD' (@bbimber,
    #612).

    !end-bullet!
-   !begin-bullet!
    skip tests for `download.file(method = "internal")`, on R \> 4.1,
    since that method is now defunct on those versions.

    !end-bullet!
-   !begin-bullet!
    `system_requirements()` now works as intended if only the `os`
    argument is used (@mdneuzerling, #609)

    !end-bullet!
-   !begin-bullet!
    `remote_package_name.git2r_remote` and
    `remote_package_name.xgit_remote` now get correct package name from
    HTTP(S) git repo's `DESCRIPTION` file, and thus package's
    `DESCRIPTION` file's `Remotes` field could have
    `git::http(s)://<host>/<username>/<repo>[.git][@ref]` items that
    install remote packages using git via HTTP(S) protocol (@niheaven,
    #603).

    !end-bullet!

!end-bullets-4!

# remotes 2.3.0

## Major changes

!begin-bullets-5!

-   !begin-bullet!
    `install_*()` functions will no longer fail by default if there
    warnings from `install.packages()`. Concretely the default value of
    `R_REMOTES_NO_ERRORS_FROM_WARNINGS` has changed to `true` from the
    previous value of `false`. (#403)
    !end-bullet!

!end-bullets-5!

## Minor improvements and fixes

!begin-bullets-6!

-   !begin-bullet!
    `install_bioc()` now respects the environment variable
    R_BIOC_VERSION, and will use the git branch corresponding to this
    Bioconductor version (@bbimber, #580).

    !end-bullet!
-   !begin-bullet!
    remotes without package names are now unconditionally installed
    (#532, @jakubkovac)

    !end-bullet!
-   !begin-bullet!
    It is now possible to specify a custom host for dependencies listed
    in the `DESCRIPTION` file with
    `Remotes: <type>[@host]::<username>/<repo>[@ref]`. The `ref` now
    supports `/` in it for `GitLab` repositories as it did for
    `GitHub`repositories. (@dagola, #448)

    !end-bullet!
-   !begin-bullet!
    Internal `package2remote()` function now supports local remotes
    created by pak.

    !end-bullet!
-   !begin-bullet!
    `github_pat()` will now check if `GITHUB_TOKEN` is set if it cannot
    find `GITHUB_PAT`. (@coatless)

    !end-bullet!
-   !begin-bullet!
    `system_requirements()` now supports querying released packages as
    well as development dependencies (#545)

    !end-bullet!
-   !begin-bullet!
    `system_requirements()` now supports OS name + version in the `os`
    argument (#549, @krlmlr).

    !end-bullet!

!end-bullets-6!

# remotes 2.2.0

## New functions and features

!begin-bullets-7!

-   !begin-bullet!
    New `system_requirements()` function to query the Public RStudio
    Package Manager for system requirements for a package (and its
    dependencies)

    !end-bullet!
-   !begin-bullet!
    Remotes functions can now install dependencies from additional
    DESCRIPTION fields, e.g. passing
    `dependencies = "Config/Needs/website"` will install the
    dependencies listed in the `Config/Needs/website:` field in the
    package's DESCRIPTION. Prefixing fields with `Config/Needs` allows
    them to pass `R CMD check` without a NOTE, so it is the recommended
    format for these extra dependencies.

    !end-bullet!
-   !begin-bullet!
    `install_*()` family of functions now use the default branch in the
    repository, not the `master` branch (@MyKo101,#508).

    !end-bullet!

!end-bullets-7!

## Minor improvements and fixes

!begin-bullets-8!

-   !begin-bullet!
    Internal functions `remote_download()`, `remote_metadata()`,
    `remote_package_name()` and `remote_sha()` are now exported, so 3rd
    party packages could provide methods for new remote types (#509,
    #56)

    !end-bullet!
-   !begin-bullet!
    Internal functions `add_metadata()`, `github_remote()` are now
    exported. They are mainly for 3rd party extensions and should not be
    used by most users (#485).

    !end-bullet!
-   !begin-bullet!
    `install_version()` now keeps searching subsequent repositories for
    the requested version, rather than failing if the version it finds
    in an early repository is unsuitable. (#305, @kenahoo)

    !end-bullet!
-   !begin-bullet!
    `install_version()` now understands specifications like '\>= 1.0' or
    '\>= 1.12.0, \< 1.14' to install the first version of the package it
    can find that satisfies the criteria. (#305, @kenahoo)

    !end-bullet!
-   !begin-bullet!
    `install_version()` now avoids use of `base::url()`, as prior to R
    3.6.2 it had a bug when downloading large files (#463)

    !end-bullet!
-   !begin-bullet!
    `parse_submodules()` internal regular expression is now PCRE 2
    compatible (#502, @jan-glx)

    !end-bullet!
-   !begin-bullet!
    `update_packages()` argument `force` has been deprecated and no
    longer has any effect (#521)

    !end-bullet!
-   !begin-bullet!
    Another fix for the mixed binary and source dependency issue, it
    should hopefully be fully squashed now (#296)

    !end-bullet!
-   !begin-bullet!
    The upgrade menu is now interruptible in RStudio (#489).

    !end-bullet!
-   !begin-bullet!
    Internal GitHub functions now correctly handle cases when characters
    are not representable in the default locale, but are representable
    in UTF-8 (#492).

    !end-bullet!

!end-bullets-8!

# remotes 2.1.1

## Minor improvements and fixes

!begin-bullets-9!

-   !begin-bullet!
    Installing mixed binary and source dependencies when the latest
    versions of some packages do not have binaries yet should now
    install dependencies in the correct order to prevent load failures
    (#296)

    !end-bullet!
-   !begin-bullet!
    `github_error()` now also works when a GitHub (Enterprise) server
    does not return information about the rate limit (@dpprdan, #396,
    #413).

    !end-bullet!
-   !begin-bullet!
    `install_gitlab` passes the `quiet` argument on to `gitlab_pat`
    (@michaelchirico, #437)

    !end-bullet!
-   !begin-bullet!
    `remotes` is now resilient against installed packages that declare
    `RemoteType: standard` but do not include a `RemoteRepos` or
    `RemotePkgType` field. In such a case, the values for
    `getOption("repos")` and `getOption("pkgType")` will be used
    (respectively).

    !end-bullet!
-   !begin-bullet!
    `install_gitlab()` now installs from repositories in subgroups and
    with dots in their name. `subdir` is now an explicit argument
    instead of implicit in `repo` (@robertdj, #259, #420).

    !end-bullet!
-   !begin-bullet!
    `install()` now passes the ellipsis `...` to `install_deps()`
    (@Neil-Schneider, #411)

    !end-bullet!
-   !begin-bullet!
    The tests have been updated to work with newer versions of callr and
    R 4.0

    !end-bullet!

!end-bullets-9!

# remotes 2.1.0

## New features

!begin-bullets-10!

-   !begin-bullet!
    `install_*()` functions gain `build_manual` and `build_vignette`
    arguments that previously existed in devtools versions \< 2.0
    (#353).

    !end-bullet!
-   !begin-bullet!
    The interactive menu has been modified to provide more clear
    instructions on the skipping behavior (#207)

    !end-bullet!
-   !begin-bullet!
    Credentials are now passed via HTTP headers, to reduce exposure when
    requests fail (#391).

    !end-bullet!

!end-bullets-10!

## Minor improvements and fixes

!begin-bullets-11!

-   !begin-bullet!
    `download()` with the external curl download method now always uses
    `-L` to follow redirects. (#350)

    !end-bullet!
-   !begin-bullet!
    `update_packages()` now has a more informative error message when
    the update fails (#223, #232)

    !end-bullet!
-   !begin-bullet!
    `install_git()` now can take credentials from the global option
    `remotes.git_credentials` (#378).

    !end-bullet!
-   !begin-bullet!
    `install_git()` now works with SHA references and external git
    (#389).

    !end-bullet!
-   !begin-bullet!
    GitHub remotes that point to branches no longer fail when the branch
    is later deleted (#274).

    !end-bullet!
-   !begin-bullet!
    Local remotes whose original location has been moved will no longer
    error when updating (#370).

    !end-bullet!
-   !begin-bullet!
    `update_deps()` no longer sorts the dependencies alphabetically
    (#296, #301)

    !end-bullet!
-   !begin-bullet!
    `github_resolve_ref()` now takes a `host` parameter (#284)

    !end-bullet!
-   !begin-bullet!
    Remotes specific environment variables now accept 0 and 1 as valid
    values (#238)

    !end-bullet!
-   !begin-bullet!
    remotes now uses locking by default when installing binary packages,
    which avoids issues when installing binaries that are already open
    in other R processes (#368)

    !end-bullet!
-   !begin-bullet!
    `update_deps()` no longer fails if a local package no longer exists
    (#289)

    !end-bullet!
-   !begin-bullet!
    `install_version()` now errors with a more informative message when
    `type` is not 'source' (#323)

    !end-bullet!
-   !begin-bullet!
    Bioc `remote_sha()` now always returns a character result (#379)

    !end-bullet!
-   !begin-bullet!
    Fix API call for private repositories in `install_gitlab`
    (@aornugent, #359, #363)

    !end-bullet!
-   !begin-bullet!
    git submodules now work if the submodule file is empty
    (@muschellij2, #234)

    !end-bullet!
-   !begin-bullet!
    git submodules now work if the R package is stored in a subfolder
    (@pommedeterresautee, #233)

    !end-bullet!
-   !begin-bullet!
    `install_gitlab()` no longer adds the access token twice to the
    request (@aornugent, #363).

    !end-bullet!
-   !begin-bullet!
    Bitbucket dependencies now actually use the `BITBUCKET_USER` and
    `BITBUCKET_PASSWORD` environment variables (@antoine-sachet, #347).

    !end-bullet!
-   !begin-bullet!
    `parse_deps()` now ignores trailing whitespaces around comparison
    operators in DESCRIPTION fields (@LiNk-NY, #366)

    !end-bullet!

!end-bullets-11!

# remotes 2.0.4

!begin-bullets-12!

-   !begin-bullet!
    `update.package_dependencies()` now uses the pkg_type for the cran
    remote rather than a global type attribute, fixing errors when this
    global attribute is lost (#291, #304).

    !end-bullet!
-   !begin-bullet!
    Credentials are no longer passed to dependencies, as this breaks
    dependencies which use different credentials or hosts. If you have
    relied on this behavior a more robust way to provide the credentials
    is using the appropriate environment variables, e.g. `GITHUB_PAT`,
    `BITBUCKET_USER` etc. (@antoine-sachet, #345).

    !end-bullet!
-   !begin-bullet!
    The hash of bitbucket hosts is now correctly retrieved
    (@antoine-sachet, #344)

    !end-bullet!
-   !begin-bullet!
    Fix parsing of Additional_Repositories which have a leading newline
    (@tmelliott, #251).

    !end-bullet!

!end-bullets-12!

# remotes 2.0.3

!begin-bullets-13!

-   !begin-bullet!
    The order of choices for `upgrade = "ask"` now puts the stable ones
    'All', 'CRAN only', 'none' first, so they always have the same
    numbers (#287).

    !end-bullet!
-   !begin-bullet!
    `update_submodules()` now works with empty .gitmodules files
    (@jsilve24, #329).

    !end-bullet!
-   !begin-bullet!
    remotes now understands the "standard" remote type, as produced by
    packages installed from CRAN using `pak` (#309)

    !end-bullet!
-   !begin-bullet!
    `install_dev()` now supports ref/pull format, e.g.
    `install_dev('shiny@v1.2-rc')` (@mkearney, #279).

    !end-bullet!
-   !begin-bullet!
    Fix return type of `install_remote()` when there is a circular
    dependency (#225)

    !end-bullet!
-   !begin-bullet!
    `remote_package_name.github_remote()` now works properly on Windows
    (#248)

    !end-bullet!
-   !begin-bullet!
    `install_bioc()` repositories now updated for the Bioconductor 3.8
    release. (#239)

    !end-bullet!
-   !begin-bullet!
    `install_*` functions now set the `R_LIBS*` environment variables
    for child processes correctly on Windows (@HenrikBengtsson, #253)

    !end-bullet!
-   !begin-bullet!
    `install_*` functions now support the `R_REMOTES_UPGRADE`
    environment variable, to set the default for the `upgrade` argument.
    See README for details (@kevinushey, #240).

    !end-bullet!
-   !begin-bullet!
    `install_*` functions perform basic HTTP authentication using HTTP
    headers now. This fixes an issue with `install_bitbucket()` and
    private repos (#255).

    !end-bullet!
-   !begin-bullet!
    `install_*` functions now respect the `download.file.method` option,
    if `download_file()` is used for HTTP.

    !end-bullet!
-   !begin-bullet!
    `install_*` functions now use the *libcurl* method, if the
    `download.file.method` option is not set to a different one, and
    libcurl is available. Before, the *wininet* method was preferred on
    Windows. If you rely on the proxy configuration of *wininet*, then
    you might want to set the `download.file.method` option, or use
    another way to set up proxies, see `?download.file`.

    !end-bullet!
-   !begin-bullet!
    Remotes without package names are now unconditionally installed
    (#246).

    !end-bullet!
-   !begin-bullet!
    `install_github()` now includes a more informative error message
    when the status code is 404, asking the user to check that they have
    spelled the repo owner and repo correctly (included in the error
    message), and that they have the required permissions to access the
    repository.

    !end-bullet!
-   !begin-bullet!
    `install_*` functions (via the underlying private `install`
    function) now set `RGL_USE_NULL="TRUE"` in order to avoid errors
    when running headless and installing any package using `rgl`
    (@jefferis, ##333)

    !end-bullet!

!end-bullets-13!

# remotes 2.0.2

!begin-bullets-14!

-   !begin-bullet!
    `install_deps()` now installs un-installed remotes packages even
    when `upgrade = "never"` (@ankane, #227)

    !end-bullet!
-   !begin-bullet!
    `install_version()` now removes metadata added as a byproduct of
    using `install_url()` internally() (#224)

    !end-bullet!
-   !begin-bullet!
    `install()` now avoids converting warnings to errors if
    `R_REMOTES_NO_ERRORS_FROM_WARNINGS` is unset and
    `_R_CHECK_FORCE_SUGGESTS_=false`. This avoids failures due to
    Suggested packages potentially being missing.

    !end-bullet!
-   !begin-bullet!
    `install_bitbucket()` now works properly with packages in
    subdirectories (#220)

    !end-bullet!
-   !begin-bullet!
    `install_deps()` now installs un-installed packages even when
    `upgrade =   "never"` (#218)

    !end-bullet!

!end-bullets-14!

# remotes 2.0.1

!begin-bullets-15!

-   !begin-bullet!
    `install_github()` now bundles a GitHub PAT which is used on Travis
    to avoid hitting the rate limit too frequently. It also contains a
    more informative error message when the rate limit is hit on how to
    setup a GitHub personal access token.

    !end-bullet!
-   !begin-bullet!
    The dialog when `upgrade = "ask"` now has a 'CRAN only' option, to
    update only CRAN packages.

    !end-bullet!
-   !begin-bullet!
    No longer include project specific .Rprofile code in the temporary
    .Rprofile when `R_REMOTES_NO_ERRORS_FROM_WARNINGS=false` (the
    default).

    !end-bullet!
-   !begin-bullet!
    `update.package_deps()` no longer prompts to install uninstalled
    dependencies, they are always installed (#203).

    !end-bullet!
-   !begin-bullet!
    `available_packages()`, `available_packages_set()` and
    `available_packges_reset()` added to allow caching of the
    `available.packages()` database.

    !end-bullet!

!end-bullets-15!

# remotes 2.0.0

## Breaking changes

!begin-bullets-16!

-   !begin-bullet!
    `install_github()`'s previously deprecated `username` argument has
    been removed. (#142)

    !end-bullet!
-   !begin-bullet!
    `install_deps()`'s `threads` argument has been removed, use the
    `Ncpus` argument instead (#153, #154)

    !end-bullet!
-   !begin-bullet!
    `install_git()`'s `branch` argument has been renamed to `ref` and
    `branch` has been deprecated.

    !end-bullet!

!end-bullets-16!

## New features

!begin-bullets-17!

-   !begin-bullet!
    remotes now builds packages by default before installing them. This
    step uses the pkgbuild package, if available. If not, it calls
    `R CMD build` directly.

    !end-bullet!
-   !begin-bullet!
    New `install_dev()` to install the development version of a CRAN
    package, based on the URL and BugReports fields in the DESCRIPTION
    file (#144).

    !end-bullet!
-   !begin-bullet!
    `install_()*` functions now temporally put Rtools on the PATH when
    necessary, as long as the pkgbuild package is installed.

    !end-bullet!
-   !begin-bullet!
    remotes can be forced to use only its internal code by setting the
    environment variable `R_REMOTES_STANDALONE` = "true". This is useful
    when installing optional dependencies of remotes on Windows, such as
    curl or git2r (#147)

    !end-bullet!
-   !begin-bullet!
    When installing, remotes now errors on warnings, to catch cases
    where packages are only partially installed. This often happens on
    windows when the package dll is opened in another R process (#113).

    !end-bullet!
-   !begin-bullet!
    `install_()` functions now pass arguments, including authentication
    information and upgrade down to dependencies (#53, #86, #87).

    !end-bullet!
-   !begin-bullet!
    `install_()` functions allow the selection of a subset of packages
    to upgrade, in interactive mode, when `upgrade = "ask"`.

    !end-bullet!
-   !begin-bullet!
    `install_git()` now supports passing credentials, when it is used
    with `git = "git2r"` (#106)

    !end-bullet!
-   !begin-bullet!
    `install_()` functions now return the name of the package(s) which
    were installed (#55).

    !end-bullet!
-   !begin-bullet!
    git submodules are now installed if they exist and a git client is
    available (#138, #133, #103, #82).

    !end-bullet!
-   !begin-bullet!
    New `install_gitlab()` and `install_bioc()` functions, to install
    `gitlab` and `bioc` remote types.

    !end-bullet!
-   !begin-bullet!
    remotes now uses the same SHA updating logic for remotes as
    devtools, including checking if the SHA of the remote has changed
    since the last installation. (#135)

    !end-bullet!
-   !begin-bullet!
    `install_url()` can now install package binaries on windows
    (r-lib/devtools#1765)

    !end-bullet!

!end-bullets-17!

## Minor improvements and fixes

!begin-bullets-18!

-   !begin-bullet!
    `install_deps()` et al. now do not rewrite the `type` argument from
    `both` to `binary` to allow falling back to `source`. This fixes
    various installation failures.

    !end-bullet!
-   !begin-bullet!
    remotes now looks up GitHub package names locally, if possible, and
    uses the GitHub REST API (if the curl package is available, and not
    in standalone mode). This makes the remote lookup about 10x faster
    when the remote package has not changed since the last install.

    !end-bullet!
-   !begin-bullet!
    Using a GITHUB_PAT no longer prints diagnostic messages by default
    (r-lib/devtools#1752).

    !end-bullet!
-   !begin-bullet!
    remotes now always uses https URLs for R versions that support them
    (@ankane, #139)

    !end-bullet!
-   !begin-bullet!
    Do not include the BioCextra repository in versions after it was
    deprecated (R 3.5+, Bioc 3.6+).

    !end-bullet!
-   !begin-bullet!
    `install_()` functions now download tarballs (.tar.gz) files rather
    than zip archives (.zip). This results in generally smaller files
    and avoids issues with script permissions being lost and strange
    behavior of some external unzip programs on Windows (#96).

    !end-bullet!
-   !begin-bullet!
    Dependency parsing is now more robust to whitespace around the
    dependency specifications (#73).

    !end-bullet!
-   !begin-bullet!
    `standardise_dep()` exported, for use in devtools.

    !end-bullet!
-   !begin-bullet!
    `install_local()` now defaults to the current directory.

    !end-bullet!
-   !begin-bullet!
    `install_bitbucket()` now correctly supports authentication, and the
    `subdir` argument.

    !end-bullet!
-   !begin-bullet!
    `install_()` functions give a helpful warning when the package has
    long path names, on Windows. In this case building the package
    usually fails. (#84, #178).

    !end-bullet!
-   !begin-bullet!
    `install_()` functions have now a more robust way of handling
    various tar programs on Windows (#172).

    !end-bullet!
-   !begin-bullet!
    `install_()` functions now give a helpful warning on older R
    versions, on Windows, if `R.home()` contains a space character.
    Installation usually fails in this case.

    !end-bullet!
-   !begin-bullet!
    GitHub API errors now give better error messages, including data
    about the API rate limits.

    !end-bullet!

!end-bullets-18!

# remotes 1.1.1

!begin-bullets-19!

-   !begin-bullet!
    Accept HTTPS, SSH, or various browser URLs in GitHub repo
    specification, @jennybc, #90, #109, #112
    !end-bullet!

!end-bullets-19!

# remotes 1.1.0

!begin-bullets-20!

-   !begin-bullet!
    URL encode GitHub references, to allow installing from
    non-alphanumeric branch or tags, @krlmlr #38

    !end-bullet!
-   !begin-bullet!
    Better cooperation with proxy servers, and better download method
    selection on Windows, @cderv, #45, #46

    !end-bullet!
-   !begin-bullet!
    `install_deps()` supports tar balls, #47

    !end-bullet!
-   !begin-bullet!
    Allow training slash in GitHub repo specification, #54

    !end-bullet!
-   !begin-bullet!
    Work around on some Linux systems, where unzip is set to the empty
    string, @HenrikBengtsson, #57

    !end-bullet!
-   !begin-bullet!
    Check for circular dependencies while installing, #31

    !end-bullet!
-   !begin-bullet!
    Updated Bioconductor repo URLs for newer BioC versions

    !end-bullet!

!end-bullets-20!

# remotes 1.0.0

First public release.

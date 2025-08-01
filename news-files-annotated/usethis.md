# usethis (development version)

## Formatting

!begin-bullets-1!

-   !begin-bullet!
    `use_air()` is a new function to configure a project to use Air, an
    extremely fast R code formatter.

    !end-bullet!
-   !begin-bullet!
    `use_tidy_style()` is deprecated, in favor of using Air for any new,
    explicit formatting efforts (#2110).

    !end-bullet!

!end-bullets-1!

## Project-hood

!begin-bullets-2!

-   !begin-bullet!
    usethis's criteria for recognizing a project (listed in
    `?proj_utils`) have expanded to include (#2133):

    !begin-bullets-3!
    -   !begin-bullet!
        a `.vscode/settings.json` file, which Positron or VS Code might
        create
        !end-bullet!
    -   !begin-bullet!
        a `_quarto.yml` file, typical of a Quarto project
        !end-bullet!
    -   !begin-bullet!
        an `renv.lock` file, which renv creates
        !end-bullet!

    !end-bullets-3!
    !end-bullet!
-   !begin-bullet!
    `use_course()` and `use_zip()` open the new folder in a new session
    of the current IDE (RStudio or Positron) in more situations and add
    a `.here` file if the folder doesn't already fulfill any of
    usethis's criteria for a project root folder (#2127).

    !end-bullet!
-   !begin-bullet!
    `create_quarto_project()` is a new experimental function that
    combines basic usage of `quarto::quarto_create_project()` with some
    of the niceties of usethis's `create_*()` functions, such as opening
    the newly created project in your IDE (#1891, @focardozom).

    !end-bullet!

!end-bullets-2!

## Other

!begin-bullets-4!

-   !begin-bullet!
    `use_package(min_version = FALSE)` is treated the same as when
    `min_version` is not specified (#2117, @salim-b).

    !end-bullet!
-   !begin-bullet!
    `use_r_universe_badge()` is a new function that creates a README
    badge indicating your package is available on R-universe and
    reporting the latest version (@olivroy, #1883).

    !end-bullet!
-   !begin-bullet!
    Some GitHub functionality should now work for GitHub Enterprise
    Cloud (as opposed to GitHub Enterprise Server). Specifically an
    HTTPS URL such as `"https://my-cool-org.ghe.com"` should now be
    recognized as "looks like GitHub" (#2098, @jameslairdsmith).

    !end-bullet!
-   !begin-bullet!
    Several deprecated functions have been removed:

    !begin-bullets-5!
    -   !begin-bullet!
        `use_rscloud_badge()`, deprecated in v2.2.0; use
        `use_posit_cloud_badge()` instead
        !end-bullet!
    -   !begin-bullet!
        `git_branch_default()`, deprecated in v2.1.0; use
        `git_default_branch()` instead
        !end-bullet!
    -   !begin-bullet!
        `use_tidy_eval()`, deprecated in v2.2.0; no longer necessary
        !end-bullet!
    -   !begin-bullet!
        `use_github_actions()` and `use_github_action_check_release()`,
        deprecated in v.2.2.0; use `use_github_action('check-release')`
        instead
        !end-bullet!
    -   !begin-bullet!
        `use_github_action_check_standard()`, deprecated in v2.2.0; use
        `use_github_action('check-standard')` instead
        !end-bullet!
    -   !begin-bullet!
        `use_github_action_pr_commands()`, deprecated in v2.2.0
        !end-bullet!
    -   !begin-bullet!
        `use_github_action_check_full()`, deprecated in v2.1.0
        !end-bullet!

    !end-bullets-5!
    !end-bullet!

!end-bullets-4!

# usethis 3.1.0

!begin-bullets-6!

-   !begin-bullet!
    `use_vignette()` and `use_article()` support Quarto. The `name` of
    the new vignette or article can optionally include a file extension
    to signal whether `.Rmd` or `.qmd` is desired, with `.Rmd` remaining
    the default for now. Thanks to @olivroy for getting the ball rolling
    (#1997).

    !end-bullet!
-   !begin-bullet!
    `use_data()` defaults to serialization version 3 (@laurabrianna,
    #2044).

    !end-bullet!
-   !begin-bullet!
    `use_package()` can lower a minimum version requirement
    (@jplecavalier, #1957).

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` only suggests doing reverse dependency checks
    if there are, in fact, reverse dependencies (#1817, @seankross).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_upkeep_issue()` records the year it is being run in the
    `Config/usethis/upkeep` field in DESCRIPTION. If this value exists,
    it is used to filter the checklist when making the issue.

    !end-bullet!

!end-bullets-6!

# usethis 3.0.0

## Transition to cli package for UI

!begin-bullets-7!

-   !begin-bullet!
    The `ui_*()` functions have been marked as superseded. External
    users of these functions are encouraged to use the cli package
    instead. The cli package did not have the required functionality
    when the `usethis::ui_*()` functions were first created, but it does
    now and it's the superior option. There is a cli vignette about how
    to make this transition: `vignette("usethis-ui", package = "cli")`.
    usethis no longer uses the `ui_*()` functions internally, in favor
    of new cli-based helpers that are not exported.
    !end-bullet!

!end-bullets-7!

## Deprecated function and argument removal

We are removing functions and arguments that were deprecated as of
usethis v2.0.0, which was released in December 2020.

These changes have been in place for a long time now:

!begin-bullets-8!

-   !begin-bullet!
    Switch from git2r to gert (+ credentials).
    !end-bullet!
-   !begin-bullet!
    Use of git config and the gh package to infer, e.g., the target repo
    spec.
    !end-bullet!
-   !begin-bullet!
    Pivot towards GitHub Actions and away from Travis and AppVeyor.
    !end-bullet!

!end-bullets-8!

Functions that are removed and, where applicable, what to use instead:

!begin-bullets-9!

-   !begin-bullet!
    `git_credentials()`
    !end-bullet!
-   !begin-bullet!
    `use_git_credentials()`
    !end-bullet!
-   !begin-bullet!
    `browse_github_token()` (do `create_github_token()`)
    !end-bullet!
-   !begin-bullet!
    `browse_github_pat()` (do `create_github_token()`)
    !end-bullet!
-   !begin-bullet!
    `github_token()` (do `gh_token_help()` or `gh::gh_token()`)
    !end-bullet!
-   !begin-bullet!
    `pr_pull_upstream()` (do `pr_merge_main()`)
    !end-bullet!
-   !begin-bullet!
    `pr_sync()` (do `pr_merge_main(); pr_push()`)
    !end-bullet!
-   !begin-bullet!
    `use_appveyor()`
    !end-bullet!
-   !begin-bullet!
    `use_appveyor_badge()`
    !end-bullet!
-   !begin-bullet!
    `use_travis()`
    !end-bullet!
-   !begin-bullet!
    `use_travis_badge()`
    !end-bullet!
-   !begin-bullet!
    `browse_travis()`
    !end-bullet!
-   !begin-bullet!
    `use_pkgdown_travis()`
    !end-bullet!
-   !begin-bullet!
    `use_tidy_ci()` *deprecated in v2.1.0* (do
    `use_tidy_github_actions()`)
    !end-bullet!
-   !begin-bullet!
    `use_tidy_labels()` *deprecated in v2.1.0* (do
    `use_tidy_github_labels()`)
    !end-bullet!

!end-bullets-9!

Function arguments that are removed:

!begin-bullets-10!

-   !begin-bullet!
    `create_from_github(auth_token =, credentials =)`
    !end-bullet!
-   !begin-bullet!
    `use_github(auth_token =, credentials =)`
    !end-bullet!
-   !begin-bullet!
    `use_github_labels(repo_spec =, host =, auth_token =)`
    !end-bullet!
-   !begin-bullet!
    `use_github_links(auth_token =, host =)`
    !end-bullet!
-   !begin-bullet!
    `use_github_release(host =, auth_token =)`
    !end-bullet!

!end-bullets-10!

## Other changes

!begin-bullets-11!

-   !begin-bullet!
    `use_zip()` and `use_course()` are equipped to handle a ZIP where
    the parent folder is implicit (@burnsal, #1961).

    !end-bullet!
-   !begin-bullet!
    `use_test_helper()` is a new function to create a test helper file
    (@olivroy, #1822).

    !end-bullet!
-   !begin-bullet!
    `use_cpp11()` makes it easier to update `NAMESPACE` (@pachadotdev,
    #1921).

    !end-bullet!
-   !begin-bullet!
    `pr_merge_main()` now offers the choice to not open the files with
    merge conflicts (@olivroy, #1720).

    !end-bullet!
-   !begin-bullet!
    `edit_rstudio_snippets()` now accepts yaml snippets (@olivroy,
    #1941).

    !end-bullet!
-   !begin-bullet!
    `use_standalone()` inserts an improved header that includes the code
    needed to update the standalone file (@krlmlr, #1903).

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` and `use_upkeep_issue()` behave better when
    the user has a fork. The user is asked just once to choose between
    `origin` and `upstream` as the target repo (#2023).

    !end-bullet!
-   !begin-bullet!
    The README templates now recommend pak instead of devtools for
    package installation (@olivroy, #1723).

    !end-bullet!
-   !begin-bullet!
    `use_github()` now knows that you can reuse the name of an earlier
    repo that has since been renamed (@ateucher, #1893).

    !end-bullet!
-   !begin-bullet!
    `use_git()` no longer asks if you want to restart RStudio when using
    Positron.

    !end-bullet!
-   !begin-bullet!
    `use_test()` and `use_r()` now work when you are in
    `tests/testthat/_snaps/{foo}.md` (@olivroy, #1988).

    !end-bullet!
-   !begin-bullet!
    The URLs baked into the badge generated by
    `use_coverage(type = "codecov")` are updated and no longer specify a
    branch(#2008).

    !end-bullet!
-   !begin-bullet!
    `usethis::use_version()` now tolerates empty lines preceding the
    first section title in the package NEWS file. (#1976)

    !end-bullet!

!end-bullets-11!

# usethis 2.2.3

!begin-bullets-12!

-   !begin-bullet!
    Patch release with changes to `.Rd` files requested by CRAN.
    !end-bullet!

!end-bullets-12!

# usethis 2.2.2

!begin-bullets-13!

-   !begin-bullet!
    Implicit usage of `numeric_version()` via comparison now always
    provides character input. This is in response to a request from CRAN
    to anticipate future solutions to
    https://bugs.r-project.org/show_bug.cgi?id=18548.
    !end-bullet!

!end-bullets-13!

# usethis 2.2.1

!begin-bullets-14!

-   !begin-bullet!
    Internal helper `cran_version()`, used in functions such as
    `use_release_checklist()` and `use_news_md()`, is more resilient to
    situations where no CRAN mirror has been set (#1857).

    !end-bullet!
-   !begin-bullet!
    Internal usage of `numeric_version()` now always provides character
    input, rather than relying on implicit `as.character()` coercion.
    This is in response to a request from CRAN to anticipate future
    solutions to https://bugs.r-project.org/show_bug.cgi?id=18548
    (#1869).

    !end-bullet!

!end-bullets-14!

# usethis 2.2.0

## New functions

!begin-bullets-15!

-   !begin-bullet!
    `use_author()` is a new function to introduce a new person into the
    `Authors@R` field of DESCRIPTION (@avalcarcel9, #833).

    !end-bullet!
-   !begin-bullet!
    `use_rstudio_preferences()` lets you set RStudio preferences
    programmatically (#1518)

    !end-bullet!
-   !begin-bullet!
    `use_standalone()` is a new function that makes it easier to use
    standalone files provided by various low-level tidyverse packages,
    like rlang (#1654).

    !end-bullet!
-   !begin-bullet!
    `use_upkeep_issue()` is a new function to facilitate regular
    maintenance of your package. Similar to `use_release_issue()`, it
    opens an issue in your repo with a checklist of maintenance tasks.
    It will include additional bullets if your package includes an
    `upkeep_bullets()` function that returns a character vector (#1794).

    !end-bullet!

!end-bullets-15!

## Package development

!begin-bullets-16!

-   !begin-bullet!
    Although nested projects are discouraged, they can be useful in
    development contexts. `create_package()` now sets the correct
    package name and returns the correct package path for a package
    nested inside a project (#1647).

    !end-bullet!
-   !begin-bullet!
    `use_article()` no longer adds the rmarkdown package to `Suggests`.
    Instead, if rmarkdown is not already a dependency, it's added to
    `Config/Needs/website`. This means that a package that only uses
    articles (vs. vignettes) won't gain an unnecessary dependency on
    rmarkdown (#1700).

    !end-bullet!
-   !begin-bullet!
    `use_data()` now sets the appropriate minimal R version in
    `DESCRIPTION`, depending on which serialization format `version` you
    choose (@dpprdan, #1672).

    !end-bullet!
-   !begin-bullet!
    `use_github_links()` by default now appends the GitHub url to
    existing urls in in the `URL` field of DESCRIPTION, rather than
    replacing existing urls (#1805).

    !end-bullet!
-   !begin-bullet!
    `use_latest_dependencies()` no longer affects `Suggests` since those
    dependencies are not enforced (#1749).

    !end-bullet!
-   !begin-bullet!
    `use_news_md()` now places "(development version)" in the header of
    `NEWS.md` if there is a development version number in `DESCRIPTION`.
    It also sets the first bullet to "Initial CRAN submission" when it
    looks like a "new" package (#1708).

    !end-bullet!
-   !begin-bullet!
    `use_coverage()` no longer adds covr to `Suggests`, since the
    `test-coverage` GitHub Actions workflow takes care of installing
    covr (@Bisaloo, #1851).

    !end-bullet!

!end-bullets-16!

## Package release

!begin-bullets-17!

-   !begin-bullet!
    `use_release_issue()` will now remind you to run
    `use_github_links()` if necessary (@Bisaloo, #1754)

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` now encourages the creation of `NEWS.md` prior
    to submission, instead of after (#1755).

    !end-bullet!
-   !begin-bullet!
    `use_github_release()` now automatically pushes to GitHub (if safe)
    and automatically publishes the release, rather than requiring you
    to edit and publish the draft (#1385).

    !end-bullet!
-   !begin-bullet!
    `use_github_release()` no longer fails in the absence of `NEWS.md`
    (#1755).

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` will now remind you to check/close the
    milestone corresponding to the release, if it exists (#1642).

    !end-bullet!
-   !begin-bullet!
    `use_version()` and `use_dev_version()` gain a `push` argument to
    optionally push the result after committing. This is used to
    eliminate a manual step from the `use_release_issue()` checklist
    (#1385).

    !end-bullet!
-   !begin-bullet!
    `use_revdep()` no longer places an email template, because these
    days we are more likely to communicate with other maintainers about
    breaking changes via GitHub issues and pull requests (#1769).

    !end-bullet!

!end-bullets-17!

## Package file management

!begin-bullets-18!

-   !begin-bullet!
    `rename_files()` now also affects files in `src/` (#1585).

    !end-bullet!
-   !begin-bullet!
    `use_r()` and `use_test()` now work with all active files in `R/`,
    `src/`, and `tests/testthat/` (#1566).

    !end-bullet!
-   !begin-bullet!
    `use_r()` and `use_test()` now work with files containing `.`
    (#1690).

    !end-bullet!
-   !begin-bullet!
    `use_rcpp()`, `use_c()` and friends now work the same way as
    `use_r()` and `use_test()`: they'll take the default file name from
    the file you currently have open in RStudio (#1730).

    !end-bullet!

!end-bullets-18!

## Git and GitHub

!begin-bullets-19!

-   !begin-bullet!
    `create_from_github()` will now use an existing `.Rproj` file if it
    exists anywhere in the repo, not just the root directory. This is
    useful if you're working with repos that contain tools for multiple
    languages (#1680).

    !end-bullet!
-   !begin-bullet!
    `git_sitrep()` gains two arguments: `tool` and `scope`, which
    enables you to limit the report to, for example, `tool = "git"` or
    `scope = "user"`. The default remains to provide a full report.
    Also, provides more feedback if git user's information is not set,
    and checks global git-email against user-level GitHub PAT
    (@ijlyttle, #1732, #1714, #1706).

    !end-bullet!
-   !begin-bullet!
    `git_vaccinated()` now treats a path configured as
    `core.excludesFile` like other user-supplied paths; in particular,
    any use of the `~/` home directory shortcut is expanded via
    `fs::path_expand()` (@dpprdan, #1560).

    !end-bullet!
-   !begin-bullet!
    `use_github_action()` now suggests possible actions when called
    without arguments (#1724).

    !end-bullet!
-   !begin-bullet!
    `use_github_actions()`, `use_github_action_check_standard()`,
    `use_github_action_check_release()`, and
    `use_github_action_pr_commands()` have been deprecated in favour of
    the new interactive powers of `use_github_action()` (#1724).

    !end-bullet!

!end-bullets-19!

## Minor improvements and fixes

!begin-bullets-20!

-   !begin-bullet!
    Links to the R Packages book have been updated to the second edition
    of the book (#1689).

    !end-bullet!
-   !begin-bullet!
    The SVG badges placed by `use_lifecycle()` have improved
    accessibility features, i.e. they advertise the lifecycle stage via
    the `aria-label` attribute (#1554,
    https://github.com/r-lib/lifecycle/issues/117).

    !end-bullet!
-   !begin-bullet!
    `use_rscloud_badge()` has been deprecated in favour of
    `use_posit_cloud_badge()`, and both functions now accept the updated
    url format of Posit Cloud projects (#1670).

    !end-bullet!
-   !begin-bullet!
    `use_rstudio()` gains a `reformat` argument which omits `.Rproj`
    settings that enforce file formatting conventions, e.g. around
    whitespace. `create_from_github()` uses this option when it
    introduces an `.Rproj` to a project that lacks one, making it easier
    to follow the project's existing conventions (#1679).

    !end-bullet!
-   !begin-bullet!
    `write_over()` and `use_github_file()` gain an overwrite argument
    (#1748).

    !end-bullet!

!end-bullets-20!

## Tidyverse-related

!begin-bullets-21!

-   !begin-bullet!
    `use_release_issue()` now uses internal `release_extra_revdeps()` to
    add extra revdep sources. Currently only use for internal Posit
    tooling, but we hope to extend to all users in the future (#1610).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_logo()` is a new function that calls `use_logo()` on the
    appropriate hex sticker PNG file at
    https://github.com/rstudio/hex-stickers (#1871).

    !end-bullet!

!end-bullets-21!

## Deprecated functions

!begin-bullets-22!

-   !begin-bullet!
    `use_tidy_eval()` is now deprecated because it imports and
    re-exports a large number of functions that are no longer needed in
    order to do tidy evaluation (#1656).

    !end-bullet!
-   !begin-bullet!
    `use_travis()`, `use_pkgdown_travis()`, `browse_travis()`, and
    `use_appveyor()` are now deprecated because we no longer recommend
    Travis or Appveyor. We recommend GitHub actions instead (#1517).

    !end-bullet!

!end-bullets-22!

# usethis 2.1.6

### GitHub-related

!begin-bullets-23!

-   !begin-bullet!
    `use_github_action()` and friends gain a `ref` argument, which
    defaults to the tag of the latest release in
    https://github.com/r-lib/actions (#1541).

    !end-bullet!
-   !begin-bullet!
    `use_github_actions_badge()` now uses the same URLs as GitHub does
    via the "Create status badge" helper in the browser (#1525). This
    changes the significance of the `name` argument; now it really must
    be the name of the workflow configuration file.

    !end-bullet!
-   !begin-bullet!
    All functions error more clearly when the requested operation is not
    supported for the "theirs" remote configuration (#1588).

    !end-bullet!

!end-bullets-23!

### Other changes

!begin-bullets-24!

-   !begin-bullet!
    `use_roxygen_md()` gains an `overwrite` argument (#1599).

    !end-bullet!
-   !begin-bullet!
    `use_rscloud_badge()` is a new function that creates a README badge
    indicating the repository can be launched in an RStudio Cloud
    project (@gvelasq, #1584).

    !end-bullet!
-   !begin-bullet!
    `use_data()` gains an `ascii` argument, which is passed along to
    `save()` (@JosiahParry, #1625).

    !end-bullet!
-   !begin-bullet!
    `use_code_of_conduct()` has been updated to version 2.1 of the
    Contributor Covenant (@batpigandme, #1591).

    !end-bullet!

!end-bullets-24!

# usethis 2.1.5

!begin-bullets-25!

-   !begin-bullet!
    pkgdown-related functions no longer automatically strip a trailing
    slash from the pkgdown site URL, in order to play more nicely with
    CRAN's URL checks (#1526).

    !end-bullet!
-   !begin-bullet!
    `edit_pkgdown_config()` is a new function that opens the pkgdown
    YAML configuration file for the current Project, if such a file
    exists.

    !end-bullet!
-   !begin-bullet!
    The error thrown when reporting an unsupported GitHub configuration
    has been fixed for forward compatibility with a future version of
    rlang, i.e. what is anticipated to be rlang v1.0.0.

    !end-bullet!
-   !begin-bullet!
    Version 2.1.4 was never released. Version was advanced from 2.1.4 to
    2.1.5 strictly for CRAN (re-)submission purposes.

    !end-bullet!

!end-bullets-25!

# usethis 2.1.3

!begin-bullets-26!

-   !begin-bullet!
    Modified a test to ensure that intermittent GitHub rate limiting
    does not lead to ungraceful failure on CRAN.
    !end-bullet!

!end-bullets-26!

# usethis 2.1.2

!begin-bullets-27!

-   !begin-bullet!
    `git_default_branch_rename()` no longer errors on repos where README
    exists, but has no badge block.

    !end-bullet!
-   !begin-bullet!
    `git_default_branch_rediscover()` prunes the defunct remote ref to
    the old default branch, e.g. `origin/master`.

    !end-bullet!
-   !begin-bullet!
    Version 2.1.1 was never released. Version was advanced from 2.1.1 to
    2.1.2 strictly for CRAN (re-)submission purposes.

    !end-bullet!

!end-bullets-27!

# usethis 2.1.0

## Git default branch support

usethis has a more sophisticated understanding of the default branch and
gains several functions to support default branch renaming.

!begin-bullets-28!

-   !begin-bullet!
    `git_branch_default()` has been renamed to `git_default_branch()`,
    to place it logically in the new family of functions. The old name
    still works, but that won't be true forever.
    !end-bullet!
-   !begin-bullet!
    `git_default_branch()` is much more diligent about figuring out the
    default branch. Instead of only consulting the local repo, now we
    integrate local info with the default branch reported by the
    `upstream` or `origin` remote, if applicable.
    !begin-bullets-29!
    -   !begin-bullet!
        This is intended to surface the case where a project has renamed
        its default branch and the local repo needs sync up with that.
        !end-bullet!

    !end-bullets-29!
    !end-bullet!
-   !begin-bullet!
    `git_default_branch_rediscover()` is a new function that helps
    contributors update their local repo (and personal fork, if
    applicable) when a project/repo renames its default branch.
    !end-bullet!
-   !begin-bullet!
    `git_default_branch_rename()` is a new function that helps a repo
    owner rename the default branch (both on GitHub and locally).
    !end-bullet!
-   !begin-bullet!
    `git_default_branch_configure()` is a new function to set the new
    Git configuration option `init.defaultBranch`, which controls the
    name of the initial branch of new local repos.
    !end-bullet!
-   !begin-bullet!
    `git_sitrep()` exposes `init.defaultBranch` and surfaces the more
    sophisticated analysis of `git_default_branch()`.
    !end-bullet!

!end-bullets-28!

## Other GitHub-related changes

!begin-bullets-30!

-   !begin-bullet!
    `git_sitrep()` and `gh_token_help()` try even harder to help people
    get on the happy path with respect to their GitHub PAT (#1400,
    #1413, #1488, #1489, #1497).

    !end-bullet!
-   !begin-bullet!
    The minimum version of gh has been bumped to help / force more
    people to upgrade to the gh version that supports current GitHub PAT
    formats (@ijlyttle, #1454).

    !end-bullet!
-   !begin-bullet!
    `use_github_file()` is a new function related to `use_template()`.
    Instead of starting from a local file, `use_github_file()` grabs the
    contents of an arbitrary file on GitHub that the user has permission
    to read. It supports targeting a specific branch, tag, or commit and
    can follow a symlink (#1407). `use_github_file()` now powers
    `use_github_action()` and friends.

    !end-bullet!
-   !begin-bullet!
    `use_github_release()` is much more diligent about using any
    information left behind by `devtools::submit_cran()` or
    `devtools::release()`. Specifically, this applies to determining
    which SHA is to be tagged in the release. And this SHA, in turn,
    determines the consulted versions of DESCRIPTION (for package
    version) and NEWS.md (for release notes) (#1380).

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` also takes bullets from `release_questions()`,
    for compatibility with `devtools::release()`.

    !end-bullet!
-   !begin-bullet!
    `git_vaccinate()`, `edit_git_ignore()`, and `git_sitrep()` are more
    careful to consult, reveal, and set the `core.excludesFile` setting
    in user's Git configuration (#1461).

    !end-bullet!
-   !begin-bullet!
    `use_github_action_check_full()` has been removed. It's overkill for
    the majority of R packages, which are better off with
    `use_github_actions()` or `use_github_action_check_standard()`
    (#1490).

    !end-bullet!
-   !begin-bullet!
    `use_github_pages()` and `use_pkgdown_github_pages()` use a new
    method for creating an empty, orphan `gh-pages` branch. This is
    necessary due to new GitHub behaviour, where it has become
    essentially impossible to refer to the empty tree (#1472).

    !end-bullet!
-   !begin-bullet!
    `use_github()` can create repositories with `"internal"` visibility,
    a feature that exists within GitHub Enterprise products (#1505).

    !end-bullet!

!end-bullets-30!

## Package development

!begin-bullets-31!

-   !begin-bullet!
    `use_readme_rmd()` and `use_readme_md()` no longer include CRAN
    installation instructions in the initial template; instead, we only
    include GitHub-based install instructions or otherwise prompt the
    user to update instructions (#1507).

    !end-bullet!
-   !begin-bullet!
    `use_import_from()` is a new function that puts
    `@importFrom pkg fun` directives into a package in a consistent
    location (@malcolmbarrett, #1377).

    !end-bullet!
-   !begin-bullet!
    `DESCRIPTION` files generated by usethis no longer include
    `LazyData` by default, as per new CRAN checks; instead, `LazyData`
    is now added the first time you use `use_data()` (@malcolmbarrett,
    #1404).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_eval()` has been updated to reflect current
    recommendations for using (and therefore exposing) tidy eval in
    other packages (@lionel-, #1445).

    !end-bullet!
-   !begin-bullet!
    `use_pkgdown()` automatically uses Bootstrap 5 if the pkgdown
    version supports it (anticipated for pkgdown 2.0.0).

    !end-bullet!
-   !begin-bullet!
    `use_lifecycle()` now imports `lifecycle::deprecated()` (#1419).

    !end-bullet!
-   !begin-bullet!
    `use_code_of_conduct()` now requires a `contact` argument to supply
    contact details for reporting CoC violations (#1269).

    !end-bullet!
-   !begin-bullet!
    `use_package()` no longer guides the user on how to use a dependency
    when no change was made (@malcolmbarrett, #1384).

    !end-bullet!

!end-bullets-31!

### Aimed at the tidyverse team

These functions are exported for anyone to use, but are aimed primarily
at the maintainers of tidyverse, r-lib, and tidymodels packages.

!begin-bullets-32!

-   !begin-bullet!
    `use_tidy_dependencies()` is a new function that sets up standard
    dependencies used by all tidyverse packages, except those that are
    designed to be dependency free (#1423).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_upkeep_issue()` is a new function similar to
    `use_release_issue()` that creates a checklist-style issue to prompt
    various updates (#1416).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_release_test_env()` has been deleted since we no longer
    recommend including test environments in `cran-comments.md`. There's
    no evidence that CRAN finds it useful, and it's annoying to keep
    up-to-date (#1365).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_github_labels()` is the new name for `use_tidy_labels()`
    (#1430).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_github_actions()` takes over for `use_tidy_ci()`, which is
    now deprecated.

    !end-bullet!

!end-bullets-32!

## User-level configuration

!begin-bullets-33!

-   !begin-bullet!
    `"usethis.overwrite"` is a new option. When set to `TRUE`, usethis
    overwrites an existing file without asking for user confirmation if
    the file is inside a Git repo. The normal Git workflow makes it easy
    to see and selectively accept/discard any proposed changes. This
    behaviour is strictly opt-in (#1424).

    !end-bullet!
-   !begin-bullet!
    Functions that provide code to load packages in your `.Rprofile` now
    use `rlang::check_installed()` to make sure the package is installed
    locally (@malcolmbarrett, #1398).

    !end-bullet!
-   !begin-bullet!
    `edit_rstudio_prefs()` and `edit_rstudio_snippets()` should work now
    on case-sensitive OSes, due to a path fix re: the location of
    RStudio's config files (@charliejhadley, #1420).

    !end-bullet!

!end-bullets-33!

# usethis 2.0.1

!begin-bullets-34!

-   !begin-bullet!
    All functions that require a package now ask you if you'd like to
    install it.

    !end-bullet!
-   !begin-bullet!
    Added `edit_template()` for opening and creating files in
    `inst/templates` (for use with `use_template()`) (@malcolmbarrett,
    #1319).

    !end-bullet!
-   !begin-bullet!
    `use_article()` now creates the file in the `vignettes/articles/`
    (#548).

    !end-bullet!
-   !begin-bullet!
    `use_lifecycle()` has been updated for changes in our lifecycle
    workflow (#1323).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_pkgdown()` has been renamed to
    `use_pkgdown_github_pages()` since the function is useful for anyone
    who wants to automatically publish to GitHub pages, not just the
    tidyverse team (#1308).

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` includes a bunch of minor improvements. Most
    importantly, for initial CRAN release we now include a number of
    common things that CRAN checks for that aren't in `R CMD check`.

    !end-bullet!
-   !begin-bullet!
    `use_readme_rmd()`, `use_readme_md()`, `use_tidy_contributing()`,
    and `use_tidy_support()` use updated logic for determining the
    `OWNER/REPO` spec of the target repo (#1312).

    !end-bullet!

!end-bullets-34!

# usethis 2.0.0

## Adoption of gert and changes to Git/GitHub credential handling

Usethis has various functions that help with Git-related tasks, which
break down into two categories:

1.  Git tasks, such as clone, push, and pull. These are things you could
    do with command line Git.
2.  GitHub tasks, such as fork, release, and open an issue or pull
    request. These are things you could do in the browser or with the
    GitHub API.

We've switched from git2r to the gert package for Git operations
(https://docs.ropensci.org/gert/). We continue to use the gh package for
GitHub API work (https://gh.r-lib.org).

The big news in this area is that these lower-level dependencies are
getting better at finding Git credentials, finding the same credentials
as command line Git (and, therefore, the same as RStudio), and finding
the same credentials as each other. This allows usethis to shed some of
the workarounds we have needed in the past, to serve as a remedial
"credential valet".

Under the hood, both gert and gh are now consulting your local Git
credential store, when they need credentials. At the time of writing,
they are using two different even-lower-level packages to do this:

!begin-bullets-35!

-   !begin-bullet!
    gert uses the credentials package
    (https://docs.ropensci.org/credentials/)
    !end-bullet!
-   !begin-bullet!
    gh uses the gitcreds package (https://gitcreds.r-lib.org/)
    !end-bullet!

!end-bullets-35!

Even now, gert and gh should discover the same credentials, at least for
github.com. In the future, these two packages may merge into one.

Git/GitHub credential management is covered in a new article: Managing
Git(Hub) Credentials

The main user-facing changes in usethis are:

!begin-bullets-36!

-   !begin-bullet!
    usethis should discover and use the same credentials as command line
    Git.
    !end-bullet!
-   !begin-bullet!
    usethis should be able to work with any GitHub deployment. While
    github.com is the default, GitHub Enterprise deployments are fully
    supported. The target GitHub host is determined from the current
    project's configured GitHub remotes, whenever possible.
    !end-bullet!

!end-bullets-36!

As a result, several functions are deprecated and several other
functions have some deprecated arguments.

!begin-bullets-37!

-   !begin-bullet!
    Deprecated functions:
    !begin-bullets-38!
    -   !begin-bullet!
        `use_git_credentials()`
        !end-bullet!
    -   !begin-bullet!
        `git_credentials()`
        !end-bullet!
    -   !begin-bullet!
        `github_token()`
        !end-bullet!

    !end-bullets-38!
    !end-bullet!
-   !begin-bullet!
    Functions with (deprecated arguments):
    !begin-bullets-39!
    -   !begin-bullet!
        `create_from_github()` (`auth_token`, `credentials`)
        !end-bullet!
    -   !begin-bullet!
        `use_github()` (`auth_token`, `credentials`)
        !end-bullet!
    -   !begin-bullet!
        `use_github_links()` (`host`, `auth_token`)
        !end-bullet!
    -   !begin-bullet!
        `use_github_labels()` (`repo_spec`, `host`, `auth_token`)
        !end-bullet!
    -   !begin-bullet!
        `use_tidy_labels()` (`repo_spec`, `host`, `auth_token`)
        !end-bullet!
    -   !begin-bullet!
        `use_github_release()` (`host`, `auth_token`)
        !end-bullet!

    !end-bullets-39!
    !end-bullet!

!end-bullets-37!

The switch to gert + credentials should eliminate most
credential-finding fiascos. Gert also takes a different approach to
wrapping libgit2, the underlying C library that does Git operations. The
result is more consistent support for SSH and TLS, across all operating
systems, without requiring special effort at install time. More users
should enjoy Git remote operations that "just work", for both SSH and
HTTPS remotes. There should be fewer "unsupported protocol" errors.

## GitHub remote configuration

Usethis gains a more formal framework for characterizing a GitHub remote
configuration. We look at:

!begin-bullets-40!

-   !begin-bullet!
    Which GitHub repositories `origin` and `upstream` point to
    !end-bullet!
-   !begin-bullet!
    Whether you can push to them
    !end-bullet!
-   !begin-bullet!
    How they relate to each other, e.g. fork-parent relationship
    !end-bullet!

!end-bullets-40!

This is an internal matter, but users will notice that usethis is more
clear about which configurations are supported by various functions and
which are not. The most common configurations are reviewed in a section
of Happy Git.

When working in a fork, there is sometimes a question whether to target
the fork or its parent repository. For example, `use_github_links()`
adds GitHub links to the URL and BugReports fields of DESCRIPTION. If
someone calls `use_github_links()` when working in a fork, they probably
want those links to refer to the *parent* or *source* repo, not to their
fork, because the user is probably preparing a pull request. Usethis
should now have better default behaviour in these situations and, in
some cases, will present an interactive choice.

## Default branch

There is increasing interest in making the name of a repo's default
branch configurable. Specifically, `main` is emerging as a popular
alternative to `master`. Usethis now discovers the current repo's
default branch and uses that everywhere that, previously, we had
hard-wired `master`.

`git_branch_default()` is a newly exported function that is also what's
used internally.

`use_course()`, `use_zip()`, and `create_download_url()` all have some
support for forming the URL to download a `.zip` archive of a repo,
based on a repo specification (e.g. `OWNER/REPO`) or a browser URL.
These helpers now form a URL that targets `HEAD` of the repo, i.e. the
default branch.

## Changes to Git/GitHub functionality

The default Git protocol is now "https" and we no longer provide an
interactive choice, by default, in interactive sessions. As always, a
user can express a preference for "ssh" in individual function calls,
for an R session via `use_git_protocol()`, and for all R sessions via
the `usethis.protocol` option (#1262).

`pr_resume()` is a new function for resuming work on an existing local
PR branch. It can be called argument-less, to select a branch
interactively.

`pr_fetch()` can also be called with no arguments, to select a PR
interactively. The `owner` argument is replaced by `target`, with a
choice of the source (default) or primary repo.

`pr_forget()` is a new function for abandoning a PR you initiated
locally or fetched from GitHub. It only does local clean up and, for
example, doesn't delete a remote branch or close a PR (#1263).

`pr_view()` can now be called with no arguments. If the current branch
is associated with an open PR, we target that and, otherwise, we offer
an interactive selection.

`pr_finish()` deletes the remote PR branch if the PR has been merged and
the current user has the power to do so, i.e. an external contributor
deleting their own branch or a maintainer deleting a branch associated
with an internal PR (#1150). It no longer errors if the PR branch has
already been deleted (#1196).

`pr_pull_upstream()` is renamed to `pr_merge_main()` to emphasize that
it merges the **main** line of development into the current branch,
where the main line of development is taken to mean the default branch,
as reported by `git_branch_default()`, of the source repo, which could
be either `upstream` or `origin`, depending on the situation.

`create_from_github()` will only create a read-only clone, due to lack
of a GitHub personal access token, if explicitly directed to do so via
`fork = FALSE`.

`create_from_github()` and `use_tidy_thanks()` accept browser and Git
URLs as the `repo_spec` argument, to be friendlier to copy/paste. When a
URL is passed, the `host` is also extracted from it.

`create_github_token()` is a new name for the function previously known
as `browse_github_token()` and `browse_github_pat()`.

`issue_close_community()` and `issue_reprex_needed()` are two new
functions for maintainers who process lots of GitHub issues. They
automate canned replies and actions, e.g. labelling or closing (#940).

GitHub Actions is the preferred platform for continuous integration,
because that is what the tidyverse team currently uses and maintains.
Functions related to Travis-CI and AppVeyor are soft-deprecated to raise
awareness about this change and to make it clear that, if substantial
maintenance becomes necessary, we may elect to retire the function
(#1169).

`browse_github_actions()` is a new function to open the Actions page of
the respective repo on GitHub, similar to existing `browse_*()`
functions (@pat-s, #1102).

`use_github_pages()` is a new function to activate or reconfigure the
GitHub Pages site associated with a repository (#224).

`use_tidy_pkgdown()` implements the complete pkgdown configuration used
by the tidyverse team (#224).

`pr_sync()` is deprecated and can be replicated by calling `pr_pull()`,
`pr_merge_main()`, then `pr_push()`.

## Licensing improvements

All `use_*_license()` functions now work for projects, not just
packages.

`use_apl2_license()` (not `use_apache_license()`) and
`use_gpl3_license()` no longer modify the license text (#1198).

`use_mit_license()` now sets the default copyright holder to "{package}
authors". This makes it more clear that the copyright holders are the
contributors to the package; unless you are using a CLA there is no one
copyright holder of a package (#1207).

New `use_gpl_license()` and `use_agpl_license()` make it easier to pick
specific versions of the GPL and AGPL licenses, and to choose whether or
not you include future versions of the license. Both default to version
3 (and above).

New `use_proprietary_license()` allows your package to pass R CMD check
while making it clear that your code is not open source (#1163). Thanks
to @atheriel for the blog post suggesting the wording:
https://unconj.ca/blog/copyright-in-closed-source-r-packages-the-right-way.html

`use_lgpl_license()` now uses version 3 (and above), and gains new
`version` and `include_future` argument to control which version is
used.

`use_gpl3_license()`, `use_agpl3_license()` and `use_apl2_license()`
have been deprecated in favour of the new `version` argument to
`use_gpl_license()`, `use_agpl_license()` and `use_apache_license()`.

The `name` argument to `use_mit_license()` has been changed to
`copyright_holder` to make the purpose more clear. The `name` argument
has been removed from all other license functions because it is not
needed; no other license makes an assertion about who the copyright
holder is.

## RStudio preferences

usethis is now fully cognizant of the changes to RStudio preferences in
RStudio 1.3:

`edit_rstudio_snippets()` looks in the new location, and if you have
snippets in the old location, will automatically copy them to the new
location (#1204)

New `edit_rstudio_prefs()` opens RStudio preferences file for editing
(#1148).

`use_blank_slate()` can now configure your global, i.e. user-level,
RStudio preference, in addition to project-level (#1018).

## Other changes

`browse_package()` and `browse_project()` are new functions that let the
user choose from a list of URLs derived from local Git remotes and
DESCRIPTION (local or possibly on CRAN) (#1113).

The legacy `"devtools.desc"` option is no longer consulted when
populating a new DESCRIPTION file. You must use the
`"usethis.description"` now (#1069).

`use_dev_package()` gains a `remote` parameter to allow you to specify
the remote. The existing behaviour, which adds an `OWNER/REPO` GitHub
remote, remains the default (#918, @ijlyttle).

`use_cpp11()` is a new function to set up an R package to use cpp11.

`create_package(roxygen = FALSE)` once again writes a valid NAMESPACE
file (and also has no Roxygen\* fields in DESCRIPTION) (#1120).

`create_package()`, `create_project()`, `create_from_github()`, and
`proj_activate()` work better with relative paths, inside and outside of
RStudio (#1122, #954).

`use_testthat()` gains an edition argument to support testthat v3.0.0
(#1185)

`use_version()` now updates `src/version.c` if it exists and contains a
line matching `PKG_version = "x.y.z";`.

usethis has been re-licensed as MIT (#1252, #1253).

## Dependency changes

New Imports: gert, jsonlite (was already an indirect dependency),
lifecycle, rappdirs

No longer in Imports: git2r, rematch2

# usethis 1.6.3

Patch release to refactor usage of withr in the tests for forward
compatibility with an upcoming withr release. All changes are within the
usethis tests.

# usethis 1.6.1

Patch release to align some path handling internals with an update
coming in the fs package.

!begin-bullets-41!

-   !begin-bullet!
    `use_github_links()` is a bit more clever about remotes
    (e.g. `origin` vs. `upstream`), which makes it easier to make a PR
    that adds GitHub links for a package you've forked.

    !end-bullet!
-   !begin-bullet!
    `use_pkgdown()` now `.gitignore`s the destination directory and only
    adds the destination directory to the config file if it departs from
    the default (which is `docs/`).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_ci()` is now deprecated in favour of
    `use_tidy_github_actions()` (#1098).

    !end-bullet!
-   !begin-bullet!
    `use_github_action_check_standard()` is a new intermediate workflow
    that checks on more platforms than `_release`, but is less
    exhaustive than `_full` (@jimhester).

    !end-bullet!
-   !begin-bullet!
    `create_tidy_package()` now uses an MIT license (@topepo, #1096).

    !end-bullet!

!end-bullets-41!

# usethis 1.6.0

## GitHub actions

!begin-bullets-42!

-   !begin-bullet!
    New `use_github_actions()`, `use_github_action_check_release()`,
    `use_github_action_check_full()`, `use_github_action_pr_commands()`,
    to set up GitHub Actions for a package (@jimhester).

    !end-bullet!
-   !begin-bullet!
    We now recommend GitHub Actions instead of Travis-CI or AppVeyor,
    and strongly recommend upgrading your packages.

    !end-bullet!
-   !begin-bullet!
    Fix `use_github_action()` URL parameter to ensure custom URLs are
    allowed. (@coatless, #1065).

    !end-bullet!

!end-bullets-42!

## Package creation

!begin-bullets-43!

-   !begin-bullet!
    `create_package()` gains a `roxygen` argument. If `TRUE` (the
    default), it adds a `RoxygenNote` field to the `DESCRIPTION` (which
    means the first run of `devtools::check()` will re-document the
    package, #963), and creates an empty `NAMESPACE` (which means you'll
    always need an explicit `@export` if you want to export functions,
    #927). It also turns markdown processing on by default (#911).

    !end-bullet!
-   !begin-bullet!
    `use_rstudio()` now sets the `LineEndingConversion` to `Posix` so
    that packages created using usethis always use LF line endings,
    regardless of who contributes to them (#1002).

    !end-bullet!
-   !begin-bullet!
    In the `usethis.description` option, you can now set
    `Authors@R = person()` directly, without having to wrap in
    additional layer of quotes. If setting this in your `.Rprofile`,
    you'll need to use `utils::person()` since the utils package isn't
    loaded until after your profile is executed.

    !end-bullet!

!end-bullets-43!

## PR helpers

!begin-bullets-44!

-   !begin-bullet!
    A new article Pull request helpers demonstrates how to use the
    `pr_*()` functions (@mine-cetinkaya-rundel, #802).

    !end-bullet!
-   !begin-bullet!
    `pr_finish()` checks that you don't have any local changes (#805),
    and can optionally finish any PR, not just the current (#1040).

    !end-bullet!
-   !begin-bullet!
    `pr_pause()` and `pr_fetch()` now automatically pull to get latest
    changes (#959, #960) and refresh RStudio's git pane (#706).

    !end-bullet!
-   !begin-bullet!
    `pr_push()` now works for a repository with no open pull requests
    (@maurolepore, #990).

    !end-bullet!
-   !begin-bullet!
    `pr_pull()` gives more information about which files have merge
    conflicts and automatically opens conflicted files for editing
    (#1056).

    !end-bullet!

!end-bullets-44!

## Other new features

!begin-bullets-45!

-   !begin-bullet!
    New `rename_files()` makes it easy to rename paired `R/` and `test/`
    files (#784).

    !end-bullet!
-   !begin-bullet!
    New `ui_silence()` makes it easier to selectively silence some UI
    output.

    !end-bullet!
-   !begin-bullet!
    New `use_agpl3_license()` (@pachamaltese, #870).

    !end-bullet!
-   !begin-bullet!
    New `use_data_table()` to set up a package for Import-ing
    `data.table` (@michaelchirico, #897).

    !end-bullet!
-   !begin-bullet!
    `use_latest_dependencies()` replaces `use_tidy_version()` as the new
    name better reflect its usage (#771).

    !end-bullet!
-   !begin-bullet!
    New `use_lifecycle()` helper to import the lifecycle badges for
    functions and arguments in your package. Learn more at
    https://lifecycle.r-lib.org/.

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` will include additional bullets if your
    package includes `release_bullets()` function which returns a
    character vector (and the package has been loaded with `load_all()`)
    (#941).

    !end-bullet!

!end-bullets-45!

## Minor improvements and bug fixes

!begin-bullets-46!

-   !begin-bullet!
    When writing files, usethis now respects line endings. Default line
    endings are taken from the `.Rproj` file (if available), otherwise
    the `DESCRIPTION`, otherwise the first file found in `R/`, then all
    else failing to your platform default (#767). It should do a better
    job of preserving UTF-8 files on windows (#969).

    !end-bullet!
-   !begin-bullet!
    `browse_github()` now always goes to the canonical GitHub site:
    `https://github.com/user/repo`. This is slightly worse than the
    current behaviour but makes the function more consistent across
    packages, and considerably simplifies the implementation.

    !end-bullet!
-   !begin-bullet!
    `browse_circle()` opens the project dashboard on Circle CI.

    !end-bullet!
-   !begin-bullet!
    `create_download_url()` is a new helper for making "ZIP file
    download" URLs suitable for use with `use_course()` and `use_zip()`,
    starting with the URLs that mere mortals can usually get their hands
    on in a browser (@fmichonneau, #406).

    !end-bullet!
-   !begin-bullet!
    `create_package()` no longer fails partway through if you have a
    malformed `usethis.description` option (#961).

    !end-bullet!
-   !begin-bullet!
    `create_package()` will now create a package in a symlink to a
    directory (#794).

    !end-bullet!
-   !begin-bullet!
    `create_package()` and `use_description()` gain a `check_name`
    argument to control whether to check for package names invalid for
    CRAN (@noamross, #883).

    !end-bullet!
-   !begin-bullet!
    `edit_file()` and `use_test()` gain an `open` parameter that allows
    you to control whether or not the function is opened for editing by
    the user (#817).

    !end-bullet!
-   !begin-bullet!
    `edit_rstudio_snippets()` makes it more clear which snippet types
    are allowed and that user's snippets mask the built-in snippets
    (@GegznaV, #885).

    !end-bullet!
-   !begin-bullet!
    `git_sitrep()` now reports project-specific user name and email, if
    set (#837), and email(s) associated with your GitHub account
    (@dragosmg, #724).

    !end-bullet!
-   !begin-bullet!
    `ui_yeah()` and `ui_nope()` allow you to override the default "yes"
    and "no" strings and to opt-out of shuffling (@rundel, #796).

    !end-bullet!
-   !begin-bullet!
    `use_circleci()` uses correct delimiters in template (@jdblischak,
    #835).

    !end-bullet!
-   !begin-bullet!
    `use_circleci_badge()` is now exported (@pat-s, #920).

    !end-bullet!
-   !begin-bullet!
    `use_code_of_conduct()` now generates an absolute link to code of
    conduct on pkgdown website or original source to avoid R CMD check
    issues (#772).

    !end-bullet!
-   !begin-bullet!
    `use_course()` and `use_zip()` are now equipped with some retry
    capability, to cope with intermittent failure or the need for a
    longer connect timeout (#988).

    !end-bullet!
-   !begin-bullet!
    `use_data()` automatically bumps R dependency to 2.10 (#962).

    !end-bullet!
-   !begin-bullet!
    `use_data_raw()` template quotes the dataset name correctly (#736,
    @mitchelloharawild).

    !end-bullet!
-   !begin-bullet!
    `use_description_defaults()` now shows the default fields combined
    with any options that you have set.

    !end-bullet!
-   !begin-bullet!
    `use_dev_package()` now supports packages installed from any remote
    type, not just GitHub (@antoine-sachet, #1071).

    !end-bullet!
-   !begin-bullet!
    `use_git()` will now create initial commit if needed (#852).

    !end-bullet!
-   !begin-bullet!
    `use_github_release()` no longer fails if you have no news bullets
    (#1048).

    !end-bullet!
-   !begin-bullet!
    `use_github_release()` now tags the latest local commit instead of
    the latest remote commit on the default branch (@davidchall, #1029).

    !end-bullet!
-   !begin-bullet!
    `use_gpl3_license()` now completes the license by providing
    additional information in a file named LICENSE, just like
    `use_mit_license()` and friends (@Cervangirard, #683).

    !end-bullet!
-   !begin-bullet!
    `use_logo()` now generates the correct href if the pkgdown `url` is
    set (@mitchelloharawild, #986).

    !end-bullet!
-   !begin-bullet!
    `use_make()` gains missing closing parenthesis (@ryapric, #804).

    !end-bullet!
-   !begin-bullet!
    `use_markdown_template()` no longer uses an unexported function in
    its default arguments (@fmichonneau, #761).

    !end-bullet!
-   !begin-bullet!
    `use_testthat()` and `use_test()` now work in projects, not just
    packages (#1017).

    !end-bullet!
-   !begin-bullet!
    `use_test()` works on Windows when called without arguments (#901).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_issue_template()` uses current github format (@Maschette,
    #756).

    !end-bullet!
-   !begin-bullet!
    `use_travis()`, `use_travis_badge()`, and `browse_travis()`, now
    default to `ext = "com"` since travis-ci.com is now recommended it
    over travis-ci.org (@riccardoporreca, #1038).

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` reminds you to re-generate `README.md`, if
    needed (#767).

    !end-bullet!
-   !begin-bullet!
    `use_r()` and `use_test()` throw a clear error if multiple names are
    provided (@strboul, #862).

    !end-bullet!
-   !begin-bullet!
    `use_rcpp()` and `use_c()` now ensure `src/` contains at least one
    `.cpp` or `.c` placeholder file, so that the package can be built
    (@coatless, #720).

    !end-bullet!
-   !begin-bullet!
    `usethis.destdir` is a new option that is consulted when deciding
    where to put a new folder created by `use_course()` or
    `create_from_github()` (@malcolmbarrett, #1015).

    !end-bullet!
-   !begin-bullet!
    `use_lifecycle()` no longer adds the lifecycle package to the
    DESCRIPTION file. With the new roxygen markdown syntax for including
    badges, lifecycle has become a build-time dependency.

    !end-bullet!

!end-bullets-46!

## Dependency changes

New Imports: cli, rematch2, rlang.

gh minimum version is bumped to v.1.1.0, due to changed behaviour around
requests that return nothing.

clisymbols is removed from Imports.

# usethis 1.5.1

This is a patch release with various small features and bug fixes.

## Using the pipe `%>%` or the tidy eval toolkit in your package

!begin-bullets-47!

-   !begin-bullet!
    The templates used by `use_pipe()` and `use_tidy_eval()` use a more
    robust form of cross-reference links, linking to files rather than
    topics. This should silence some warnings seen on Windows at install
    time (#730, #731 @jmgirard).

    !end-bullet!
-   !begin-bullet!
    `use_pipe()` gains a logical `export` argument, so it can do the
    setup necessary to use the pipe operator when it is re-exported
    (`export = TRUE`, which is the default and preserves the previous
    behaviour) and when it is not (`export = FALSE`) (#783).

    !end-bullet!

!end-bullets-47!

## Git, GitHub, and pull requests

!begin-bullets-48!

-   !begin-bullet!
    `use_github()` removes newline `\n` characters from the description
    that can cause the initial push to fail (#493, @muschellij2).

    !end-bullet!
-   !begin-bullet!
    `git_sitrep()` gives better feedback if we can't validate the GitHub
    PAT (#725, @ijlyttle).

    !end-bullet!
-   !begin-bullet!
    `create_from_github()` sets remote tracking branch of `master` to
    `upstream/master`, when it creates (and clones) a fork (#792).

    !end-bullet!
-   !begin-bullet!
    `pr_pause()` can switch back to master even if there is no remote
    tracking branch (#715, @cderv).

    !end-bullet!

!end-bullets-48!

## Build tools and continuous integration

!begin-bullets-49!

-   !begin-bullet!
    `use_tidy_ci()` is updated for R 3.6, meaning that R 3.2 is the
    oldest version of R supported through proactive testing.

    !end-bullet!
-   !begin-bullet!
    `use_make()` and `use_jenkins()` add a Makefile and Jenkinsfile,
    respectively (#501, @ryapric).

    !end-bullet!
-   !begin-bullet!
    `use_circleci()` creates a `.circleci/config.yaml` config file for
    CircleCI (#703, @jdblischak).

    !end-bullet!

!end-bullets-49!

## Other

!begin-bullets-50!

-   !begin-bullet!
    `use_zip()` is a new variant of `use_course()` that downloads and
    unpacks a ZIP file, with less pedantic behaviour re: the destination
    directory. Both functions now also work for ZIP files with MIME type
    `"application/x-zip-compressed"` (#573).

    !end-bullet!
-   !begin-bullet!
    `use_version()` can detect `"(development version)"` in a NEWS
    header and update it with an actual version (#768, @DavisVaughan).

    !end-bullet!

!end-bullets-50!

## Dependency changes

R 3.1 is no longer explicitly supported or tested. Our general practice
is to support the current release (3.6, at time of writing), devel, and
the 4 previous versions of R (3.5, 3.4, 3.3, 3.2).

fs minimum version is stated to be v1.3.0.

glue minimum version is stated to be v1.3.0.

# usethis 1.5.0

## Git, GitHub (and GitLab)

usethis gains several functions to inspect and manipulate the Git
situation for the current project = repository. We also provide more
control and visibility into git2r's workings, especially around
credentials (usethis uses git2r for all Git operations).

!begin-bullets-51!

-   !begin-bullet!
    `git_sitrep()` lets you know what's up with your Git, git2r and
    GitHub config (#328).

    !end-bullet!
-   !begin-bullet!
    `git_vaccinate()` vaccinates your global (i.e. user-level) git
    ignore file. It adds standard entries for R users, such as
    `.Rhistory` and `.Rdata`. This decreases the chance that you commit
    and push files containing confidential information (#469).

    !end-bullet!
-   !begin-bullet!
    `git_remotes()` and `use_git_remote()` are new helpers to inspect or
    modify Git remote URLs for the repo associated with the active
    project (#649).

    !end-bullet!
-   !begin-bullet!
    `git_protocol()` + `use_git_protocol()` and `git_credentials()` +
    `use_git_credentials()` are new helpers to summon or set Git
    transport protocol (SSH or HTTPS) or git2r credentials,
    respectively. These functions are primarily for internal use. Most
    users can rely on default behaviour. Use these helpers to intervene
    if git2r isn't discovering the right credentials (#653). usethis
    honors the `usethis.protocol` option, which allows you to express a
    general preference for SSH vs. HTTPS.

    !end-bullet!

!end-bullets-51!

Other improvements and bug fixes:

!begin-bullets-52!

-   !begin-bullet!
    `use_github()` tries harder but also fails earlier, with more
    informative messages, making it less likely to leave the repo
    partially configured (#221).

    !end-bullet!
-   !begin-bullet!
    `use_github()` and `create_from_github()` gain a `protocol` argument
    (#494, @cderv).

    !end-bullet!
-   !begin-bullet!
    `create_from_github()` pulls from upstream master in a fork (#695,
    @ijlyttle).

    !end-bullet!
-   !begin-bullet!
    `use_release_issue()` creates a GitHub issue containing a release
    checklist, reflecting the standard practices of the tidyverse team
    (#338).

    !end-bullet!
-   !begin-bullet!
    `use_github_release()` creates a draft GitHub release using the
    entries in `NEWS.md` (#137).

    !end-bullet!
-   !begin-bullet!
    `use_gitlab_ci()` creates a `gitlab-ci.yaml` config file for GitLab
    CI (#565, @overmar).

    !end-bullet!
-   !begin-bullet!
    `use_git_config()` now invisibly returns the previous values of the
    settings.

    !end-bullet!
-   !begin-bullet!
    `use_github_labels()` has been rewritten be more flexible. You can
    now supply a repo name, and `descriptions`, and you can set
    colours/descriptions independently of creating labels. You can also
    `rename` existing labels (#290).

    !end-bullet!

!end-bullets-52!

## GitHub pull requests

We've added **experimental** functions to work with GitHub pull
requests. They are aimed at both a maintainer (who may make, review, and
modify pull requests) and a contributor (who may make or explore pull
requests).

!begin-bullets-53!

-   !begin-bullet!
    `git_sitrep()` includes a section at the end aimed at describing
    "pull request readiness". Expect that to develop and expand.

    !end-bullet!
-   !begin-bullet!
    `pr_init()`, `pr_fetch()`, `pr_push()`, `pr_pull()`, `pr_finish()`,
    and `pr_view()` constitute the new family of helpers. They are
    designed to be smart about the significance of remotes with the
    standard names of `origin` and `upstream` and to facilitate both
    internal and external pull requests.

    !end-bullet!

!end-bullets-53!

## Partial file management

usethis gains tooling to manage part of a file. This is currently used
for managing badges in your README and roxygen import tags:

!begin-bullets-54!

-   !begin-bullet!
    `use_badge()` and friends now automatically add badges if your
    README contains a specially formatted badge block (#497):

    !begin-codeblock!
        <-- badge:start -->
        <-- badge:end -->

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `use_tibble()` and `use_rcpp()` automatically add roxygen tags to to
    `{package}-package.R` if it contains a specially formatted namespace
    block (#517):

    !begin-codeblock!
    ``` r
    ## usethis namespace: start
    ## usethis namespace: end
    NULL
    ```

    !end-codeblock!
    Unfortunately this means that `use_rcpp()` no longer supports
    non-roxygen2 workflows, but I suspect the set of people who use
    usethis and Rcpp but not roxygen2 is very small.

    !end-bullet!

!end-bullets-54!

## Extending and wrapping usethis

!begin-bullets-55!

-   !begin-bullet!
    New `proj_activate()` lets you activate a project, either opening a
    new RStudio session (if you use RStudio) or changing the working
    directory (#511).

    !end-bullet!
-   !begin-bullet!
    `proj_get()` and `proj_set()` no longer have a `quiet` argument. The
    user-facing message about setting a project is now under the same
    control as other messages,
    i.e. `getOption("usethis.quiet", default = FALSE)` (#441).

    !end-bullet!
-   !begin-bullet!
    A new set of `ui_*()` functions makes it possible to give your own
    code the same user interface as usethis (#308). All use the glue and
    crayon and packages to power easy interpolation and formatting.
    There are four families of functions:

    !begin-bullets-56!
    -   !begin-bullet!
        block styles: `ui_line()`, `ui_done()`, `ui_todo()`,
        `ui_oops()`, `ui_info()`.
        !end-bullet!
    -   !begin-bullet!
        conditions: `ui_stop()`, `ui_warn()`.
        !end-bullet!
    -   !begin-bullet!
        questions: `ui_yeah()`, `ui_nope()`.
        !end-bullet!
    -   !begin-bullet!
        inline styles: `ui_field()`, `ui_value()`, `ui_path()`,
        `ui_code()`.
        !end-bullet!

    !end-bullets-56!
    !end-bullet!
-   !begin-bullet!
    `with_project()` and `local_project()` are new withr-style functions
    to temporarily set an active usethis project. They make usethis
    functions easier to use in an *ad hoc* fashion or from another
    package (#441).

    !end-bullet!

!end-bullets-55!

## Tidyverse standards

These standards are (aspirationally) used by all tidyverse packages; you
are welcome to use them if you find them helpful.

!begin-bullets-57!

-   !begin-bullet!
    Call `use_tidy_labels()` to update GitHub labels. Colours are less
    saturated, docs is now documentation, we use some emoji, and
    performance is no longer automatically added to all repos (#519).
    Repo specific issues should be given colour `#eeeeee` and have an
    emoji.

    !end-bullet!
-   !begin-bullet!
    Call `use_logo()` to update the package logo to the latest
    specifications: `man/figure/logo.png` should be 240 x 278, and
    README should contain
    `<img src="man/figures/logo.png" align="right" height="139" />`.
    This gives a nicer display on retina displays. The logo is also
    linked to the pkgdown site if available (#536).

    !end-bullet!
-   !begin-bullet!
    When creating a new package, use `create_tidy_package()` to start
    with a package following the tidyverse standards (#461).

    !end-bullet!
-   !begin-bullet!
    `NEWS.md` for the development version should use "(development
    version)" rather than the specific version (#440).

    !end-bullet!
-   !begin-bullet!
    pkgdown sites should now be built by travis and deployed
    automatically to GitHub pages. `use_pkgdown_travis()` will help you
    set that up.

    !end-bullet!
-   !begin-bullet!
    When starting the release process, call `use_release_issue()` to
    create a release checklist issue (#338).

    !end-bullet!
-   !begin-bullet!
    Prior to CRAN submission call `use_tidy_release_test_env()` to
    update the test environment section in `cran-comments()` (#496).

    !end-bullet!
-   !begin-bullet!
    After acceptance, try `use_github_release()` to automatically create
    a release. It's created as a draft so you have a chance to look over
    before publishing.

    !end-bullet!
-   !begin-bullet!
    `use_vignette()` includes the a standard initialisation chunk with
    `knitr::opts_chunk$set(comment = "#>", collapse = TRUE)` which
    should be used for all Rmds.

    !end-bullet!

!end-bullets-57!

## New functions not already mentioned

!begin-bullets-58!

-   !begin-bullet!
    `use_devtools()` (#624), `use_conflicted()` (#362), and
    `use_reprex()` (#465) help add useful packages to your `.Rprofile`.

    !end-bullet!
-   !begin-bullet!
    `use_partial_warnings()` helps the user add a standard warning block
    to `.Rprofile` (#64).

    !end-bullet!
-   !begin-bullet!
    `edit_r_buildignore()` opens `.Rbuildignore` for manual editing
    (#462, @bfgray3).

    !end-bullet!
-   !begin-bullet!
    `use_lgpl_license()` automates set up of the LGL license (#448,
    @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `use_ccby_license()` adds a CCBY 4.0 license (#547, @njtierney).

    !end-bullet!
-   !begin-bullet!
    `use_rcpp_armadillo()` and `use_rcpp_eigen()` set up a package to
    use RcppArmadillo or RcppEigen, respectively (#421, @coatless,
    @duckmayr).

    !end-bullet!
-   !begin-bullet!
    `use_c("foo")` sets up `src/` and creates `src/foo.c` (#117).

    !end-bullet!
-   !begin-bullet!
    `use_covr_ignore()` makes it easy to ignore files in test coverage
    (#434).

    !end-bullet!
-   !begin-bullet!
    `use_pkgdown_travis()` helps you set up pkgdown for automatic
    build-and-deploy from Travis-CI to GitHub Pages (#524).

    !end-bullet!
-   !begin-bullet!
    `use_addin()` does setup for RStudio addins (#353, @haozhu233).

    !end-bullet!
-   !begin-bullet!
    `use_tutorial()` creates a new interactive R Markdown tutorial, as
    implemented by the `learnr` package (@angela-li, #645).

    !end-bullet!
-   !begin-bullet!
    `use_article()` creates articles, vignettes that are automatically
    added to `.Rbuildignore`. These appear on pkgdown sites, but are not
    included with the package itself (#281).

    !end-bullet!
-   !begin-bullet!
    `use_citation()` creates a basic `CITATION` template and puts it in
    the right place (#100).

    !end-bullet!

!end-bullets-58!

## Other minor bug fixes and improvements

!begin-bullets-59!

-   !begin-bullet!
    `write_union()` appends the novel `lines`, but does not remove
    duplicates from existing lines (#583, @khailper).

    !end-bullet!
-   !begin-bullet!
    `use_rcpp("foo")` now creates `src/foo.cpp` (#117).

    !end-bullet!
-   !begin-bullet!
    `use_data()` gains a `version` argument and defaults to
    serialization format version 2 (#675).

    !end-bullet!
-   !begin-bullet!
    `use_data_raw()` accepts a name for the to-be-prepared dataset and
    opens a templated R script (#646).

    !end-bullet!
-   !begin-bullet!
    `browse_github()` now falls back to CRAN organisation (with a
    warning) if package doesn't have its own GitHub repo (#186).

    !end-bullet!
-   !begin-bullet!
    `create_*()` restore the active project if they error part way
    through, and use `proj_activate()` (#453, #511).

    !end-bullet!
-   !begin-bullet!
    `edit_r_profile()` and `edit_r_environ()` now respect environment
    variables `R_PROFILE_USER` and `R_ENVIRON_USER`, respectively
    (#480).

    !end-bullet!
-   !begin-bullet!
    `use_description()` once again prints the generated description
    (#287).

    !end-bullet!
-   !begin-bullet!
    `use_description_field()` is no longer sensitive to whitespace,
    which allows `use_vignette()` to work even if the `VignetteBuilder`
    field is spread over multiple lines (#439).

    !end-bullet!
-   !begin-bullet!
    `use_logo()` can override existing logo if user gives permission
    (#454). It also produces retina appropriate logos by default, and
    matches the aspect ratio to the http://hexb.in/sticker.html
    specification (#499).

    !end-bullet!
-   !begin-bullet!
    `use_news_md()` will optionally commit.

    !end-bullet!
-   !begin-bullet!
    `use_package()` gains a `min_version` argument to specify a minimum
    version requirement (#498). Set to `TRUE` to use the currently
    installed version (#386). This is used by `use_tidy_eval()` in order
    to require version 0.1.2 or greater of rlang (#484).

    !end-bullet!
-   !begin-bullet!
    `use_pkgdown()` is now configurable with site options
    (@jayhesselberth, #467), and no longer creates the `docs/` directory
    (#495).

    !end-bullet!
-   !begin-bullet!
    `use_test()` no longer forces the filename to be lowercase (#613,
    @stufield).

    !end-bullet!
-   !begin-bullet!
    `use_test()` will not include a `context()` in the generated file if
    used with testthat 2.1.0 and above (the future release of testthat)
    (#325).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_description()` sets the `Encoding` field in `DESCRIPTION`
    (#502, @krlmlr).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_eval()` re-exports `:=` (#595, @jonthegeek).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_versions()` has source argument so that you can choose to
    use local or CRAN versions (#309).

    !end-bullet!
-   !begin-bullet!
    `use_travis()` gains an `ext` argument, defaulting to `"org"`. Use
    `ext = "com"` for `https://travis-ci.com` (@cderv, #500).

    !end-bullet!
-   !begin-bullet!
    `use_version()` asks before committing.

    !end-bullet!
-   !begin-bullet!
    `use_vignette()` now has a `title` argument which is used in YAML
    header (in the two places where it is needed). The vignettes also
    lose the default author and date fields (@rorynolan, #445), and the
    R Markdown starter material. They gain a standard setup chunk.

    !end-bullet!
-   !begin-bullet!
    `use_version("dev")` now creates a standard "(development version)"
    heading in `NEWS.md` (#440).

    !end-bullet!
-   !begin-bullet!
    `use_vignette()` now checks if the vignette name is valid (starts
    with letter and consists of letters, numbers, hyphen, and
    underscore) and throws an error if not (@akgold, #555).

    !end-bullet!
-   !begin-bullet!
    `restart_rstudio()` now returns `FALSE` in RStudio if no project is
    open, fixing an issue that caused errors in helpers that suggest
    restarting RStudio (@gadenbuie, #571).

    !end-bullet!

!end-bullets-59!

## Dependency changes

!begin-bullets-60!

-   !begin-bullet!
    withr moves from Suggests to Imports.

    !end-bullet!
-   !begin-bullet!
    purrr and yaml are new in Imports.

    !end-bullet!

!end-bullets-60!

# usethis 1.4.0

## File system

All usethis file system operations now use the fs package (#177). This
should not change how usethis functions, but users may notice these
features of fs-mediated paths:

!begin-bullets-61!

-   !begin-bullet!
    Paths are "tidy", meaning `/` is the path separator and there are
    never multiple or trailing `/`.
    !end-bullet!
-   !begin-bullet!
    Paths are UTF-8 encoded.
    !end-bullet!
-   !begin-bullet!
    A Windows user's home directory is interpreted as
    `C:\Users\username` (typical of Unix-oriented tools, like Git and
    ssh; also matches Python), as opposed to
    `C:\Users\username\Documents` (R's default on Windows). Read more in
    `fs::path_expand()`.
    !end-bullet!

!end-bullets-61!

## Extending or wrapping usethis

These changes make it easier for others to extend usethis, i.e. to
create workflow packages specific to their organization, or to use
usethis in other packages.

!begin-bullets-62!

-   !begin-bullet!
    `proj_path()` is newly exported. Use it to build paths within the
    active project. Like `proj_get()` and `proj_set()`, it is not aimed
    at end users, but rather for use in extension packages. End users
    should use rprojroot or its simpler companion, here, to
    programmatically detect a project and build paths within it (#415,
    #425).

    !begin-bullets-63!
    -   !begin-bullet!
        `edit_file()`, `write_over()`, and `write_union()` are newly
        exported helpers. They are mostly for internal use, but can also
        be useful in packages that extend or customize usethis (#344,
        #366, #389).
        !end-bullet!

    !end-bullets-63!
    !end-bullet!
-   !begin-bullet!
    `use_template()` no longer errors when a user chooses not to
    overwrite an existing file and simply exits with confirmation that
    the file is unchanged (#348, #350, @boshek).

    !end-bullet!
-   !begin-bullet!
    `getOption("usethis.quiet", default = FALSE)` is consulted when
    printing user-facing messages. Set this option to `TRUE` to suppress
    output, e.g., to use usethis functions quietly in another package.
    For example, use `withr::local_options(list(usethis.quiet = TRUE))`
    in the calling function (#416, #424).

    !end-bullet!

!end-bullets-62!

## New functions

!begin-bullets-64!

-   !begin-bullet!
    `proj_sitrep()` reports current working directory, the active
    usethis project, and the active RStudio Project. Call this function
    if things seem weird and you're not sure what's wrong or how to fix
    it. Designed for interactive use and debugging, not for programmatic
    use (#426).

    !end-bullet!
-   !begin-bullet!
    `use_tibble()` does minimum setup necessary for a package that
    returns or exports a tibble. For example, this guarantees a tibble
    will print as a tibble (#324 @martinjhnhadley).

    !end-bullet!
-   !begin-bullet!
    `use_logo()` resizes and adds a logo to a package (#358,
    @jimhester).

    !end-bullet!
-   !begin-bullet!
    `use_spell_check()` adds a whitelist of words and a unit test to
    spell check package documentation during `R CMD check` (#285
    @jeroen).

    !end-bullet!

!end-bullets-64!

## Other small changes and bug fixes

!begin-bullets-65!

-   !begin-bullet!
    usethis has a new logo! (#429)

    !end-bullet!
-   !begin-bullet!
    `use_course()` reports progress during download (#276, #380).

    !end-bullet!
-   !begin-bullet!
    `use_git()` only makes an initial commit of all files if user gives
    explicit consent (#378).

    !end-bullet!
-   !begin-bullet!
    `create_from_github()`: the `repo` argument is renamed to
    `repo_spec`, since it takes input of the form "OWNER/REPO" (#376).

    !end-bullet!
-   !begin-bullet!
    `use_depsy_badge()` is deprecated. The Depsy project has officially
    concluded and is no longer being maintained (#354).

    !end-bullet!
-   !begin-bullet!
    `use_github()` fails earlier, with a more informative message, in
    the absence of a GitHub personal access token (PAT). Also looks for
    the PAT more proactively in the usual environment variables (i.e.,
    GITHUB_PAT, GITHUB_TOKEN) (#320, #340, @cderv).

    !end-bullet!
-   !begin-bullet!
    The logic for setting DESCRIPTION fields in `create_package()` and
    `use_description()` got a Spring Cleaning. Fields directly specified
    by the user take precedence, then the named list in
    `getOption("usethis.description")` is consulted, and finally
    defaults built into usethis. `use_description_defaults()` is a new
    function that reveals fields found in options and built into
    usethis. Options specific to one DESCRIPTION field,
    e.g. `devtools.desc.license`, are no longer supported. Instead, use
    a single named list for all fields, preferably stored in an option
    named `"usethis.description"` (however,`"devtools.desc"` is still
    consulted for backwards compatibility). (#159, #233, #367)

    !end-bullet!

!end-bullets-65!

## Dependency changes

New Imports: fs, glue, utils

No longer in Imports: backports, httr, rematch2, rmarkdown (moved to
Suggests), styler (moved to Suggests)

# usethis 1.3.0

!begin-bullets-66!

-   !begin-bullet!
    usethis has a website: https://usethis.r-lib.org (#217). It includes
    an article with advice on system setup, for usethis and for R
    development more generally.

    !end-bullet!
-   !begin-bullet!
    `edit_*()` functions now return the target path, invisibly (#255).

    !end-bullet!
-   !begin-bullet!
    `edit_git_ignore(scope = "user")` prefers `~/.gitignore`, but
    detects an existing `~/.gitignore_global`, if it exists. If a new
    global gitignore file is created, it is created as `~/.gitignore`
    and recorded in user's git config as the `core.excludesfile` (#255).

    !end-bullet!
-   !begin-bullet!
    `create_from_github()` gains several arguments and new
    functionality. The `protocol` argument lets user convey whether
    remote URLs should be ssh or https. In the case of "fork and clone",
    the original repo is added as `upstream` remote. It is now possible
    -- although rarely necessary -- to directly specify the GitHub PAT,
    credentials (in git2r form), and GitHub host (#214, #214, #253).

    !end-bullet!
-   !begin-bullet!
    `use_github_labels()` can create or update the colour of arbitrary
    GitHub issue labels, defaulting to a set of labels and colours used
    by the tidyverse packages, which are now exposed via
    `tidy_labels()`. That set now includes the labels "good first issue"
    and "help wanted" (#168, #249).

    !end-bullet!
-   !begin-bullet!
    `appveyor_info()` no longer reverses the repo's URL and image link.
    Corrects the markdown produced by `use_appveyor_badge()` (#240,
    @llrs).

    !end-bullet!
-   !begin-bullet!
    `use_cran_badge()` uses an HTTPS URL for the CRAN badge image (#235,
    @jdblischak).

    !end-bullet!
-   !begin-bullet!
    `create_package()` and `create_project()` return a normalized path,
    even if target directory does not pre-exist (#227, #228).

    !end-bullet!

!end-bullets-66!

## New functions

!begin-bullets-67!

-   !begin-bullet!
    `use_git_config()` can set user's Git name or email, globally or
    locally in a project/repo (#267).

    !end-bullet!
-   !begin-bullet!
    `browse_github_pat()` goes to the webpage where a GitHub user can
    create a personal access token (PAT) for the GitHub API. If the user
    configures a PAT, they can use functions like `create_from_github()`
    and `use_github()` to easily create and connect GitHub repos to
    local projects. (#248, #257, @jeroen, via @jennybc).

    !end-bullet!
-   !begin-bullet!
    `use_version()` increments the version of the active package,
    including an interactive chooser. `use_dev_version()` is now a
    special case wrapper around this. (#188, #223, @EmilHvitfeldt).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_github()` creates a standard set of files that make a
    GitHub repository more navigable for users and contributors: an
    issue template, contributing guidelines, support documentation, and
    a code of conduct. All are now placed in a `.github/` subdirectory
    (#165, @batpigandme).

    !end-bullet!
-   !begin-bullet!
    `use_bioc_badge` creates a Bioconductor badge that links to the
    build report (#271, @LiNk-NY).

    !end-bullet!
-   !begin-bullet!
    `use_binder_badge()` creates a badge indicating the repository can
    be launched in an executable environment via Binder (#242, @uribo).

    !end-bullet!

!end-bullets-67!

# usethis 1.2.0

## New functions

!begin-bullets-68!

-   !begin-bullet!
    `use_course()` downloads a folder's worth of materials from a ZIP
    file, with deliberate choices around the default folder name and
    location. Developed for use at the start of a workshop. Helps
    participants obtain materials from, e.g., a DropBox folder or GitHub
    repo (#196).

    !end-bullet!
-   !begin-bullet!
    `use_blank_slate()` provides a way to opt in to an RStudio workflow
    where the user's workspace is neither saved nor reloaded between R
    sessions. Automated for `scope = "project"`. Provides UI
    instructions for `scope = "user"`, for now (#139).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_style()` styles an entire project according to
    https://style.tidyverse.org (#72, #197 @lorenzwalthert).

    !end-bullet!
-   !begin-bullet!
    GitHub conventions common to tidyverse packages are enacted by
    `use_tidy_contributing()`, `use_tidy_issue_template()`, and
    `use_tidy_support()` (@batpigandme, #143, #166).

    !end-bullet!

!end-bullets-68!

Other changes

!begin-bullets-69!

-   !begin-bullet!
    New projects that don't exhibit other obvious criteria for being a
    "project" will include a sentinel, empty file named `.here`, so they
    can be recognized as a project.

    !end-bullet!
-   !begin-bullet!
    Project launching and switching works on RStudio server (#115,
    #129).

    !end-bullet!
-   !begin-bullet!
    `use_template()` is newly exported, so that other packages can
    provide templating functions using this framework (@ijlyttle #120).

    !end-bullet!
-   !begin-bullet!
    `use_readme_rmd()` and `use_readme_md()` work, in a similar fashion,
    for projects that are and are not a package (#131, #135).

    !end-bullet!
-   !begin-bullet!
    `use_readme_rmd()` once again creates a pre-commit git hook, to help
    keep `README.Rmd` and `README.md` in sync (@PeteHaitch #41).

    !end-bullet!
-   !begin-bullet!
    Substantial increase in unit test coverage.

    !end-bullet!

!end-bullets-69!

# usethis 1.1.0

## New helpers

!begin-bullets-70!

-   !begin-bullet!
    `browse_github()`, `browse_github_issues()`,
    `browse_github_pulls()`, `browse_cran()` and `browse_travis()` open
    useful websites related to the current project or a named package.
    (#96, #103).

    !end-bullet!
-   !begin-bullet!
    `create_from_github()` creates a project from an existing GitHub
    repository, forking if needed (#109).

    !end-bullet!
-   !begin-bullet!
    `use_cc0_license()` applies a CC0 license, particularly appropriate
    for data packages (#94)

    !end-bullet!
-   !begin-bullet!
    `use_lifecycle_badge()` creates a badge describing current stage in
    project lifecycle (#48).

    !end-bullet!
-   !begin-bullet!
    `use_pkgdown()` creates the basics needed for a pkgdown website
    (#88).

    !end-bullet!
-   !begin-bullet!
    `use_r("foo")` creates and edit `R/foo.R` file. If you have a test
    file open, `use_r()` will open the corresponding `.R` file (#105).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_versions()` sets minimum version requirement for all
    dependencies.

    !end-bullet!

!end-bullets-70!

## Bug fixes and improvements

!begin-bullets-71!

-   !begin-bullet!
    `use_dev_version()` now correctly updates the `Version` field in a
    package description file. (@tjmahr, #104)

    !end-bullet!
-   !begin-bullet!
    `use_revdep()` now also git-ignores the SQLite database (#107).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_eval()` has been tweaked to reflect current guidance
    (#106)

    !end-bullet!

!end-bullets-71!

# usethis 1.0.0

This is a new package that extracts out many functions that previously
lived in devtools, as well as providing more building blocks so you can
create your own helpers. As well as the many new helpers listed below,
there are three main improvements to the package:

!begin-bullets-72!

-   !begin-bullet!
    More support for general R projects, other than packages.
    !end-bullet!
-   !begin-bullet!
    A notion of an "active" project that all commands operate on.
    !end-bullet!
-   !begin-bullet!
    Refined output.
    !end-bullet!

!end-bullets-72!

usethis is gradually evolving towards supporting more general R
"projects", not just packages. This is still a work in progress, so
please let me know if you use a function that you think should work with
projects but doesn't. You can also try out the new `create_project()`
which creates a basic RStudio project.

The concept of the working directory and the "base path" have been
refined. Rather than using an argument to specify the active project,
all `use_` functions now use a global active project setting, as
returned by `proj_get()`. This is cached throughout a session, although
it will be updated by `create_package()` and `create_project()`. You'll
now get an clear error if you attempt to `use_something()` outside of a
project, and `create_something()` will warn if you're trying to create
inside an existing project.

The output from all usethis commands has been reviewed to be informative
but not overwhelming. usethis takes advantage of colour (using crayon
and RStudio 1.1) to help chunk the output and clearly differentiate what
you need to do vs. what has been done for you.

## New functions

!begin-bullets-73!

-   !begin-bullet!
    `use_apl2_license()` if you want to use the Apache 2.0 license.

    !end-bullet!
-   !begin-bullet!
    `use_depsy_badge()` allows including a Depsy badge (@gvegayon, #68).

    !end-bullet!
-   !begin-bullet!
    `use_dev_package()` works like `use_package()` but also adds the
    repo to the `Remotes` field (#32).

    !end-bullet!
-   !begin-bullet!
    `use_github_labels()` will automatically set up a standard set of
    labels, optionally removing the default labels (#1).

    !end-bullet!
-   !begin-bullet!
    `use_pipe()` creates a template to use magrittr's `%>%` in your
    package (#15).

    !end-bullet!
-   !begin-bullet!
    `use_tidy_ci()` which sets up travis and codecov using the tidyverse
    conventions (#14)

    !end-bullet!
-   !begin-bullet!
    `use_tidy_description()` puts description fields in a standard order
    and alphabetises dependencies.

    !end-bullet!
-   !begin-bullet!
    `use_tidy_eval()` imports and re-exports the recommend set of tidy
    eval helpers if your package uses tidy eval (#46).

    !end-bullet!
-   !begin-bullet!
    `use_usethis()` opens your `.Rprofile` and gives you the code to
    copy and paste in.

    !end-bullet!

!end-bullets-73!

## New edit functions

A new class of functions make it easy to edit common config files:

!begin-bullets-74!

-   !begin-bullet!
    `edit_r_profile_user()` opens `.Rprofile`
    !end-bullet!
-   !begin-bullet!
    `edit_r_environ_user()` opens `.Renviron`
    !end-bullet!
-   !begin-bullet!
    `edit_r_makevars_user()` opens `.R/Makevars`
    !end-bullet!
-   !begin-bullet!
    `edit_git_config_user()` opens `.gitconfig`
    !end-bullet!
-   !begin-bullet!
    `edit_git_ignore_user()` opens `.gitignore`
    !end-bullet!
-   !begin-bullet!
    `edit_rstudio_snippets(type)` opens `~/R/snippets/{type}.snippets`
    !end-bullet!

!end-bullets-74!

## Updates

!begin-bullets-75!

-   !begin-bullet!
    `use_coverage("codecov")` now sets a default threshold of 1% to try
    and reduce false positives (#8).

    !end-bullet!
-   !begin-bullet!
    `use_description()` now sets `ByteCompile: true` so you can benefit
    from the byte compiler (#29)

    !end-bullet!
-   !begin-bullet!
    The license functions (`use_mit_license()`, `use_apl2_license()`,
    and `use_gpl3_license()`) save a copy of the standard license text
    in `LICENSE.md`, which is then added to `.Rbuildignore`. This allows
    you to follow standard licensing best practices while adhering to
    CRANs requirements (#10).

    !end-bullet!
-   !begin-bullet!
    `use_package_doc()` uses more a modern roxygen2 template that
    requires less duplication.

    !end-bullet!
-   !begin-bullet!
    `use_test()` will use the name of the currently open file in RStudio
    if you don't supply an explicit name (#89).

    !end-bullet!
-   !begin-bullet!
    `use_readme_rmd()` now puts images in `man/figures/` and no longer
    adds to `.Rbuildgnore`. This ensures that the rendered `README.md`
    will also work on CRAN (#16, #19). The first chunk now uses
    `include = FALSE` and is named setup (#19).

    !end-bullet!
-   !begin-bullet!
    `use_revdep()` creates structure for use with revdepcheck package,
    the preferred way to run revdepchecks. (#33)

    !end-bullet!

!end-bullets-75!

## Building blocks

!begin-bullets-76!

-   !begin-bullet!
    New `use_badge()` for adding any badge to a README. Now only prints
    a todo message if the badge does not already exist.

    !end-bullet!
-   !begin-bullet!
    `use_directory()` is now exported (#27).

    !end-bullet!

!end-bullets-76!

## Bug fixes and minor improvements

!begin-bullets-77!

-   !begin-bullet!
    Functions which require code to be copied now automatically put the
    code on the clipboard if it is available (#52).

    !end-bullet!
-   !begin-bullet!
    `create_package()` no longer creates a dependency on the current
    version of

    R.  

    !end-bullet!
-   !begin-bullet!
    `use_build_ignore()` now strips trailing `/`

    !end-bullet!
-   !begin-bullet!
    `use_git()` will restart RStudio if needed (and possible) (#42).

    !end-bullet!
-   !begin-bullet!
    `use_github()` now has an organisation parameter so you can create
    repos in organisations (#4).

    !end-bullet!
-   !begin-bullet!
    `use_template()` and `use_test()` now convert title to a slug that
    only contains lowercase letters, numbers, and `-`.

    !end-bullet!
-   !begin-bullet!
    `use_vignette()` now adds `*.html` and `*.R` to your `.gitgnore` so
    you don't accidentally add in compiled vignette products (#35).

    !end-bullet!
-   !begin-bullet!
    `use_travis_badge()` and `use_appveyor_badge()` are now exported
    functions, so they can be used even if ci was separately set up
    (#765, @smwindecker).

    !end-bullet!

!end-bullets-77!

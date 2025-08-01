# usethis (development version)

## Formatting

* `use_air()` is a new function to configure a project to use
  [Air](https://posit-dev.github.io/air/), an extremely fast R code formatter.

* `use_tidy_style()` is deprecated, in favor of using Air for any new, explicit
  formatting efforts (#2110).

## Project-hood

* usethis's criteria for recognizing a project (listed in `?proj_utils`) have
  expanded to include (#2133):
  - a `.vscode/settings.json` file, which Positron or VS Code might create
  - a `_quarto.yml` file, typical of a Quarto project
  - an `renv.lock` file, which renv creates

* `use_course()` and `use_zip()` open the new folder in a new session of the
  current IDE (RStudio or Positron) in more situations and add a `.here` file if
  the folder doesn't already fulfill any of usethis's criteria for a project
  root folder (#2127).

* `create_quarto_project()` is a new experimental function that combines basic
  usage of `quarto::quarto_create_project()` with some of the niceties of
  usethis's `create_*()` functions, such as opening the newly created project in
  your IDE (#1891, @focardozom).

## Other

* `use_package(min_version = FALSE)` is treated the same as when `min_version`
  is not specified (#2117, @salim-b).

* `use_r_universe_badge()` is a new function that creates a README badge
  indicating your package is available on [R-universe](https://r-universe.dev)
  and reporting the latest version (@olivroy, #1883).

* Some GitHub functionality should now work for GitHub Enterprise Cloud (as
  opposed to GitHub Enterprise Server). Specifically an HTTPS URL such as
  `"https://my-cool-org.ghe.com"` should now be recognized as "looks like
  GitHub" (#2098, @jameslairdsmith).

* Several deprecated functions have been removed:
  - `use_rscloud_badge()`, deprecated in v2.2.0; use `use_posit_cloud_badge()`
    instead
  - `git_branch_default()`, deprecated in v2.1.0; use `git_default_branch()`
    instead
  - `use_tidy_eval()`, deprecated in v2.2.0; no longer necessary
  - `use_github_actions()` and `use_github_action_check_release()`, deprecated
    in v.2.2.0; use `use_github_action('check-release')` instead
  - `use_github_action_check_standard()`, deprecated in v2.2.0; use
    `use_github_action('check-standard')` instead
  - `use_github_action_pr_commands()`, deprecated in v2.2.0
  - `use_github_action_check_full()`, deprecated in v2.1.0

# usethis 3.1.0

* `use_vignette()` and `use_article()` support Quarto. The `name` of the new
  vignette or article can optionally include a file extension to signal whether
  `.Rmd` or `.qmd` is desired, with `.Rmd` remaining the default for now. Thanks
  to @olivroy for getting the ball rolling (#1997).

* `use_data()` defaults to serialization version 3 (@laurabrianna, #2044).

* `use_package()` can lower a minimum version requirement
  (@jplecavalier, #1957).

* `use_release_issue()` only suggests doing reverse dependency checks if there
  are, in fact, reverse dependencies (#1817, @seankross).

* `use_tidy_upkeep_issue()` records the year it is being run in the
  `Config/usethis/upkeep` field in DESCRIPTION. If this value exists, it is
  used to filter the checklist when making the issue.

# usethis 3.0.0

## Transition to cli package for UI

* The `ui_*()` functions have been marked as
  [superseded](https://lifecycle.r-lib.org/articles/stages.html#superseded).
  External users of these functions are encouraged to use the
  [cli package](https://cli.r-lib.org/) instead.
  The cli package did not have the required functionality when the
  `usethis::ui_*()` functions were first created, but it does now and it's the
  superior option.
  There is a cli vignette about how to make this transition:
  `vignette("usethis-ui", package = "cli")`.
  usethis no longer uses the `ui_*()` functions internally, in favor of new
  cli-based helpers that are not exported.

## Deprecated function and argument removal

We are removing functions and arguments that were deprecated as of usethis
v2.0.0, which was released in December 2020.

These changes have been in place for a long time now:

* Switch from git2r to gert (+ credentials).
* Use of git config and the gh package to infer, e.g., the target repo spec.
* Pivot towards GitHub Actions and away from Travis and AppVeyor.

Functions that are removed and, where applicable, what to use instead:

* `git_credentials()`
* `use_git_credentials()`
* `browse_github_token()` (do `create_github_token()`)
* `browse_github_pat()` (do `create_github_token()`)
* `github_token()` (do `gh_token_help()` or `gh::gh_token()`)
* `pr_pull_upstream()` (do `pr_merge_main()`)
* `pr_sync()` (do `pr_merge_main(); pr_push()`)
* `use_appveyor()`
* `use_appveyor_badge()`
* `use_travis()`
* `use_travis_badge()`
* `browse_travis()`
* `use_pkgdown_travis()`
* `use_tidy_ci()` *deprecated in v2.1.0* (do `use_tidy_github_actions()`)
* `use_tidy_labels()` *deprecated in v2.1.0* (do `use_tidy_github_labels()`)

Function arguments that are removed:

* `create_from_github(auth_token =, credentials =)`
* `use_github(auth_token =, credentials =)`
* `use_github_labels(repo_spec =, host =, auth_token =)`
* `use_github_links(auth_token =, host =)`
* `use_github_release(host =, auth_token =)`

## Other changes

* `use_zip()` and `use_course()` are equipped to handle a ZIP where the parent
  folder is implicit (@burnsal, #1961).

* `use_test_helper()` is a new function to create a test helper file
  (@olivroy, #1822).

* `use_cpp11()` makes it easier to update `NAMESPACE` (@pachadotdev, #1921).

* `pr_merge_main()` now offers the choice to not open the files with merge
  conflicts (@olivroy, #1720).

* `edit_rstudio_snippets()` now accepts yaml snippets (@olivroy, #1941).

* `use_standalone()` inserts an improved header that includes the code needed to
  update the standalone file (@krlmlr, #1903).

* `use_release_issue()` and `use_upkeep_issue()` behave better when the user has
  a fork. The user is asked just once to choose between `origin` and `upstream`
  as the target repo (#2023).

* The README templates now recommend [pak](https://pak.r-lib.org) instead of
  devtools for package installation (@olivroy, #1723).

* `use_github()` now knows that you can reuse the name of an earlier repo that
  has since been renamed (@ateucher, #1893).

* `use_git()` no longer asks if you want to restart RStudio when using Positron.

* `use_test()` and `use_r()` now work when you are in
  `tests/testthat/_snaps/{foo}.md` (@olivroy, #1988).

* The URLs baked into the badge generated by `use_coverage(type = "codecov")`
  are updated and no longer specify a branch(#2008).

* `usethis::use_version()` now tolerates empty lines preceding the
  first section title in the package NEWS file. (#1976)

# usethis 2.2.3

* Patch release with changes to `.Rd` files requested by CRAN.

# usethis 2.2.2

* Implicit usage of `numeric_version()` via comparison now always provides
  character input. This is in response to a request from CRAN to anticipate
  future solutions to <https://bugs.r-project.org/show_bug.cgi?id=18548>.

# usethis 2.2.1

* Internal helper `cran_version()`, used in functions such as
  `use_release_checklist()` and `use_news_md()`, is more resilient to situations
  where no CRAN mirror has been set (#1857).

* Internal usage of `numeric_version()` now always provides character input,
  rather than relying on implicit `as.character()` coercion. This is in response
  to a request from CRAN to anticipate future solutions to
  <https://bugs.r-project.org/show_bug.cgi?id=18548> (#1869).

# usethis 2.2.0

## New functions

* `use_author()` is a new function to introduce a new person into the
  `Authors@R` field of DESCRIPTION (@avalcarcel9, #833).

* `use_rstudio_preferences()` lets you set RStudio preferences programmatically
  (#1518)

* `use_standalone()` is a new function that makes it easier to use standalone
  files provided by various low-level tidyverse packages, like rlang (#1654).

* `use_upkeep_issue()` is a new function to facilitate regular maintenance of
  your package. Similar to `use_release_issue()`, it opens an issue in your repo
  with a checklist of maintenance tasks. It will include additional bullets
  if your package includes an `upkeep_bullets()` function that returns a
  character vector (#1794).

## Package development

* Although nested projects are discouraged, they can be useful in development
  contexts. `create_package()` now sets the correct package name and returns
  the correct package path for a package nested inside a project (#1647).

* `use_article()` no longer adds the rmarkdown package to `Suggests`. Instead,
  if rmarkdown is not already a dependency, it's added to
  `Config/Needs/website`. This means that a package that only uses articles
  (vs. vignettes) won't gain an unnecessary dependency on rmarkdown (#1700).

* `use_data()` now sets the appropriate minimal R version in `DESCRIPTION`,
  depending on which serialization format `version` you choose (@dpprdan, #1672).

* `use_github_links()` by default now appends the GitHub url to existing urls in
  in the `URL` field of DESCRIPTION, rather than replacing existing urls (#1805).

* `use_latest_dependencies()` no longer affects `Suggests` since those
  dependencies are not enforced (#1749).

* `use_news_md()` now places "(development version)" in the header of `NEWS.md`
   if there is a development version number in `DESCRIPTION`. It also sets the
   first bullet to "Initial CRAN submission" when it looks like a "new" package
   (#1708).

* `use_coverage()` no longer adds covr to `Suggests`, since the `test-coverage`
  GitHub Actions workflow takes care of installing covr (@Bisaloo, #1851).

## Package release

* `use_release_issue()` will now remind you to run `use_github_links()` if
  necessary (@Bisaloo, #1754)

* `use_release_issue()` now encourages the creation of `NEWS.md` prior to
  submission, instead of after (#1755).

* `use_github_release()` now automatically pushes to GitHub (if safe) and
  automatically publishes the release, rather than requiring you to edit and
  publish the draft (#1385).

* `use_github_release()` no longer fails in the absence of `NEWS.md` (#1755).

* `use_release_issue()` will now remind you to check/close the milestone
  corresponding to the release, if it exists (#1642).

* `use_version()` and `use_dev_version()` gain a `push` argument to optionally
  push the result after committing. This is used to eliminate a manual step from
  the `use_release_issue()` checklist (#1385).

* `use_revdep()` no longer places an email template, because these days we are
  more likely to communicate with other maintainers about breaking changes via
  GitHub issues and pull requests (#1769).

## Package file management

* `rename_files()` now also affects files in `src/` (#1585).

* `use_r()` and `use_test()` now work with all active files in `R/`, `src/`,
  and `tests/testthat/` (#1566).

* `use_r()` and `use_test()` now work with files containing `.` (#1690).

* `use_rcpp()`, `use_c()` and friends now work the same way as `use_r()` and
  `use_test()`: they'll take the default file name from the file you currently
  have open in RStudio (#1730).

## Git and GitHub

* `create_from_github()` will now use an existing `.Rproj` file if it exists
  anywhere in the repo, not just the root directory. This is useful if you're
  working with repos that contain tools for multiple languages (#1680).

* `git_sitrep()` gains two arguments: `tool` and `scope`, which enables
  you to limit the report to, for example, `tool = "git"` or `scope = "user"`.
  The default remains to provide a full report. Also, provides more
  feedback if git user's information is not set, and checks global git-email
  against user-level GitHub PAT (@ijlyttle, #1732, #1714, #1706).

* `git_vaccinated()` now treats a path configured as `core.excludesFile` like
  other user-supplied paths; in particular, any use of the `~/` home directory
  shortcut is expanded via
  [`fs::path_expand()`](https://fs.r-lib.org/reference/path_expand.html)
  (@dpprdan, #1560).

* `use_github_action()` now suggests possible actions when called without
  arguments (#1724).

* `use_github_actions()`, `use_github_action_check_standard()`,
  `use_github_action_check_release()`, and `use_github_action_pr_commands()`
  have been deprecated in favour of the new interactive powers of
  `use_github_action()` (#1724).

## Minor improvements and fixes

* Links to the R Packages book have been updated to the second edition of
  the book (#1689).

* The SVG badges placed by `use_lifecycle()` have improved accessibility
  features, i.e. they advertise the lifecycle stage via the `aria-label`
  attribute (#1554, https://github.com/r-lib/lifecycle/issues/117).

* `use_rscloud_badge()` has been deprecated in favour of
  `use_posit_cloud_badge()`, and both functions now accept the updated url
  format of Posit Cloud projects (#1670).

* `use_rstudio()` gains a `reformat` argument which omits `.Rproj` settings
  that enforce file formatting conventions, e.g. around whitespace.
  `create_from_github()` uses this option when it introduces an `.Rproj` to a
  project that lacks one, making it easier to follow the project's existing
  conventions (#1679).

* `write_over()` and `use_github_file()` gain an overwrite argument (#1748).

## Tidyverse-related

* `use_release_issue()` now uses internal `release_extra_revdeps()` to
  add extra revdep sources. Currently only use for internal Posit tooling,
  but we hope to extend to all users in the future (#1610).

* `use_tidy_logo()` is a new function that calls `use_logo()` on the appropriate
  hex sticker PNG file at <https://github.com/rstudio/hex-stickers> (#1871).

## Deprecated functions

* `use_tidy_eval()` is now deprecated because it imports and re-exports a large
  number of functions that are no longer needed in order to do tidy
  evaluation (#1656).

* `use_travis()`, `use_pkgdown_travis()`, `browse_travis()`, and `use_appveyor()`
  are now deprecated because we no longer recommend Travis or Appveyor. We
  recommend GitHub actions instead (#1517).

# usethis 2.1.6

### GitHub-related

* `use_github_action()` and friends gain a `ref` argument, which defaults to
  the tag of the latest release in <https://github.com/r-lib/actions> (#1541).

* `use_github_actions_badge()` now uses the same URLs as GitHub does via the
  "Create status badge" helper in the browser (#1525). This changes the
  significance of the `name` argument; now it really must be the name of the
  workflow configuration file.

* All functions error more clearly when the requested operation is not
  supported for the "theirs" remote configuration (#1588).

### Other changes

* `use_roxygen_md()` gains an `overwrite` argument (#1599).

* `use_rscloud_badge()` is a new function that creates a README badge
  indicating the repository can be launched in an
  [RStudio Cloud](https://rstudio.cloud) project (@gvelasq, #1584).

* `use_data()` gains an `ascii` argument, which is passed along to `save()`
  (@JosiahParry, #1625).

* `use_code_of_conduct()` has been updated to version 2.1 of the Contributor
  Covenant (@batpigandme, #1591).

# usethis 2.1.5

* pkgdown-related functions no longer automatically strip a trailing slash from
  the pkgdown site URL, in order to play more nicely with CRAN's URL checks
  (#1526).

* `edit_pkgdown_config()` is a new function that opens the pkgdown YAML
  configuration file for the current Project, if such a file exists.

* The error thrown when reporting an unsupported GitHub configuration has been
  fixed for forward compatibility with a future version of rlang, i.e. what is
  anticipated to be rlang v1.0.0.

* Version 2.1.4 was never released. Version was advanced from 2.1.4 to 2.1.5
  strictly for CRAN (re-)submission purposes.

# usethis 2.1.3

* Modified a test to ensure that intermittent GitHub rate limiting does not
  lead to ungraceful failure on CRAN.

# usethis 2.1.2

* `git_default_branch_rename()` no longer errors on repos where README exists,
  but has no badge block.

* `git_default_branch_rediscover()` prunes the defunct remote ref to the old
  default branch, e.g. `origin/master`.

* Version 2.1.1 was never released. Version was advanced from 2.1.1 to 2.1.2
  strictly for CRAN (re-)submission purposes.

# usethis 2.1.0

## Git default branch support

usethis has a more sophisticated understanding of the default branch and gains several functions to support default branch renaming.

* `git_branch_default()` has been renamed to `git_default_branch()`, to place
  it logically in the new family of functions. The old name still works, but
  that won't be true forever.
* `git_default_branch()` is much more diligent about figuring out the default
  branch. Instead of only consulting the local repo, now we integrate local info
  with the default branch reported by the `upstream` or `origin` remote, if
  applicable.
  - This is intended to surface the case where a project has renamed its default
    branch and the local repo needs sync up with that.
* `git_default_branch_rediscover()` is a new function that helps contributors
  update their local repo (and personal fork, if applicable) when a project/repo
  renames its default branch.
* `git_default_branch_rename()` is a new function that helps a repo owner
  rename the default branch (both on GitHub and locally).
* `git_default_branch_configure()` is a new function to set the new Git
  configuration option `init.defaultBranch`, which controls the name of the
  initial branch of new local repos.
* `git_sitrep()` exposes `init.defaultBranch` and surfaces the more
  sophisticated analysis of `git_default_branch()`.

## Other GitHub-related changes

* `git_sitrep()` and `gh_token_help()` try even harder to help people get on the
  happy path with respect to their GitHub PAT (#1400, #1413, #1488, #1489,
  #1497).

* The minimum version of gh has been bumped to help / force more people to
  upgrade to the gh version that supports current GitHub PAT formats
  (@ijlyttle, #1454).

* `use_github_file()` is a new function related to `use_template()`. Instead of
  starting from a local file, `use_github_file()` grabs the contents of an
  arbitrary file on GitHub that the user has permission to read. It supports
  targeting a specific branch, tag, or commit and can follow a symlink (#1407).
  `use_github_file()` now powers `use_github_action()` and friends.

* `use_github_release()` is much more diligent about using any information left
  behind by `devtools::submit_cran()` or `devtools::release()`. Specifically,
  this applies to determining which SHA is to be tagged in the release. And this
  SHA, in turn, determines the consulted versions of DESCRIPTION (for package
  version) and NEWS.md (for release notes) (#1380).

* `use_release_issue()` also takes bullets from `release_questions()`,
  for compatibility with `devtools::release()`.

* `git_vaccinate()`, `edit_git_ignore()`, and `git_sitrep()` are more careful to
  consult, reveal, and set the `core.excludesFile` setting in user's Git
  configuration (#1461).

* `use_github_action_check_full()` has been removed. It's overkill for the
  majority of R packages, which are better off with `use_github_actions()` or
  `use_github_action_check_standard()` (#1490).

* `use_github_pages()` and `use_pkgdown_github_pages()` use a new method for
  creating an empty, orphan `gh-pages` branch. This is necessary due to new
  GitHub behaviour, where it has become essentially impossible to refer to the
  empty tree (#1472).

* `use_github()` can create repositories with `"internal"` visibility, a feature
  that exists within GitHub Enterprise products (#1505).

## Package development

* `use_readme_rmd()` and `use_readme_md()` no longer include CRAN installation
  instructions in the initial template; instead, we only include GitHub-based
  install instructions or otherwise prompt the user to update instructions
  (#1507).

* `use_import_from()` is a new function that puts `@importFrom pkg fun`
  directives into a package in a consistent location (@malcolmbarrett, #1377).

* `DESCRIPTION` files generated by usethis no longer include `LazyData` by
   default, as per new CRAN checks; instead, `LazyData` is now added the first
   time you use `use_data()` (@malcolmbarrett, #1404).

* `use_tidy_eval()` has been updated to reflect current recommendations for
  using (and therefore exposing) tidy eval in other packages (@lionel-, #1445).

* `use_pkgdown()` automatically uses Bootstrap 5 if the pkgdown version supports
  it (anticipated for pkgdown 2.0.0).

* `use_lifecycle()` now imports `lifecycle::deprecated()` (#1419).

* `use_code_of_conduct()` now requires a `contact` argument to supply contact
  details for reporting CoC violations (#1269).

* `use_package()` no longer guides the user on how to use a dependency when no
  change was made (@malcolmbarrett, #1384).

### Aimed at the tidyverse team

These functions are exported for anyone to use, but are aimed primarily at the maintainers of tidyverse, r-lib, and tidymodels packages.

* `use_tidy_dependencies()` is a new function that sets up standard dependencies
  used by all tidyverse packages, except those that are designed to be
  dependency free (#1423).

* `use_tidy_upkeep_issue()` is a new function similar to `use_release_issue()`
  that creates a checklist-style issue to prompt various updates (#1416).

* `use_tidy_release_test_env()` has been deleted since we no longer recommend
  including test environments in `cran-comments.md`. There's no evidence that
  CRAN finds it useful, and it's annoying to keep up-to-date  (#1365).

* `use_tidy_github_labels()` is the new name for `use_tidy_labels()` (#1430).

* `use_tidy_github_actions()` takes over for `use_tidy_ci()`, which is now
  deprecated.

## User-level configuration

* `"usethis.overwrite"` is a new option. When set to `TRUE`, usethis overwrites
  an existing file without asking for user confirmation if the file is inside
  a Git repo. The normal Git workflow makes it easy to see and selectively
  accept/discard any proposed changes. This behaviour is strictly opt-in
  (#1424).

* Functions that provide code to load packages in your `.Rprofile` now use
  `rlang::check_installed()` to make sure the package is installed locally
  (@malcolmbarrett, #1398).

* `edit_rstudio_prefs()` and `edit_rstudio_snippets()` should work now on
  case-sensitive OSes, due to a path fix re: the location of RStudio's config
  files (@charliejhadley, #1420).

# usethis 2.0.1

* All functions that require a package now ask you if you'd like to install it.

* Added `edit_template()` for opening and creating files in `inst/templates`
  (for use with `use_template()`) (@malcolmbarrett, #1319).

* `use_article()` now creates the file in the `vignettes/articles/` (#548).

* `use_lifecycle()` has been updated for changes in our lifecycle workflow
  (#1323).

* `use_tidy_pkgdown()` has been renamed to `use_pkgdown_github_pages()` since
  the function is useful for anyone who wants to automatically publish to GitHub
  pages, not just the tidyverse team (#1308).

* `use_release_issue()` includes a bunch of minor improvements. Most
  importantly, for initial CRAN release we now include a number of common
  things that CRAN checks for that aren't in `R CMD check`.

* `use_readme_rmd()`, `use_readme_md()`, `use_tidy_contributing()`, and
  `use_tidy_support()` use updated logic for determining the `OWNER/REPO` spec
  of the target repo (#1312).

# usethis 2.0.0

## Adoption of gert and changes to Git/GitHub credential handling

Usethis has various functions that help with Git-related tasks, which break down into two categories:

1. Git tasks, such as clone, push, and pull. These are things you could do with
   command line Git.
1. GitHub tasks, such as fork, release, and open an issue or pull request. These
   are things you could do in the browser or with the GitHub API.

We've switched from git2r to the gert package for Git operations (<https://docs.ropensci.org/gert/>). We continue to use the gh package for GitHub API work (<https://gh.r-lib.org>).

The big news in this area is that these lower-level dependencies are getting better at finding Git credentials, finding the same credentials as command line Git (and, therefore, the same as RStudio), and finding the same credentials as each other. This allows usethis to shed some of the workarounds we have needed in the past, to serve as a remedial "credential valet".

Under the hood, both gert and gh are now consulting your local Git credential store, when they need credentials. At the time of writing, they are using two different even-lower-level packages to do this:

* gert uses the credentials package (<https://docs.ropensci.org/credentials/>)
* gh uses the gitcreds package (<https://gitcreds.r-lib.org/>)

Even now, gert and gh should discover the same credentials, at least for github.com. In the future, these two packages may merge into one.

Git/GitHub credential management is covered in a new article:
[Managing Git(Hub) Credentials](https://usethis.r-lib.org/articles/articles/git-credentials.html)

The main user-facing changes in usethis are:

* usethis should discover and use the same credentials as command line Git.
* usethis should be able to work with any GitHub deployment. While github.com is the default, GitHub Enterprise deployments are fully supported. The target GitHub host is determined from the current project's configured GitHub remotes, whenever possible.

As a result, several functions are deprecated and several other functions have some deprecated arguments.

* Deprecated functions:
  - `use_git_credentials()`
  - `git_credentials()`
  - `github_token()`
* Functions with (deprecated arguments):
  - `create_from_github()` (`auth_token`, `credentials`)
  - `use_github()` (`auth_token`, `credentials`)
  - `use_github_links()` (`host`, `auth_token`)
  - `use_github_labels()` (`repo_spec`, `host`, `auth_token`)
  - `use_tidy_labels()` (`repo_spec`, `host`, `auth_token`)
  - `use_github_release()` (`host`, `auth_token`)

The switch to gert + credentials should eliminate most credential-finding fiascos. Gert also takes a different approach to wrapping libgit2, the underlying C library that does Git operations. The result is more consistent support for SSH and TLS, across all operating systems, without requiring special effort at install time. More users should enjoy Git remote operations that "just work", for both SSH and HTTPS remotes. There should be fewer "unsupported protocol" errors.

## GitHub remote configuration

Usethis gains a more formal framework for characterizing a GitHub remote configuration. We look at:

  * Which GitHub repositories `origin` and `upstream` point to
  * Whether you can push to them
  * How they relate to each other, e.g. fork-parent relationship

This is an internal matter, but users will notice that usethis is more clear about which configurations are supported by various functions and which are not. The most common configurations are reviewed in a [section of Happy Git](https://happygitwithr.com/common-remote-setups.html).

When working in a fork, there is sometimes a question whether to target the fork or its parent repository. For example, `use_github_links()` adds GitHub links to the URL and BugReports fields of DESCRIPTION. If someone calls `use_github_links()` when working in a fork, they probably want those links to refer to the *parent* or *source* repo, not to their fork, because the user is probably preparing a pull request. Usethis should now have better default behaviour in these situations and, in some cases, will present an interactive choice.

## Default branch

There is increasing interest in making the name of a repo's default branch configurable. Specifically, `main` is emerging as a popular alternative to `master`. Usethis now discovers the current repo's default branch and uses that everywhere that, previously, we had hard-wired `master`.

`git_branch_default()` is a newly exported function that is also what's used internally.

`use_course()`, `use_zip()`, and `create_download_url()` all have some support for forming the URL to download a `.zip` archive of a repo, based on a repo specification (e.g. `OWNER/REPO`) or a browser URL. These helpers now form a URL that targets `HEAD` of the repo, i.e. the default branch.

## Changes to Git/GitHub functionality

The default Git protocol is now "https" and we no longer provide an interactive choice, by default, in interactive sessions. As always, a user can express a preference for "ssh" in individual function calls, for an R session via `use_git_protocol()`, and for all R sessions via the `usethis.protocol` option (#1262).

`pr_resume()` is a new function for resuming work on an existing local PR branch. It can be called argument-less, to select a branch interactively.

`pr_fetch()` can also be called with no arguments, to select a PR interactively.
The `owner` argument is replaced by `target`, with a choice of the source (default) or primary repo.

`pr_forget()` is a new function for abandoning a PR you initiated locally or fetched from GitHub. It only does local clean up and, for example, doesn't delete a remote branch or close a PR (#1263).

`pr_view()` can now be called with no arguments. If the current branch is associated with an open PR, we target that and, otherwise, we offer an interactive selection.

`pr_finish()` deletes the remote PR branch if the PR has been merged and the current user has the power to do so, i.e. an external contributor deleting their own branch or a maintainer deleting a branch associated with an internal PR (#1150). It no longer errors if the PR branch has already been deleted (#1196).

`pr_pull_upstream()` is renamed to `pr_merge_main()` to emphasize that it merges the **main** line of development into the current branch, where the main line of development is taken to mean the default branch, as reported by `git_branch_default()`, of the source repo, which could be either `upstream` or `origin`, depending on the situation.

`create_from_github()` will only create a read-only clone, due to lack of a GitHub personal access token, if explicitly directed to do so via `fork = FALSE`.

`create_from_github()` and `use_tidy_thanks()` accept browser and Git URLs as the `repo_spec` argument, to be friendlier to copy/paste. When a URL is passed, the `host` is also extracted from it.

`create_github_token()` is a new name for the function previously known as `browse_github_token()` and `browse_github_pat()`.

`issue_close_community()` and `issue_reprex_needed()` are two new functions for maintainers who process lots of GitHub issues. They automate canned replies and actions, e.g. labelling or closing (#940).

GitHub Actions is the preferred platform for continuous integration, because that is what the tidyverse team currently uses and maintains. Functions related to Travis-CI and AppVeyor are soft-deprecated to raise awareness about this change and to make it clear that, if substantial maintenance becomes necessary, we may elect to retire the function (#1169).

`browse_github_actions()` is a new function to open the Actions page of the respective repo on GitHub, similar to existing `browse_*()` functions (@pat-s, #1102).

`use_github_pages()` is a new function to activate or reconfigure the GitHub Pages site associated with a repository (#224).

`use_tidy_pkgdown()` implements the complete pkgdown configuration used by the tidyverse team (#224).

`pr_sync()` is deprecated and can be replicated by calling `pr_pull()`, `pr_merge_main()`, then `pr_push()`.

## Licensing improvements

All `use_*_license()` functions now work for projects, not just packages.

`use_apl2_license()` (not `use_apache_license()`) and `use_gpl3_license()` no longer modify the license text (#1198).

`use_mit_license()` now sets the default copyright holder to "{package} authors". This makes it more clear that the copyright holders are the contributors to the package; unless you are using a CLA there is no one copyright holder of a package (#1207).

New `use_gpl_license()` and  `use_agpl_license()` make it easier to pick specific versions of the GPL and AGPL licenses, and to choose whether or not you include future versions of the license. Both default to version 3 (and above).

New `use_proprietary_license()` allows your package to pass R CMD check while making it clear that your code is not open source (#1163). Thanks to @atheriel for the blog post suggesting the wording: https://unconj.ca/blog/copyright-in-closed-source-r-packages-the-right-way.html

`use_lgpl_license()` now uses version 3 (and above), and gains new `version` and `include_future` argument to control which version is used.

`use_gpl3_license()`, `use_agpl3_license()` and `use_apl2_license()` have been deprecated in favour of the new `version` argument to `use_gpl_license()`, `use_agpl_license()` and `use_apache_license()`.

The `name` argument to `use_mit_license()` has been changed to `copyright_holder` to make the purpose more clear. The `name` argument has been removed from all other license functions because it is not needed; no other license makes an assertion about who the copyright holder is.

## RStudio preferences

usethis is now fully cognizant of the [changes to RStudio preferences](https://posit.co/blog/rstudio-1-3-preview-configuration/) in RStudio 1.3:

`edit_rstudio_snippets()` looks in the new location, and if you have snippets in the old location, will automatically copy them to the new location (#1204)

New `edit_rstudio_prefs()` opens RStudio preferences file for editing (#1148).

`use_blank_slate()` can now configure your global, i.e. user-level, RStudio preference, in addition to project-level (#1018).

## Other changes

`browse_package()` and `browse_project()` are new functions that let the user choose from a list of URLs derived from local Git remotes and DESCRIPTION (local or possibly on CRAN) (#1113).

The legacy `"devtools.desc"` option is no longer consulted when populating a new DESCRIPTION file. You must use the `"usethis.description"` now (#1069).

`use_dev_package()` gains a `remote` parameter to allow you to specify the remote. The existing behaviour, which adds an `OWNER/REPO` GitHub remote, remains the default (#918, @ijlyttle).

`use_cpp11()` is a new function to set up an R package to use cpp11.

`create_package(roxygen = FALSE)` once again writes a valid NAMESPACE file (and also has no Roxygen* fields in DESCRIPTION) (#1120).

`create_package()`, `create_project()`, `create_from_github()`, and `proj_activate()` work better with relative paths, inside and outside of RStudio (#1122, #954).

`use_testthat()` gains an edition argument to support testthat v3.0.0
  (#1185)

`use_version()` now updates `src/version.c` if it exists and contains a line matching `PKG_version = "x.y.z";`.

usethis has been re-licensed as MIT (#1252, #1253).

## Dependency changes

New Imports: gert, jsonlite (was already an indirect dependency), lifecycle, rappdirs

No longer in Imports: git2r, rematch2

# usethis 1.6.3

Patch release to refactor usage of withr in the tests for forward compatibility with an upcoming withr release. All changes are within the usethis tests.

# usethis 1.6.1

Patch release to align some path handling internals with an update coming in the fs package.

* `use_github_links()` is a bit more clever about remotes (e.g. `origin`
  vs. `upstream`), which makes it easier to make a PR that adds GitHub links for
  a package you've forked.

* `use_pkgdown()` now `.gitignore`s the destination directory and only adds the
  destination directory to the config file if it departs from the default
  (which is `docs/`).

* `use_tidy_ci()` is now deprecated in favour of `use_tidy_github_actions()`
  (#1098).

* `use_github_action_check_standard()` is a new intermediate workflow that
  checks on more platforms than `_release`, but is less exhaustive than `_full`
  (@jimhester).

* `create_tidy_package()` now uses an MIT license (@topepo, #1096).

# usethis 1.6.0

## GitHub actions

* New `use_github_actions()`, `use_github_action_check_release()`,
  `use_github_action_check_full()`, `use_github_action_pr_commands()`,
  to set up GitHub Actions for a package (@jimhester).

* We now recommend GitHub Actions instead of Travis-CI or AppVeyor, and strongly
  recommend upgrading your packages.

* Fix `use_github_action()` URL parameter to ensure custom URLs are allowed.
  (@coatless, #1065).

## Package creation

* `create_package()` gains a `roxygen` argument. If `TRUE` (the default),
  it adds a `RoxygenNote` field to the `DESCRIPTION` (which means the first run
  of `devtools::check()` will re-document the package, #963), and creates an
  empty `NAMESPACE` (which means you'll always need an explicit `@export`
  if you want to export functions, #927). It also turns markdown processing
  on by default (#911).

* `use_rstudio()` now sets the `LineEndingConversion` to `Posix` so that
  packages created using usethis always use LF line endings, regardless of
  who contributes to them (#1002).

* In the `usethis.description` option, you can now set `Authors@R = person()`
  directly, without having to wrap in additional layer of quotes. If setting
  this in your `.Rprofile`, you'll need to use `utils::person()` since the utils
  package isn't loaded until after your profile is executed.

## PR helpers

* A new article [Pull request helpers](https://usethis.r-lib.org/articles/articles/pr-functions.html)
  demonstrates how to use the `pr_*()` functions (@mine-cetinkaya-rundel, #802).

* `pr_finish()` checks that you don't have any local changes (#805), and can
  optionally finish any PR, not just the current (#1040).

* `pr_pause()` and `pr_fetch()` now automatically pull to get latest changes
  (#959, #960) and refresh RStudio's git pane (#706).

* `pr_push()` now works for a repository with no open pull requests
  (@maurolepore, #990).

* `pr_pull()` gives more information about which files have merge conflicts
  and automatically opens conflicted files for editing (#1056).

## Other new features

* New `rename_files()` makes it easy to rename paired `R/` and `test/` files
  (#784).

* New `ui_silence()` makes it easier to selectively silence some UI output.

* New `use_agpl3_license()` (@pachamaltese, #870).

* New `use_data_table()` to set up a package for Import-ing `data.table`
  (@michaelchirico, #897).

* `use_latest_dependencies()` replaces `use_tidy_version()` as the new name
  better reflect its usage (#771).

* New `use_lifecycle()` helper to import the lifecycle badges for functions and
  arguments in your package. Learn more at <https://lifecycle.r-lib.org/>.

* `use_release_issue()` will include additional bullets if your package
  includes `release_bullets()` function which returns a character
  vector (and the package has been loaded with `load_all()`) (#941).

## Minor improvements and bug fixes

* When writing files, usethis now respects line endings. Default line endings
  are taken from the `.Rproj` file (if available), otherwise the `DESCRIPTION`,
  otherwise the first file found in `R/`, then all else failing to your
  platform default (#767). It should do a better job of preserving UTF-8 files
  on windows (#969).

* `browse_github()` now always goes to the canonical GitHub site:
  `https://github.com/user/repo`. This is slightly worse than the current
  behaviour but makes the function more consistent across packages, and
  considerably simplifies the implementation.

* `browse_circle()` opens the project dashboard on Circle CI.

* `create_download_url()` is a new helper for making "ZIP file download"
  URLs suitable for use with `use_course()` and `use_zip()`, starting with the
  URLs that mere mortals can usually get their hands on in a browser
  (@fmichonneau, #406).

* `create_package()` no longer fails partway through if you have a malformed
  `usethis.description` option (#961).

* `create_package()` will now create a package in a symlink to a directory
  (#794).

* `create_package()` and `use_description()` gain a `check_name` argument to
  control whether to check for package names invalid for CRAN (@noamross, #883).

* `edit_file()` and `use_test()` gain an `open` parameter that allows you to
  control whether or not the function is opened for editing by the user (#817).

* `edit_rstudio_snippets()` makes it more clear which snippet types are
  allowed and that user's snippets mask the built-in snippets (@GegznaV, #885).

* `git_sitrep()` now reports project-specific user name and email, if set
  (#837), and email(s) associated with your GitHub account (@dragosmg, #724).

* `ui_yeah()` and `ui_nope()` allow you to override the default "yes" and
  "no" strings and to opt-out of shuffling (@rundel, #796).

* `use_circleci()` uses correct delimiters in template (@jdblischak, #835).

* `use_circleci_badge()` is now exported (@pat-s, #920).

* `use_code_of_conduct()` now generates an absolute link to code of conduct on
  pkgdown website or original source to avoid R CMD check issues (#772).

* `use_course()` and `use_zip()` are now equipped with some retry capability,
  to cope with intermittent failure or the need for a longer connect timeout
  (#988).

* `use_data()` automatically bumps R dependency to 2.10 (#962).

* `use_data_raw()` template quotes the dataset name correctly
  (#736, @mitchelloharawild).

* `use_description_defaults()` now shows the default fields combined with
  any options that you have set.

* `use_dev_package()` now supports packages installed from any remote type,
   not just GitHub (@antoine-sachet, #1071).

* `use_git()` will now create initial commit if needed (#852).

* `use_github_release()` no longer fails if you have no news bullets (#1048).

* `use_github_release()` now tags the latest local commit instead of the latest
  remote commit on the default branch (@davidchall, #1029).

* `use_gpl3_license()` now completes the license by providing additional
  information in a file named LICENSE, just like `use_mit_license()` and
  friends (@Cervangirard, #683).

* `use_logo()` now generates the correct href if the pkgdown `url` is set
  (@mitchelloharawild, #986).

* `use_make()` gains missing closing parenthesis (@ryapric, #804).

* `use_markdown_template()` no longer uses an unexported function in its
  default arguments (@fmichonneau, #761).

* `use_testthat()` and `use_test()` now work in projects, not just packages
  (#1017).

* `use_test()` works on Windows when called without arguments (#901).

* `use_tidy_issue_template()` uses current github format (@Maschette, #756).

* `use_travis()`, `use_travis_badge()`, and `browse_travis()`, now default
  to `ext = "com"` since travis-ci.com is now recommended it over travis-ci.org
  (@riccardoporreca, #1038).

* `use_release_issue()` reminds you to re-generate `README.md`,
  if needed (#767).

* `use_r()` and `use_test()` throw a clear error if multiple names are provided
  (@strboul, #862).

* `use_rcpp()` and `use_c()` now ensure `src/` contains at least one `.cpp` or
  `.c` placeholder file, so that the package can be built (@coatless, #720).

* `usethis.destdir` is a new option that is consulted when deciding where to
  put a new folder created by `use_course()` or `create_from_github()`
  (@malcolmbarrett, #1015).

* `use_lifecycle()` no longer adds the lifecycle package to the DESCRIPTION
  file. With the new roxygen markdown syntax for including badges, lifecycle has
  become a build-time dependency.

## Dependency changes

New Imports: cli, rematch2, rlang.

gh minimum version is bumped to v.1.1.0, due to changed behaviour around requests that return nothing.

clisymbols is removed from Imports.

# usethis 1.5.1

This is a patch release with various small features and bug fixes.

## Using the pipe `%>%` or the tidy eval toolkit in your package

* The templates used by `use_pipe()` and `use_tidy_eval()` use a more robust
  form of cross-reference links, linking to files rather than topics. This
  should silence some warnings seen on Windows at install time
  (#730, #731 @jmgirard).

* `use_pipe()` gains a logical `export` argument, so it can do the setup
  necessary to use the pipe operator when it is re-exported
  (`export = TRUE`, which is the default and preserves the previous behaviour)
  and when it is not (`export = FALSE`) (#783).

## Git, GitHub, and pull requests

* `use_github()` removes newline `\n` characters from the description that
  can cause the initial push to fail (#493, @muschellij2).

* `git_sitrep()` gives better feedback if we can't validate the GitHub PAT
  (#725, @ijlyttle).

* `create_from_github()` sets remote tracking branch of `master` to
  `upstream/master`, when it creates (and clones) a fork (#792).

* `pr_pause()` can switch back to master even if there is no remote tracking
  branch (#715, @cderv).

## Build tools and continuous integration

* `use_tidy_ci()` is updated for R 3.6, meaning that R 3.2 is the oldest version
  of R supported through proactive testing.

* `use_make()` and `use_jenkins()` add a Makefile and Jenkinsfile, respectively
  (#501, @ryapric).

* `use_circleci()` creates a `.circleci/config.yaml` config file for CircleCI
  (#703, @jdblischak).

## Other

* `use_zip()` is a new variant of `use_course()` that downloads and unpacks a
  ZIP file, with less pedantic behaviour re: the destination directory. Both
  functions now also work for ZIP files with MIME type
  `"application/x-zip-compressed"` (#573).

* `use_version()` can detect `"(development version)"` in a NEWS header and
  update it with an actual version (#768, @DavisVaughan).

## Dependency changes

R 3.1 is no longer explicitly supported or tested. Our general practice is to support the current release (3.6, at time of writing), devel, and the 4 previous versions of R (3.5, 3.4, 3.3, 3.2).

fs minimum version is stated to be v1.3.0.

glue minimum version is stated to be v1.3.0.

# usethis 1.5.0

## Git, GitHub (and GitLab)

usethis gains several functions to inspect and manipulate the Git situation for the current project = repository. We also provide more control and visibility
into git2r's workings, especially around credentials (usethis uses git2r for all
Git operations).

* `git_sitrep()` lets you know what's up with your Git, git2r and GitHub
  config (#328).

* `git_vaccinate()` vaccinates your global (i.e. user-level) git ignore file.
  It adds standard entries for R users, such as `.Rhistory` and `.Rdata`. This
  decreases the chance that you commit and push files containing confidential
  information (#469).

* `git_remotes()` and `use_git_remote()` are new helpers to inspect or modify
  Git remote URLs for the repo associated with the active project (#649).

* `git_protocol()` + `use_git_protocol()` and `git_credentials()` +
  `use_git_credentials()` are new helpers to summon or set Git transport
  protocol (SSH or HTTPS) or git2r credentials, respectively. These functions
  are primarily for internal use. Most users can rely on default behaviour. Use
  these helpers to intervene if git2r isn't discovering the right credentials
  (#653). usethis honors the `usethis.protocol` option, which allows you to
  express a general preference for SSH vs. HTTPS.

Other improvements and bug fixes:

* `use_github()` tries harder but also fails earlier, with more informative
  messages, making it less likely to leave the repo partially configured (#221).

* `use_github()` and `create_from_github()` gain a `protocol` argument
  (#494, @cderv).

* `create_from_github()` pulls from upstream master in a fork (#695, @ijlyttle).

* `use_release_issue()` creates a GitHub issue containing a release checklist,
  reflecting the standard practices of the tidyverse team (#338).

* `use_github_release()` creates a draft GitHub release using the entries in
  `NEWS.md` (#137).

* `use_gitlab_ci()` creates a `gitlab-ci.yaml` config file for GitLab CI
  (#565, @overmar).

* `use_git_config()` now invisibly returns the previous values of the
  settings.

* `use_github_labels()` has been rewritten be more flexible. You can now supply
  a repo name, and `descriptions`, and you can set colours/descriptions
  independently of creating labels. You can also `rename` existing labels
  (#290).

## GitHub pull requests

We've added **experimental** functions to work with GitHub pull requests. They
are aimed at both a maintainer (who may make, review, and modify pull
requests) and a contributor (who may make or explore pull requests).

* `git_sitrep()` includes a section at the end aimed at describing "pull request
  readiness". Expect that to develop and expand.

* `pr_init()`, `pr_fetch()`, `pr_push()`, `pr_pull()`, `pr_finish()`, and
  `pr_view()` constitute the new family of helpers. They are designed to be
  smart about the significance of remotes with the standard names of `origin`
  and `upstream` and to facilitate both internal and external pull requests.

## Partial file management

usethis gains tooling to manage part of a file. This is currently used for
managing badges in your README and roxygen import tags:

*   `use_badge()` and friends now automatically add badges if your README
    contains a specially formatted badge block (#497):

    ```
    <-- badge:start -->
    <-- badge:end -->
    ```

*   `use_tibble()` and `use_rcpp()` automatically add roxygen tags to
    to `{package}-package.R` if it contains a specially formatted namespace
    block (#517):

    ```R
    ## usethis namespace: start
    ## usethis namespace: end
    NULL
    ```

    Unfortunately this means that `use_rcpp()` no longer supports non-roxygen2
    workflows, but I suspect the set of people who use usethis and Rcpp but
    not roxygen2 is very small.

## Extending and wrapping usethis

* New `proj_activate()` lets you activate a project, either opening a new
  RStudio session (if you use RStudio) or changing the working directory
  (#511).

* `proj_get()` and `proj_set()` no longer have a `quiet` argument. The
  user-facing message about setting a project is now under the same control
  as other messages, i.e. `getOption("usethis.quiet", default = FALSE)` (#441).

* A new set of `ui_*()` functions makes it possible to give your own code
  the same user interface as usethis (#308). All use the glue and crayon and
  packages to power easy interpolation and formatting. There are four families
  of functions:

    * block styles: `ui_line()`, `ui_done()`, `ui_todo()`, `ui_oops()`,
      `ui_info()`.
    * conditions: `ui_stop()`, `ui_warn()`.
    * questions: `ui_yeah()`, `ui_nope()`.
    * inline styles: `ui_field()`, `ui_value()`, `ui_path()`, `ui_code()`.

* `with_project()` and `local_project()` are new withr-style functions to
  temporarily set an active usethis project. They make usethis functions easier
  to use in an *ad hoc* fashion or from another package (#441).

## Tidyverse standards

These standards are (aspirationally) used by all tidyverse packages; you are
welcome to use them if you find them helpful.

* Call `use_tidy_labels()` to update GitHub labels. Colours are less
  saturated, docs is now documentation, we use some emoji, and performance is
  no longer automatically added to all repos (#519). Repo specific issues
  should be given colour `#eeeeee` and have an emoji.

* Call `use_logo()` to update the package logo to the latest specifications:
  `man/figure/logo.png` should be 240 x 278, and README should contain
  `<img src="man/figures/logo.png" align="right" height="139" />`.
  This gives a nicer display on retina displays. The logo is also linked to the
  pkgdown site if available (#536).

* When creating a new package, use `create_tidy_package()` to start with a
  package following the tidyverse standards (#461).

* `NEWS.md` for the development version should use "(development version)"
  rather than the specific version (#440).

* pkgdown sites should now be built by travis and deployed automatically to
  GitHub pages. `use_pkgdown_travis()` will help you set that up.

* When starting the release process, call `use_release_issue()` to create a
  release checklist issue (#338).

* Prior to CRAN submission call `use_tidy_release_test_env()` to update the
  test environment section in `cran-comments()` (#496).

* After acceptance, try `use_github_release()` to automatically create a
  release. It's created as a draft so you have a chance to look over before
  publishing.

* `use_vignette()` includes the a standard initialisation chunk with
  `knitr::opts_chunk$set(comment = "#>", collapse = TRUE)` which should
  be used for all Rmds.

## New functions not already mentioned

* `use_devtools()` (#624), `use_conflicted()` (#362), and `use_reprex()` (#465)
  help add useful packages to your `.Rprofile`.

* `use_partial_warnings()` helps the user add a standard warning block to
  `.Rprofile` (#64).

* `edit_r_buildignore()` opens `.Rbuildignore` for manual editing
   (#462, @bfgray3).

* `use_lgpl_license()` automates set up of the LGL license (#448, @krlmlr).

* `use_ccby_license()` adds a CCBY 4.0 license (#547, @njtierney).

* `use_rcpp_armadillo()` and `use_rcpp_eigen()` set up a package to use
  RcppArmadillo or RcppEigen, respectively (#421, @coatless, @duckmayr).

* `use_c("foo")` sets up `src/` and creates `src/foo.c` (#117).

* `use_covr_ignore()` makes it easy to ignore files in test coverage (#434).

* `use_pkgdown_travis()` helps you set up pkgdown for automatic build-and-deploy
  from Travis-CI to GitHub Pages (#524).

* `use_addin()` does setup for RStudio addins (#353, @haozhu233).

* `use_tutorial()` creates a new interactive R Markdown tutorial, as implemented
  by the [`learnr` package](https://rstudio.github.io/learnr/index.html)
  (@angela-li, #645).

* `use_article()` creates articles, vignettes that are automatically added to
  `.Rbuildignore`. These appear on pkgdown sites, but are not included with the
  package itself (#281).

* `use_citation()` creates a basic `CITATION` template and puts it in the
  right place (#100).

## Other minor bug fixes and improvements

* `write_union()` appends the novel `lines`, but does not remove duplicates
  from existing lines (#583, @khailper).

* `use_rcpp("foo")` now creates `src/foo.cpp` (#117).

* `use_data()` gains a `version` argument and defaults to serialization format
  version 2 (#675).

* `use_data_raw()` accepts a name for the to-be-prepared dataset and opens a
  templated R script (#646).

* `browse_github()` now falls back to CRAN organisation (with a warning) if
  package doesn't have its own GitHub repo (#186).

* `create_*()` restore the active project if they error part way through,
  and use `proj_activate()` (#453, #511).

* `edit_r_profile()` and `edit_r_environ()` now respect environment variables
  `R_PROFILE_USER` and `R_ENVIRON_USER`, respectively (#480).

* `use_description()` once again prints the generated description (#287).

* `use_description_field()` is no longer sensitive to whitespace, which
  allows `use_vignette()` to work even if the `VignetteBuilder` field is
  spread over multiple lines (#439).

* `use_logo()` can override existing logo if user gives permission (#454).
  It also produces retina appropriate logos by default, and matches the
  aspect ratio to the <http://hexb.in/sticker.html> specification (#499).

* `use_news_md()` will optionally commit.

* `use_package()` gains a `min_version` argument to specify a minimum
  version requirement (#498). Set to `TRUE` to use the currently installed
  version (#386). This is used by `use_tidy_eval()` in order to require version
  0.1.2 or greater of rlang (#484).

* `use_pkgdown()` is now configurable with site options (@jayhesselberth, #467),
  and no longer creates the `docs/` directory (#495).

* `use_test()` no longer forces the filename to be lowercase (#613, @stufield).

* `use_test()` will not include a `context()` in the generated file if used
  with testthat 2.1.0 and above (the future release of testthat) (#325).

* `use_tidy_description()` sets the `Encoding` field in `DESCRIPTION`
  (#502, @krlmlr).

* `use_tidy_eval()` re-exports `:=` (#595, @jonthegeek).

* `use_tidy_versions()` has source argument so that you can choose to use
  local or CRAN versions (#309).

* `use_travis()` gains an `ext` argument, defaulting to `"org"`. Use
  `ext = "com"` for `https://travis-ci.com` (@cderv, #500).

* `use_version()` asks before committing.

* `use_vignette()` now has a `title` argument which is used in YAML header
  (in the two places where it is needed). The vignettes also lose the default
  author and date fields (@rorynolan, #445), and the R Markdown starter material.
  They gain a standard setup chunk.

* `use_version("dev")` now creates a standard "(development version)" heading
  in `NEWS.md` (#440).

* `use_vignette()` now checks if the vignette name is valid (starts with letter
  and consists of letters, numbers, hyphen, and underscore) and throws an error
  if not (@akgold, #555).

* `restart_rstudio()` now returns `FALSE` in RStudio if no project is open,
  fixing an issue that caused errors in helpers that suggest restarting
  RStudio (@gadenbuie, #571).

## Dependency changes

* withr moves from Suggests to Imports.

* purrr and yaml are new in Imports.

# usethis 1.4.0

## File system

All usethis file system operations now use the [fs](https://fs.r-lib.org) package (#177). This should not change how usethis functions, but users may notice these features of fs-mediated paths:

  - Paths are "tidy", meaning `/` is the path separator and there are never multiple or trailing `/`.
  - Paths are UTF-8 encoded.
  - A Windows user's home directory is interpreted as `C:\Users\username` (typical of Unix-oriented tools, like Git and ssh; also matches Python), as opposed to `C:\Users\username\Documents` (R's default on Windows). Read more in [`fs::path_expand()`](https://fs.r-lib.org/reference/path_expand.html).

## Extending or wrapping usethis

These changes make it easier for others to extend usethis, i.e. to create workflow packages specific to their organization, or to use usethis in other packages.

* `proj_path()` is newly exported. Use it to build paths within the active project. Like `proj_get()` and `proj_set()`, it is not aimed at end users, but rather for use in extension packages. End users should use [rprojroot](https://rprojroot.r-lib.org) or its simpler companion, [here](https://here.r-lib.org), to programmatically detect a project and
build paths within it (#415, #425).

  * `edit_file()`, `write_over()`, and `write_union()` are newly exported helpers. They are mostly for internal use, but can also be useful in packages that extend or customize usethis (#344, #366, #389).

* `use_template()` no longer errors when a user chooses not to overwrite an existing file and simply exits with confirmation that the file is unchanged (#348, #350, @boshek).

* `getOption("usethis.quiet", default = FALSE)` is consulted when printing user-facing messages. Set this option to `TRUE` to suppress output, e.g., to use usethis functions quietly in another package. For example, use `withr::local_options(list(usethis.quiet = TRUE))` in the calling function (#416, #424).

## New functions

* `proj_sitrep()` reports current working directory, the active usethis project, and the active RStudio Project. Call this function if things seem weird and you're not sure what's wrong or how to fix it. Designed for interactive use and debugging, not for programmatic use (#426).

* `use_tibble()` does minimum setup necessary for a package that returns or exports a tibble. For example, this guarantees a tibble will print as a tibble (#324 @martinjhnhadley).

* `use_logo()` resizes and adds a logo to a package (#358, @jimhester).

* `use_spell_check()` adds a whitelist of words and a unit test to spell check package documentation during `R CMD check` (#285 @jeroen).

## Other small changes and bug fixes

* usethis has a new logo! (#429)

* `use_course()` reports progress during download (#276, #380).

* `use_git()` only makes an initial commit of all files if user gives explicit consent (#378).

* `create_from_github()`: the `repo` argument is renamed to `repo_spec`, since it takes input of the form "OWNER/REPO" (#376).

* `use_depsy_badge()` is deprecated. The Depsy project has officially concluded and is no longer being maintained (#354).

* `use_github()` fails earlier, with a more informative message, in the absence of a GitHub personal access token (PAT). Also looks for the PAT more proactively in the usual environment variables (i.e., GITHUB_PAT, GITHUB_TOKEN) (#320, #340, @cderv).

* The logic for setting DESCRIPTION fields in `create_package()` and `use_description()` got a Spring Cleaning. Fields directly specified by the user take precedence, then the named list in `getOption("usethis.description")` is consulted, and finally defaults built into usethis. `use_description_defaults()` is a new function that reveals fields found in options and built into usethis. Options specific to one DESCRIPTION field, e.g. `devtools.desc.license`, are no longer supported. Instead, use a single named list for all fields, preferably stored in an option named `"usethis.description"` (however,`"devtools.desc"` is still consulted for backwards compatibility). (#159, #233, #367)

## Dependency changes

New Imports: fs, glue, utils

No longer in Imports: backports, httr, rematch2, rmarkdown (moved to Suggests), styler (moved to Suggests)

# usethis 1.3.0

* usethis has a website: <https://usethis.r-lib.org> (#217). It includes an article with advice on system setup, for usethis and for R development more generally.

* `edit_*()` functions now return the target path, invisibly (#255).

* `edit_git_ignore(scope = "user")` prefers `~/.gitignore`, but detects an existing `~/.gitignore_global`, if it exists. If a new global gitignore file is created, it is created as `~/.gitignore` and recorded in user's git config as the `core.excludesfile` (#255).

* `create_from_github()` gains several arguments and new functionality. The `protocol` argument lets user convey whether remote URLs should be ssh or https. In the case of "fork and clone", the original repo is added as `upstream` remote. It is now possible -- although rarely necessary -- to directly specify the GitHub PAT, credentials (in git2r form), and GitHub host (#214, #214, #253).

* `use_github_labels()` can create or update the colour of arbitrary GitHub issue labels, defaulting to a set of labels and colours used by the tidyverse packages, which are now exposed via `tidy_labels()`. That set now includes the labels "good first issue" and "help wanted" (#168, #249).

* `appveyor_info()` no longer reverses the repo's URL and image link. Corrects the markdown produced by `use_appveyor_badge()` (#240, @llrs).

* `use_cran_badge()` uses an HTTPS URL for the CRAN badge image (#235, @jdblischak).

* `create_package()` and `create_project()` return a normalized path, even if target directory does not pre-exist (#227, #228).

## New functions

* `use_git_config()` can set user's Git name or email, globally or locally in a project/repo (#267).

* `browse_github_pat()` goes to the webpage where a GitHub user can create a personal access token (PAT) for the GitHub API. If the user configures a PAT, they can use functions like `create_from_github()` and `use_github()` to easily create and connect GitHub repos to local projects. (#248, #257, @jeroen, via @jennybc).

* `use_version()` increments the version of the active package, including an interactive chooser. `use_dev_version()` is now a special case wrapper around this. (#188, #223, @EmilHvitfeldt).

* `use_tidy_github()` creates a standard set of files that make a GitHub repository more navigable for users and contributors: an issue template, contributing guidelines, support documentation, and a code of conduct. All are now placed in a `.github/` subdirectory (#165, @batpigandme).

* `use_bioc_badge` creates a Bioconductor badge that links to the build report (#271, @LiNk-NY).

* `use_binder_badge()` creates a badge indicating the repository can be launched in an executable environment via [Binder](https://mybinder.org/) (#242, @uribo).

# usethis 1.2.0

## New functions

* `use_course()` downloads a folder's worth of materials from a ZIP file, with deliberate choices around the default folder name and location. Developed for use at the start of a workshop. Helps participants obtain materials from, e.g., a DropBox folder or GitHub repo (#196).

* `use_blank_slate()` provides a way to opt in to an RStudio workflow where the user's workspace is neither saved nor reloaded between R sessions. Automated for `scope = "project"`. Provides UI instructions for `scope = "user"`, for now (#139).

* `use_tidy_style()` styles an entire project according to <https://style.tidyverse.org> (#72, #197 @lorenzwalthert).

* GitHub conventions common to tidyverse packages are enacted by `use_tidy_contributing()`, `use_tidy_issue_template()`, and `use_tidy_support()` (@batpigandme, #143, #166).

Other changes

* New projects that don't exhibit other obvious criteria for being a "project" will include a sentinel, empty file named `.here`, so they can be recognized as a project.

* Project launching and switching works on RStudio server (#115, #129).

* `use_template()` is newly exported, so that other packages can provide
templating functions using this framework (@ijlyttle #120).

* `use_readme_rmd()` and `use_readme_md()` work, in a similar fashion, for projects that are and are not a package (#131, #135).

* `use_readme_rmd()` once again creates a pre-commit git hook, to help keep `README.Rmd` and `README.md` in sync (@PeteHaitch #41).

* Substantial increase in unit test coverage.

# usethis 1.1.0

## New helpers

* `browse_github()`, `browse_github_issues()`, `browse_github_pulls()`,
  `browse_cran()` and `browse_travis()` open useful websites related to
   the current project or a named package. (#96, #103).

* `create_from_github()` creates a project from an existing GitHub
  repository, forking if needed (#109).

* `use_cc0_license()` applies a CC0 license, particularly appropriate for data
  packages (#94)

* `use_lifecycle_badge()` creates a badge describing current stage in
  project lifecycle (#48).

* `use_pkgdown()` creates the basics needed for a
  [pkgdown](https://github.com/r-lib/pkgdown) website (#88).

* `use_r("foo")` creates and edit `R/foo.R` file. If you have a test file open,
  `use_r()` will open the corresponding `.R` file (#105).

* `use_tidy_versions()` sets minimum version requirement for all dependencies.

## Bug fixes and improvements

* `use_dev_version()` now correctly updates the `Version` field in a package
  description file. (@tjmahr, #104)

* `use_revdep()` now also git-ignores the SQLite database (#107).

* `use_tidy_eval()` has been tweaked to reflect current guidance (#106)

# usethis 1.0.0

This is a new package that extracts out many functions that previously lived in devtools, as well as providing more building blocks so you can create your own helpers. As well as the many new helpers listed below, there are three main improvements to the package:

* More support for general R projects, other than packages.
* A notion of an "active" project that all commands operate on.
* Refined output.

usethis is gradually evolving towards supporting more general R "projects", not just packages. This is still a work in progress, so please let me know if you use a function that you think should work with projects but doesn't. You can also try out the new `create_project()` which creates a basic RStudio project.

The concept of the working directory and the "base path" have been refined. Rather than using an argument to specify the active project, all `use_` functions now use a global active project setting, as returned by `proj_get()`. This is cached throughout a session, although it will be updated by `create_package()` and `create_project()`. You'll now get an clear error if you attempt to `use_something()` outside of a project, and `create_something()` will warn if you're trying to create inside an existing project.

The output from all usethis commands has been reviewed to be informative but not overwhelming. usethis takes advantage of colour (using crayon and RStudio 1.1) to help chunk the output and clearly differentiate what you need to do vs. what has been done for you.

## New functions

* `use_apl2_license()` if you want to use the Apache 2.0 license.

* `use_depsy_badge()` allows including a Depsy badge (@gvegayon, #68).

* `use_dev_package()` works like `use_package()` but also adds the
  repo to the `Remotes` field (#32).

* `use_github_labels()` will automatically set up a standard set of labels,
  optionally removing the default labels (#1).

* `use_pipe()` creates a template to use magrittr's `%>%` in your package (#15).

* `use_tidy_ci()` which sets up travis and codecov using the tidyverse
  conventions (#14)

* `use_tidy_description()` puts description fields in a standard order
  and alphabetises dependencies.

* `use_tidy_eval()` imports and re-exports the recommend set of tidy eval
  helpers if your package uses tidy eval (#46).

* `use_usethis()` opens your `.Rprofile` and gives you the code to copy
  and paste in.

## New edit functions

A new class of functions make it easy to edit common config files:

* `edit_r_profile_user()` opens `.Rprofile`
* `edit_r_environ_user()` opens `.Renviron`
* `edit_r_makevars_user()` opens `.R/Makevars`
* `edit_git_config_user()` opens `.gitconfig`
* `edit_git_ignore_user()` opens `.gitignore`
* `edit_rstudio_snippets(type)` opens `~/R/snippets/{type}.snippets`

## Updates

* `use_coverage("codecov")` now sets a default threshold of 1% to try and
  reduce false positives (#8).

* `use_description()` now sets `ByteCompile: true` so you can benefit from
  the byte compiler (#29)

* The license functions (`use_mit_license()`, `use_apl2_license()`, and
  `use_gpl3_license()`) save a copy of the standard license text in
  `LICENSE.md`, which is then added to `.Rbuildignore`. This allows you
  to follow standard licensing best practices while adhering to CRANs
  requirements (#10).

* `use_package_doc()` uses more a modern roxygen2 template that requires
  less duplication.

* `use_test()` will use the name of the currently open file in RStudio
  if you don't supply an explicit name (#89).

* `use_readme_rmd()` now puts images in `man/figures/` and no longer
  adds to `.Rbuildgnore`. This ensures that the rendered `README.md` will
  also work on CRAN (#16, #19). The first chunk now uses `include = FALSE`
  and is named setup (#19).

* `use_revdep()` creates structure for use with revdepcheck package, the
  preferred way to run revdepchecks. (#33)

## Building blocks

* New `use_badge()` for adding any badge to a README. Now only prints a
  todo message if the badge does not already exist.

* `use_directory()` is now exported (#27).

## Bug fixes and minor improvements

* Functions which require code to be copied now automatically put the code on
  the clipboard if it is available (#52).

* `create_package()` no longer creates a dependency on the current version of
  R.

* `use_build_ignore()` now strips trailing `/`

* `use_git()` will restart RStudio if needed (and possible) (#42).

* `use_github()` now has an organisation parameter so you can create repos
  in organisations (#4).

* `use_template()` and `use_test()` now convert title to a slug that only
  contains lowercase letters, numbers, and `-`.

* `use_vignette()` now adds `*.html` and `*.R` to your `.gitgnore` so you
  don't accidentally add in compiled vignette products (#35).

* `use_travis_badge()` and `use_appveyor_badge()` are now exported functions,
  so they can be used even if ci was separately set up (#765, @smwindecker).

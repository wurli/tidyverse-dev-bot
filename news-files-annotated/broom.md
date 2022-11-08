# broom 1.0.1.9000

!begin-bullets-1!

-   !begin-bullet!
    The default `data` argument for `augment.coxph()` and
    `augment.survreg()` has been transitioned from `NULL` to
    `model.frame(x)` (#1126 by `@capnrefsmmat`).
    !end-bullet!
-   !begin-bullet!
    Migrated 'ggplot2' from strong to weak dependency, i.e. moved from
    `Imports` to `Suggests`.
    !end-bullet!
-   !begin-bullet!
    Fixed a bug where `augment()` results would not include residuals
    when the response term included a function call (#1121, #946, #937,
    #124).
    !end-bullet!

!end-bullets-1!

To be released as broom 1.0.2.

# broom 1.0.1

!begin-bullets-2!

-   !begin-bullet!
    Improves performance of `tidy.lm()` and `tidy.glm()` for full-rank
    fits (#1112 by `@capnrefsmmat`).
    !end-bullet!
-   !begin-bullet!
    Moves forward with deprecation of tidiers for sparse matrices
    outputted from the Matrix package, initially soft-deprecated in
    broom 0.5.0. The Matrix tidiers were light wrappers around coercion
    methods that will now be deprecated from Matrix itself in the
    upcoming 1.4-2 release. The affected methods are
    `tidy.sparseMatrix()`, `tidy.dgCMatrix()`, and `tidy.dgTMatrix()`.
    Note that `tidy.confusionMatrix()`, for relevant objects outputted
    from the caret package, is unaffected (#1113).
    !end-bullet!
-   !begin-bullet!
    `tidy.anova()` works again with `anova` objects from the `lme4`
    package (broken by addition of the `terms` column in the previous
    release)
    !end-bullet!

!end-bullets-2!

# broom 1.0.0

broom 1.0.0 is the first "production" release of the broom package, and
includes a number of notable changes to both functionality and
governance.

As of this release, the broom team will be following a set of guidelines
that clarify the scope of further development on the package. Given the
package's wide use and long history, these guidelines *prioritize
backward compatibility* over internal consistency and completeness. You
can read those guidelines
[here](https://broom.tidymodels.org/articles/)!

We've also made notable changes to error handling in this release:

!begin-bullets-3!

-   !begin-bullet!
    Adds minimal ellipsis checking to warn on commonly misspecified
    arguments passed through ellipses. Notably:
    !begin-bullets-4!
    -   !begin-bullet!
        `tidy()` methods will now warn when supplied an `exponentiate`
        argument if it will be ignored.
        !end-bullet!
    -   !begin-bullet!
        `augment()` methods will now warn when supplied a `newdata`
        argument if it will be ignored.
        !end-bullet!

    !end-bullets-4!
    !end-bullet!
-   !begin-bullet!
    The warning regarding tidiers only maintained via dispatch to `lm`
    and `glm` is now displayed only once per session, per unique
    dispatch. That is, if a `class_a` object is tidied using a `(g)lm`
    method, broom will not warn when tidying `class_a` objects for the
    rest of the session, but if a `class_b` object is tidied using a
    `(g)lm` method in the same session, broom will warn again (#1101).
    !end-bullet!

!end-bullets-3!

Other fixes and improvements:

!begin-bullets-5!

-   !begin-bullet!
    Add `exponentiate` argument to `tidy.boot()` (#1039).
    !end-bullet!
-   !begin-bullet!
    Update in `tidy.htest()` converting matrix-columns to vector-columns
    (#1081).
    !end-bullet!
-   !begin-bullet!
    Address failures in `tidy.glht()` with `conf.int = TRUE` (#1103).
    !end-bullet!
-   !begin-bullet!
    Address failures in `tidy.zoo()` when input data does not have
    `colnames` (#1080).
    !end-bullet!
-   !begin-bullet!
    Transition tidiers for bivariate linear or spline-based
    interpolation---using list tidiers to interface with objects from
    the akima package is now considered off-label. See the interp
    package for a FOSS alternative.
    !end-bullet!
-   !begin-bullet!
    Address failures in `tidy.svyolr()` when `p.values = TRUE`. Instead
    of aliasing `tidy.polr()` directly, `tidy.svyolr()` lightly wraps
    that method and warns if `p.values` is supplied (#1107).
    !end-bullet!
-   !begin-bullet!
    Adds a `term` column and introduces support for `car::lht()` output
    in `tidy.anova()` (#1106 by `@grantmcdermott`).
    !end-bullet!
-   !begin-bullet!
    Adds a dedicated `glance.anova` method (which previously dispatched
    to the\
    deprecated `glance.data.frame()` tidier, #1106 by
    `@grantmcdermott`).
    !end-bullet!

!end-bullets-5!

# broom 0.8.0

This update makes significant improvements to documentation, fixes a
number of bugs, and brings the development flow of the package up to
date with other packages in the tidymodels.

In the big picture, this release:

!begin-bullets-6!

-   !begin-bullet!
    Makes many improvements to documentation:
    !begin-bullets-7!
    -   !begin-bullet!
        All tidiers now have example code demonstrating usage in their
        documentation. Tidiers for base packages as well as selected
        others also include sample code for visualization of results
        with ggplot2.
        !end-bullet!
    -   !begin-bullet!
        Code examples in the documentation largely now follow consistent
        style---these changes were made largely to reflect the tidyverse
        style guide, addressing spacing, object naming, and commenting,
        among other things.
        !end-bullet!
    -   !begin-bullet!
        Examples previously marked with `\dontrun` or `\donttest` have
        been workshopped to run reliably.
        !end-bullet!

    !end-bullets-7!
    !end-bullet!
-   !begin-bullet!
    Clarifies errors and warnings for deprecated and unmaintained
    tidiers.
    !end-bullet!
-   !begin-bullet!
    Ensures that tidiers are placed in files named according to the
    model-supplying package rather than the model object class for
    easier navigability of the source code.
    !end-bullet!

!end-bullets-6!

### Bug fixes and other improvements

!begin-bullets-8!

-   !begin-bullet!
    Fix `glance.fixest` error when model includes only fixed effects and
    no regressors (`#1018` by `@arcruz0`, `#1088` by
    `@vincentarelbundock`).
    !end-bullet!
-   !begin-bullet!
    Address excessive messaging from `tidy.speedlm` (`#1084` by
    `@cgoo4`, `#1087` by `@vincentarelbundock`).
    !end-bullet!
-   !begin-bullet!
    Add `nobs` column to the output of `glance.svyglm` (`#1085` by
    `@fschaffner`, `#1086` by `@vincentarelbundock`).
    !end-bullet!
-   !begin-bullet!
    Ensure `tidy.prcomp` description entries use consistent punctuation
    (`#1072` by `@PursuitOfDataScience`).
    !end-bullet!
-   !begin-bullet!
    Address breaking changes in `glance.fixest` and `tidy.btergm`.
    !end-bullet!
-   !begin-bullet!
    Simplify handling of `MASS::polr` output in the corresponding `tidy`
    and `augment` methods.
    !end-bullet!
-   !begin-bullet!
    Align continuous integration with current standards in tidymodels
    packages.
    !end-bullet!

!end-bullets-8!

# broom 0.7.12

Nearly identical source to broom 0.7.11---updates the maintainer email
address to an address listed in other CRAN packages maintained by the
same person.

# broom 0.7.11

!begin-bullets-9!

-   !begin-bullet!
    Addressed issue with the ordering of original observations in
    `augment.rqs`. Now function preserves the original `data.frame`
    names also when the input `data.frame` only has one column (`#1052`
    by `@ilapros`).
    !end-bullet!
-   !begin-bullet!
    Addressed warning from `tidy.rma` when `x$ddf` has length greater
    than 1 (`#1064` by `@wviechtb`).
    !end-bullet!
-   !begin-bullet!
    Fix errors in `glance.lavaan` in anticipation of upcoming `tidyr`
    release (`#1067` by `@DavisVaughan`).
    !end-bullet!
-   !begin-bullet!
    Corrected the confidence interval in `tidy.crr()`. The
    `tidy.crr(conf.level=)` argument was previously ignored (`#1068` by
    `@ddsjoberg`).
    !end-bullet!

!end-bullets-9!

# broom 0.7.10

!begin-bullets-10!

-   !begin-bullet!
    Clarifies error when `pysch::mediate` output is dispatched to
    `tidy.mediate` (`#1037` by `@LukasWallrich`).
    !end-bullet!
-   !begin-bullet!
    Allows user to specify confidence level for `tidy.rma` (`#1041` by
    `@TarenSanders`)
    !end-bullet!
-   !begin-bullet!
    Clarifies documentation related to usage of `augment_columns()`;
    most package users should use `augment()` in favor of
    `augment_columns()`. See `?augment_columns` for more details.
    !end-bullet!
-   !begin-bullet!
    Extends support for `emmeans` by fixing non-standard column names in
    case of asymptotically derived inferential statistics. (`#1046` by
    `@crsh`)
    !end-bullet!
-   !begin-bullet!
    Fixes use of index columns in `augment.mlogit` and adds `.resid`
    column to output. (`#1045`, `#1053`, `#1055`, and `#1056` by
    `@jamesrrae` and `@gregmacfarlane`)
    !end-bullet!
-   !begin-bullet!
    Correct column naming of standard error measures in
    `glance.survfit()`.
    !end-bullet!
-   !begin-bullet!
    Various bug fixes and improvements to documentation.
    !end-bullet!

!end-bullets-10!

# broom 0.7.9

!begin-bullets-11!

-   !begin-bullet!
    Fixes confidence intervals in `tidy.crr()`, which were previously
    exponentiated when `exponentiate = FALSE` (`#1023` by `@leejasme`)
    !end-bullet!
-   !begin-bullet!
    Deprecates `Rchoice` tidiers, as the newest 0.3-3 release requires R
    4.0+ and does not re-export needed generics.
    !end-bullet!
-   !begin-bullet!
    Updates to `ergm` tidiers in anticipation of changes in later
    releases. (`#1034` by `@krivit`)
    !end-bullet!

!end-bullets-11!

# broom 0.7.8

!begin-bullets-12!

-   !begin-bullet!
    Fixed bug in `glance.ergm` related to handling of MCMC details.
    !end-bullet!
-   !begin-bullet!
    Address breakages in unit tests for {fixest} tidiers.
    !end-bullet!

!end-bullets-12!

# broom 0.7.7

!begin-bullets-13!

-   !begin-bullet!
    Fixed bug in `tidy.epi.2by2` that resulted in errors with new
    version of `epiR` (`#1028` by `@nt-williams`)
    !end-bullet!
-   !begin-bullet!
    Added `exponentiate` argument to `tidy.gam()` tidier applicable for
    parametric terms (`#1013` by `@ddsjoberg`)
    !end-bullet!
-   !begin-bullet!
    Added `exponentiate` argument to `tidy.negbin()` tidier (`#1011` by
    `@ddsjoberg`)
    !end-bullet!
-   !begin-bullet!
    Fixed failures in `spdep` tidiers following breaking changes in the
    most recent release
    !end-bullet!
-   !begin-bullet!
    Various bug fixes and improvements to documentation
    !end-bullet!

!end-bullets-13!

# broom 0.7.6

!begin-bullets-14!

-   !begin-bullet!
    Fixed bug in `augment` tidiers resulting in `.fitted` and `.se.fit`
    array columns.
    !end-bullet!
-   !begin-bullet!
    Fixed bug that made column `y` non-numeric after `tidy_xyz` (`#973`
    by `@jiho`)
    !end-bullet!
-   !begin-bullet!
    Added tidiers for `MASS:glm.nb` (`#998` by `@joshyam-k`)
    !end-bullet!
-   !begin-bullet!
    Fixed bug in `tidy.fixest` that sometimes prevented arguments like
    `se` from being used (`#1001` by `@karldw`)
    !end-bullet!
-   !begin-bullet!
    Fixed bug in `tidy.fixest` that resulted in errors when columns with
    name `x` are present (`#1007` by `@grantmcdermott`)
    !end-bullet!
-   !begin-bullet!
    Moved forward with planned deprecation of `gamlss` tidiers in favor
    of those provided in `broom.mixed`
    !end-bullet!
-   !begin-bullet!
    Various bug fixes and improvements to documentation
    !end-bullet!

!end-bullets-14!

# broom 0.7.5

!begin-bullets-15!

-   !begin-bullet!
    Fixed bug in the `nnet::multinom` tidier in the case that the
    response variable has only two levels (`#993` by
    `@vincentarelbundock` and `@hughjonesd`)
    !end-bullet!
-   !begin-bullet!
    Various bug fixes and improvements to documentation
    !end-bullet!

!end-bullets-15!

# broom 0.7.4

broom 0.7.4 introduces tidier support for a number of new model objects
and improves functionality of many existing tidiers!

#### New Tidiers

!begin-bullets-16!

-   !begin-bullet!
    Add tidiers for `Rchoice` objects (`#961` by `@vincentarelbundock`
    and `@Nateme16`)
    !end-bullet!
-   !begin-bullet!
    Add tidiers for objects produced by `car::leveneTest` (`#968` by
    `@vincentarelbundock` and `@mkirzon`)
    !end-bullet!
-   !begin-bullet!
    Add tidiers for objects produced by `cmprsk::crr` (`#971` and `#552`
    by `@vincentarelbundock` and `@margarethannum`)
    !end-bullet!
-   !begin-bullet!
    Add an `augment()` method for `gam` objects (`#975` and `#645` by
    `@vincentarelbundock`)
    !end-bullet!
-   !begin-bullet!
    Add tidiers for `vars` objects (`#979` and `#161` by
    `@vincentarelbundock` and `@Diego-MX`)
    !end-bullet!

!end-bullets-16!

This release also restores tidiers for `felm` objects from the `lfe`
package, which was recently unarchived from CRAN.

#### Improvements to existing tidiers

!begin-bullets-17!

-   !begin-bullet!
    `tidy.emmGrid` can now return `std.error` and `conf.*` columns at
    the same time. (`#962` by `@vincentarelbundock` and `@jmbarbone`)
    !end-bullet!
-   !begin-bullet!
    `tidy.garch` can now produce confidence intervals (`#964` by
    `@vincentarelbundock` and `@IndrajeetPatil`)
    !end-bullet!
-   !begin-bullet!
    `tidy.coxph` can now report confidence intervals on models utilizing
    penalized/clustering terms (`#966` by `@vincentarelbundock` and
    `@matthieu-faron`)
    !end-bullet!
-   !begin-bullet!
    `augment.lm` now works when some regression weights are equal to
    zero (`#965` by `@vincentarelbundock` and `@vnijs`)
    !end-bullet!
-   !begin-bullet!
    `tidy.coxph` can now handle models utilizing penalized/clustering
    terms (`#966` and `#969` by `@vincentarelbundock`,
    `@matthieu-faron`, and `@KZARCA`)
    !end-bullet!
-   !begin-bullet!
    Fix bug in `tidy.speedglm` on R 4.0.0+ (`#974` by `@uqzwang`)
    !end-bullet!
-   !begin-bullet!
    tidy.multinom works with matrix response (`#977` and `#666` by
    `@vincentarelbundock` and `@atyre2`)
    !end-bullet!
-   !begin-bullet!
    Various bug fixes and improvements to documentation and errors.
    !end-bullet!

!end-bullets-17!

# broom 0.7.3

In broom `0.7.0`, we introduced an error for model objects that
subclassed `lm` and relied on `tidy.lm()`, or similarly for
`tidy.glm()`. Tidiers for these objects were supported unintentionally,
and we worried that tidiers for these objects would silently report
inaccurate results.

In hindsight, this change was unnecessarily abrupt. We've decided to
roll back this change, instead providing the following warning before
allowing such objects to fall back to the `lm`/`glm` tidier methods:

> Tidiers for objects of class {subclass} are not maintained by the
> broom team, and are only supported through the {dispatched_method}
> tidier method. Please be cautious in interpreting and reporting broom
> output."

In addition,

!begin-bullets-18!

-   !begin-bullet!
    Restores tidiers for `summary.lm` objects (`#953` by
    `@grantmcdermott`)
    !end-bullet!
-   !begin-bullet!
    Deprecate tidiers for the `lfe` package, which was archived from
    CRAN.
    !end-bullet!
-   !begin-bullet!
    Various bug fixes and improvements to documentation and errors.
    !end-bullet!

!end-bullets-18!

# broom 0.7.2

!begin-bullets-19!

-   !begin-bullet!
    Various bug fixes and improvements to documentation and errors.
    !end-bullet!

!end-bullets-19!

# broom 0.7.1

While broom 0.7.1 is a minor release, it includes a number of exciting
new features and bug fixes!

#### New tidiers

!begin-bullets-20!

-   !begin-bullet!
    Add tidiers for `margins` objects. (`#700` by `@grantmcdermott`)
    !end-bullet!
-   !begin-bullet!
    Added tidier methods for `mlogit` objects (`#887` by
    `@gregmacfarlane`)
    !end-bullet!
-   !begin-bullet!
    Add `glance.coeftest()` method (`#932` by `@grantmcdermott`)
    !end-bullet!

!end-bullets-20!

#### Improvements to existing tidiers

One of the more major improvements in this release is the addition of
the `interval` argument to some `augment` methods for confidence,
prediction, and credible intervals. These columns will be consistently
labeled `.lower` and `.upper`! (`#908` by `@grantmcdermott`, `#925` by
`@bwiernik`)

In addition...

!begin-bullets-21!

-   !begin-bullet!
    Extended the `glance.aov()` method to include an `r.squared` column!
    !end-bullet!
-   !begin-bullet!
    `glance.survfit()` now passes `...` to `summary.survfit()` to allow
    for adjustment of RMST and other measures (`#880` by
    `@vincentarelbundock`)
    !end-bullet!
-   !begin-bullet!
    Several unsupported model objects that subclass `glm` and `lm` now
    error more informatively.
    !end-bullet!
-   !begin-bullet!
    A number of improvements to documentation throughout the package.
    !end-bullet!

!end-bullets-21!

#### Bug fixes

!begin-bullets-22!

-   !begin-bullet!
    Fixed `newdata` warning message in `augment.*()` output when the
    `newdata` didn't contain the response variable---augment methods no
    longer expect the response variable in the supplied `newdata`
    argument. (`#897` by `@rudeboybert`)
    !end-bullet!
-   !begin-bullet!
    Fixed a bug related to `tidy.geeglm()` not being sensitive to the
    `exponentiate` argument (`#867`)
    !end-bullet!
-   !begin-bullet!
    Fixed `augment.fixest()` returning residuals in the `.fitted`
    column. The method also now takes a `type.residuals` argument and
    defaults to the same `type.predict` argument as the `fixest`
    `predict()` method. (`#877` by `@karldw`)
    !end-bullet!
-   !begin-bullet!
    Fix `tidy.felm` confidence interval bug. Replaces "robust" argument
    with "se.type". (`#919` by `@grantmcdermott`; supersedes `#818` by
    `@kuriwaki`)
    !end-bullet!
-   !begin-bullet!
    Fix a bug in `tidy.drc()` where some term labels would result in the
    overwriting of entries in the `curve` column (`#914`)
    !end-bullet!
-   !begin-bullet!
    Fixed bug related to univariate zoo series in `tidy.zoo()` (`#916`
    by `@WillemVervoort`)
    !end-bullet!
-   !begin-bullet!
    Fixed a bug related to `tidy.prcomp()` assigning the wrong PC labels
    from "loadings" and "scores" matrices (`#910` by `@tavareshugo`)
    !end-bullet!
-   !begin-bullet!
    Fixed `tidy.polr()` bug where p-values could only be returned if
    `exponentiate = FALSE`.
    !end-bullet!

!end-bullets-22!

#### Deprecations

We followed through with the planned deprecation of character vector
tidiers in this release. Other vector tidiers that were soft-deprecated
in 0.7.0 will be fully deprecated in a later release.

# broom 0.7.0

`broom 0.7.0` is a major release with a large number of new tidiers,
soft-deprecations, and planned hard-deprecations of functions and
arguments.

### Big picture changes

!begin-bullets-23!

-   !begin-bullet!
    We have changed how we report degrees of freedom for `lm` objects
    (#212, #273). This is especially important for instructors in
    statistics courses. Previously the `df` column in `glance.lm()`
    reported the rank of the design matrix. Now it reports degrees of
    freedom of the numerator for the overall F-statistic. This is equal
    to the rank of the model matrix minus one (unless you omit an
    intercept column), so the new `df` should be the old `df` minus one.

    !end-bullet!
-   !begin-bullet!
    We are moving away from supporting `summary.*()` objects. In
    particular, we have removed `tidy.summary.lm()` as part of a major
    overhaul of internals. Instead of calling `tidy()` on `summary`-like
    objects, please call `tidy()` directly on model objects moving
    forward.

    !end-bullet!
-   !begin-bullet!
    We have removed all support for the `quick` argument in `tidy()`
    methods. This is to simplify internals and is for maintainability
    purposes. We anticipate this will not influence many users as few
    people seemed to use it. If this majorly cramps your style, let us
    know, as we are considering a new verb to return only model
    parameters. In the meantime, `stats::coef()` together with
    `tibble::enframe()` provides most of the functionality of
    `tidy(..., quick = TRUE)`.

    !end-bullet!
-   !begin-bullet!
    All `conf.int` arguments now default to `FALSE`, and all
    `conf.level` arguments now default to `0.95`. This should primarily
    affect `tidy.survreg()`, which previously always returned confidence
    intervals, although there are some others.

    !end-bullet!
-   !begin-bullet!
    Tidiers for `emmeans`-objects use the arguments `conf.int` and
    `conf.level` instead of relying on the argument names native to the
    `emmeans::summary()`-methods (i.e., `infer` and `level`). Similarly,
    `multcomp`-tidiers now include a call to `summary()` as previous
    behavior was akin to setting the now removed argument
    `quick = TRUE`. Both families of tidiers now use the `adj.p.value`
    column name when appropriate. Finally, `emmeans`-, `multcomp`-, and
    `TukeyHSD`-tidiers now consistently use the column names `contrast`
    and `null.value` instead of `comparison`, `level1` and `level2`, or
    `lhs` and `rhs` (see #692).

    !end-bullet!

!end-bullets-23!

### Deprecations

This release of `broom` soft-deprecates the following functions and
tidier methods:

!begin-bullets-24!

-   !begin-bullet!
    Tidier methods for data frames, rowwise data frames, vectors and
    matrices
    !end-bullet!
-   !begin-bullet!
    `bootstrap()`
    !end-bullet!
-   !begin-bullet!
    `confint_tidy()`
    !end-bullet!
-   !begin-bullet!
    `fix_data_frame()`
    !end-bullet!
-   !begin-bullet!
    `finish_glance()`
    !end-bullet!
-   !begin-bullet!
    `augment.glmRob()`
    !end-bullet!
-   !begin-bullet!
    `tidy.table()` and `tidy.ftable()` have been deprecated in favor of
    `tibble::as_tibble()`
    !end-bullet!
-   !begin-bullet!
    `tidy.summaryDefault()` and `glance.summaryDefault()` have been
    deprecated in favor of `skimr::skim()`
    !end-bullet!

!end-bullets-24!

We have also gone forward with our planned mixed model deprecations, and
have removed the following methods, which now live in `broom.mixed`:

!begin-bullets-25!

-   !begin-bullet!
    `tidy.brmsfit()`
    !end-bullet!
-   !begin-bullet!
    `tidy.merMod()`, `glance.merMod()`, `augment.merMod()`
    !end-bullet!
-   !begin-bullet!
    `tidy.lme()`, `glance.lme()`, `augment.lme()`
    !end-bullet!
-   !begin-bullet!
    `tidy.stanreg()`, `glance.stanreg()`
    !end-bullet!
-   !begin-bullet!
    `tidyMCMC()`, `tidy.rjags()`, `tidy.stanfit()`
    !end-bullet!

!end-bullets-25!

### Minor breaking changes

!begin-bullets-26!

-   !begin-bullet!
    `augment.factanal()` now returns a tibble with columns names `.fs1`,
    `.fs2`, ..., instead of `factor1`, `factor2`, ... (#650)

    !end-bullet!
-   !begin-bullet!
    We have renamed the output of `augment.htest()`. In particular, we
    have renamed the `.residuals` column to `.resid` and the `.stdres`
    to `.std.resid` for consistency. These changes will only affect
    chi-squared tests.

    !end-bullet!
-   !begin-bullet!
    `tidy.ridgelm()` now always return a `GCV` column and never returns
    an `xm` column. (#533 by @jmuhlenkamp)

    !end-bullet!
-   !begin-bullet!
    `tidy.dist()` no longer supports the `upper` argument.

    !end-bullet!

!end-bullets-26!

## A refactoring of `augment()` methods

The internals of `augment.*()` methods have largely been overhauled.

!begin-bullets-27!

-   !begin-bullet!
    If you pass a dataset to `augment()` via the `data` or `newdata`
    arguments, you are now guaranteed that the augmented dataset will
    have exactly the same number of rows as the original dataset. This
    differs from previous behavior primarily when there are missing
    values. Previously `augment()` would drop rows containing `NA`. This
    should no longer be the case.

    !end-bullet!
-   !begin-bullet!
    `augment.*()` methods no longer accept an `na.action` argument.

    !end-bullet!
-   !begin-bullet!
    In previous versions, several `augment.*()` methods inherited the
    `augment.lm()` method, but required additions to the `augment.lm()`
    method itself. We have shifted away from this approach in favor of
    re-implementing many `augment.*()` methods as standalone methods
    making use of internal helper functions. As a result, `augment.lm()`
    and some related methods have deprecated (previously unused)
    arguments.

    !end-bullet!
-   !begin-bullet!
    `augment()` tries to give an informative error when `data` isn't the
    original training data.

    !end-bullet!
-   !begin-bullet!
    The `.resid` column in the output of `augment().*` methods is now
    consistently defined as `y - y_hat`

    !end-bullet!

!end-bullets-27!

## New tidiers

!begin-bullets-28!

-   !begin-bullet!
    `anova` objects from the `car` package (#754)
    !end-bullet!
-   !begin-bullet!
    `pam` objects from the `cluster` package (#637 by @abbylsmith)
    !end-bullet!
-   !begin-bullet!
    `drm` objects from the `drc` package (#574 by @edild)
    !end-bullet!
-   !begin-bullet!
    `summary_emm` objects from the `emmeans` package (#691 by @crsh)
    !end-bullet!
-   !begin-bullet!
    `epi.2by2` objects from the `epiR` package (#711)
    !end-bullet!
-   !begin-bullet!
    `fixest` objects from the `fixest` package (#785 by @karldw)
    !end-bullet!
-   !begin-bullet!
    `regsubsets` objects from the `leaps` package (#535)
    !end-bullet!
-   !begin-bullet!
    `lm.beta` objects from the `lm.beta` package (#545 by @mattle24)
    !end-bullet!
-   !begin-bullet!
    `rma` objects from the `metafor` package (#674 by @malcolmbarrett,
    @softloud)
    !end-bullet!
-   !begin-bullet!
    `mfx`, `logitmfx`, `negbinmfx`, `poissonmfx`, `probitmfx`, and
    `betamfx` objects from the`mfx` package (#700 by @grantmcdermott)
    !end-bullet!
-   !begin-bullet!
    `lmrob` and `glmrob` objects from the `robustbase` package (#205,
    #505)
    !end-bullet!
-   !begin-bullet!
    `sarlm` objects from the `spatialreg` package (#847 by
    @gregmacfarlane and @petrhrobar)
    !end-bullet!
-   !begin-bullet!
    `speedglm` objects from the `speedglm` package (#685)
    !end-bullet!
-   !begin-bullet!
    `svyglm` objects from the `survey` package (#611)
    !end-bullet!
-   !begin-bullet!
    `systemfit` objects from the `systemfit` package (by @jaspercooper)
    !end-bullet!
-   !begin-bullet!
    We have restored a simplified version of `glance.aov()`, which used
    to inherit from the `glance.lm()` method and now contains only the
    following columns: `logLik`, `AIC`, `BIC, deviance`, `df.residual`,
    and `nobs` (see #212). Note that `tidy.aov()` gives more complete
    information about degrees of freedom in an `aov` object.
    !end-bullet!

!end-bullets-28!

## Improvements to existing tidiers

!begin-bullets-29!

-   !begin-bullet!
    `tidy.felm()` now has a `robust = TRUE/FALSE` option that supports
    robust and cluster standard errors. (#781 by @kuriwaki)

    !end-bullet!
-   !begin-bullet!
    Make `.fitted` values respect `type.predict` argument of
    `augment.clm()`. (#617)

    !end-bullet!
-   !begin-bullet!
    Return factor rather than numeric class predictions in `.fitted` of
    `augment.polr()`. (#619) Add an option to return `p.values` in
    `tidy.polr()`. (#833 by @LukasWallrich)

    !end-bullet!
-   !begin-bullet!
    `tidy.kmeans()` now uses the names of the input variables in the
    output by default. Set `col.names = NULL` to recover the old
    behavior.

    !end-bullet!
-   !begin-bullet!
    Previously, F-statistics for weak instruments were returned through
    `glance.ivreg()`. F-statistics are now returned through
    `tidy.ivreg(instruments = TRUE)`. Default is
    `tidy.ivreg(instruments = FALSE)`. `glance.ivreg()` still returns
    Wu-Hausman and Sargan test statistics.

    !end-bullet!
-   !begin-bullet!
    `glance.biglm()` now returns a `df.residual` column.

    !end-bullet!
-   !begin-bullet!
    `tidy.prcomp()` argument `matrix` gained new options `"scores"`,
    `"loadings"`, and `"eigenvalues"`. (#557 by @GegznaV)

    !end-bullet!
-   !begin-bullet!
    `tidy_optim()` now provides the standard error if the Hessian is
    present. (#529 by @billdenney)

    !end-bullet!
-   !begin-bullet!
    `tidy.htest()` column names are now run through `make.names()` to
    ensure syntactic correctness. (#549 by @karissawhiting)

    !end-bullet!
-   !begin-bullet!
    `tidy.lmodel2()` now returns a `p.value` column. (#570)

    !end-bullet!
-   !begin-bullet!
    `tidy.lsmobj()` gained a `conf.int` argument for consistency with
    other tidiers.

    !end-bullet!
-   !begin-bullet!
    `tidy.polr()` now returns p-values if `p.values` is set to TRUE and
    the model does not contain factors with more than two levels.

    !end-bullet!
-   !begin-bullet!
    `tidy.zoo()` now doesn't change column names that have spaces or
    other special characters (previously they were converted to
    `data.frame` friendly column names by `make.names`.)

    !end-bullet!
-   !begin-bullet!
    `glance.lavaan()` now uses lavaan extractor functions instead of
    subsetting the fit object manually. (#835)

    !end-bullet!
-   !begin-bullet!
    `glance.lm()` no longer errors when only an intercept is provided as
    an explanatory variable. (#865)

    !end-bullet!

!end-bullets-29!

### Bug fixes

!begin-bullets-30!

-   !begin-bullet!
    Bug fix for `tidy.survreg()` when `robust` is set to `TRUE` in model
    fitting (#842, #728)
    !end-bullet!
-   !begin-bullet!
    Bug fixes in `glance.lavaan()`: address confidence interval error
    (#577) and correct reported `nobs` and `norig` (#835)
    !end-bullet!
-   !begin-bullet!
    Bug fix in muhaz tidiers to ensure output is always a `tibble`
    (#824)
    !end-bullet!
-   !begin-bullet!
    Several `glance.*()` methods have been refactored in order to return
    a one-row tibble even when the model matrix is rank-deficient (#823)
    !end-bullet!
-   !begin-bullet!
    Bug fix to return confidence intervals correct in `tidy.drc()`
    (#798)
    !end-bullet!
-   !begin-bullet!
    Added default methods for objects that subclass `glm` and `lm` in
    order to error more informatively. (#749, #736, #708, #186)
    !end-bullet!
-   !begin-bullet!
    Bug fix to allow `augment.kmeans()` to work with masked data (#609)
    !end-bullet!
-   !begin-bullet!
    Bug fix to allow `augment.Mclust()` to work on univariate data
    (#490)
    !end-bullet!
-   !begin-bullet!
    Bug fix to allow `tidy.htest()` to supports equal variances (#608)
    !end-bullet!
-   !begin-bullet!
    Bug fix to better allow `tidy.boot()` to support confidence
    intervals (#581)
    !end-bullet!
-   !begin-bullet!
    Bug fix for `tidy.polr()` when passed `conf.int = TRUE` (#498)
    !end-bullet!

!end-bullets-30!

### Other changes

!begin-bullets-31!

-   !begin-bullet!
    Many `glance()` methods now return a `nobs` column, which contains
    the number of data points used to fit the model! (#597 by
    @vincentarelbundock)

    !end-bullet!
-   !begin-bullet!
    `tidy()` no longer checks for a log or logit link when
    `exponentiate = TRUE`, and we have refactored to remove extraneous
    `exponentiate` arguments. If you set `exponentiate = TRUE`, we
    assume you know what you are doing and that you want exponentiated
    coefficients (and confidence intervals if `conf.int = TRUE`)
    regardless of link function.

    !end-bullet!
-   !begin-bullet!
    We now use `rlang::arg_match()` when possible instead of
    `arg.match()` to give more informative errors on argument
    mismatches.

    !end-bullet!
-   !begin-bullet!
    The package's site has moved from https://broom.tidyverse.org/ to
    https://broom.tidymodels.org/.

    !end-bullet!
-   !begin-bullet!
    Revised several vignettes and moved them to the tidymodels.org
    website. The existing vignettes will now simply link to the revised
    versions.

    !end-bullet!
-   !begin-bullet!
    Many improvements to consistency and clarity of documentation.

    !end-bullet!
-   !begin-bullet!
    Various warnings resulting from changes to the tidyr API in v1.0.0
    have been fixed. (#870)

    !end-bullet!
-   !begin-bullet!
    Removed dependencies on reshape2 and superseded functions in dplyr.

    !end-bullet!
-   !begin-bullet!
    All documentation now links to help files rather than topics.

    !end-bullet!

!end-bullets-31!

## For developers and contributors

!begin-bullets-32!

-   !begin-bullet!
    Moved core tests to the `modeltests` package.

    !end-bullet!
-   !begin-bullet!
    Generally, after this release, the broom dev team will first ask
    that attempts to add tidier methods supporting a model object are
    first directed to the model-owning package. An article describing
    best practices in doing so can be found on the {tidymodels} website
    at https://www.tidymodels.org/learn/develop/broom/, and we will
    continue adding additional resources to that article as we develop
    them. In the case that the maintainer is uninterested in taking on
    the tidier methods, please note this in your issue or PR.

    !end-bullet!
-   !begin-bullet!
    Added a new vignette discussing how to implement new tidier methods
    in non-broom packages.

    !end-bullet!

!end-bullets-32!

# broom 0.5.6

!begin-bullets-33!

-   !begin-bullet!
    Fix failing CRAN checks to due `tibble 3.0.0` release. Removed
    `xergm` dependency.
    !end-bullet!

!end-bullets-33!

# broom 0.5.5

!begin-bullets-34!

-   !begin-bullet!
    Remove tidiers for robust package and drop robust dependency
    (temporarily)
    !end-bullet!

!end-bullets-34!

# broom 0.5.4

!begin-bullets-35!

-   !begin-bullet!
    Fixes failing CRAN checks as the joineRML package has been removed
    from CRAN
    !end-bullet!

!end-bullets-35!

# broom 0.5.3

!begin-bullets-36!

-   !begin-bullet!
    Fixes failing CRAN checks due to new matrix classing in R 4.0.0
    !end-bullet!

!end-bullets-36!

# broom 0.5.2

!begin-bullets-37!

-   !begin-bullet!
    Fixes failing CRAN checks

    !end-bullet!
-   !begin-bullet!
    Changes to accommodate ergm 3.10 release. `tidy.ergm()` no longer
    has a `quick` argument. The old default of `quick = FALSE` is now
    the only option.

    !end-bullet!

!end-bullets-37!

# broom 0.5.1

!begin-bullets-38!

-   !begin-bullet!
    `tidy()`, `glance()` and `augment()` are now re-exported from the
    [generics](https://github.com/r-lib/generics) package.
    !end-bullet!

!end-bullets-38!

# broom 0.5.0

Tidiers now return `tibble::tibble()`s. This release also includes
several new tidiers, new vignettes and a large number of bug fixes.
We've also begun to more rigorously define tidier specifications: we've
laid part of the groundwork for stricter and more consistent tidying,
but the new tidier specifications are not yet complete. These will
appear in the next release.

Additionally, users should note that we are in the process of migrating
tidying methods for mixed models and Bayesian models to `broom.mixed`.
`broom.mixed` is not on CRAN yet, but all mixed model and Bayesian
tidiers will be deprecated once `broom.mixed` is on CRAN. No further
development of mixed model tidiers will take place in `broom`.

## Breaking changes

Almost all tidiers should now return `tibble`s rather than
`data.frame`s. Deprecated tidying methods, Bayesian and mixed model
tidiers still return `data.frame`s.

**Users** are mostly to experience issues when using `augment` in
situations where tibbles are stricter than data frames. For example,
specifying model covariates as a matrix object will now error:

!begin-codeblock!

``` r
library(broom)
library(quantreg)

fit <- rq(stack.loss ~ stack.x, tau = .5)
broom::augment(fit)
#> Error: Column `stack.x` must be a 1d atomic vector or a list
```

!end-codeblock!

This is because the default `data` argument `data = model.frame(fit)`
cannot be coerced to `tibble`.

Another consequence of this is that `augment.survreg` and
`augment.coxph` from the `survival` package now require that the user
explicitly passes data to either the `data` or `newdata` arguments.

These restrictions will be relaxed in an upcoming release of `broom`
pending support for matrix-columns in tibbles.

**Developers** are likely to experience issues:

!begin-bullets-39!

-   !begin-bullet!
    subsetting tibbles with `[`, which returns a tibble rather than a
    vector.

    !end-bullet!
-   !begin-bullet!
    setting rownames on tibbles, which is deprecated.

    !end-bullet!
-   !begin-bullet!
    using matrix and vector tidiers, now deprecated.

    !end-bullet!
-   !begin-bullet!
    handling the additional tibble classes `tbl_df` and `tbl` beyond the
    `data.frame` class

    !end-bullet!
-   !begin-bullet!
    linking to defunct documentation files -- broom recently moved all
    tidiers to a `roxygen2` template based documentation system.

    !end-bullet!

!end-bullets-39!

## New vignettes

This version of `broom` includes several new vignettes:

!begin-bullets-40!

-   !begin-bullet!
    `vignette("available-methods", package = "broom")` contains a table
    detailing which tidying methods are available

    !end-bullet!
-   !begin-bullet!
    `vignette("adding-tidiers", package = "broom")` is an *in-progress*
    guide for contributors on how to add new tidiers to broom

    !end-bullet!
-   !begin-bullet!
    `vignette("glossary", package = "broom")` contains tables describing
    acceptable argument names and column names for the *in-progress* new
    specification.

    !end-bullet!

!end-bullets-40!

Several old vignettes have also been updated:

!begin-bullets-41!

-   !begin-bullet!
    `vignette("bootstrapping", package = "broom")` now relies on the
    `rsample` package and a `tidyr::nest`-`purrr::map`-`tidyr::unnest`
    workflow. This is now the recommended workflow for working with
    multiple models, as opposed to the old `dplyr::rowwise`-`dplyr::do`
    based workflow.
    !end-bullet!

!end-bullets-41!

## Deprecations

!begin-bullets-42!

-   !begin-bullet!
    Matrix and vector tidiers have been deprecated in favor of
    `tibble::as_tibble` and `tibble::enframe`

    !end-bullet!
-   !begin-bullet!
    Dataframe tidiers and rowwise dataframe tidiers have been deprecated

    !end-bullet!
-   !begin-bullet!
    `bootstrap()` has been deprecated in favor of the
    [`rsample`](https://rsample.tidymodels.org/)

    !end-bullet!
-   !begin-bullet!
    `inflate` has been removed from `broom`

    !end-bullet!

!end-bullets-42!

## Other changes

!begin-bullets-43!

-   !begin-bullet!
    The `alpha` argument has been removed from `quantreg` tidy methods

    !end-bullet!
-   !begin-bullet!
    The `separate.levels` argument has been removed from
    `tidy.TukeyHSD`. To obtain the effect of `separate.levels = TRUE`,
    users may `tidyr::separate` after tidying. This is consistent with
    the `multcomp` tidier behavior.

    !end-bullet!
-   !begin-bullet!
    The `fe.error` argument was removed from `tidy.felm`. When fixed
    effects are tidier, their standard errors are now always included.

    !end-bullet!
-   !begin-bullet!
    The `diag` argument in `tidy.dist` has been renamed `diagonal`

    !end-bullet!
-   !begin-bullet!
    Advice to help beginners make PRs (#397 by @karldw)

    !end-bullet!
-   !begin-bullet!
    `glance` support for `arima` objects fit with `method = "CSS"` (#396
    by @josue-rodriguez)

    !end-bullet!
-   !begin-bullet!
    A bug fix to re-enable tidying `glmnet` objects with
    `family = multinomial` (#395 by @erleholgersen)

    !end-bullet!
-   !begin-bullet!
    A bug fix to allow tidying `quantreg` intercept only models (#378 by
    @erleholgersen)

    !end-bullet!
-   !begin-bullet!
    A bug fix for `aovlist` objects (#377 by @mvevans89)

    !end-bullet!
-   !begin-bullet!
    Support for `glmnetUtils` objects (#352 by @Hong-Revo)

    !end-bullet!
-   !begin-bullet!
    A bug fix to allow `tidy_emmeans` to handle column names with dashes
    (#351 by @bmannakee)

    !end-bullet!
-   !begin-bullet!
    `augment.felm` no longer returns `.fe_` and `.comp` columns

    !end-bullet!
-   !begin-bullet!
    Support saved formulas in `augment.felm` (#347 by @ShreyasSingh)

    !end-bullet!
-   !begin-bullet!
    `confint_tidy` now drops rows of all `NA` (#345 by @atyre2)

    !end-bullet!
-   !begin-bullet!
    A new tidier for `caret::confusionMatrix` objects (#344 by
    @mkuehn10)

    !end-bullet!
-   !begin-bullet!
    Tidiers for `Kendall::Kendall` objects (#343 by @cimentadaj)

    !end-bullet!
-   !begin-bullet!
    A new tidying method for `car::durbinWatsonTest` objects (#341 by
    @mkuehn10)

    !end-bullet!
-   !begin-bullet!
    `glance` throws an informative error for `quantreg:rq` models fit
    with multiple `tau` values (#338 by @bfgray3)

    !end-bullet!
-   !begin-bullet!
    `tidy.glmnet` gains the ability to retain zero-valued coefficients
    with a `return_zeros` argument that defaults to `FALSE` (#337 by
    @bfgray3)

    !end-bullet!
-   !begin-bullet!
    `tidy.manova` now retains a `Residuals` row (#334 by @jarvisc1)

    !end-bullet!
-   !begin-bullet!
    Tidiers for `ordinal::clm`, `ordinal::clmm`, `survey::svyolr` and
    `MASS::polr` ordinal model objects (#332 by @larmarange)

    !end-bullet!
-   !begin-bullet!
    Support for `anova` objects from `car::Anova` (#325 by @mariusbarth)

    !end-bullet!
-   !begin-bullet!
    Tidiers for `tseries::garch` models (#323 by @wilsonfreitas)

    !end-bullet!
-   !begin-bullet!
    Removed dependency on `psych` package (#313 by @nutterb)

    !end-bullet!
-   !begin-bullet!
    Improved error messages (#303 by @michaelweylandt)

    !end-bullet!
-   !begin-bullet!
    Compatibility with new `rstanarm` and `loo` packages (#298 by
    @jgabry)

    !end-bullet!
-   !begin-bullet!
    Support for tidying lists return by `irlba::irlba`

    !end-bullet!
-   !begin-bullet!
    A truly huge increase in unit tests (#267 by @dchiu911)

    !end-bullet!
-   !begin-bullet!
    Bug fix for `tidy.prcomp` when missing labels (#265 by @corybrunson)

    !end-bullet!
-   !begin-bullet!
    Added a `pkgdown` site at https://broom.tidyverse.org/ (#260 by
    @jayhesselberth)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `AER::ivreg` models (#247 by @hughjonesd)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for the `lavaan` package (#233 by @puterleat)

    !end-bullet!
-   !begin-bullet!
    Added `conf.int` argument to `tidy.coxph` (#220 by @larmarange)

    !end-bullet!
-   !begin-bullet!
    Added `augment` method for chi-squared tests (#138 by @larmarange)

    !end-bullet!
-   !begin-bullet!
    changed default se.type for `tidy.rq` to match that of
    `quantreg::summary.rq()` (#404 by @ethchr)

    !end-bullet!
-   !begin-bullet!
    Added argument `quick` for `tidy.plm` and `tidy.felm` (#502 and #509
    by @MatthieuStigler)

    !end-bullet!
-   !begin-bullet!
    Many small improvements throughout

    !end-bullet!

!end-bullets-43!

## Contributors

Many many thanks to all the following for their thoughtful comments on
design, bug reports and PRs! The community of broom contributors has
been kind, supportive and insightful and I look forward to working you
all again!

[@atyre2](https://github.com/atyre2),
[@batpigandme](https://github.com/batpigandme),
[@bfgray3](https://github.com/bfgray3),
[@bmannakee](https://github.com/bmannakee),
[@briatte](https://github.com/briatte),
[@cawoodjm](https://github.com/cawoodjm),
[@cimentadaj](https://github.com/cimentadaj),
[@dan87134](https://github.com/dan87134),
[@dgrtwo](https://github.com/dgrtwo),
[@dmenne](https://github.com/dmenne),
[@ekatko1](https://github.com/ekatko1),
[@ellessenne](https://github.com/ellessenne),
[@erleholgersen](https://github.com/erleholgersen),
[@ethchr](https://github.com/ethchr),
[@huftis](https://github.com/huftis),
[@IndrajeetPatil](https://github.com/IndrajeetPatil),
[@jacob-long](https://github.com/jacob-long),
[@jarvisc1](https://github.com/jarvisc1),
[@jenzopr](https://github.com/jenzopr),
[@jgabry](https://github.com/jgabry),
[@jimhester](https://github.com/jimhester),
[@josue-rodriguez](https://github.com/josue-rodriguez),
[@karldw](https://github.com/karldw),
[@kfeilich](https://github.com/kfeilich),
[@larmarange](https://github.com/larmarange),
[@lboller](https://github.com/lboller),
[@mariusbarth](https://github.com/mariusbarth),
[@michaelweylandt](https://github.com/michaelweylandt),
[@mine-cetinkaya-rundel](https://github.com/mine-cetinkaya-rundel),
[@mkuehn10](https://github.com/mkuehn10),
[@mvevans89](https://github.com/mvevans89),
[@nutterb](https://github.com/nutterb),
[@ShreyasSingh](https://github.com/ShreyasSingh),
[@stephlocke](https://github.com/stephlocke),
[@strengejacke](https://github.com/strengejacke),
[@topepo](https://github.com/topepo),
[@willbowditch](https://github.com/willbowditch),
[@WillemSleegers](https://github.com/WillemSleegers),
[@wilsonfreitas](https://github.com/wilsonfreitas), and
[@MatthieuStigler](https://github.com/MatthieuStigler)

# broom 0.4.4

!begin-bullets-44!

-   !begin-bullet!
    Fixed gam tidiers to work with "Gam" objects, due to an update in
    gam 1.15. This fixes failing CRAN tests

    !end-bullet!
-   !begin-bullet!
    Improved test coverage (thanks to #267 from Derek Chiu)

    !end-bullet!

!end-bullets-44!

# broom 0.4.3

!begin-bullets-45!

-   !begin-bullet!
    Changed the deprecated `dplyr::failwith` to `purrr::possibly`

    !end-bullet!
-   !begin-bullet!
    `augment` and `glance` on NULLs now return an empty data frame

    !end-bullet!
-   !begin-bullet!
    Deprecated the `inflate()` function in favor of `tidyr::crossing`

    !end-bullet!
-   !begin-bullet!
    Fixed confidence intervals in the gmm tidier (thanks to #242 from
    David Hugh-Jones)

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in bootstrap tidiers (thanks to #167 from Jeremy
    Biesanz)

    !end-bullet!
-   !begin-bullet!
    Fixed tidy.lm with `quick = TRUE` to return terms as character
    rather than factor (thanks to #191 from Matteo Sostero)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `ivreg` objects from the AER package (thanks to
    #245 from David Hugh-Jones)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `survdiff` objects from the survival package
    (thanks to #147 from Michał Bojanowski)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `emmeans` from the emmeans package (thanks to #252
    from Matthew Kay)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `speedlm` and `speedglm` from the speedglm package
    (#685, thanks to #248 from David Hugh-Jones)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `muhaz` objects from the muhaz package (thanks to
    #251 from Andreas Bender)

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `decompose` and `stl` objects from stats (thanks
    to #165 from Aaron Jacobs)

    !end-bullet!

!end-bullets-45!

# broom 0.4.2

!begin-bullets-46!

-   !begin-bullet!
    Added tidiers for `lsmobj` and `ref.grid` objects from the lsmeans
    package

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `betareg` objects from the betareg package

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `lmRob` and `glmRob` objects from the robust
    package

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `brms` objects from the brms package (thanks to
    #149 from Paul Buerkner)

    !end-bullet!
-   !begin-bullet!
    Fixed tidiers for orcutt 2.0

    !end-bullet!
-   !begin-bullet!
    Changed `tidy.glmnet` to filter out rows where estimate == 0.

    !end-bullet!
-   !begin-bullet!
    Updates to `rstanarm` tidiers (thanks to #177 from Jonah Gabry)

    !end-bullet!
-   !begin-bullet!
    Fixed issue with survival package 2.40-1 (thanks to #180 from Marcus
    Walz)

    !end-bullet!

!end-bullets-46!

# broom 0.4.1

!begin-bullets-47!

-   !begin-bullet!
    Added AppVeyor, codecov.io, and code of conduct

    !end-bullet!
-   !begin-bullet!
    Changed name of "NA's" column in summaryDefault output to "na"

    !end-bullet!
-   !begin-bullet!
    Fixed `tidy.TukeyHSD` to include `term` column. Also added
    `separate.levels` argument, with option to separate `comparison`
    into `level1` and `level2`

    !end-bullet!
-   !begin-bullet!
    Fixed `tidy.manova` to use correct column name for test (previously,
    always `pillai`)

    !end-bullet!
-   !begin-bullet!
    Added `kde_tidiers` to tidy kernel density estimates

    !end-bullet!
-   !begin-bullet!
    Added `orcutt_tidiers` to tidy the results of `cochrane.orcutt`
    orcutt package

    !end-bullet!
-   !begin-bullet!
    Added `tidy.dist` to tidy the distance matrix output of `dist` from
    the stats package

    !end-bullet!
-   !begin-bullet!
    Added `tidy` and `glance` for `lmodel2` objects from the lmodel2
    package

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `poLCA` objects from the poLCA package

    !end-bullet!
-   !begin-bullet!
    Added tidiers for sparse matrices from the Matrix package

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `prcomp` objects

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `Mclust` objects from the Mclust package

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `acf` objects

    !end-bullet!
-   !begin-bullet!
    Fixed to be compatible with dplyr 0.5, which is being submitted to
    CRAN

    !end-bullet!

!end-bullets-47!

# broom 0.4.0

!begin-bullets-48!

-   !begin-bullet!
    Added tidiers for geeglm, nlrq, roc, boot, bgterm, kappa, binWidth,
    binDesign, rcorr, stanfit, rjags, gamlss, and mle2 objects.

    !end-bullet!
-   !begin-bullet!
    Added `tidy` methods for lists, including u, d, v lists from `svd`,
    and x, y, z lists used by `image` and `persp`

    !end-bullet!
-   !begin-bullet!
    Added `quick` argument to `tidy.lm`, `tidy.nls`, and `tidy.biglm`,
    to create a smaller and faster version of the output.

    !end-bullet!
-   !begin-bullet!
    Changed `rowwise_df_tidiers` to allow the original data to be saved
    as a list column, then provided as a column name to `augment`. This
    required removing `data` from the `augment` S3 signature. Also added
    `tests-rowwise.R`

    !end-bullet!
-   !begin-bullet!
    Fixed various issues in ANOVA output

    !end-bullet!
-   !begin-bullet!
    Fixed various issues in lme4 output

    !end-bullet!
-   !begin-bullet!
    Fixed issues in tests caused by dev version of ggplot2

    !end-bullet!

!end-bullets-48!

# broom 0.3.7

!begin-bullets-49!

-   !begin-bullet!
    Added tidiers for "plm" (panel linear model) objects from the plm
    package.

    !end-bullet!
-   !begin-bullet!
    Added `tidy.coeftest` for coeftest objects from the lmtest package.

    !end-bullet!
-   !begin-bullet!
    Set up `tidy.lm` to work with "mlm" (multiple linear model) objects
    (those with multiple response columns).

    !end-bullet!
-   !begin-bullet!
    Added `tidy` and `glance` for "biglm" and "bigglm" objects from the
    biglm package.

    !end-bullet!
-   !begin-bullet!
    Fixed bug in `tidy.coxph` when one-row matrices are returned

    !end-bullet!
-   !begin-bullet!
    Added `tidy.power.htest`

    !end-bullet!
-   !begin-bullet!
    Added `tidy` and `glance` for `summaryDefault` objects

    !end-bullet!
-   !begin-bullet!
    Added tidiers for "lme" (linear mixed effects models) from the nlme
    package

    !end-bullet!
-   !begin-bullet!
    Added `tidy` and `glance` for `multinom` objects from the nnet
    package.

    !end-bullet!

!end-bullets-49!

# broom 0.3.6

!begin-bullets-50!

-   !begin-bullet!
    Fixed bug in `tidy.pairwise.htest`, which now can handle cases where
    the grouping variable is numeric.

    !end-bullet!
-   !begin-bullet!
    Added `tidy.aovlist` method. This added `stringr` package to IMPORTS
    to trim whitespace from the beginning and end of the `term` and
    `stratum` columns. This also required adjusting `tidy.aov` so that
    it could handle strata that are missing p-values.

    !end-bullet!
-   !begin-bullet!
    Set up `glance.lm` to work with `aov` objects along with `lm`
    objects.

    !end-bullet!
-   !begin-bullet!
    Added `tidy` and `glance` for matrix objects, with `tidy.matrix`
    converting a matrix to a data frame with rownames included, and
    `glance.matrix` returning the same result as `glance.data.frame`.

    !end-bullet!
-   !begin-bullet!
    Changed DESCRIPTION Authors@R to new format

    !end-bullet!

!end-bullets-50!

# broom 0.3.5

!begin-bullets-51!

-   !begin-bullet!
    Fixed small bug in `felm` where the `.fitted` and `.resid` columns
    were matrices rather than vectors.

    !end-bullet!
-   !begin-bullet!
    Added tidiers for `rlm` (robust linear model) and `gam` (generalized
    additive model) objects, including adjustments to "lm" tidiers in
    order to handle them. See `?rlm_tidiers` and `?gam_tidiers` for
    more.

    !end-bullet!
-   !begin-bullet!
    Removed rownames from `tidy.cv.glmnet` output

    !end-bullet!

!end-bullets-51!

# broom 0.3.4

!begin-bullets-52!

-   !begin-bullet!
    The behavior of `augment`, particularly with regard to missing data
    and the `na.exclude` argument, has through the use of the
    `augment_columns` function been made consistent across the following
    models:

    !begin-bullets-53!
    -   !begin-bullet!
        `lm`

        !end-bullet!
    -   !begin-bullet!
        `glm`

        !end-bullet!
    -   !begin-bullet!
        `nls`

        !end-bullet!
    -   !begin-bullet!
        `merMod` (`lme4`)

        !end-bullet!
    -   !begin-bullet!
        `survreg` (`survival`)

        !end-bullet!
    -   !begin-bullet!
        `coxph` (`survival`)

        !end-bullet!

    !end-bullets-53!
    !end-bullet!

!end-bullets-52!

Unit tests in `tests/testthat/test-augment.R` were added to ensure
consistency across these models.

!begin-bullets-54!

-   !begin-bullet!
    `tidy`, `augment` and `glance` methods were added for `rowwise_df`
    objects, and are set up to apply across their rows. This allows for
    simple patterns such as:
    !end-bullet!

!end-bullets-54!

regressions \<- mtcars %\>% group_by(cyl) %\>% do(mod = lm(mpg \~ wt,
.)) regressions %\>% tidy(mod) regressions %\>% augment(mod)

See `?rowwise_df_tidiers` for more.

!begin-bullets-55!

-   !begin-bullet!
    Added `tidy` and `glance` methods for `Arima` objects, and `tidy`
    for `pairwise.htest` objects.

    !end-bullet!
-   !begin-bullet!
    Fixes for CRAN: change package description to title case, removed
    NOTES, mostly by adding `globals.R` to declare global variables.

    !end-bullet!
-   !begin-bullet!
    This is the original version published on CRAN.

    !end-bullet!

!end-bullets-55!

# broom 0.3

!begin-bullets-56!

-   !begin-bullet!
    Tidiers have been added for S3 objects from the following packages:

    !begin-bullets-57!
    -   !begin-bullet!
        `lme4`

        !end-bullet!
    -   !begin-bullet!
        `glmnet`

        !end-bullet!
    -   !begin-bullet!
        `survival`

        !end-bullet!
    -   !begin-bullet!
        `zoo`

        !end-bullet!
    -   !begin-bullet!
        `felm`

        !end-bullet!
    -   !begin-bullet!
        `MASS` (`ridgelm` objects)

        !end-bullet!

    !end-bullets-57!
    !end-bullet!
-   !begin-bullet!
    `tidy` and `glance` methods for data.frames have also been added,
    and `augment.data.frame` produces an error (rather than returning
    the same data.frame).

    !end-bullet!
-   !begin-bullet!
    `stderror` has been changed to `std.error` (affects many functions)
    to be consistent with broom's naming conventions for columns.

    !end-bullet!
-   !begin-bullet!
    A function `bootstrap` has been added based on [this
    example](https://github.com/tidyverse/dplyr/issues/269), to perform
    the common use case of bootstrapping models.

    !end-bullet!

!end-bullets-56!

# broom 0.2

!begin-bullets-58!

-   !begin-bullet!
    Added "augment" S3 generic and various implementations. "augment"
    does something different from tidy: it adds columns to the original
    dataset, including predictions, residuals, or cluster assignments.
    This was originally described as "fortify" in ggplot2.

    !end-bullet!
-   !begin-bullet!
    Added "glance" S3 generic and various implementations. "glance"
    produces a *one-row* data frame summary, which is necessary for tidy
    outputs with values like R\^2 or F-statistics.

    !end-bullet!
-   !begin-bullet!
    Re-wrote intro broom vignette/README to introduce all three methods.

    !end-bullet!
-   !begin-bullet!
    Wrote a new kmeans vignette.

    !end-bullet!
-   !begin-bullet!
    Added tidying methods for multcomp, sp, and map objects (from
    fortify-multcomp, fortify-sp, and fortify-map from ggplot2).

    !end-bullet!
-   !begin-bullet!
    Because this integrates substantial amounts of ggplot2 code (with
    permission), added Hadley Wickham as an author in DESCRIPTION.

    !end-bullet!

!end-bullets-58!

# vetiver (development version)

!begin-bullets-1!

-   !begin-bullet!
    Added new `additional_pkgs` argument for writing plumber files
    (#271).
    !end-bullet!

!end-bullets-1!

# vetiver 0.2.5

!begin-bullets-2!

-   !begin-bullet!
    Fixed bug in generating plumber files (#257).
    !end-bullet!

!end-bullets-2!

# vetiver 0.2.4

!begin-bullets-3!

-   !begin-bullet!
    Fixed how plumber files are generated for `board_url()` (#241).
    !end-bullet!

!end-bullets-3!

# vetiver 0.2.3

!begin-bullets-4!

-   !begin-bullet!
    Updated test involving renv and rsconnect (#230).
    !end-bullet!

!end-bullets-4!

# vetiver 0.2.2

!begin-bullets-5!

-   !begin-bullet!
    Fixed a bug in where `vetiver_write_docker()` writes the renv
    lockfile (#212).

    !end-bullet!
-   !begin-bullet!
    Added new `/prototype` GET endpoint for a model's input data
    prototype (#220).

    !end-bullet!

!end-bullets-5!

# vetiver 0.2.1

!begin-bullets-6!

-   !begin-bullet!
    Added support for keras (#164), recipes (#179), and luz (#187,
    @dfalbel).

    !end-bullet!
-   !begin-bullet!
    Moved where `required_pkgs` metadata is stored remotely, from the
    binary blob to plain text YAML (#176).

    !end-bullet!
-   !begin-bullet!
    Added an optional renv lockfile that can be stored remotely in model
    metadata, with a new `check_renv` argument for reading/writing
    (#154, #192).

    !end-bullet!
-   !begin-bullet!
    Exposed a new `base_image` argument for creating Dockerfiles (#182).

    !end-bullet!
-   !begin-bullet!
    Added new `vetiver_deploy_sagemaker()` function plus
    `vetiver_endpoint_sagemaker()` and other needed functionality for
    deploying on Amazon SageMaker (#186, @DyfanJones).

    !end-bullet!
-   !begin-bullet!
    Added new additional GET endpoint for model `/metadata` (#194).

    !end-bullet!

!end-bullets-6!

# vetiver 0.2.0

## Breaking changes

!begin-bullets-7!

-   !begin-bullet!
    The arguments for dealing with a model's input data prototype have
    changed from using `ptype` to using `prototype` (#166):
    !begin-bullets-8!
    -   !begin-bullet!
        In `vetiver_model()`, now use `save_prototype`.
        !end-bullet!
    -   !begin-bullet!
        In `vetiver_api()`, now use `check_prototype`.
        !end-bullet!

    !end-bullets-8!
    !end-bullet!

!end-bullets-7!

## Other improvements

!begin-bullets-9!

-   !begin-bullet!
    Added support for k-Prototypes clustering from clustMixType (#163,
    thanks to @galen-ft).

    !end-bullet!
-   !begin-bullet!
    Now vendor renv directly in package (#157).

    !end-bullet!
-   !begin-bullet!
    Fixed how `vetiver_ptype()` finds predictors for models (`lm()` and
    `glm()`) with interactions (#160).

    !end-bullet!
-   !begin-bullet!
    New argument added to `vetiver_write_docker()` to pass in additional
    packages to be installed, such as `required_pkgs(board)` (#159).

    !end-bullet!
-   !begin-bullet!
    New function `vetiver_prepare_docker()` creates all necessary files
    to deploy a basic vetiver model via Docker (#165).

    !end-bullet!
-   !begin-bullet!
    Fixed a bug in handling all-`NA` columns when predicting on a
    `vetiver_endpoint()` (#169).

    !end-bullet!

!end-bullets-9!

# vetiver 0.1.8

!begin-bullets-10!

-   !begin-bullet!
    Trailing slashes are now removed from `vetiver_endpoint()` (#134).

    !end-bullet!
-   !begin-bullet!
    Added support for GAMs from mgcv (#135) and stacks (#138).

    !end-bullet!
-   !begin-bullet!
    Added `augment` method for vetiver endpoint (#141).

    !end-bullet!
-   !begin-bullet!
    Added `apt-get clean` to Dockerfile to reduce container size (#142,
    thanks to @csgillespie).

    !end-bullet!
-   !begin-bullet!
    Fixed bug where not all system requirements were added to the
    Dockerfile (#142, thanks to @csgillespie).

    !end-bullet!
-   !begin-bullet!
    Added bundle support for relevant models (#145).

    !end-bullet!
-   !begin-bullet!
    Fixed bug in generating Dockerfiles when explicitly requiring the
    stats package (#147).

    !end-bullet!

!end-bullets-10!

# vetiver 0.1.7

!begin-bullets-11!

-   !begin-bullet!
    Now pass the dots for writing a pin through to vetiver allowing, for
    example, `vetiver_pin_write(b, v, access_type = "all")` on RStudio
    Connect (#121, #122).

    !end-bullet!
-   !begin-bullet!
    `vetiver_pin_metrics()` now finds the `type` of the existing pin and
    updates with the same type (#122).

    !end-bullet!

!end-bullets-11!

# vetiver 0.1.6

!begin-bullets-12!

-   !begin-bullet!
    The lockfile created by `vetiver_write_docker()` can now be named
    via the argument `lockfile`, and its default is `vetiver_renv.lock`
    (#100).

    !end-bullet!
-   !begin-bullet!
    Switched the default for `overwrite` in `vetiver_pin_metrics()` from
    `TRUE` to `FALSE`. Using `FALSE` is a better choice for interactive
    use while `TRUE` is probably the right choice for reports or
    dashboards that are executed on a schedule (#104).

    !end-bullet!
-   !begin-bullet!
    Added an optional `EXPOSE PORT` line to the generated Dockerfile, to
    help out Docker Desktop users (#105).

    !end-bullet!
-   !begin-bullet!
    Added model monitoring dashboard template (#98). To knit the example
    vetiver monitoring dashboard, execute
    `vetiver::pin_example_kc_housing_model()` to set up demo model and
    metrics pins.

    !end-bullet!
-   !begin-bullet!
    The OpenAPI spec generated for a vetiver model now includes the
    model *version* when applicable.

    !end-bullet!
-   !begin-bullet!
    Added option to write a Plumber file without packages listed for
    RStudio Connect purposes (#112).

    !end-bullet!
-   !begin-bullet!
    Added new function `vetiver_create_rsconnect_bundle()` as an
    alternative deployment strategy (#113).

    !end-bullet!

!end-bullets-12!

# vetiver 0.1.5

!begin-bullets-13!

-   !begin-bullet!
    Add functions for model monitoring (#92).

    !end-bullet!
-   !begin-bullet!
    Update all URLs in package for new documentation sites.

    !end-bullet!

!end-bullets-13!

# vetiver 0.1.4

!begin-bullets-14!

-   !begin-bullet!
    Improve how Dockerfiles are generated.
    !end-bullet!

!end-bullets-14!

# vetiver 0.1.3

!begin-bullets-15!

-   !begin-bullet!
    Update all tests to use redaction for snapshots.

    !end-bullet!
-   !begin-bullet!
    Use ranger conditionally in examples/tests.

    !end-bullet!

!end-bullets-15!

# vetiver 0.1.2

!begin-bullets-16!

-   !begin-bullet!
    Generate Dockerfiles to deploy model (#71).

    !end-bullet!
-   !begin-bullet!
    Added support for glm (#75) and ranger (#76).

    !end-bullet!
-   !begin-bullet!
    Deprecated `vetiver_pr_predict()` in favor of using `vetiver_api()`
    (#77).

    !end-bullet!

!end-bullets-16!

# vetiver 0.1.1

!begin-bullets-17!

-   !begin-bullet!
    Added support for tidymodels (#51), caret (#52), and mlr3 (#56).

    !end-bullet!
-   !begin-bullet!
    Added vignette.

    !end-bullet!
-   !begin-bullet!
    Escalated parsing/conversion warnings to errors in
    `vetiver_type_convert()` (#60).

    !end-bullet!
-   !begin-bullet!
    Added `predict` method for `vetiver_model()` (in addition to
    `vetiver_endpoint()`) (#61).

    !end-bullet!
-   !begin-bullet!
    New function `vetiver_deploy_rsconnect()` to deploy to RStudio
    Connect.

    !end-bullet!
-   !begin-bullet!
    Added R Markdown template for Model Card for responsible,
    transparent model reporting (#62, #63).

    !end-bullet!
-   !begin-bullet!
    Modularized `vetiver_pr_predict()` to support more advanced use
    cases (#67).

    !end-bullet!

!end-bullets-17!

# vetiver 0.1.0

!begin-bullets-18!

-   !begin-bullet!
    Initial CRAN release of package.
    !end-bullet!

!end-bullets-18!

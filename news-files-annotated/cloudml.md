# cloudml (development version)

# cloudml 0.7.1

!begin-bullets-1!

-   !begin-bullet!
    Documentation updates for CRAN.
    !end-bullet!

!end-bullets-1!

# cloudml 0.7.0

!begin-bullets-2!

-   !begin-bullet!
    Support for Python 3 and TensorFlow 1.15 runtime.

    !end-bullet!
-   !begin-bullet!
    Fixed jobs hanging after error (#213).

    !end-bullet!

!end-bullets-2!

# cloudml 0.6.1

!begin-bullets-3!

-   !begin-bullet!
    Use ai-platform instead of ml-engine when user have a recent enought
    Google Cloud SDK.

    !end-bullet!
-   !begin-bullet!
    Added the `customCommands` flag in the `cloudml.yml` file to allow
    users to pass custom OS commands before packages installation. This
    could be used to install custom system dependencies.

    !end-bullet!

!end-bullets-3!

# cloudml 0.6.0

!begin-bullets-4!

-   !begin-bullet!
    Fixed `gcloud_install()` to properly execute `gcloud init` in
    RStudio terminal under Linux (#177).

    !end-bullet!
-   !begin-bullet!
    Default to the TensorFlow 1.9 runtime. Previous runtimes can be used
    through `runtimeVersion` in `config.yml`.

    !end-bullet!
-   !begin-bullet!
    Fixed `gs_rsync()` to avoid creating a local destination directory
    when destination uses remote storage (#172).

    !end-bullet!
-   !begin-bullet!
    Improved terminal support in Windows to launch by default correct
    shell.

    !end-bullet!

!end-bullets-4!

# cloudml 0.5.1

!begin-bullets-5!

-   !begin-bullet!
    Added support for `dry_run` in `cloudml_train`.

    !end-bullet!
-   !begin-bullet!
    Fixed CRAN results for cloudml.

    !end-bullet!
-   !begin-bullet!
    Fixed packrat package missing error (#168).

    !end-bullet!

!end-bullets-5!

# cloudml 0.5.0

!begin-bullets-6!

-   !begin-bullet!
    First release to CRAN.
    !end-bullet!

!end-bullets-6!

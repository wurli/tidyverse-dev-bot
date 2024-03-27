# tensorflow (development version)

!begin-bullets-1!

-   !begin-bullet!
    The package now Suggest 'keras3' instead of 'keras'
    !end-bullet!
-   !begin-bullet!
    `install_tensorflow()` installs TensorFlow v2.16 by default.
    !end-bullet!
-   !begin-bullet!
    If `install_tensorflow()` detects a GPU on Linux, it will
    automatically install the cuda package and configure required
    symlinks for cudnn.
    !end-bullet!

!end-bullets-1!

# tensorflow 2.15.0

!begin-bullets-2!

-   !begin-bullet!
    `install_tensorflow()` installs TensorFlow v2.15 by default
    !end-bullet!
-   !begin-bullet!
    Added compatibility with the latest release of reticulate (\> 1.34).
    !end-bullet!

!end-bullets-2!

# tensorflow 2.14.0

!begin-bullets-3!

-   !begin-bullet!
    `install_tensorflow()` changes:
    !begin-bullets-4!
    -   !begin-bullet!
        Installs TensorFlow v2.14 by default.
        !end-bullet!
    -   !begin-bullet!
        Now will automatically install the required Nvidia CUDA runtime
        as a pip package if on Linux and a GPU is detected. You can
        opt-out by passing `install_tensorflow(cuda = FALSE)`. Aside
        from the Nvidia driver, no other pre-existing Nvidia CUDA
        packages are now necessary.
        !end-bullet!
    -   !begin-bullet!
        The `configure_cudnn` argument is now superseded by the new
        argument `cuda`.
        !end-bullet!
    -   !begin-bullet!
        New argument `metal`, for specifying if the `tensorflow-metal`
        pip package should be installed on Arm Macs. Defaults to `TRUE`
        on Arm Macs.
        !end-bullet!

    !end-bullets-4!
    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `as.array()` and other methods might fail if
    the tensor had conversion disabled via `r_to_py()` or
    `convert = FALSE`.
    !end-bullet!
-   !begin-bullet!
    Fixed an issue where Ops group generic dispatch would error one
    object was a tensor and the other was a non-tensor Python object
    (e.g., a numpy array).
    !end-bullet!
-   !begin-bullet!
    Removed long deprecated symbols: `install_tensorflow_extras()`,
    `tfe_enable_eager_execution()`
    !end-bullet!
-   !begin-bullet!
    tfestimator generics `train()` and `train_and_evaluate()` now warn
    about their deprecation status when called. The will be removed in a
    future release.
    !end-bullet!

!end-bullets-3!

# tensorflow 2.13.0

!begin-bullets-5!

-   !begin-bullet!
    `install_tensorflow()` changes:
    !begin-bullets-6!
    -   !begin-bullet!
        Installs TensorFlow v2.13 by default now.
        !end-bullet!
    -   !begin-bullet!
        The `envname` argument new default is `"r-tensorflow"`. This
        means that unless the `envname` argument supplied,
        `install_tensorflow()` will now install into the
        `"r-tensorflow"` environment, bootstrapping a venv of that name
        if necessary.
        !end-bullet!
    -   !begin-bullet!
        gains a `new_env` argument. If `TRUE`, any existing environment
        specified by `envname` is deleted and created anew. Defaults to
        `TRUE` if envname is `"r-tensorflow"`, `FALSE` otherwise.
        !end-bullet!
    -   !begin-bullet!
        If running on Linux, now detects if NVIDIA GPUs on Linux are
        installed, and if so, and installs cuDNN (via pip), configures
        symlinks for tensorflow to find cuDNN, and emits additional
        instructions for how to install the necessary CUDA drivers to
        enable GPU usage. Set new arg `configure_cudnn = FALSE` to
        disable.
        !end-bullet!
    -   !begin-bullet!
        `pip_ignore_installed` default is now `FALSE` again.
        !end-bullet!
    -   !begin-bullet!
        On Arm Macs (M1/M2), the default tensorflow package is once
        again installed, rather than `tensorflow-macos` and
        `tensorflow-metal`.
        !end-bullet!

    !end-bullets-6!
    !end-bullet!
-   !begin-bullet!
    New `pillar:type_sum()` method for Tensors, giving a more
    informative printout of Tensors in R tracebacks and tibbles.
    !end-bullet!

!end-bullets-5!

# tensorflow 2.11.0

!begin-bullets-7!

-   !begin-bullet!
    `install_tensorflow()` now installs TF v2.11 by default.

    !end-bullet!
-   !begin-bullet!
    `as_tensor()` now coerces bare R atomic vectors to R arrays before
    conversion. As a consequence, by default, R atomic double vectors
    now coerce to 'float64' dtype tensors instead of 'float32'.

    !end-bullet!
-   !begin-bullet!
    `shape()` gains the ability to accept vectors of length \> 1 in
    `...`, including other `tf.TensorShape`s. Shapes are automatically
    flattened.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where a `ListWrapper` object of trackable keras
    layers (e.g., as part of a keras model) would not convert to an R
    list.

    !end-bullet!

!end-bullets-7!

# tensorflow 2.9.0

!begin-bullets-8!

-   !begin-bullet!
    Generic method updates:

    !begin-bullets-9!
    -   !begin-bullet!
        New methods: all(), any(), sum(), prod(), min(), max(), mean(),
        range(), cbind(), rbind(), t(), aperm(), sort(), as.vector(),
        as.character(), as.raster(), is.infinite(), is.finite(),
        is.nan()
        !end-bullet!
    -   !begin-bullet!
        `^` will now invoke `tf.square()` or `tf.sqrt()` directly when
        appropriate
        !end-bullet!
    -   !begin-bullet!
        `|`, `&`, and `!` now cast arguments to 'bool' dtype.
        !end-bullet!
    -   !begin-bullet!
        `print()` now shows 1d shapes without a trailing commas.
        !end-bullet!
    -   !begin-bullet!
        `str()` method for tensors now returns only a single compact
        line; `str()` on a list of tensors now does something sensible.
        !end-bullet!

    !end-bullets-9!
    !end-bullet!
-   !begin-bullet!
    `install_tensorflow()` now install TensorFlow 2.9 by default.

    !end-bullet!
-   !begin-bullet!
    `install_tensorflow()` no longer requires conda on Windows, now
    works in a regular venv.

    !end-bullet!
-   !begin-bullet!
    Comparing two partially-defined `TensorShape` now returns TRUE if
    each dimension matches. e.g.: `shape(NA, 4) == shape(NA, 4)` now
    returns TRUE, previously FALSE.

    !end-bullet!
-   !begin-bullet!
    Tensors with dtype 'string' now convert to R character vectors by
    methods `as.array()` and `as.matrix()`. (previously they converted
    to python.builtin.bytes, or an R list of python.builtin.bytes
    objects)

    !end-bullet!
-   !begin-bullet!
    `as_tensor()`:

    !begin-bullets-10!
    -   !begin-bullet!
        atomic R integer vectors now convert to 'int32', not 'int64'
        !end-bullet!
    -   !begin-bullet!
        casting between integer and floating dtypes is now done via
        `tf$dtypes$saturate_cast()` instead of `tf$cast()`.
        !end-bullet!
    -   !begin-bullet!
        `shape` argument now accepts a tensor.
        !end-bullet!
    -   !begin-bullet!
        fixed issue where expanding a scalar tensor to an nd-array with
        `shape` provided as a tensor would raise an error.
        !end-bullet!

    !end-bullets-10!
    !end-bullet!
-   !begin-bullet!
    `tf.SparseTensor` objects now inherit from `"tensorflow.tensor"`.

    !end-bullet!

!end-bullets-8!

# tensorflow 2.8.0

!begin-bullets-11!

-   !begin-bullet!
    Updated default Tensorflow version installed by
    `install_tensorflow()` to 2.8.

    !end-bullet!
-   !begin-bullet!
    `as_tensor()` gains a `shape` argument, can be used to fill or
    reshape tensors. Scalars can be recycled to a tensor of arbitrary
    `shape`, otherwise supplied objects are reshaped using row-major
    (C-style) semantics.

    !end-bullet!
-   !begin-bullet!
    `install_tensorflow()` now provides experimental support for Arm
    Macs, with the following restrictions:

    !begin-bullets-12!
    -   !begin-bullet!
        "conda" is the only supported installation method.
        !end-bullet!
    -   !begin-bullet!
        requests for non-default or older tensorflow versions are not
        supported.
        !end-bullet!

    !end-bullets-12!
    !end-bullet!
-   !begin-bullet!
    `install_tensorflow()` default conda_python_version changes from 3.7
    to NULL.

    !end-bullet!
-   !begin-bullet!
    `tf.TensorShape()`'s gain `format()` and `print()` S3 methods.

    !end-bullet!
-   !begin-bullet!
    `[` method for slicing tensors now accepts `NA` as a synonym for a
    missing or `NULL` spec. For example `x[NA:3]` is now valid,
    equivalent to `x[:3]` in Python.

    !end-bullet!

!end-bullets-11!

# tensorflow 2.7.0

!begin-bullets-13!

-   !begin-bullet!
    Default Tensorflow version installed by `install_tensorflow()`
    updated to 2.7

    !end-bullet!
-   !begin-bullet!
    Breaking changes:

    !begin-bullets-14!
    -   !begin-bullet!
        `shape()` now returns a `tf.TensorShape()` object (Previously an
        R-list of `NULL`s or integers).
        !end-bullet!
    -   !begin-bullet!
        `[` method for `tf.TensorShape()` objects also now returns a
        `tf.TensorShape()`. Use `[[`, `as.numeric`, `as.integer`, and/or
        `as.list` to convert to R objects.
        !end-bullet!
    -   !begin-bullet!
        `length()` method for `tensorflow.tensor` now returns
        `NA_integer_` for tensors with not fully defined shapes.
        (previously a zero length integer vector).
        !end-bullet!
    -   !begin-bullet!
        `dim()` method for `tensorflow.tensor` now returns an R integer
        vector with `NA` for dimensions that are undefined. (previously
        an R list with `NULL` for undefined dimension)
        !end-bullet!

    !end-bullets-14!
    !end-bullet!
-   !begin-bullet!
    New S3 generics for `tf.TensorShape()`'s: `c`, `length`, `[<-`,
    `[[<-`, `merge`, `==`, `!=`, `as_tensor()`, `as.list`, `as.integer`,
    `as.numeric`, `as.double`, `py_str` (joining previous generics `[`
    and `[[`). See `?shape` for extended examples.

    !end-bullet!
-   !begin-bullet!
    Ops S3 generics for `tensorflow.tensor`s that take two arguments now
    automatically cast a supplied non-tensor to the dtype of the
    supplied tensor that triggered the S3 dispatch. Casting is done via
    `as_tensor()`. e.g., this now works:
    `as_tensor(5L) - 2     # now returns tf.Tensor(3, shape=(), dtype=int32)`
    previously it would raise an error:
    `` TypeError: `x` and `y` must have the same dtype, got tf.int32 != tf.float32 ``
    Generics that now do autocasting: +, -, \*, /, %/%, %%, \^, &, \|,
    ==, !=, \<, \<=, \>, \>=

    !end-bullet!
-   !begin-bullet!
    `install_tensorflow()`: new argument with default
    `pip_ignore_installed = TRUE`. This ensures that all Tensorflow
    dependencies like Numpy are installed by pip rather than conda.

    !end-bullet!
-   !begin-bullet!
    A message with the Tensorflow version is now shown when the python
    module is loaded, e.g: "Loaded Tensorflow version 2.6.0"

    !end-bullet!

!end-bullets-13!

# tensorflow 2.6.0

!begin-bullets-15!

-   !begin-bullet!
    Updated default Tensorflow version to 2.6.

    !end-bullet!
-   !begin-bullet!
    Changed default in `tf_function()` to `autograph=TRUE`.

    !end-bullet!
-   !begin-bullet!
    Added S3 generic `as_tensor()`.

    !end-bullet!
-   !begin-bullet!
    tfautograph added to Imports

    !end-bullet!
-   !begin-bullet!
    jsonlite removed from Imports, tfestimators removed from Suggests

    !end-bullet!
-   !begin-bullet!
    Refactored `install_tensorflow()`.

    !begin-bullets-16!
    -   !begin-bullet!
        Potentially breaking change: numeric versions supplied without a
        patchlevel now automatically pull the latest patch release.
        (e.g. `install_tensorflow(version="2.4")` will install
        `"2.4.2"`. Previously it would install "2.4.0")
        !end-bullet!

    !end-bullets-16!
    !end-bullet!
-   !begin-bullet!
    Removed "Config/reticulate" declaration from DESCRIPTION.

    !begin-bullets-17!
    -   !begin-bullet!
        Setting `RETICULATE_AUTOCONFIGURE=FALSE` environment variable
        when using non-default tensorflow installations (e.g.,
        'tensorflow-cpu') no longer required.
        !end-bullet!
    -   !begin-bullet!
        Users will have to call `install_tensorflow()` for automatic
        installation.
        !end-bullet!

    !end-bullets-17!
    !end-bullet!
-   !begin-bullet!
    Refactored automated tests to closer match the default installation
    procedure and compute environment of most user.

    !end-bullet!
-   !begin-bullet!
    Expanded CI test coverage to include R devel, oldrel and 3.6.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where extra packages with version constraints like
    `install_tensorflow(extra_packages = "Pillow<8.3")` were not quoted
    properly.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where valid tensor-like objects supplied to
    `log(x, base)`, `cospi()`, `tanpi()`, and `sinpi()` would raise an
    error.

    !end-bullet!

!end-bullets-15!

# tensorflow 2.5.0

!begin-bullets-18!

-   !begin-bullet!
    Updated default Tensorflow version to 2.5.
    !end-bullet!
-   !begin-bullet!
    Added support for additional arguments in `tf_function()` (e.g.,
    `jit_compile`)
    !end-bullet!
-   !begin-bullet!
    Added support for `expm1` S3 generic.
    !end-bullet!
-   !begin-bullet!
    `tfe_enable_eager_execution` is deprecated. Eager mode has been the
    default since TF version 2.0.
    !end-bullet!
-   !begin-bullet!
    Improved error message in `tf_config()` on unsuccessful
    installation.
    !end-bullet!

!end-bullets-18!

# tensorflow 2.4.0

!begin-bullets-19!

-   !begin-bullet!
    Fixed error with `use_session_with_seed` (#428)
    !end-bullet!
-   !begin-bullet!
    Added a new `set_random_seed` function that makes more sense for
    TensorFlow \>= 2.0 (#442)
    !end-bullet!
-   !begin-bullet!
    Updated the default version of TensorFlow to 2.4 as well as the
    default Python to 3.7 (#454)
    !end-bullet!

!end-bullets-19!

# TensorFlow 2.2.0 (CRAN)

!begin-bullets-20!

-   !begin-bullet!
    Bugfix with `all_dims` (#398)

    !end-bullet!
-   !begin-bullet!
    Indexing for TensorShape & `py_to_r` conversion (#379, #388)

    !end-bullet!

!end-bullets-20!

# TensorFlow 2.0.0 (CRAN)

!begin-bullets-21!

-   !begin-bullet!
    Upgraded default installed version to 2.0.0.

    !end-bullet!
-   !begin-bullet!
    Tensorboard log directory path fixes (#360).

    !end-bullet!
-   !begin-bullet!
    Allow for `v1` and `v2` compat (#358).

    !end-bullet!
-   !begin-bullet!
    `install_tensorflow` now does not installs `tfprobability`, `tfhub`
    and other related packages.

    !end-bullet!

!end-bullets-21!

# TensorFlow 1.14.1 (CRAN)

!begin-bullets-22!

-   !begin-bullet!
    Upgraded default installed version to 1.14.0

    !end-bullet!
-   !begin-bullet!
    Refactored the `install_tensorflow` code delegating to `reticulate`
    (#333, #341): We completely delegate to installation to
    `reticulate::py_install`, the main difference is that now the
    default environment name to install is `r-reticulate` and not
    `r-tensorflow`.

    !end-bullet!

!end-bullets-22!

# TensorFlow 1.13.1 (CRAN)

!begin-bullets-23!

-   !begin-bullet!
    added option to silence TF CPP info output

    !end-bullet!
-   !begin-bullet!
    `tf_gpu_configured` function to check if GPU was correctly

    !end-bullet!

!end-bullets-23!

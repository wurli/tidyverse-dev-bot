# keras3 (development version)

!begin-bullets-1!

-   !begin-bullet!
    New `op_subset()` and `x@r[...]` methods enable tensor subsetting
    using R's `[` semantics and idioms.

    !end-bullet!
-   !begin-bullet!
    New subset assignment methods implemented for tensors:
    `op_subset(x, ...) <- value` and `x@r[...] <- value`

    !end-bullet!
-   !begin-bullet!
    Breaking changes: All operations prefixed with `op_` now return
    1-based indices by default. The following functions that return or
    consume indices have changed: `op_argmax()`, `op_argmin()`,
    `op_top_k()`, `op_argpartition()`, `op_searchsorted()`,
    `op_argsort()`, `op_digitize()`, `op_nonzero()`, `op_split()`,
    `op_trace()`, `op_swapaxes()`, `op_ctc_decode()`, `op_ctc_loss()`,
    `op_one_hot()`, `op_arange()`

    !end-bullet!
-   !begin-bullet!
    `op_arange()` now matches the semantics of `base::seq()`. By default
    it starts, includes the end value, and automatically infers step
    direction.

    !end-bullet!
-   !begin-bullet!
    `op_one_hot()` now infers `num_classes` if supplied a factor.

    !end-bullet!
-   !begin-bullet!
    `op_hstack()` and `op_vstack()` now accept arguments passed via
    `...`.

    !end-bullet!
-   !begin-bullet!
    `application_decode_predictions()` now returns a processed data
    frame by default or a decoder function if predictions are missing.

    !end-bullet!
-   !begin-bullet!
    `application_preprocess_inputs()` returns a preprocessor function if
    inputs are missing.

    !end-bullet!
-   !begin-bullet!
    Various new examples added to documentation, including
    `op_scatter()`, `op_switch()`, and `op_nonzero()`.

    !end-bullet!
-   !begin-bullet!
    New `x@py[...]` accessor introduced for Python-style 0-based
    indexing of tensors.

    !end-bullet!
-   !begin-bullet!
    New `Summary` group generic method for `keras_shape`, enabling usage
    like `prod(shape(3, 4))`

    !end-bullet!
-   !begin-bullet!
    `KERAS_HOME` is now set to `tools::R_user_dir("keras3", "cache")` if
    `~/.keras` does not exist and `KERAS_HOME` is unset.

    !end-bullet!
-   !begin-bullet!
    new `op_convert_to_array()` to convert a tensor to an R array.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `op_shape()` would sometimes return a
    TensorFlow `TensorShape`

    !end-bullet!
-   !begin-bullet!
    Fixes for `metric_iou()`, `op_top_k()`, and `op_eye()` being called
    with R atomic doubles

    !end-bullet!

!end-bullets-1!

# keras3 1.3.0

!begin-bullets-2!

-   !begin-bullet!
    Keras now uses `reticulate::py_require()` to resolve Python
    dependencies. Calling `install_keras()` is no longer required (but
    is still supported).

    !end-bullet!
-   !begin-bullet!
    `use_backend()` gains a `gpu` argument, to specify if a GPU-capable
    set of dependencies should be resolved by `py_require()`.

    !end-bullet!
-   !begin-bullet!
    The progress bar in `fit()`, `evaluate()` and `predict()` now
    defaults to not presenting during testthat tests.

    !end-bullet!
-   !begin-bullet!
    `dotty::.` is now reexported.

    !end-bullet!
-   !begin-bullet!
    `%*%` now dispatches to `op_matmul()` for tensorflow tensors, which
    has relaxed shape constraints compared to `tf$matmul()`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where calling a `Metric` and `Loss` object with
    unnamed arguments would error.

    !end-bullet!

!end-bullets-2!

## Added compatibility with Keras v3.8.0. User-facing changes:

!begin-bullets-3!

-   !begin-bullet!
    New symbols:
    !begin-bullets-4!
    -   !begin-bullet!
        `activation_sparse_plus()`
        !end-bullet!
    -   !begin-bullet!
        `activation_sparsemax()`
        !end-bullet!
    -   !begin-bullet!
        `activation_threshold()`
        !end-bullet!
    -   !begin-bullet!
        `layer_equalization()`
        !end-bullet!
    -   !begin-bullet!
        `layer_mix_up()`
        !end-bullet!
    -   !begin-bullet!
        `layer_rand_augment()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_color_degeneration()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_color_jitter()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_grayscale()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_hue()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_posterization()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_saturation()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_sharpness()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_shear()`
        !end-bullet!
    -   !begin-bullet!
        `op_diagflat()`
        !end-bullet!
    -   !begin-bullet!
        `op_sparse_plus()`
        !end-bullet!
    -   !begin-bullet!
        `op_sparsemax()`
        !end-bullet!
    -   !begin-bullet!
        `op_threshold()`
        !end-bullet!
    -   !begin-bullet!
        `op_unravel_index()`
        !end-bullet!

    !end-bullets-4!
    !end-bullet!
-   !begin-bullet!
    Add argument axis to tversky loss
    !end-bullet!
-   !begin-bullet!
    New: ONNX model export with `export_savedmodel()`
    !end-bullet!
-   !begin-bullet!
    Doc improvements and bug fixes.
    !end-bullet!
-   !begin-bullet!
    JAX specific changes: Add support for JAX named scope
    !end-bullet!
-   !begin-bullet!
    TensorFlow specific changes: Make `random_shuffle()` XLA compilable
    !end-bullet!

!end-bullets-3!

## Added compatibility with Keras v3.7.0. User-facing changes:

### New functions

#### Activations

!begin-bullets-5!

-   !begin-bullet!
    `activation_celu()`
    !end-bullet!
-   !begin-bullet!
    `activation_glu()`
    !end-bullet!
-   !begin-bullet!
    `activation_hard_shrink()`
    !end-bullet!
-   !begin-bullet!
    `activation_hard_tanh()`
    !end-bullet!
-   !begin-bullet!
    `activation_log_sigmoid()`
    !end-bullet!
-   !begin-bullet!
    `activation_soft_shrink()`
    !end-bullet!
-   !begin-bullet!
    `activation_squareplus()`
    !end-bullet!
-   !begin-bullet!
    `activation_tanh_shrink()`
    !end-bullet!

!end-bullets-5!

#### Configuration

!begin-bullets-6!

-   !begin-bullet!
    `config_disable_flash_attention()`
    !end-bullet!
-   !begin-bullet!
    `config_enable_flash_attention()`
    !end-bullet!
-   !begin-bullet!
    `config_is_flash_attention_enabled()`
    !end-bullet!

!end-bullets-6!

#### Layers and Initializers

!begin-bullets-7!

-   !begin-bullet!
    `initializer_stft()`
    !end-bullet!
-   !begin-bullet!
    `layer_max_num_bounding_boxes()`
    !end-bullet!
-   !begin-bullet!
    `layer_stft_spectrogram()`
    !end-bullet!

!end-bullets-7!

#### Losses and Metrics

!begin-bullets-8!

-   !begin-bullet!
    `loss_circle()`
    !end-bullet!
-   !begin-bullet!
    `metric_concordance_correlation()`
    !end-bullet!
-   !begin-bullet!
    `metric_pearson_correlation()`
    !end-bullet!

!end-bullets-8!

#### Operations

!begin-bullets-9!

-   !begin-bullet!
    `op_celu()`
    !end-bullet!
-   !begin-bullet!
    `op_exp2()`
    !end-bullet!
-   !begin-bullet!
    `op_glu()`
    !end-bullet!
-   !begin-bullet!
    `op_hard_shrink()`
    !end-bullet!
-   !begin-bullet!
    `op_hard_tanh()`
    !end-bullet!
-   !begin-bullet!
    `op_ifft2()`
    !end-bullet!
-   !begin-bullet!
    `op_inner()`
    !end-bullet!
-   !begin-bullet!
    `op_soft_shrink()`
    !end-bullet!
-   !begin-bullet!
    `op_squareplus()`
    !end-bullet!
-   !begin-bullet!
    `op_tanh_shrink()`
    !end-bullet!

!end-bullets-9!

#### New arguments

!begin-bullets-10!

-   !begin-bullet!
    `callback_backup_and_restore()`: Added `double_checkpoint` argument
    to save a fallback checkpoint
    !end-bullet!
-   !begin-bullet!
    `callback_tensorboard()`: Added support for `profile_batch` argument
    !end-bullet!
-   !begin-bullet!
    `layer_group_query_attention()`: Added `flash_attention` and `seed`
    arguments
    !end-bullet!
-   !begin-bullet!
    `layer_multi_head_attention()`: Added `flash_attention` argument
    !end-bullet!
-   !begin-bullet!
    `metric_sparse_top_k_categorical_accuracy()`: Added
    `from_sorted_ids` argument
    !end-bullet!

!end-bullets-10!

### Performance improvements

!begin-bullets-11!

-   !begin-bullet!
    Added native Flash Attention support for GPU (via cuDNN) and TPU
    (via Pallas kernel) in JAX backend

    !end-bullet!
-   !begin-bullet!
    Added opt-in native Flash Attention support for GPU in PyTorch
    backend

    !end-bullet!
-   !begin-bullet!
    Enabled additional kernel fusion via bias_add in TensorFlow backend

    !end-bullet!
-   !begin-bullet!
    Added support for Intel XPU devices in PyTorch backend

    !end-bullet!
-   !begin-bullet!
    `install_keras()` changes: if a GPU is available, the default is now
    to install a CPU build of TensorFlow and a GPU build of JAX. To use
    a GPU in the current session, call `use_backend("jax")`.

    !end-bullet!

!end-bullets-11!

## Added compatibility with Keras v3.6.0. User-facing changes:

#### Breaking changes:

!begin-bullets-12!

-   !begin-bullet!
    When using `get_file()` with `extract = TRUE` or `untar = TRUE`, the
    return value is now the path of the extracted directory, rather than
    the path of the archive.
    !end-bullet!

!end-bullets-12!

#### Other changes and additions:

!begin-bullets-13!

-   !begin-bullet!
    Logging is now asynchronous in `fit()`, `evaluate()`, and
    `predict()`. This enables 100% compact stacking of `train_step`
    calls on accelerators (e.g. when running small models on TPU).

    !begin-bullets-14!
    -   !begin-bullet!
        If you are using custom callbacks that rely on `on_batch_end`,
        this will disable async logging. You can re-enable it by adding
        `self$async_safe <- TRUE` to your callbacks. Note that the
        TensorBoard callback is not considered async-safe by default.
        Default callbacks like the progress bar are async-safe.
        !end-bullet!

    !end-bullets-14!
    !end-bullet!
-   !begin-bullet!
    New bitwise operations:

    !begin-bullets-15!
    -   !begin-bullet!
        `op_bitwise_and()`
        !end-bullet!
    -   !begin-bullet!
        `op_bitwise_invert()`
        !end-bullet!
    -   !begin-bullet!
        `op_bitwise_left_shift()`
        !end-bullet!
    -   !begin-bullet!
        `op_bitwise_not()`
        !end-bullet!
    -   !begin-bullet!
        `op_bitwise_or()`
        !end-bullet!
    -   !begin-bullet!
        `op_bitwise_right_shift()`
        !end-bullet!
    -   !begin-bullet!
        `op_bitwise_xor()`
        !end-bullet!

    !end-bullets-15!
    !end-bullet!
-   !begin-bullet!
    New math operations:

    !begin-bullets-16!
    -   !begin-bullet!
        `op_logdet()`
        !end-bullet!
    -   !begin-bullet!
        `op_trunc()`
        !end-bullet!
    -   !begin-bullet!
        `op_histogram()`
        !end-bullet!

    !end-bullets-16!
    !end-bullet!
-   !begin-bullet!
    New neural network operation: `op_dot_product_attention()`

    !end-bullet!
-   !begin-bullet!
    New image preprocessing layers:

    !begin-bullets-17!
    -   !begin-bullet!
        `layer_auto_contrast()`
        !end-bullet!
    -   !begin-bullet!
        `layer_solarization()`
        !end-bullet!

    !end-bullets-17!
    !end-bullet!
-   !begin-bullet!
    New Model functions `get_state_tree()` and `set_state_tree()`, for
    retrieving all model variables, including trainable, non-trainable,
    optimizer variables, and metric variables.

    !end-bullet!
-   !begin-bullet!
    New `layer_pipeline()` for composing a sequence of layers. This
    class is useful for building a preprocessing pipeline. Compared to a
    `keras_model_sequential()`, `layer_pipeline()` has a few key
    differences:

    !begin-bullets-18!
    -   !begin-bullet!
        It's not a Model, just a plain layer.
        !end-bullet!
    -   !begin-bullet!
        When the layers in the pipeline are compatible with `tf.data`,
        the pipeline will also remain `tf.data` compatible, regardless
        of the backend you use.
        !end-bullet!

    !end-bullets-18!
    !end-bullet!
-   !begin-bullet!
    New argument: `export_savedmodel(verbose = )`

    !end-bullet!
-   !begin-bullet!
    New argument: `op_normalize(epsilon = )`

    !end-bullet!
-   !begin-bullet!
    Various documentation improvements and bug fixes.

    !end-bullet!

!end-bullets-13!

# keras3 1.2.0

!begin-bullets-19!

-   !begin-bullet!
    Added compatibility with Keras v3.5.0. User facing changes:

    !begin-bullets-20!
    -   !begin-bullet!
        New functions:
        !begin-bullets-21!
        -   !begin-bullet!
            `op_associative_scan()`
            !end-bullet!
        -   !begin-bullet!
            `op_searchsorted()`
            !end-bullet!
        -   !begin-bullet!
            `optimizer_lamb()`
            !end-bullet!

        !end-bullets-21!
        !end-bullet!
    -   !begin-bullet!
        `keras$DTypePolicy` instances can now be supplied to `dtype`
        argument for losses, metrics, and layers.
        !end-bullet!
    -   !begin-bullet!
        Add integration with the Hugging Face Hub. You can now save
        models to Hugging Face Hub directly `save_model()` and load
        .keras models directly from Hugging Face Hub with
        `load_model()`.
        !end-bullet!
    -   !begin-bullet!
        Added compatibility with NumPy 2.0.
        !end-bullet!
    -   !begin-bullet!
        Improved `keras$distribution` API support for very large models.
        !end-bullet!
    -   !begin-bullet!
        Bug fixes and performance improvements.
        !end-bullet!
    -   !begin-bullet!
        Add `data_format` argument to `layer_zero_padding_1d()` layer.
        !end-bullet!
    -   !begin-bullet!
        Miscellaneous documentation improvements.
        !end-bullet!
    -   !begin-bullet!
        Bug fixes and performance improvements.
        !end-bullet!

    !end-bullets-20!
    !end-bullet!

!end-bullets-19!

# keras3 1.1.0

!begin-bullets-22!

-   !begin-bullet!
    Fixed issue where GPUs would not be found when running on Windows
    under WSL Linux. (reported in #1456, fixed in #1459)

    !end-bullet!
-   !begin-bullet!
    `keras_shape` objects (as returned by `keras3::shape()`) gain `==`
    and `!=` methods.

    !end-bullet!
-   !begin-bullet!
    Fixed warning from `tfruns::training_run()` being unable to log
    optimizer learning rate.

    !end-bullet!
-   !begin-bullet!
    Added compatibility with Keras v3.4.1 (no R user facing changes).

    !end-bullet!
-   !begin-bullet!
    Added compatibility with Keras v3.4.0. User facing changes:

    !begin-bullets-23!
    -   !begin-bullet!
        New functions:
        !begin-bullets-24!
        -   !begin-bullet!
            `op_argpartition()`
            !end-bullet!
        -   !begin-bullet!
            `op_map()`
            !end-bullet!
        -   !begin-bullet!
            `op_scan()`
            !end-bullet!
        -   !begin-bullet!
            `op_switch()`
            !end-bullet!
        -   !begin-bullet!
            `op_dtype()`
            !end-bullet!
        -   !begin-bullet!
            `op_lstsq()`
            !end-bullet!
        -   !begin-bullet!
            `op_image_hsv_to_rgb()`
            !end-bullet!
        -   !begin-bullet!
            `op_image_rgb_to_hsv()`
            !end-bullet!

        !end-bullets-24!
        !end-bullet!
    -   !begin-bullet!
        Changes:
        !begin-bullets-25!
        -   !begin-bullet!
            Added support for arbitrary, deeply nested input/output
            structures in Functional models (e.g. lists of lists of
            lists of inputs or outputs...)
            !end-bullet!
        -   !begin-bullet!
            Add support for `optional` Functional inputs.
            !begin-bullets-26!
            -   !begin-bullet!
                `keras_input()` gains an `optional` argument.
                !end-bullet!
            -   !begin-bullet!
                `keras_model_sequential()` gains a `input_optional`
                argument.
                !end-bullet!

            !end-bullets-26!
            !end-bullet!
        -   !begin-bullet!
            Add support for `float8` inference for `Dense` and
            `EinsumDense` layers.
            !end-bullet!
        -   !begin-bullet!
            Enable `layer_feature_space()` to be used in a
            `{tfdatasets}` pipeline even when the backend isn't
            TensorFlow.
            !end-bullet!
        -   !begin-bullet!
            `layer_string_lookup()` can now take `tf$SparseTensor()` as
            input.
            !end-bullet!
        -   !begin-bullet!
            `layer_string_lookup()` returns `"int64"` dtype by default
            in more modes now.
            !end-bullet!
        -   !begin-bullet!
            `Layer()` instances gain attributes `path` and
            `quantization_mode`.
            !end-bullet!
        -   !begin-bullet!
            `Metric()$variables` is now recursive.
            !end-bullet!
        -   !begin-bullet!
            Add `training` argument to `Model$compute_loss()`.
            !end-bullet!
        -   !begin-bullet!
            `split_dataset()` now supports nested structures in dataset.
            !end-bullet!
        -   !begin-bullet!
            All applications gain a `name` argument, accept a custom
            name.
            !end-bullet!
        -   !begin-bullet!
            `layer_multi_head_attention()` gains a `seed` argument.
            !end-bullet!
        -   !begin-bullet!
            All losses gain a `dtype` argument.
            !end-bullet!
        -   !begin-bullet!
            `loss_dice()` gains an `axis` argument.
            !end-bullet!
        -   !begin-bullet!
            `op_ctc_decode()`, new default for `mask_index = 0`
            !end-bullet!
        -   !begin-bullet!
            All `op_image_*` functions now use default `data_format`
            value to `config_image_data_format()`
            !end-bullet!
        -   !begin-bullet!
            `op_isclose()` gains arguments `rtol`, `atol`, `equal_nan`.
            !end-bullet!
        -   !begin-bullet!
            `save_model()` gains argument `zipped`.
            !end-bullet!
        -   !begin-bullet!
            Bugs fixes and performance improvements.
            !end-bullet!

        !end-bullets-25!
        !end-bullet!

    !end-bullets-23!
    !end-bullet!

!end-bullets-22!

# keras3 1.0.0

!begin-bullets-27!

-   !begin-bullet!
    Chains of `layer_*` calls with `|>` now instantiate layers in the
    same order as `%>%` pipe chains: left-hand-side first (#1440).

    !end-bullet!
-   !begin-bullet!
    `iterate()`, `iter_next()` and `as_iterator()` are now reexported
    from reticulate.

    !end-bullet!

!end-bullets-27!

User facing changes with upstream Keras v3.3.3:

!begin-bullets-28!

-   !begin-bullet!
    new functions: `op_slogdet()`, `op_psnr()`

    !end-bullet!
-   !begin-bullet!
    `clone_model()` gains new args: `call_function`, `recursive` Updated
    example usage.

    !end-bullet!
-   !begin-bullet!
    `op_ctc_decode()` strategy argument has new default: `"greedy"`.
    Updated docs.

    !end-bullet!
-   !begin-bullet!
    `loss_ctc()` default name fixed, changed to `"ctc"`

    !end-bullet!

!end-bullets-28!

User facing changes with upstream Keras v3.3.2:

!begin-bullets-29!

-   !begin-bullet!
    new function: `op_ctc_decode()`

    !end-bullet!
-   !begin-bullet!
    new function: `op_eigh()`

    !end-bullet!
-   !begin-bullet!
    new function: `op_select()`

    !end-bullet!
-   !begin-bullet!
    new function: `op_vectorize()`

    !end-bullet!
-   !begin-bullet!
    new function: `op_image_rgb_to_grayscale()`

    !end-bullet!
-   !begin-bullet!
    new function: `loss_tversky()`

    !end-bullet!
-   !begin-bullet!
    new args:
    `layer_resizing(pad_to_aspect_ratio, fill_mode, fill_value)`

    !end-bullet!
-   !begin-bullet!
    new arg: `layer_embedding(weights)` for providing an initial weights
    matrix

    !end-bullet!
-   !begin-bullet!
    new args: `op_nan_to_num(nan, posinf, neginf)`

    !end-bullet!
-   !begin-bullet!
    new args:
    `op_image_resize(crop_to_aspect_ratio, pad_to_aspect_ratio, fill_mode, fill_value)`

    !end-bullet!
-   !begin-bullet!
    new args: `op_argmax(keepdims)` and `op_argmin(keepdims)`

    !end-bullet!
-   !begin-bullet!
    new arg: `clear_session(free_memory)` for clearing without invoking
    the garbage collector.

    !end-bullet!
-   !begin-bullet!
    `metric_kl_divergence()` and `loss_kl_divergence()` clip inputs
    (`y_true` and `y_pred`) to the `[0, 1]` range.

    !end-bullet!
-   !begin-bullet!
    new `Layer()` attributes: `metrics`, `dtype_policy`

    !end-bullet!
-   !begin-bullet!
    Added initial support for float8 training

    !end-bullet!
-   !begin-bullet!
    `layer_conv_*d()` layers now support LoRa

    !end-bullet!
-   !begin-bullet!
    `op_digitize()` now supports sparse tensors.

    !end-bullet!
-   !begin-bullet!
    Models and layers now return owned metrics recursively.

    !end-bullet!
-   !begin-bullet!
    Add pickling support for Keras models. (e.g., via
    `reticulate::py_save_object()`) Note that pickling is not
    recommended, prefer using Keras saving APIs.

    !end-bullet!

!end-bullets-29!

# keras3 0.2.0

New functions:

!begin-bullets-30!

-   !begin-bullet!
    `quantize_weights()`: quantize model or layer weights in-place.
    Currently, only `Dense`, `EinsumDense`, and `Embedding` layers are
    supported (which is enough to cover the majority of transformers
    today)

    !end-bullet!
-   !begin-bullet!
    `layer_mel_spectrogram()`

    !end-bullet!
-   !begin-bullet!
    `layer_flax_module_wrapper()`

    !end-bullet!
-   !begin-bullet!
    `layer_jax_model_wrapper()`

    !end-bullet!
-   !begin-bullet!
    `loss_dice()`

    !end-bullet!
-   !begin-bullet!
    `random_beta()`

    !end-bullet!
-   !begin-bullet!
    `random_binomial()`

    !end-bullet!
-   !begin-bullet!
    `config_set_backend()`: change the backend after Keras has
    initialized.

    !end-bullet!
-   !begin-bullet!
    `config_dtype_policy()`

    !end-bullet!
-   !begin-bullet!
    `config_set_dtype_policy()`

    !end-bullet!
-   !begin-bullet!
    New Ops

    !begin-bullets-31!
    -   !begin-bullet!
        `op_custom_gradient()`
        !end-bullet!
    -   !begin-bullet!
        `op_batch_normalization()`
        !end-bullet!
    -   !begin-bullet!
        `op_image_crop()`
        !end-bullet!
    -   !begin-bullet!
        `op_divide_no_nan()`
        !end-bullet!
    -   !begin-bullet!
        `op_normalize()`
        !end-bullet!
    -   !begin-bullet!
        `op_correlate()`
        !end-bullet!
    -   !begin-bullet!
        \`
        !end-bullet!

    !end-bullets-31!
    !end-bullet!
-   !begin-bullet!
    New family of linear algebra ops

    !begin-bullets-32!
    -   !begin-bullet!
        `op_cholesky()`
        !end-bullet!
    -   !begin-bullet!
        `op_det()`
        !end-bullet!
    -   !begin-bullet!
        `op_eig()`
        !end-bullet!
    -   !begin-bullet!
        `op_inv()`
        !end-bullet!
    -   !begin-bullet!
        `op_lu_factor()`
        !end-bullet!
    -   !begin-bullet!
        `op_norm()`
        !end-bullet!
    -   !begin-bullet!
        `op_erfinv()`
        !end-bullet!
    -   !begin-bullet!
        `op_solve_triangular()`
        !end-bullet!
    -   !begin-bullet!
        `op_svd()`
        !end-bullet!

    !end-bullets-32!
    !end-bullet!
-   !begin-bullet!
    `audio_dataset_from_directory()`, `image_dataset_from_directory()`
    and `text_dataset_from_directory()` gain a `verbose` argument
    (default `TRUE`)

    !end-bullet!
-   !begin-bullet!
    `image_dataset_from_directory()` gains `pad_to_aspect_ratio`
    argument (default `FALSE`)

    !end-bullet!
-   !begin-bullet!
    `to_categorical()`, `op_one_hot()`, and `fit()` can now accept R
    factors, offset them to be 0-based (reported in `#1055`).

    !end-bullet!
-   !begin-bullet!
    `op_convert_to_numpy()` now returns unconverted NumPy arrays.

    !end-bullet!
-   !begin-bullet!
    `op_array()` and `op_convert_to_tensor()` no longer error when
    casting R doubles to integer types.

    !end-bullet!
-   !begin-bullet!
    `export_savedmodel()` now works with a Jax backend.

    !end-bullet!
-   !begin-bullet!
    `Metric()$add_variable()` method gains arg: `aggregration`.

    !end-bullet!
-   !begin-bullet!
    `Layer()$add_weight()` method gains args: `autocast`, `regularizer`,
    `aggregation`.

    !end-bullet!
-   !begin-bullet!
    `op_bincount()`, `op_multi_hot()`, `op_one_hot()`, and
    `layer_category_encoding()` now support sparse tensors.

    !end-bullet!
-   !begin-bullet!
    `op_custom_gradient()` now supports the PyTorch backend

    !end-bullet!
-   !begin-bullet!
    `layer_lstm()` and `layer_gru()` gain arg `use_cudnn`, default
    `'auto'`.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `application_preprocess_inputs()` would error
    if supplied an R array as input.

    !end-bullet!
-   !begin-bullet!
    Doc improvements.

    !end-bullet!

!end-bullets-30!

# keras3 0.1.0

!begin-bullets-33!

-   !begin-bullet!
    The package has been rebuilt for Keras 3.0. Refer to
    https://blogs.rstudio.com/ai/posts/2024-05-21-keras3/ for an
    overview and https://keras3.posit.co for the current up-to-date
    documentation.
    !end-bullet!

!end-bullets-33!

# keras 2.13.0

!begin-bullets-34!

-   !begin-bullet!
    Default TF version installed by `install_keras()` is now 2.13.

    !end-bullet!
-   !begin-bullet!
    Updated layers:

    !begin-bullets-35!
    -   !begin-bullet!
        `layer_batch_normalization()` updated signature, with changes to
        options for distributed training.
        !end-bullet!
    -   !begin-bullet!
        `layer_embedding()` gains a `sparse` argument.
        !end-bullet!

    !end-bullets-35!
    !end-bullet!
-   !begin-bullet!
    Fixed deadlock when an R generator was passed to `fit()`,
    `predict()`, and other endpoints.

    !end-bullet!
-   !begin-bullet!
    When `fit(verbose = "auto")` is evaluated in the context of a knitr
    document (e.g., quarto or rmarkdown document being rendered),
    verbose will now default to `2`, showing one line per epoch.

    !end-bullet!

!end-bullets-34!

# keras 2.11.1

!begin-bullets-36!

-   !begin-bullet!
    Update S3 method formals per new CRAN requirement
    (`r_to_py.keras_layer_wrapper()`)

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `get_file()` would place incorrectly save files
    in the current working directory. (#1365)

    !end-bullet!

!end-bullets-36!

# keras 2.11.0

!begin-bullets-37!

-   !begin-bullet!
    Default TensorFlow version installed by `install_keras()` is now
    2.11.

    !end-bullet!
-   !begin-bullet!
    All optimizers have been updated for keras/tensorflow version 2.11.
    Arguments to all the optimizers have changed. To access the previous
    optimizer implementations, use the constructors available at
    `keras$optimizers$legacy`. For example, use
    `keras$optimizers$legacy$Adam()` for the previous implementation of
    `optimizer_adam()`.

    !end-bullet!
-   !begin-bullet!
    New optimizer `optimizer_frtl()`.

    !end-bullet!
-   !begin-bullet!
    updates to layers:

    !begin-bullets-38!
    -   !begin-bullet!
        `layer_attention()` gains `score_mode` and `dropout` arguments.
        !end-bullet!
    -   !begin-bullet!
        `layer_discretization()` gains `output_mode` and `sparse`
        arguments.
        !end-bullet!
    -   !begin-bullet!
        `layer_gaussian_dropout()` and `layer_gaussian_noise()` gain a
        `seed` argument.
        !end-bullet!
    -   !begin-bullet!
        `layer_hashing()` gains `output_mode` and `sparse` arguments.
        !end-bullet!
    -   !begin-bullet!
        `layer_integer_lookup()` gains `vocabulary_dtype` and
        `idf_weights` arguments.
        !end-bullet!
    -   !begin-bullet!
        `layer_normalization()` gains an `invert` argument.
        !end-bullet!
    -   !begin-bullet!
        `layer_string_lookup()` gains an `idf_weights` argument.
        !end-bullet!

    !end-bullets-38!
    !end-bullet!
-   !begin-bullet!
    Fixed issue where `input_shape` supplied to custom layers defined
    with `new_layer_class()` would result in an error (#1338)

    !end-bullet!
-   !begin-bullet!
    New `callback_backup_and_restore()`, for resuming an interrupted
    `fit()` call.

    !end-bullet!
-   !begin-bullet!
    The merging family of layers (`layer_add`, `layer_concatenate`,
    etc.) gain the ability to accept layers in `...`, allowing for
    easier composition of residual blocks with the pipe `%>%`.
    e.g. something like this now works:

    !begin-codeblock!
    ``` r
    block_1_output <- ...
    block_2_output <- block_1_output %>%
      layer_conv_2d(64, 3, activation = "relu", padding = "same") %>%
      layer_add(block_1_output)
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    `model$get_config()` method now returns an R object that can be
    safely serialized to rds.

    !end-bullet!
-   !begin-bullet!
    `keras_array()` now reflects unconverted Python objects. This
    enables passing objects like `pandas.Series()` to `fit()` and
    `evaluate()` methods. (#1341)

    !end-bullet!

!end-bullets-37!

# keras 2.9.0

!begin-bullets-39!

-   !begin-bullet!
    New functions for constructing custom keras subclasses:

    !begin-bullets-40!
    -   !begin-bullet!
        `new_model_class()`
        !end-bullet!
    -   !begin-bullet!
        `new_layer_class()`
        !end-bullet!
    -   !begin-bullet!
        `new_callback_class()`
        !end-bullet!
    -   !begin-bullet!
        `new_metric_class()`
        !end-bullet!
    -   !begin-bullet!
        `new_loss_class()`
        !end-bullet!
    -   !begin-bullet!
        `new_learning_rate_schedule_class()`.
        !end-bullet!

    !end-bullets-40!
    Also provided is `mark_active()`, a decorator for indicating a class
    method should be an active binding (i.e., decorated with Python's
    `@property`). `mark_active()` can be used in the `new_*_class`
    family of class constructors as well as `%py_class%`.

    !end-bullet!
-   !begin-bullet!
    `r_to_py()` method for R6 classes and `%py_class%` gain support for
    `private` fields and methods. Any R objects stored in `private` will
    only be available to methods, and will not be converted to Python.

    !end-bullet!
-   !begin-bullet!
    New family of functions for controlling optimizer learning rates
    during training:

    !begin-bullets-41!
    -   !begin-bullet!
        `learning_rate_schedule_cosine_decay()`
        !end-bullet!
    -   !begin-bullet!
        `learning_rate_schedule_cosine_decay_restarts()`
        !end-bullet!
    -   !begin-bullet!
        `learning_rate_schedule_exponential_decay()`
        !end-bullet!
    -   !begin-bullet!
        `learning_rate_schedule_inverse_time_decay()`
        !end-bullet!
    -   !begin-bullet!
        `learning_rate_schedule_piecewise_constant_decay()`
        !end-bullet!
    -   !begin-bullet!
        `learning_rate_schedule_polynomial_decay()`
        !end-bullet!

    !end-bullets-41!
    Also, a function for constructing custom learning rate schedules:
    `new_learning_rate_schedule_class()`.

    !end-bullet!
-   !begin-bullet!
    New L2 unit normilization layer: `layer_unit_normalization()`.

    !end-bullet!
-   !begin-bullet!
    New `regularizer_orthogonal`, a regularizer that encourages
    orthogonality between the rows (or columns) or a weight matrix.

    !end-bullet!
-   !begin-bullet!
    New `zip_lists()` function for transposing lists, optionally
    matching by name.

    !end-bullet!
-   !begin-bullet!
    New `plot()` S3 method for models.

    !end-bullet!
-   !begin-bullet!
    `pydot` is now included in the packages installed by
    `install_keras()`.

    !end-bullet!
-   !begin-bullet!
    The `png` package is now listed under Suggests.

    !end-bullet!
-   !begin-bullet!
    The `%<>%` assignment pipe from magrittr is exported.

    !end-bullet!
-   !begin-bullet!
    `format()` method for keras models (and derivative methods
    `print()`, `summary()`, `str()`, and `py_str()`):

    !begin-bullets-42!
    -   !begin-bullet!
        gain a new arg `compact`. If `TRUE` (the default) white-space
        only lines are stripped out of `model.summary()`.
        !end-bullet!
    -   !begin-bullet!
        If any layers are marked non-trainable or frozen, the model
        summary now includes a "Trainable" column, indicating if a layer
        is frozen.
        !end-bullet!

    !end-bullets-42!
    !end-bullet!
-   !begin-bullet!
    `freeze_weights()` and `unfreeze_weights()`:

    !begin-bullets-43!
    -   !begin-bullet!
        gain a flexible `which` argument that can accept layer names (as
        character strings), an integer vector, a boolean vector, or a
        function that returns a boolean when called with a layer. (see
        updated examples in `?freeze_weights`
        !end-bullet!
    -   !begin-bullet!
        `from` and `to` arguments gain the ability to accept negative
        integers, to specify layers counting from the end of the layers
        list.
        !end-bullet!

    !end-bullets-43!
    !end-bullet!
-   !begin-bullet!
    `get_weights()` gains a `trainable` argument that can accept `TRUE`
    or `FALSE`, allowing for returning only the unfrozen or frozen
    weights, respectively.

    !end-bullet!
-   !begin-bullet!
    `timeseries_dataset_from_array()`:

    !begin-bullets-44!
    -   !begin-bullet!
        R arrays are now cast to the floatx dtype ("float32" by default)
        !end-bullet!
    -   !begin-bullet!
        `start_index` and `end_index` now are 1-based.
        !end-bullet!

    !end-bullets-44!
    !end-bullet!
-   !begin-bullet!
    `image_dataset_from_directory()` gains a `crop_to_aspect_ratio`
    argument which can be used to prevent distorting images when
    resizing to a new aspect ratio.

    !end-bullet!
-   !begin-bullet!
    `Layer` is deprecated, superseded by `new_layer_class()`.

    !end-bullet!
-   !begin-bullet!
    `load_model_tf()` argument `custom_objects` gains the ability to
    accept an unnamed list (e.g, of objects returned by
    `new_layer_class()` or similar). Appropriate names for the supplied
    objects are automatically inferred.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where negative values less than -1 supplied to `axis`
    arguments were selecting the wrong axis.

    !end-bullet!
-   !begin-bullet!
    `get_layer()` gains the ability to accept negative values for the
    `index` argument.

    !end-bullet!
-   !begin-bullet!
    Fixed warning from `create_layer_wrapper()` when the custom layer
    didn't have an overridden `initialize` or `__init__` method.

    !end-bullet!
-   !begin-bullet!
    Backend functions:

    !begin-bullets-45!
    -   !begin-bullet!
        k_clip() `min_value` and `max_value` gain default values of
        `NULL`, can be omitted. `NULL` is taken as -Inf or Inf,
        respectively.
        !end-bullet!
    -   !begin-bullet!
        k_squeeze(): `axis` argument can be omitted, in which case all
        axes of size 1 are dropped.
        !end-bullet!
    -   !begin-bullet!
        k_tile(): `n` argument can now be supplied as a tensor.
        !end-bullet!
    -   !begin-bullet!
        New function `k_unstack()`.
        !end-bullet!

    !end-bullets-45!
    !end-bullet!
-   !begin-bullet!
    KerasTensor objects (e.g, returned by `layer_input()`) now inherit
    S3 methods for `"tensorflow.tensor"`.

    !end-bullet!
-   !begin-bullet!
    `plot.keras_training_history()` no longer issues message
    `` `geom_smooth()` using formula 'y ~ x' `` when
    `method = "ggplot2"`.

    !end-bullet!
-   !begin-bullet!
    `print` and related methods for models (`format`, `summary`) now
    accept a `width` argument.

    !end-bullet!
-   !begin-bullet!
    `evaluate()`, `fit()`, and `predict()` methods for keras Models now
    default to `verbose = "auto"`, with verbosity adjusted appropriately
    based on calls to `keras$utils$disable_interactive_logging()`, and
    contexts like `ParameterServerStrategy`.

    !end-bullet!
-   !begin-bullet!
    `install_keras()` now accepts `version = "release-cpu"` as a valid
    specification.

    !end-bullet!

!end-bullets-39!

# keras 2.8.0

!begin-bullets-46!

-   !begin-bullet!
    Breaking change: The semantics of passing a named list to
    `keras_model()` have changed.

    Previously, `keras_model()` would `unname()` supplied `inputs` and
    `outputs`. Then, if a named list was passed to subsequent
    `fit()`/`evaluate()`/`call()`/`predict()` invocations, matching of
    `x` and `y` was done to the model's input and outpt `tensor$name`'s.
    Now, matching is done to `names()` of `inputs` and/or `outputs`
    supplied to `keras_model()`. Call `unname()` on `inputs` and
    `outputs` to restore the old behavior, e.g.:
    `keras_model(unname(inputs), unname(outputs))`

    `keras_model()` can now accept a named list for multi-input and/or
    multi-output models. The named list is converted to a `dict` in
    python. (Requires Tensorflow \>= 2.4, Python \>= 3.7).

    If `inputs` is a named list:

    !begin-bullets-47!
    -   !begin-bullet!
        `call()`, `fit()`, `evaluate()`, and `predict()` methods can
        also accept a named list for `x`, with names matching to the
        names of `inputs` when the model was constructed. Positional
        matching of `x` is still also supported (requires python 3.7+).
        !end-bullet!

    !end-bullets-47!
    If `outputs` is a named list:

    !begin-bullets-48!
    -   !begin-bullet!
        `fit()` and `evaluate()` methods can *only* accept a named list
        for `y`, with names matching to the names of `outputs` when the
        model was constructed.
        !end-bullet!

    !end-bullets-48!
    !end-bullet!
-   !begin-bullet!
    New layer `layer_depthwise_conv_1d()`.

    !end-bullet!
-   !begin-bullet!
    Models gain `format()` and `print()` S3 methods for compatibility
    with the latest reticulate. Both are powered by `model$summary()`.

    !end-bullet!
-   !begin-bullet!
    `summary()` method for Models gains arguments `expand_nested` and
    `show_trainable`, both default to `FALSE`.

    !end-bullet!
-   !begin-bullet!
    `keras_model_custom()` is soft deprecated. Please define custom
    models by subclassing `keras$Model` directly using `%py_class%` or
    `R6::R6Class()`.

    !end-bullet!
-   !begin-bullet!
    Fixed warning issued by `k_random_binomial()`.

    !end-bullet!
-   !begin-bullet!
    Fixed error raised when `k_random_binomial()` was passed a
    non-floating dtype.

    !end-bullet!
-   !begin-bullet!
    Added `k_random_bernouli()` as an alias for `k_random_binomial()`.

    !end-bullet!
-   !begin-bullet!
    `image_load()` gains a `color_mode` argument.

    !end-bullet!
-   !begin-bullet!
    Fixed issue where `create_layer_wrapper()` would not include
    arguments with a `NULL` default value in the returned wrapper.

    !end-bullet!
-   !begin-bullet!
    Fixed issue in `r_to_py.R6ClassGenerator` (and `%py_class%`) where
    single-expression `initialize` functions defined without `{` would
    error.

    !end-bullet!
-   !begin-bullet!
    Deprecated functions are no longer included in the package
    documentation index.

    !end-bullet!

!end-bullets-46!

# keras 2.7.0

!begin-bullets-49!

-   !begin-bullet!
    Default Tensorflow + Keras version is now 2.7.

    !end-bullet!
-   !begin-bullet!
    New API for constructing RNN (Recurrent Neural Network) layers. This
    is a flexible interface that complements the existing RNN layers. It
    is primarily intended for advanced / research applications, e.g,
    prototyping novel architectures. It allows you to compose a RNN with
    a custom "cell", a Keras layer that processes one step of a
    sequence. New symbols:

    !begin-bullets-50!
    -   !begin-bullet!
        `layer_rnn()`, which can compose with builtin cells:
        !end-bullet!
    -   !begin-bullet!
        `rnn_cell_gru()`
        !end-bullet!
    -   !begin-bullet!
        `rnn_cell_lstm()`
        !end-bullet!
    -   !begin-bullet!
        `rnn_cell_simple()`
        !end-bullet!
    -   !begin-bullet!
        `rnn_cells_stack()` To learn more, including how to make a
        custom cell layer, see the new vignette: "Working with RNNs".
        !end-bullet!

    !end-bullets-50!
    !end-bullet!
-   !begin-bullet!
    New dataset functions:

    !begin-bullets-51!
    -   !begin-bullet!
        `text_dataset_from_directory()`
        !end-bullet!
    -   !begin-bullet!
        `timeseries_dataset_from_array()`
        !end-bullet!

    !end-bullets-51!
    !end-bullet!
-   !begin-bullet!
    New layers:

    !begin-bullets-52!
    -   !begin-bullet!
        `layer_additive_attention()`
        !end-bullet!
    -   !begin-bullet!
        `layer_conv_lstm_1d()`
        !end-bullet!
    -   !begin-bullet!
        `layer_conv_lstm_3d()`
        !end-bullet!

    !end-bullets-52!
    !end-bullet!
-   !begin-bullet!
    `layer_cudnn_gru()` and `layer_cudnn_lstm()` are deprecated.
    `layer_gru()` and `layer_lstm()` will automatically use CuDNN if it
    is available.

    !end-bullet!
-   !begin-bullet!
    `layer_lstm()` and `layer_gru()`: default value for
    `recurrent_activation` changed from `"hard_sigmoid"` to `"sigmoid"`.

    !end-bullet!
-   !begin-bullet!
    `layer_gru()`: default value `reset_after` changed from `FALSE` to
    `TRUE`

    !end-bullet!
-   !begin-bullet!
    New vignette: "Transfer learning and fine-tuning".

    !end-bullet!
-   !begin-bullet!
    New applications:

    !begin-bullets-53!
    -   !begin-bullet!
        MobileNet V3: `application_mobilenet_v3_large()`,
        `application_mobilenet_v3_small()`
        !end-bullet!
    -   !begin-bullet!
        ResNet: `application_resnet101()`, `application_resnet152()`,
        `resnet_preprocess_input()`
        !end-bullet!
    -   !begin-bullet!
        ResNet V2:`application_resnet50_v2()`,
        `application_resnet101_v2()`, `application_resnet152_v2()` and
        `resnet_v2_preprocess_input()`
        !end-bullet!
    -   !begin-bullet!
        EfficientNet: `application_efficientnet_b{0,1,2,3,4,5,6,7}()`
        !end-bullet!

    !end-bullets-53!
    !end-bullet!
-   !begin-bullet!
    Many existing `application_*()`'s gain argument
    `classifier_activation`, with default `'softmax'`. Affected:
    `application_{xception, inception_resnet_v2, inception_v3, mobilenet, vgg16, vgg19}()`

    !end-bullet!
-   !begin-bullet!
    New function `%<-active%`, a ergonomic wrapper around
    `makeActiveBinding()` for constructing Python `@property` decorated
    methods in `%py_class%`.

    !end-bullet!
-   !begin-bullet!
    `bidirectional()` sequence processing layer wrapper gains a
    `backwards_layer` arguments.

    !end-bullet!
-   !begin-bullet!
    Global pooling layers
    `layer_global_{max,average}_pooling_{1,2,3}d()` gain a `keepdims`
    argument with default value `FALSE`.

    !end-bullet!
-   !begin-bullet!
    Signatures for layer functions are in the process of being
    simplified. Standard layer arguments are moving to `...` where
    appropriate (and will need to be provided as named arguments).
    Standard layer arguments include: `input_shape`,
    `batch_input_shape`, `batch_size`, `dtype`, `name`, `trainable`,
    `weights`. Layers updated:
    `layer_global_{max,average}_pooling_{1,2,3}d()`,
    `time_distributed()`, `bidirectional()`, `layer_gru()`,
    `layer_lstm()`, `layer_simple_rnn()`

    !end-bullet!
-   !begin-bullet!
    All the backend function with a shape argument `k_*(shape =)` that
    now accept a a mix of integer tensors and R numerics in the supplied
    list.

    !end-bullet!
-   !begin-bullet!
    All layer functions now accept `NA` as a synonym for `NULL` in
    arguments that specify shape as a vector of dimension values, e.g.,
    `input_shape`, `batch_input_shape`.

    !end-bullet!
-   !begin-bullet!
    `k_random_uniform()` now automatically casts `minval` and `maxval`
    to the output dtype.

    !end-bullet!
-   !begin-bullet!
    `install_keras()` gains arg with default
    `pip_ignore_installed = TRUE`.

    !end-bullet!

!end-bullets-49!

# keras 2.6.1

!begin-bullets-54!

-   !begin-bullet!
    New family of *preprocessing* layers. These are the spiritual
    successor to the `tfdatasets::step_*` family of data transformers
    (to be deprecated in a future release). Added a new vignette:
    "Working with Preprocessing Layers". New functions:

    Image preprocessing:

    !begin-bullets-55!
    -   !begin-bullet!
        `layer_resizing()`
        !end-bullet!
    -   !begin-bullet!
        `layer_rescaling()`
        !end-bullet!
    -   !begin-bullet!
        `layer_center_crop()`
        !end-bullet!

    !end-bullets-55!
    Image augmentation:

    !begin-bullets-56!
    -   !begin-bullet!
        `layer_random_crop()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_flip()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_translation()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_rotation()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_zoom()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_contrast()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_height()`
        !end-bullet!
    -   !begin-bullet!
        `layer_random_width()`
        !end-bullet!

    !end-bullets-56!
    Categorical features preprocessing:

    !begin-bullets-57!
    -   !begin-bullet!
        `layer_category_encoding()`
        !end-bullet!
    -   !begin-bullet!
        `layer_hashing()`
        !end-bullet!
    -   !begin-bullet!
        `layer_integer_lookup()`
        !end-bullet!
    -   !begin-bullet!
        `layer_string_lookup()`
        !end-bullet!

    !end-bullets-57!
    Numerical features preprocessing:

    !begin-bullets-58!
    -   !begin-bullet!
        `layer_normalization()`
        !end-bullet!
    -   !begin-bullet!
        `layer_discretization()`
        !end-bullet!

    !end-bullets-58!
    These join the previous set of text preprocessing functions, each of
    which have some minor changes:

    !begin-bullets-59!
    -   !begin-bullet!
        `layer_text_vectorization()` (changed arguments)
        !end-bullet!
    -   !begin-bullet!
        `get_vocabulary()`
        !end-bullet!
    -   !begin-bullet!
        `set_vocabulary()`
        !end-bullet!
    -   !begin-bullet!
        `adapt()`
        !end-bullet!

    !end-bullets-59!
    !end-bullet!
-   !begin-bullet!
    `adapt()` changes:

    !begin-bullets-60!
    -   !begin-bullet!
        Now accepts all *features preprocessing* layers, previously only
        `layer_text_vectorization()` instances were valid.
        !end-bullet!
    -   !begin-bullet!
        `reset_state` argument is removed. It only ever accepted the
        default value of `TRUE`.
        !end-bullet!
    -   !begin-bullet!
        New arguments `batch_size` and `steps`.
        !end-bullet!
    -   !begin-bullet!
        Now returns the adapted layer invisibly for composability with
        `%>%` (previously returned `NULL`)
        !end-bullet!

    !end-bullets-60!
    !end-bullet!
-   !begin-bullet!
    `get_vocabulary()` gains a `include_special_tokens` argument.

    !end-bullet!
-   !begin-bullet!
    `set_vocabulary()`:

    !begin-bullets-61!
    -   !begin-bullet!
        Now returns the adapted layer invisibly for composability with
        `%>%` (previously returned `NULL`)
        !end-bullet!
    -   !begin-bullet!
        Signature simplified. Deprecated arguments (`df_data`
        `oov_df_value`) are now subsumed in `...`.
        !end-bullet!

    !end-bullets-61!
    !end-bullet!
-   !begin-bullet!
    `layer_text_vectorization()`:

    !begin-bullets-62!
    -   !begin-bullet!
        valid values for argument `output_mode` change: `"binary"` is
        renamed to `"multi_hot"` and `"tf-idf"` is renamed to `"tf_idf"`
        (backwards compatibility is preserved).
        !end-bullet!
    -   !begin-bullet!
        Fixed an issue where valid values of `output_mode = "int"` would
        incorrectly return a ragged tensor output shape.
        !end-bullet!

    !end-bullets-62!
    !end-bullet!
-   !begin-bullet!
    Existing layer instances gain the ability to be added to sequential
    models via a call. E.g.:

    !begin-codeblock!
    ``` r
    layer <- layer_dense(units = 10)
    model <- keras_model_sequential(input_shape = c(1,2,3)) %>%
      layer()
    ```

    !end-codeblock!
    !end-bullet!
-   !begin-bullet!
    Functions in the *merging layer* family gain the ability to return a
    layer instance if the first argument `inputs` is missing. (affected:
    `layer_concatenate()`, `layer_add()`, `layer_subtract()`,
    `layer_multiply()`, `layer_average()`, `layer_maximum()`,
    `layer_minimum()` , `layer_dot()`)

    !end-bullet!
-   !begin-bullet!
    `%py_class%` gains the ability to delay initializing the Python
    session until first use. It is now safe to implement and export
    `%py_class%` objects in an R package.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue in `layer_input()` where passing a tensorflow `DType`
    objects to argument `dtype` would throw an error.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue in `compile()` where passing an R function via an
    in-line call would result in an error from subsequent `fit()` calls.
    (e.g.,
    `compile(loss = function(y_true, y_pred) my_loss(y_true, y_pred))`
    now succeeds)

    !end-bullet!
-   !begin-bullet!
    `clone_model()` gains a `clone_function` argument that allows you to
    customize each layer as it is cloned.

    !end-bullet!
-   !begin-bullet!
    Bumped minimum R version to 3.4. Expanded CI to test on all
    supported R version. Fixed regression that prevented package
    installation on R \<= 3.4

    !end-bullet!

!end-bullets-54!

# keras 2.6.0

Breaking changes (Tensorflow 2.6): - Note: The following breaking
changes are specific to Tensorflow version 2.6.0. However, the keras R
package maintains compatibility with multiple versions of
Tensorflow/Keras. You can upgrade the R package and still preserve the
previous behavior by installing a specific version of Tensorflow:
`keras3::install_keras(tensorflow="2.4.0")`

!begin-bullets-63!

-   !begin-bullet!
    `predict_proba()` and `predict_classes()` were removed.
    !end-bullet!
-   !begin-bullet!
    `model_to_yaml()` and `model_from_yaml()` were removed.
    !end-bullet!
-   !begin-bullet!
    default changed: `layer_text_vectorization(pad_to_max_tokens=FALSE)`
    !end-bullet!
-   !begin-bullet!
    `set_vocabulary()` arguments `df_data` and `oov_df_value` are
    removed. They are replaced by the new argument `idf_weights`.
    !end-bullet!

!end-bullets-63!

New Features:

!begin-bullets-64!

-   !begin-bullet!
    Default Tensorflow/Keras version is now 2.6

    !end-bullet!
-   !begin-bullet!
    Introduced `%py_class%`, an R-language constructor for Python
    classes.

    !end-bullet!
-   !begin-bullet!
    New vignettes:

    !begin-bullets-65!
    -   !begin-bullet!
        Subclassing Python classes: How to use `%py_class%`.
        !end-bullet!
    -   !begin-bullet!
        Making new layers and models via subclassing.
        !end-bullet!
    -   !begin-bullet!
        Customizing what happens in fit (example of how to define a
        model, like a GAN, with a custom train step).
        !end-bullet!
    -   !begin-bullet!
        Writing your own callbacks.
        !end-bullet!

    !end-bullets-65!
    !end-bullet!
-   !begin-bullet!
    The `keras` Python module is exported

    !end-bullet!
-   !begin-bullet!
    Major changes to the underlying handling of custom R6 layer classes.

    !begin-bullets-66!
    -   !begin-bullet!
        A new `r_to_py()` method is provided for `R6ClassGenerator`
        objects.
        !end-bullet!
    -   !begin-bullet!
        R6 custom layers can now inherit directly from Python layer
        classes or other R6 custom layer classes.
        !end-bullet!
    -   !begin-bullet!
        Custom R6 layers can now be instantiated directly after
        conversion of the class generator with `r_to_py()`, without
        going through `create_layer()`.
        !end-bullet!
    -   !begin-bullet!
        `KerasLayer` is deprecated (new classes should inherit directly
        from `keras$layers$Layer`).
        !end-bullet!
    -   !begin-bullet!
        `KerasWrapper` is deprecated (new classes should inherit
        directly from `keras$layers$Wrapper`).
        !end-bullet!
    -   !begin-bullet!
        `create_wrapper()` is deprecated (no longer needed, use
        `create_layer()` directly).
        !end-bullet!
    -   !begin-bullet!
        All layer class methods provided as R functions now have a
        `super` in scope that resolves to the Python super class object.
        !end-bullet!
    -   !begin-bullet!
        Methods of `super` can be accessed in the 3 common ways:
        !begin-bullets-67!
        -   !begin-bullet!
            (Python 3 style): `super()$"__init__"()`
            !end-bullet!
        -   !begin-bullet!
            (Python 2 style): `super(ClassName, self)$"__init__"()`
            !end-bullet!
        -   !begin-bullet!
            (R6 style): `super$initialize()`
            !end-bullet!

        !end-bullets-67!
        !end-bullet!
    -   !begin-bullet!
        User defined custom classes that inherit from a Python type are
        responsible for calling `` super()$`__init__`(...) `` if
        appropriate.
        !end-bullet!
    -   !begin-bullet!
        Custom layers can now properly handle masks (#1225)
        !begin-bullets-68!
        -   !begin-bullet!
            `supports_masking = TRUE` attribute is now supported
            !end-bullet!
        -   !begin-bullet!
            `compute_mask()` user defined method is now supported
            !end-bullet!

        !end-bullets-68!
        !end-bullet!
    -   !begin-bullet!
        `call()` methods now support a `training` argument, as well as
        any additional arbitrary user-defined arguments
        !end-bullet!

    !end-bullets-66!
    !end-bullet!
-   !begin-bullet!
    `Layer()` custom layer constructor is now lazy about initializing
    the Python session and safe to use on the top level of an R package
    (#1229).

    !end-bullet!
-   !begin-bullet!
    New function `create_layer_wrapper()` that can create a composing R
    function wrapper around a custom layer class.

    !end-bullet!
-   !begin-bullet!
    Refactored `install_keras()` (along with
    `tensorflow::install_tensorflow()`). Installation should be more
    reliable for more users now. If you encounter installation issues,
    please file an issue: https://github.com/rstudio/keras/issues/new

    !begin-bullets-69!
    -   !begin-bullet!
        Potentially breaking change: numeric versions supplied without a
        patchlevel now automatically pull the latest patch release.
        (e.g. `install_keras(tensorflow="2.4")` will install tensorflow
        version "2.4.2". Previously it would install "2.4.0")

        !end-bullet!
    -   !begin-bullet!
        pandas is now a default extra packages installed by
        `install_keras()`

        !end-bullet!
    -   !begin-bullet!
        pyyaml is no longer a installed by default if the Tensorflow
        version \>= 2.6.

        !end-bullet!

    !end-bullets-69!
    !end-bullet!
-   !begin-bullet!
    Loss functions:

    !begin-bullets-70!
    -   !begin-bullet!
        All the loss functions gain the ability to return a callable (a
        `keras$losses$Loss` instance) if `y_true` and `y_pred` arguments
        are missing.

        !end-bullet!
    -   !begin-bullet!
        New builtin loss functions:

        !begin-bullets-71!
        -   !begin-bullet!
            `loss_huber()`
            !end-bullet!
        -   !begin-bullet!
            `loss_kl_divergence()`
            !end-bullet!

        !end-bullets-71!
        !end-bullet!

    !end-bullets-70!
    !end-bullet!
-   !begin-bullet!
    Metric functions:

    !begin-bullets-72!
    -   !begin-bullet!
        All the metric functions gain the ability to return a
        `keras$metrics$Metric` instance if called without `y_true` and
        `y_pred`

        !end-bullet!
    -   !begin-bullet!
        Each metric function is now documented separately, with a common
        `?Metric` topic demonstrating example usage.

        !end-bullet!
    -   !begin-bullet!
        New built-in metrics:

        !begin-bullets-73!
        -   !begin-bullet!
            `metric_true_negatives()`
            !end-bullet!
        -   !begin-bullet!
            `metric_true_positives()`
            !end-bullet!
        -   !begin-bullet!
            `metric_false_negatives()`
            !end-bullet!
        -   !begin-bullet!
            `metric_false_positives()`
            !end-bullet!
        -   !begin-bullet!
            `metric_specificity_at_sensitivity()`
            !end-bullet!
        -   !begin-bullet!
            `metric_sensitivity_at_specificity()`
            !end-bullet!
        -   !begin-bullet!
            `metric_precision()`
            !end-bullet!
        -   !begin-bullet!
            `metric_precision_at_recall()`
            !end-bullet!
        -   !begin-bullet!
            `metric_sum()`
            !end-bullet!
        -   !begin-bullet!
            `metric_recall()`
            !end-bullet!
        -   !begin-bullet!
            `metric_recall_at_precision()`
            !end-bullet!
        -   !begin-bullet!
            `metric_root_mean_squared_error()`
            !end-bullet!
        -   !begin-bullet!
            `metric_sparse_categorical_accuracy()`
            !end-bullet!
        -   !begin-bullet!
            `metric_mean_tensor()`
            !end-bullet!
        -   !begin-bullet!
            `metric_mean_wrapper()`
            !end-bullet!
        -   !begin-bullet!
            `metric_mean_iou()`
            !end-bullet!
        -   !begin-bullet!
            `metric_mean_relative_error()`
            !end-bullet!
        -   !begin-bullet!
            `metric_logcosh_error()`
            !end-bullet!
        -   !begin-bullet!
            `metric_mean()`
            !end-bullet!
        -   !begin-bullet!
            `metric_cosine_similarity()`
            !end-bullet!
        -   !begin-bullet!
            `metric_categorical_hinge()`
            !end-bullet!
        -   !begin-bullet!
            `metric_accuracy()`
            !end-bullet!
        -   !begin-bullet!
            `metric_auc()`
            !end-bullet!

        !end-bullets-73!
        !end-bullet!

    !end-bullets-72!
    !end-bullet!
-   !begin-bullet!
    `keras_model_sequential()` gains the ability to accept arguments
    that define the input layer like `input_shape` and `dtype`. See
    `?keras_model_sequential` for details and examples.

    !end-bullet!
-   !begin-bullet!
    Many layers gained new arguments, coming to parity with the
    interface available in the latest Python version:

      layer name                     new argument
      ------------------------------ ------------------
      `layer_gru`                    `time_major`
      `layer_lstm`                   `time_major`
      `layer_max_pooling_1d`         `data_format`
      `layer_conv_lstm_2d`           `return_state`
      `layer_depthwise_conv_2d`      `dilation_rate`
      `layer_conv_3d_transpose`      `dilation_rate`
      `layer_conv_1d`                `groups`
      `layer_conv_2d`                `groups`
      `layer_conv_3d`                `groups`
      `layer_locally_connected_1d`   `implementation`
      `layer_locally_connected_2d`   `implementation`
      `layer_text_vectorization`     `vocabulary`

    !end-bullet!
-   !begin-bullet!
    The `compile()` method for keras models has been updated:

    !begin-bullets-74!
    -   !begin-bullet!
        `optimizer` is now an optional argument. It defaults to
        `"rmsprop"` for regular keras models. Custom models can specify
        their own default optimizer.
        !end-bullet!
    -   !begin-bullet!
        `loss` is now an optional argument.
        !end-bullet!
    -   !begin-bullet!
        New optional arguments: `run_eagerly`, `steps_per_execution`.
        !end-bullet!
    -   !begin-bullet!
        `target_tensors` and `sample_weight_mode` must now be supplied
        as named arguments.
        !end-bullet!

    !end-bullets-74!
    !end-bullet!
-   !begin-bullet!
    Added activation functions swish and gelu. (#1226)

    !end-bullet!
-   !begin-bullet!
    `set_vocabulary()` gains a `idf_weights` argument.

    !end-bullet!
-   !begin-bullet!
    All optimizer had argument `lr` renamed to `learning_rate`.
    (backwards compatibility is preserved, an R warning is now issued).

    !end-bullet!
-   !begin-bullet!
    The glue package was added to Imports

    !end-bullet!
-   !begin-bullet!
    Refactored automated tests to closer match the default installation
    procedure and compute environment of most user.

    !end-bullet!
-   !begin-bullet!
    Expanded CI test coverage to include R devel, oldrel and 3.6.

    !end-bullet!

!end-bullets-64!

# keras 2.4.0

!begin-bullets-75!

-   !begin-bullet!
    Use compat module when using `set_session` and `get_session`.
    (#1046)
    !end-bullet!
-   !begin-bullet!
    Allows passing other arguments to `keras_model` eg `name`. (#1045)
    !end-bullet!
-   !begin-bullet!
    Fixed bug when serializing models with the plaidml backends.(#1084)
    !end-bullet!
-   !begin-bullet!
    Install keras no longer tries to install scipy because it's already
    installed by tensorflow (#1081)
    !end-bullet!
-   !begin-bullet!
    Fixed bug with `layer_text_vectorization` with TensorFlow \>= 2.3
    (#1131)
    !end-bullet!
-   !begin-bullet!
    Handle renamed argument `text` to `input_text` in `text_one_hot`
    (#1133)
    !end-bullet!
-   !begin-bullet!
    Added TensorFlow 2.3 to the CI (#1102)
    !end-bullet!
-   !begin-bullet!
    Fix C stack error when using Image Data Generators and Time Series
    generators with TensorFlow \<= 2.0.1 (#1135)
    !end-bullet!
-   !begin-bullet!
    Fixed warning raised in the initial epoch (@gsteinbu #1130)
    !end-bullet!
-   !begin-bullet!
    Consistent result when using `text_hashing_trick` with missing
    values (@topepo #1048)
    !end-bullet!
-   !begin-bullet!
    Added a custom error message for `k_logsumexp` as it was removed
    from Keras (#1137)
    !end-bullet!
-   !begin-bullet!
    Fixed bug when printing models that are not built yet. (#1138)
    !end-bullet!
-   !begin-bullet!
    Fix drop_duplicates DeprecationWarning with tf 2.3 (@gsteinbu #1139
    #1141)
    !end-bullet!
-   !begin-bullet!
    Fixed bug when plotting the model history if the model used an early
    stopping callback (#1140)
    !end-bullet!
-   !begin-bullet!
    `install_keras` now installs a fixed version of h5py, because newer
    versions are backward incompatible. (#1142)
    !end-bullet!
-   !begin-bullet!
    Simplify testing utilities by using a `helper-*` file. (#1173)
    !end-bullet!
-   !begin-bullet!
    Deprecated `hdf5_matrix` if using TF \>= 2.4 (#1175)
    !end-bullet!
-   !begin-bullet!
    Fixed TensorFlow nightly installation on CI (#1176)
    !end-bullet!
-   !begin-bullet!
    Support for TensorFlow v2.4: just small fixes for custom classes.
    (#1177)
    !end-bullet!
-   !begin-bullet!
    Added `untar` argument to `get_file` as it seems to be slightly
    different from `extract` (#1179)
    !end-bullet!
-   !begin-bullet!
    Warn when not using the tensorflow implementation of Keras (#1181)
    !end-bullet!
-   !begin-bullet!
    Added `layer_layer_normalization` (#1183)
    !end-bullet!
-   !begin-bullet!
    Added `layer_multihead_attention` (#1184)
    !end-bullet!
-   !begin-bullet!
    Added `image_dataset_from_directory` (#1185)
    !end-bullet!
-   !begin-bullet!
    Fixed bug when using a custom layer with a time distributed adverb.
    (#1188)
    !end-bullet!
-   !begin-bullet!
    Added the `ragged` argument to `layer_input`. (#1193)
    !end-bullet!
-   !begin-bullet!
    Fixed `*_generator` deadlocks with recent versions of TensorFlow
    (#1197)
    !end-bullet!

!end-bullets-75!

# Keras 2.2.3.0 (CRAN)

!begin-bullets-76!

-   !begin-bullet!
    Added `layer_attention` (#1000) by @atroiano.
    !end-bullet!
-   !begin-bullet!
    Fixed issue regarding the KerasMetricsCallback with TF v2.2 (#1020)
    !end-bullet!

!end-bullets-76!

# Keras 2.2.5.0 (CRAN)

!begin-bullets-77!

-   !begin-bullet!
    Added `layer_dense_features`.

    !end-bullet!
-   !begin-bullet!
    Added `on_test_*`, `on_test_batch_*`, `on_predict_*` and
    `on_predict_*` to callback options.

    !end-bullet!
-   !begin-bullet!
    Search for the right optimizers and initializers on TensorFlow 2.0

    !end-bullet!
-   !begin-bullet!
    Fixed bug in function generators when using models with multiple
    inputs. (#740)

    !end-bullet!
-   !begin-bullet!
    Added `export_savedmodel` support for TensorFlow 2.0 (#773)

    !end-bullet!
-   !begin-bullet!
    Fixed bug when using `metric_` functions. (#804)

    !end-bullet!
-   !begin-bullet!
    Allow users to pass additional arguments to `install_keras` (#808)

    !end-bullet!
-   !begin-bullet!
    Enabled calling Keras models with R arrays. (#806)

    !end-bullet!
-   !begin-bullet!
    Allow passing `data.frames` as inputs to Keras models. (#822)

    !end-bullet!
-   !begin-bullet!
    Fixed bug when passing a fixed validation set to `fit_generator`
    (#837)

    !end-bullet!
-   !begin-bullet!
    Fixed bug when passing a TensorFlow dataset to `fit` within a
    `tf$distribute` scope. (#856)

    !end-bullet!
-   !begin-bullet!
    `install_keras` will now install Keras dependencies (#856). It won't
    re-install TensorFlow if it's already installed.

    !end-bullet!
-   !begin-bullet!
    Fixed deprecation messages showed with TensorFlow v1.14.

    !end-bullet!
-   !begin-bullet!
    Largely reduced tests verbosity.

    !end-bullet!

!end-bullets-77!

## Keras 2.2.4.1 (CRAN)

!begin-bullets-78!

-   !begin-bullet!
    Use `tf.keras` as default implementation module.

    !end-bullet!
-   !begin-bullet!
    Added AppVeyor to test on Windows.

    !end-bullet!
-   !begin-bullet!
    Added `flow_images_from_dataframe` function (#658).

    !end-bullet!
-   !begin-bullet!
    Allow for unknown `input_shape` in `application_*` functions.

    !end-bullet!
-   !begin-bullet!
    Added `save_model_tf` and `load_model_tf` to save/load models in the
    TensorFlow's SavedModel format.

    !end-bullet!

!end-bullets-78!

# Keras 2.2.4 (CRAN)

!begin-bullets-79!

-   !begin-bullet!
    Improve handling of `timeseries_generator()` in calls to
    `fit_generator()`

    !end-bullet!
-   !begin-bullet!
    Add support for `input_shape` argument to `layer_dropout()`

    !end-bullet!
-   !begin-bullet!
    Improve error message for data frames passed to `fit()`, etc.

    !end-bullet!
-   !begin-bullet!
    Use 1-based axis indices for `k_gather()`

    !end-bullet!
-   !begin-bullet!
    Added `version` parameter to `install_keras()` for installing
    alternate/older versions

    !end-bullet!
-   !begin-bullet!
    Added `activation_exponential()` function.

    !end-bullet!
-   !begin-bullet!
    Added `threshold` parameter to `activation_relu()`

    !end-bullet!
-   !begin-bullet!
    Added `restore_best_weights` parameter to
    `callback_model_checkpoint()`

    !end-bullet!
-   !begin-bullet!
    Added `update_freq` parameter to `callback_tensorboard()`

    !end-bullet!
-   !begin-bullet!
    Added `negative_slope` and `threshold` parameters to
    `layer_activation_relu()`

    !end-bullet!
-   !begin-bullet!
    Added `output_padding` and `dilation_rate` parameters to
    `layer_conv_2d_transpose()`

    !end-bullet!
-   !begin-bullet!
    Added `output_padding` argument to `layer_conv_3d_transpose()`

    !end-bullet!
-   !begin-bullet!
    Added `data_format` argument to `layer_separable_conv_1d()`,
    `layer_average_pooling_1d()`, `layer_global_max_pooling_1d()`, and
    `layer_global_average_pooling_1d()`

    !end-bullet!
-   !begin-bullet!
    Added `interpolation` argument to `layer_upsampling_1d()` and
    `layer_upsampling_2d()`

    !end-bullet!
-   !begin-bullet!
    Added `dtype` argument to `to_categorical()`

    !end-bullet!
-   !begin-bullet!
    Added `layer_activation_selu()` function.

    !end-bullet!
-   !begin-bullet!
    Added `KerasWrapper` class and corresponding `create_wrapper`
    function.

    !end-bullet!

!end-bullets-79!

# Keras 2.2.0

!begin-bullets-80!

-   !begin-bullet!
    Fix issue with serializing models that have constraint arguments

    !end-bullet!
-   !begin-bullet!
    Fix issue with `k_tile` that needs an integer vector instead of a
    list as the `n` argument.

    !end-bullet!
-   !begin-bullet!
    Fix issue with user-supplied `output_shape` in `layer_lambda()` not
    being supplied to tensorflow backends

    !end-bullet!
-   !begin-bullet!
    Filter out metrics that were created for callbacks (e.g. `lr`)

    !end-bullet!
-   !begin-bullet!
    Added `application_mobilenet_v2()` pre-trained model

    !end-bullet!
-   !begin-bullet!
    Added `sample_weight` parameter to `flow_images_from_data()`

    !end-bullet!
-   !begin-bullet!
    Use native Keras implementation (rather than SciPy) for
    `image_array_save()`

    !end-bullet!
-   !begin-bullet!
    Default `layer_flatten()` `data_format` argument to `NULL` (which
    defaults to global Keras config).

    !end-bullet!
-   !begin-bullet!
    Add `baseline` argument to `callback_early_stopping()` (stop
    training if a given baseline isn't reached).

    !end-bullet!
-   !begin-bullet!
    Add `data_format` argument to `layer_conv_1d()`.

    !end-bullet!
-   !begin-bullet!
    Add `layer_activation_relu()`, making the ReLU activation easier to
    configure while retaining easy serialization capabilities.

    !end-bullet!
-   !begin-bullet!
    Add `axis = -1` argument in backend crossentropy functions
    specifying the class prediction axis in the input tensor.

    !end-bullet!
-   !begin-bullet!
    Handle symbolic tensors and TF datasets in calls to `fit()`,
    `evaluate()`, and `predict()`

    !end-bullet!
-   !begin-bullet!
    Add `embeddings_data` argument to `callback_tensorboard()`

    !end-bullet!
-   !begin-bullet!
    Support for defining custom Keras models (i.e. custom `call()` logic
    for forward pass)

    !end-bullet!
-   !begin-bullet!
    Handle named list of model output names in `metrics` argument of
    `compile()`

    !end-bullet!
-   !begin-bullet!
    New `custom_metric()` function for defining custom metrics in R

    !end-bullet!
-   !begin-bullet!
    Provide typed wrapper for categorical custom metrics

    !end-bullet!
-   !begin-bullet!
    Provide access to Python layer within R custom layers

    !end-bullet!
-   !begin-bullet!
    Don't convert custom layer output shape to tuple when shape is a
    list or tuple of other shapes

    !end-bullet!
-   !begin-bullet!
    Re-export `shape()` function from tensorflow package

    !end-bullet!
-   !begin-bullet!
    Re-export `tuple()` function from reticulate package

    !end-bullet!
-   !begin-bullet!
    Indexes for `get_layer()` are now 1-based (for consistency w/
    `freeze_weights()`)

    !end-bullet!
-   !begin-bullet!
    Accept named list for `sample_weight` argument to `fit()`

    !end-bullet!

!end-bullets-80!

## Keras 2.1.6

!begin-bullets-81!

-   !begin-bullet!
    Fix issue with single-element vectors passed to text preprocessing
    functions

    !end-bullet!
-   !begin-bullet!
    Compatibility with TensorFlow v1.7 Keras implementation

    !end-bullet!
-   !begin-bullet!
    Support `workers` parameter for native Keras generators
    (e.g. `flow_images_from_directory()`)

    !end-bullet!
-   !begin-bullet!
    Accept tensor as argument to `k_pow()`

    !end-bullet!
-   !begin-bullet!
    In `callback_reduce_lr_on_plateau()`, rename `epsilon` argument to
    `min_delta` (backwards-compatible).

    !end-bullet!
-   !begin-bullet!
    Add `axis` parameter to `k_softmax()`

    !end-bullet!
-   !begin-bullet!
    Add `send_as_json` parameter to `callback_remote_monitor()`

    !end-bullet!
-   !begin-bullet!
    Add `data_format` method to `layer_flatten()`

    !end-bullet!
-   !begin-bullet!
    In `multi_gpu_model()`, add arguments `cpu_merge` and
    `cpu_relocation` (controlling whether to force the template model's
    weights to be on CPU, and whether to operate merge operations on CPU
    or GPU).

    !end-bullet!
-   !begin-bullet!
    Record correct loss name for tfruns when custom functions are
    provided for `loss`

    !end-bullet!

!end-bullets-81!

## Keras 2.1.5

!begin-bullets-82!

-   !begin-bullet!
    Support for custom constraints from R

    !end-bullet!
-   !begin-bullet!
    Added `timeseries_generator()` utility function

    !end-bullet!
-   !begin-bullet!
    New layer `layer_depthwise_conv_2d()`

    !end-bullet!
-   !begin-bullet!
    Added `brightness_range` and `validation_split` arguments to
    \[image_data_generator()\].

    !end-bullet!

!end-bullets-82!

## Keras 2.1.4

!begin-bullets-83!

-   !begin-bullet!
    Added support for `remove_learning_phase` in `export_savedmodel()`
    to avoid removing learning phase.

    !end-bullet!
-   !begin-bullet!
    Normalize validation data to Keras array in `fit()` and
    `fit_generator()`

    !end-bullet!
-   !begin-bullet!
    Ensure that custom layers return a tuple from
    `compute_output_shape()`

    !end-bullet!
-   !begin-bullet!
    Added Nasnet and Densenet pre-trained models

    !end-bullet!
-   !begin-bullet!
    New layers `layer_activation_softmax()` and
    `layer_separable_conv_1d()`

    !end-bullet!
-   !begin-bullet!
    Added `amsgrad` parameter to `optimizer_adam()`

    !end-bullet!
-   !begin-bullet!
    Fix incompatibility with Progbar.update() method in Keras 2.1.4

    !end-bullet!

!end-bullets-83!

## Keras 2.1.3

!begin-bullets-84!

-   !begin-bullet!
    Models saved via `export_savedmodel()` that make use of learning
    phases can now be exported without having to manually reload the
    original model.

    !end-bullet!
-   !begin-bullet!
    Ensure that models saved via `export_savedmodel()` can be served
    from CloudML

    !end-bullet!
-   !begin-bullet!
    Run image data generators with R preprocessing functions on the main
    thread

    !end-bullet!
-   !begin-bullet!
    Return R list from `texts_to_sequences()`

    !end-bullet!
-   !begin-bullet!
    Various fixes for `use_implementation()` function

    !end-bullet!

!end-bullets-84!

# Keras 2.1.2

!begin-bullets-85!

-   !begin-bullet!
    Added `theme_bw` option to plot method for training history

    !end-bullet!
-   !begin-bullet!
    Support TF Dataset objects as generators for `fit_generator()`, etc.

    !end-bullet!
-   !begin-bullet!
    Added `use_implementation()` and `use_backend()` functions as
    alternative to setting `KERAS_IMPLEMENATION` and `KERAS_BACKEND`
    environment variables.

    !end-bullet!
-   !begin-bullet!
    Added R wrappers for Keras backend functions (e.g. `k_variable()`,
    `k_dot()`, etc.)

    !end-bullet!
-   !begin-bullet!
    Use 1-based axis for `normalize` function.

    !end-bullet!
-   !begin-bullet!
    Fix issue with printing training history after early stopping.

    !end-bullet!
-   !begin-bullet!
    Experimental support for using the PlaidML backend.

    !end-bullet!
-   !begin-bullet!
    Correct handling for R functions specified in `custom_objects`

    !end-bullet!
-   !begin-bullet!
    Added `with_custom_object_scope()` function.

    !end-bullet!
-   !begin-bullet!
    Automatically provide name to loss function during compile (enables
    save/load of models with custom loss function)

    !end-bullet!
-   !begin-bullet!
    Provide global `keras.fit_verbose` option (defaults to 1)

    !end-bullet!

!end-bullets-85!

# keras 2.0.9

!begin-bullets-86!

-   !begin-bullet!
    Added `multi_gpu_model()` function.

    !end-bullet!
-   !begin-bullet!
    Automatically call `keras_array()` on the results of generator
    functions.

    !end-bullet!
-   !begin-bullet!
    Ensure that `steps_per_epoch` is passed as an integer

    !end-bullet!
-   !begin-bullet!
    Import `evaluate()` generic from tensorflow package

    !end-bullet!
-   !begin-bullet!
    Handle `NULL` when converting R arrays to Keras friendly arrays

    !end-bullet!
-   !begin-bullet!
    Added `dataset_imbd_word_index()` function

    !end-bullet!
-   !begin-bullet!
    Ensure that `sample_weight` is passed to `fit()` as an array.

    !end-bullet!
-   !begin-bullet!
    Accept single function as `metrics` argument to `compile()`

    !end-bullet!
-   !begin-bullet!
    Automatically cast `input_shape` argument to applications to integer

    !end-bullet!
-   !begin-bullet!
    Allow Keras models to be composable within model pipelines

    !end-bullet!
-   !begin-bullet!
    Added `freeze_weights()` and `unfreeze_weights()` functions.

    !end-bullet!
-   !begin-bullet!
    Implement `export_savedmodel()` generic from TensorFlow package

    !end-bullet!
-   !begin-bullet!
    Convert R arrays to row-major before image preprocessing

    !end-bullet!
-   !begin-bullet!
    Use `tensorflow.keras` for tensorflow implementation (TF v1.4)

    !end-bullet!
-   !begin-bullet!
    Added `application_inception_resnet_v2()` pre-trained model

    !end-bullet!
-   !begin-bullet!
    Added `dataset_fashion_mnist()` dataset

    !end-bullet!
-   !begin-bullet!
    Added `layer_cudnn_gru()` and `layer_cudnn_lstm()` (faster recurrent
    layers backed by CuDNN)

    !end-bullet!
-   !begin-bullet!
    Added `layer_minimum()` function

    !end-bullet!
-   !begin-bullet!
    Added `interpolation` parameter to `image_load()` function

    !end-bullet!
-   !begin-bullet!
    Add `save_text_tokenizer()` and `load_text_tokenizer()` functions.

    !end-bullet!
-   !begin-bullet!
    Fix for progress bar output in Keras \>= 2.0.9

    !end-bullet!
-   !begin-bullet!
    Remove deprecated `implementation` argument from recurrent layers

    !end-bullet!
-   !begin-bullet!
    Support for passing generators for validation data in
    `fit_generator()`

    !end-bullet!
-   !begin-bullet!
    Accept single integer arguments for kernel sizes

    !end-bullet!
-   !begin-bullet!
    Add standard layer arguments to `layer_flatten()` and
    `layer_separable_conv_2d()`

    !end-bullet!
-   !begin-bullet!
    Added `image_array_resize()` and `image_array_save()` for 3D image
    arrays.

    !end-bullet!
-   !begin-bullet!
    Allow custom layers and lambda layers to accept list parameters.

    !end-bullet!
-   !begin-bullet!
    Expose `add_loss()` function for custom layers

    !end-bullet!

!end-bullets-86!

# keras 2.0.8

!begin-bullets-87!

-   !begin-bullet!
    Add `use_session_with_seed()` function that establishes a random
    seed for the Keras session. Note that this should not be used when
    training time is paramount, as it disables GPU computation and CPU
    parallelism by default for more deterministic computations.

    !end-bullet!
-   !begin-bullet!
    Fix for plotting training history with early stopping callback
    (thanks to @JamesAllingham).

    !end-bullet!
-   !begin-bullet!
    Return R training history object from `fit_generator()`

    !end-bullet!
-   !begin-bullet!
    Rename `to_numpy_array()` function to `keras_array()` reflecting
    automatic use of Keras default backend float type and "C" ordering.

    !end-bullet!
-   !begin-bullet!
    Add standard layer arguments (e.g. `name`, `trainable`, etc.) to
    merge layers

    !end-bullet!
-   !begin-bullet!
    Better support for training models from data tensors in TensorFlow
    (e.g. Datasets, TFRecords). Add a related example script.

    !end-bullet!
-   !begin-bullet!
    Add `clone_model()` function, enabling to construct a new model,
    given an existing model to use as a template. Works even in a
    TensorFlow graph different from that of the original model.

    !end-bullet!
-   !begin-bullet!
    Add `target_tensors` argument in `compile()`, enabling to use custom
    tensors or placeholders as model targets.

    !end-bullet!
-   !begin-bullet!
    Add `steps_per_epoch` argument in `fit()`, enabling to train a model
    from data tensors in a way that is consistent with training from
    arrays. Similarly, add `steps` argument in `predict()` and
    `evaluate()`.

    !end-bullet!
-   !begin-bullet!
    Add `layer_subtract()` layer function.

    !end-bullet!
-   !begin-bullet!
    Add `weighted_metrics` argument in compile to specify metric
    functions meant to take into account `sample_weight` or
    `class_weight`.

    !end-bullet!
-   !begin-bullet!
    Enable stateful RNNs with CNTK.

    !end-bullet!

!end-bullets-87!

## keras 2.0.6

!begin-bullets-88!

-   !begin-bullet!
    `install_keras()` function which installs both TensorFlow and Keras

    !end-bullet!
-   !begin-bullet!
    Use keras package as default implementation rather than
    tf.contrib.keras

    !end-bullet!
-   !begin-bullet!
    Training metrics plotted in realtime within the RStudio Viewer
    during fit

    !end-bullet!
-   !begin-bullet!
    `serialize_model()` and `unserialize_model()` functions for saving
    Keras models as 'raw' R objects.

    !end-bullet!
-   !begin-bullet!
    Automatically convert 64-bit R floats to backend default float type

    !end-bullet!
-   !begin-bullet!
    Ensure that arrays passed to generator functions are normalized to
    C-order

    !end-bullet!
-   !begin-bullet!
    `to_numpy_array()` utility function for custom generators (enables
    custom generators to yield C-ordered arrays of the correct float
    type)

    !end-bullet!
-   !begin-bullet!
    Added `batch_size` and `write_grads` arguments to
    `callback_tensorboard()`

    !end-bullet!
-   !begin-bullet!
    Added `return_state` argument to recurrent layers.

    !end-bullet!
-   !begin-bullet!
    Don't re-export `install_tensorflow()` and `tf_config()` from
    tensorflow package.

    !end-bullet!
-   !begin-bullet!
    `is_keras_available()` function to probe whether the Keras Python
    package is available in the current environment.

    !end-bullet!
-   !begin-bullet!
    `as.data.frame()` S3 method for Keras training history

    !end-bullet!
-   !begin-bullet!
    Remove names from `keras_model()` inputs

    !end-bullet!
-   !begin-bullet!
    Return result of `evaluate()` as named list

    !end-bullet!
-   !begin-bullet!
    Write run metrics and evaluation data to tfruns

    !end-bullet!
-   !begin-bullet!
    Provide hint to use r-tensorflow environment when importing keras

    !end-bullet!

!end-bullets-88!

# keras 2.0.5

!begin-bullets-89!

-   !begin-bullet!
    Initial CRAN release
    !end-bullet!

!end-bullets-89!

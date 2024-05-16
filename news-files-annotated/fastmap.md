# fastmap 1.2.0

!begin-bullets-1!

-   !begin-bullet!
    Changed `fastmap`'s `$has()` method to use C++ `contains()` method
    (which is new in hopscotch-map 2.3.0). (#30)

    !end-bullet!
-   !begin-bullet!
    Previously calling `$mset()` with empty input would result in an
    error; now it is a no-op. (#38)

    !end-bullet!

!end-bullets-1!

# fastmap 1.1.1

!begin-bullets-2!

-   !begin-bullet!
    Updated hopscotch-map library to 2.3.0.

    !end-bullet!
-   !begin-bullet!
    Closed #24: Added a `$clone()` method to `fastmap`. (#26)

    !end-bullet!
-   !begin-bullet!
    Fixed #27: If a `fastmap` object has no holes in the lists storing
    keys and values, and then it is serialized and then unserialized,
    the new `fastmap` would contain zero items. (#28)

    !end-bullet!
-   !begin-bullet!
    Faster implementations of `fastmap` `$keys()` and `$as_list()`
    methods.

    !end-bullet!

!end-bullets-2!

# fastmap 1.1.0

!begin-bullets-3!

-   !begin-bullet!
    Added `faststack()` and `fastqueue()`. (#15)
    !end-bullet!

!end-bullets-3!

# fastmap 1.0.1

!begin-bullets-4!

-   !begin-bullet!
    Fixed #13: fastmap.cpp now explicitly includes the algorithm header,
    which is needed on some platforms to successfully compile.
    !end-bullet!

!end-bullets-4!

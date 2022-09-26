# modelr (development version)

# modelr 0.1.9

!begin-bullets-1!

-   !begin-bullet!
    Redocument to fix HTML issues in .Rd
    !end-bullet!

!end-bullets-1!

# modelr 0.1.8

!begin-bullets-2!

-   !begin-bullet!
    Eliminate direct dplyr dependency in favour of vctrs.
    !end-bullet!
-   !begin-bullet!
    Reimplement `typical.ordered()` for R-devel compatibility.
    !end-bullet!

!end-bullets-2!

# modelr 0.1.7

!begin-bullets-3!

-   !begin-bullet!
    Minor documentation fixes and updates for deprecated functions.
    !end-bullet!

!end-bullets-3!

# modelr 0.1.6

!begin-bullets-4!

-   !begin-bullet!
    R CMD check documentation fix
    !end-bullet!

!end-bullets-4!

# modelr 0.1.5

!begin-bullets-5!

-   !begin-bullet!
    Fix to `data_grid()` to work with dev tidyr.
    !end-bullet!

!end-bullets-5!

# modelr 0.1.4

!begin-bullets-6!

-   !begin-bullet!
    `add_predictions()`, `gather_predictions()`, and
    `spread_predictions()` more carefully pass along `type` parameter in
    order to avoid problems with predict methods that don't deal with
    `type = NULL` (#92).
    !end-bullet!

!end-bullets-6!

# modelr 0.1.3

!begin-bullets-7!

-   !begin-bullet!
    `add_predictions()`, `gather_predictions()`, and
    `spread_predictions()` gain a `type` parameter which is passed
    through to `stats::predict()` (#34, @pmenzel)

    !end-bullet!
-   !begin-bullet!
    New `crossv_loo()` which implements leave-one-out cross validation
    (@pmenzel)

    !end-bullet!
-   !begin-bullet!
    `typical()` no longer ignores missing values in character and factor
    vectors (#80).

    !end-bullet!

!end-bullets-7!

# modelr 0.1.2

!begin-bullets-8!

-   !begin-bullet!
    `data_grid()` no longer fails with modern tidyr (#58).

    !end-bullet!
-   !begin-bullet!
    New `mape()` and `rsae()` model quality statistics (@paulponcet,
    #33).

    !end-bullet!
-   !begin-bullet!
    `rsquare()` use more robust calculation 1 - SS_res / SS_tot rather
    than SS_reg / SS_tot (#37).

    !end-bullet!
-   !begin-bullet!
    `typical()` gains `ordered` and `integer` methods (@jrnold, #44),
    and `...` argument (@jrnold, #42).

    !end-bullet!

!end-bullets-8!

# modelr 0.1.1

!begin-bullets-9!

-   !begin-bullet!
    Added a `NEWS.md` file to track changes to the package.

    !end-bullet!
-   !begin-bullet!
    Fixed R CMD CHECK note

    !end-bullet!
-   !begin-bullet!
    Updated usage of `reduce()` for upcoming purrr release

    !end-bullet!
-   !begin-bullet!
    More general `permute()` function

    !end-bullet!
-   !begin-bullet!
    Add `mse()` function to calculate mean squared error. Written by
    @bensoltoff, pull request #57

    !end-bullet!

!end-bullets-9!

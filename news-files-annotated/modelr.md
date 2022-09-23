# modelr (development version)

# modelr 0.1.9

!begin-bullets-1!

-   Redocument to fix HTML issues in .Rd

!end-bullets-1!

# modelr 0.1.8

!begin-bullets-2!

-   Eliminate direct dplyr dependency in favour of vctrs.
-   Reimplement `typical.ordered()` for R-devel compatibility.

!end-bullets-2!

# modelr 0.1.7

!begin-bullets-3!

-   Minor documentation fixes and updates for deprecated functions.

!end-bullets-3!

# modelr 0.1.6

!begin-bullets-4!

-   R CMD check documentation fix

!end-bullets-4!

# modelr 0.1.5

!begin-bullets-5!

-   Fix to `data_grid()` to work with dev tidyr.

!end-bullets-5!

# modelr 0.1.4

!begin-bullets-6!

-   `add_predictions()`, `gather_predictions()`, and
    `spread_predictions()` more carefully pass along `type` parameter in
    order to avoid problems with predict methods that don't deal with
    `type = NULL` (#92).

!end-bullets-6!

# modelr 0.1.3

!begin-bullets-7!

-   `add_predictions()`, `gather_predictions()`, and
    `spread_predictions()` gain a `type` parameter which is passed
    through to `stats::predict()` (#34, @pmenzel)

-   New `crossv_loo()` which implements leave-one-out cross validation
    (@pmenzel)

-   `typical()` no longer ignores missing values in character and factor
    vectors (#80).

!end-bullets-7!

# modelr 0.1.2

!begin-bullets-8!

-   `data_grid()` no longer fails with modern tidyr (#58).

-   New `mape()` and `rsae()` model quality statistics (@paulponcet,
    #33).

-   `rsquare()` use more robust calculation 1 - SS_res / SS_tot rather
    than SS_reg / SS_tot (#37).

-   `typical()` gains `ordered` and `integer` methods (@jrnold, #44),
    and `...` argument (@jrnold, #42).

!end-bullets-8!

# modelr 0.1.1

!begin-bullets-9!

-   Added a `NEWS.md` file to track changes to the package.

-   Fixed R CMD CHECK note

-   Updated usage of `reduce()` for upcoming purrr release

-   More general `permute()` function

-   Add `mse()` function to calculate mean squared error. Written by
    @bensoltoff, pull request #57

!end-bullets-9!

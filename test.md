# dbplyr (development version)

!begin-bullets-1!

-   !begin-bullet!
    `copy_inline()` gains a `types` argument to specify the SQL column
    types (@mgirlich, #963).

    !end-bullet!
    !begin-bullets-2!
    -   !begin-bullet!
        First sub-bullet *and stuff*
        !end-bullet!

    !end-bullets-2!
-   !begin-bullet!
    `rows_*()` now uses the column types of `x` when auto copying a
    local data frame to a Postgres database (@mgirlich, #909).

    !end-bullet!

!end-bullets-1!

## Improvements to SQL generation

!begin-bullets-3!

-   !begin-bullet!
    dbplyr now needs less subqueries resulting in shorter, more readable
    and in some cases even faster SQL. The following combination of
    verbs now avoids a subquery if possible:

    !end-bullet!
    !begin-bullets-4!
    -   !begin-bullet!
        `*_join()` + `select()` (@mgirlich, #876).

        !end-bullet!
    -   !begin-bullet!
        `select()` + `*_join()` (@mgirlich, #875).

        !end-bullet!
        !begin-bullets-5!
        -   !begin-bullet!
            A very deep bullet

            !end-bullet!
        -   !begin-bullet!
            Another very deep one

            !end-bullet!

        !end-bullets-5!

    !end-bullets-4!
-   !begin-bullet!
    The generated SQL is now shorter and more readable:

    !end-bullet!
    !begin-bullets-6!
    -   !begin-bullet!
        Joins now don't use the table alias "LHS" and "RHS" unless
        necessary (@mgirlich).

        !end-bullet!
    -   !begin-bullet!
        When using common table expressions the results of joins and set
        operations are now reused (@mgirlich, #978).

        !end-bullet!

    !end-bullets-6!

!end-bullets-3!

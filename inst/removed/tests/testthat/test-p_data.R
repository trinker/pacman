context("Checking p_data")


test_that("p_data returns a data.frame with 2 character columns if data is found",{

    expect_true(is.data.frame(p_data()))
    expect_true(all(sapply(p_data(), class) == c("character", "character")))
})

test_that("p_data returns NULL when no data found",{

    expect_null(p_data(testthat))
})

test_that("p_data returns 'NULL when no data found'packageIQR' when 'static = 'TRUE'",{

    expect_false(is.data.frame(p_data(lattice, static = TRUE)))
    expect_true(class(p_data(lattice, static = TRUE)) == "packageIQR")

})


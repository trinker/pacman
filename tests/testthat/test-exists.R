context("Checking p_exists")

test_that("p_exists works for local packages",{
	
	expect_true(p_exists(pacman, cran = FALSE))
    expect_false(p_exists(thisisnotarealpackage235asdkjlakl3lkj, cran = FALSE))
})

test_that("p_exists works for packages on CRAN",{
	
    expect_true(p_exists(ggplot2, cran = TRUE))
    expect_false(p_exists(thisisnotarealpackage235asdkjlakl3lkj, cran = TRUE))
})
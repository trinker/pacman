context("Checking p_exists")

test_that("p_exists works for local packages",{
	
	expect_true(p_exists(pacman, FALSE))
    expect_false(p_exists(thisisnotarealpackage235asdkjlakl3lkj), FALSE)
})

test_that("p_exists works for packages on CRAN",{
	
    expect_true(p_exists(ggplot2))
    expect_false(p_exists(thisisnotarealpackage235asdkjlakl3lkj))
})
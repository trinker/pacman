context("Checking p_exists")

test_that("p_exists works for local packages",{
	
	expect_true(p_exists(pacman, local = TRUE))
    expect_false(p_exists(thisisnotarealpackage235asdkjlakl3lkj, local = TRUE))
})

test_that("p_exists works for packages on CRAN",{
	
    expect_true(p_exists(ggplot2, local = FALSE))
    expect_false(p_exists(thisisnotarealpackage235asdkjlakl3lkj, local = FALSE))
})

test_that("p_isinstalled works", {
    expect_true(p_isinstalled(base))
    expect_true(p_isinstalled("base"))
    
    expect_false(p_isinstalled(thisdoesntexistsasdfasdf23s))
    expect_false(p_isinstalled("thisdoestasdflkjasflkjlkj2d"))
})
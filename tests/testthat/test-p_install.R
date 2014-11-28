context("Checking p_install")

test_that("p_install works",{
    require(pacman)
    expect_false(p_install("iDontExistAnywhere"))
})
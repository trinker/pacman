context("Checking p_install")

test_that("p_install works",{
    require(pacman)
    expect_warning(tmp <- p_install("iDontExistAnywhere"))
    expect_false(tmp)
})
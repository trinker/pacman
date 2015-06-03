context("Checking p_install_gh")

test_that("p_install_gh works",{
    require(pacman)
    expect_false(p_install_gh("greg/iDontExistAnywhere"))
})
context("Checking p_install")

test_that("p_install works",{
    skip_on_cran()
    skip_on_travis()
    require(pacman)
    expect_warning(p_install("iDontExistAnywhere"))
    tmp <- suppressWarnings(p_install("iDontExistAnywhere"))
    expect_false(tmp)
})

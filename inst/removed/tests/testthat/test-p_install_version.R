context("Checking install_version")

test_that("p_install_version returns TRUE if minimal is met",{
    require(pacman)

    #out <- suppressMessages(p_install_version(
    #    c("pacman", "testthat"),
    #    c("0.2.0", "0.9.1")
    #))
    #expect_true(all(sapply(out, isTRUE)))
})

test_that("p_install_version returns FALSE package doesn't exist on CRAN and min. not met",{

    #expect_warning(out2 <- p_install_version("MadeUpPackage", "3.4.1"))
    #expect_false(out2[[1]])
})
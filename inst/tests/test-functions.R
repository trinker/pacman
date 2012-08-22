context("Checking p_functions")

test_that("p_functions works",{
    expect_true("p_functions" %in% p_functions(pacman))
    expect_true("p_functions" %in% p_functions(pacman, all = TRUE))
    expect_false("p_getXML" %in% p_functions(pacman))
    expect_true("p_getXML" %in% p_functions(pacman, all = TRUE))
})

test_that("p_funs works as alias",{
    expect_true("p_funs" %in% p_functions(pacman))
    expect_true("p_funs" %in% p_functions(pacman, all = TRUE))
    expect_false("p_getXML" %in% p_funs(pacman))
    expect_true("p_getXML" %in% p_funs(pacman, all = TRUE))
})
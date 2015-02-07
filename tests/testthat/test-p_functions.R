context("Checking p_functions")


test_that("p_functions returns at least some function names",{

    testhat_funs <- p_functions(testthat) 
    all_testthat_funs <- p_functions(testthat, all=TRUE)
    
    expect_true(all(c("is_true", "is_false", "is_null", "expect_that") %in% testhat_funs))

})

test_that("p_functions `all = FALSE` is less than or equal to `all = TRUE`",{

    testhat_funs <- p_functions(testthat) 
    all_testthat_funs <- p_functions(testthat, all=TRUE)
    
    expect_true(length(testhat_funs) <= length(all_testthat_funs))
    #testhat_funs %in% all_testthat_funs

})

test_that("p_functions works",{
    expect_true("p_functions" %in% p_functions(pacman))
    expect_true("p_functions" %in% p_functions(pacman, all = TRUE))

})

test_that("p_funs works as alias",{
    expect_true("p_funs" %in% p_functions(pacman))
    expect_true("p_funs" %in% p_functions(pacman, all = TRUE))
})

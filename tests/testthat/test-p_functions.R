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



context("Checking p_citation")

test_that("p_citation is of correct classes",{
    expect_true(all(class(p_cite()[[1]]) %in% c("citation", "bibentry")))
})


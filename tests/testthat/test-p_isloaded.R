context("Checking p_isloaded")

test_that("p_isloaded works",{
    require(pacman)
    expect_true(p_isloaded(pacman))
    expect_false(p_isloaded(asdfasdfasdf))
    expect_that(p_isloaded(pacman, asdfasdfasdf), equals(c(pacman=TRUE, asdfasdfasdf=FALSE)))
})
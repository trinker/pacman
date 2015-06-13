context("Checking p_version")

test_that("p_version works",{
    require(lattice)
    expect_equal(p_version(), getRversion())
    expect_true(p_ver("lattice") >= "0.20.29")
})
context("Checking p_version")

test_that("p_version works",{
    expect_equal(p_version(), R.Version()[["version.string"]])
})
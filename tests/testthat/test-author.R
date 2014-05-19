context("Checking p_author")

test_that("p_author works",{
    expect_output(p_author(pacman), "Tyler Rinker \\[aut, cre, ctb\\], Dason Kurkiewicz \\[aut, ctb\\]")
    expect_output(p_author(MASS), "Brian Ripley")
    #expect_output(p_author(base), "R Core Team") # apparently changed at some point
})
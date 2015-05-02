context("Checking p_author")

test_that("p_author works",{
    expect_output(p_author(pacman), "Tyler Rinker \\[aut, cre, ctb\\], Dason Kurkiewicz \\[aut, ctb\\], Keith Hughitt \\[ctb\\]")
    expect_output(p_author(lattice), "Deepayan Sarkar <deepayan.sarkar@r-project.org>")
})
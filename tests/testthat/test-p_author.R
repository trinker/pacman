context("Checking p_author")

test_that("p_author works",{
    expect_true(
        grepl("Tyler Rinker \\[aut, cre, ctb\\].+?Dason Kurkiewicz \\[aut, ctb\\]", 
            p_author(pacman))
    )
    p_load(lattice)
    expect_equal(p_author(lattice), "Deepayan Sarkar <deepayan.sarkar@r-project.org>")
})
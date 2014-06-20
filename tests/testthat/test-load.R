context("Checking p_load")

test_that("p_load works for a single string",{

    # Hopefully MASS is available...
    expect_true(p_load("MASS"))
    expect_true(p_load("pacman"))
})

test_that("p_load works for a single non-string input",{
    expect_true(p_load(MASS))
    expect_true(p_load(pacman))
})


test_that("p_load works for a character vector", {
    success <- c(MASS=TRUE, pacman=TRUE)
    packs <- c("MASS", "pacman")
    
    expect_equal(p_load(char = packs), success)
    expect_equal(p_load(c("MASS", "pacman"), character.only = TRUE), success)
})

test_that("p_load works for individual string inputs", {
    success <- c(MASS=TRUE, pacman=TRUE)
    #expect_equal(p_load("MASS", "pacman"), success)
})

test_that("p_load works for individual non-string inputs", {
    success <- c(MASS=TRUE, pacman=TRUE)
    #expect_equal(p_load(MASS, pacman), success)
})

context("Checking p_load")

test_that("p_load works for a single string",{

    # Hopefully MASS is available...
    expect_true(p_load("MASS")[["loaded"]] == "MASS")
    expect_true(p_load("pacman")[["loaded"]] == "pacman")
})

test_that("p_load works for a single non-string input",{
    expect_true(p_load(MASS)[["loaded"]] == "MASS")
    expect_true(p_load(pacman)[["loaded"]] == "pacman")
})


test_that("p_load works for a character vector", {
    packs <- c("MASS", "pacman")
    
    expect_equal(p_load(char = packs)[["loaded"]], packs)
    expect_equal(p_load(c("MASS", "pacman"), character.only = TRUE)[["loaded"]], packs)
})

test_that("p_load works for individual string inputs", {
    success <- c("MASS", "pacman")
    expect_equal(p_load("MASS", "pacman")[["loaded"]], success)
})

test_that("p_load works for individual non-string inputs", {
    success <- c("MASS", "pacman")
    expect_equal(p_load(MASS, pacman)[["loaded"]], success)
})

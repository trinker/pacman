context("Checking p_load")

test_that("p_load/p_unload works for a single string",{

    # Hopefully lattice is available...
    expect_true(p_load("lattice"))
    expect_true("package:lattice" %in% search())
    expect_true(p_load("pacman"))
    
    p_unload("lattice")
    expect_false("package:lattice" %in% search())
})

test_that("p_load/p_unload works for a single non-string input",{
    expect_true(p_load(lattice))
    expect_true("package:lattice" %in% search())
    expect_true(p_load(pacman))
    
    p_unload(lattice)
    expect_false("package:lattice" %in% search())
})


test_that("p_load works for a character vector", {
    success <- c(lattice = TRUE, pacman = TRUE)
    packs <- c("lattice", "pacman")
    
    expect_equal(p_load(char = packs), success)
    expect_equal(p_load(c("lattice", "pacman"), character.only = TRUE), success)
    
    p_unload("lattice")
    expect_false("package:lattice" %in% search())
})

test_that("p_load works for individual string inputs", {
    success <- c(lattice = TRUE, pacman = TRUE)
    expect_equal(p_load("lattice", "pacman"), success)
    
    p_unload("lattice")
    expect_false("package:lattice" %in% search())
})

test_that("p_load works for individual non-string inputs", {
    success <- c(lattice = TRUE, pacman = TRUE)
    expect_equal(p_load(lattice, pacman), success)
    
    p_unload("lattice")
    expect_false("package:lattice" %in% search())
})

test_that("Don't unload default packages",{
    defaultPackages <- getOption("defaultPackages")
    for(pack in defaultPackages){
        p_unload(pack)
        x <- paste0("package:", pack)
        expect_true(x %in% search())
    }
})

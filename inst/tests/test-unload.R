context("Checking p_unload")

test_that("Can unload",{
    # Hopefully MASS is installed...
    MASS_loaded <- require(MASS)
    
    if(MASS_loaded){
        p_unload(MASS)
        expect_false("package:MASS" %in% search())
    }
    
    pacman_loaded <- require(pacman)
    if(pacman_loaded){
        p_unload(pacman)
        expect_false("package:pacman" %in% search())
    }
    library(pacman)

})

test_that("Don't unload default packages",{
    defaultPackages <- getOption("defaultPackages")
    for(pack in defaultPackages){
        p_unload(pack)
        x <- paste0("package:", pack)
        expect_true(x %in% search())
    }
})

test_that("")
context("Checking p_install_gh")

test_that("p_install_gh works",{
    
    # Suppress Warnings in case it was built on a different version
    # of R and we're running the tests...
    suppressWarnings(require(pacman))
    
    expect_false(p_install_gh("greg/iDontExistAnywhere"))
    
    # We don't want the package installed when testing
    # if we can install it.  If it is installed
    # we don't want to remove it after the test
    # but if it isn't installed we don't want to
    # keep it on the user's system.
    fss_exist <- FALSE
    if(p_exists("fss")){
        fss_exist <- TRUE
        p_delete("fss")
    }
    
    expect_true(p_install_gh("Dasonk/fss"))
    
    # Cleanup
    if(!fss_exist){
        p_delete("fss")
    }
    
})
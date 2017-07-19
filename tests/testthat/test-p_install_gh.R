context("Checking p_install_gh")

test_that("p_install_gh works",{
    require(pacman)
    expect_false(p_install_gh("greg/iDontExistAnywhere"))
    
    fss_exist <- FALSE
    if(p_exists("fss")){
        fss_exist <- TRUE
        p_delete("fss")
    }
    
    expect_true(p_install_gh("Dasonk/fss"))
    if(!fss_exist){
        p_delete("fss")
    }
    
})
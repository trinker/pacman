
p_load_single <- 
function (package, install = TRUE){
    # Try to load package
    if(require(package, character.only = TRUE)){
        return(TRUE)
    }
    # Loaded failed - attempt to install
    p_install(package, character.only = TRUE)
    # Try to load again
    if(require(package, character.only = TRUE)){
        return(TRUE)
    }else{
        return(FALSE)
    }
}

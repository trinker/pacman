#TODO - Rewrite this cleaner...
p_load_single <- 
function (package, install = TRUE){
    # Try to load package
    if(suppressMessages(suppressWarnings(require(package, character.only = TRUE)))){
        return(TRUE)
    }
    # Loaded failed - attempt to install
    p_install(package, character.only = TRUE)
    
    # Try to load again - return results
    suppressMessages(require(package, character.only = TRUE))

}

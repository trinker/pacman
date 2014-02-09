#TODO - Rewrite this cleaner...
# Requires input to be character
p_load_single <- 
function (package, install = TRUE, quick = FALSE, build_vignettes = !quick, 
    ...){

    # Try to load package
    if(suppressMessages(suppressWarnings(require(package, 
        character.only = TRUE)))){
    	out <- TRUE
    	names(out) <- package
        return(out)
    }
    # Loaded failed - attempt to install
    
    if(install){
        out <- p_install_single(package = package, 
            path = getOption("download_path"), 
            quick = FALSE, build_vignettes = !quick, ...) 
        # Try to load again - return results
        return(out)
    }

    # Couldn't load and we didn't want to install
    out <- FALSE
    names(out) <- package
    return(out)
}
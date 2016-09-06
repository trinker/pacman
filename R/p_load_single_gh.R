# Requires input to be character
p_load_single_gh <- 
function (package, install = TRUE, dependencies = TRUE, ...){

    ## isolate package name from script
    pack <- parse_git_repo(package)[["repo"]]

    # Try to load package
    if(p_isinstalled(pack)){
        return(suppressWarnings(require(pack, character.only = TRUE)))
    }

    # Loaded failed - attempt to install
    if(install){
        p_install_gh(package, dependencies, ...) 
        return(suppressWarnings(require(pack, character.only = TRUE)))
    }

    # Couldn't load and we didn't want to install
    return(FALSE)
}

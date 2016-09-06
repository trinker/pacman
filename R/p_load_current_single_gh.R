# Requires input to be character
p_load_current_single_gh <- 
function (package, dependencies = TRUE, ...){

    ## isolate package name from script
    pack <- parse_git_repo(package)[["repo"]]

    # Attempt to install
    p_install_gh(package, dependencies = dependencies, ...) 
    return(suppressWarnings(require(pack, character.only = TRUE)))

    # Couldn't load and we didn't want to install
    return(FALSE)
}

## Helper single version of p_install_version
p_install_version_single <- function(package, version){

    ## Determine if package is even in the users library
    if (!package %in% p_lib()){
        out <- p_install(package, character.only=TRUE)   
        if (isTRUE(out)) {
            message(sprintf(
                "\n%s not found in user's library; Version %s was installed", 
                package, utils::packageVersion(package))
            )
        }
        return(invisible(out))
    } else {

        ## If package is not in user's library check if version ok
        if (p_ver(package) < version) {
            out <- p_install(package, character.only=TRUE)   
            if (isTRUE(out)) {
                message(sprintf("\n%s was updated to v. %s", package, p_ver(package)))
            }
            return(invisible(out))
        } else {
            message(sprintf("\nVersion of %s (v. %s) is suitable", 
                package, p_ver(package)))
            return(invisible(TRUE))
        }
    }

}


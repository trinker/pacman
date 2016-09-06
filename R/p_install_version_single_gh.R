## Helper single version of p_install_version
p_install_version_single_gh <- function(package, version, dependencies = TRUE, ...){

    ## Determine if package is even in the users library
    if (!basename(package) %in% p_lib()){
        out <- p_install_gh(package, ...)   
        if (isTRUE(out)) {
            message(sprintf(
                "\n%s not found in user's library; Version %s was installed", 
                basename(package), utils::packageVersion(basename(package)))
            )
        }
        return(invisible(out))
    } else {

        ## If package is not in user's library check if version ok
        if (p_ver(basename(package)) < version) {
            out <- p_install_gh(package, dependencies = dependencies, ...)   
            if (isTRUE(out)) {
                message(sprintf("\n%s was updated to v. %s", 
                    basename(package), utils::packageVersion(basename(package))))
            }
            return(invisible(out))
        } else {
            message(sprintf("\nVersion of %s (v. %s) is suitable", 
                basename(package), utils::packageVersion(basename(package))))
            return(invisible(TRUE))
        }
    }

}


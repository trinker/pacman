# Requires input to be character
p_delete_single <-
function (package) {
	
	## Generic meta info that will be returned for use in other functions
	## this gives specifics on whther function could be deleted and why
	meta <- data.frame(package = package, can_delete = TRUE, type=NA)
	
	## Check if an installed  package
    if(!is.installed(package)) {
    	meta[["type"]] <- "not installed"
    	meta[["can_delete"]] <- FALSE    
    	message(sprintf("%s not deleted because it is %s", meta[["package"]], 
    		meta[["type"]]))    	
    	return(invisible(meta))
    }

	## Check if an installed  package
    if(is.base_package(package)) {
    	meta[["type"]] <- "base package"
    	meta[["can_delete"]] <- FALSE 
    	message(sprintf("%s not deleted because it is a %s", meta[["package"]], 
    		meta[["type"]]))
    	return(invisible(meta))
    }
	
    ## Unload package that will be deleted
    if (is.loaded_package(package)) {
    	suppressWarnings(detach(sprintf("package:%s", meta[["package"]]), 
    		character.only = TRUE, force = TRUE, unload = TRUE))
    }	

	## Force delte the package
	loc <- dirname(system.file(package = package) )
    suppressWarnings(utils::remove.packages(pkgs = package, lib = loc))
    
    return(invisible(meta))
}
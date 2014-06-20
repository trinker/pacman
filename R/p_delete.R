#' Permanently Remove Package Removal(s) From Library
#' 
#' Remove package(s) from the library permanently.  
#' 
#' @rdname p_delete
#' @param \ldots name(s) of package(s).
#' @section Warning:
#' Using this function will remove the package from your 
#' library and cannot be loaded again without reinstalling the package.
#' @seealso \code{\link[utils]{remove.packages}}
#' @keywords delete package
#' @export
#' @examples
#' \dontrun{
#' p_delete(pacman) # You never want to run this
#' }
p_delete <- function (..., char, character.only = FALSE){ 

    if(!missing(char)){
        packages <- char
    }else if(character.only){
        packages <- eval(match.call()[[2]])
    }else{
        packages <- as.character(match.call(expand.dots = FALSE)[[2]])
    }
	
    ## use `p_delete_single` to delete packages and save meta info for each
	meta_list <- invisible(suppressMessages(lapply(packages, p_delete_single)))
	
    meta_df <- do.call(rbind, meta_list)
	
    ## Message about not package or base package not being removed
    if (any(!meta_df[["can_delete"]])) {
    	
    	not_rm <- meta_df[!is.na(meta_df[["type"]]), ]
    	bases <- not_rm[["type"]] == "base package"
        not_insts <- not_rm[["type"]] == "not installed"

        ## Message about base packages
        if (any(bases)) { 
            message("The following packages are a base ", 
                "install and will not be deleted:\n", 
                paste(not_rm[bases, "package"], collapse = ", "), "\n")
        }

        ## Message about files not found
        if (any(not_insts)) {
            message("The following packages not found in library:\n", 
                paste(not_rm[not_insts, "package"], collapse = ", "), "\n")
        }	
    }

    ## Message about deleted files
    if (any(meta_df[["can_delete"]])) {
        message("The following packages have been deleted:\n",  
            paste(meta_df[meta_df[["can_delete"]], "package"], collapse = ", "))
    }
}


#' @rdname p_delete
#' @export
p_del <- p_delete

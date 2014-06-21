#' Permanently Remove Package Removal(s) From Library
#' 
#' Remove package(s) from the library permanently.  
#' 
#' @rdname p_delete
#' @param \ldots name(s) of package(s).
#' @param char Character vector containing packages to load.  If you are calling
#' \code{p_delete} from within a function (or just having difficulties calling it 
#' using a character vector input) then pass your character vector of packages 
#' to load to this parameter directly.
#' @param character.only logical. If \code{TRUE} then \code{p_load} will only 
#' accept a single input which is a character vector containing the names of 
#' packages to load.
#' @param quiet logical. Passed to \code{print.p_delete} as an attribute.  If 
#' \code{TRUE} no messages confirming package deletions are printed.
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
p_delete <- function (..., char, character.only = FALSE, quiet = FALSE){ 

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
	
	## Create a class and add the quiet attribute to pass to print method
	class(meta_df) <- c("p_delete", class(meta_df))
	attributes(meta_df)[["quiet"]] <- quiet
	
	meta_df
}


#' @rdname p_delete
#' @export
p_del <- p_delete


#' Prints a p_delete Object
#' 
#' Prints a p_delete object.
#' 
#' @param x The p_delete object.
#' @param quiet logical. If \code{TRUE} no messages confirming package deletions 
#' are printed.
#' @param \ldots ignored
#' @method print p_delete
#' @export
print.p_delete <- function(x, quiet = NULL, ...){
	
	if (is.null(quiet)) quiet <- attributes(x)[["quiet"]]
	if (quiet) return(NULL)
	
    ## Message about not package or base package not being removed
    if (any(!x[["can_delete"]])) {
    	
    	not_rm <- x[!is.na(x[["type"]]), ]
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
    if (any(x[["can_delete"]])) {
        message("The following packages have been deleted:\n",  
            paste(x[x[["can_delete"]], "package"], collapse = ", "))
    }
}

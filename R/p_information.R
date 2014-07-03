#' Package Information
#'
#' Provides the information from for a package from 
#' the \emph{NAMESPACE}.  Information may include: title, 
#' version, author, maintainer, description, depends, 
#' imports, suggests
#' 
#' @rdname p_information
#' @param package Name of the package to grab information for.  Default is 
#' \code{"base"}.
#' @param \dots Names of fields (see \code{fields} argument) to extract.
#' @param fields A character vector giving the tags of fields to return (for use
#' inside of functions rather than \ldots).
#' @note Note that the output from \code{\link[pacman]{p_information}} (when no
#' fields are passed) prints pretty but is actually an accessible list (use
#' \code{names(p_info())} test).
#' @return Returns a list of fields.
#' @keywords packageDescription info information package
#' @seealso \code{\link[utils]{packageDescription}}, 
#' \code{\link[pacman]{p_information}}
#' @export
#' @examples
#' p_information()
#' p_info()
#' names(p_info())
#' p_info()[names(p_info())]
#' p_info(pacman)
#' p_info(pacman, Author)
#' p_info(pacman, BugReports, URL)
#' p_info(pacman, fields = "Version")
#' \dontrun{
#' p_extract(p_info(ggplot2, "Depends"))
#' p_extract(p_info(ggplot2, "Imports"))
#' lapply(p_info(ggplot2, "Imports", "Depends", "Suggests"), p_extract)
#' }
p_information <-
function(package = "base", ..., fields = NULL) {

    ## check if any fields have been supplied
    info <- try(as.character(match.call(expand.dots = FALSE)[[3]]), 
        silent = TRUE)
    if(inherits(info, "try-error")) info <- NULL
    fields <- unique(c(info, fields))

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }
    if(identical(package, character(0))){
        package <- "base"
    }

    ## grab the information and return it if not fields supplied
    out <- packageDescription(package)
    if (is.null(fields)) return(out)

	## clean up extra space and \n from pretty printing
    out <- lapply(out[intersect(names(out), fields)], function(x){
        gsub("\\s+", " ", gsub("\n", " ", x))
    })
	
	if(identical(unname(out), list())) return(NULL)
	out
    
}

#' @rdname p_information
#' @export
p_info <- p_information

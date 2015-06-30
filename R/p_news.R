#' Package/R News
#'
#' Find out news on a package or R.
#' 
#' @param package Name of package (default is to see news for R).
#' @seealso \code{\link[utils]{news}}
#' @keywords news packages
#' @export
#' @examples
#' p_news()
#' p_news(lattice)
#' ## Grab specific version subsets
#' subset(p_news(lattice), Version == 0.7)  
p_news <-
function(package = NULL){   

    ## check if package is an object
    if(!object_check(package) || (!is.character(package) & !is.null(package))){
        package <- as.character(substitute(package))
    }

    if( is.null(package) || package == "r"){
        package <- "R"
    }
    # the extra parenthesis allows us to pass in object
    # containing the string of interest.
    utils::news(package = (package))
}

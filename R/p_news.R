#' View news for R or add-on packages
#'
#' Find out news on a package
#' 
#' @param package Name of package (default is to see news for R)
#' @seealso \code{\link[utils]{news}}
#' @keywords news packages
#' @export
#' @examples
#' p_news()
#' p_news(lattice)
p_news <-
function(package = NULL){   
    x <- as.character(substitute(package))
    if(identical(x, character(0)) | x == "r"){
        x <- "R"
    }
    # the extra parenthesis allows us to pass in object
    # containing the string of interest.
    news(package = (x))
}

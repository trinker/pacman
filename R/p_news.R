#' View news for R or add-on packages
#'
#' Find out news on a package
#' 
#' @aliases p_news
#' @param package name of package (default is to see news for R)
#' @seealso \code{\link[utils]{news}}
#' @keywords news packages
#' @export
#' @examples
#' p_news()
#' p_news(lattice)
p_news <-
function(package=NULL){   
    x <- as.character(substitute(package))
    if(identical(x, character(0))) x <- "R"
    if(x=="r") x <- "R"
    news(package = (x))
}

#' Compare Installed Packages with CRAN-like Repositories
#' 
#' Indicates packages which have a (suitable) later version on the repositories
#' 
#' @return Retuns a \code{\link[base]{data.frame}} with info regarding out of data packages.
#' @keywords old outdated
#' @export
#' @seealso \code{\link[utils]{old.packages}}
#' @examples
#' \dontrun{
#' p_old()
#' }
p_old <- function(){
    x <- utils::old.packages()
    x <- data.frame(x, stringsAsFactors = FALSE, row.names=NULL) 
    x[, c("Package", "Installed", "ReposVer", "Built", "LibPath")]
}
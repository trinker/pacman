#' CRAN Packages
#' 
#' \code{p_cran} - Generate a vector of all available CRAN packages.
#' 
#' @param menu logical.  If \code{TRUE} allows user to select the package and 
#' return that package name.
#' @seealso \code{\link[utils]{available.packages}}
#' @keywords CRAN package
#' @rdname p_cran
#' @export
#' @examples
#' \dontrun{
#' p_cran()
#' p_cran(TRUE)
#' 
#' p_iscran(ggplot2, folks_I_am_not_on_CRAN)
#' p_iscran(char=c("ggplot2", "folks_I_am_not_on_CRAN"))
#' }
p_cran <-
function(menu = FALSE){
    a <- available.packages()
    b <- rownames(a)  
    if(menu){
        b <- select.list(b, title = "CRAN packages")
    }
    
    return(b)          
}

#' CRAN Packages
#' 
#' \code{p_iscran} - Generate a logical vector determining if a package(s) is 
#' found on CRAN.
#' 
#' @param \ldots name(s) of package(s).
#' @param char Character vector containing packages to load.  If you are calling
#' \code{p_iscran} from within a function (or just having difficulties calling it 
#' using a character vector input) then pass your character vector of packages 
#' to this parameter directly.
#' @param character.only logical. If \code{TRUE} then \code{p_iscran} will only 
#' accept a single input which is a character vector containing the names of 
#' packages to load.
#' @rdname p_cran
#' @export
p_iscran <- function(..., char, character.only = FALSE) {

    if(!missing(char)){
        packages <- char
    }else if(character.only){
        packages <- eval(match.call()[[2]])
    }else{
        packages <- as.character(match.call(expand.dots = FALSE)[[2]])
    }
    out <- packages %in% p_cran(FALSE)
    names(out) <- packages
    out
}


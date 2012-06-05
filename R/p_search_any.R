#' Search for CRAN packages by maintainer or match 
#' by similar package names
#' 
#' Uses agrep to find packages by 
#' maintainer (often this is the author as well) or by name
#' 
#' @rdname p_search_any
#' @param term A search character string
#' @param search.by The variable to search by (takes 
#' a integer or a character string): 1-"Maintainer", 
#' 1-"Author", 2-"Package", 3-"Version"
#' @section details:
#' Useful for finding packages by the same author 
#' (usually the same as the maintainer).  This 
#' function will take some time as the function 
#' is searching thousands of packages via CRAN's website.
#' @references \url{http://cran.r-project.org/web/checks/check_summary_by_maintainer.html#summary_by_maintainer}
#' @keywords author package search
#' @export
#' @examples
#' \dontrun{
#' p_search_any("hadley", 1)
#' p_sa("hadley", "author")
#' p_sa("color", 2)
#' p_sa("psych", "package")
#' }
p_search_any <-
function (term, search.by = "Maintainer") 
{
    LIB <- list.files(.libPaths())
    #if (!"XML" %in% list.files(.libPaths())) {
    # This is essentially what require was made for
    if(!require("XML")){
        if (Sys.info()[['sysname']] == "Windows") {
            p_getXML(package = "XML", fun = "p_search_any")
        } else {
            install.packages("XML")
        }
    }
    
    ## Should probably make sure XML was able to install correctly
    require(XML)
    u1 <- "http://cran.r-project.org/web/checks/check_summary"
    u2 <- "_by_maintainer.html#summary_by_maintainer"
    URL <- paste0(u1, u2)
    ## If we loaded XML we shouldn't have to use :: syntax
    ## Unless we're worried about some other namespace collision
    dat <- XML::readHTMLTable(doc = URL, which = 1, header = T, 
                              strip.white = T, as.is = FALSE, 
                              sep = ",", 
                              na.strings = c("999", "NA", " "))
    Trim <- function(x){
        gsub("^\\s+|\\s+$", "", x)
    }

    names(dat) <- Trim(names(dat))
    if (tolower(search.by) == "author") {
        search.by <- "Maintainer"
    }
    if (is.numeric(search.by)) {
        dat[agrep(term, dat[, search.by]), 1:3]
    } else {
        dat[agrep(term, dat[, agrep(search.by, colnames(dat))]), 1:3]
    }
}

#' @rdname p_search_any
#' @export
p_sa <- p_search_any

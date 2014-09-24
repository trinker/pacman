#' Search CRAN Packages by Maintainer, Author, Version or Package
#' 
#' Uses \code{\link[base]{agrep}} to find packages by 
#' maintainer (often this is the author as well) or by name.
#' 
#' @rdname p_search_any
#' @param term A search term (character string).
#' @param search.by The variable to search by (takes 
#' a integer or a character string): 1-\code{"Maintainer"}, 
#' 1-\code{"Author"}, 2-\code{"Package"}, 3-\code{"Version"}
#' @details Useful for finding packages by the same author (usually the same as 
#' the maintainer).  This function will take some time as the function 
#' is searching thousands of packages via CRAN's website.
#' @references \url{http://cran.r-project.org/web/checks/check_summary_by_maintainer.html#summary_by_maintainer}
#' \url{http://stackoverflow.com/a/10082624/1000343}   
#' @keywords author package search
#' @author BondedDust (stackoverflow.com) and Tyler Rinker <tyler.rinker@@gmail.com>
#' @export
#' @examples
#' \dontrun{
#' p_search_any("hadley", 1)
#' p_sa("hadley", "author")
#' p_sa("color", 2)
#' p_sa("psych", "package")
#' }
p_search_any <-
function (term, search.by = "Maintainer") {
    LIB <- list.files(.libPaths())

	## Load and check XML package
    xml_mess <- suppressPackageStartupMessages(p_load(char="XML"))
	if (!xml_mess) stop("Unable to install/load the XML package")

    u1 <- "http://cran.r-project.org/web/checks/check_summary"
    u2 <- "_by_maintainer.html#summary_by_maintainer"
    URL <- paste0(u1, u2)
    dat <- XML::readHTMLTable(doc = URL, which = 1, header = TRUE, 
    	strip.white = TRUE, as.is = FALSE, sep = ",", 
    	na.strings = c("999", "NA", " "))

    names(dat) <- Trim(names(dat))
    if (tolower(search.by) == "author") {
        search.by <- "Maintainer"
    }
    if (is.numeric(search.by)) {
        dat <- dat[agrep(term, dat[, search.by]), 1:3]
    } else {
        dat <- dat[agrep(term, dat[, agrep(search.by, colnames(dat))]), 1:3]
    }
	rownames(dat) <- NULL
    class(dat) <- c("search_any", class(dat))
    return(dat)	
}

#' @rdname p_search_any
#' @export
p_sa <- p_search_any


#' Prints a search_any Object
#' 
#' Prints a search_any object.
#' 
#' @param x The search_any object.
#' @param \ldots ignored
#' @method print search_any
#' @export
print.search_any <-
function(x, ...) {
    width <- options()[["width"]]
    options(width=10000)
    on.exit(options(width=width))
    print.data.frame(left.just(x, 1:2))
    return()
}


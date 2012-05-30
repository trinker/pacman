p_sa <-
function (term, search.by = "Maintainer") 
{
    LIB <- list.files(.libPaths())
    if (!"XML" %in% list.files(.libPaths())) {
        if (Sys.info()[['sysname']]=="Windows") {
            p_getXML(package="XML", fun="p_search_any")
        } else {
            install.packages("XML")
        }
    }
    require(XML)
    u1 <- "http://cran.r-project.org/web/checks/check_summary"
    u2 <- "_by_maintainer.html#summary_by_maintainer"
    URL <- paste0(u1, u2)
    dat <- XML::readHTMLTable(doc = URL, which = 1, header = T, 
                              strip.white = T, as.is = FALSE, sep = ",", na.strings = c("999", 
                                                                                        "NA", " "))
    Trim <- function(x) gsub("^\\s+|\\s+$", "", x)
    names(dat) <- Trim(names(dat))
    if (tolower(search.by) == "author") 
        search.by <- "Maintainer"
    if (is.numeric(search.by)) {
        dat[agrep(term, dat[, search.by]), 1:3]
    }
    else {
        dat[agrep(term, dat[, agrep(search.by, colnames(dat))]), 
            1:3]
    }
}
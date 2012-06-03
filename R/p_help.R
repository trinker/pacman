#' Generate an html, web or pdf package help manual
#'
#' Generate an html, web or pdf of a package's help manual
#' 
#' @param package name of package
#' @param web logical.  If TRUE grabs current help manual from the web
#' @param pdf logical.  If TRUE uses a LaTeX compiler to generate a pdf
#' @section Warning:
#' To use the pdf argument you must have a pdf compiler (e.g. MikTex) installed.
#' @keywords help manual package
#' @seealso \code{\link[utils]{help}}
#' @export
#' @examples
#' \dontrun{
#' p_help()
#' p_help(pacman)
#' p_help(pacman, web=TRUE)
#' p_help(pacman, pdf=TRUE)
#' }
p_help <- 
function (package = NULL, web = FALSE, pdf = FALSE) 
{
    x <- as.character(substitute(package))
    if (identical(x, character(0))) 
        x <- "base"
    y <- list.files(.libPaths())
    if (web) {
        if (!"XML" %in% list.files(.libPaths())) {
            if (Sys.info()[['sysname']]=="Windows") {
                p_getXML(package="XML", 
                    fun="web argument for p_help")
            } else {
                install.packages("XML")
            }
        }   
        suppressPackageStartupMessages(p_load(XML))
        url <- "http://stat.ethz.ch/R-manual/R-patched/library/"
        doc <- XML::htmlTreeParse(url, useInternalNodes = TRUE)
        content <- getNodeSet(doc, "//pre//text()")
        content <- sapply(content, xmlValue)
        content <- content[10:length(content)]
        content <- data.frame(x = content[c(T, F)], 
            y = content[c(F, T)], stringsAsFactors = FALSE)[, 1]
        base <- gsub("/", "", content, fixed = T)
        if (!(x %in% base)) {
            p1 <- "http://cran.r-project.org/web/packages/"
            browseURL(paste0(p1, x, "/", x, ".pdf"))
        } else {
            p1 <- "http://stat.ethz.ch/R-manual/"
            p2 <- "R-patched/library/"
            browseURL(paste0(p1, p2, x, "/html/00Index.html"))
        }
    } else {
        if (!pdf) {
            if (x %in% y) {
                j <- options()$help_type
                on.exit(options(help_type = j))
                options(help_type = "html")
                help(package = (x))
            } else {
                z <- "http://cran.r-project.org/web/packages/"
                browseURL(paste0(z, x, "/", x, ".pdf"))
            }
        } else {
            w <- paste0(getwd(), "/", x, ".pdf")
            if (file.exists(w)) {
                shell.exec(w)
            } else {
                path <- find.package(x)
                system(paste(shQuote(file.path(R.home("bin"), 
                    "R")), "CMD", "Rd2pdf", shQuote(path)))
            }
        }
    }
}

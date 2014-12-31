#' Package Help Manual
#'
#' Generate an html, web or pdf of a package's help manual.
#' 
#' @param package Name of package.
#' @param web logical.  If \code{TRUE} grabs current pdf help manual from the 
#' web (\code{pdf} argument is ignored).
#' @param build.pdf logical.  If \code{TRUE} attempts to locate the file first 
#' and ten uses a LaTeX compiler to generate a pdf.
#' @section Warning:
#' Setting \code{build.pdf = TRUE} requires the user to have a pdf compiler (e.g., 
#' \href{http://miktex.org/}{MikTex} or 
#' \href{https://www.tug.org/texlive/}{Tex Live}) installed.
#' @keywords help manual package
#' @seealso \code{\link[utils]{help}}
#' @export
#' @references \url{http://r.789695.n4.nabble.com/Opening-package-manual-from-within-R-td3763938.html}
#' @examples
#' \dontrun{
#' p_help()
#' p_help(pacman)
#' p_help(pacman, web=TRUE)
#' p_help(pacman, build.pdf=TRUE)
#' }
p_help <- 
function (package = NULL, web = TRUE, build.pdf = FALSE) {

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }
    
    if (identical(package, character(0))) 
        package <- "base"
    y <- list.files(.libPaths())

    if (isTRUE(web)) {

        ## Load and check XML package
        xml_mess <- suppressPackageStartupMessages(p_load(char="XML"))
	  if (!xml_mess) stop("Unable to install/load the XML package")
    	
    	  url <- "http://stat.ethz.ch/R-manual/R-patched/library/"
        doc <- XML::htmlTreeParse(url, useInternalNodes = TRUE)
        content <- XML::getNodeSet(doc, "//pre//text()")
        content <- sapply(content, XML::xmlValue)
        content <- content[10:length(content)]
        content <- data.frame(x = content[c(TRUE, FALSE)], 
            y = content[c(F, T)], stringsAsFactors = FALSE)[, 1]
        base <- gsub("/", "", content, fixed = TRUE)
        if (!(package %in% base)) {
            p1 <- "http://cran.r-project.org/web/packages/"
            browseURL(paste0(p1, package, "/", package, ".pdf"))
        } else {
            p1 <- "http://stat.ethz.ch/R-manual/"
            p2 <- "R-patched/library/"
            browseURL(paste0(p1, p2, package, "/html/00Index.html"))
        }
    } else {
        if (!build.pdf) {
            if (package %in% y) {
                j <- options()[["help_type"]]
                on.exit(options(help_type = j))
                options(help_type = "html")
                help(package = (package))
            } else {
                z <- "http://cran.r-project.org/web/packages/"
                url_string <- paste0(z, package, "/", package, ".pdf")
                url_check <- suppressWarnings(try(url(url_string, open="rb"), silent=TRUE))
                
                if (inherits(url_check, "try-error") ) {
                    message("Failed to establish connection to:\n", url_string)
                    return(invisible(FALSE))
                }
                browseURL(url_string)

            }
        } else {
            w <- paste0(package, ".pdf")
            if (file.exists(w)) {
            	if (p_detectOS() == "Windows") {
                    shell.exec(w)
            	} else {
            		try(system(w), silent=TRUE)
            		return(w)
            	}
            } else {
                path <- find.package(package)
                system(paste(shQuote(file.path(R.home("bin"), 
                    "R")), "CMD", "Rd2pdf", shQuote(path)))
            }
        }
    }
}

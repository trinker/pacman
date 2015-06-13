#' Package Version
#' 
#' \code{p_version} - Determine what version a package is in your library.
#' 
#' @rdname p_version
#' @param package Name of package (default returns R version).
#' @seealso  \code{\link[utils]{packageDescription}}
#' @keywords package version
#' @export
#' @examples
#' \dontrun{
#' p_ver()
#' p_version()
#' p_ver(pacman)
#' p_version(pacman)
#' 
#' p_ver_cran()
#' p_ver_cran(pacman)
#' }
p_version <-
function(package="R") {

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }

    if (package %in% c("r", "R")){
        R.Version()[["version.string"]]
    } else {
        packageVersion(package)
    }
}

#' @rdname p_version
#' @export
p_ver <- p_version


#' Package Version
#' 
#' \code{p_version_cran} - Determine what version a package is on CRAN.
#' 
#' @rdname p_version
#' @export
p_version_cran <- function (package = "R") {

    if (!object_check(package) || !is.character(package)) {
        package <- as.character(substitute(package))
    }

    if (package %in% c("r", "R")) {
        cur_r <- "http://rversions.r-pkg.org/r-release"
        info <- paste(scan(file=cur_r, what = "", quiet = TRUE), collapse=" ")
        info <- regmatches(info, gregexpr("(version\\s*:\\s*)(.*?)(\\s*,)", 
            info, perl = TRUE))[[1]]
        numeric_version(gsub("(^version[ :]+)|([ ,]+$)", "", info))
    } else {
        a <- utils::available.packages()
        numeric_version(a[rownames(a) %in% package, "Version"])
    }
}


#' @rdname p_version
#' @export
p_ver_cran <- p_version_cran
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
#'
#' ## Compare local to CRAN version
#' p_ver(pacman) == p_ver_cran(pacman)
#' p_ver(pacman) > p_ver_cran(pacman)
#' 
#' p_ver_diff()
#' p_ver_diff(pacman)
#' }
p_version <-
function(package="R") {

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }

    if (package %in% c("r", "R")){
        getRversion()
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

#' Package Version
#' 
#' \code{p_version_difference} - Determine version difference between a local 
#' package and CRAN.
#' 
#' @rdname p_version
#' @export
p_version_diff <- 
function (package = "R") {

    ## check if package is an object
    if (!object_check(package) || !is.character(package)) {
        package <- as.character(substitute(package))
    }

    ## Get the CRAN version of the package/R
    if (package %in% c("r", "R")) {
        cur_r <- "http://rversions.r-pkg.org/r-release"
        info <- paste(scan(file = cur_r, what = "", quiet = TRUE), 
            collapse = " ")
        info <- regmatches(info, gregexpr("(version\\s*:\\s*)(.*?)(\\s*,)", 
            info, perl = TRUE))[[1]]
        cran <- numeric_version(gsub("(^version[ :]+)|([ ,]+$)", "", info))
    } else {
        a <- utils::available.packages()
        cran <- numeric_version(a[rownames(a) %in% package, "Version"])
    }

    ## Get the Local version of the package/R
    if (package %in% c("r", "R")) {
        myver <- getRversion()
    } else {
        myver <- packageVersion(package)
    }

    ## Compare Local/CRAN and generate difference message
    if(myver == cran) {
        mess <- "Equal to CRAN"
    } else {
        if(myver > cran) {
            mess <- "Ahead of CRAN"
        } else {
            mess <- "Behind CRAN"
        }
    }

    out <- list(Local = myver, CRAN = cran)
    class(out) <- "p_version_diff"
    attributes(out)[["message"]] <- mess 
    attributes(out)[["package"]] <- package
    out
}

#' Prints a p_version_diff Object
#' 
#' Prints a p_version_diff object.
#' 
#' @param x The p_version_diff object.
#' @param \ldots ignored
#' @method print p_version_diff
#' @export
print.p_version_diff <- function(x, ...){

    message(sprintf("Local %s is %s", attributes(x)[["package"]], attributes(x)[["message"]]))
    message(sprintf("\nLocal: %s", x[["Local"]]))
    message(sprintf("CRAN:  %s", x[["CRAN"]]))

}

#' @rdname p_version
#' @export
p_ver_diff <- p_version_diff


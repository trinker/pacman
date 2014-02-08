#' Installs & Loads Packages 
#' 
#' Installs a package provided the package is a CRAN package.
#' 
#' @rdname p_install
#' @param package Name of package(s).
#' @param character.only logical.  If \code{TRUE} \code{\dots} is treated a 
#' character string.
#' @param \ldots Additional parameters to pass to \code{install.packages}.
#' @param path The path to the directory that contains the package.  It is 
#' convenient to set \code{download_path} in .Rprofile options to the downloads 
#' directory.
#' @keywords install package
#' @seealso \code{\link[utils]{install.packages}}
#' @export
#' @examples
#' \dontrun{p_install(pacman)}
p_install <-
function(package, character.only = FALSE, path = getOption("download_path"), ...){

    if(!character.only){
        package <- as.character(substitute(package))
    }

    ## Detect if package ends in zip/tar.gz
    if (grepl("\\.tar\\.gz|\\.zip", package)) {

        if (file.exists(package)) {
            tar_path <- package
        } else {
            if (file.exists(file.path(path, package))) {
                tar_path <- file.path(path, package)
            } else {
                message("Package not found. Please select file...")
                tar_path <- file.choose()
            }      
        }
        install.packages(tar_path, repos = NULL, type = "source", ...)
    } else {
      
        p_set_cranrepo()

        if (p_loaded(char = package)) {
            p_unload(char = package)
        }

        ## Handling if no package supplied
        if (length(package) == 1 && package == "") {
            package <- NULL 
        } 

        install.packages(package, ...)

    }
    pack <- ifelse(is.null(package), "Your package", package)
    message(sprintf("\n%s installed", pack))
}

#' @rdname p_install
#' @export
p_get <- p_install


## Attempts to Install a Package From CRAN
## 
## Attempts to install package from CRAN and returns logical success.
## 
## @param package A CRAN package name.
## @param \ldots Other arguments passed to \code{\link[utils]{install.packages}}
## @return Invisibly returns logical value of success after attempting to install.
## @seealso \code{\link[utils]{install.packages}}
## @examples
## \dontrun{p_install_cran("pacman")}
p_install_cran <- function(package, ...) {

    p_set_cranrepo()

    if (p_loaded(char = package)) {
        p_unload(char = package)
    }

    ## Handling if no package supplied
    if (length(package) == 1 && package == "") {
        package <- NULL 
    } 

    ## Install and give TRUE/FALSE if package could be installed
    warns <- function(x) x
    outcome <- tryCatch(install.packages(package, ...), condition=warns) 
    out <- ifelse(inherits(outcome, "simpleWarning"), FALSE, TRUE)
    names(out) <- package
    return(invisible(out))

}

## Attempts to Install a Package From tar.gz/.zip
## 
## Attempts to install package from tar.gz/.zip and returns logical success.
## 
## @param package A quoted character string of the name/partial name of the 
## package to install as zip/tar.
## @param path The path to the directory that contains the package.  It is 
## convenient to set \code{download_path} in .Rprofile options to the downloads 
## directory.
## @param \ldots Other arguments passed to \code{\link[utils]{install.packages}}
## @return Invisibly returns logical value of success after attempting to install.
## @seealso \code{\link[utils]{install.packages}}
p_install_source <- function(package, path = getOption("download_path"), ...) {

    type <- p_source_type(package)

    if (type == "source_downloads") {
        package <- file.path(path, package)
    } 

    ## Install and give TRUE/FALSE if package could be installed
    warns <- function(x) x
    outcome <- tryCatch(install.packages(package, repos = NULL, 
        type = "source", ...), condition=warns) 
    out <- ifelse(inherits(outcome, "simpleWarning"), FALSE, TRUE)
    names(out) <- package
    return(invisible(out))

}

## Attempts to Install a Package From GitHub
## 
## Attempts to install package from GitHub and returns logical success.
## 
## @param repo Repository address in the format 
## \code{[username/]repo[/subdir][@ref|#pull]}. Alternatively, you can specify 
## \code{username}, \code{subdir}, \code{ref} or \code{pull} using the 
## respective parameters (see \code{\link[devtools]{install_github}}); if both 
## is specified, the values in \code{repo} take precedence.
## @param \ldots Other arguments passed to \code{\link[devtools]{install_github}}
## @return Invisibly returns logical value of success after attempting to install.
## @examples
## \dontrun{p_install_github("pacman")}
p_install_github <- function(repo, ...) {

    require(devtools)

    ## Install and give TRUE/FALSE if package could be installed
    outcome <- try(install_github(repo = repo, ...))
    out <- ifelse(inherits(outcome, "try-error"), FALSE, TRUE)
    names(out) <- package
    return(invisible(out))

}

## Helper function for p_install.  Not exporting or documenting for now
##
## Check the Type/Location of a Package
## 
## Checks if a package is a local zip/tar.gz (\code{"source"}), on CRAN 
## (\code{"cran"}), or GitHub (\code{"github"}).
## 
## @param package The package to check the type/location of.
## @return Returns a character vector of package source type: \code{c("source", 
## "cran", "github")}.
## @note If package is not course or CRAN then source is assumed.
## @examples
## p_source_type("tm")
p_source_type <- function(package, path = getOption("download_path")) {

    ## Check if file is zip/tar.gz
    zip_check <- grepl("\\.tar\\.gz|\\.zip", package)

    ## Further checks of zip/tar.gz to make sure file exists
    if (zip_check) {

        ## Check if zip/tar.gz is local
        zip_loc_check <- file.exists(package)
        if (zip_loc_check) return("source")

        if (!is.null(path)) {
            ## Check if zip/tar.gz is local in downloads
            zip_download_check <- file.exists(file.path(path, package))
            if (zip_download_check) return("source_downloads")
        }

        ## Check isf zip/tar.gz is web based
        require(RCurl)
        zip_web_check <- url.exists(package)
        if (zip_web_check) {
            return("source") 
        } else {
            message(sprintf("%s can not be located", package))
            return(invisible(NA))
        }
    }

    ## Check if CRAN
    cran_check <- p_iscran(char=package)
    if (cran_check) return("cran")

    ## If not found github assumed
    ## I don't like this and would like logical checking in future
    return("github")

}


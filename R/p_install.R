#' Installs & Loads Packages 
#' 
#' Installs and attempts to load a package .
#' 
#' @rdname p_install
#' @param \ldots name(s) of package(s).
#' @param char Character vector containing packages to load.  If you are calling
#' \code{p_install} from within a function (or just having difficulties calling it 
#' using a character vector input) then pass your character vector of packages 
#' to this parameter directly.
#' @param character.only logical.  If \code{TRUE} \code{\dots} is treated a 
#' character string.
#' @param path The path to the directory that contains the package.  It is 
#' convenient to set \code{download_path} in .Rprofile options to the downloads 
#' directory.
#' @param quick if \code{TRUE} skips docs, multiple-architectures,
#' demos, and vignettes, to make installation as fast as possible.
#' @param build_vignettes if \code{TRUE}, will build vignettes. Normally it is
#' \code{build} that's responsible for creating vignettes; this argument makes
#' sure vignettes are built even if a build never happens (i.e. because 
#' \code{local = TRUE}.
#' @keywords install package
#' @references Helper function \code{github_parse_path} taken from devtools: 
#' \url{https://github.com/hadley/devtools/blob/master/R/install-github.r}.
#' @seealso 
#' \code{\link[utils]{install.packages}},
#' \code{\link[devtools]{install_github}}
#' @export
#' @examples
#' \dontrun{p_install(pacman)}
p_install <-
function(..., char, character.only = FALSE, path = getOption("download_path"), 
    quick = FALSE, build_vignettes = !quick){

    if(!missing(char)){
        packages <- char
    }else if(character.only){
        packages <- eval(match.call()[[2]])
    }else{
        packages <- as.character(match.call(expand.dots = FALSE)[[2]])
    }
	
    ## Grab packages
    out <- sapply(packages, p_install_single, path = path, quick = quick, 
        build_vignettes = build_vignettes, USE.NAMES = FALSE)	

    # Attempt to load packages making note of which don't load
    loaded <- sapply(names(out)[out], require, character.only = TRUE)
    # Give a warning if some packags couldn't be installed/loaded
    if(!all(out)){
        warning("\n\nFailed to install the following:\n", 
            paste(names(out)[!out], collapse=", "))
    }
    if(!all(loaded)){
        warning("\n\nFailed to load the following:\n", 
            paste(names(loaded)[!loaded], collapse=", "))
    }
    if(any(loaded)){
        message("\n\npacman loaded the following:\n", 
            paste(names(loaded)[loaded], collapse=", "))
    }
	return(invisible(
        list(notinstall=names(out)[!out], 
        notloaded=names(loaded)[!loaded], 
        loaded=names(loaded)[loaded]
     )))
}

#' @rdname p_install
#' @export
p_get <- p_install

## Helper Not exported at this time
##
## Installs & Loads Package 
## 
## Installs and loads a single package.
## 
## @param repo Repository address in the format 
## \code{[username/]repo[/subdir][@ref|#pull]}. Alternatively, you can specify 
## \code{username}, \code{subdir}, \code{ref} or \code{pull} using the 
## respective parameters (see \code{\link[devtools]{install_github}}); if both 
## is specified, the values in \code{repo} take precedence.
## @param path The path to the directory that contains the package.  It is 
## convenient to set \code{download_path} in .Rprofile options to the downloads 
## directory.
## @param quick if \code{TRUE} skips docs, multiple-architectures,
## demos, and vignettes, to make installation as fast as possible.
## @param build_vignettes if \code{TRUE}, will build vignettes. Normally it is
## \code{build} that's responsible for creating vignettes; this argument makes
## sure vignettes are built even if a build never happens (i.e. because 
## \code{local = TRUE}.
## @param \ldots Other arguments passed to \code{\link[utils]{install.packages}} 
## or \code{\link[devtools]{install_github}}
## @references Helper function \code{github_parse_path} taken from devtools: 
## \url{https://github.com/hadley/devtools/blob/master/R/install-github.r}.
## @seealso 
## \code{\link[utils]{install.packages}},
## \code{\link[devtools]{install_github}}
p_install_single <-
function(package, path = getOption("download_path"), quick = FALSE, 
    build_vignettes = !quick, ...){

    type <- p_source_type(package)

    switch(type,
        cran = {p_install_cran(package, ...)},
        source = {p_install_source(package, ...)},
        source_downloads = {p_install_source(file.path(path, package), ...)},
        github = {message("\nGitHub package: This may take a few moments...")
            flush.console()
            p_install_github(repo = package, quick = quick, 
                build_vignettes = build_vignettes, ...)},
    )

}

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
    if (source_type(package) == "tar.gz") {
        outcome <- tryCatch(install.packages(package, repos = NULL, 
            type = "source", ...), condition=warns) 
    } else {
        outcome <- tryCatch(install.packages(package, repos = NULL, 
            ...), condition=warns) 
    }
    out <- ifelse(inherits(outcome, "simpleWarning"), FALSE, TRUE)
    names(out) <- package_name_source(package)
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
p_install_github <- function(repo, quick = FALSE, 
    build_vignettes = !quick, ...) {

    install_github <- NULL
    require(devtools)

    ## Install and give TRUE/FALSE if package could be installed
    outcome <- try(install_github(repo = repo, quick = quick, 
        build_vignettes = build_vignettes, ...))
    out <- ifelse(inherits(outcome, "try-error"), FALSE, TRUE)
    names(out) <- parse_github_package(repo)
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
        url.exists <- NULL
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

## A helper function designed to grab the package name of a source file
package_name_source <- function(package) {
	
    ## Determine if zip/tar.gz or else	
    ext <- source_type(package)
    FUN <- match.fun(switch(ext,
        tar.gz = "untar",
        zip = "unzip",
        stop("Not a .tar.gz or .zip file")
    ))

    ## unzip/untar to temp directory, read in DESCRIPTION and determine 
    ## the package name
    temp <- tempdir()
    FUN(package, exdir = temp)
    out <- c(read.dcf(list.files(temp, pattern="DESCRIPTION", recursive=TRUE, 
        full.names=TRUE), "Package"))
    unlink(temp, recursive = TRUE, force = FALSE)
    out
}

## A helper function to detemrine source file's (tar.gz/zip) file ext
source_type <- function(x) {
    nchars <- nchar(x)
    if (substring(x, nchars - 6, nchars) == ".tar.gz") return("tar.gz")
    if (substring(x, nchars - 3, nchars) == ".zip") return("zip")
    return(warning("Doesn't appear to be a .zip or .tar.gz file"))
}


## Taken from devtools github
# Parse a GitHub path of the form [username/]repo[/subdir][#pull|@ref]
github_parse_path <- function(path) {
  username_rx <- "(?:([^/]+)/)?"
  repo_rx <- "([^/@#]+)"
  subdir_rx <- "(?:/([^@#]+))?"
  ref_rx <- "(?:@(.+))"
  pull_rx <- "(?:#([0-9]+))"
  ref_or_pull_rx <- sprintf("(?:%s|%s)?", ref_rx, pull_rx)
  github_rx <- sprintf("^(?:%s%s%s%s|(.*))$",
                       username_rx, repo_rx, subdir_rx, ref_or_pull_rx)

  params <- c("username", "repo", "subdir", "ref", "pull", "invalid")
  replace <- setNames(sprintf("\\%d", seq_along(params)), params)
  ret <- lapply(replace, function(r) gsub(github_rx, r, path, perl = TRUE))
  if (ret$invalid != "")
    stop(sprintf("Invalid GitHub path: %s", path))
  ret[sapply(ret, nchar) > 0]
}

## Helper function to grab repo name
parse_github_package <- function(x) github_parse_path(x)[["repo"]]

## Find names of package type (cran, github or source)
package_name <- function(x) {

    sapply(x, function(x) {

         type <- p_source_type(x)
         switch(type,
             cran = return(x),
             github = parse_github_package(x),
             source = package_name_source (x),
             warning(NA)
         )
         
    })

}
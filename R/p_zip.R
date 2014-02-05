#' Install zip/tar
#' 
#' Installs zip/tar packages.  This is convenient to set \code{download_path} in 
#' .Rprofile options to the downloads directory.
#' 
#' @rdname p_zip
#' @param package A quoted character string of the name/partial name of the 
#' package to install as zip/tar.
#' @param path The path to the directory that contains the package.  It is 
#' convenient to set \code{download_path} in .Rprofile options to the downloads 
#' directory.
#' @keywords zip tar tar.gz source
#' @export
p_zip <- 
function(package = NULL, path = getOption("download_path")){

    # error handling if path not provided
    if(is.null(path)) {
        install.packages(file.choose(), .libPaths()[1L], repos = NULL)
    } else {
        files <- dir(path)
    
        # grab all zip or gz files
        extMatch <- c("zip", "gz") 
        # Should we add an imports for this?
        files <- files[tools::file_ext(files) %in% extMatch]
        # interactively select files
        if (is.null(package)) {
            selectedPackage <- select.list(files, title = "sources")
        } else {
            possMatches <- files[agrep(package, files, max.distance = 0)]
            if (length(possMatches)==0) {
                stop("no packages match: ", package)
            }
            selectedPackage <- select.list(possMatches, title = "sources")
        }
        # install the package
        install.packages(file.path(path, selectedPackage), .libPaths()[1L], repos = NULL)
    }
    message(paste(selectedPackage, "installed\n"))
}

#' @rdname p_zip
#' @export
p_tar <- p_zip

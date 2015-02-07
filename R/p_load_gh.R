#' Load One or More GitHub Packages 
#'
#' This function is a wrapper for \code{\link[devtools]{install_github}} and 
#' \code{\link[base]{require}}.  It checks to see if a 
#' package is installed, if not it attempts to install the package from 
#' \href{https://github.com}{GitHub}.
#' 
#' @param \ldots Repository address(es) in the format 
#' \code{username/repo[/subdir][@@ref|#pull]}.  Note that this must be a character string.
#' @param char Character vector containing repository address to load.  If you are calling
#' \code{p_load_gh} from within a function (or just having difficulties calling it 
#' using a character vector input) then pass your character vector of packages 
#' to load to this parameter directly.
#' @param install logical.  If \code{TRUE} will attempt to install a package not 
#' found in the library.
#' @param update logical.  If \code{TRUE} will attempt to update all out of date 
#' packages.  Default allows the user to set a \code{"pac_update"} in his/her 
#' .Rprofile.
#' @seealso 
#' \code{\link[devtools]{install_github}}
#' \code{\link[base]{library}},
#' \code{\link[base]{require}}
#' @export
#' @examples
#' \dontrun{
#' p_load_gh("Dasonk/Dmisc", "trinker/regexr")
#' 
#' p_load_gh(c("trinker/regexTools",
#'     "hadley/lubridate",
#'     "ramnathv/rCharts"))
#' }
p_load_gh <- 
function (..., char, install = TRUE, update = getOption("pac_update")){ 

    if (!missing(char)){
        packages <- char
    } else {
        packages <- unlist(list(...))
    }

    ## Return NULL if no packages are passed
    if(length(packages) == 0){
        return(invisible())
    }

    # Update all packages
    if (!is.null(update) && update){
        p_update()
    }

    # Attempt to load packages making note of which don't load
    loaded <- suppressMessages(sapply(packages, p_load_single_gh, install = install))
    # Give a warning if some packags couldn't be installed/loaded
    if(!all(loaded)){
        failed <- packages[!loaded]
        # TODO: We should make this more descriptive
        # Could it not load - or could it not install?
        warning("\nFailed to install/load:\n", paste(failed, collapse=", "))
    }

    return(invisible(loaded))
}







#' Unloads package(s)
#' 
#' Unloads package(s) or all packages
#' 
#' @param \dots name of package(s) or "all" 
#' (all removes all add on packages)
#' @param negate logical. If TRUE will unload
#' all add on packages except those provided to p_unload.
#' @note p_unload will not unload the base install packages that load when R boots up.
#' @seealso \code{\link[base]{detach}}
#' @keywords detach package
#' @export
#' @examples
#' \dontrun{
#' p_load(lattice)
#' p_loaded()
#' p_unload(lattice)
#' p_loaded()
#' 
#' p_load("lattice", "MASS")
#' p_loaded()
#' p_unload(all)
#' p_loaded() # will not work as you unloaded pacman
#'
#' p_load(lattice, MASS, foreign)
#' p_loaded()
#' p_unload(pacman, negate=TRUE)
#' p_loaded()
#' }
p_unload <- function (..., negate = FALSE) 
{
    toUnload <- as.character(match.call(expand.dots = FALSE)[[2]])
    loaded <- names(sessionInfo()[["otherPkgs"]])
    defaultPackages <- getOption("defaultPackages")
    cantUnload <- c("base", defaultPackages)
    if (negate & !any(toUnload %in% "all")) {
        toUnload <- loaded[!loaded %in% toUnload]
    }
    
    # Either not loaded or a base package
    toUnloadButNotLoaded <- toUnload[!toUnload %in% c(loaded, "all")]
    # default packages
    toUnloadButCantUnload <- toUnloadButNotLoaded[toUnloadButNotLoaded %in% cantUnload]
    # Told to unload but they aren't actually loaded
    toUnloadButNotLoaded <- toUnloadButNotLoaded[!toUnloadButNotLoaded %in% cantUnload]
    
    mt <- toUnload %in% "all"
    toUnload <- toUnload[toUnload %in% loaded]
    if (!identical(mt, logical(0)) & all(mt)) {
        toUnload <- names(sessionInfo()[["otherPkgs"]])
        x <- paste0("package:", toUnload)
        toUnload <- paste(toUnload, collapse = ", ")
        invisible(lapply(x, function(package) {
            suppressWarnings(detach(package, character.only = TRUE, 
                                    force = TRUE, unload = TRUE))
        }))
    } else {
        unload <- function(packageToUnload) {
            x <- paste0("package:", packageToUnload)
            suppressWarnings(detach(x, unload = TRUE, character.only = TRUE, 
                                    force = TRUE))
        }
        invisible(lapply(toUnload, unload))
    }
    
    ## Print messages about what was done
    if (!identical(toUnloadButCantUnload, character(0))) {
        message(paste0("The following packages are a base ", 
                       "install and will not be unloaded:\n"), 
                paste0("\b", paste(toUnloadButCantUnload, collapse = ", ")), 
                "\n\n")
    }
    if (!identical(toUnloadButNotLoaded, character(0))) {
        message("The following packages were not previously loaded:\n", 
                paste0("\b", paste(toUnloadButNotLoaded, collapse = ", ")), 
                "\n\n")
    }
    if (length(toUnload) > 0) {
        message("The following packages have been unloaded:\n",
                paste0("\b", paste(toUnload, collapse = ", ")), 
                "\n")
    }
}

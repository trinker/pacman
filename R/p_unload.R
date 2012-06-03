#' Unloads package(s)
#' 
#' Unloads package(s) or all packages
#' 
#' @param \dots name of package(s) or "all" 
#' (all removes all add on packages)
#' @param negate logical. If TRUE will uninstall 
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
p_unload <- 
function (..., negate = FALSE) 
{
    mf <- match.call(expand.dots = FALSE)
    y <- as.character(mf[[2]])
    packs <- names(sessionInfo()[["otherPkgs"]])
    if (negate & !any(y %in% "all")) {
        y <- packs[!packs %in% y]
    }
    z <- y[!y %in% c(packs, "all")]
    m <- getOption("defaultPackages")
    o <- z[z %in% c("base", m)]
    z <- z[!z %in% c("base", m)]
    mt <- y %in% "all"
    y <- y[y %in% packs]
    if (!identical(mt, logical(0)) & all(mt)) {
        y <- names(sessionInfo()[["otherPkgs"]])
        x <- paste0("package:", y)
        y <- paste(y, collapse = ", ")
        invisible(lapply(x, function(package) {
            suppressWarnings(detach(package, character.only = TRUE, 
                force = TRUE, unload = TRUE))
        }))
    } else {
        unload <- function(y2) {
            x <- paste0("package:", y2)
            suppressWarnings(detach(x, unload = TRUE, character.only = TRUE, 
                force = TRUE))
        }
        invisible(lapply(y, unload))
    }
    if (!identical(o, character(0))) {
        cat(paste0("The following packages are a base ", "install and will not be unloaded:\n"), 
            paste0("\b", paste(o, collapse = ", ")), "\n\n")
    }
    if (!identical(z, character(0))) {
        cat("The following packages were not previously loaded:\n", 
            paste0("\b", paste(z, collapse = ", ")), "\n\n")
    }
    if (length(y) > 0) {
        cat("The following packages have been unloaded:\n", paste0("\b", 
            paste(y, collapse = ", ")), "\n")
    }
}

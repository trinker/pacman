p_del <-
function (...) 
{
    mf <- match.call(expand.dots = FALSE)
    x <- as.character(mf[[2]])   
    lp <- .libPaths()[1]
    z <- x[!x %in% dir(lp)]
    m <- dir(.libPaths()[2])
    o <- z[z %in% dir(.libPaths()[2])]
    z <- z[!z %in% dir(.libPaths()[2])]
    y <- x[x %in% dir(lp)]
    y2 <- paste0("package:", y)
    w <- y %in% names(sessionInfo()[["otherPkgs"]])
    if (any(w)) {
        u <- y2[w]
        invisible(lapply(u, function(package) {
            suppressWarnings(detach(package, character.only = TRUE, 
                force = TRUE, unload = TRUE))
        }))
    }
    if (length(y) > 0){
        suppressWarnings(remove.packages(y, lib = lp))
    }
    y <- paste(y, collapse = ", ")
    if (!identical(o, character(0))) {
        cat(paste0("The following packages are a base ", 
            "install and will not be deleted:\n"), 
            paste0("\b", paste(o, collapse = ", ")), "\n\n")
    }
    if (!identical(z, character(0))) {
        cat("The following packages not found in library:\n", 
            paste0("\b", paste(z, collapse = ", ")), "\n\n")
    }
    if (length(y) > 0) {
        cat("The following packages have been deleted:\n", paste0("\b", 
            paste(y, collapse = ", ")), "\n")
    }
}
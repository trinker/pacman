p_update <-
function (install = TRUE) {
     y <- utils::old.packages()[, 1]
     packs <- names(sessionInfo()[["otherPkgs"]])
     if (any((y %in% packs)) & !is.null(packs)) {
         x <- y[na.omit(match(y, packs))]
         x <- paste0("package:", x)
         lapply(x, function(package) {
                        suppressWarnings(detach(package, 
                        character.only=TRUE, force = TRUE, 
                        unload = TRUE))
                    }
                )

     }
     cat(y, "\n")
     if (install){ 
         lapply(y, install.packages)
         cat("\n\nThe following packages:\n", 
             paste0("\b", paste(y, collapse = ",")), 
             "\n\bare updated!\n")
     }
}
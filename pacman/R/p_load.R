p_load <-
function (..., install = TRUE, update = TRUE, require = TRUE){ 
#     nonnamed <- which(names(as.list(match.call())) == "")[-1]
#     packages <- as.character(match.call())[nonnamed]
#     if(identical(packages, character(0))){
#         packages <- as.character(match.call())[-1]
#     }
    mf <- match.call(expand.dots = FALSE)
    packages <- as.character(mf[[2]])

    if (update | install){
        upper <- function(pack, Update, Install) {
            y <- utils::old.packages()[, 1]
            packs <- names(sessionInfo()[["otherPkgs"]])
            A <- all(c(pack %in% y, !pack %in% packs))
            B <- !pack %in% list.files(.libPaths())
            if ((A & Update)) {
                install.packages(pack)
            }
            if ((B & Install)) {
                install.packages(pack)
            }
        }
        lapply(packages, upper, Update = update, Install = install)
    }
    if (require) {
         invisible(lapply(packages, function(x) do.call("require", 
             list(x))))
    } else {
         invisible(lapply(packages, function(x) do.call("library", 
             list(x))))
    }
}

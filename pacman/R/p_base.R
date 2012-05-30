p_base <- 
function(open = FALSE){
    ast <- function(x) paste0(x, "*")
    w <- .libPaths()[2]
    x <- dir(w) 
    y <- c(getOption("defaultPackages"), "base")
    z <- ifelse(x %in% y, ast(x), x)
    if (open) { 
        if (.Platform['OS.type']!="windows"){
            system(paste("open", w))
        } else {
            shell.exec(w)
        }
    }
    cat('\npackages with an "*" are loaded when R starts\n\n')
    return(z)
}
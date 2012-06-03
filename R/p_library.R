p_library <-
function (open = FALSE) 
{
    x <- .libPaths()
    y <- list.files(x)
    if (open) { 
        if (.Platform['OS.type']!="windows"){
            system(paste("open", x[1]))
        } else {
            ## TODO: Possibly fix this
            ## Why only the first of the libPaths.
            ## on my system that opens the least useful library :(
            shell.exec(x[1])
        }
    }
    return(y)
}

p_lib <- p_library
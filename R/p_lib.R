p_lib <- 
function (open = FALSE) 
{
    x <- .libPaths()
    y <- list.files(x)
    if (open) { 
        if (.Platform['OS.type']!="windows"){
            system(paste("open", x[1]))
        } else {
            shell.exec(x[1])
        }
    }
    return(y)
}
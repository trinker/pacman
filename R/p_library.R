p_library <-
function (open = FALSE) 
{
    x <- .libPaths()
    y <- list.files(x)
    if (open) {
        lib <- x[1]
        if (.Platform['OS.type']!="windows"){
            ## This should give a better chance for Linux to work
            ## Works with Mac OSX 10.6
            system(paste(Sys.getenv("R_BROWSER"), lib))
        } else {
            ## TODO: Possibly fix this
            ## Why only the first of the libPaths.
            ## on my system that opens the least useful library :(
            shell.exec(lib)
        }
    }
    return(y)
}

p_lib <- p_library
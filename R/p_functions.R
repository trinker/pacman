p_functions <- 
function (package = NULL, load = FALSE) 
{
    x <- as.character(substitute(package))
    if (identical(x, character(0))) {
        x <- "base"
    }
    if (x %in% (.packages())) {  
        load <- TRUE
    }
    else {
        if (!x %in% list.files(.libPaths())) {
            install.packages(x)
        }
        else {
            require(x, character.only = TRUE)
        }
    }
    w <- paste0("package:", x)
    a <- objects(w)
    if (!load) 
        detach(w, unload = TRUE, character.only = TRUE, force = TRUE)
    return(a)
}
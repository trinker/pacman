p_exists <-
function (package, cran=TRUE) 
{
    x <- as.character(substitute(package))
    if (cran){
        a <- available.packages()
        b <- rownames(a)
        x %in% b
    } else {
        x %in% list.files(.libPaths())
    }
}
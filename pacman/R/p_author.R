p_author <-
function(package = "base"){
    x <- as.character(substitute(package))
    packageDescription(x)$Author
}

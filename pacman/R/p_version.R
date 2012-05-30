p_version <-
function(package="R") {
    x <- as.character(substitute(package.name))
    if (x%in%c("r", "R")){
        R.Version()[["version.string"]]
    } else {
        packageDescription(x)["Version"]
    }
}

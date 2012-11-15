#' Check if a repo is set
#' 
#' Check if a repo is already set and if not choose
#' an appropriate repo.
p_set_cranrepo <- function(){
    # If no repo is set then choose the main CRAN mirror
    # this way the user doesn't have to deal with the repo...
    if(options()$repos == "@CRAN@"){
        options(repos = "http://cran.r-project.org/")
    }
}
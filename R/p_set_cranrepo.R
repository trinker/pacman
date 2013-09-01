#' Check if a repo is set
#' 
#' Check if a repo is already set and if not choose
#' an appropriate repo.
p_set_cranrepo <- function(){
    # If no repo is set then choose the main CRAN mirror
    # this way the user doesn't have to deal with the repo...
    if(getOption("repos") == "@CRAN@"){
        options(repos = "http://cran.r-project.org/")
    }
    
    # Add ripley's repos on windows
    if(p_detectOS() == "Windows"){
        if(is.na(options()$repo["CRANextra"])){
            options(repos = c(options()$repos, 
                             CRANextra = "http://www.stats.ox.ac.uk/pub/RWin"))
        }
    }
}
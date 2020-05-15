#' Check if Repo is Set
#' 
#' Check if a repo is already set and if not choose an appropriate repo.
#' 
#' @param default_repo The default package repository.
p_set_cranrepo <- function(default_repo = "http://cran.rstudio.com/"){
    
	# TODO: make default_repo a package option?
	
    repos <- getOption("repos")
    
    # If no repo is set then choose the main CRAN mirror
    # this way the user doesn't have to deal with the repo...
    if("@CRAN@" %in% repos){
        repos[repos == "@CRAN@"] <- default_repo
        options(repos = repos)
    }
    
    # If there are no repos set somehow then set to default
    if(length(repos) == 0){
        options(repos = default_repo)
    }
}

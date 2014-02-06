#' Permanently Remove Package Removal(s) From Library
#' 
#' Remove package(s) from the library permanently.  
#' 
#' @rdname p_delete
#' @param \ldots name(s) of package(s).
#' @section Warning:
#' Using this function will remove the package from your 
#' library and cannot be loaded again without reinstalling the package.
#' @seealso \code{\link[utils]{remove.packages}}
#' @keywords delete package
#' @export
#' @examples
#' \dontrun{
#' p_delete(pacman) # You never want to run this
#' }
p_delete <-
function (...) {
    mf <- match.call(expand.dots = FALSE)
    packs <- as.character(mf[[2]]) 
    pack_check <- sapply(packs, function(x) system.file(package = x))
  
    ## Generate list of packages present/absent in a library 
    absent <- nulls(names(pack_check[pack_check == ""]))
    base_install <- rownames(installed.packages(priority="base"))
    bcheck <- basename(pack_check) %in% c(base_install)
    base <- nulls(basename(pack_check)[bcheck])
    present <- nulls(pack_check[!bcheck & pack_check != ""])

    ## Unload any package that will be deleted
    loaded <- basename(present) %in% names(sessionInfo()[["otherPkgs"]])
    if (any(loaded)) {
        unloads <- sprintf("package:%s", basename(present)[loaded])
        invisible(lapply(unloads, function(package) {
            suppressWarnings(detach(package, character.only = TRUE, 
                force = TRUE, unload = TRUE))
        }))
    }

    ## Force delete the files
    if (length(present) > 0){
        suppressWarnings(remove.packages(pkgs = basename(present), 
           lib = dirname(present)))
    }

    ## Message about base package not removed
    if (!is.null(base)) {
        message("The following packages are a base ", 
            "install and will not be deleted:\n", 
            paste(base, collapse = ", "), "\n")
    }

    ## Message about files not found
    if (!is.null(absent)) {
        message("The following packages not found in library:\n", 
            paste(absent, collapse = ", "), "\n")
    }

    ## Message about deleted files
    if (length(present) > 0) {
        message("The following packages have been deleted:\n",  
            paste(basename(present), collapse = ", "))
    }
}

## Helper to check for as.character(0) and turn to NULL
nulls <- function(x, ret = NULL) {
    if (identical(x, character(0))){
        x <- ret
    }    
    x
}

#' @rdname p_delete
#' @export
p_del <- p_delete

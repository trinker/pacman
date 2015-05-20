# for internal use.  Not exported
# Request: Can you add some documentation for this?
# what is it used for?  Can you add some comments to the code
# because it's a little hard to follow...
left.just <-
function(dataframe, column = NULL, keep.class = FALSE) {
    df.class <- function(dataframe) {
        sapply(1:ncol(dataframe), function(i) {
            x <- class(dataframe[, i])
            x[length(x)]
        })
    }
    CLASS <- df.class(dataframe)
    left.j <- function(x) {
        n <- max(nchar(x))
        return(sprintf(paste("%-", n, "s", sep = ""), x))
    }
    if (is.null(column)) column <- colnames(dataframe)
    lj <- function(DF2, column) {
        if (is.null(column)) column <- colnames(DF2)
        Q <- max(nchar(c(as.character(DF2[, column]), column)))
        DF2 <- data.frame(rbind(colnames(DF2), do.call(cbind,
            lapply(DF2, as.character))), check.names = FALSE)
        DF2[, column] <- left.j(as.character(DF2[, column]))     
        if (is.character(column)) {
            col <- names(DF2)[which(names(DF2) == column)]
                names(DF2)[which(names(DF2) == column)] <- sprintf(paste("%-", 
                Q, "s", sep = ""), col)
        } else {
            if (is.numeric(column)) {
                col <- names(DF2)[column]
                    names(DF2)[column] <- sprintf(paste("%-", Q, "s", 
                    sep = ""), col)
            }
        }
        DF2 <- data.frame(DF2[-1, , drop = FALSE], check.names = FALSE)
        rownames(DF2) <- NULL
        return(DF2)
    }
    if (length(column) < 2) {
        if (!is.data.frame(dataframe)) {
            y <- as.character(substitute(dataframe))
            dataframe <- data.frame(dataframe, check.names = FALSE)
            y <- if (y[1]%in%c("[", "$")) y[2] else y[1]
            names(dataframe) <- y
        }
        DF3 <- lj(DF2=dataframe, column=column)
    } else { 
        if (!is.numeric(column)) column <- match(column, names(dataframe))
        dat <- dataframe[, -c(column), drop=FALSE]
        ndf <- colnames(dataframe)
        LIST <- lapply(column, function(x) {
            lj(DF2=dataframe[, x, drop=FALSE], column = NULL)
        })
        dat2 <- data.frame(cbind(do.call('cbind', LIST), dat), checknames=FALSE)
        NAMES <- colnames(dat2)
        STrim <- function (x) gsub("^\\s+|\\s+$|\\.+$", "", x)
        newloc <- match(ndf, STrim(NAMES))
        DF3 <- dat2[, newloc]
    }
    if (keep.class) {
        colClasses <- function(d, colClasses) {
            colClasses <- rep(colClasses, len=length(d))
            d[] <- lapply(seq_along(d), function(i) switch(colClasses[i], 
                numeric=as.numeric(d[[i]]), 
                character=as.character(d[[i]]), 
                Date=as.Date(d[[i]], origin='1970-01-01'), 
                POSIXct=as.POSIXct(d[[i]], origin='1970-01-01'), 
                factor=as.factor(d[[i]]),
                as(d[[i]], colClasses[i]) ))
            d
        }
        DF3 <- colClasses(DF3, CLASS)
    }
    colnames(DF3) <- gsub("\\.(?=\\.*$)", " ", colnames(DF3), perl=TRUE)
    return(DF3)
}


paste0 <- function(..., collapse = NULL){
    paste(..., sep = "", collapse = collapse)
}

writeToClipboard  <- function(x) {
    ## The code for this helper function comes from the oveRflow package.  
    ## # https://raw.github.com/sebastian-c/oveRflow/master/R/writeClip.R
    ## This is code I submitted but was modified by the package maintainers.
    ## The idea to keep this function as a modular unit makes sense and was 
    ## subsequently applied to the pacman package
	
    OS <- Sys.info()["sysname"]
    
    if(!(OS %in% c("Darwin", "Windows", "Linux"))) {
        stop("Copying to clipboard not supported on your OS")
    }
    
    if (OS != "Windows") {
        writeClipboard <- NULL
    } 
    
    switch(OS, 
        "Darwin"={j <- pipe("pbcopy", "w")                       
            writeLines(x, con = j)                               
            close(j)   
        },
        "Windows"=writeClipboard(x, format = 1),
        "Linux"={
            if(Sys.which("xclip") == "") {
              warning("Clipboard on Linux requires 'xclip'. Try using:\nsudo apt-get install xclip")
            }
            con <- pipe("xclip -i", "w")
            writeLines(x, con=con)
            close(con)
        }
    )
}

## Function to remove leading/trailing white spaces
Trim <- function(x){
    gsub("^\\s+|\\s+$", "", x)
}


## Check if package exists on the system
is.installed <- function(x) system.file(package = x) != ""

## Check if package exists on the system
is.base_package <- function(x) {
    base_install <- rownames(installed.packages(priority="base"))
	any(x %in% c(base_install))
}	
	
## check if a package is loaded also includes namespace
is.loaded_package <- function(x = NULL, include.via.namespace = FALSE) {
    
    fields <- c("basePkgs",  "otherPkgs")
    if (include.via.namespace) {
        fields[3] <- "loadedOnly"  
    } 

    the_packages_loaded <- unlist(lapply(fields, function(x) {
        names(sessionInfo()[[x]])
    }))
    if (!is.null(the_packages_loaded)) {
        the_packages_loaded <- sort(the_packages_loaded)
    }      
    if (is.null(x)) return(the_packages_loaded)
    any(x %in% the_packages_loaded)
}

## Check the dependencies (what a package imports)
## p_dependencies("gplots")
## p_dependencies("pacman") # returns NULL
p_dependencies_single <- function(x, all=FALSE, fields = c("Depends", "Imports")) {

    ## grab Depends and Imports for package
    ## remove parenthesis, unlist, and individual character vector of packages
    depends <- comma_string2vector(unlist(packageDescription(x)[fields], 
        use.names=FALSE))

    ## return package dependencies (all includes "R" and base install packages)
    if (all) return(depends)
    out <- depends[!depends %in% c(depends[sapply(depends, is.base_package)], "R")]
    if (identical(character(0), out)) return(NULL)
    out
}

## turn strings with commas and parenthesis into elements
## Example
## comma_string2vector("one, two (>=R2D2), three")
## yields
## 1] "one"   "two"   "three"
comma_string2vector <- function (x) {
    Trim(unlist(strsplit(gsub("\\s*\\(.*?\\)\\s*", "", x), ",\\s*")))
}


p_egg <- function(x) {
	if (x %in% c("R")) {
        ee <- source(system.file("ee/ee", package = "pacman"))
        ee[["value"]]()
    }
}
	

## utility function to see if an call is 
## is an object
object_check <- function(x) {
    !inherits(try(x,silent = TRUE), "try-error")
}

## Code taken from Hadley's devtools
## https://github.com/hadley/devtools/blob/master/R/install-github.r
parse_git_repo <- function(path) {

      username_rx <- "(?:([^/]+)/)?"
      repo_rx <- "([^/@#]+)"
      subdir_rx <- "(?:/([^@#]*[^@#/]))?"
      ref_rx <- "(?:@([^*].*))"
      pull_rx <- "(?:#([0-9]+))"
      release_rx <- "(?:@([*]release))"
      ref_or_pull_or_release_rx <- sprintf("(?:%s|%s|%s)?", ref_rx, pull_rx, release_rx)
      github_rx <- sprintf("^(?:%s%s%s%s|(.*))$",
          username_rx, repo_rx, subdir_rx, ref_or_pull_or_release_rx)

      param_names <- c("username", "repo", "subdir", "ref", "pull", "release", "invalid")
      replace <- setNames(sprintf("\\%d", seq_along(param_names)), param_names)
      params <- lapply(replace, function(r) gsub(github_rx, r, path, perl = TRUE))
      if (params$invalid != "") stop(sprintf("Invalid git repo: %s", path))
      params <- params[sapply(params, nchar) > 0]

      if (!is.null(params$pull)) {
          params$ref <- devtools::github_pull(params$pull)
          params$pull <- NULL
      }

      if (!is.null(params$release)) {
          params$ref <- devtools::github_release()
          params$release <- NULL
      }

      params

}
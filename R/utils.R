# for internal use.  Not exported
# Request: Can you add some documentation for this?
# what is it used for?  Can you add some comments to the code
# because it's a little hard to follow...
left.just <- function(dataframe, column = NULL, keep.class = FALSE) {
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
        Q <- max(nchar(c(as.character(DF2[, column]), names(DF2)[column])))
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
    if (length(column)<2) {
        if (!is.data.frame(dataframe)) {
            y <- as.character(substitute(dataframe))
            dataframe <- data.frame(dataframe, check.names = FALSE)
            y <- if (y[1]%in%c("[", "$")) y[2] else y[1]
            names(dataframe) <- y
        }
        DF3 <- lj(DF2=dataframe, column=column)
    } else { 
        if (!is.numeric(column)) column <- match(column, names(dataframe))
        dat <- dataframe[, -c(column)]
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

writeToClipboard <- function(out){
    os <- p_detectOS()
    if (os != "Windows") {
        writeClipboard <- NULL
    }  		
    if(os == "Windows"){
        writeClipboard(out, format = 1)
    }else if(os == "Darwin") {           
        j <- pipe("pbcopy", "w")                       
        writeLines(out, con = j)                               
        close(j)                                    
    }else{
        message("No clipboard functionality for Linux...")
    }
}

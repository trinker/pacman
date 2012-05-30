p_interactive <-
function() {
    x <- menu(rownames(installed.packages()))
    pack <- rownames(installed.packages())[x]
    suppressWarnings(suppressPackageStartupMessages(require
        (pack, character.only = TRUE)))
    z <- switch(menu(c(cat("\n\nDo you want detach", pack, 
        "on exit?\n"), "Yes", "No")), TRUE, FALSE)
    if (z) {
        on.exit(suppressWarnings(detach(paste("package:", pack, 
            sep = ""), character.only = TRUE)))
    }
    y <- menu(objects(paste("package:", pack, sep = "")))
    cat("Available Functions\n")
    fun <- objects(paste("package:", pack, sep = ""))[y]
    z2 <- switch(menu(c(cat("\n\nDo you want to see the help page for", 
        fun, "\b?\n"), "Yes", "No")), TRUE, FALSE)
    if (z2) {
        help((fun))
    } 
    cat("Thank you for using the p_interactive function!\n\n")
}

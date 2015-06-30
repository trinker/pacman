#' Interactive Package Exploration
#' 
#' Interactively search through packages, looking at functions and optionally 
#' attaching the package and looking at the help page.
#' 
#' @rdname p_interactive
#' @keywords package
#' @export
#' @examples
#' \dontrun{
#' p_interactive()
#' p_inter()
#' }
p_interactive <-
function() {
    package_choices <- rownames(utils::installed.packages())
    choice <- utils::menu(package_choices, title = "What package do you want to examine?")
    
    package <- package_choices[choice]
    suppressWarnings(suppressPackageStartupMessages(
        require(package, character.only = TRUE))
    )
    
    detach_menu <- utils::menu(c(cat("\n\nDo you want detach", package, 
                              "on exit?\n"), "Yes", "No"))
    to_detach <- switch(detach_menu, TRUE, FALSE)
    if (to_detach) {
        # Use p_unload?
        on.exit(suppressWarnings(detach(paste("package:", package, 
            sep = ""), character.only = TRUE)))
    }
   
    function_choices <- p_functions(package, character.only = TRUE)
    function_menu <- utils::menu(function_choices, title = "Available Functions")
    fun <- function_choices[function_menu]
    
    help_menu <- utils::menu(c(cat("\n\nDo you want to see the help page for", 
                            fun, "\b?\n"), "Yes", "No"))
    to_help <- switch(help_menu, TRUE, FALSE)
    message("Thank you for using the p_interactive function!\n\n")
    if (to_help) {
        utils::help(fun)
    } 
}

#' @rdname p_interactive
#' @export
p_inter <- p_interactive

pacman
======

The pacman package is an R package management tool that combines the functionality of base library related functions into intuitively named functions.  This package is ideally added to .Rprofile to increase workflow by reducing time recalling obscurely named functions, reducing code and integrating functionality of base functions to simultaneously perform multiple actions.  

Function names in the pacman package follow the format of `p_xxx` where 'xxx' is the task the function performs.  For instance the `p_load` function allows the user to load one or more packages as a more generic substitute for the `library` or `require` functions.

## Installation

Currently there isn't a release on [CRAN](http://cran.r-project.org/).


You can, however, download the [zip ball](https://github.com/trinker/pacman/zipball/master) or [tar ball](https://github.com/yihui/knitr/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **devtools** package to install the development version:

```r
# Make sure your current packages are up to date
update.packages()
# devtools is required
library(devtools)
install_github("pacman", "trinker")

```

Note: Windows users [Rtools](http://www.murdoch-sutherland.com/Rtools/) installed to get devtools.

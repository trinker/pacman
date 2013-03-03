# pacman

The pacman package is an R package management tool that combines the functionality of base library related functions into intuitively named functions.  This package is ideally added to .Rprofile to increase workflow by reducing time recalling obscurely named functions, reducing code and integrating functionality of base functions to simultaneously perform multiple actions.  

Function names in the pacman package follow the format of `p_xxx` where 'xxx' is the task the function performs.  For instance the `p_load` function allows the user to load one or more packages as a more generic substitute for the `library` or `require` functions and if the package isn't available locally it will install it for you.

## Installation

Currently there isn't a release on [CRAN](http://cran.r-project.org/).


You can, however, download the [zip ball](https://github.com/trinker/pacman/zipball/master) or [tar ball](https://github.com/trinker/pacman/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **devtools** package to install the development version:

```r
## Make sure your current packages are up to date
update.packages()
## devtools is required
library(devtools)
install_github("pacman", "trinker")
```

Note: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](http://CRAN.R-project.org/package=devtools) to install this way.


## Help
   
For the package pdf help manual [click here](https://dl.dropbox.com/u/61803503/pacman.pdf). 
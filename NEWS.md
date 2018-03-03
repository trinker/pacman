NEWS 
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor 
  and patch)
* New additions without breaking backward compatibility bumps the minor 
  (and resets the patch)
* Bug fixes and misc changes bumps the patch



**CHANGES** IN <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> VERSION 0.4.6 -
----------------------------------------------------------------

**BUG FIXES**

**NEW FEATURES**

**MINOR FEATURES**

**IMPROVEMENTS**

**CHANGES**



**CHANGES** IN <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> VERSION 0.4.2 - 0.4.5
----------------------------------------------------------------

**BUG FIXES**

* R version 3.4.0 cause `p_install` to result in an error: 
  `Error in readRDS(dest) : error reading from connection` as noted by @arbelt
  in <a href="https://github.com/trinker/pacman/issues/90">issue #90</a>.  This was rectified in thanks to Albert Wang's pull request (see 
  <a href="https://github.com/trinker/pacman/issues/91">issue #91</a>).

**IMPROVEMENTS**

* `p_xxx_gh` functions pick up a`dependencies = TRUE` argument to 
  automatically install necessary dependencies in the same way `install.packages` 
  defaults to install dependencies (See <a href="https://github.com/trinker/pacman/issues/75">issue #75</a>).




**CHANGES** IN <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> VERSION 0.3.1 - 0.4.1
----------------------------------------------------------------

**NEW FEATURES**

* Support for Bioconductor packages added compliments of Keith Hughitt.  See #62

* `p_boot` added to generate a string for the standard **pacman** script header 
  that, when added to scripts, will ensure **pacman** is installed before 
  attempting to use it.  **pacman** will attempt to copy this string (standard 
  script header) to the clipboard for easy cut and paste.

* `p_version_cran` (`p_ver_cran`) added to check R/package version currently 
  available on CRAN.
  
* `p_version_diff` (`p_ver_diff`) added to determine version difference between 
  a local package and CRAN.
  
* `p_old` added to search for outdated packages.

* `p_install_version_gh` and `p_load_current_gh` added as partners to 
  `p_install_version` for GitHub packages.  Thanks to Steve Simpson for this: 
  https://github.com/trinker/pacman/issues/70  
  
**IMPROVEMENTS**

* `p_functions` sorts the functions alphabetically before returning them.

* `p_path` now takes a package as an argument, allowing the user to return the 
  path to individual packages as well.
  
**CHANGES**

* `p_version` returns a numeric version for `p_version("R")` to allow for 
  logical comparisons.


**CHANGES** IN <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> VERSION 0.2.0 - 0.3.0
----------------------------------------------------------------

* The first installation of <a href="https://github.com/trinker/pacman" target="_blank">pacman</a>

* Package designed to assist in package related tasks.

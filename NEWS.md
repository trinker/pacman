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


**CHANGES** IN <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> VERSION 0.3.1 - 
----------------------------------------------------------------

**BUG FIXES**

**NEW FEATURES**

* Support for Bioconductor packages added compiments of Keith Hughitt.  See #62

* `p_boot` added to generate a string for the standard  <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> script header 
  that, when added to scripts, will ensure  <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> is installed before 
  attempting to use it.   <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> will attempt to copy this string (standard 
  script header) to the clipboard for easy cut and paste.

**MINOR FEATURES**

**IMPROVEMENTS**

* `p_functions` sorts the functions alphabetically before returning them.

**CHANGES**


**CHANGES** IN <a href="https://github.com/trinker/pacman" target="_blank">pacman</a> VERSION 0.2.0 - 0.3.0
----------------------------------------------------------------

* The first installation of <a href="https://github.com/trinker/pacman" target="_blank">pacman</a>

* Package designed to assist in package related tasks.

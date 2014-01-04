<p>The pacman package is an R package management tool that combines the functionality of base library related functions into intuitively named functions.  This package is ideally added to .Rprofile to increase workflow by reducing time recalling obscurely named functions, reducing code and integrating functionality of base functions to simultaneously perform multiple actions.  </p>

<p><img src="http://github.com/trinker/pacman/blob/master/inst/pacman_logo/r_pacman.png?raw=true" width="45%"></p>

<p>Function names in the pacman package follow the format of <code>p_xxx</code> where &#39;xxx&#39; is the task the function performs.  For instance the <code>p_load</code> function allows the user to load one or more packages as a more generic substitute for the <code>library</code> or <code>require</code> functions and if the package isn&#39;t available locally it will install it for you.</p>
  
<p>Download the development version of pacman <a href="https://github.com/trinker/pacman/">here</a> 
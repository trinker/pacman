\name{p_load}
\alias{p_load}
\title{Load one or more packages}
\usage{
  p_load(..., install = TRUE,
    update = getOption("pac_update"))
}
\arguments{
  \item{\ldots}{name(s) of package(s)}

  \item{install}{logical.  If TRUE will attempt to install
  a package not found in the library}

  \item{update}{logical.  If TRUE will attempt to update
  all out of date packages.  Default allows the user to set
  a \code{"pac_update"} in their .Rprofile}
}
\description{
  This function is a wrapper for library and require. It
  checks to see if a package is installed, if not it
  attempts to install the package from CRAN and/or any
  other repository in the pacman repository list.
}
\examples{
\dontrun{
p_load(lattice)
p_unload(lattice)
p_load(lattice, foreign, boot, rpart)
p_loaded()
p_unload(lattice, foreign, boot, rpart)
p_loaded()
}
}
\seealso{
  \code{\link[base]{library}}, \code{\link[base]{require}},
  \code{\link[utils]{install.packages}}
}


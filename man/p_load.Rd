\name{p_load}
\alias{p_load}
\title{Load one or more packages}
\usage{
  p_load(..., install = TRUE, update = TRUE)
}
\arguments{
  \item{\ldots}{name(s) of package(s)}

  \item{install}{logical.  If TRUE will attempt to install
  a package not found in the library}

  \item{update}{logical.  If TRUE will attempt to update
  out of date packages}
}
\description{
  This function is a wrapper for library and require. It
  checks to see if a package is installed, if not it
  installs the package(s) and loads it.
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
\keyword{library}
\keyword{package}
\keyword{require}
\keyword{update}


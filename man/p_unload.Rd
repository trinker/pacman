\name{p_unload}
\alias{p_unload}
\title{Unloads package(s)}
\usage{
p_unload(..., negate = FALSE)
}
\arguments{
  \item{\dots}{name of package(s) or "all" (all removes all
  add on packages).}

  \item{negate}{logical. If \code{TRUE} will unload all add
  on packages except those provided to \code{p_unload}.}
}
\description{
Unloads package(s) or all packages.
}
\note{
\code{p_unload} will not unload the base install packages
that load when R boots up.
}
\examples{
\dontrun{
p_load(lattice)
p_loaded()
p_unload(lattice)
p_loaded()

p_load("lattice", "MASS")
p_loaded()
p_unload(all)
p_loaded() # will not work as you unloaded pacman

library(pacman)
p_load(lattice, MASS, foreign)
p_loaded()
p_unload(pacman, negate=TRUE)
p_loaded()
}
}
\seealso{
\code{\link[base]{detach}}
}
\keyword{detach}
\keyword{package}


\name{p_unload}
\alias{p_unload}
\title{
Unloads package(s)
}
\description{
Unloads package(s) or all packages
}
\usage{
p_unload(..., negate=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{
name of package(s) or "all" (all removes all add on packages)
}
  \item{negate}{
logical. If TRUE will uninstall all add on packages except those provided to p_unload.
}
}
\note{
p_unload will not unload the base install packages that load when R boots up.
}

\seealso{
\code{\link[base]{detach}}
}
\examples{
# p_load(lattice)
# p_loaded()
# p_unload(lattice)
# p_loaded()

# p_load("lattice", "MASS")
# p_loaded()
# p_unload(all)
# p_loaded() # will not work as you unloaded pacman

# p_load(lattice, MASS, foreign)
# p_loaded()
# p_unload(pacman, negate=TRUE)
# p_loaded()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ detach }
\keyword{ package }

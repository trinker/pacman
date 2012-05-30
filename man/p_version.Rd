\name{p_version}
\alias{p_version}
\alias{p_ver}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Determine installed package version
}
\description{
Determine what version a package is in your library
}
\usage{
p_version(package = "R")
p_ver(package = "R")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package (default returns R version)
}
}
\seealso{
 \code{\link[utils]{packageDescription}}
}
\examples{
p_ver()
p_ver(pacman)
p_version(pacman)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package}
\keyword{ version} 

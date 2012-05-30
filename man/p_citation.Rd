\name{p_citation}
\alias{p_citation}
\alias{p_cite}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate citation for a package
}
\description{
Generate citation for a package  
}
\usage{
p_citation(package = "r")
p_cite(package = "r")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package
}
}
\seealso{
\code{\link[utils]{citation}}
}
\examples{
p_cite(pacman)
p_citation(pacman)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{citation}
\keyword{cite}% __ONLY ONE__ keyword per line

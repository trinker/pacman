\name{p_citation}
\alias{p_citation}
\alias{p_cite}
\title{Generate citation for a package}
\usage{
p_citation(package = "r", copy2clip = TRUE, ...)

p_cite(package = "r", copy2clip = TRUE, ...)
}
\arguments{
  \item{package}{Name of the package you want a citation
  for}

  \item{copy2clip}{logical.  If TRUE attempts to copy the
  output to the clipboard}

  \item{\ldots}{Additional inputs to
  \code{\link[utils]{citation}}}
}
\description{
Generate citation for a package
}
\examples{
p_citation()
p_cite(pacman)
p_citation(pacman)
}
\seealso{
\code{\link[utils]{citation}}
}
\keyword{citation}
\keyword{cite}


\name{p_loaded}
\alias{p_loaded}
\title{View loaded packages}
\usage{
  p_loaded(..., all = FALSE)
}
\arguments{
  \item{\ldots}{Optional package names.  Adding package
  names will check their individual load status.}

  \item{all}{logical.  If TRUE will show all packages
  including base install; FALSE will show all packages
  excluding base install packages that install when R
  loads}
}
\description{
  Output is a character string of loaded packages
}
\examples{
\dontrun{p_load(lattice)}
p_loaded()
p_loaded(all=TRUE)
p_loaded(ggplot2, tm, qdap)
\dontrun{p_unload(lattice)}
}
\seealso{
  \code{\link[base]{.packages}},
  \code{\link[utils]{sessionInfo}}
}
\keyword{loaded}
\keyword{packages}


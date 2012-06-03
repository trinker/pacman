\name{p_vignette}
\alias{p_vign}
\alias{p_vignette}
\title{Look at a package's vignette}
\usage{
  p_vignette(package = "all")
}
\arguments{
  \item{package}{name of package or "all" (if all returns
  all packages from the user's library that have
  vignettes)}
}
\description{
  Use default "all" to see which packages have vignettes
  and supply a package name to view that vignette.
}
\examples{
p_vignette()
p_vign()
\dontrun{p _vign(fortunes)}
}
\seealso{
  \code{\link[utils]{vignette}}
}
\keyword{package}
\keyword{vignette}


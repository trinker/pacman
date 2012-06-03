\name{p_data}
\alias{p_data}
\title{List all data sets available in a package}
\usage{
  p_data(package = "datasets")
}
\arguments{
  \item{package}{name of package (default is the base
  install datasets package)}
}
\description{
  Generate a script of all data sets contained in package.
}
\examples{
p_data()
p_data(lattice)
}
\seealso{
  \code{\link[utils]{data}}
}
\keyword{data}
\keyword{package}


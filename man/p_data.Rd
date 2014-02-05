\name{p_data}
\alias{p_data}
\title{List all data sets available in a package}
\usage{
p_data(package = "datasets", static = FALSE)
}
\arguments{
  \item{package}{name of package (default is the base
  install datasets package).}

  \item{static}{logical.  If \code{TRUE} a static text
  docuemnt is returned (e.g. \code{data("datasets")}).}
}
\value{
Returns the data sets of a package as dataframe
(\code{static = FALSE}) or as a static text file
(\code{static = TRUE}).
}
\description{
Generate a script of all data sets contained in package.
}
\examples{
p_data()
p_data(lattice)
p_data(static=TRUE)
}
\seealso{
\code{\link[utils]{data}}
}
\keyword{data}
\keyword{package}


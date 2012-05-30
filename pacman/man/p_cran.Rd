\name{p_cran}
\alias{p_cran}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List all available CRAN packages
}
\description{
Generate a vector of all available packages.
}
\usage{
p_cran(menu = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{menu}{
logical.  If TRUE allows user to select the package and return that package name
}
}
\seealso{
\code{\link[utils]{available.packages}}
}
\examples{
# p_cran()
# p_cran(TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{CRAN}
\keyword{package}% __ONLY ONE__ keyword per line

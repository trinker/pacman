\name{p_data}
\alias{p_data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List all data sets available in a package
}
\description{
Generate a script of all data sets contained in package.
}
\usage{
p_data(package = "datasets")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package (default is the base install datasets package)
}
}
\seealso{
\code{\link[utils]{data}}
}
\examples{
p_data()
p_data(lattice)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{data}
\keyword{ package }% __ONLY ONE__ keyword per line

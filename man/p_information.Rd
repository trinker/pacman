\name{p_information}
\alias{p_information}
\alias{p_info}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
See information on a package.
}
\description{
Provides the information from for a package from the NAMESPACE.  Information may include: title, version, author, maintainer, description, depends, imports, suggests
}
\usage{
p_information(package)
p_info(package)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package (defaults to base)
}
}
\seealso{
\code{\link[utils]{packageDescription}}
}
\examples{
p_information()
p_info()
p_info(pacman)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{  packageDescription }
\keyword{  info }
\keyword{  information}
\keyword{ package }% __ONLY ONE__ keyword per line

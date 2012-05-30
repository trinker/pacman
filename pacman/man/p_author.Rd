\name{p_author}
\alias{p_author}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Returns the author of a package
}
\description{
Returns the author of a package
}
\usage{
p_author(package = "base")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package
}
}
\seealso{
\code{\link[utils]{packageDescription}}
}
\examples{
p_author(pacman)
p_author()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{author}
\keyword{package}

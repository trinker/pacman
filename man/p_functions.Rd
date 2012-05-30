\name{p_functions}
\alias{p_functions}
\alias{p_funs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List the functions from a package
}
\description{
List the functions from a package
}
\usage{
p_functions(package = NULL, load = FALSE)
p_funs(package = NULL, load = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package
}
  \item{load}{
logical.  If TRUE the package will be loaded
}
}
\seealso{
\code{\link[=base]{object}}
}
\examples{
p_functions()
p_funs()
p_funs(pacman)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ function }
\keyword{ package } 

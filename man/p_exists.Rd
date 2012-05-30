\name{p_exists}
\alias{p_exists}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Checks CRAN to determine if a package exists
}
\description{
Checks CRAN to determine if a package exists
}
\usage{
p_exists(package, cran=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package
}
  \item{cran}{
logical.  If TRUE checks CRAN for the package; if FALSE checks the user's local library
}
}
\examples{
# p_exists(pacman)
# p_exists(pacman, FALSE)
# p_exists(I_dont_exist)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ exists }
\keyword{ package }% __ONLY ONE__ keyword per line

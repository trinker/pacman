\name{p_loaded}
\alias{p_loaded}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
View loaded packages
}
\description{
Output is a character string of loaded packages
}
\usage{
p_loaded(all = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{all}{
logical.  If TRUE will show all packages including base install; FALSE will show allpackages excluding base install
packages that install when R loads)
}
}
\seealso{
\code{\link[base]{.packages}},
\code{\link[utils]{sessionInfo}}
}
\examples{
# p_load(lattice)
p_loaded()
p_loaded(FALSE)
p_loaded(TRUE)
p_unload(lattice)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ packages }
\keyword{ loaded }

\name{p_update}
\alias{p_update}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update out of date packages
}
\description{
Either view out of date packages or update out of data packages
}
\usage{
p_update(install = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{install}{
logical.  If TRUE installs any out of date packages; if FALSE
retuns a list of out of date packages
}
}
\seealso{
\code{\link[utils]{old.packages}}
}
\examples{
# p_update()
# p_update(FALSE)
# p_up(FALSE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ update}
\keyword{ package } 
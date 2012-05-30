\name{p_vignette}
\alias{p_vignette}
\alias{p_vign}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Look at a package's vignette
}
\description{
Use default "all" to see which packages have vignettes and supply a package 
name to view that vignette.
}
\usage{
p_vignette(package = "all")
p_vign(package = "all")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package or "all" (if all returns all packages from the user's library 
that have vignettes)
}
}
\seealso{
 \code{\link[utils]{vignette}}
}
\examples{
p_vignette()
p_vign()
# p_vign(fortunes)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{vignette }
\keyword{ package } 

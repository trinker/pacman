\name{p_load}
\alias{p_load}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Load one or more packages 
}
\description{
This function is a wrapepr for library and require.  It checks to see if a package is installed, if not it installs the package(s) and loads it.
}
\usage{
p_load(..., install = TRUE, update = TRUE, require = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{
name(s) of package(s)
}
  \item{install}{
logical.  If TRUE will attempt to install a package not found in 
the library
}
  \item{update}{
logical.  If TRUE will attempt to update out of date packages
}
  \item{require}{
logical.  If TRUE will use require; FALSE will use library
}
}

\seealso{
\code{\link[base]{library}},
\code{\link[base]{require}},
\code{\link[utils]{install.packages}}
}
\examples{
# p_load(lattice)
# p_unload(lattice)
# p_load(lattice, foreign, boot, rpart)
# p_loaded()
# p_unload(lattice, foreign, boot, rpart)
# p_loaded()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ library }
\keyword{ require }
\keyword{ install.packages }
\keyword{ package }
\keyword{ update }

\name{p_delete}
\alias{p_del}
\alias{p_delete}
\title{Remove package(s) from the library}
\usage{
p_delete(...)

p_del(...)
}
\arguments{
  \item{\ldots}{name(s) of package(s)}
}
\description{
Remove package(s) from the library permanently.
}
\section{Warning}{
  Using this function will remove the package from your
  library and can not be loaded again without reinstalling
  the package.
}
\examples{
\dontrun{
p_delete(pacman) # You never want to run this
}
}
\seealso{
\code{\link[utils]{remove.packages}}
}
\keyword{delete}
\keyword{package}


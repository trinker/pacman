\name{p_unlock}
\alias{p_unlock}
\title{Delete 00LOCK Directory}
\usage{
p_unlock(lib.loc = p_path())
}
\arguments{
  \item{lib.loc}{Path to library location.}
}
\description{
Deletes the 00LOCK directory left accidentally left behind
by fail in \code{\link[utils]{install.packages}}
}
\details{
Sometimes \code{\link[utils]{install.packages}} can "fail
so badly that the lock directory is not removed: this
inhibits any further installs to the library directory (or
for --pkglock, of the package) until the lock directory is
removed manually."  \code{p_unlock} deletes the directory
00LOCK that is left behind.
}
\examples{
\dontrun{
p_unlock()
}
}
\seealso{
\code{\link[utils]{install.packages}}
}
\keyword{lock}


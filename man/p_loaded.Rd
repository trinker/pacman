\name{p_loaded}
\alias{p_loaded}
\title{View Loaded Packages}
\usage{
p_loaded(..., all = FALSE, char, character.only = FALSE)
}
\arguments{
  \item{\ldots}{Optional package names.  Adding package
  names will check their individual load status.}

  \item{all}{logical.  If \code{TRUE} will show all
  packages including base install; \code{FALSE} will show
  all packages excluding base install packages that install
  when R loads.}

  \item{char}{Character vector containing packages to load.
  If you are calling \code{p_loaded} from within a function
  (or just having difficulties calling it using a character
  vector input) then pass your character vector of packages
  to load to this parameter directly.}

  \item{character.only}{logical. If \code{TRUE} then
  \code{p_loaded} will only accept a single input which is
  a character vector containing the names of packages to
  load.}
}
\description{
Output is a character string of loaded packages.
}
\examples{
\dontrun{
p_load(lattice)}
p_loaded()
p_loaded(all=TRUE)
p_loaded(ggplot2, tm, qdap)
\dontrun{p_unload(lattice)}
}
\seealso{
\code{\link[base]{.packages}},
\code{\link[utils]{sessionInfo}}
}
\keyword{loaded}
\keyword{packages}


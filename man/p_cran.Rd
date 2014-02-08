\name{p_cran}
\alias{p_cran}
\alias{p_iscran}
\title{CRAN Packages}
\usage{
p_cran(menu = FALSE)

p_iscran(..., char, character.only = FALSE)
}
\arguments{
  \item{menu}{logical.  If \code{TRUE} allows user to
  select the package and return that package name.}

  \item{\ldots}{name(s) of package(s).}

  \item{char}{Character vector containing packages to load.
  If you are calling \code{p_iscran} from within a function
  (or just having difficulties calling it using a character
  vector input) then pass your character vector of packages
  to this parameter directly.}

  \item{character.only}{logical. If \code{TRUE} then
  \code{p_iscran} will only accept a single input which is
  a character vector containing the names of packages to
  load.}
}
\description{
\code{p_cran} - Generate a vector of all available CRAN
packages.

\code{p_iscran} - Generate a logical vector determining if
a package(s) is found on CRAN.
}
\examples{
\dontrun{
p_cran()
p_cran(TRUE)

p_iscran(ggplot2, folks_I_am_not_on_CRAN)
p_iscran(char=c("ggplot2", "folks_I_am_not_on_CRAN"))
}
}
\seealso{
\code{\link[utils]{available.packages}}
}
\keyword{CRAN}
\keyword{package}


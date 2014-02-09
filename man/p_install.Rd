\name{p_install}
\alias{p_get}
\alias{p_install}
\title{Installs & Loads Packages}
\usage{
p_install(..., char, character.only = FALSE,
  path = getOption("download_path"), quick = FALSE,
  build_vignettes = !quick)

p_get(..., char, character.only = FALSE, path = getOption("download_path"),
  quick = FALSE, build_vignettes = !quick)
}
\arguments{
  \item{\ldots}{name(s) of package(s).}

  \item{char}{Character vector containing packages to load.
  If you are calling \code{p_install} from within a
  function (or just having difficulties calling it using a
  character vector input) then pass your character vector
  of packages to this parameter directly.}

  \item{character.only}{logical.  If \code{TRUE}
  \code{\dots} is treated a character string.}

  \item{path}{The path to the directory that contains the
  package.  It is convenient to set \code{download_path} in
  .Rprofile options to the downloads directory.}

  \item{quick}{if \code{TRUE} skips docs,
  multiple-architectures, demos, and vignettes, to make
  installation as fast as possible.}

  \item{build_vignettes}{if \code{TRUE}, will build
  vignettes. Normally it is \code{build} that's responsible
  for creating vignettes; this argument makes sure
  vignettes are built even if a build never happens (i.e.
  because \code{local = TRUE}.}
}
\description{
Installs and attempts to load a package .
}
\examples{
\dontrun{p_install(pacman)}
}
\references{
Helper function \code{github_parse_path} taken from
devtools:
\url{https://github.com/hadley/devtools/blob/master/R/install-github.r}.
}
\seealso{
\code{\link[utils]{install.packages}},
\code{\link[devtools]{install_github}}
}
\keyword{install}
\keyword{package}


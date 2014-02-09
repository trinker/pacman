\name{p_load}
\alias{p_load}
\title{Load One or More Packages}
\usage{
p_load(..., char, install = TRUE, update = getOption("pac_update"),
  quick = FALSE, build_vignettes = !quick, character.only = FALSE,
  verbose = getOption("p_verbose"))
}
\arguments{
  \item{\ldots}{name(s) of package(s).}

  \item{char}{Character vector containing packages to load.
  If you are calling \code{p_load} from within a function
  (or just having difficulties calling it using a character
  vector input) then pass your character vector of packages
  to load to this parameter directly.}

  \item{install}{logical.  If \code{TRUE} will attempt to
  install a package not found in the library.}

  \item{update}{logical.  If \code{TRUE} will attempt to
  update all out of date packages.  Default allows the user
  to set a \code{"pac_update"} in his/her .Rprofile.}

  \item{character.only}{logical. If \code{TRUE} then
  \code{p_load} will only accept a single input which is a
  character vector containing the names of packages to
  load.}

  \item{quick}{if \code{TRUE} skips docs,
  multiple-architectures, demos, and vignettes, to make
  installation as fast as possible.}

  \item{build_vignettes}{if \code{TRUE}, will build
  vignettes. Normally it is \code{build} that's responsible
  for creating vignettes; this argument makes sure
  vignettes are built even if a build never happens (i.e.
  because \code{local = TRUE}.}

  \item{verbose}{Logical. Dictates whether messages should
  be displayed telling the user which packages could be
  loaded and which failed to load.}
}
\description{
This function is a wrapper for \code{\link[base]{library}},
\code{\link[base]{require}}, and \code{p_install}.  It
checks to see if a package is installed, if not it attempts
to install the package from CRAN and/or any other
repository in the pacman repository list. \code{p_load}
also attempts to install and load packages from source
(.tar.gz/.zip) or from a \href{https://github.com/}{GitHub}
repository.
}
\examples{
\dontrun{
p_load(lattice)
p_unload(lattice)
p_load(lattice, foreign, boot, rpart)
p_loaded()
p_unload(lattice, foreign, boot, rpart)
p_loaded()

## From GitHub
p_load(Dasonk/findPackage)
}
}
\references{
Helper function \code{github_parse_path} taken from
devtools:
\url{https://github.com/hadley/devtools/blob/master/R/install-github.r}.
}
\seealso{
\code{\link[base]{library}}, \code{\link[base]{require}},
\code{\link[utils]{install.packages}},
\code{\link[devtools]{install_github}}
}


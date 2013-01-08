\name{p_opendir}
\alias{p_opendir}
\title{Attempts to open a directory in a file browser}
\usage{
  p_opendir(dir = getwd())
}
\arguments{
  \item{dir}{A character string representing the path
  (either relative or absolute) to the directory to be
  opened. Defaults to the working directory.}
}
\description{
  Attempts to open a directory in a file browser. Opening a
  directory isn't a platform independent but it is used in
  more than one function so moving this functionality to
  its own non-exported function makes sense.
}
\details{
  Note: Most likely we'll move this to a different package
  at some point since it's not specically for package
  stuff...
}
\examples{
\dontrun{
p_opendir() # opens working directory
p_opendir("~") # opens home directory
p_opendir(pacman:::p_basepath())
}
}


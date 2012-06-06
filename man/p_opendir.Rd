\name{p_opendir}
\alias{p_opendir}
\title{Attempts to open a directory in a file browser}
\usage{
  p_opendir(dir)
}
\arguments{
  \item{dir}{The directory to be opened}
}
\description{
  Attempts to open a directory in a file browser. Opening a
  directory isn't a platform independent but it is used in
  more than one function so moving this functionality to
  its own non-exported function makes sense.
}


\name{p_temp}
\alias{p_temp}
\title{Install a package temporarily}
\usage{
  p_temp(package, character.only = FALSE)
}
\arguments{
  \item{package}{- The package we want to install
  temporarily}

  \item{character.only}{Logical - Is the input a character
  string?}
}
\description{
  Installs and loads a package for the current session. The
  package won't be available in future sessions and will
  eventually be deleted from the machine with no additional
  effort needed by the user.  This will also install the
  necessary dependencies temporarily as well.
}


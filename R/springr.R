# function to install packages if necessary, then load
# differs from normal library function in that the package name should be quoted
# option to suppress messages makes this more complicated than it would be otherwise
library_careful <- function (packname, silent = TRUE) {
  # packname is name of package (quoted)
  # silent is boolean - suppress warning and other messages?
  do_it <- function () {
    if (!require (packname, character.only = TRUE)){
      install.packages (packname)
      library (packname, character.only = TRUE)
    }
  }  
  if (silent)
    suppressWarnings (suppressPackageStartupMessages (do_it()))
  else 
    do_it()
}
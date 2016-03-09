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

# detach a package if it's  attached, without throwing an error if it isn't
detach_careful <- function (packname) {
  packsearch <- paste0 ("package:", packname)
  if( packsearch %in% search ()) {
    message ("detaching ", packname)
    detach (packsearch, unload  = TRUE, character.only = TRUE)
  }
}

mean.geometric <- function (x, na.rm = FALSE){
    if ( na.rm) x <- x [! is.na( x)]
    return (exp (mean (log (x))))
}
    
percent_difference <- function(initial,final)
    return (100*(final-initial)/initial)
    
percentage <- function (part,  total, rounded = TRUE){
    x<-100*part/total
    if (rounded)
      x<- round (x, 0) 
    return (x)
    }

cv <- function (x, na.rm = FALSE) {
  if ( na.rm) x <- x [! is.na( x)]
  sd (x)/mean (x)
}

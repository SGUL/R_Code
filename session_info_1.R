info <- function(as.text=FALSE) {
    ### R version:
  r.version <- sessionInfo()[1]$R.version$version.string
  ### Hostname:
  hostname <- function() {
    (os.info <- system("uname -a", intern = T))
    (is.linux <- grepl("Linux", os.info))
    if(is.linux) {
      return(system("hostname", intern=TRUE))
    } else {
      return(system("scutil --get ComputerName", intern=TRUE))
    } # end if
  } # end function
  ### Date:
  #date.string <- system("date '+%d %b %Y'", intern=TRUE)
  ### Time:
  #time.string <- format(Sys.time(), "%r")
  ### Date/time:
  date.time.string <- format(Sys.time(), "Date: %a %b %d, %Y. Time: %X")
  # Construct list:
  li <- list()
  li$r.version <- r.version
  li$hostname <- hostname()
  li$date.time <- date.time.string
  names(li) <- c("r.version", "hostname", "date.time")
  #li$date <- date.string
  #li$time <- time.string
  if (exists("this.script")) {
    li$script.used <- this.script
  } # end if
  
  if (as.text==TRUE) {
    (t1 <- unlist(li))
    (t2 <- paste("#", t1))
    (t3 <- paste(t2, collapse="\n"))
    (t4 <- paste(t3, "\n", sep=""))
    return(t4)
  } else {
    return(li)
  } # end if
} # end function

# Source script to check for packages available from Cran:
(this.check.cran.source.script <- "check_package_cran_1.R")
cat("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%", "\n")
cat(paste("Loaded source:", this.check.cran.source.script), "\n")
cat("Function to call:  check.package.cran(package list)", "\n")
cat("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%", "\n")

check.package.cran <- function(package.list) {
  (pkges <- installed.packages()[,"Package"])
  for (pack.i in package.list) {
    if (! pack.i %in% pkges) {
      cat("************************************", "\n")
      cat(paste("Installing CRAN package:", pack.i), "\n")
      cat("************************************", "\n")
      install.packages(pack.i)
    } # end if
  } # end for
  # If necessary, load package:
  for (pack.i in package.list) {
   	require(pack.i, character.only=TRUE)
  } # end for
} # end function

## Update packages:
update.packages(ask=FALSE)
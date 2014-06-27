# Source script to check for packages available from Bioconductor:
(this.bioconductor.source.script <- "check_package_bioconductor_1.R")
cat("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%", "\n")
cat(paste("Loaded source:", this.bioconductor.source.script), "\n")
cat("Provides function: check.package.bioconductor()", "\n")
cat("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%", "\n")

check.package.bioconductor <- function(package.list, suppressUpdates=FALSE, suppressAutoUpdate=FALSE) {
  installed.pkges <- installed.packages()[,"Package"]
  loaded.pkges <- (.packages())
  # If necessary install package:
  for (pack.i in package.list) {
    if (! pack.i %in% installed.pkges) {
      cat("************************************", "\n")
      cat(paste("Installing BIOCONDUCTOR package:", pack.i), "\n")
      cat("************************************", "\n")
      source("http://bioconductor.org/biocLite.R")
      biocLite(pack.i, ask=FALSE, suppressUpdates=suppressUpdates, suppressAutoUpdate=suppressAutoUpdate)
    } # end if
  } # end for
  
  # If necessary, load package:
  for (pack.i in package.list) {
    require(pack.i, character.only=TRUE)
  } # end for
} # end function

## Update packages:
(r.version.major <- sessionInfo()[1]$R.version$major)
source("http://bioconductor.org/biocLite.R")
if (r.version.major > 2) {
  biocLite()
} else {
  biocLite(NULL)
}
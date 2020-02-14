#' ViewData
#'
#' @description Upload and see the .csv Data set containing information about World University Ranking
#'
#' @return read.csv
#'
#' @export
#'

ViewData <- function() {
  UniData <- read.csv("cwurData.csv", header=TRUE, sep=",")
  return(UniData)
}


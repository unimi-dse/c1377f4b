#' HeadData
#'
#' @description importing data from .csv file
#'
#' @return 2200 observations with 14 variables.
#'
#' @export

HeadData <- function(){
  cwur.data <- read.csv2("data/cwurData.csv", header = TRUE, sep=",")
  return(head(cwur.data))
  }






#'GetData
#'
#'@description Data are already contained into the package UniversityRanking through the file cwur.RData.
#'
#'@return table with 2200 obs. of 14 variables.
#'
#'@export
#'
#'
#'

GetData <- function() {
  library(dplyr)
  library(ggplot2)
  return(cwur.data)
}




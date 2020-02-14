#' UniData
#' @description Prepare and see the dataset.
#'
#' @return read.csv
#'
#'
#'
#' @export
#'
#'

UniData<- function() {
  Ranking <- read.csv("cwurData.csv", header = TRUE, stringsAsFactors = FALSE)
  return(Ranking)
}

UniData()







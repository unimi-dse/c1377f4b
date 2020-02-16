#'Rank_Countries
#'
#'@description The function shows the number of universities for each country.
#'
#'@return plot
#'
#'@export

Rank_Countries <- function() {

  library(dplyr)
  library(ggplot2)

  #create a data frames with the all universities in Ranking and count them by country
  RankingCount <- cwur.data %>% group_by(country) %>% summarise(count=n())

  #create the ggplot containing
  f1 <- ggplot(RankingCount, aes(x=reorder(country, -count), y=count, fill=country))
  + geom_bar(stat="identity")
  + coord_flip()
  + theme(legend.position="none")
  + labs(x="Country",y="Count")
  + ggtitle("Number of listed universities for each country")

  return(f1)
}

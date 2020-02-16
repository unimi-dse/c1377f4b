#' Rank_countries
#'Rank_Countries
#'@description The function Rank_Countries gives back a bar graph showing the countries listed by number of universities in ranking.
#'
#'@return plot
#'
#'@export
#'@importFrom: magrittr,dplyr, ggplot2
#'


Rank_Countries <- function() {

  cwur.data <- country <- count <- NULL

  #' create a data frames with the all universities in Ranking and count them by country
  RankingCount <- cwur.data %>% group_by(country) %>% summarise(count=n())

  #' create the ggplot containing
  f1 <- ggplot(RankingCount,
               aes(x=reorder(country, -count), y=count, fill=country)) +
    geom_bar(stat="identity") +
    coord_flip() +
    theme(legend.position="none") +
    labs(x="Country",y="Count") +
    ggtitle("Number of listed universities for each country")
  return(f1)}

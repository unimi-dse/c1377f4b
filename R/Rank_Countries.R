#' Rank_countries
#'
#'@description Rank_countries() gives back a bar graph showing the countries listed by number of universities in ranking.
#'
#'@return plot
#'
#'@export
#'
#'


Rank_Countries <- function() {

  UniData <- ViewData()

  #' create a data frames with the all universities in Ranking and count them by country
  RankingCount <- UniData %>% group_by(country) %>% summarise(count=n())

  #' create the ggplot containing
  f1 <- ggplot(RankingCount,
               aes(x=reorder(country, -count), y=count, fill=country)) +
    geom_bar(stat="identity") +
    coord_flip() +
    theme(legend.position="none") +
    labs(x="Country",y="Count") +
    ggtitle("Number of listed universities for each country")
  return(f1)}
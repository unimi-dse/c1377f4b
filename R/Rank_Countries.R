#'Rank_countries
#'@description FIRST FUNCTION: Rank_countries() gives back a bar graph showing the countries by number of universities in Ranking.
#'
#'@return plot
#'
#'
#'@export
#'
#'


Rank_Countries <- function() {

  #' create a data frames with the all universities in Ranking and count them by country
  RankingCount <-Ranking %>% group_by(country) %>% summarise(count=n())

  #' create the ggplot containing
  p1 <- ggplot(RankingCount,
               aes(x=reorder(count, -count), y=country, fill=country)) +
    geom_bar(stat="identity") +
    coord_flip() +
    theme(legend.position="none") +
    labs(x="Count",y="Country") +
    ggtitle("Number of listed universities for each country")
  return(p1)}

Rank_Countries


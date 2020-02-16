cwur.data <- read.csv2("data/cwurData.csv", header = TRUE, sep=",")
#'@export


#'GetData
#'
#'@description Data are already contained into the package UniversityRanking through the file cwur.RData.
#'
#'@return table with 2200 obs. of 14 variables.
#'
#'@export

GetData <- function() {
  return(cwur.data)
}


#'Score65
#'
#'@description The function Score65 paragones universities with score>65 from 2012 to 2015.
#'
#'@return plot
#'
#'@export

Score65 <- function() {

  library(ggplot2)
  library(dplyr)

  cwur.data$score <- as.numeric(cwur.data$score)

  f3 <- cwur.data %>% select(institution,score,year)%>%filter(score>700)%>%ggplot(aes(x=institution,y=score,group=year,col=factor(year)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(cwur.data, title='Insitutions with Score over 700')
  return(f3)
}


#'Rank_Countries
#'
#'@description The function Rank_Countries gives back a bar graph showing the countries listed by number of universities in ranking.
#'
#'@return plot
#'
#'@export

Rank_Countries <- function() {

  library(dplyr)
  library(ggplot2)

  #' create a data frames with the all universities in Ranking and count them by country
  RankingCount <- cwur.data %>% group_by(country) %>% summarise(count=n())

  #' create the ggplot containing
  f1 <- ggplot(RankingCount, aes(x=reorder(country, -count), y=count, fill=country))
  + geom_bar(stat="identity")
  + coord_flip()
  + theme(legend.position="none")
  + labs(x="Country",y="Count")
  + ggtitle("Number of listed universities for each country")

  return(f1)}

#'Top10_2015
#'
#'@description The function Top10_2015 gives back the top 10 Universities in World in 2015
#'
#'@return plot
#'
#'@export


Top10_2015 <- function() {

  theme_b <-theme (axis.text.x = element_blank(),legend.position = "none")

  f2 <- cwur.data %>%
    filter(world_rank<=10 & year==2015) %>%
    select(world_rank,institution) %>%
    ggplot(aes(x=reorder(institution,world_rank),y=world_rank))+
    geom_bar(stat="identity",fill="red") + theme_b +
    labs(title="Top 10 World Universities in 2015")+
    geom_label(aes(label=institution),size=3)

  return(f2)
}

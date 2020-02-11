#Install packages
UniData<- function() {
  library(tidyverse)
  library(devtools)
  library(dplyr)
  library(ggplot2)
  library(RColorBrewer)
  library(tidyr)
  Ranking <- file.choose()
  Ranking <- read.csv(Ranking, header=TRUE, sep=,)
  View(Ranking)
  head(Ranking)
  tail(Ranking)
  return(View(Ranking))
}


#FIRST FUNCTION: Rank_countries() gives back a bar graph showing the countries by number of universities in Ranking.
Rank_Countries <- function() {

  #create a data frames with the all universities in Ranking and count them by country
  RankingCount <-Ranking %>% group_by(country) %>% summarise(count=n())

  #create the ggplot containing
  p1 <- ggplot(RankingCount,
               aes(x=reorder(country, -count), y=count, fill=country)) +
    geom_bar(stat="identity") +
    coord_flip() +
    theme(legend.position="none") +
    labs(x="Count",y="Country") +
    ggtitle("Countries by number of universities in Ranking")
  return(p1)}

Rank_Countries()

#SECOND FUNCTION: Top10_2015() gives back the top 10 Universities in World in 2015  DA QUI UN BEL GRAFICO A BARRE CON LE TOP 10 UNIVERSITIES IN 2015 (ok)
Top10_2015 <- function(){

  options(repr.plot.width=5, repr.plot.height=5)
  theme_b<-theme(axis.text.x = element_blank(),legend.position = "none")
  p2 <- Ranking %>% select(world_rank,institution,year)%>%group_by(institution,year)%>%filter(world_rank<=10 & year ==2015)%>%arrange(world_rank)%>%ggplot(aes(x=institution,y=world_rank))+geom_bar(stat="identity",fill="violetred4")+theme_b+labs(title="Top 10 Universities in World as on 2015")+geom_label(aes(label=institution),size=3)
  return(p2)}

Top10_2015()

#THIRD FUNCTION: University_count2015() how many universities have been counted for each country in 2015
University_count2015 <- function() {
  options(repr.plot.width=8, repr.plot.height=5)
  topc<-Ranking %>%select(world_rank,institution,country,year)%>% filter(year==2015 )%>%group_by(country)%>%summarise(university_count=n())
  p3 <- ggplot(topc,aes(x=country,y=university_count))+geom_bar(stat="identity",fill="orchid4")+theme(axis.text.x = element_text(angle=90))+geom_text(aes(label=university_count),vjust=-.4,size=2)+labs(title="Countrywise University Count 2015")
  return(p3)}

University_count2015()

#FOURTH FUNCTION: Score65() paragones universities with score>65 from 2012 to 2015.
Score65 <- function() {
  p5 <- Ranking %>% select(institution,score,year)%>%filter(score>65)%>%ggplot(aes(x=institution,y=score,group=year,col=factor(year)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(Ranking, title='Insitutions with Score over 65')
  return(p5)
}

Score65()

library("devtools")
install_github("unimi-dse/c1377f4b")

devtools::install_github("unimi-dse/c1377f4b")



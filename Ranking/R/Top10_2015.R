#Install packages
library(tidyverse)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(tidyr)

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

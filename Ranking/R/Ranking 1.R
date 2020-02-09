install.packages("tidyverse")
install.packages("devtools")
library(tidyverse)
library(devtools)
library(GGally)
library(dplyr)

Ranking<-file.choose()
Ranking<-read.csv(Ranking, header=TRUE, sep=,)

View(Ranking) #seeing all the dataset
names(Ranking) #seeing the names of the variables
dim(Ranking)  #seeing the dimension of the dataset: 2200 observations and 14 variables
head(Ranking)
tail(Ranking)
summary(Ranking)
attach(Ranking)

#bo non si capisce niente qui
Top10 <- Ranking %>% dplyr::filter(score <= 10)%>% dplyr::arrange(score) %>% dplyr::select(1:3)
table(Top10$country)

Top10 <- Ranking %>% dplyr::filter(country="Italy")%>% dplyr::arrange(score) %>% dplyr::select(1:3)


#Estrarre le università numero uno nei rispettivi paesi
FirstNationalUni <- Ranking %>% dplyr::filter(national_rank=='1') %>% dplyr::select(1:3)
FirstNationalUni

#Estrarre le università italiane nel ranking
Ranking %>% dplyr::filter(country=='Italy') %>% dplyr::select(1:3)

Ranking %>% dplyr::filter(country=='USA') %>% dplyr::select(1:3)

attach(Ranking)
country

#vorrei creare una variabile che contenga solo le università italiane

#ASSOLUTAMENTE DA TENERE
Ranking %>% select(institution,score,year)%>%filter(score>65)%>%ggplot(aes(x=institution,y=score,group=year,col=factor(year)))+geom_line()+theme(axis.text.x=element_text(angle=90))



ggplot(Ranking, aes(x= publications, y=institution), col=Ranking) +
  geom_point(alpha=0.4)



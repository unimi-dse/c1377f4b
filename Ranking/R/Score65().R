#Install packages
library(tidyverse)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(tidyr)

#FIFTH FUNCTION: Score65() paragones universities with score>65 from 2012 to 2015.

Score65 <- function() {
  p5 <- Ranking %>% select(institution,score,year)%>%filter(score>65)%>%ggplot(aes(x=institution,y=score,group=year,col=factor(year)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(Ranking, title='Insitutions with Score over 65')
  return(p5)
}

Score65()



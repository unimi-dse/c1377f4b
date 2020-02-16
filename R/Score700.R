#'Score700
#'
#'@description This function plots the score trend over 700 of institutions across years.
#'
#'@return plot
#'
#'@export
#'

Score700 <- function() {

  library(ggplot2)
  library(dplyr)

  cwur.data <- read.csv2("data/cwurData.csv", header = TRUE, sep=",")

  cwur.data$score <- as.numeric(cwur.data$score)

  f3 <- cwur.data %>% select(institution,score,year)%>%filter(score>700)%>%ggplot(aes(x=year,y=score,group=institution,col=factor(institution)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(cwur.data, title= "Score trend of institutions with score over 700 across years")
  return(f3)
}

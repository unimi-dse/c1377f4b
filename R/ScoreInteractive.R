#'ScoreInteractive
#'
#'@description This function takes a numeric argument to plot the scores of the universities over years.
#'
#'@return plot
#'
#'@export

ScoreInteractive <- function(setpoint) {

  library(ggplot2)
  library(dplyr)

  cwur.data <- read.csv2("data/cwurData.csv", header = TRUE, sep=",")

  cwur.data$score <- as.numeric(cwur.data$score)

  f3 <- cwur.data %>% select(institution,score,year)%>%filter(score>setpoint)%>%ggplot(aes(x=year,y=score,group=institution,col=factor(institution)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(cwur.data, title= print(paste("Score trend of institutions with score over", setpoint, "across years")))
  return(f3)
}

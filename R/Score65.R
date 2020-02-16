#'Score700
#'
#'@description The function Score700 paragones universities with score>700 from 2012 to 2015.
#'
#'@return plot
#'
#'@export

Score700 <- function() {

  library(ggplot2)
  library(dplyr)

  cwur.data$score <- as.numeric(cwur.data$score)

  f3 <- cwur.data %>% select(institution,score,year)%>%filter(score>700)%>%ggplot(aes(x=year,y=score,group=institution,col=factor(institution)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(cwur.data, title='Score trend of institutions with score over 700 across years')
  return(f3)
}



#'Score65
#'
#'@description The function Score65 paragones universities with score>65 from 2012 to 2015.
#'
#'@return plot
#'
#'@export
#'@importFrom: magrittr, ggplot2, dplyr
#'


Score65 <- function() {

  attach(cwur.data)

  f3 <- cwur.data %>% select(institution,score,year)%>%filter(score>65)%>%ggplot(aes(x=institution,y=score,group=year,col=factor(year)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(cwur.data, title='Insitutions with Score over 65')
  return(f3)
}

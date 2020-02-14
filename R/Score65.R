#'Score65
#'
#'@description Score65() paragones universities with score>65 from 2012 to 2015.
#'
#'@return plot
#'
#'@export
#'
#'


Score65 <- function() {

  UniData <- ViewData()

  f3 <- UniData %>% select(institution,score,year)%>%filter(score>65)%>%ggplot(aes(x=institution,y=score,group=year,col=factor(year)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(UniData, title='Insitutions with Score over 65')

  return(f3)
}

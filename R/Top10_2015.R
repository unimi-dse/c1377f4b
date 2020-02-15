#' Top10_2015
#'
#' @description Top10_2015() gives back the top 10 Universities in World in 2015
#'
#' @return plot
#'
#' @export
#'
#'

Top10_2015 <- function(){

  UniData <- ViewData()
  options(repr.plot.width=5, repr.plot.height=5)
  theme_b<-theme(axis.text.x = element_blank(),legend.position = "none")
  f2 <- UniData %>% select(world_rank,institution,year)%>%group_by(institution,year)%>%filter(world_rank<=10 & year ==2015)%>%arrange(world_rank)%>%ggplot(aes(x=institution,y=world_rank))+geom_bar(stat="identity",fill="red")+theme_b+labs(title="Top 10 World Universities in 2015")+geom_label(aes(label=institution),size=3)
  return(f2)}

Top10_2015()

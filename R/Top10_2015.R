#' Top10_2015
#'
#' @description SECOND FUNCTION: Top10_2015() gives back the top 10 Universities in World in 2015
#'
#' @return plot
#'
#' @export
#'
#'

Top10_2015 <- function(){
  options(repr.plot.width=5, repr.plot.height=5)
  theme_b<-theme(axis.text.x = element_blank(),legend.position = "none")
  p2 <- Ranking %>% select(world_rank,institution,year)%>%group_by(institution,year)%>%filter(world_rank<=10 & year ==2015)%>%arrange(world_rank)%>%ggplot(aes(x=institution,y=world_rank))+geom_bar(stat="identity",fill="violetred4")+theme_b+labs(title="Top 10 World Universities in 2015")+geom_label(aes(label=institution),size=3)
  return(p2)}

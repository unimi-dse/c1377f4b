#' Top10_2015
#'
#' @description The function Top10_2015 gives back the top 10 Universities in World in 2015
#'
#' @return plot
#'
#' @export
#' @importFrom: magrittr, dplyr, ggplot2
#'


Top10_2015 <- function() {

  cwur.data <- world_rank <- year <- institution <- NULL

  theme_b<-theme(axis.text.x = element_blank(),legend.position = "none")

  f2 <- cwur.data %>% filter(world_rank<=10 & year==2015) %>% select(world_rank,institution) %>%
    ggplot(aes(x=reorder(institution,world_rank),y=world_rank)) + geom_bar(stat="identity",fill="red") + theme_b + labs(title="Top 10 World Universities in 2015") + geom_label(aes(label=institution),size=3)

  return(f2)
  }


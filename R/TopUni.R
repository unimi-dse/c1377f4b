#'TopUni
#'
#'@description The function TopUni plots the top desidered number of universities for a chosen year between 2012 and 2015. It is possible to choose up to 1024 institutions.
#'
#'@return plot
#'@examples TopUni(10, 2016), TopUni(1200, 2013), TopUni(15, 2014)
#'
#'@export

TopUni <- function(nUni, nYear) {
  if(nYear<2012 | nYear>2015) {
   stop("Choose a year between 2012 and 2015")
  }

  if(nUni>1024) {
    stop("Select a number of universities lower than 1024")
  }


  theme_b <- theme (axis.text.x = element_blank(), legend.position = "none")

  f2 <- cwur.data %>%
    filter(world_rank<= nUni & year== nYear) %>%
    ggplot(aes(x=reorder(institution,world_rank),y=world_rank))+
    geom_bar(stat="identity",fill="red") + theme_b +
    labs(title=print(paste("Top", nUni, "World Universities in", nYear)))+
    geom_label(aes(label=institution),size=3)

  return(f2)
}


#'TopUni
#'
#'@description The function Top_nUniversities_nYear plots the top desidered number of universities for a chosen year between 2012 and 2015.
#'
#'@return plot
#'
#'@export

TopUni <- function(nUni, nYear) {
  if(nYear<2012 | nYear>2015) {
   stop("Choose a year between 2012 and 2015")
  }

  if(nUni>1024) {
    stop("Select a number lower than 1024")
  }


  theme_b <- theme (axis.text.x = element_blank(), legend.position = "none")

  f2 <- cwur.data %>%
    filter(world_rank<= nUni & year== nYear) %>%
    #select(world_rank,institution) %>%
    ggplot(aes(x=reorder(institution,world_rank),y=world_rank))+
    geom_bar(stat="identity",fill="red") + theme_b +
    #theme(axis.text.x=element_text(angle=90)) +
    labs(title=print(paste("Top", nUni, "World Universities in", nYear)))+
    geom_label(aes(label=institution),size=3)

  return(f2)
}


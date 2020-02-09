#Install packages
install.packages("devtools")

library(tidyverse)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(tidyr)

usethis::use_data(Ranking)

#FOURTH FUNCTION: Comparison_Top50() gives back a graph comparing 2014 and 2015 Ranks of Top 50 Universities

Comparison_Top50 <- function() {

  options(repr.plot.width=8, repr.plot.height=15)
  comp<-Ranking %>% select(world_rank,institution,year)%>%filter(year %in% c(2014,2015) & world_rank<=50)%>%spread(year,world_rank)
  colnames(comp)<-c("Institution",'Y-2014','Y-2015')
  col_comp<-ifelse((comp$`Y-2015`-comp$`Y-2014`<0),"red","green")
  left_label <- paste(comp$Institution, round(comp$`Y-2014`),sep=", ")
  right_label <- paste(comp$Institution, round(comp$`Y-2015`),sep=", ")
  p<- ggplot(comp) + geom_segment(aes(x=1, xend=2, y=`Y-2014`, yend=`Y-2015`), size=.75, show.legend=F,col=col_comp)+
    geom_vline(xintercept=1, size=.1) +
    geom_vline(xintercept=2, size=.1) +
    scale_color_manual(labels = c("Up", "Down"),
                       values = c("green"="#00ba38", "red"="#f8766d")) +  # color of lines
    labs(x="", y="World Rank",title="Comparing 2014 and 2015 Ranks -Top 50 Universities") +  # Axis labels
    xlim(.5, 2.5) + ylim(0,(1.1*(max(comp$`Y-2014`, comp$`Y-2015`))))
  p <- p + geom_text(label=left_label, y=comp$`Y-2014`, x=rep(1, NROW(comp)), hjust=1.1, size=3.5)
  p <- p + geom_text(label=right_label, y=comp$`Y-2015`, x=rep(2, NROW(comp)), hjust=-0.1, size=3.5)
  p <- p + geom_text(label="2014", x=2, y=1.1*(max(comp$`Y-2014`, comp$`Y-2015`)), hjust=1.2, size=5)
  p <- p + geom_text(label="2015", x=2, y=1.1*(max(comp$`Y-2014`, comp$`Y-2015`)), hjust=-0.1, size=5)
  p + theme(panel.background = element_blank(),
            panel.grid = element_blank(),
            axis.ticks = element_blank(),
            axis.text.x = element_blank(),
            panel.border = element_blank(),
            plot.margin = unit(c(1,2,1,2), "cm"))
  return(p)}

Comparison_Top50()

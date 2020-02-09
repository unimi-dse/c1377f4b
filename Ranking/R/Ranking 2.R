library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(tidyr)

usethis::use_data(Ranking)

Ranking <- file.choose() #rivedi come mettere un dataset disponibile a tutti
Ranking<-read.csv(Ranking, header=TRUE, sep=,)
str(Ranking)
head(Ranking)


# only top 100 universities
RankingCount100 <-
  Ranking[1:100,] %>%
  group_by(publications) %>%
  summarise(count=n())

RankingCount100


#Grafico da tenere tutto colorato fico (MESSO)
Rank_Countries <- function() {

  RankingCount <-Ranking %>% group_by(country) %>% summarise(count=n()) # create a data frames with the all universities in Ranking and count them by country

  p1 <- ggplot(RankingCount,
             aes(x=reorder(country, -count), y=count, fill=country)) +
  geom_bar(stat="identity") +
  coord_flip() +
  theme(legend.position="none") +
  labs(x="Count",y="Country") +
  ggtitle("Countries by number of universities in Ranking")
  return(p1)}

Rank_Countries() #this function gives back a bar graph showing the cpuntries by number of universities in Ranking.


#DA QUI GRAFICO TUTTO COLORATO a FULMINE (ok)
p3 <- Ranking %>% select(institution,score,year)%>%filter(score>65)%>%ggplot(aes(x=institution,y=score,group=year,col=factor(year)))+geom_line()+theme(axis.text.x=element_text(angle=90))+labs(Ranking, title='Score & Insitution 2012, 2013, 2014, 2015')
p3

#DA QUI UN BEL GRAFICO A BARRE CON LE TOP 10 UNIVERSITIES IN 2015 (MESSO)
options(repr.plot.width=5, repr.plot.height=5)
theme_b<-theme(axis.text.x = element_blank(),legend.position = "none")
p2 <- Ranking %>% select(world_rank,institution,year)%>%group_by(institution,year)%>%filter(world_rank<=10 & year ==2015)%>%arrange(world_rank)%>%ggplot(aes(x=institution,y=world_rank))+geom_bar(stat="identity",fill="violetred4")+theme_b+labs(title="Top 10 Universities in World as on 2015")+geom_label(aes(label=institution),size=3)

#DA QUI ESCONO QUATTRO PLOT (ok)
options(repr.plot.width=5, repr.plot.height=5)
ggplot(Ranking,aes(x=score))+geom_histogram(fill="hotpink3")+facet_wrap(~year)

#DA QUI ESCE UN PLOT A BARRE VIOLA (MESSO)
options(repr.plot.width=8, repr.plot.height=5)
topc<-Ranking %>%select(world_rank,institution,country,year)%>% filter(year==2015 )%>%group_by(country)%>%summarise(university_count=n())
ggplot(topc,aes(x=country,y=university_count))+geom_bar(stat="identity",fill="orchid4")+theme(axis.text.x = element_text(angle=90))+geom_text(aes(label=university_count),vjust=-.4,size=2)+labs(title="Countrywise University Count")

#DA QUI ESCE IL GRAFICO CON TUTTE LE RIGHE (ok)
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





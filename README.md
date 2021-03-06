## WORLD UNIVERSITY RANKINGS
##### This project aims at exploring some data (`cwurData.csv`) containing information about world university rankings. The collection of this kind of data is usually aimed at providing a classification based on specific scores and requirements. Generally, university rankings are created not only to direct student decisions to what would better fit their expectations, but also to gain consensus and sponsors for the universities themselves.

## Installation:
##### First install the R package `devtools` if not installed yet:
      devtools::install_github("unimi-dse/c1377f4b")

## Usage:
##### Load the package:
      require(UniversityRanking)

## Dataset description: 
##### The dataset `cwurData.csv` contains 2200 obervations organised by 14 columns:

| Variable | Description |
| --- | --- |
| *world_rank* | world rank for university |
| *institution* | name of university |
| *country* | country of each university |
| *national_rank* | rank of university within its country |
| *quality_of_education* | rank for quality of education |
| *alumni_employment* | rank for alumni employment |
| *quality_of_faculty* | rank for quality of faculty |
| *publications* | rank for publications |
| *influence* | rank for influence |
| *citations* | number of students at the university |
| *broad_impact* | rank for broad impact (only available for 2014 and 2015) |
| *patents* | rank for patents |
| *score* | total score, used for determining world rank |
| *year* | year of ranking (2012 to 2015) |
   
## Functions:
##### Once installed the needed packages (`devtools`, `ggplot2`, `dplyr`), it's possible to call the following functions to observe the data differently:

1. `HeadData` returns the first 6 observations contained in the dataset.
   
2. `Rank_Countries` shows the number of universities for each country. 

3. `TopUni` plots the top desidered number of universities for a chosen year between 2012 and 2015. It is possible to choose up to 1024 institutions.




  

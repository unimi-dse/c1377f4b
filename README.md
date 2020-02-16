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


1. `Import Data` returns the data contained in the dataset.
   
2. `Score700` plots the score ranks over 700 of universities across the years.

3. `ScoreInteractive`  takes a numeric argument to plot the scores of the universities over years.

4. `Top10_2015` lists the best ranked universities in the world in 2015. 
  

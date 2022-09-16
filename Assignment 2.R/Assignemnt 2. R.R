library(tidyverse)
library(here)
setwd("./covid-19-data/")
rm(list=ls(all=TRUE))
cat("\014")

library(here)
library(tidyverse)

setwd("./covid-19-data/")

States <- read.csv(here("covid-19-data","us-states.csv"))

View(States)

PENNSYLVANIA <- filter(States, state=="Pennsylvania")

View(PENNSYLVANIA)

n <- length(PENNSYLVANIA$date)

PENNSYLVANIA$incr_cases <- 2

for (i in 2:n){
  PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i] - PENNSYLVANIA$cases[i-1])
}

PENNSYLVANIA$incr_deaths <- 0

for (i in 2:n){
  PENNSYLVANIA$incr_deaths[i] <- (PENNSYLVANIA$deaths[i] - PENNSYLVANIA$deaths[i-1])
}

sd(PENNSYLVANIA$incr_cases)

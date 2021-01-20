# Meta --------------------------------------------------------------------

## Date Created:  1/20/2021
## Date Edited:   1/20/2021
## Description:   Create dataset for Econ 372, Hwk 1, Spring 2021


# Preliminaries -----------------------------------------------------------

if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, knitr, kableExtra, readxl, modelsummary)

source('homework/data-paths.R')


# Import data -------------------------------------------------------------

source('homework/hwk1/data-enroll.R')
source('homework/hwk1/data-benchmark.R')
source('homework/hwk1/data-ffscosts.R')


# Combine data ------------------------------------------------------------
full.data <- ma.enroll %>% 
  left_join(ma.benchmark.data %>% select(year, ssa, bench_pay, starts_with("risk")),
            by=c("ssa","year")) %>%
  left_join(ffs.costs.final %>% select(-state), 
             by=c("ssa","year")) %>%
  mutate(avg_ffscost = case_when(
    parta_enroll==0 & partb_enroll==0 ~ 0,
    parta_enroll==0 & partb_enroll>0 ~ partb_reimb/partb_enroll,
    parta_enroll>0 & partb_enroll==0 ~ parta_reimb/parta_enroll,
    parta_enroll>0 & partb_enroll>0 ~ (parta_reimb/parta_enroll) + (partb_reimb/partb_enroll),
    TRUE ~ NA_real_
  )) %>%
  select(state, county, ssa, year, penetration, eligibles, enrolled, avg_ffscost, bench_pay)


# Save final dataset ------------------------------------------------------

write_tsv(full.data,file="homework/hwk1/hwk1_data.txt",append=FALSE,col_names=TRUE)
write_rds(full.data,file="homework/hwk1/hwk1_data.Rdata")




# Some simple summary stats -----------------------------------------------


datasummary_skim(full.data)
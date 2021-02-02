# Meta --------------------------------------------------------------------

## Date Created:  1/20/2021
## Date Edited:   2/2/2021
## Description:   Create datasets for Econ 372, Hwk 2, Spring 2021


# Preliminaries -----------------------------------------------------------

if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, knitr, kableExtra, readxl, modelsummary,
               SAScii)

source('homework/data-paths.R')


# Import data -------------------------------------------------------------

source('homework/hwk2/data-puf.R')


# Combine data ------------------------------------------------------------

puf.inj.data <- bind_rows(puf.inj.2013, puf.inj.2014, puf.inj.2015)
puf.em.data <- puf.em.2018 %>%
  filter(str_detect(hcpcs_code,"^99"),
         state=="GA")


# Save final dataset ------------------------------------------------------

write_tsv(puf.inj.data,file="homework/hwk2/hwk2_data_q4.txt",append=FALSE,col_names=TRUE)
write_rds(puf.inj.data,file="homework/hwk2/hwk2_data_q4.Rdata")

write_tsv(puf.em.data,file="homework/hwk2/hwk2_data_q5.txt",append=FALSE,col_names=TRUE)
write_rds(puf.em.data,file="homework/hwk2/hwk2_data_q5.Rdata")


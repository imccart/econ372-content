# Meta --------------------------------------------------------------------

## Date Created:  4/8/2021
## Date Edited:   4/8/2021
## Description:   Create datasets for Econ 372, Hwk 3, Spring 2021


# Preliminaries -----------------------------------------------------------

if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, knitr, kableExtra, readxl, modelsummary,
               SAScii)

source('homework/data-paths.R')


# Import data -------------------------------------------------------------

hcris.data <- readRDS(paste0(hcris.path,'/HCRIS_Data.rds'))
hrr.xw <- read_excel(path=paste0(geog.path,'/ZipHSAHrr15.xls'))
comm.det <- readRDS(paste0(community.path,'/hospital_markets.rds')) %>%
  mutate(fips=as.numeric(fips))
zip.county <- read_csv(paste0(geog.path,"/zcta-to-county.csv")) %>% 
  filter(row_number() != 1) %>% 
  mutate(zip = as.numeric(zcta5),
         fips = as.numeric(county),
         pct_zip_fips = as.numeric(afact)) %>% 
  as_tibble() %>%
  select(zip, fips, pct_zip_fips)


# Analytic Datasets -----------------------------------------------------------

max.perc <- zip.county %>%
  group_by(zip) %>%
  summarize(max_perc=max(pct_zip_fips, na.rm=TRUE))

cmty.xw <- zip.county %>%
  left_join(max.perc, by=c("zip")) %>%
  filter(pct_zip_fips==max_perc) %>%
  group_by(zip) %>%
  mutate(row_num=n()) %>%
  filter(row_num==1) %>% 
  select(zip, fips) %>%
  left_join(comm.det %>% select(fips,mkt),
            by=c("fips")) %>%
  distinct(zip, mkt)

price.data <- hcris.data %>%
  mutate( discount_factor = 1-tot_discounts/tot_charges,
          price_num = (ip_charges + icu_charges + ancillary_charges)*discount_factor - tot_mcare_payment,
          price_denom = tot_discharges - mcare_discharges,
          price = price_num/price_denom) %>%
  filter(price_denom>100, !is.na(price_denom), 
         price_num>0, !is.na(price_num),
         price<100000, 
         beds>30)



# Save final dataset ------------------------------------------------------

write_tsv(price.data,file="homework/hwk3/hwk3_data.txt",append=FALSE,col_names=TRUE)
write_rds(price.data,file="homework/hwk3/hwk3_data.Rdata")

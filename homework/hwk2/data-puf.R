# 2012 PUF Data -----------------------------------------------------------

puf.2012 <- read_tsv(file=paste0(ffs.path,"Provider Utilization Payment PUF/2012/Medicare_Provider_Util_Payment_PUF_CY2012.txt"),
                     col_names=TRUE)
puf.inj.2012 <- puf.2012 %>% 
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  filter(hcpcs_code %in% c("62310", "62311", "62318", "62319")) %>%
  group_by(npi) %>%
  summarize(city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2012)



# 2013 PUF Data -----------------------------------------------------------

puf.2013 <- read_tsv(file=paste0(ffs.path,"Provider Utilization Payment PUF/2013/Medicare_Provider_Util_Payment_PUF_CY2013.txt"),
                     col_names=TRUE)
puf.inj.2013 <- puf.2013 %>%
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  filter(hcpcs_code %in% c("62310", "62311", "62318", "62319")) %>%
  group_by(npi) %>%
  summarize(city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2013)



# 2014 PUF Data -----------------------------------------------------------


puf.2014 <- read_tsv(file=paste0(ffs.path,"Provider Utilization Payment PUF/2014/Medicare_Provider_Util_Payment_PUF_CY2014.txt"),
                     col_names=TRUE)
puf.inj.2014 <- puf.2014 %>%
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  filter(hcpcs_code %in% c("62310", "62311", "62318", "62319")) %>%
  group_by(npi) %>%
  summarize(city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2014)



# 2015 PUF Data -----------------------------------------------------------


puf.2015 <- read_tsv(file=paste0(ffs.path,"Provider Utilization Payment PUF/2015/Medicare_Provider_Util_Payment_PUF_CY2015.txt"),
                     col_names=TRUE)
puf.inj.2015 <- puf.2015 %>%
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  filter(hcpcs_code %in% c("62310", "62311", "62318", "62319")) %>%
  group_by(npi) %>%
  summarize(city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2015)




# 2016 PUF Data -----------------------------------------------------------

puf.2016 <- read_tsv(file=paste0(ffs.path,"Provider Utilization Payment PUF/2016/Medicare_Provider_Util_Payment_PUF_CY2016.txt"),
                     col_names=TRUE)
puf.inj.2016 <- puf.2016 %>%
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  filter(hcpcs_code %in% c("62310", "62311", "62318", "62319")) %>%
  group_by(npi) %>%
  summarize(city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2016)



# 2017 PUF Data -----------------------------------------------------------

puf.2017 <- read_tsv(file=paste0(ffs.path,"Provider Utilization Payment PUF/2017/Medicare_Provider_Util_Payment_PUF_CY2017.txt"),
                     col_names=TRUE)
puf.inj.2017 <- puf.2017 %>%
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  filter(hcpcs_code %in% c("62320", "62321", "62322", "62323", "62324", "62325", "62326", "62327")) %>%
  group_by(npi) %>%
  summarize(city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2017)



# 2018 PUF Data -----------------------------------------------------------

puf.2018 <- read_tsv(file=paste0(ffs.path,"Provider Utilization Payment PUF/2018/Medicare_Provider_Util_Payment_PUF_CY2018.txt"),
                     col_names=TRUE)
puf.inj.2018 <- puf.2018 %>%
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  filter(hcpcs_code %in% c("62320", "62321", "62322", "62323", "62324", "62325", "62326", "62327")) %>%
  group_by(npi) %>%
  summarize(city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2018)

puf.em.2018 <- puf.2018 %>%
  rename_with(str_to_lower) %>%
  filter(npi!="0000000001") %>%
  group_by(npi, hcpcs_code) %>%
  summarize(description=first(hcpcs_description),
            city=first(nppes_provider_city),
            state=first(nppes_provider_state),
            zip=first(nppes_provider_zip),
            count=sum(line_srvc_cnt, na.rm=TRUE),
            average_payment=mean(average_medicare_payment_amt, na.rm=TRUE)) %>%
  mutate(year=2018)

## ---- message=FALSE,warning=FALSE-----------------------------------
library(tidyverse)
library(lubridate)
library(rvest)


## ---- eval=FALSE----------------------------------------------------
## data_links <- read_html("https://bikeshare.metro.net/about/data/") %>%
##   html_nodes(xpath = "//*[@id=\"post-913\"]/section/div/div[3]/div/div/div/div/div/div/div/div/ul[1]/li/a") %>%
##   html_attr("href")
## station_link <- "https://bikeshare.metro.net/wp-content/uploads/2019/10/metro-bike-share-stations-2019-10-1.csv"


## ---- eval=FALSE----------------------------------------------------
## download.file(station_link, destfile = "stations.csv")
## destfile_names <- data_links %>%
##   str_extract("([^/]+)$") %>%
##   file.path("source_files", .)
## for (i in seq_along(data_links))
##   download.file(data_links[i], destfile = destfile_names[i])


## ---- eval=FALSE----------------------------------------------------
## for (i in seq_along(data_links))
##   unzip(destfile_names[i], exdir = "csvs")


## ---- eval=FALSE----------------------------------------------------
## dat <- lapply(destfile_names, read_csv)


## ---- eval=FALSE----------------------------------------------------
## # make sure columns have consistent names
## for (i in seq_along(dat)) {
##   if ("start_station_id" %in% names(dat[[i]])) {
##     dat[[i]] <- dat[[i]] %>%
##       mutate(start_station = start_station_id) %>%
##       select(-start_station_id)
##   }
##   if ("end_station_id" %in% names(dat[[i]])) {
##     dat[[i]] <- dat[[i]] %>%
##       mutate(end_station = end_station_id) %>%
##       select(-end_station_id)
##   }
## }
## # make sure all columns are of consistent class
## for (i in seq_along(dat)) {
##   if (is.character(dat[[i]]$start_time))
##     dat[[i]]$start_time <- mdy_hm(dat[[i]]$start_time)
##   if (is.character(dat[[i]]$end_time))
##     dat[[i]]$end_time <- mdy_hm(dat[[i]]$end_time)
##   if (is.numeric(dat[[i]]$bike_id))
##     dat[[i]]$bike_id <- as.character(dat[[i]]$bike_id)
## }
## df <- bind_rows(dat)
## save(df, file = "bike_df.Rdata")


## ---- eval = F------------------------------------------------------
## # code to modify the trip csv files in place to have consistent names and classes
## # Only using this because I just discovered %<>%
## library(magrittr)
##
## csv_files = list.files("csvs",full.names = T)
## for(csv_file in csv_files){
##   # read each csv, modify the column names and classes if necessary and then overwrite original file
##   dat <- read_csv(csv_file)
##   if ("start_station_id" %in% names(dat)) {
##     dat %<>%
##       rename(start_station = start_station_id)
##   }
##   if ("end_station_id" %in% names(dat)) {
##     dat %<>% rename(end_station = end_station_id)
##
##   }
##   # make sure all columns are of consistent class
##   if (is.character(dat$start_time)) {
##     dat %<>% mutate(start_time = mdy_hm(start_time))
##     # dat$start_time <- mdy_hm(dat$start_time)
##   }
##
##
##   if (is.character(dat$end_time)){
##     dat %<>% mutate(end_time = mdy_hm(end_time))
##     # dat$end_time <- mdy_hm(dat$end_time)
##   }
##
##   if (is.numeric(dat$bike_id)){
##     # the issue seems to be with NA bike_ids. Let's see how many have this issue
##     print(dat %>% filter(is.na(bike_id)) %>% nrow(.))
##     # looks like there are 8 rows in total causing this issue. I propose filtering out these observations
##     dat %<>% filter(!is.na(bike_id))
##     dat %<>% mutate(bike_id = as.character(bike_id))
##     # dat$bike_id <- as.character(dat$bike_id)
##   }
##   # write_csv(x=dat,path = csv_file)
## }


## -------------------------------------------------------------------
load("bike_df.Rdata")

## -------------------------------------------------------------------
df2 <- df %>% mutate(my_duration = end_time - start_time)



## -------------------------------------------------------------------
df2 <- df2 %>%
  mutate(duration = ifelse(date(start_time) < mdy("10/1/2016"), duration / 60, duration))
df2 <- df2 %>%
  mutate(duration = ifelse(date(start_time) > mdy("12/31/2016") & start_time < mdy("4/1/2017"), duration / 60, duration))


## -------------------------------------------------------------------
df <- df2 %>%
  mutate(year = year(start_time),
         month = month(start_time),
         day = day(start_time),
         day_of_week = weekdays(start_time),
         hour = hour(start_time),
         minute = minute(start_time)) %>%
  select(-my_duration)
save(df, file = "bike_data0.Rdata")


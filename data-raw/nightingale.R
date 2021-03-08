## code to prepare `nightingale` dataset goes here
library(tidyverse)
library(jsonlite)
library(lubridate)

# prep data and calculate average annual mortality per 1000 for each cause
nightingale <-
    read_json("data-raw/nightingales_rose.json") %>% bind_rows() %>%
    mutate(date = as.Date(ymd_hms(date))) %>%
    pivot_longer(cols = disease:other,names_to = "cause_of_death",values_to = "number_of_deaths") %>%
    mutate(number_of_deaths = number_of_deaths * (1000 * 12 / army_size))



usethis::use_data(nightingale, overwrite = TRUE)

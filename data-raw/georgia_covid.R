## code to prepare `georgia_covid` dataset goes here

library(tidyverse)
library(lubridate)
library(stringr)

# Clean up the data and filter to only get the data from the date range of interest and the counties of interest
data <- read_csv("data-raw/Georgia_COVID-19_Case_Data.csv")

georgia_covid <- data %>% filter(COUNTY %in% toupper(c(
    "Cobb",
    "DeKalb",
    "Fulton",
    "Gwinnett",
    "Hall"
))) %>% mutate(date = as_date(ymd_hms(DATESTAMP)), cases = C_New) %>%
    filter(date >= "2020-04-26", date <= "2020-05-09") %>% mutate(county = str_to_title(COUNTY)) %>%
    select(county, date, cases)


usethis::use_data(georgia_covid, overwrite = TRUE)

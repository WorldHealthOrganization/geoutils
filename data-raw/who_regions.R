library(readr)
library(dplyr)

who_regions <- suppressMessages(
  read_csv("data-raw/input/who_regions.csv", na = ""))

pop <- admin0 %>%
  filter(!is.na(who_region_code)) %>%
  group_by(who_region_code) %>%
  summarise(population = sum(population, na.rm = TRUE))

who_regions <- left_join(who_regions, pop, by = "who_region_code")

usethis::use_data(who_regions, overwrite = TRUE)

readr::write_csv(who_regions, path = "csv/who_regions.csv")

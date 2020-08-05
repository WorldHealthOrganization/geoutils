library(readr)
library(dplyr)

who_region <- suppressMessages(
  read_csv("data-raw/input/who_region.csv", na = ""))

pop <- admin0 %>%
  filter(!is.na(who_region_code)) %>%
  group_by(who_region_code) %>%
  summarise(population = sum(population, na.rm = TRUE))

who_region <- left_join(who_region, pop, by = "who_region_code")

usethis::use_data(who_region, overwrite = TRUE)

readr::write_csv(who_region, path = "csv/who_region.csv")

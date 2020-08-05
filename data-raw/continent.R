library(readr)
library(dplyr)

continent <- suppressMessages(
  read_csv("data-raw/input/continent.csv", na = ""))

pop <- admin0 %>%
  filter(!is.na(continent_code)) %>%
  group_by(continent_code) %>%
  summarise(population = sum(population, na.rm = TRUE))

continent <- left_join(continent, pop, by = "continent_code")

continent$population[continent$continent_code == "AN"] <- 1106

usethis::use_data(continent, overwrite = TRUE)

readr::write_csv(continent, path = "csv/continent.csv")

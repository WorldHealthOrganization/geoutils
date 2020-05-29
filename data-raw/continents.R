library(readr)
library(dplyr)

continents <- suppressMessages(
  read_csv("data-raw/input/continents.csv", na = ""))

pop <- admin0 %>%
  filter(!is.na(continent_code)) %>%
  group_by(continent_code) %>%
  summarise(population = sum(population, na.rm = TRUE))

continents <- left_join(continents, pop, by = "continent_code")

continents$population[continents$continent_code == "AN"] <- 1106

usethis::use_data(continents, overwrite = TRUE)

readr::write_csv(continents, path = "csv/continents.csv")

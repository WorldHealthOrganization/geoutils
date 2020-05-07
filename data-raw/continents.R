library(readr)

continents <- suppressMessages(
  read_csv("data-raw/input/continents.csv", na = ""))

usethis::use_data(continents, overwrite = TRUE)

readr::write_csv(continents, path = "csv/continents.csv")

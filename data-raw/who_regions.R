library(readr)

who_regions <- suppressMessages(
  read_csv("data-raw/input/who_regions.csv", na = ""))

usethis::use_data(who_regions, overwrite = TRUE)

readr::write_csv(who_regions, path = "csv/who_regions.csv")


global <- tibble::tibble(
  global_code = "GL",
  global_name = "Global",
  population = sum(who_regions$population)
)

usethis::use_data(global, overwrite = TRUE)

readr::write_csv(global, path = "csv/global.csv")

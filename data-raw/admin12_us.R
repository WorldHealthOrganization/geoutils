library(tidyverse)

dc <- suppressMessages(read_csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"))

ct_nyt <- dc %>%
  select(county, state, fips) %>%
  distinct() %>%
  rename(fips_county = fips) %>%
  mutate(fips_state = substr(fips_county, 1, 2)) %>%
  select(fips_state, fips_county, state, county) %>%
  filter(!is.na(fips_county))

st_nyt <- ct_nyt %>% select(fips_state, state) %>% distinct()

dc <- suppressMessages(read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"))

ct_jhu <- dc %>%
  select(FIPS, Province_State, Admin2, Lat, Long_) %>%
  mutate(FIPS = sprintf("%05d", FIPS)) %>%
  rename(fips_county = FIPS, state = Province_State,
    county = Admin2, lat = Lat, lon = Long_) %>%
  mutate(fips_state = substr(fips_county, 1, 2)) %>%
  filter(!fips_state %in% c("00", "80", "90", "88", "99")) %>%
  select(fips_county, fips_state, county, state, lat, lon)

setdiff(ct_nyt$fips_county, ct_jhu$fips_county)
# JHU has all counties that NYT has and more - use that

# other metadata

meta <- readr::read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/UID_ISO_FIPS_LookUp_Table.csv")

ct_meta <- meta %>%
  filter(!is.na(Admin2) & Country_Region == "US") %>%
  select(FIPS, Population) %>%
  rename(admin2_code = FIPS, population = Population) %>%
  mutate(admin2_code = sprintf("%05d", admin2_code))

us_admin2 <- ct_jhu %>%
  mutate(admin0_code = "US") %>%
  rename(admin2_code = fips_county, admin1_code = fips_state,
    admin2_name = county) %>%
  select(admin0_code, admin1_code, admin2_code, admin2_name, lat, lon) %>%
  left_join(ct_meta)

st_jhu <- ct_jhu %>%
  select(fips_state, state) %>%
  distinct()

setdiff(st_nyt$fips_state, st_jhu$fips_state)
# JHU has all counties that NYT has and more - use that

st_meta <- meta %>%
  filter(Country_Region == "US" & nchar(FIPS) <= 2) %>%
  mutate(admin1_code = substr(sprintf("%02d", FIPS), 1, 2)) %>%
  select(admin1_code, Lat, Long_, Population) %>%
  rename(population = Population, lat = Lat, lon = Long_)

us_admin1 <- st_jhu %>%
  mutate(admin0_code = "US") %>%
  rename(admin1_code = fips_state, admin1_name = state) %>%
  select(admin0_code, admin1_code, admin1_name) %>%
  left_join(st_meta)

admin1 <- us_admin1
admin2 <- us_admin2

usethis::use_data(admin1, overwrite = TRUE)
usethis::use_data(admin2, overwrite = TRUE)

readr::write_csv(admin1, "csv/admin1.csv")
readr::write_csv(admin2, "csv/admin2.csv")

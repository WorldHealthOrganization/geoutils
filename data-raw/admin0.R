library(tidyverse)

admin0 <- suppressMessages(
  read_csv("data-raw/input/who_admin0.csv", na = c("", "NULL"),
    locale = readr::locale(encoding = "UTF-8"))) %>%
  rename_all(tolower) %>%
  select(who_region, iso_2_code, adm0_viz_name, adm0_sovrn, who_status,
    center_lat, center_lon) %>%
  rename(who_region_code = who_region, admin0_code = iso_2_code,
    admin0_name = adm0_viz_name, admin0_sovrn = adm0_sovrn,
    lon = center_lon, lat = center_lat)

extra <- tibble(
  who_region_code = c(rep("WPRO", 3), "EURO", "Conveyance"),
  admin0_code = c("HK", "MO", "TW", "XK", "ZZ"),
  admin0_name = c("Hong Kong SAR", "Macau SAR", "Taiwan SAR", "Kosovo", "International Conveyance"),
  admin0_sovrn = c(rep("China", 3), "Kosovo", NA),
  lon = NA,
  lat = NA
)

admin0 <- bind_rows(admin0, extra)

admin012map <- suppressMessages(
  read_csv("data-raw/input/admin0_to_12_map.csv", na = c("", "NULL"),
    locale = readr::locale(encoding = "UTF-8")))

cmeta <- suppressMessages(
  read_csv("data-raw/input/country_meta.csv", na = "",
    locale = readr::locale(encoding = "UTF-8"))) %>%
  rename_all(tolower) %>%
  rename(admin0_code = iso2) %>%
  select(-country_ofcl)

cmeta$flag_url[cmeta$admin0_code == "CW"] <- "https://upload.wikimedia.org/wikipedia/commons/b/b1/Flag_of_Curaçao.svg"

cont_lookup <- suppressMessages(
  read_csv("data-raw/input/continent_lookup.csv", na = "",
    locale = readr::locale(encoding = "UTF-8"))) %>%
  rename(admin0_code = iso2, continent_name = continent)

continents <- suppressMessages(
  read_csv("data-raw/input/continents.csv", na = "",
    locale = readr::locale(encoding = "UTF-8")))

cont_lookup <- cont_lookup %>%
  left_join(continents)

admin0 <- admin0 %>%
  left_join(select(cont_lookup, admin0_code, continent_code)) %>%
  select(continent_code, who_region_code, admin0_code, admin0_name,
    admin0_sovrn, who_status, lat, lon)

table(admin0$continent_code, useNA = "always")

setdiff(admin0$admin0_code, cmeta$admin0_code)
# TODO: add meta for the countries that are missing
setdiff(cmeta$admin0_code, admin0$admin0_code)

admin0$admin0_name[admin0$admin0_code == "PS"] <- "occupied Palestinian territory, including east Jerusalem"
admin0$admin0_name[admin0$admin0_code == "CI"] <- "Côte d’ Ivoire"

admin0 <- left_join(admin0, cmeta)
admin0 <- left_join(admin0, admin012map)

usethis::use_data(admin0, overwrite = TRUE)

readr::write_csv(admin0, path = "csv/admin0.csv")

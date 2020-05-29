# cat(paste(paste0("#'   \\item{", names(admin0), "}{}"), collapse = "\n"))

#' Metadata for administrative level 0 (national level) geographic entities
#'
#' @format A data frame with variables:
#' \describe{
#'   \item{continent_code}{continent code}
#'   \item{who_region_code}{WHO region code}
#'   \item{admin0_code}{ISO 3166-1 alpha-2 country code}
#'   \item{admin0_name}{country/territory name}
#'   \item{admin0_sovrn}{name of the territory's sovereign state}
#'   \item{who_status}{country/territory a WHO member state status}
#'   \item{lat}{centroid latitude}
#'   \item{lon}{centroid longitude}
#'   \item{flag_url}{a URL to a flag svg image}
#'   \item{population}{population}
#'   \item{admin1_code_type}{the type of admin1 code that is standard to use for this country (e.g. FIPS, ISO 3166-2)}
#'   \item{admin1_entity_name}{the name used in this country for admin1 divisions (e.g. "state", "province")}
#'   \item{admin2_code_type}{the type of admin2 code that is standard to use for this country}
#'   \item{admin2_entity_name}{the name used in this country for admin1 divisions (e.g. "county", "district")}
#' }
#' @source WHO
"admin0"

# cat(paste(paste0("#'   \\item{", names(admin1), "}{}"), collapse = "\n"))

#' Metadata for administrative level 1 (first sub-national level) geographic entities (states, provinces, etc.)
#'
#' @format A data frame with variables:
#' \describe{
#'   \item{admin0_code}{ISO 3166-1 alpha-2 country code that this entity belongs to}
#'   \item{admin1_code}{admin1 code (conforming to the standard indicated in `admin1_code_type` in \code{\link{admin0}})}
#'   \item{admin1_name}{admin1 name}
#'   \item{lat}{centroid latitude}
#'   \item{lon}{centroid longitude}
#'   \item{population}{population}
#'   \item{map_url}{a URL to an image that shows the location of this entity relative to its country/territory}
#' }
#' @source Currently only data for US states is contained in this file. Others to come as needed by applications. US metadata comes from [JHU CSSE](https://github.com/CSSEGISandData/COVID-19).
"admin1"

# cat(paste(paste0("#'   \\item{", names(admin2), "}{}"), collapse = "\n"))

#' Metadata for administrative level 2 (second sub-national level) geographic entities (counties, districts, etc.)
#'
#' @format A data frame with variables:
#' \describe{
#'   \item{admin0_code}{ISO 3166-1 alpha-2 country code that this entity belongs to}
#'   \item{admin1_code}{admin1 code that this entity belongs to (conforming to the standard indicated in `admin1_code_type` in \code{\link{admin0}})}
#'   \item{admin1_name}{admin1 name that this entity belongs to}
#'   \item{admin2_code}{admin2 code (conforming to the standard indicated in `admin2_code_type` in \code{\link{admin0}})}
#'   \item{admin2_name}{admin2 name}
#'   \item{lat}{centroid latitude}
#'   \item{lon}{centroid longitude}
#'   \item{population}{population}
#'   \item{map_url}{a URL to an image that shows the location of this entity relative to its country/territory}
#' }
#' @source Currently only data for US counties is contained in this file. Others to come as needed by applications. US metadata comes from [JHU CSSE](https://github.com/CSSEGISandData/COVID-19).
"admin2"

# cat(paste(paste0("#'   \\item{", names(continents), "}{}"), collapse = "\n"))

#' Metadata for continents
#'
#' @format A data frame with variables:
#' \describe{
#'   \item{continent_code}{continent code}
#'   \item{continent_name}{continent name}
#'   \item{population}{population}
#'   \item{map_url}{a URL to an image that shows the location of this entity relative to its country/territory}
#' }
"continents"

# cat(paste(paste0("#'   \\item{", names(who_regions), "}{}"), collapse = "\n"))

#' Metadata for WHO regions
#'
#' @format A data frame with variables:
#' \describe{
#'   \item{who_region_code}{WHO region code}
#'   \item{who_region_name}{WHO region name}
#'   \item{population}{population}
#'   \item{map_url}{a URL to an image that shows the location of this entity relative to its country/territory}
#' }
"who_regions"

#' Metadata for Global
#'
#' @format A data frame with variables:
#' \describe{
#'   \item{global_code}{WHO region code}
#'   \item{global_name}{WHO region name}
#'   \item{population}{population}
#' }
"global"

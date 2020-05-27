<!-- badges: start -->
[![R build status](https://github.com/covid-open-data/geoutils/workflows/R-CMD-check/badge.svg)](https://github.com/covid-open-data/geoutils/actions)
<!-- badges: end -->

# geoutils

This repository provides datasets with metadata for geographic entities (continents, WHO regions, countries/territories, etc.) with specified standards for codes and names, used for unifying data reported from multiple sources.

This is available as both an R package, which can be installed and used as shown below, and also as [csv](https://github.com/covid-open-data/geoutils/tree/master/csv) files that can be easily used outside of R.

### Design

(TODO)

### Install (R)

```r
remotes::install_github("covid-open-data/geoutils")
```

```r
library(geoutils)

# the following datasets are now available
continents
who_regions
admin0
admin1
admin2
```

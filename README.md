# geoutils

<!-- badges: start -->
[![R build status](https://github.com/WorldHealthOrganization/geoutils/workflows/R-CMD-check/badge.svg)](https://github.com/WorldHealthOrganization/geoutils/actions)
<!-- badges: end -->

This repository provides datasets with metadata for geographic entities (continents, WHO regions, countries/territories, etc.) with specified standards for codes and names, used for unifying data reported from multiple sources.

This is available as both an R package, which can be installed and used as shown below, and also as [csv](https://github.com/WorldHealthOrganization/geoutils/tree/master/csv) files that can be easily used outside of R.

### Install (R)

```r
remotes::install_github("WorldHealthOrganization/geoutils")
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

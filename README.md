
<!-- README.md is generated from README.Rmd. Please edit that file -->

# happign <a href="https://paul-carteron.github.io/happign/"><img src="man/figures/logo.png" align="right" height="139" /></a>

# happign - IGN API for R

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/happign)](https://CRAN.R-project.org/package=happign)
[![CRAN
checks](https://cranchecks.info/badges/summary/happign)](https://cran.r-project.org/web/checks/check_results_happign.html)
[![R-CMD-check](https://github.com/paul-carteron/happign/workflows/R-CMD-check/badge.svg)](https://github.com/paul-carteron/happign/actions)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![Codecov test
coverage](https://codecov.io/gh/paul-carteron/happign/branch/main/graph/badge.svg)](https://app.codecov.io/gh/paul-carteron/happign?branch=main)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of happign is to facilitate the use of Application Programming
Interface from the French National Institute of Geographic and Forestry
Information to retrieve their free resources. `happign` allow
downloading of :

-   Shapefile via use of WFS service
-   Raster via use of WMS raster service

and calculation of :

-   isochrone and isodistance

### Context

Since January 1, 2021, the French National Institute for Geographic and
Forestry Information (IGN) has made its public data on French
topography, infrastructure, and terrain freely available. The opening of
IGN data under the Etalab 2.0 open license means free access and use for
all.

Among the important data that are now open, we can mention the BD TOPO
(3D modeling of the territory and its infrastructures), the BD ORTHO
(departmental orthophotography), the BD Forêt and the RGE Alti (meshed
digital terrain model that describes the French relief). This represents
100 terabytes of data.

To facilitate access to this data, IGN has implemented a set of APIs
based on OGC standards. In other words, it is possible, with correctly
formatted URLs, to access IGN data. In spite of a well supplied
documentation, the use of APIs remains complex to set up. The `happign`
package has been created to facilitate this.

### Rights of use for IGN data

Data from [IGN geoservice
website](https://geoservices.ign.fr/presentation) are free and available
in open license according to the principle of the [Etalab 2.0
license](https://www.etalab.gouv.fr/licence-ouverte-open-licence/) since
January 1, 2021. Other data complete the IGN’s open data policy since
June 1st, 2021. SCAN 25®, SCAN 100® and SCAN OACI data are free to
download or stream, but any professional or individual wishing to
develop a commercial paper or digital offer for the general public will
have to pay a fee according to the [General Conditions of
Use](https://geoservices.ign.fr/cgu-licences).

### Installation

You can install the released version of happign from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("happign")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("paul-carteron/happign")
```

### Vignettes

Package vignettes :

-   [Getting started with
    happign](https://paul-carteron.github.io/happign/articles/Getting_started.html)
    : A brief intro to happign world ;
-   [Non functionnal
    API](https://paul-carteron.github.io/happign/articles/web_only/Non_functional_APIs.html)
    : Every week all API from IGN website are tested to find if any link
    are working ;
-   [happign for
    foresters](https://paul-carteron.github.io/happign/articles/web_only/happign_for_foresters.html)
    : happign can be used in many ways but here I focus on a forestry
    use.
-   [SCAN 25, SCAN 100 et SCAN
    OACI](https://paul-carteron.github.io/happign/articles/SCAN_25_SCAN_100_SCAN_OACI.html)
    : How to download the only one Scan 25

### Future features

IGN offers other services. Their implementation in R is under
development :

-   Calculation of isochron and isodistance
-   REST API Carto compatible with the OpenAPI specification (easy and
    quick downloading for WFS)

### Problems and Issues

-   Please report any issues or bugs you may encounter on the [dedicated
    page on github](https://github.com/paul-carteron/happign/issues).

### System Requirements

`happign` requires [`R`](https://cran.r-project.org) v \>= 4.1.0.

### Why it’s called `happign` ?

This project is - obviously - called happign, here’s why :

-   “ign” for… IGN : the acronym of the institute ;
-   “api” for… API : the tool used to retrieve the data;
-   and the addition of an “h” and a “p” for the pun with “happy”.
    Besides the fact that I love this kind of humor, the simplified use
    of APIs is a real source of happiness, trust me.

Also, for the most attentive to details, you can see on the logo a green
leaf stuck between the teeth of the charming smile. It is none other
than the leaf from the IGN logo.

### Code of Conduct

Please note that the happign project is released with a [Contributor
Code of
Conduct](https://paul-carteron.github.io/happign/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

Datasets for POS 5737
================

This package contains only datasets—the tidy datasets for POS 5737 found
on the [data page](https://pos5737.github.io/data.html) of the course
website.

## Quick Start

    # install package
    devtools::install_github("pos5737/pos5737data")
    
    # see datasets
    help(package = "pos5737data")
    
    # load data
    data(parties, package = "pos5737data")

## Contributing

New datasets require the following:

  - Create the R script `make-data/get-raw/get-raw-*.R` that obtains the
    raw data (ideally from Dataverse and hopefully versioned) and saves
    the original format and filename to `raw-data/`.
  - Create the R script `make-data/clean-raw/clean-raw-*.R` that tidies
    the raw data into a easy-to-use data frame and saves it to
    `data/*.rda`. Variable names and factor levels should be
    interpretable. Factor levels should be in a reasonable order. Dates
    should be store appropriate as date or date-time objects.
  - Create a Roxygen2 file `R/*-documentation.R` that documents the data
    set. Include brief description of the data set, the dimmensions and
    descriptions of each variable (it’s okay to point users to the
    source paper for the details), a link to the raw data files, a link
    to the published paper(s) using the data, and an example only uses
    base R functions (and ideally replicates a key result from the
    original paper).
  - Create a test in `tests/testthat/test-*.R` (`usethis::use_test()`
    initiates the file) to test that the data works as expected.
    Ideally, the test that key results from the paper reproduces.
  - Add an example to `README.Rmd`.

## Motivation

In the usual workflow, one might download the data file `parties.rds`
into the `data/` directory. They might load the data with

    parties <- readr::read_rds("data/parties.rds)

This package allows you to skip the download step.

## Usage

### Installing the Package

To install the package, run

    devtools::install_github("pos5737/pos5737data")

You only need to run this once.

### Loading the Data

Once you have the package installed on your computer, you can load the
datasets with

``` r
# load data
data(parties, package = "pos5737data")
```

Alternatively, you can use

``` r
# load packages
library(pos5737data)

# load data
data("parties")
```

To see the available datasets, use

    help(package = "pos5737data")

## Example

### `parties`: Clark and Golder (2006)

``` r
# load packages
library(tidyverse)
library(broom)

# load data
data(parties, package = "pos5737data")

# regression model from their table 2, pooled analysis, whole sample
fit <- lm(enep ~ log(average_magnitude)*eneg + upper_tier*eneg + 
            en_pres*proximity, 
          data = parties)

# create table
texreg::screenreg(fit)
```

    ## 
    ## =======================================
    ##                              Model 1   
    ## ---------------------------------------
    ## (Intercept)                    2.81 ***
    ##                               (0.20)   
    ## log(average_magnitude)         0.33 ** 
    ##                               (0.11)   
    ## eneg                           0.19 *  
    ##                               (0.08)   
    ## upper_tier                     0.05 ***
    ##                               (0.01)   
    ## en_pres                        0.35 ***
    ##                               (0.07)   
    ## proximity                     -3.42 ***
    ##                               (0.38)   
    ## log(average_magnitude):eneg    0.08    
    ##                               (0.06)   
    ## eneg:upper_tier               -0.02 ***
    ##                               (0.00)   
    ## en_pres:proximity              0.80 ***
    ##                               (0.15)   
    ## ---------------------------------------
    ## R^2                            0.30    
    ## Adj. R^2                       0.29    
    ## Num. obs.                    555       
    ## RMSE                           1.59    
    ## =======================================
    ## *** p < 0.001, ** p < 0.01, * p < 0.05

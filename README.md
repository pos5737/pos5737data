Datasets for POS 5737
================

This package contains only datasets–the tidy datasets for POS 5737 found
on the [data page](https://pos5737.github.io/data.html) of the course
website.

## Motivation

In the usual workflow, one might download the data file `parties.rds`
into the `data/` directory. They might load the data with

    parties_df <- readr::read_rds("data/parties.rds)

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
data(parties_df, package = "pos5737data")
```

Alternatively, you can use

``` r
# load packages
library(pos5737data)

# load data
data("parties_df")
```

To see the available datasets, use

    help(package = "pos5737data")

## Example

``` r
# load packages
library(tidyverse)
```

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
    ## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
    ## ✔ tidyr   1.0.0     ✔ stringr 1.4.0
    ## ✔ readr   1.3.1     ✔ forcats 0.4.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(broom)

# load data
data(parties_df)

# quick look
glimpse(parties_df)
```

    ## Observations: 555
    ## Variables: 10
    ## $ country              <chr> "Albania", "Albania", "Albania", "Argentina…
    ## $ year                 <dbl> 1992, 1996, 1997, 1946, 1951, 1954, 1958, 1…
    ## $ average_magnitude    <dbl> 1.00, 1.00, 1.00, 10.53, 10.53, 4.56, 8.13,…
    ## $ eneg                 <dbl> 1.106929, 1.106929, 1.106929, 1.342102, 1.3…
    ## $ enep                 <dbl> 2.190, 2.785, 2.870, 5.750, 1.970, 1.930, 2…
    ## $ upper_tier           <dbl> 28.57, 17.86, 25.80, 0.00, 0.00, 0.00, 0.00…
    ## $ en_pres              <dbl> 0.00, 0.00, 0.00, 2.09, 1.96, 1.96, 2.65, 2…
    ## $ proximity            <dbl> 0.00, 0.00, 0.00, 1.00, 1.00, 0.20, 1.00, 0…
    ## $ social_heterogeneity <fct> Bottom 3rd of ENEG, Bottom 3rd of ENEG, Bot…
    ## $ electoral_system     <fct> Single-Member District, Single-Member Distr…

``` r
# note that `data(parties_df) %>% glimpse()` doesn't work

# regression model and summary
fit_df <- lm(enep ~ eneg*average_magnitude, data = parties_df) %>%
  tidy() %>%
  glimpse()
```

    ## Observations: 4
    ## Variables: 5
    ## $ term      <chr> "(Intercept)", "eneg", "average_magnitude", "eneg:aver…
    ## $ estimate  <dbl> 3.740473138, 0.082985217, 0.013948307, -0.002241715
    ## $ std.error <dbl> 0.164996630, 0.079625206, 0.006610639, 0.003862348
    ## $ statistic <dbl> 22.6699972, 1.0421978, 2.1099787, -0.5804021
    ## $ p.value   <dbl> 7.062995e-81, 2.977770e-01, 3.531041e-02, 5.618808e-01

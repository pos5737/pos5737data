
# load clark and golder's replication data from dataverse

# load packages
library(tidyverse)

# create directory to house the raw datasett
if (!dir.exists("raw-data/anscombe/")) {
  dir.create("raw-data/anscombe/")
}

# download clark and golder's dataset Legislative_new.tab from dataverse
# see https://doi.org/10.7910/DVN/HGXPHP
"https://raw.githubusercontent.com/mwaskom/seaborn-data/master/anscombe.csv" %>%
  read_csv() %>%
  write_csv("raw-data/anscombe/anscombe-raw.csv")

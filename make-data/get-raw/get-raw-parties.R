
# load clark and golder's replication data from dataverse

# load packages
library(tidyverse)
library(dataverse); Sys.setenv("DATAVERSE_SERVER" = "dataverse.harvard.edu")

# create directory to house the raw datasett
if (!dir.exists("raw-data/parties/")) {
  dir.create("raw-data/parties/")
}

# download clark and golder's dataset Legislative_new.tab from dataverse
# see https://doi.org/10.7910/DVN/HGXPHP
dv_id <- "doi:10.7910/DVN/HGXPHP" %>%
  get_file("Legislative_new.tab", .) %>%
  writeBin("raw-data/parties/Legislative_new.tab")


# create other formats from each .rda data set in data/

# load packages
library(tidyverse)

# formats to export
ext <- c(".csv", ".dta", ".rds", ".xlsx")

# files to import
root <- "data/"
infile.ext <- list.files(root)
paths <- paste0(root, infile.ext)

# files to export
dataset <- str_remove(infile.ext, ".rda")

# data frame of data files
data_df <- crossing(dataset = dataset, format = ext) %>%
  mutate(filename = paste0(dataset, format),
         fullpath = paste0("formatted-data/", filename),
         source = paste0("data/", dataset, ".rda")) %>%
  glimpse()

io_fn <- function(data_df_row) {
  s <- data_df_row$source
  d <- data_df_row$fullpath
  df <- rio::import(s)
  rio::export(df, file = d)
  return(data_df_row)
}

# export each .rda dataset to formats above
data_df %>%
  split(.$filename) %>%
  map(~ io_fn(.)) %>%
  glimpse()

# create zip file with all formatted data sets
root <- "formatted-data/"
files_to_zip <- list.files("formatted-data/")
zip::zipr("formatted-data.zip", files = paste0(root, files_to_zip))


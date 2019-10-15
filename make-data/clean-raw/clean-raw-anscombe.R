
# load packages
library(tidyverse)

# load raw data
anscombe <- read_csv("raw-data/anscombe/anscombe-raw.csv") %>%
  glimpse()

# save to file
save(anscombe, file = "data/anscombe.rda")


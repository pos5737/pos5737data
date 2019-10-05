
# install packages
devtools::install_github("pos5737/pos5737data", force = TRUE)

# load packages
library(tidyverse)
library(broom)

# load data
data(parties_df, package = "pos5737data")

# quick look
glimpse(parties_df)
# note that below doesn't workout because data() doesn't
# output a data frame.
#   data(parties_df, package = "pos5737data")) %>%
#     glimpse()

# regression model and summary
fit_df <- lm(enep ~ eneg*average_magnitude, data = parties_df) %>%
  tidy() %>%
  glimpse()

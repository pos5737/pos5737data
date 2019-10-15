test_that("anscombe dataset seems to work", {
  # load packages
  library(tidyverse)
  # load data
  data(anscombe)
  # check the class
  s_df <- anscombe %>%
    group_by(dataset) %>%
    summarize(cor = round(cor(x, y), 2)) %>%
    glimpse()
  expect_equivalent(s_df$cor, rep(0.82, 4))
})

test_that("parties dataset replicates Clark and Golder's (2006) results", {
  # load data
  data(parties_df)
  # # regression model from their table 2, pooled analysis, whole sample, plus country and year
  fit <- lm(enep ~ log(average_magnitude)*eneg + upper_tier*eneg + en_pres*proximity, data = parties_df)
  # check the intercept
  expect_equivalent(round(coef(fit)["(Intercept)"], 2), 2.81)
  # check the number of observations
  expect_equivalent(nobs(fit), 555)
  # check R^2
  expect_equivalent(round(summary(fit)$r.squared, 2), 0.30)
})

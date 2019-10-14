test_that("therms dataset seems to work", {
  # load data
  data(therms)
  # check the class
  expect_s3_class(therms, "data.frame")
})

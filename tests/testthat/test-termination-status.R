test_that("status codes print nicely", {
  expect_output(show(MOI_SUCCESS), "success")
  expect_output(show(MOI_OPTIMIZE_NOT_CALLED), "optimize not called")
  expect_output(show(MOI_OPTIMAL), "optimal")
  expect_output(show(MOI_OTHER_ERROR), "error")
  expect_output(show(MOI_INFEASIBLE), "infeasible")
  expect_output(show(MOI_INFEASIBLE_OR_UNBOUNDED), "infeasible or unbounded")
})

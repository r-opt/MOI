test_that("equal_to_set", {
  set <- equal_to_set(5)
  expect_s4_class(set, "MOI_equal_to_set")
  expect_equal(set@value, 5)
})

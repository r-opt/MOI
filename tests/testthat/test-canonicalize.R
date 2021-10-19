test_that("canonicalize MOI_scalar_affine_function", {
  t1 <- moi_scalar_affine_term(1, moi_variable_index(1))
  t2 <- moi_scalar_affine_term(42, moi_variable_index(2))
  x <- moi_scalar_affine_function(list(t1, t2, t1, t2), 1)
  result <- canonicalize(x)
  expect_equal(length(result@terms), 2)
  expect_setequal(vapply(result@terms, function(x) {
    x@coefficient
  }, numeric(1)), c(2, 84))
})

test_that("canonicalize MOI_ScalarQuadraticFunction", {
  t1 <- moi_scalar_affine_term(1, moi_variable_index(1))
  t2 <- moi_scalar_affine_term(42, moi_variable_index(2))
  t3 <- moi_scalar_quadratic_term(42, moi_variable_index(1), moi_variable_index(2))
  t4 <- moi_scalar_quadratic_term(42, moi_variable_index(2), moi_variable_index(1))
  x <- moi_scalar_quadratic_function(
    list(t3, t4),
    list(t1, t2, t1, t2),
    1)
  result <- canonicalize(x)
  expect_equal(length(result@affine_terms), 2)
  expect_equal(length(result@quadratic_terms), 1)
  expect_setequal(vapply(result@affine_terms, function(x) {
    x@coefficient
  }, numeric(1)), c(2, 84))
  expect_equal(result@quadratic_terms[[1L]]@coefficient, 2 * 42)
})

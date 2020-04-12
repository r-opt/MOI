test_that("simple example", {
  model <- cache_model()
  x <- moi_add_variable(model)
  expect_s4_class(x, "MOI_variable_index")
  expect_true(moi_supports(model, variable_name))
  #expect_true(moi_supports(model, variable_index))
  moi_set(model, variable_name, x, "var1")
  #x2 <- moi_get(model, variable_index, "var1")
  #expect_equal(x, x2)
})

test_that("add variables", {
  model <- cache_model()
  vars <- moi_add_variables(model, 20)
  # expect_s3_class(vars, "MOI_VectorOfVariables")
  indexes <- vapply(vars, function(x) x@value, numeric(1))
  expect_equal(20, length(unique(indexes)))
})

test_that("add constrained variable", {
  model <- cache_model()
  x <- moi_add_constrained_variable(model, integer_set)
  expect_s4_class(x[[1]], "MOI_variable_index")
  expect_s4_class(x[[2]], "MOI_constraint_index")
})

test_that("larger example works", {
  model <- cache_model()
  x <- moi_add_variables(model, 2)
  moi_set(
    model,
    objective_function,
    scalar_affine_function(list(scalar_affine_term(3, x[[1]]), scalar_affine_term(2, x[[2]])), 0)
  )
  #moi_set(model, objective_sense, MAX_SENSE)
  moi_add_constraint(
    model,
    scalar_affine_function(list(scalar_affine_term(1, x[[1]]), scalar_affine_term(1, x[[2]])), 0.0),
    less_than_set(5.0)
  )
  moi_add_constraint(model, single_variable(x[[1]]), greater_than_set(0.0))
  moi_add_constraint(model, single_variable(x[[2]]), greater_than_set(-1.0))
})

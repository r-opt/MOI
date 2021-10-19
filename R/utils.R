#' Bring object to a canonical form
#' @param x an object
#' @export
#' @rdname canonicalize
setGeneric("canonicalize", function(x) {
  standardGeneric("canonicalize")
})

#' @export
#' @rdname canonicalize
setMethod("canonicalize", signature = "MOI_scalar_affine_function", function(x) {
  term_map <- list()
  for (term in x@terms) {
    name <- as.character(term@variable@value)
    term_map[[name]] <- c(term_map[[name]], term)
  }
  terms <- lapply(term_map, function(terms) {
    coefficient <- Reduce(function(acc, el) {
      acc + el@coefficient
    }, terms, init = 0)
    moi_scalar_affine_term(coefficient, terms[[1L]]@variable)
  })
  names(terms) <- NULL
  moi_scalar_affine_function(terms, x@constant)
})

#' @export
#' @rdname canonicalize
setMethod("canonicalize", signature = "MOI_scalar_quadratic_function", function(x) {
  #TODO: remove duplicate code
  term_map <- list()
  for (term in x@quadratic_terms) {
    name <- paste0(sort(
      c(
        as.character(term@variable1@value),
        as.character(term@variable2@value)
      )
    ), collapse = "/")
    term_map[[name]] <- c(term_map[[name]], term)
  }
  quad_terms <- lapply(term_map, function(terms) {
    coefficient <- Reduce(function(acc, el) {
      acc + el@coefficient
    }, terms, init = 0)
    moi_scalar_quadratic_term(coefficient, terms[[1L]]@variable1, terms[[1L]]@variable2)
  })
  names(quad_terms) <- NULL
  moi_scalar_quadratic_function(
    quad_terms,
    canonicalize(moi_scalar_affine_function(x@affine_terms, 0))@terms,
    x@constant
  )
})

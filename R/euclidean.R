#' Euclidean Function
#'
#' @description
#' In mathematics, the Euclidean algorithm or Euclid's algorithm, is an efficient method for computing the greatest common divisor (GCD) of two integers (numbers), the largest number that divides them both without a remainder.
#'
#'
#' @param val1 A numeric value that should be compared with `val1`.
#' @param val2 A numeric value that should be compared with `val2`.
#'
#' @return A numeric: the greatest common divisor of `val1` and `val2`.
#'
#'
euclidean <- function(val1, val2) {
  # Check if both val1 and val2 are integers
  if (val1 %% 1 != 0 || val2 %% 1 != 0) {
    stop("Both arguments must be integers.")
  }

  # Take the absolute values of val1 and val2
  # GCD is calculated without regard to the sign of the input values
  val1 <- abs(val1)
  val2 <- abs(val2)

  # Ensure that val1 is greater than or equal to val2.
  # where val1 is greater than or equal to val2, if val1 is not greater than val2, swap val1 and val2.
  if (val1 < val2) {
    temp_b <- val1
    val1 <- val2
    val2 <- temp_b

  }

  #find the remainder , "remainder_result" and update val1 and val2 until val2 becomes 0.
  while (val2 != 0) {
    remainder_result <- val1 %% val2
    val1 <- val2
    val2 <- remainder_result
  }

  return(val1)
}



#' Eulidean Function
#'
#' @description
#' A short description...
#'
#'
#' @param val1 A numeric value that should be compared with `val1`.
#' @param val2 A numeric value that should be compared with `val2`.
#'
#' @return A numeric: the greatest common divisior of `val1` and `val2`.
#'
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)


euclidean <- function(val1, val2) {
  # Check if both val1 and val2 are integers
  if (val1 %% 1 != 0 || val2 %% 1 != 0) {
    stop("Both arguments must be integers.")
  }
  
  # Take the absolute values of val1 and val2
  val1 <- abs(val1)
  val2 <- abs(val2)
  
  # Ensure that val1 is greater than or equal to val2
  if (val1 < val2) {
    temp_b <- val1
    val1 <- val2
    val2 <- temp_b
    
  }
  
  while (val2 != 0) {
    remainder <- val1 %% val2
    val1 <- val2
    val2 <- remainder
  }
  
  return(val1)
}

# Test cases
#result1 <- euclidean(123612, 13892347912)
#cat("GCD of 123612 and 13892347912:", result1, "\n")  # Output: 4

#result2 <- euclidean(-100, 1000)
#cat("GCD of -100 and 1000:", result2, "\n")            # Output: 100

#result3 <- euclidean(120, 144)
#cat("GCD of 120 and 144:", result3, "\n")

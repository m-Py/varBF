
#' Compute a Bayes Factor for the comparison of dependent variances
#' 
#' @param x first continuous variable
#' @param y second continuous variable
#' @param ... further arguments passed to \code{\link[BayesFactor]{correlationBF}}
#' 
#' 
#' @importFrom BayesFactor correlationBF extractBF
#' 
#' @return The bayes factor
#'
#' @export
#' 
#' @author Martin Papenberg \email{martin.papenberg@@hhu.de}
#'
#' @examples
#' 
#' depvarBF(sleep$extra[sleep$group == 1], sleep$extra[sleep$group == 2])
#' depvarBF(iris$Sepal.Length, iris$Petal.Width)
#'

depvarBF <- function(x, y, ...) {
  extractBF(correlationBF(x + y, x - y, ...), onlybf = TRUE)
}

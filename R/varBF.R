
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
#' 
#'

depvarBF <- function(x, y, ...) {
  extractBF(correlationBF(x - y, x + y, ...), onlybf = TRUE)
}


#' Compute a Bayes Factor for the comparison of dependent variances
#' 
#' @param x first continuous variable
#' @param y second continuous variable, sorted in the same order as \code{x}
#' @param rscale The prior width, passed to \code{\link[BayesFactor]{correlationBF}}
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
#' depvarBF(iris$Sepal.Length, iris$Petal.Width, rscale = "ultrawide")
#'
#' @details
#'
#' This function realizes a test of dependent variances by applying
#' the Morgan-Pitman test that reduces to a test of the "nullity"
#' of a correlation between the sum and difference of two continuous 
#' variables.
#'

depvarBF <- function(x, y, rscale = "medium") {
  extractBF(correlationBF(x + y, x - y, rscale = rscale), onlybf = TRUE)
}

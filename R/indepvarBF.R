
#' Compute a Bayes Factor for the comparison of independent variances
#' 
#' @param x first continuous variable
#' @param y second continuous variable
#' @param rscale The prior width, passed to \code{\link[BayesFactor]{oneWayAOV.Fstat}}
#'
#' @importFrom car leveneTest
#' @importFrom BayesFactor oneWayAOV.Fstat
#' 
#' @return The bayes factor favoring the alternative hypothesis as 
#'     compared to the null hypothesis
#'
#' @export
#' 
#' @author Martin Papenberg \email{martin.papenberg@@hhu.de}
#'
#' @note
#'
#' As stated it the documentation to \code{\link[BayesFactor]{oneWayAOV.Fstat}}, 
#' this method should only be used with F values obtained from balanced designs
#' (i.e., the groups should have equal size).
#'
#' @details
#'
#' This function realizes a test of independent variances by converting
#' the F value from a Levene test to a Bayes Factor using the function 
#' \code{\link[BayesFactor]{oneWayAOV.Fstat}}.
#' 
#' @examples
#' 
#' # True different variances:
#' indepvarBF(rnorm(100, mean = 100, sd = 15), rnorm(100, mean = 100, sd = 20))
#' # True same variances: 
#' indepvarBF(rnorm(100, mean = 100, sd = 15), rnorm(100, mean = 100, sd = 15))
#'

indepvarBF <- function(x, y, rscale = "medium") {
  if (length(x) != length(y)) {
    warning("This function should only be used for balanced designs, ",
            "but the input vectors have different length")
  }
  values <- c(x, y)
  group <- factor(rep(1:2, c(length(x), length(y))))
  levene <- leveneTest(y = values, group = group)
  unname(
    exp(
      oneWayAOV.Fstat(
        F = levene[["F value"]], 
        N = floor((length(x) + length(y)) / 2), 
        J = 2, 
        rscale = rscale
      )$bf
    )
  )
}

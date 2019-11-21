pckDIR <- "/home/martin/git/varBF/"
myRlib <- "/home/martin/R/x86_64-pc-linux-gnu-library/3.6/"

library("roxyPackage")

pckg.dscrptn <- data.frame(
  Package = "varBF",
  Type = "Package",
  Author = "Martin Papenberg",
  Title = "Bayes factors for the comparison variances",
  AuthorsR = "c(person(given='Martin', family='Papenberg',
       email='martin.papenberg@hhu.de', role=c('aut', 'cre', 'cph')))",
  Description="Compute Bayes factors for the comparison of variances",
  License="MIT + file LICENSE",
  Encoding="UTF-8",
  LazyData = "true",
  stringsAsFactors = FALSE,
  Imports = "BayesFactor, car",
  Depends = "R (>= 3.4.0)"
)

roxy.package(
   pck.source.dir = pckDIR,
   pck.version = "0.0.1",
   R.libs = myRlib,
   repo.root = "~/R/repo/varBF",
   pck.description = pckg.dscrptn,
   actions = c("roxy", "package", "doc")
)

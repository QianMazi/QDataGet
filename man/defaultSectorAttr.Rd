% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pub02_dataGettingFuncs.R
\name{defaultSectorAttr}
\alias{defaultSectorAttr}
\title{defaultSectorAttr}
\usage{
defaultSectorAttr(type = c("ind", "fct", "ind_fct", "fct_ind"),
  ind_std = 33, ind_level = 1, fct_std = list(list(factorFun = "gf_cap",
  factorPar = list(), factorDir = 1, factorRefine = list(outlier = list(method =
  "none", par = NULL, sectorAttr = NULL), std = list(method = "none", log =
  FALSE, sectorAttr = NULL, regLists = NULL), na = list(method = "none",
  sectorAttr = "median")), factorName = "mkt_cap", factorID = "", factorType =
  "", factorDesc = "")), fct_level = 3)
}
\arguments{
\item{type}{Currently supporting types : ind, fct, ind_fct, fct_ind}

\item{ind_std}{vector of integer.}

\item{ind_level}{vector of integer}

\item{fct_std}{a \bold{FactorLists} object}

\item{fct_level}{vector of integer. The number of fct splitted groups.}
}
\value{
A \bold{sectorAttr} object. A list with two items: 
\itemize{
\item std: a list( or a vector, if sector standards only include industry, not include factors) of sector standard;
\item level: a vector of sector level
}
}
\description{
get the sectorAttr list.
}
\examples{
defaultSectorAttr()
defaultSectorAttr("ind",ind_std=c(3,33))
defaultSectorAttr("fct") 
defaultSectorAttr("ind_fct")
defaultSectorAttr("fct_ind")
defaultSectorAttr("ind_fct",fct_level=5)
defaultSectorAttr("ind_fct",fct_std = RFactorModel::buildFactorLists_lcfs(c("F000001","F000006")),fct_level=c(2,3))
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pub02_dataGettingFuncs.R
\name{MF_getStockPort}
\alias{MF_getStockPort}
\title{MF_getStockPort}
\usage{
MF_getStockPort(fundID, rptDate, mode = c("all", "top10"), datasrc = c("jy",
  "ts", "wind"))
}
\description{
MF_getStockPort
}
\examples{
fundID <- c("519983.OF","519987.OF")
MF_getStockPort(fundID,as.Date("2016-09-30"),mode="top10",datasrc = "jy")
}

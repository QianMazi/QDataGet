% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pub02_dataGettingFuncs.R
\name{tsdate2r}
\alias{tsdate2r}
\title{tsdate2r}
\usage{
tsdate2r(tsdate, GAP.R2TS = 25569)
}
\arguments{
\item{tsdate}{a vector containing the tinysoft date value}

\item{GAP.R2TS}{the constant of R to tinysoft date-transformating}
}
\value{
a vector with \bold{Date} class, transformed from the tinysoft date value
}
\description{
transform the tinysoft date value to R date
}
\seealso{
\code{\link{rdate2ts}}
}
\author{
Ruifei.Yin
}

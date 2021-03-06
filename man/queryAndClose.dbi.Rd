% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pub02_dataGettingFuncs.R
\name{queryAndClose.dbi}
\alias{queryAndClose.dbi}
\title{queryAndClose.dbi}
\usage{
queryAndClose.dbi(db, query, ...)
}
\arguments{
\item{db}{a DBI data source object}

\item{query}{a character string,indicating the query to execute}
}
\value{
a dataframe
}
\description{
read data from a DBI data source with a query
}
\examples{
queryAndClose.dbi(db.local(),"select * from QT_DailyQuote limit 10")
}
\author{
Ruifei.Yin
}

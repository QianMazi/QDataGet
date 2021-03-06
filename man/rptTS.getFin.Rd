% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pub02_dataGettingFuncs.R
\name{rptTS.getFin}
\alias{rptTS.getFin}
\alias{rptTS.getFin_windR}
\alias{rptTS.getFin_ts}
\alias{rptTS.getFinSeri_ts}
\title{rptTS.getFin}
\usage{
rptTS.getFin_windR(rptTS, field, varname, ...)

rptTS.getFin_ts(rptTS, funchar, varname, ...)

rptTS.getFinSeri_ts(rptTS, N, freq, funchar, varname, ...)
}
\arguments{
\item{rptTS}{a \bold{rptTS} object. a dataframe with cols:"rptDate","stockID"}

\item{field}{character strting or a vector of character string, giving the windfields. eg.  "OPEN,CLOSE,HIGH" or c("OPEN","CLOSE","HIGH")}

\item{varname}{vector of charactor string}

\item{...}{other arguments except \code{rptDate} in \code{w.wss}}

\item{funchar}{expression to get variables from tinysoft,a character string, usually copyed from tinysoft "stock-data-expert" and then replace the specified reportdate in the stock-data-expert expression by \code{'Rdate'}. e.g. convert \code{Last12MData(20091231,46002)} to \code{Last12MData(Rdate,46002)}.}

\item{...}{other arguments in \code{ts.wss}.}
}
\value{
a dataframe with the same length with rptTS, but added by some other financial indicator fields.
}
\description{
get financtial indicators via \bold{rptTS} through WindR, or TinySoft.
}
\examples{
rptTS <- getrptTS(begT=as.Date("2011-02-06"),endT=as.Date("2011-10-23"),stocks=c("EQ000001","EQ000002"))
# rptTS.getFin_windR
re <- rptTS.getFin_windR(rptTS,"np_belongto_parcomsh",options ="rptType=1")
# rptTS.getFin_ts
re2 <- rptTS.getFin_ts(rptTS,'"np_belongto_parcomsh",report(46078,RDate)')
multi_funchar <- '"eps",reportofall(9900000,RDate),
   "zyywlrzzl",reportofall(9900601,RDate),
   "yszk",report(44009,RDate)'
re3 <- rptTS.getFin_ts(rptTS,multi_funchar)
# rptTS.getFinSeri_ts
FinSeri <- rptTS.getFinSeri_ts(rptTS,12,"q",'"np_belongto_parcomsh",report(46078,RDate)')
Finseri2 <- rptTS.getFinSeri_ts(rptTS,3,"y",multi_funchar)
}
\seealso{
\code{\link[WindR]{w.wss}}

\code{\link{ts.wss}}
}
\author{
Ruifei.Yin
}

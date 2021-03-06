% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pub02_dataGettingFuncs.R
\name{ts.wss}
\alias{ts.wss}
\title{ts.wss}
\usage{
ts.wss(stocks, funchar, varname, rptDate, Time = Sys.Date(), Rate = 1,
  RateDay = 0, adjust_yoy = FALSE)
}
\arguments{
\item{stocks}{a vector of stockID.}

\item{funchar}{expression to get variables from tinysoft,a character string, usually copyed from tinysoft "stock-data-expert". If you want to specify the rptDate by param \code{rptDate}, the expression should be converted simply by replaceing the specified reportdate in the stock-data-expert expression by \code{'Rdate'}. e.g. convert \code{Last12MData(20091231,46002)} to \code{Last12MData(Rdate,46002)}.}

\item{varname}{vector of charactor string}

\item{rptDate}{a specified rptDate, with class of Date. Could be missing when unnessasry. See examples for more detail.}

\item{Time}{a Date object, giving the pn_date() in tinysoft}

\item{Rate}{a integer,giving the type of rights adjustment, could be one of 0(no adjustment),1(geometric adjustment),2(simple adjustment),3}

\item{RateDay}{a integer,giving the base date of right adjustment,could be one of 0(the last trading day),-1(the IPO date),or a tinysoft date integer(eg. \code{rdate2ts(as.Date("2010-01-02"))})}

\item{adjust_yoy}{a logic.  If TRUE, param \code{Time} will be set to \code{rptDate.deadline(rptDate)}, the financial index before(not including) \code{rptDate} will be adjusted, the financial index after \code{rptDate} will not be adjusted.}
}
\value{
a dataframe,with cols:stockID,stockName,and the returned variables.
}
\description{
realize the "stock-data-expert" functions in Tinysoft.Given the stocklist, get specific variables of the stocks from Tinysoft.
}
\note{
you can get different financial index by set param Time and param adjust_yoy.
If you set param \code{Time} to 1900-01-01, all the financial index returned will not be adjusted; If you set param \code{Time} to \code{Sys.Date()}, all the financial index returned will be adjusted; See example for detail.
}
\examples{
stocks <- c("EQ600011","EQ000631","EQ000004")
funchar1 <- '"eps",reportofall(9900000,20121231),
   "zyywlrzzl",reportofall(9900601,20121231),
   "yszk",report(44009,20121231),
   "isFinanceCompany",IsFCompany_(),
   "close",close(),
   "rtn(\%)(19890705,20120705)",StockZf(32694,41095),
   "Ndayrtn(\%)(N=10)",StockZf2(10),
   "floatMV(20110926)",StockMarketValue(40812)'
re1 <- ts.wss(stocks,funchar1)

# -- specify the rptDate
funchar2 <- '"eps",reportofall(9900000,Rdate),
   "zyywlrzzl",reportofall(9900601,Rdate),
   "yszk",report(44009,Rdate),
   "isFinanceCompany",IsFCompany_(),
   "close",close(),
   "rtn(\%)(19890705,20120705)",StockZf(32694,41095),
   "Ndayrtn(\%)(N=10)",StockZf2(10),
   "floatMV(20110926)",StockMarketValue(40812)'
re2 <- ts.wss(stocks,funchar2,rptDate=as.Date('2012-12-31'))

all.equal(re1,re2)  # TRUE

# -- getting financial index (adjust or not)
ts.wss("EQ000027",'"G_NP_Q",LastQuarterData(Rdate,9900604,0)',as.Date("2007-03-31"),Time=as.Date("1900-06-29")) # 31.8 (07_adj/06_adj-1)
ts.wss("EQ000027",'"G_NP_Q",LastQuarterData(Rdate,9900604,0)',as.Date("2007-03-31"),Time=Sys.Date()) # 229.16 (07_unadj/06_unadj-1)
ts.wss("EQ000027",'"G_NP_Q",LastQuarterData(Rdate,9900604,0)',as.Date("2007-03-31"),adjust_yoy=TRUE) # 49 (07_unadj/06_adj-1) This is the correct one!
}

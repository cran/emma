\name{emmat0}
\alias{emmat0}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Defining the initial design
}
\description{
The function initializes the EMMA procedure. It generates the experimental space and selects the 
	initial set of experimental points, namely the initial set of experiments to be performed.  
	Random sampling is used for that purpose.
}
\usage{
emmat0(in.name, nlev, lower, upper, out.name, nd, fn1 = NULL, 
	fn2 = NULL, fn3 = NULL, fn4 = NULL)
}
%- maybe also 'usage' for other objects documented here
\arguments{
  \item{in.name}{
A vector containing the names of the input variables (factors).
}
  \item{nlev}{
A numeric vector of the same length as \code{in.name}, containing the number of factor levels.
}
  \item{lower}{
A numeric vector of the same length as \code{in.name}, containing the lower values of the factors.
}
  \item{upper}{
A numeric vector of the same length as \code{in.name}, containing the upper values of the factors.
}
  \item{out.name}{
A vector containing the name(s) of the output/response variable(s).
}
  \item{nd}{
Number of experimental points to be selected when \code{t = 0}.
}
  \item{fn1}{
The first function to be optimised; use \code{fn1 = NULL} if the objective 
	function is unknown, like in applied problems.
}
  \item{fn2}{
The first function to be optimised; use \code{fn2 = NULL} if the objective 
	function is unknown, like in applied problems.
}
  \item{fn3}{
The third function to be optimised; use \code{fn3 = NULL} if the objective 
	function is unknown, like in applied problems.
}
  \item{fn4}{
The fourth function to be optimised; use \code{fn4 = NULL} if the objective 
	function is unknown, like in applied problems.
}
}
\details{
At the moment the function does not implement the use of constraints for the factors. Unfeasible
	experiments are easily excluded by manipulating the matrix \code{xspace} in an object of 
	class \code{\link{emmat0}}.
}
\value{
An object of class \code{emmat0} with the components listed below:
  \item{xpop }{Experimental points investigated.}
  \item{ypop}{Response values observed at the experimental points investigated.}
  \item{xspace }{Experimental region.}
  \item{yspace }{Response values that have been either observed or predicted. Observed response values
	are stored also in \code{ypop}. Predicted response values are obtained using a MARS model fitted to 
	the available data.}
  \item{opt }{Indicates if each single function is either minimized ('mn') or maximized ('mx').}
  \item{nd }{Number of experimental points selected initially (\code{t=0}).}
  \item{na }{Number of experimental points selected in subsequent iterations (\code{t>0}).}
  \item{tested }{ID of the tested experimental points.}
  \item{time }{Current time instant of the EMMA procedure.}
  \item{opt }{Indicates if each single objective function is either minimized ('mn') or 
	maximized ('mx').}
}
\references{
Villanova L., Falcaro P., Carta D., Poli I., Hyndman R., Smith-Miles K. (2010) 
	'Functionalization of Microarray Devices: Process Optimization Using a 
	Multiobjective PSO and Multiresponse MARS Modelling', IEEE CEC 2010, 
	DOI: 10.1109/CEC.2010.5586165

Carta D., Villanova L., Costacurta S., Patelli A., Poli I., Vezzu' S., 
	Scopece P., Lisi F., Smith-Miles K., Hyndman R. J., Hill A. J., 
	Falcaro P. (2011) 'Method for Optimizing Coating Properties Based 
	on an Evolutionary Algorithm Approach', Analytical Chemistry 83 
	(16), 6373-6380.
}
\author{
Laura Villanova, Kate Smith-Miles and Rob J Hyndman
}
\examples{
#########################
## 1 response variable ##
#########################
## define the problem variables
in.name <- c("x1","x2")
nlev <- c(20, 20)
lower <- c(-2.048, -2.048)
upper <- c(2.048, 2.048)
out.name <- "y"

## identify the initial set of experimental runs (initialization)
## simulated problem (with known objective function)
tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10, fn1 = ackley)

## applicative problem (with unknown objective function)
tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10)
## perform the experiments in \code{tn$xpop} and measure the 
##	response values, then load in \code{tn$ypop} the measured 
##	response values 
# tn$ypop<-...


##########################
## 2 response variables ##
##########################
in.name <- c("x1", "x2")
nlev <- c(20, 20)
lower <- c(-3, -3)
upper <- c(3, 3)
out.name <- c("y1", "y2")
weight <- c(0.2, 0.8)
C <- 10
pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10, fn1 = ackley, 
	fn2 = peaks)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~Designed Experiments }
\keyword{ ~Optimization }

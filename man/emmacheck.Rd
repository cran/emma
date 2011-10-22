\name{emmacheck}
\alias{emmacheck}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Checking the need for additional experiments
}
\description{
The function evaluates if one additional experimental point is required. If this is the case, the function 
	provides with details about the additional experiment to be performed.
}
\usage{
emmacheck(x, graph, fn1 = NULL, fn2 = NULL, fn3 = NULL, fn4 = NULL, nresp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
An object of class \code{\link{emmatn}}.
}
  \item{graph}{
Logical; if "yes", a plot of the MARS model is produced. Note that a plot is produced only if the model 
	contains more than one explanatory variable.
}
  \item{fn1}{
The first function to be optimised. Use \code{fn1 = NULL} if the function is unknown (e.g. when designing experiments in 
	applied problems).
}
  \item{fn2}{
The second function to be optimised. Use \code{fn2 = NULL} if the function is unknown (e.g. when designing experiments in 
	applied problems).
}
  \item{fn3}{
The third function to be optimised. Use \code{fn3 = NULL} if the function is unknown (e.g. when designing experiments in 
	applied problems).
}
  \item{fn4}{
The fourth function to be optimised. Use \code{fn4 = NULL} if the function is unknown (e.g. when designing experiments in 
	applied problems).
}
  \item{nresp}{
The response to be plotted. Use \code{nresp = 1} to plot the first response...
}
}
\details{
Once the experiments identified by \code{\link{emma}} are implemented, the observed response values, the predicted
	response values, the target and the scalar distances from the target are updated. The 
	solution with the response values closest to the target is thus identified. If such a solution has 
	not been tested yet, \code{emmacheck} selects it as an additional experimental point that needs 
	to be investigated.}
\value{
An object of class \code{\link{emmatn}} with the components listed below:
  \item{xpop }{Experimental points investigated.}
  \item{ypop}{Response values observed at the experimental points investigated.}
  \item{xspace }{Experimental region. It is given by all the possible combinations of the factors' levels 
	and contains \code{xpop}. The rownames uniquely identify the experimental points and are reported
	also in \code{xpop}.}
  \item{yspace }{Response values that have been either observed or predicted. Observed response values
	are stored also in \code{ypop}. Predicted response values are obtained using a MARS model fitted to 
	the available data.}
  \item{opt }{Indicates if each single function is either minimized ('mn') or maximized ('mx').}
  \item{nd }{Number of experimental points selected initially (\code{t=0}).}
  \item{na }{Number of experimental points selected in subsequent iterations (\code{t>0}).}
  \item{Gb }{ID of the best experimental point investigated. Use \code{xspace[Gb,]} to visualise the 
	best experimental point and use \code{yspace[Gb,]} to visualise the measured response value(s).
 	\code{Gb} identifies the experimental point whose response values are closest to the target. The
	target is a set of desirable response values which are automatically selected on the basis of 
	the measured and predicted response values.}
  \item{add }{Logical. If '0' indicates that an additional experimental point needs to be investigated; if '1'
	indicates that an additional experimental point is not required.}
  \item{test }{IDs of the tested experimental points.}
  \item{time }{Current time instant of the EMMA procedure.}
  \item{weight }{Importance of each response. If only one response is investigated, then 
	\code{weight = 1}; if multiple responses are investigated, the sum of the values in \code{weight} must 
	be 1.}
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

Friedman J. H. (1991) 'Multivariate adaptive regression splines' (with 
	discussion), The Annals of Statistics 19, 1:141.
}
\author{
Laura Villanova, Kate Smith-Miles and Rob J Hyndman
}
\examples{
## define the problem variables
in.name <- c("x1", "x2")
nlev <- c(20, 20)
lower <- c(-2.048, -2.048)
upper <- c(2.048, 2.048)
out.name <- "y"
weight <- 1
C <- 10
pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

\dontrun{
#######################################################
## simulated problem (with known objective function) ##
#######################################################
##   identify the initial set of experimental runs (initialization)
tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10, fn1 = ackley)

##   identify the experimental runs during subsequent steps of the 
##	EMMA procedure
for(t in 1:(C - 1))
{
  tn <- emmatn(t, tn, na = 5, opt = "mn", weight, pr.mut = pr.mut, 
	graph = "yes", fn1 = ackley)
  tn <- emmacheck(tn, graph = "no", fn1 = ackley)
}
}

###########################################################
## applicative problem (with unknown objective function) ##
###########################################################
##   identify the initial set of experimental runs (initialization)
tn <- emmat0(in.name, nlev, lower, upper, out.name, nd = 10)

## perform the experiments in \code{tn$xpop} and measure the response 
##	values, then load the measured response values in \code{tn$ypop}
tn$ypop <- ackley(tn$xpop)

##   identify the experimental runs during subsequent steps of the 
##	EMMA procedure
for(t in 1:(C-1))
{
  tn <- emmatn(t, tn, na = 5, opt = "mn", weight, pr.mut = pr.mut, 
	graph = "no")
  tn$ypop <- ackley(tn$xpop)
  tn <- emmacheck(tn, graph = "no")
  if(tn$add==1) tn$ypop <- ackley(tn$xpop)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~Designed Experiments }
\keyword{ ~Optimization }

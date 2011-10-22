\name{emma-package}
\alias{emma-package}
\alias{EMMA}
\docType{package}
\title{
Designing experiments for process optimization
}
\description{
The evolutionary model-based multiresponse approach (EMMA) is a procedure for process optimization 
	and product improvement. It is particularly suited to processes featuring irregular experimental 
	region due to constraints on the input variables (factors), multiple responses not accomodated 
	by polynomial models, and expensive or time-consuming experiments. EMMA iterativelly selects 
	new experimental points that increasingly concentrate on the most promising regions of the 
	experimental space. The selection of the new experimental points is performed on the basis of 
	the results achieved during previous trials. A multivariate adaptive regression splines (MARS) 
	model and a particle swarm optimization (PSO) algorithm are used to drive the search of the 
	optimum.
}
\details{
\tabular{ll}{
Package: \tab emma\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-02-22\cr
License: \tab GPL (>=2)\cr
LazyLoad: \tab yes\cr
}
 
}
\author{
Laura Villanova, Kate Smith-Miles and Rob J Hyndman

Maintainer: Laura Villanova <laura.villanova@monash.edu>
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
\keyword{ ~Designed Experiments }
\examples{

in.name <- c("x1","x2")
nlev <- c(20, 20)
lower <- c(-3, -3)
upper <- c(3, 3)
out.name <- "y"
weight <- 1
C <- 20
pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

emma.peaks<-emma(in.name, nlev, lower, upper, out.name, opt = "mx", nd = 10, 
	na = 5, weight, C , w1 = 0.7, w2 = 0.4, c1i = 2.5, c1f = 0.5, 
	c2i = 0.5, c2f = 2.5, b = 5, pr.mut, graph = "no", fn1 = peaks)

plot(emma.peaks, fn = peaks, n = 50, C = 20)

}

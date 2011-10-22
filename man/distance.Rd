\name{distance}
\alias{distance}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Distance measure from the target
}
\description{
Computes a scalar distance between the target (a set of desirable values for 
	the responses) and the responses values that have been either observed
	or estimated for each point in the experimental space. Such 
	a distance is used to identify additional experimental points to be 
	investigated.
}
\usage{
distance(xpop, xspace, yspace, weight, opt)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{xpop}{
A data frame containing the factor values for the experimental points 
	investigated; the row names uniquely identify each experimental 
	point (ID).
}
  \item{xspace}{
A data frame containing the factor values for the experimental points 
	defining the entire experimental region; the row names uniquely 
	identify each experimental point (ID).
}
  \item{yspace}{
A data frame containing the response values (either observed or 
	estimated) for the points in the experimental region.
}
  \item{weight}{
A numerical vector, of the same length as the number of responses, 
	containing the weights assigned to the each response; the sum 
	of the weights must be equal to 1.
}
  \item{opt}{
A character vector, of the same length as the number of responses, 
	defining if each response needs to be minimized or maximized. 
	The allowed values are 'mn' (minimize) and 'mx' (maximize).
}
}
\details{
The function normalizes the response values with respect to the estimated limits of the response space, 
	so that the response values lie between 0 and 1. Subsequently, the function identifies the target 
	and computes a scalar distance between the target and the response values.
}
\value{
  \item{fit }{The scalar distances between the target and the response(s) values for the experimental points in 
	\code{xpop}.}
  \item{obj.nn }{Scalar distance from the target for the best experimental point identified by EMMA.}
}
\references{
Friedman J. H. (1991) 'Multivariate adaptive regression splines' (with 
	discussion), The Annals of Statistics 19, 1:141.

Villanova L., Falcaro P., Carta D., Poli I., Hyndman R., Smith-Miles K. (2010) 
	'Functionalization of Microarray Devices: Process Optimization Using a 
	Multiobjective PSO and Multiresponse MARS Modelling', IEEE CEC 2010, 
	DOI: 10.1109/CEC.2010.5586165
}
\author{
Laura Villanova, Kate Smith-Miles and Rob J Hyndman
}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~Designed Experiments }
\keyword{ ~Optimization }

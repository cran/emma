\name{emma}
\alias{emma}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Evolutionary Model-based Multiresponse Approach 
}
\description{
EMMA designs the experiments using a procedure based on the Particle Swarm Optimization (PSO) 
	algorithm. Firstly, EMMA selects a set of initial experimental points (see \code{\link{emmat0}}) that 
	define the initial position of the particles; subsequently, for a given number of iterations, 
	the particles are moved and new experimental points are selected (see \code{\link{emmatn}}). 
}
\usage{
emma(in.name, nlev, lower, upper, out.name, opt="mn", nd=10, na=5, 
	weight, C = 20, w1 = 0.7, w2 = 0.4, c1i = 2.5, c1f = 0.5, 
	c2i = 0.5, c2f = 2.5, b = 5, pr.mut, graph, fn1 = NULL, 
	fn2 = NULL, fn3 = NULL, fn4 = NULL, nresp) 
}
%- maybe also 'usage' for other objects documented here.
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
  \item{opt}{
A character vector of the same length as the number of responses, indicating for each response function, 
	if the response must be minimized ('mn') or maximized ('mx').
}
  \item{nd}{
Number of experimental points to be selected when \code{t = 0}.
}
  \item{na}{
A numeric value indicating the number of experimental points to be selected when \code{t > 0}.
}
  \item{weight}{
A numerical vector of the same length as the number of responses, reflecting the relevance of each response. 
	Use \code{weight = 1} if only one response is investigated; if multiple responses are investigated, 
	the sum of the values in \code{weight} must be 1.
}
  \item{C}{
A numeric value indicating the maximum number of iterations.
}
  \item{w1}{
The first numeric value used to calculate the inertia weight parameter of the time variant PSO algorithm; 
	the default is \code{w1 = 0.7}.
}
  \item{w2}{
The second numeric value used to calculate the inertia weight parameter of the time variant PSO algorithm;
	The default is \code{w2 = 0.4}.
}
  \item{c1i}{
The first numeric value used to calculate the acceleration coefficient \code{c1} of the time variant PSO algorithm;
	the default is \code{c1i = 2.5}.
}
  \item{c1f}{
The second numeric value used to calculate the acceleration coefficient \code{c1} of the time variant PSO algorithm;
	the default is \code{c1f = 0.5}.
}
  \item{c2i}{
The first numeric value used to calculate the acceleration coefficient \code{c2} of the time variant PSO algorithm;
	the default is \code{c2i = 0.5}.
}
  \item{c2f}{
The second numeric value used to calculate the acceleration coefficient \code{c2} of the time variant PSO algorithm;
	the default is \code{c2f = 2.5}.
}
  \item{b}{
A numeric value, used in the mutation operator, that determines the degree of dependence of the mutation 
	on the iteration number; the default is \code{b = 5}. 
}
  \item{pr.mut}{
A numeric vector of the same length as the number of iterations \code{C} containing the probability of mutation 
	for each time instant.
}
  \item{graph}{
Logical; if 'yes', a plot of the MARS model is produced. A plot is produced only if the model contains more 
	than one explanatory variable.
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
The forth function to be optimised. Use \code{fn4 = NULL} if the function is unknown (e.g. when designing experiments in 
	applied problems).
}
  \item{nresp}{
The response to be plotted. Use \code{nresp = 1} to plot the first response...
}
}
\details{
To select 
	the new experimental points to be investigated, the following steps are 
	iterated. A MARS model is fitted to the collected data so that an approximated function is obtained for 
	each response; these approximated functions are used to predict the response values at the non-investigated 
	experimental points. Each point in the experimental region \code{E} (\code{xspace}) is now associated with a vector of 
	response values that has been either measured or estimated. The best 
	(measured or estimated) value of each response is selected and used to identify the target. 
	Subsequently, for each experimental point in \code{E}, the scalar distance between the response values and
	the target is computed and the solution that is closest to the target is selected. If such solution 
	has not been tested yet (see \code{\link{emmacheck}}), the experiment needs to be performed and its response values
	are measured. The target is then updated, as well as the scalar distances of all the experimental points from the target. 
	The scalar distances are used to identify the good performing experimental points. The experimental point whose 
	response values are closest to the target is referred to as the global best. Similarly, a personal best is identified
	for each particle by considering the experimental points visited by that particle and selecting that point featuring
	the response values that are closest to the target. Finally, the particles velocity and position are updated and a new 
	set of experimental points is identified.

The parameters \code{w1} and \code{w2} are used to calculate the inertia weight \code{w} of the PSO algorithm, 
	namely the parameter that controls the influence of the previous particle velocity on the present velocity. 
	High values of \code{w} favour a global search, whereas lower values of \code{w} encourage a local search. 
	In EMMA the inertia weight is allowed to decrease linearly with iteration from \code{w1} to \code{w2} thus 
	favouring the exploration initially and the exploitation subsequently. The parameters \code{c1i} and \code{c1f} 
	are used to calculate the cognitive acceleration coefficient \code{c1} of the PSO algorithm, whereas the 
	parameters \code{c2i} and \code{c2f} are used to calculate the social acceleration coefficient \code{c2} of 
	the PSO algorithm.Higher values of \code{c1} ensure larger deviation of the particle in the search space 
	(exploration), while higher values of \code{c2} signify the convergence to the current global best (exploitation).
	In EMMA \code{c1} is allowed to decrease from \code{c1i} to \code{c1f} and \code{c2} is allowed to increase from
	\code{c2i} to \code{c2f}. See Tripathi et al. (2007) for more details.
}
\value{
An object of class \code{\link{emma}} with the components listed below:
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
  \item{tested }{IDs of the tested experimental points.}
  \item{time }{Current time instant of the EMMA procedure.}
  \item{weight }{Relative importance of each response. If only one response is investigated, then 
	\code{weight = 1}; if multiple responses are investigated, the sum of the values in \code{weight} must 
	be 1.}
  \item{Gb }{ID of the best experimental point investigated (global best). Use \code{xspace[Gb,]} to 
	visualise the global best and use \code{yspace[Gb,]} to visualise its measured response value(s).
 	\code{Gb} identifies the experimental point whose response values are closest to the target; the
	target is a set of desirable response values which are automatically selected on the basis of 
	the measured and predicted response values.}
  \item{Pb }{ID of the best experimental point investigated by each particle (personal best). Use 
	\code{xspace[Pb,]} to identify the personal bests and use \code{yspace[Pb,]} to visualise their
	measured response values. Among the experimental points associated to one particle, the \code{Pb} 
	identifies the experimental point that is whose response values are closest to the target.}
  \item{Gb.arch }{Archive of the global bests identified. Because the global best changes as new experimental 
	points are investigated, an archive is maintained.}
  \item{Pb.arch }{Archive of the personal bests identified. Because the personal bests change as new 
	experimental points are investigated, an archive is maintained.}
  \item{v }{Velocities used to update the particles position. The position of a particle is uniquely 
	determined by the predictors' values; it also defines the experiment to be performed. At each 
	step of EMMA, the position of a particle is updated by adding a numerical value (velocity) to the
	current value of each single predictor.}
  \item{sam.x }{IDs of the experiments that have been selected in the current iteration of the procedure.
	Use \code{xspace[sam.x,]} to visualise the experiments to be performed.}
  \item{add }{Logical. If '0' indicates that an additional experimental point needs to be investigated; if '1'
	indicates that an additional experimental point is not required.}
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

Tripathi P. K., Bandyopadhyay S., Pal S. K. (2007) 'Multi-objective particle 
	swarm optimization with time variant inertia and acceleration 
	coefficients' Information Sciences, 177, 5033:5049.
}
\author{
Laura Villanova, Kate Smith-Miles and Rob J Hyndman
}
\examples{

#########################
## 1 response variable ##
#########################
in.name <- c("x1","x2")
nlev <- c(20, 20)
lower <- c(-2.048, -2.048)
upper <- c(2.048, 2.048)
out.name <- "y"
weight <- 1
C <- 10
pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

emma(in.name, nlev, lower, upper, out.name, opt = "mn", nd = 10, na = 5, 
	weight, C , w1 = 0.7, w2 = 0.4, c1i = 2.5, c1f = 0.5, c2i = 0.5, 
	c2f = 2.5, b = 5, pr.mut, graph = "yes", fn1 = ackley) 

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

emma(in.name, nlev, lower, upper, out.name, opt = c("mn", "mx"), nd = 10, 
	na = 5, weight, C , w1 = 0.7, w2 = 0.4, c1i = 2.5, c1f = 0.5, 
	c2i = 0.5, c2f = 2.5, b = 5, pr.mut, graph = "yes", fn1 = ackley, 
	fn2 = peaks, nresp = 2)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~Designed Experiments }
\keyword{ ~Optimization }

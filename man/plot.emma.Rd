\name{plot.emma}
\alias{plot.emma}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
3D simulation plot
}
\description{
For a problem with 1 response and 2 input variables (factors) plots a 3D graph and shows how the simulation evolves.
}
\usage{
\method{plot}{emma}(x, n = 50, fn, C = 10,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
An object of class 'emma'.
}
  \item{n}{
The number of factors' levels to be plotted.
}
  \item{fn}{
The optimization function.
}
  \item{C}{
The number of time instants used in the EMMA procedure.
}
  \item{...}{
Other arguments not used.
}
}
\value{
...
}
\author{
Laura Villanova, Kate Smith-Miles and Rob J Hyndman
}
\examples{
  in.name <- c("x1","x2")
  nlev <- c(20, 20)
  lower <- c(-3, -3)
  upper <- c(3, 3)
  out.name <- "y"
  weight <- 1
  C <- 20
  pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

  emma.peaks<-emma(in.name, nlev, lower, upper, out.name, opt = "mx", 
	nd = 10, na = 5, weight, C , w1 = 0.7, w2 = 0.4, c1i = 2.5, 
	c1f = 0.5, c2i = 0.5, c2f = 2.5, b = 5, pr.mut, graph = "no", 
	fn1 = peaks)

  plot(emma.peaks, fn = peaks, n = 50, C = 20)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~Optimization }

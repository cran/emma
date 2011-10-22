\name{ackley}
\alias{ackley}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Ackley test problem
}
\description{
Generates the Ackley benchmark function. The Ackley function is a commonly used test problem 
	for global optimization procedures.
}
\usage{
ackley(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A matrix containing the values of the input variables.
}
}
\value{
Vector of the same length as \code{x} giving the values of the Ackley function.
}
\references{
\url{http://www-optima.amp.i.kyoto-u.ac.jp/member/student/hedar/Hedar_files/TestGO_files/Page295.htm}
}
\author{
Laura Villanova, Kate Smith-Miles and Rob J Hyndman
}
\examples{
x1 <- seq(-2, 2, length = 50)
x2 <- x1

x <- expand.grid(x1, x2)

z <- matrix(ackley(x),nrow = length(x1))

nrz <- nrow(z)
ncz <- ncol(z)
jet.colors <- colorRampPalette( c("red", "yellow") ) 
nbcol <- 100
color <- jet.colors(nbcol)
zfacet <- z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz]
facetcol <- cut(zfacet, nbcol)

persp(x1, x2, z, col = color[facetcol], theta = 0, phi = 10, 
	expand = 1, xlab = "x1", ylab = "x2", zlab = "f(x1, x2)", 
	ticktype = "detailed")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~Optimization }

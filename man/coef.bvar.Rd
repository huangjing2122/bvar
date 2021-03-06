% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/92_coef.R
\name{coef.bvar}
\alias{coef.bvar}
\alias{vcov.bvar}
\title{Coefficient and VCOV methods for Bayesian VARs}
\usage{
\method{coef}{bvar}(
  object,
  type = c("quantile", "mean"),
  conf_bands = 0.5,
  companion = FALSE,
  ...
)

\method{vcov}{bvar}(object, type = c("quantile", "mean"), conf_bands = 0.5, ...)
}
\arguments{
\item{object}{A \code{bvar} object, obtained from \code{\link{bvar}}.}

\item{type}{Character scalar. Whether to return quantile or mean values.
Note that \emph{conf_bands} is ignored for mean values.}

\item{conf_bands}{Numeric vector of confidence bands to apply.
E.g. for bands at 5\%, 10\%, 90\% and 95\% set this to \code{c(0.05, 0.1)}.
Note that the median, i.e. 0.5 is always included.}

\item{companion}{Logical scalar. Whether to retrieve the companion matrix of
coefficients. See \code{\link{companion.bvar}}.}

\item{...}{Not used.}
}
\value{
Returns a numeric array of class \code{bvar_coefs} or
\code{bvar_vcovs} at the specified values.
}
\description{
Retrieves coefficient / variance-covariance values from Bayesian VAR models
generated with \code{\link{bvar}}. Note that coefficients are available for
every stored draw and one may retrieve (a) credible intervals via the
\emph{conf_bands} argument, or (2) means via the \emph{type} argument.
}
\examples{
\donttest{
# Access a subset of the fred_qd dataset
data <- fred_qd[, c("CPIAUCSL", "UNRATE", "FEDFUNDS")]
# Transform it to be stationary
data <- fred_transform(data, codes = c(5, 5, 1), lag = 4)

# Estimate a BVAR using one lag, default settings and very few draws
x <- bvar(data, lags = 1, n_draw = 1000L, n_burn = 200L, verbose = FALSE)

# Get coefficent values at the 10\%, 50\% and 90\% quantiles
coef(x, conf_bands = 0.10)

# Only get the median of the variance-covariance matrix
vcov(x, conf_bands = 0.5)
}
}
\seealso{
\code{\link{bvar}}; \code{\link{companion.bvar}}
}
\keyword{BVAR}
\keyword{analysis}

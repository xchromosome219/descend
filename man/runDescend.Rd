% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/descend.R
\name{runDescend}
\alias{runDescend}
\title{Apply DESCEND to all the genes in the count matrix for one cell population}
\usage{
runDescend(count.matrix, ercc.matrix = NULL, scaling.consts = NULL,
  Z = NULL, Z0 = NULL, n.cores = 1, cl = NULL, do.LRT.test = F,
  family = c("Poisson", "Negative Binomial"), NB.size = 100, verbose = T,
  ercc.trueMol = NULL, control = list())
}
\arguments{
\item{count.matrix}{the observed UMI count matrix. Each row is a gene and each column is a cell. The column sums are used as the input for \code{scaling.consts} when both \code{ercc.matrix} and \code{scaling.consts} are NULL.}

\item{ercc.matrix}{the ERCC spike-ins are used for computing the cell-specific efficiency constants as \code{scaling.consts} when \code{scaling.consts} is NULL. Each row is a spike-in genes and each column is a cell. The number and order of the columns should be the same as the number and order of the columns of \code{count.matrix}.}

\item{scaling.consts}{a vector of cell specific scaling constants, either the cell efficiency or the library size}

\item{Z}{covariates for active intensity. Default is NULL.}

\item{Z0}{covariates for active fraction. Used only when zeroInflate is True. Default is NULL.}

\item{n.cores}{the number of cores used for parallel computing. Default is 1. Used only when parallel computing is done in a single machine. For using multi-machine cores, need to assign \code{cl} explicitly}

\item{cl}{an object of class "cluster". See more details in \code{\link[parallel]{makeCluster}}}

\item{do.LRT.test}{whether do LRT test on the coefficients and active fraction or not. Default is True}

\item{family}{family of the noise distribution, support either "Poisson" or "Negative Binomial" with known tuning parameter}

\item{NB.size}{over-dispersion parameter when the family is Negative Binomial: mu = mu + mu^2/size}

\item{verbose}{verbose the estimation and testing procedures or not. Default is True.}

\item{ercc.trueMol}{the true input number of molecules of the ercc spike-ins when \code{ercc.matrix} is not NULL.}

\item{control}{settings see {\code{\link{DESCEND.control}}}}
}
\value{
a list of DESCEND objects. The length of the list is the same as the number of genes. NA if the gene is too sparse or DESCEND fails to find a solution.
}
\description{
Apply DESCEND to deconvolve the true expression level distribution for every geneand calculate relavant distribution measurements. Parallel computing is allowed.
}
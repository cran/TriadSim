#' SNPs in the PLINK files
#'
#' A dataset containing the list of variables in the PLINK files
#' The variables are as follows:
#' @format A data frame with 10279 rows and 12 variables:
#' \describe{
#'   \item{ord}{Ordering of the SNPs}
#'   \item{RS}{SNP rs number}
#'   \item{CHR}{Chromosome}
#'   \item{POS}{Chromosomal position}
#'   \item{A1}{A1 allele}
#'   \item{A2}{A2 allele}
#'   \item{MAF}{Minor allele frequency}
#'   \item{NCHROBS}{Number of observed chromosomes used in MAF calculation}
#' }
"snp.all2"


#' An example recombination rate dataset
#'
#' This dataset is an example dataset of recombination rates between SNPs
#' The variables are as follows:
#' @format A data frame with 478 rows and 6 variables
#' \describe{
#'   \item{CHR}{Chromosome}
#'   \item{RS}{SNP rs number}
#'   \item{POS}{Chromosomal position}
#'   \item{RATE}{recombination rate between the SNP and the SNP above}
#' }
#'
"rcmb.rate"


<!-- README.md is generated from README.Rmd. Please edit that file -->
### TriadSim

*TriadSim* is a package that can simulate genotypes for case-parent triads, case-control, and quantitative trait samples with realistic linkage diequilibrium structure and allele frequency distribution. For studies of epistasis one can simulate models that involve specific SNPs at specific sets of loci, which we will refer to as "pathways". TriadSim generates genotype data by resampling triad genotypes from existing data. It takes genotypes in PLINK format as the input files. The genotypes for the mothers, fathers, and children are in separate files. The mothers, fathers, and children must be from the same set of triad families although the ordering of the families can be different for the three sets of data. After reading in the genotypes, a sorting step will reorder the families so that the three individuals in each family can realign.

### Installation

This pacakge can be installed from CRAN.

### A quick demo

``` r
library(TriadSim)
m.file <- paste(system.file(package = "TriadSim"),'/extdata/pop1_4chr_mom',sep='')
f.file <- paste(system.file(package = "TriadSim"),'/extdata/pop1_4chr_dad',sep='')
k.file <- paste(system.file(package = "TriadSim"),'/extdata/pop1_4chr_kid',sep='')
input.plink.file <- c(m.file, f.file, k.file)

TriadSim(input.plink.file, out.put.file=paste(tempdir(),'triad',sep=''), fr.desire=0.05,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=FALSE,risk.exposure= 1,risk.pathway.unexposed=c(1.5, 2), risk.pathway.exposed=c(1.5, 2), is.case=TRUE, e.fr=NA, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=NA)
#> [1]  21 118 121 140 155 168 218 383
#> coercing object of mode  numeric  to SnpMatrix
#> Writing FAM file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad1.fam 
#> Writing extended MAP file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad1.bim 
#> Writing BED file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad1.bed (SNP-major mode)
#> coercing object of mode  numeric  to SnpMatrix
#> Writing FAM file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad8.fam 
#> Writing extended MAP file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad8.bim 
#> Writing BED file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad8.bed (SNP-major mode)
#> coercing object of mode  numeric  to SnpMatrix
#> Writing FAM file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad17.fam 
#> Writing extended MAP file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad17.bim 
#> Writing BED file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad17.bed (SNP-major mode)
#> coercing object of mode  numeric  to SnpMatrix
#> Writing FAM file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad20.fam 
#> Writing extended MAP file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad20.bim 
#> Writing BED file to C:\Users\shi2\AppData\Local\Temp\2\RtmpCA8mlGtriad20.bed (SNP-major mode)
```

For more examples see the vignette in the package.

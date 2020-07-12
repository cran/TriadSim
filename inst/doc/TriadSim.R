## -----------------------------------------------------------------------------
library(TriadSim)
 m.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_mom')
 f.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_dad')
 k.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_kid')
 input.plink.file <- c(m.file, f.file, k.file)

 TriadSim(input.plink.file, out.put.file=file.path(tempdir(),'triad'), fr.desire=0.05,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=FALSE,risk.exposure= 1,risk.pathway.unexposed=c(1.5, 2), risk.pathway.exposed=c(1.5, 2), is.case=TRUE, e.fr=NA, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=1)


## -----------------------------------------------------------------------------
 m.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_mom')
 f.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_dad')
 picked.target <- pick_target.snp(c(m.file,f.file),0.05, 8)
 cat('Target SNPs picked:',picked.target[[2]],'\n')

## -----------------------------------------------------------------------------
target.snp <- picked.target[[2]]
 m.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_mom')
 f.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_dad')
 k.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_kid')
target.geno <- get.target.geno(c(m.file,f.file,k.file), target.snp,snp.all2)

## -----------------------------------------------------------------------------
found.brks <- get.brks(N.brk=3,n.ped=1000, snp.all2, target.snp,rcmb.rate=rcmb.rate)
breaks <- found.brks[[1]]
family.position <- found.brks[[2]] 

## -----------------------------------------------------------------------------
dim(breaks)
head(breaks)

## -----------------------------------------------------------------------------
dim(family.position)
head(family.position)


## ------------------------------------------------------------------------
library(TriadSim)
 m.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_mom')
 f.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_dad')
 k.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_kid')
 input.plink.file <- c(m.file, f.file, k.file)

 TriadSim(input.plink.file, out.put.file=file.path(tempdir(),'triad'), fr.desire=0.05,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=FALSE,risk.exposure= 1,risk.pathway.unexposed=c(1.5, 2), risk.pathway.exposed=c(1.5, 2), is.case=TRUE, e.fr=NA, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=1)


## ------------------------------------------------------------------------
 TriadSim(input.plink.file, file.path(tempdir(),'qtl'), fr.desire=0.3,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=FALSE,risk.exposure= 1,risk.pathway.unexposed=c(0.5, 1), risk.pathway.exposed=c(0.5, 1), is.case=TRUE, e.fr=NA, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=1, qtl=T)

## ------------------------------------------------------------------------
 TriadSim(input.plink.file, file.path(tempdir(),'gxe'), fr.desire=0.3,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=FALSE,risk.exposure= 1.2,risk.pathway.unexposed=c(1,1), risk.pathway.exposed=c(1.5, 2), is.case=TRUE, e.fr=0.3, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=1, qtl=FALSE)

## ------------------------------------------------------------------------
library(TriadSim)
 m.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_mom')
 f.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_dad')
 k.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_kid')
 m.file2 <- file.path(system.file(package = "TriadSim"),'extdata/pop2_4chr_mom')
 f.file2 <- file.path(system.file(package = "TriadSim"),'extdata/pop2_4chr_dad')
 k.file2 <- file.path(system.file(package = "TriadSim"),'extdata/pop2_4chr_kid')
 input.plink.file2 <- list(c(m.file, f.file, k.file),c(m.file2, f.file2, k.file2))

 TriadSim(input.plink.file2, out.put.file=file.path(tempdir(),'stratified') , fr.desire=0.3,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=FALSE,risk.exposure= 1.2,risk.pathway.unexposed=c(1,1), risk.pathway.exposed=c(1.5, 2), is.case=TRUE, e.fr=c(0.1, 0.3), pop1.frac=0.5, P0.ratio=3,rcmb.rate, no_cores=1)


## ------------------------------------------------------------------------
## cases
 TriadSim(input.plink.file,file.path(tempdir(),'case') , fr.desire=0.05,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=TRUE,risk.exposure= 1,risk.pathway.unexposed=c(1.5, 2), risk.pathway.exposed=c(1.5, 2), is.case=TRUE, e.fr=NA, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=1)
## controls
 TriadSim(input.plink.file, file.path(tempdir(),'ctrl'), fr.desire=0.05,pathways=list(1:4,5:8),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=TRUE,risk.exposure= 1,risk.pathway.unexposed=c(1.5, 2), risk.pathway.exposed=c(1.5, 2), is.case=FALSE, e.fr=NA, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=1)


## ------------------------------------------------------------------------
 TriadSim(input.plink.file, file.path(tempdir(),'singleSNP'), fr.desire=0.05,pathways=list(1,2),n.ped=1000, N.brk=3, target.snp=NA,P0=0.001,is.OR=FALSE,risk.exposure= 1,risk.pathway.unexposed=c(1.5, 1), risk.pathway.exposed=c(1.5, 1), is.case=TRUE, e.fr=NA, pop1.frac=NA, P0.ratio=1,rcmb.rate, no_cores=1)


## ------------------------------------------------------------------------
 m.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_mom')
 f.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_dad')
 picked.target <- pick_target.snp(c(m.file,f.file),0.05, 8)
 cat('Target SNPs picked:',picked.target[[2]],'\n')

## ------------------------------------------------------------------------
target.snp <- picked.target[[2]]
 m.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_mom')
 f.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_dad')
 k.file <- file.path(system.file(package = "TriadSim"),'extdata/pop1_4chr_kid')
# the preloaded data frame snp.all2 contains the data frame read from the corresponding .bim file.
target.geno <- get.target.geno(c(m.file,f.file,k.file), target.snp,snp.all2)

## ------------------------------------------------------------------------
length(target.geno)

## ------------------------------------------------------------------------
mom.target <- target.geno[[1]]
dad.target <- target.geno[[2]]
kid.target <- target.geno[[3]]
str(mom.target)

## ------------------------------------------------------------------------
found.brks <- get.brks(N.brk=3,n.ped=1000, snp.all2, target.snp,rcmb.rate=rcmb.rate)
breaks <- found.brks[[1]]
family.position <- found.brks[[2]] 

## ------------------------------------------------------------------------
dim(breaks)
head(breaks)

## ------------------------------------------------------------------------
dim(family.position)
head(family.position)

## ------------------------------------------------------------------------
betas <- c(-6.4, 3.2, 5.8)
pwy <- list(1:4,5:8)
## scenarios of genetic main effects only for a binary phenotype
fitted.model1 <- fit.risk.model.par(n.ped=1000,brks=breaks,target.snp,fam.pos=family.position, 
mom.tar=mom.target,dad.tar=dad.target, kid.tar=kid.target, pathways=pwy, 
betas, e.fr=NA, betas,pop1.frac= NA,rate.beta=NA,qtl= FALSE,out.put.file=file.path(tempdir(),'riskmodel1'),no_cores=1)

## ------------------------------------------------------------------------
sel.fam <- fitted.model1[[1]]
colnames(sel.fam) <- paste('seg',1:ncol(sel.fam),sep="_")
rownames(sel.fam) <- paste('fam',1:nrow(sel.fam),sep="_")
dim(sel.fam)
head(sel.fam)

## ------------------------------------------------------------------------
sim.pathway.geno <-  fitted.model1[[2]]
colnames(sim.pathway.geno) <- paste('target.snp',1:ncol(sim.pathway.geno),sep="_")
rownames(sim.pathway.geno) <- paste('fam',1:nrow(sim.pathway.geno),sep="_")
dim(sim.pathway.geno)
head(sim.pathway.geno)

## ------------------------------------------------------------------------
## a scenario of gene-environment interaction  for a binary phenotype
betas.e <- c(-6.4, 3.9, 6.5)

fitted.model2 <- fit.risk.model.par(n.ped=1000,brks=breaks,target.snp,fam.pos=family.position, 
mom.tar=mom.target,dad.tar=dad.target, kid.tar=kid.target, pathways=pwy, 
betas, e.fr= 0.2, betas.e,pop1.frac= NA,rate.beta=NA, qtl= FALSE,out.put.file=file.path(tempdir(),'riskmodel2'),no_cores=1)

## ------------------------------------------------------------------------
exposure <-  fitted.model2[[3]]
table(exposure)

## ------------------------------------------------------------------------
## scenarios of a quantitative trait phenotype
fitted.model3 <- fit.risk.model.par(n.ped=1000,brks=breaks,target.snp,fam.pos=family.position, 
mom.tar=mom.target,dad.tar=dad.target, kid.tar=kid.target, pathways=pwy, 
betas, e.fr=NA, betas,pop1.frac= NA,rate.beta=NA,qtl=TRUE,out.put.file=file.path(tempdir(),'riskmodel3'),no_cores=1)

## ----fig.width=6, fig.height=6-------------------------------------------
qt.pheno <-  fitted.model3[[5]]
hist(qt.pheno,main='Histogram of Simulated Quantitative Trait',xlab='QT')

## ------------------------------------------------------------------------
glue.chr.segment.par(c(m.file,f.file,k.file),file.path(tempdir(),'triad'), breaks,sel.fam,snp.all2,sim.pathway.geno,target.snp,pop.vec=NA,no_cores=1,flip=TRUE) 


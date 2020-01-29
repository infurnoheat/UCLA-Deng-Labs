#to install pkgs:

if(!requireNamespace("BiocManager" , quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()
BiocManager::install(c("GenomicFeatures" , "AnnotationDbi" , "BioBase"))
BiocManager::install(c("limma" , "sva" , "pamr"))

#to load the previously installed pkgs:

library(sva)
library(pamr)
library(limma)
library(GenomicFeatures)
library(AnnotationDbi)

#setting up the data

MODRAW = read.csv("82-Gene_Expression_Data_Nameless.csv" , header = TRUE) #gene expression file
MODPHENO = read.csv("82-Gene_Phenotype_Data_Nameless.csv" , header = TRUE) #phenotype file
dat <- as.matrix("MODRAW")

#executing ComBat

newdata <- ComBat(dat = dat , batch = MODPHENO$Batch , par.prior = FALSE , mod = NULL)

#writing into a file

write.csv(newdata , file = "SampleData_ComBat.csv")
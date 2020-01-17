#to install packages:

if(!requireNamespace("BiocManager" , quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()
BiocManager::install(c("GenomicFeatures" , "AnnotationDbi" , "BioBase"))
BiocManager::install(c("limma" , "sva" , "pamr"))

#to load the previously installed packages:

library(sva)
library(pamr)
library(limma)
library(GenomicFeatures)
library(AnnotationDbi)

#setting up the data

MODRAW = read.csv("file.name" , header = TRUE) #gene expression file
MODPHENO = read.csv("file.name" , header = TRUE) #phenotype file
dat <- as.matrix("MODRAW")

#executing ComBat

newdata <- ComBat(dat =dat , batch = MODPHENO$Batch , par.prior = FALSE , mod = null)

#writing into a file
write.csv(newdata , file = "SampleData_ComBat.csv")

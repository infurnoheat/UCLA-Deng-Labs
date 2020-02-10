#to install pkgs:

if(!requireNamespace("BiocManager" , quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()
BiocManager::install(c("GenomicFeatures" , "AnnotationDbi" , "Biobase"))
BiocManager::install(c("limma" , "sva" , "pamr"))

#to load the previously installed pkgs:

library(sva)
library(pamr)
library(limma)
library(GenomicFeatures)
library(AnnotationDbi)

#setting up the data

MODRAW = read.csv("FINAL_EDITED_Qunitified 81 samples master sheet DengLab_Irina_for_Tristan.csv" , header = TRUE) #gene expression file
MODPHENO = read.csv("FINAL_Edited_81 patients_Batch-Age-SOFA_GeneLists.csv" , header = TRUE) #phenotype file
dat <- as.matrix(MODRAW)
batches = MODPHENO$batch

#executing ComBat

newdata <- ComBat(dat = dat , batch = batches , par.prior = FALSE , mod = NULL)

#writing into a file

write.csv(newdata , file = "SampleData_ComBat.csv")
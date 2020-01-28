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

MODRAW = read.csv("82-Gene_Expression_Data.csv" , header = TRUE) #gene expression file
MODPHENO = read.csv("82-Gene_Phenotype_Data.csv" , header = TRUE) #phenotype file
dat <- as.matrix("MODRAW")

#executing LM

newdata <- lmFit(dat , MODPHENO) #Look deeper into

#writing to a file

write.csv(newdata , file = "SampleData_LM.csv")
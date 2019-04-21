setwd("~/Heatmap_Files")
ROI1 <- read.csv("ROI1.csv")
ROI2 <- read.csv("ROI2.csv")
ROI3 <- read.csv("ROI3.csv")
ROI4 <- read.csv("ROI4.csv")
ROI5 <- read.csv("ROI5.csv")
firstCOL <- "1"
lastCOL <- "14"
columnORDER <- c("CD107a","CD3","CD45","CD68","CD86","FerritinHC","HLADR","Mac2","MerTK","PLP","S100B","TIM3","Vimentin","Phenograph")
ROI1SUBSET <- ROI1[,firstCOL:lastCOL]
ROI2SUBSET <- ROI2[,firstCOL:lastCOL]
ROI3SUBSET <- ROI3[,firstCOL:lastCOL]
ROI4SUBSET <- ROI4[,firstCOL:lastCOL]
ROI5SUBSET <- ROI5[,firstCOL:lastCOL]
colnames(ROI1SUBSET) <- columnORDER
colnames(ROI2SUBSET) <- columnORDER
colnames(ROI3SUBSET) <- columnORDER
colnames(ROI4SUBSET) <- columnORDER
colnames(ROI5SUBSET) <- columnORDER
ROIMERGED <- rbind(ROI1SUBSET,ROI2SUBSET,ROI3SUBSET,ROI4SUBSET,ROI5SUBSET)
reallastCOL <- "13"
ROI1SUBSET2 <- ROI1[,firstCOL:reallastCOL]
ROI2SUBSET2 <- ROI2[,firstCOL:reallastCOL]
ROI3SUBSET2 <- ROI3[,firstCOL:reallastCOL]
ROI4SUBSET2 <- ROI4[,firstCOL:reallastCOL]
ROI5SUBSET2 <- ROI5[,firstCOL:reallastCOL]
columnORDER2 <- c("CD107a","CD3","CD45","CD68","CD86","FerritinHC","HLADR","Mac2","MerTK","PLP","S100B","TIM3","Vimentin")
colnames(ROI1SUBSET2) <- columnORDER2
colnames(ROI2SUBSET2) <- columnORDER2
colnames(ROI3SUBSET2) <- columnORDER2
colnames(ROI4SUBSET2) <- columnORDER2
colnames(ROI5SUBSET2) <- columnORDER2
ROIMERGED2 <- rbind(ROI1SUBSET2,ROI2SUBSET2,ROI3SUBSET2,ROI4SUBSET2,ROI5SUBSET2)
ROIMERGEDMTX2 <- data.matrix(ROIMERGED2[,firstCOL:reallastCOL])
NumberClusters <- as.vector(ROIMERGED$Phenograph)
library("ComplexHeatmap")
library("circlize")
Heatmap(ROIMERGEDMTX2,split = NumberClusters,gap = unit(1, "mm"),row_dend_side = "left",row_dend_width = unit(10, "mm"),clustering_method_columns = "ward.D2",clustering_method_rows = "ward.D2",column_dend_side = "top",column_dend_height = unit(10, "mm")) 
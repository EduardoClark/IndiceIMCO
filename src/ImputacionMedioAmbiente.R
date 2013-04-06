## Visually search for missing data patterns within the data base
jpeg('graphs/MedioAmbienteMissingValuePlot.jpg')
DerechoMissing <- missing.pattern.plot(Data, gray.scale = FALSE)
dev.off()
## Obtains Missing Value Info
info <- mi.info(Data)
info
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data, n.imp=3, n.iter=200, run.past.convergence=TRUE)
jpeg('graphs/MedioAmbienteImputationPlot.jpg') ## Post IM plots
plot(IMP) 
 
dev.off()

##Get Imputation data back
IMP.dat.all <- mi.completed(IMP)



## Reshape data export (Export 5 simulations to .csv)
for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  AguaAgricultura <- IMP.dat$Region
  AguaAgricultura <- as.data.frame(AguaAgricultura)
  AguaAgricultura$Year <- IMP.dat$Year
  AguaAgricultura$CoeficienteInvención1 <- IMP.dat$MA_consumo_agua_agricultura
  colnames(AguaAgricultura) <- c("Region", "Year", "AguaAgricultura1")
  AguaAgricultura <- dcast(data=AguaAgricultura, Region ~ Year )
  filename <- paste("OutputData/AguaAgriculturaImputado", i, ".csv", sep="")
  write.csv(AguaAgricultura, file=filename)
}
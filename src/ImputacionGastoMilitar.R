## Visually search for missing data patterns within the data base
jpeg('graphs/RIMissingValuePlot.jpg')
DerechoMissing <- missing.pattern.plot(Data, gray.scale = FALSE)
dev.off()
## Obtains Missing Value Info
mi.info(Data)
print(MvInfo)
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data)
jpeg('graphs/RIImputationPlot.jpg') ## Post IM plots
plot(IMP) 
dev.off()

##Get Imputation data back
IMP.dat.all <- mi.completed(IMP)

## Reshape data export (Export 5 simulations to .csv)
for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  CoeficienteInvención <- IMP.dat$Region
  CoeficienteInvención <- as.data.frame(CoeficienteInvención)
  CoeficienteInvención$Year <- IMP.dat$Year
  CoeficienteInvención$CoeficienteInvención1 <- IMP.dat$RI_gasto_militar
  colnames(CoeficienteInvención) <- c("Region", "Year", "GastoMilitar1")
  CoeficienteInvención <- dcast(data=CoeficienteInvención, Region ~ Year )
  filename <- paste("GastoMilitarImputado", i, ".csv", sep="")
  write.csv(CoeficienteInvención, file=filename)
}
## Visually search for missing data patterns within the data base
jpeg('graphs/GobiernoMissingValuePlot.jpg')
DerechoMissing <- missing.pattern.plot(Data, gray.scale = FALSE)
dev.off()
## Obtains Missing Value Info
info <- mi.info(Data)
info
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data)
jpeg('graphs/GobiernoImputationPlot.jpg') ## Post IM plots
plot(IMP) 
dev.off()

##Get Imputation data back
IMP.dat.all <- mi.completed(IMP)



## Reshape data export (Export 3 simulations to .csv)
for(i in 1:3){
IMP.dat <- mi.data.frame(IMP, m = i)
ImpuestoIngreso <- IMP.dat$Region
ImpuestoIngreso <- as.data.frame(ImpuestoIngreso)
ImpuestoIngreso$Year <- IMP.dat$Year
ImpuestoIngreso$ImpuestoIngreso1 <- IMP.dat$Gobierno_impuesto_sobre_ingreso
colnames(ImpuestoIngreso) <- c("Region", "Year", "ImpuestoIngreso1")
ImpuestoIngreso <- dcast(data=ImpuestoIngreso, Region ~ Year )
filename <- paste("OutputData/ImpuestoIngresoImputado", i, ".csv", sep="")
write.csv(ImpuestoIngreso, file=filename)
}
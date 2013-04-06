## Visually search for missing data patterns within the data base
jpeg('graphs/PrecursoresMissingValuePlot.jpg')
DerechoMissing <- missing.pattern.plot(Data, gray.scale = FALSE)
dev.off()
## Obtains Missing Value Info
info <- mi.info(Data)
info
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data, n.imp=3, n.iter=200, run.past.convergence=FALSE)
jpeg('graphs/PrecursoresImputationPlot.jpg') ## Post IM plots
plot(IMP) 

dev.off()

##Get Imputation data back
IMP.dat.all <- mi.completed(IMP)



## Reshape data export (Export 3 simulations to .csv)
for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  InfraPortuaria <- IMP.dat$Region
  InfraPortuaria <- as.data.frame(InfraPortuaria)
  InfraPortuaria$Year <- IMP.dat$Year
  InfraPortuaria$CoeficienteInvención1 <- IMP.dat$Precursores_infraestructura_portuaria
  colnames(InfraPortuaria) <- c("Region", "Year", "InfraPortuaria1")
  InfraPortuaria <- dcast(data=InfraPortuaria, Region ~ Year )
  filename <- paste("OutputData/InfraPortuariaImputado", i, ".csv", sep="")
  write.csv(InfraPortuaria, file=filename)
}


for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_inversion_telecom
  colnames(InvTelecom) <- c("Region", "Year", "InvTelecom1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/InvTelecomImputado", i, ".csv", sep="")
  write.csv(InvTelecom, file=filename)
}


for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_tasa_depósito
  colnames(InvTelecom) <- c("Region", "Year", "TasaDeposito1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/TasaDepositoImputado", i, ".csv", sep="")
  write.csv(InvTelecom, file=filename)
}

for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_tasa_préstamo
  colnames(InvTelecom) <- c("Region", "Year", "TasaPrestamo1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/TasaPrestamomputado", i, ".csv", sep="")
  write.csv(InvTelecom, file=filename)
}

for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_vuelos
  colnames(InvTelecom) <- c("Region", "Year", "Vuelos1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/VuelosImomputado", i, ".csv", sep="")
  write.csv(InvTelecom, file=filename)
}

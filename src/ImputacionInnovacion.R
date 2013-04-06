## Visually search for missing data patterns within the data base
jpeg('graphs/InnovacionMissingValuePlot.jpg')
DerechoMissing <- missing.pattern.plot(Data, gray.scale = FALSE)
dev.off()
## Obtains Missing Value Info
info <- mi.info(Data)
info
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data, n.imp=5, n.iter=50, run.past.convergence=TRUE)
jpeg('graphs/InnovacionImputationPlot.jpg') ## Post IM plots
plot(IMP) 
dev.off()

##Get Imputation data back
IMP.dat.all <- mi.completed(IMP)



## Reshape data export (Export 5 simulations to .csv)
for(i in 1:5){
  IMP.dat <- mi.data.frame(IMP, m = i)
  CoeficienteInvención <- IMP.dat$Region
  CoeficienteInvención <- as.data.frame(CoeficienteInvención)
  CoeficienteInvención$Year <- IMP.dat$Year
  CoeficienteInvención$CoeficienteInvención1 <- IMP.dat$Innovación_coeficiente_invención
  colnames(CoeficienteInvención) <- c("Region", "Year", "CoeficienteInvención1")
  CoeficienteInvención <- dcast(data=CoeficienteInvención, Region ~ Year )
  filename <- paste("OutputData/CoeficienteInvenciónImputado", i, ".csv", sep="")
  write.csv(CoeficienteInvención, file=filename)
}

for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  GastoInvestigación <- IMP.dat$Region
  GastoInvestigación <- as.data.frame(GastoInvestigación)
  GastoInvestigación$Year <- IMP.dat$Year
  GastoInvestigación$GastoInvestigación1 <- IMP.dat$Innovación_gasto_investigación
  colnames(GastoInvestigación) <- c("Region", "Year", "GastoInvestigación1")
  GastoInvestigación <- dcast(data=GastoInvestigación, Region ~ Year )
  filename <- paste("OutputData/GastoInvestigaciónImputado", i, ".csv", sep="")
  write.csv(GastoInvestigación, file=filename)
}

for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  GastoInvestigación <- IMP.dat$Region
  GastoInvestigación <- as.data.frame(GastoInvestigación)
  GastoInvestigación$Year <- IMP.dat$Year
  GastoInvestigación$GastoInvestigación1 <- IMP.dat$Innovación_gasto_investigación
  colnames(GastoInvestigación) <- c("Region", "Year", "GastoInvestigación1")
  GastoInvestigación <- dcast(data=GastoInvestigación, Region ~ Year )
  filename <- paste("OutputData/GastoInvestigaciónImputado", i, ".csv", sep="")
  write.csv(GastoInvestigación, file=filename)
}

for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  IngresosRegalias <- IMP.dat$Region
  IngresosRegalias <- as.data.frame(IngresosRegalias)
  IngresosRegalias$Year <- IMP.dat$Year
  IngresosRegalias$IngresosRegalias1 <- IMP.dat$Innovación_ingresos_regalías
  colnames(IngresosRegalias) <- c("Region", "Year", "IngresosRegalias1")
  IngresosRegalias <- dcast(data=IngresosRegalias, Region ~ Year )
  filename <- paste("OutputData/IngresosRegaliasImputado", i, ".csv", sep="")
  write.csv(IngresosRegalias, file=filename)
}

for(i in 1:3){
  InnovacionInvestigadores <- mi.data.frame(IMP, m = i)
  InnovacionInvestigadores <- IMP.dat$Region
  InnovacionInvestigadores <- as.data.frame(InnovacionInvestigadores)
  InnovacionInvestigadores$Year <- IMP.dat$Year
  InnovacionInvestigadores$InnovacionInvestigadores1 <- IMP.dat$Innovación_investigadores
  colnames(InnovacionInvestigadores) <- c("Region", "Year", "InnovacionInvestigadores1")
  InnovacionInvestigadores <- dcast(data=InnovacionInvestigadores, Region ~ Year )
  filename <- paste("OutputData/InnovacionInvestigadoresImputado", i, ".csv", sep="")
  write.csv(InnovacionInvestigadores, file=filename)
}

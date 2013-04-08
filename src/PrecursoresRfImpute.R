## Use Random Forest missing value imputation method for Derecho subvariables
set.seed(085)
IMP.dat <- rfImpute(Region ~ ., Data)
set.seed(265)
PrecursoresRfImpute.X <- randomForest(Region ~ ., IMP.dat)
print(PrecursoresRfImpute.X)


## Reshape data export 

  InfraPortuaria <- IMP.dat$Region
  InfraPortuaria <- as.data.frame(InfraPortuaria)
  InfraPortuaria$Year <- IMP.dat$Year
  InfraPortuaria$CoeficienteInvención1 <- IMP.dat$Precursores_infraestructura_portuaria
  colnames(InfraPortuaria) <- c("Region", "Year", "InfraPortuaria1")
  InfraPortuaria <- dcast(data=InfraPortuaria, Region ~ Year )
  filename <- paste("OutputData/RandomForest/InfraPortuariaImputado",".csv", sep="")
  write.csv(InfraPortuaria, file=filename)




  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_inversion_telecom
  colnames(InvTelecom) <- c("Region", "Year", "InvTelecom1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/RandomForest/InvTelecomImputado", ".csv", sep="")
  write.csv(InvTelecom, file=filename)



  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_tasa_depósito
  colnames(InvTelecom) <- c("Region", "Year", "TasaDeposito1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/RandomForest/TasaDepositoImputado", ".csv", sep="")
  write.csv(InvTelecom, file=filename)



  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_tasa_préstamo
  colnames(InvTelecom) <- c("Region", "Year", "TasaPrestamo1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/RandomForest/TasaPrestamomputado", ".csv", sep="")
  write.csv(InvTelecom, file=filename)



  InvTelecom <- IMP.dat$Region
  InvTelecom <- as.data.frame(InvTelecom)
  InvTelecom$Year <- IMP.dat$Year
  InvTelecom$InvTelecom1 <- IMP.dat$Precursores_vuelos
  colnames(InvTelecom) <- c("Region", "Year", "Vuelos1")
  InvTelecom <- dcast(data=InvTelecom, Region ~ Year )
  filename <- paste("OutputData/RandomForest/VuelosImomputado", ".csv", sep="")
  write.csv(InvTelecom, file=filename)

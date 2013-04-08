## Use Random Forest missing value imputation method for Derecho subvariables
set.seed(085)
Data <- rfImpute(Region ~ ., Data)
set.seed(265)
InnovacionRfImpute.X <- randomForest(Region ~ ., Data)
print(InnovacionRfImpute.X)


## Reshape data export 

  CoeficienteInvención <- Data$Region
  CoeficienteInvención <- as.data.frame(CoeficienteInvención)
  CoeficienteInvención$Year <- Data$Year
  CoeficienteInvención$CoeficienteInvención1 <- Data$Innovación_coeficiente_invención
  colnames(CoeficienteInvención) <- c("Region", "Year", "CoeficienteInvención1")
  CoeficienteInvención <- dcast(data=CoeficienteInvención, Region ~ Year )
  filename <- paste("OutputData/RandomForest/CoeficienteInvencionImputado",".csv", sep="")
  write.csv(CoeficienteInvención, file=filename)



  GastoInvestigación <- Data$Region
  GastoInvestigación <- as.data.frame(GastoInvestigación)
  GastoInvestigación$Year <- Data$Year
  GastoInvestigación$GastoInvestigación1 <- Data$Innovación_gasto_investigación
  colnames(GastoInvestigación) <- c("Region", "Year", "GastoInvestigación1")
  GastoInvestigación <- dcast(data=GastoInvestigación, Region ~ Year )
  filename <- paste("OutputData/RandomForest/GastoInvestigaciónImputado", ".csv", sep="")
  write.csv(GastoInvestigación, file=filename)
}

 
  GastoInvestigación <- Data$Region
  GastoInvestigación <- as.data.frame(GastoInvestigación)
  GastoInvestigación$Year <- Data$Year
  GastoInvestigación$GastoInvestigación1 <- Data$Innovación_gasto_investigación
  colnames(GastoInvestigación) <- c("Region", "Year", "GastoInvestigación1")
  GastoInvestigación <- dcast(data=GastoInvestigación, Region ~ Year )
  filename <- paste("OutputData/RandomForest/GastoInvestigaciónImputado", ".csv", sep="")
  write.csv(GastoInvestigación, file=filename)




  IngresosRegalias <- Data$Region
  IngresosRegalias <- as.data.frame(IngresosRegalias)
  IngresosRegalias$Year <- Data$Year
  IngresosRegalias$IngresosRegalias1 <- Data$Innovación_ingresos_regalías
  colnames(IngresosRegalias) <- c("Region", "Year", "IngresosRegalias1")
  IngresosRegalias <- dcast(data=IngresosRegalias, Region ~ Year )
  filename <- paste("OutputData/RandomForest/IngresosRegaliasImputado", ".csv", sep="")
  write.csv(IngresosRegalias, file=filename)



  InnovacionInvestigadores <- Data$Region
  InnovacionInvestigadores <- as.data.frame(InnovacionInvestigadores)
  InnovacionInvestigadores$Year <- Data$Year
  InnovacionInvestigadores$InnovacionInvestigadores1 <- Data$Innovación_investigadores
  colnames(InnovacionInvestigadores) <- c("Region", "Year", "InnovacionInvestigadores1")
  InnovacionInvestigadores <- dcast(data=InnovacionInvestigadores, Region ~ Year )
  filename <- paste("OutputData/RandomForest/InnovacionInvestigadoresImputado",".csv", sep="")
  write.csv(InnovacionInvestigadores, file=filename)



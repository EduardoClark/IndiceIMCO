## Use Random Forest missing value imputation method for Derecho subvariables
set.seed(085)
Data <- rfImpute(Region ~ ., Data)
set.seed(265)
MedioAmbienteRfImpute.X <- randomForest(Region ~ ., Data)
print(MedioAmbienteRfImpute.X)

## Reshape data export 

  
  AguaAgricultura <- Data$Region
  AguaAgricultura <- as.data.frame(AguaAgricultura)
  AguaAgricultura$Year <- Data$Year
  AguaAgricultura$CoeficienteInvención1 <- Data$MA_consumo_agua_agricultura
  colnames(AguaAgricultura) <- c("Region", "Year", "AguaAgricultura1")
  AguaAgricultura <- dcast(data=AguaAgricultura, Region ~ Year )
  filename <- paste("OutputData/RandomForest/AguaAgriculturaImputado", ".csv", sep="")
  write.csv(AguaAgricultura, file=filename)

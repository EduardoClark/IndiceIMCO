## Use Random Forest missing value imputation method for Derecho subvariables
set.seed(085)
GobiernoRfImpute <- rfImpute(Region ~ ., Data)
set.seed(265)
GobiernoRfImpute.X <- randomForest(Region ~ ., GobiernoRfImpute)

## Reshape data export 
  ImpuestoIngreso <- GobiernoRfImpute$Region
  ImpuestoIngreso <- as.data.frame(ImpuestoIngreso)
  ImpuestoIngreso$Year <- GobiernoRfImpute$Year
  ImpuestoIngreso$ImpuestoIngreso1 <- GobiernoRfImpute$Gobierno_impuesto_sobre_ingreso
  colnames(ImpuestoIngreso) <- c("Region", "Year", "ImpuestoIngreso1")
  ImpuestoIngreso <- dcast(data=ImpuestoIngreso, Region ~ Year )
  filename <- paste("OutputData/RandomForest/ImpuestoIngresoImputado",".csv", sep="")
  write.csv(ImpuestoIngreso, file=filename)
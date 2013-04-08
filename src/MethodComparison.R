### Compare the differences between Multiple Imputation
### and Random Forest missing value calculation

### Agua en la agricultura
AguaMI <- read.csv("OutputData/ImputacionMultiple/AguaAgricultura/AguaAgriculturaImputado1.csv")
AguaMIb <- read.csv("OutputData/ImputacionMultiple/AguaAgricultura/AguaAgriculturaImputado2.csv")
AguaMIc <- read.csv("OutputData/ImputacionMultiple/AguaAgricultura/AguaAgriculturaImputado3.csv")
AguaRF <- read.csv("OutputData/RandomForest/AguaAgriculturaImputado.csv")
AguaMI[1] <- NULL
AguaMIc[1] <- NULL
AguaMIb[1] <- NULL
AguaRF[1] <- NULL

## Create Difference Matrix
AguaDifference <- AguaMI
for (i in 2:4){  
  AguaDifference[i] <- AguaMI[i] - AguaRF[i]
}
remove(i)
AguaMI <- melt(data=AguaMI, id="Region")
AguaMIb <- melt(data=AguaMIb, id="Region")
AguaMIc <- melt(data=AguaMIc, id="Region")
AguaRF <- melt(data=AguaRF, id="Region")
AguaDifference <- melt(data=AguaDifference, id="Region")
AguaDifference <- merge(AguaDifference, AguaRF, by=c("Region", "variable"))
AguaDifference <- merge(AguaDifference, AguaMI, by=c("Region", "variable"))
AguaDifference <- merge(AguaDifference, AguaMIb, by=c("Region", "variable"))
AguaDifference <- merge(AguaDifference, AguaMIc, by=c("Region", "variable"))
AguaDifference <- subset(x=AguaDifference, value.x != 0)
colnames(x=AguaDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(AguaDifference, "OutputData/Comparison/AguaAgricultura.csv")
remove(AguaMI, AguaRF, AguaMIb, AguaMIc)

##############################
### Coeficiente de Invención
MI <- read.csv("OutputData/ImputacionMultiple/CoeficienteInvencion/CoeficienteInvencionImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/CoeficienteInvencion/CoeficienteInvencionImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/CoeficienteInvencion/CoeficienteInvencionImputado3.csv")
RF <- read.csv("OutputData/RandomForest/CoeficienteInvencionImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/CoefInvencionDiff.csv")
remove(MI, RF, MIb, MIc)

################################################
### EconomiaInformal
MI <- read.csv("OutputData/ImputacionMultiple/EconomiaInformal/EconomiaInformalImputada.csv")
RF <- read.csv("OutputData/RandomForest/EconomiaInformalImputada.csv")
MI[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "MI", "RF")
write.csv(CoefInvencionDifference, "OutputData/Comparison/EconomiaInformalDiff.csv")
remove(MI, RF)

################################################
### Gasto Investigacion
MI <- read.csv("OutputData/ImputacionMultiple/GastoInvestigacion/GastoInvestigacionImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/GastoInvestigacion/GastoInvestigacionImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/GastoInvestigacion/GastoInvestigacionImputado3.csv")
RF <- read.csv("OutputData/RandomForest/GastoInvestigacionImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/GastoInvestigacionDiff.csv")
remove(MI, RF, MIb, MIc)

################################################
### Impuesto Ingreso
MI <- read.csv("OutputData/ImputacionMultiple/ImpuestoIngreso/ImpuestoIngresoImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/ImpuestoIngreso/ImpuestoIngresoImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/ImpuestoIngreso/ImpuestoIngresoImputado3.csv")
RF <- read.csv("OutputData/RandomForest/ImpuestoIngresoImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:11){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/ImpuestoIngresoDiff.csv")
remove(MI, RF, MIb, MIc)

################################################
### InfraPortuaria
MI <- read.csv("OutputData/ImputacionMultiple/InfraPortuaria/InfraPortuariaImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/InfraPortuaria/InfraPortuariaImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/InfraPortuaria/InfraPortuariaImputado3.csv")
RF <- read.csv("OutputData/RandomForest/InfraPortuariaImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:11){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/InfraPortuariaDiff.csv")
remove(MI, RF, MIb, MIc)


################################################
### IngresosRegalias
MI <- read.csv("OutputData/ImputacionMultiple/IngresoRegalias/IngresosRegaliasImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/IngresoRegalias/IngresosRegaliasImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/IngresoRegalias/IngresosRegaliasImputado3.csv")
RF <- read.csv("OutputData/RandomForest/IngresosRegaliasImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/IngresosRegaliasDiff.csv")
remove(MI, RF, MIb, MIc)


################################################
### Investigadores
MI <- read.csv("OutputData/ImputacionMultiple/Investigadores/InnovacionInvestigadoresImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/Investigadores/InnovacionInvestigadoresImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/Investigadores/InnovacionInvestigadoresImputado3.csv")
RF <- read.csv("OutputData/RandomForest/IngresosRegaliasImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/InvestigadoresDiff.csv")
remove(MI, RF, MIb, MIc)


################################################
### InvTelecom
MI <- read.csv("OutputData/ImputacionMultiple/InvTelecom/InvTelecomImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/InvTelecom/InvTelecomImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/InvTelecom/InvTelecomImputado3.csv")
RF <- read.csv("OutputData/RandomForest/IngresosRegaliasImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/InvTelecomDiff.csv")
remove(MI, RF, MIb, MIc)

################################################
### Tasa Deposito
MI <- read.csv("OutputData/ImputacionMultiple/TasaDeposito/TasaDepositoImputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/TasaDeposito/TasaDepositoImputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/TasaDeposito/TasaDepositoImputado3.csv")
RF <- read.csv("OutputData/RandomForest/IngresosRegaliasImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/TasaDepositoDiff.csv")
remove(MI, RF, MIb, MIc)


################################################
### Tasa Prestamo
MI <- read.csv("OutputData/ImputacionMultiple/TasaPrestamo/TasaPrestamomputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/TasaPrestamo/TasaPrestamomputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/TasaPrestamo/TasaPrestamomputado3.csv")
RF <- read.csv("OutputData/RandomForest/IngresosRegaliasImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/TasaPrestamoDiff.csv")
remove(MI, RF, MIb, MIc)

################################################
### Vuelos
MI <- read.csv("OutputData/ImputacionMultiple/Vuelos/VuelosImomputado1.csv")
MIb <- read.csv("OutputData/ImputacionMultiple/Vuelos/VuelosImomputado2.csv")
MIc <- read.csv("OutputData/ImputacionMultiple/Vuelos/VuelosImomputado3.csv")
RF <- read.csv("OutputData/RandomForest/IngresosRegaliasImputado.csv")
MI[1] <- NULL
MIb[1] <- NULL
MIc[1] <- NULL
RF[1] <- NULL

## Create Difference Matrix
CoefInvencionDifference <- MI
for (i in 2:12){  
  CoefInvencionDifference[i] <- MI[i] - RF[i]
}
remove(i)
MI <- melt(data=MI, id="Region")
MIb <- melt(data=MIb, id="Region")
MIc <- melt(data=MIc, id="Region")
RF <- melt(data=RF, id="Region")
CoefInvencionDifference <- melt(data=CoefInvencionDifference, id="Region")
CoefInvencionDifference <- merge(CoefInvencionDifference, RF, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MI, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIb, by=c("Region", "variable"))
CoefInvencionDifference <- merge(CoefInvencionDifference, MIc, by=c("Region", "variable"))
CoefInvencionDifference <- subset(x=CoefInvencionDifference, value.x != 0)
colnames(x=CoefInvencionDifference) <- c("Region", "Año", "MI-RF", "RF", "MIa", "MIb", "MIc")
write.csv(CoefInvencionDifference, "OutputData/Comparison/VuelosDiff.csv")
remove(MI, RF, MIb, MIc)


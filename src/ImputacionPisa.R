## Obtains Missing Value Info
MvInfo <- mi.info(Data)
print(MvInfo)
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data)
jpeg('graphs/PisaImputationPlot.jpg') ## Post IM plots
plot(IMP) 
dev.off()

IMP.dat.all <- mi.completed(IMP)

## Reshape data export (Export 3 simulations to .csv)
for(i in 1:3){
  IMP.dat <- mi.data.frame(IMP, m = i)
  InfraPortuaria <- IMP.dat$Region
  InfraPortuaria <- as.data.frame(InfraPortuaria)
  InfraPortuaria$Year <- IMP.dat$Year
  InfraPortuaria$CoeficienteInvención1 <- IMP.dat$PISA
  colnames(InfraPortuaria) <- c("Region", "Year", "InfraPortuaria1")
  InfraPortuaria <- dcast(data=InfraPortuaria, Region ~ Year )
  filename <- paste("OutputData/PisaImputado", i, ".csv", sep="")
  write.csv(InfraPortuaria, file=filename)
}




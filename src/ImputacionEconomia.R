## Visually search for missing data patterns within the data base
jpeg('graphs/EconomiaMissingValuePlot.jpg')
DerechoMissing <- missing.pattern.plot(Data, gray.scale = FALSE)
dev.off()
## Obtains Missing Value Info
mi.info(Data)
print(MvInfo)
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data)
jpeg('graphs/DerechoImputationPlot.jpg') ## Post IM plots
plot(IMP) 
dev.off()


## Reshape data export
EconomiaInformal <- IMP.dat$Region
EconomiaInformal <- as.data.frame(EconomiaInformal)
EconomiaInformal$Year <- IMP.dat$Year
EconomiaInformal$Derecho_índice_economía_informal <- IMP.dat$Derecho_índice_economía_informal
colnames(EconomiaInformal) <- c("Region", "Year", "EconomiaInformal1")
EconomiaInformal <- dcast(data=EconomiaInformal, Region ~ Year )
write.csv(EconomiaInformal, file="OutputData/EconomiaInformalImputada.csv")

## Reshape data export
EconomiaInformal <- IMP.dat$Region
EconomiaInformal <- as.data.frame(EconomiaInformal)
EconomiaInformal$Year <- IMP.dat$Year
EconomiaInformal$Derecho_índice_economía_informal <- IMP.dat$Economía_pasivos
colnames(EconomiaInformal) <- c("Region", "Year", "Economiapasivos1")
EconomiaInformal <- dcast(data=EconomiaInformal, Region ~ Year )
write.csv(EconomiaInformal, file="OutputData/EconomiaPasivosImputada.csv")
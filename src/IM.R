## Visually search for missing data patterns within the data base
jpeg('graphs/DerechoMissingValuePlot.jpg')
DerechoMissing <- missing.pattern.plot(Data, gray.scale = FALSE)
dev.off()
## Obtains Missing Value Info
MvInfo <- mi.info(Data)
print(MvInfo)
##Apply multiple imputation method (with Preprocessing)
IMP <- mi(Data)
jpeg('graphs/DerechoImputationPlot.jpg') ## Post IM plots
message("Press enter to continue with script")
plot(IMP) 
dev.off()

## Sensitivity Analisis




## Use Random Forest missing value imputation method for Derecho subvariables
set.seed(111)
DerechoRfImpute <- rfImpute(Region ~ ., Data)
set.seed(333)
DerechoRfImpute.X <- randomForest(Region ~ ., DerechoRfImpute)


## Reshape & export data
EconomiaInformal <- DerechoRfImpute$Region
EconomiaInformal <- as.data.frame(EconomiaInformal)
EconomiaInformal$Year <- DerechoRfImpute$Year
EconomiaInformal$Derecho_índice_economía_informal <- DerechoRfImpute$Derecho_índice_economía_informal
colnames(EconomiaInformal) <- c("Region", "Year", "EconomiaInformal1")
EconomiaInformal <- dcast(data=EconomiaInformal, Region ~ Year )
write.csv(EconomiaInformal, file="OutputData/RandomForest/EconomiaInformalImputada.csv")


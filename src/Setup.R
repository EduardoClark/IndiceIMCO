################################################
### Author: Eduardo Clark
### Project: IMCO variable multiple imputation
### Date: April 04, 2013
################################################

##### Set Up 
## Reshape Data
#Load Data
reader <- "data/IndInt/Indicadores/Economia/" ## Name directory for db extraction
Indicadores <- c(list.files(reader))
#Compile basic dataframe
Name <- paste(reader, Indicadores[1], sep="") 
Data <- read.delim(Name) ## Load first indicator and db
Data <- melt(data=Data, id="Region")
colnames(Data) <- c("Region", "Year", "ActivosFinancieros")
IndicatorNames <- strsplit(Indicadores, ".csv")
#Loop for remaining variables
for(i in 2:13){
  Name <- paste(reader, Indicadores[i], sep="")
  Transitory <- read.delim(Name)
  Transitory1 <- read.csv(Name)
  Transitory <- tryCatch(melt(data=Transitory, id="Region"), error = function(e) Transitory1 )
  tryCatch(Transitory <- melt(data=Transitory, id="Region"), warning = function(e) NULL)
  colnames(Transitory) <- c("Region", "Year", IndicatorNames[i])
  Data <- merge(Data, Transitory)
  print(i)
  }

remove(Indicadores, Name, i , reader, Transitory1, Transitory, IndicatorNames) ## Remove reduntant objects

Data$Year <- substr(Data$Year, 2, 5) ## Correct Year Column
Data$Year <- as.numeric(Data$Year)



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
Data <- read.csv(Name, encoding="Latin-1") ## Load first indicator and db
Data <- melt(data=Data, id="Region")
IndicatorNames <- strsplit(Indicadores, ".csv")
colnames(Data) <- c("Region", "Year", Indicadores[1])
#Loop for remaining variables
for(i in 2:15){
  Name <- paste(reader, Indicadores[3], sep="")
  Transitory <- read.delim(Name, encoding="UTF-8")
  Transitory1 <- read.csv(Name)
  Transitory <- tryCatch(melt(data=Transitory, id="Region"), error = function(e) Transitory1 )
  
  Transitory$value <- as.numeric(gsub(pattern=",", replacement="", x=Transitory$value))
  colnames(Transitory) <- c("Region", "Year", IndicatorNames[i])  
  Data <- merge(Data, Transitory)
  print(i)
  print(nrow(Data))
}
remove(Indicadores, Name, i , reader, Transitory1, Transitory, IndicatorNames) ## Remove reduntant objects

Data$Year <- substr(Data$Year, 2, 5) ## Correct Year Column
Data$Year <- as.numeric(Data$Year)

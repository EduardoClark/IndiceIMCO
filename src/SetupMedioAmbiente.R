################################################
### Author: Eduardo Clark
### Project: IMCO variable multiple imputation
### Date: April 04, 2013
################################################

##### Set Up 
## Reshape Data
#Load Data
reader <- "data/IndInt/Indicadores/Medio ambiente/" ## Name directory for db extraction
Indicadores <- c(list.files(reader))
#Compile basic dataframe
Name <- paste(reader, Indicadores[1], sep="") 
Data <- read.csv(Name, encoding="Latin-1") ## Load first indicator and db
Data <- melt(data=Data, id="Region")
IndicatorNames <- strsplit(Indicadores, ".csv")
colnames(Data) <- c("Region", "Year", Indicadores[1])
Data$General_FBCF_constante.csv <- as.numeric(gsub(pattern=",", replacement="", x=Data$General_FBCF_constante.csv))

#Loop for remaining variables
for(i in 2:14){
  Name <- paste(reader, Indicadores[i], sep="")
  Transitory <- read.delim(Name, encoding="UTF-8")
  Transitory1 <- read.csv(Name)
  Transitory <- tryCatch(melt(data=Transitory, id="Region"), error = function(e) Transitory1 )  
  tryCatch(Transitory <- melt(data=Transitory, id="Region"), warning = function(e) NULL)
  Transitory$value <- as.numeric(gsub(pattern=",", replacement="", x=Transitory$value))
  colnames(Transitory) <- c("Region", "Year", IndicatorNames[i])  
  Data <- merge(Data, Transitory)
  print(i)
  print(nrow(Data))
}
remove(Indicadores, Name, i , reader, Transitory1, Transitory, IndicatorNames) ## Remove reduntant objects

Data$Year <- substr(Data$Year, 2, 5) ## Correct Year Column
Data$Year <- as.numeric(Data$Year)

## We need to subset years 2001,2005 and 2010
YearMerger <- data.frame(Year=c(2001, 2005, 2010), Code=c(1,1,1))
Data <- merge(Data, YearMerger)
Data$Code <- NULL
remove(YearMerger)


##### Extract Credit Ratings
require(XML)
require(plyr)
url <- "http://en.wikipedia.org/wiki/List_of_countries_by_credit_rating"
page.doc <- htmlParse(url)
page.tabs <- readHTMLTable(page.doc)

##S&P
SP <- page.tabs[2]
SP <- ldply(SP)
SP$.id <- NULL
SP$V5 <- NULL
SP <- subset(SP, V4 != "NA")
SP <- subset(SP, V4 != "Date")
colnames(SP) <- c("Region", "Rating", "Outlook", "Fecha")
SP$Rating <- substr(SP$Rating, 4, 10)


##Fitch
Fitch <- page.tabs[5]
Fitch <- ldply(Fitch)
Fitch$.id <- NULL
Fitch$V5. <- NULL
Fitch <- subset(Fitch, V4 != "NA")
Fitch <- subset(Fitch, V4 != "Date")
colnames(Fitch) <- c("Region", "Rating", "Outlook", "Fecha")
Fitch$Rating <- substr(Fitch$Rating, 3, 10)
write.csv(Fitch, file="CreditRatings/Fitch.csv")

##Moodys
Moody <- page.tabs[8]
Moody <- ldply(Moody)
Moody$.id <- NULL
colnames(Moody) <- c("Region", "Rating", "Outlook", "Fecha")
Moody$Rating <- substr(Moody$Rating, 3, 10)
write.csv(SP, file="CreditRatings/Moody.csv")


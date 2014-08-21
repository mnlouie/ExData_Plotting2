plot1 <- function(){


## This first line will likely take a few seconds. Be patient!
## Make sure the two following files are in your working directory. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#head(NEI, 3)
#head(SCC, 3)

#Question 1:
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.

years <- c("1999","2002", "2005","2008")
totals <- vector() #initialize data
for (i in years) {
  totals[i] <- sum(NEI$Emissions[which(NEI$year ==i)], na.rm=TRUE)
}

#plotting for Q1
png('plot1.png', width=480, height=480, units='px',pointsize=12)
barplot(totals, ,xlab="Year", ylab="Total PM2.5 Emission (Tons)", main="PM2.5 Emission in the US from 1999 to 2008")
dev.off()
}
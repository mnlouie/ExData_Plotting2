plot2 <- function(){
  
  
  ## This first line will likely take a few seconds. Be patient!
  ## Make sure the two following files are in your working directory. 
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
#  head(NEI, 3)
#  head(SCC, 3)
  
  
  
  #Question 2:
  #Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) 
  #from 1999 to 2008? Use the base plotting system to make a plot answering this question. 
  
  total.baltimore <- vector() #initalizing data for baltimore
  for (i in years) {
    total.baltimore[i] <- sum(NEI$Emissions[which(NEI$year == i & NEI$fips == "24510")], na.rm=TRUE)  
  }
  
  #plotting for Q2
  png('plot2.png', width=480, height=480, units='px',pointsize=12)
  barplot(total.baltimore, xlab="Year", ylab="Total PM2.5 Emission (Tons)", main = "PM2.5 Emission in Baltimore from 1999 to 2008")
  dev.off()
  
}
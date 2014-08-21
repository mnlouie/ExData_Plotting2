plot5 <- function(x,y){
  
  
  
  ## This first line will likely take a few seconds. Be patient!
  ## Make sure the two following files are in your working directory. 
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  #head(NEI, 3)
  #head(SCC, 3)
 
  
  
  # Find all motor vehicle sources
  motorVehicle <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))
  motorVehicleCodes <- SCC[SCC$EI.Sector %in% motorVehicle, ]["SCC"]

  #Subset emissions from motor vehicle in Baltimore
  emissionFromVehicle <- NEI[NEI$SCC %in% motorVehicleCodes$SCC & NEI$fips=="24510", ]
  
  #calculate emissions for each year
  totalEmissionbyYear <- tapply(emissionFromVehicle$Emissions, emissionFromVehicle$year, sum)
  
  #plotting
  png('plot5.png', width=480, height=480, units='px',pointsize=12)
  barplot(totalEmissionbyYear, ylab="Motor Vehicle Related PM2.5 Emission (tons)", xlab="Years", main= "Motor Vehicle Related PM2.5 Emission in Baltimore")
  #points(totalEmissionbyYear, x = rownames(totalEmissionbyYear), col="red")
  #lines(totalEmissionbyYear, x = rownames(totalEmissionbyYear), col="blue")
  #axis(2)
  axis(side = 1, at = seq(1999, 2008, by = 3))
  dev.off()
}
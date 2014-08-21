plot4 <- function(x,y){
  
  
  
  ## This first line will likely take a few seconds. Be patient!
  ## Make sure the two following files are in your working directory. 
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  #head(NEI, 3)
  #head(SCC, 3)
  
  
  #Question 4:
  #Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
  d.tmp1 <- NEI[NEI$SCC %in% SCC[grep("Coal", SCC$EI.Sector),1], ]
  d.tmp2 <- SCC[, c(1,4)]
  data.coal <- merge(d.tmp1, d.tmp2, by.x = "SCC", by.y = "SCC")[, c(4, 6, 7)]
  emissioncoal <- aggregate(Emissions ~ EI.Sector * year, data = data.coal, FUN=sum)
  
  
  # plotting
  require("ggplot2")
  g4 <- ggplot(emissioncoal, aes(x = year, y= Emissions))
  g4 + geom_point(aes(color = EI.Sector), size = 10, alpha = 1) + scale_x_continuous(breaks = seq(1999, 2008, 3)) + labs(x="Year", y="Total Coal Related PM2.5 Emission (Tons)", title="Total Coal Related PM2.5 Emission across US (1999 - 2008)") + scale_colour_discrete(name = "Source of Coal Emission", labels=c("Comm/Institutional", "Electric Generation", "Industrial Boilers, ICEs"))
  #facet_grid(. ~ EI.Sector) +
  ggsave(file="plot4.png")
  
  
  
  
}
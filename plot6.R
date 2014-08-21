plot6 <- function(x,y){
  
  
  
  ## This first line will likely take a few seconds. Be patient!
  ## Make sure the two following files are in your working directory. 
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  #head(NEI, 3)
  #head(SCC, 3)
 
  
  #Question 6:
  #Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
  #vehicle sources in Los Angeles County, California (fips == "06037").
  #Which city has seen greater changes over time in motor vehicle emissions?
  
  
  
  data <- rbind(d.baltim <- NEI[which(NEI$fips == "24510"), ], d.lac <- NEI[which(NEI$fips == "06037"), ])
  data$fips[which(data$fips == "24510")] <- "Baltimore"
  data$fips[which(data$fips == "06037")] <- "Los Angeles"
  names(data) [1] <- "Cities"
  names(data) [6] <- "Year"
  #plotting:
  require("ggplot2")
  
  g6 <- ggplot(data, aes(x=Year, y=Emissions, fill=Cities, color=Cities))
  g6 + geom_bar(stat="identity", position = position_dodge()) + scale_x_continuous(breaks= seq(1999,2008,3)) +labs(y = expression("Motor Vehicle Related PM2.5 Emissions (tons)")) + labs(title=expression("Motor Vehicle Related PM2.5 Emissions (1999 - 2008)"))+
  theme(axis.text = element_text(size = 8), axis.title = element_text(size = 8), 
        panel.margin = unit(1, "lines"), plot.title = element_text(vjust = 2, size=8), 
        legend.title = element_text(size = 8))
  ggsave(file='plot6.png', width=4, height=4, dpi=100)
  
}
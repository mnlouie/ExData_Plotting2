plot3 <- function(){
  library("grid")
  
  ## This first line will likely take a few seconds. Be patient!
  ## Make sure the two following files are in your working directory. 
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  #head(NEI, 3)
  #head(SCC, 3)
  
  
  
#Question 3:
  #Of the four types of sources indicated by the type 
  #(point, nonpoint, onroad, nonroad) variable, 
  #which of these four sources have seen decreases in 
  #emissions from 1999–2008 for Baltimore City? 
  #Which have seen increases in emissions from 
  #1999–2008? Use the ggplot2 plotting system to make 
  #a plot answer this question.
  
  data.baltimore <- NEI[which(NEI$fips == "24510") ,] #initalziing data
  emissionbytypeANDyear <- aggregate(Emissions ~ type * year, data = data.baltimore, FUN=sum)


#plotting
  require("ggplot2")

  g3 <- ggplot(emissionbytypeANDyear, aes(year, Emissions), color=type)
  g3 + geom_point(aes(color=type), size=3, alpha=1) + facet_grid(.~ type) + geom_smooth(size =1, color="black", linetype = 1, method = "lm", se = FALSE) + scale_x_continuous(breaks = seq(1999, 2008, 3)) + labs(x="Years", y="Total PM2.5 Emission (tons)", title="Total PM2.5 Emissions in Baltimore (1999 - 2008)") + 
  theme(axis.text = element_text(size = 6), axis.title = element_text(size = 8), 
        panel.margin = unit(1, "lines"), plot.title = element_text(vjust = 2), 
        legend.title = element_text(size = 8)) + scale_colour_discrete(name = "Type")
  ggsave(file="plot3.png",width=8, height=4, dpi=100)


}
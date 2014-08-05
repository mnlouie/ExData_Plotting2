#working space to develop codes in 

#Question 1:
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.

> sum(NEI$Emissions[NEI$year == 1999])
[1] 7332967
> values <-c(73322967)
> year <- c(1999)
> sum(NEI$Emissions[NEI$year == 2002])
[1] 5635780
> values <-c(values,5635780)
> year <-c(year,2002)
> sum(NEI$Emissions[NEI$year == 2005])
[1] 5454703
> year <-c(year,2005)
> values <-c(values,5454703)
> sum(NEI$Emissions[NEI$year == 2008])
[1] 3464206
> year <-c(year,2008)
> values <-c(values,3464206)
plot(year,values, type='b',xlab="Year", ylab="Total Emission from PM2.5", xaxt='n',yant='n', log='y', ylim=c(1e0,1e9))
axis(1,year,year)


test <- c(1:20)^2 * 1e9
test <- c(1:9)
test <- 10^test
axis(2,test,test)



#Question 2:
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question. 

balt <- subset(NEI, NEI$fips == 24510)
balt1999 <- sum(balt$Emissions[balt$year == 1999])
balt2002 <- sum(balt$Emissions[balt$year == 2002])
balt2005 <- sum(balt$Emissions[balt$year == 2005])
balt2008 <- sum(balt$Emissions[balt$year == 2008])
baltsum <- c(balt1999,balt2002,balt2005,balt2008)
baltyears <- c(1999,2002,2005,2008)
plot(baltyears,baltsum,type='b')



#Question 3:
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#Question 4:
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#Question 5:
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#Question 6:
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#vehicle sources in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?

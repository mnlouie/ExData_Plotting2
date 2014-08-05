dataNEI <- function(){
  
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("../data/summarySCC_PM25.rds")
  
  return(NEI)
}

dataSCC <- function(){
  SCC <- readRDS("../data/Source_Classification_Code.rds")
  return(SCC)
}
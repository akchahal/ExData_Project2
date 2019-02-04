setwd('g:/coursera/exdata2')

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

## 2. Have total emissions from PM2.5 decreased in the Baltimore City,
##Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") 
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.

subsetData <- NEI[NEI$fips=="24510", ]

emissionsByYear <- aggregate(Emissions ~ year, subsetData, sum)

png('plot2.png')
barplot(
  height=emissionsByYear$Emissions/1000, 
  names.arg=emissionsByYear$year, 
  xlab="years", 
  ylab=expression('Total Emissions (kilotons)'),
  main=expression('Total PM'[2.5]*' Emissions in City of Baltimore 1999-2008'))
dev.off()
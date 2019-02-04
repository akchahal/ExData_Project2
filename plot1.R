setwd('g:/coursera/exdata2')

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#1.Aggregate emissions by years (1999,2002,2005,2008)
emissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

#Draw a barplot
png('plot1.png')
barplot(height=emissionsByYear$Emissions/1000, names.arg=emissionsByYear$year, xlab="years", ylab=expression('Total Emissions (kilotons)'),main=expression('Total PM'[2.5]*' emissions in US from 1999 to 2008'))
dev.off()
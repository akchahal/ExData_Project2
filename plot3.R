setwd('g:/coursera/exdata2')

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
library(ggplot2)

##3. Of the four types of sources indicated by the \color{red}{\verb|type|}
##type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
##Which have seen increases in emissions from 1999-2008?
##Use the ggplot2 plotting system to make a plot answer this question.

BaltimoreData <- NEI[NEI$fips=="24510", ]

emissionsByYear <- aggregate(Emissions ~ year + type, BaltimoreData, sum)

png("plot3.png")
g <- ggplot(emissionsByYear, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total Emissions')) +
  ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(g)
dev.off()
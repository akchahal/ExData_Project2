setwd('g:/coursera/exdata2')

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

##6. Compare emissions from motor vehicle sources in Baltimore City
##with emissions from motor vehicle sources in Los Angeles County, California 
##(\color{red}{\verb|fips == "06037"|}fips=="06037"). 
##Which city has seen greater changes over time in motor vehicle emissions?

#24510 is Baltimore, 06037 is LA CA & type On-Road
subsetData <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]


EmissionsByYearAndFips <- aggregate(Emissions ~ year + fips, subsetData, sum)

## for titles in graph
EmissionsByYearAndFips$fips[EmissionsByYearAndFips$fips=="24510"] <- "Baltimore"
EmissionsByYearAndFips$fips[EmissionsByYearAndFips$fips=="06037"] <- "Los Angeles" 

png("plot6.png", width=800, height=480)
g <- ggplot(EmissionsByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Emissions from motor vehicle- Baltimore City vs Los Angeles from 1999-2008')
print(g)
dev.off()
setwd('g:/coursera/exdata2')

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
library(ggplot2)

##4. Across the United States,
##how have emissions from coal combustion-related sources changed from 1999-2008?


#Pick up the data related to coal combustion-related sources
Coal <- SCC$SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE)]
CoalData <-NEI[NEI$SCC %in% Coal,]

emissionsByYear <- aggregate(Emissions ~ year, CoalData, sum)

png("plot4.png")
barplot(emissionsByYear$Emission/1000,
        emissionsByYear$year,
        names.arg=emissionsByYear$year,
        xlab="Year",
        ylab="Total PM2.5 Emission (kilotons)",
        main = "Emissions from coal-combustion related sources from 1999-2008")
dev.off()
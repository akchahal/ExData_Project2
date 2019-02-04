setwd('g:/coursera/exdata2')

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

##5.How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Get the data related to motor vehicle in Baltimore city
BaltimoreData<-subset(NEI,NEI$fips=="24510" & NEI$type=="ON-ROAD")
emissionsByYear <- aggregate(Emissions ~ year, BaltimoreData, sum)

#Plot 5
png("plot5.png", width =600, height =500)
barplot(emissionsByYear$Emission,
        emissionsByYear$year,
        names.arg=emissionsByYear$year,
        xlab="Year",
        ylab="Total PM2.5 Emission(tons)",
        main="Emissions from motor vehicle sources from 1999-2008 in Baltimore City")
dev.off()
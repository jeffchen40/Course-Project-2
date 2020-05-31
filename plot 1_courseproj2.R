NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

tot.emissions <- with(NEI, aggregate(Emissions, by = list(year),sum))
png('Plot1_courseproj2.png',width = 480,height = 480)

plot(tot.emissions, type = 'o', main = 'Total Emissions (all sources) 1999-2012', 
     xlab = 'Year', ylab = 'PM2.5 Emissions', pch=19, col='darkblue')

dev.off()

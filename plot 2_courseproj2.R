NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
emissions_baltimore <- filter(NEI, fips == '24510')
emissions_baltimore <- with(emissions_baltimore, aggregate(Emissions, by = list(year), sum))

plot(emissions_baltimore, type = 'o', main = 'Total Emissions Baltimore City',
     xlab = 'Year', ylab = 'Total PM2.5 Emissions', pch = 19)

dev.copy(png,file = 'plot2_courseproj2.png')
dev.off()

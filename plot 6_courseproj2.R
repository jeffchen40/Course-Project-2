NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.vehicles <- grepl('vehicle',SCC$SCC.Level.Two, ignore.case = TRUE)
SCC.vehicles <- SCC[SCC.vehicles,]$SCC
NEI.vehicles <- NEI[NEI$SCC %in% SCC.vehicles, ]
baltimore_veh <- NEI.vehicles[NEI.vehicles$fips == '24510', ]
baltimore_veh$city <- "Baltimore City"
la_veh <- NEI.vehicles[NEI.vehicles$fips == '06037', ]
la_veh$city <- "LA County"

both_veh_emission <- rbind(baltimore_veh,la_veh)

par(mfrow = c(1,1))
library(ggplot2)
ggp <- ggplot(both_veh_emission, aes(factor(year),Emissions,fill=city)) +
      geom_bar(aes(fill=year),stat = 'identity') +
      facet_grid(.~city) +
      labs(x = 'Year', y = 'Total PM2.5 Emissions') +
      ggtitle('Total Emissions by Motor Vehicles in Baltimore and LA,1999-2008')
plot(ggp)

dev.copy(png,file = 'plot6_courseproj2.png')
dev.off()

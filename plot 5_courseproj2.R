NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.vehicles <- grepl('vehicle',SCC$SCC.Level.Two, ignore.case = TRUE)
SCC.vehicles
SCC.vehicles <- SCC[SCC.vehicles,]$SCC
NEI.vehicles <- NEI[NEI$SCC %in% SCC.vehicles, ]
baltimore_veh <- NEI.vehicles[NEI.vehicles$fips == '24510', ]

library(ggplot2)
ggp <- ggplot(baltimore_veh, aes(factor(year), Emissions)) +
      geom_bar(stat = 'identity') + xlab('year') +
      theme_bw() +
      ylab('PM2.5 Emissions (10^5 tons') +
      ggtitle("Total Motor Vehicle Emissions in Baltimore City from 1999-2008")
plot(ggp)

dev.copy(png, file = 'plot5_courseproj2.png')
dev.off()

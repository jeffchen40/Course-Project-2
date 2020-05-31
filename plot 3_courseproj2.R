NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
emissions_baltimore <- filter(NEI, fips == '24510')

library(ggplot2)
ggp <- ggplot(emissions_baltimore, aes(factor(year),Emissions,fill=type)) +
      geom_bar(stat = 'identity') +
      theme_bw() + guides(fill = FALSE) +
      facet_grid(.~type, scales = 'free', space='free') +
      labs(x = 'year', y = 'Total PM2.5') +
      labs(title = expression('PM'[2.5]*'Emissions,Baltimore City 1998-2008'))
plot(ggp)

dev.copy(png,file = 'plot3_courseproj2.png')
dev.off()

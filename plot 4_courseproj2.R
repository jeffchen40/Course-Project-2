NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC)
sort(unique(NEI$SCC))
SCC.sub <- SCC[grepl('Coal',SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

?ggplot
ggp <- ggplot(NEI.sub, aes(factor(year), Emissions, fill = type)) +
      geom_bar(stat = 'identity') + xlab('year') +
      ylab('Coal-Related PM2.5 Emissions') +
      ggtitle("Total Coal-Related Emissions")
plot(ggp)

dev.copy(png,file='plot4_courseproj2.png')
dev.off()

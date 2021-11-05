#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of these four sources have 
#seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen
#increases in emissions from 1999-2008? Use the ggplot2 plotting system 
#to make a plot answer this question.

library(data.table)
library(dplyr)
library(ggplot2)
library(scales)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SubNEI <- subset(NEI, fips == "24510")
SubNEI <- group_by(SubNEI, type, year)
YearlyTotal <- summarize(SubNEI,TotalEmissions = sum(Emissions))

g <- ggplot(YearlyTotal, aes(x = factor(year), y = TotalEmissions, fill = type))
g + geom_bar(stat = "identity") + facet_grid(.~type) + labs(x = "year", y = "Total Tons of PM2.5 Emissions", title = "Total Tons of PM2.5 Emissions in Baltimore by type " )

dev.copy(png, file="Plot3.png", width=720, height=720)
dev.off()

#Answer: Everything saw a decrease other than type: point


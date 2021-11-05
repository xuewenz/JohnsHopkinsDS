#Compare emissions from motor vehicle sources in Baltimore City 
#with emissions from motor vehicle sources in Los Angeles County,
#California (\color{red}{\verb|fips == "06037"|}fips=="06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

library(data.table)
library(dplyr)
library(ggplot2)
library(scales)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Vehicle <- SCC[grep("Mobile.*Vehicles", SCC$EI.Sector),]
SCC_Vehicle_List <- unique(SCC_Vehicle$SCC)

SubNEI <- subset(NEI, SCC %in% SCC_Vehicle_List & (fips == "24510" | fips == "06037"))
SubNEI <- group_by(SubNEI, fips, year)

YearlyTotal <- summarize(SubNEI, TotalEmissions = sum(Emissions))

g <- ggplot(YearlyTotal, aes(x = factor(year), y = TotalEmissions))
g + geom_bar(stat = "identity") + facet_grid(.~fips)
+ labs(x = "year", y = "Total Tons of PM2.5 Emissions", title = "Total Tons of PM2.5 Emissions From Motor Vehicle Source in Baltimore City" )
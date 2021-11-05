#Across the United States, how have emissions from
#coal combustion-related sources changed from 1999-2008?

library(data.table)
library(dplyr)
library(ggplot2)
library(scales)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Coal <- SCC[grep("*Coal", SCC$EI.Sector),]
SCC_Coal <- unique(SCC_Coal$SCC)

SubNEI <- subset(NEI, SCC %in% SCC_Coal)
SubNEI <- group_by(SubNEI, year)
YearlyTotal <- summarize(SubNEI, TotalEmissions = sum(Emissions))

g <- ggplot(YearlyTotal, aes(x = factor(year), y = TotalEmissions))
g + geom_bar(stat = "identity")  + labs(x = "year", y = "Total Tons of PM2.5 Emissions", title = "Total Tons of PM2.5 Emissions From Coal Combustion-Related Source " )

dev.copy(png, file="Plot4.png", width=720, height=720)
dev.off()

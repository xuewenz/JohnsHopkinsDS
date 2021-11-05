#Have total emissions from PM2.5 decreased in the United States
#from 1999 to 2008? Using the base plotting system, make a plot
#showing the total PM2.5 emission from all sources for each of the 
#years 1999, 2002, 2005, and 2008.

library(data.table)
library(dplyr)
library(ggplot2)
library(scales)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SubNEI <- subset(NEI, year == 1999|2002|2005|2008)
SubNEI <- group_by(SubNEI, year)
YearlyTotal <- summarize(SubNEI, TotalEmissions = sum(Emissions))

plot(YearlyTotal$year, YearlyTotal$TotalEmissions, type = "l",
     xlab = "Year",
     ylab = "Total Tons of PM2.5 Emissions",
     main = "Year vs Total Tons of PM2.5 Emissions in the United States")

dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()

#Answer: The total emission has decreased over the years
#Have total emissions from PM2.5 decreased in the Baltimore City,
#Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

library(data.table)
library(dplyr)
library(ggplot2)
library(scales)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SubNEI <- subset(NEI, fips == "24510")
SubNEI <- group_by(SubNEI,year)
YearlyTotal <- summarize(SubNEI, TotalEmissions = sum(Emissions))

plot(YearlyTotal$year, YearlyTotal$TotalEmissions, type = "l",
      xlab = "Year",
      ylab = "Total Tons of PM2.5 Emissions",
      main = "Total Tons of PM2.5 Emissions in Baltimore City")

dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()

#Answer: The total emission had an overall decrease from 1999-2008
#but from the year 2002 to 2005 there is an increase.

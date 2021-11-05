#skip 1 to skip the heading of the data
Power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#According to qns we only use from 1/2/2007 to 2/2/2007
SubPower <- subset(Power,Power$Date=="1/2/2007" | Power$Date =="2/2/2007")

hist(as.numeric(as.character(SubPower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

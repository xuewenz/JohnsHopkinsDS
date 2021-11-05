Power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
SubPower <- subset(Power,Power$Date=="1/2/2007" | Power$Date =="2/2/2007")

SubPower$Date <- as.Date(SubPower$Date, format="%d/%m/%Y")
SubPower$Time <- strptime(SubPower$Time, format="%H:%M:%S")

#Need to reformat to the real date (1440 mins a day)
SubPower[1:1440,"Time"] <- format(SubPower[1:1440,"Time"],"2007-02-01 %H:%M:%S") 
SubPower[1441:2880,"Time"] <- format(SubPower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(SubPower$Time,as.numeric(as.character(SubPower$Global_active_power)),type="l",
                              xlab="",ylab="Global Active Power (kilowatts)")
title(main="Global Active Power Vs Time")


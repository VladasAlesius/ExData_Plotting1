#The purpose of this script is to demonstrate R plotting for electric power consumption data

library(data.table)

#Read data from the file
electric<-fread("./exdata_data_household_power_consumption/household_power_consumption.txt",na.strings="?")

#Convert date entries to a date format
electric$Date<-as.Date(electric$Date,format="%d/%m/%Y")

#Extract necessary entries to a separate dataset
electric2<-electric[electric$Date=="2007-02-01" | electric$Date=="2007-02-02",]

#Make a new variable combining date and time
electric2$Datetime<-as.POSIXct(paste(electric2$Date, electric2$Time))


#Plot 2
#A plot is initialized, but a line graph is added in the next step
plot(electric2$Datetime,electric2$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(electric2$Datetime,electric2$Global_active_power)
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
dev.off()



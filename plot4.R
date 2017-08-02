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


#Plot 4
#A plor area of 2x2 graphs is created
#cex=0.83 value is added to labels and axes to keep with graph size in 2x2 window
par(mfcol=c(2,2),cex.lab=0.83,cex.axis=0.83)

#The first two plots are very similar to plots 2 and 3

#Repeat plot 2

#A plot is initialized, but a line graph is added in the next step
plot(electric2$Datetime,electric2$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(electric2$Datetime,electric2$Global_active_power)

#Repeat plot 3

#A plot is initialized, but line graphs are added in the next step
plot(electric2$Datetime,electric2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(electric2$Datetime,electric2$Sub_metering_1)
lines(electric2$Datetime,electric2$Sub_metering_2,col="red")
lines(electric2$Datetime,electric2$Sub_metering_3,col="blue")

#For a legend, column names from electric2 dataset are chosen as labels
#Notice the legend has no border
#cex=0.83 value is added to the legend to keep with graph size in 2x2 window

legend("topright",colnames(electric2)[7:9],col=c("black","red","blue"),lty=1,bty="n",cex=0.83)

#Draw new ones

#Plots are initialized, but line graphs are added in the next steps
plot(electric2$Datetime,electric2$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(electric2$Datetime,electric2$Voltage)
plot(electric2$Datetime,electric2$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(electric2$Datetime,electric2$Global_reactive_power)
dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
dev.off()
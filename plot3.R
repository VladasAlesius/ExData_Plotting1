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


#Plot 3
#A plot is initialized, but line graphs are added in the next step
plot(electric2$Datetime,electric2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(electric2$Datetime,electric2$Sub_metering_1)
lines(electric2$Datetime,electric2$Sub_metering_2,col="red")
lines(electric2$Datetime,electric2$Sub_metering_3,col="blue")

#For a legend, column names from electric2 dataset are chosen as labels
#cex=0.8 is inserted to match the example
legend("topright",colnames(electric2)[7:9],col=c("black","red","blue"),lty=1, cex=0.8)
dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()



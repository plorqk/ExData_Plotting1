data <- read.csv("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2879, na.strings="?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#we do this so we can get Thu, Fri, Sat to appear on x axis when we plot the data/time
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480,height=480)
par(mfrow=c(2,2))
with(data, {
    #first plot
    plot(data$DateTime,data$Global_active_power, ylab="Global Active Power",xlab="",type="l")
    #second plot
    plot(data$DateTime,data$Voltage,ylab="Voltage",xlab="datetime", type="l")
    #third plot
    plot(data$DateTime,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
    points(data$DateTime, data$Sub_metering_1,col="black",type="l")
    points(data$DateTime, data$Sub_metering_2,col="red",type="l")
    points(data$DateTime, data$Sub_metering_3,col="blue",type="l")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1), cex=0.9, bty="n")
    #fourthplot
    plot(data$DateTime,data$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")    
})

dev.off()
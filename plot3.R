data <- read.csv("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2879, na.strings="?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#we do this so we can get Thu, Fri, Sat to appear on x axis when we plot the data/time
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480,height=480)
plot(data$DateTime,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
points(data$DateTime, data$Sub_metering_1,col="black",type="l")
points(data$DateTime, data$Sub_metering_2,col="red",type="l")
points(data$DateTime, data$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1))
dev.off()
data <- read.csv("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2879, na.strings="?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#we do this so we can get Thu, Fri, Sat to appear on x axis when we plot the data/time
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480,height=480)
plot(data$DateTime,data$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
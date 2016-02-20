#Source code for plot3.
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime, format= "%d/%m/%Y %H:%M:%S")
datasub <- subset(data, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday == 1 | DateTime$mday == 2) )
png(filename = "plot3.png", height = 480, width = 480)

plot(datasub$DateTime, datasub$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(datasub$DateTime, datasub$Sub_metering_2, col="red")
lines(datasub$DateTime, datasub$Sub_metering_3, col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=2)
dev.off()

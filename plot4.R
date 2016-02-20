#Source code for plot4

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime, format= "%d/%m/%Y %H:%M:%S")
datasub <- subset(data, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday == 1 | DateTime$mday == 2) )
png(filename = "plot4.png", height = 480, width = 480)

par(mfrow=c(2,2))
with(datasub, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") )

with(datasub, plot(DateTime, Voltage,type="l", ylab="Voltage", xlab="datetime") )

with(datasub, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") )
with(datasub, lines(DateTime, Sub_metering_2, col="red") )
with(datasub, lines(DateTime, Sub_metering_3, col="blue") )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=2)

with(datasub, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime") )

dev.off()

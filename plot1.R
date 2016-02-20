#Histogram chart for Global Active Power

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime, format= "%d/%m/%Y %H:%M:%S")
datasub <- subset(data, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday == 1 | DateTime$mday == 2) )
png(filename = "plot1.png", height = 480, weidth = 480)
hist(datasub$Global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)" )

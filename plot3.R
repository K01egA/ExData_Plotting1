data <- read.csv2("household_power_consumption.txt", as.is=T, na.strings="?")
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL
data[,2:8] <- sapply(data[,2:8], as.numeric)

Sys.setlocale("LC_TIME", "English")  # Windows
png('plot3.png', width=480, height=480)
plot(data$Date, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, type="l", col="red", main="fwef")
lines(data$Date, data$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()

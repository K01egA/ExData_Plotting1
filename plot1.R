data <- read.csv2("household_power_consumption.txt", as.is=T, na.strings="?")
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL
data[,2:8] <- sapply(data[,2:8], as.numeric)

png('plot1.png', width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

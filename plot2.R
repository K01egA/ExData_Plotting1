data <- read.csv2("household_power_consumption.txt", as.is=T, na.strings="?")
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL
data[,2:8] <- sapply(data[,2:8], as.numeric)

Sys.setlocale("LC_TIME", "English")  # Windows
png('plot2.png', width=480, height=480)
plot(data$Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

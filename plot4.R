# pre-processing
readin <- read.csv("household_power_consumption.txt", stringsAsFactors = F, sep=";")
data <- subset(readin, Date=="1/2/2007" | Date=="2/2/2007")
for (i in 3:9) {
  data[,i] = as.numeric(data[,i])
}
data$Date2 <- paste(data$Date, data$Time, sep=" ")
data$Date2 <- strptime(data$Date2, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2))

# left upper corner
plot(data$Date2, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# right upper corner
plot(data$Date2, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# left lower corner
plot(data$Date2, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date2, data$Sub_metering_2, type="l", col="red")
lines(data$Date2, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty=c(1,1,1),
col=c("black","red","blue"),
bty="n",
cex=0.95)

# right lower corner
plot(data$Date2, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
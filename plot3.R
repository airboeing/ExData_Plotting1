# pre-processing
readin <- read.csv("household_power_consumption.txt", stringsAsFactors = F, sep=";")
data <- subset(readin, Date=="1/2/2007" | Date=="2/2/2007")
for (i in 3:9) {
  data[,i] = as.numeric(data[,i])
}
data$Date2 <- paste(data$Date, data$Time, sep=" ")
data$Date2 <- strptime(data$Date2, "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480, bg = "transparent")
plot(data$Date2, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date2, data$Sub_metering_2, type="l", col="red")
lines(data$Date2, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty=c(1,1,1),
col=c("black","red","blue"))
dev.off()
# pre-processing
# readin <- read.csv("household_power_consumption.txt", stringsAsFactors = F, sep=";")
data <- subset(readin, Date=="1/2/2007" | Date=="2/2/2007")
for (i in 3:9) {
  data[,i] = as.numeric(data[,i])
}
data$Date2 <- paste(data$Date, data$Time, sep=" ")
data$Date2 <- strptime(data$Date2, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(data$Date3, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
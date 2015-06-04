# My script to extract data and make plots for
# Exploratory Data Analysis Project 1
# Initial file "household_power_consumption.txt" should be placed in working directory
# prior to run this script.

# Load data from txt file
data_init <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Extract only the data that we need
d1 <- subset(data_init, Date == "1/2/2007")
d2 <- subset(data_init, Date == "2/2/2007")
data <- rbind(d1, d2)

# Subvert the first two columns to proper class
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

# Construct the plot and create png file
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

png(filename="plot3.png", width = 480, height = 480)

plot(data$Sub_metering_1, type="l", xaxt = "n", xlab = "", ylab="Energy sub metering")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col=c("black", "red", "blue"))

dev.off()
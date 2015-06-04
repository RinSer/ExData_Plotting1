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

# Construct the first plot and create png file
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

png(filename="plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
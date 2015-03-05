# Plot 3

# Reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subsetting data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

#Date & Time paste
data$Date <- as.POSIXlt(paste(data$Date, data$Time, sep=" "))


#Plotting
png("plot3.png", width=480, height=480)
par(mar=c(5, 5, 3, 1))

plot(data$Date, data$Sub_metering_1, type="n", lwd=1, 
     ylim=c(0, max(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")

lines(data$Date, data$Sub_metering_1, col="black")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))


dev.off()

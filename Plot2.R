# Plot 2

# Reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subsetting data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

#Date & Time paste
data$Date <- as.POSIXlt(paste(data$Date, data$Time, sep=" "))


#Plotting
png("plot2.png", width=480, height=480)
par(mar=c(5, 5, 3, 1))
plot(data$Date,data$Global_active_power,type = "l", xlab = "",ylab="Global Active Power (kilowatts)")
dev.off()

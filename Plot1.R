  # Plot 1
  
  # Reading data
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  #Subsetting data
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  data <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
  
  #Plotting
  png("plot1.png", width=480, height=480)
  par(mar=c(5, 5, 3, 1))
  hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()

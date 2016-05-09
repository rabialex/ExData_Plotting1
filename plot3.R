##Plot 3 Date Time and submeter data
##Read in data and SubsetData for specified Dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,dec = ".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##Variables for plot
dateTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subMeter1 <- as.numeric(subdata$Sub_metering_1)
subMeter2 <- as.numeric(subdata$Sub_metering_2)
subMeter3 <- as.numeric(subdata$Sub_metering_3)


##Date Time and submeter data Plot
png("plot3.png", width = 480, height = 480)
plot(dateTime,subMeter1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dateTime, subMeter2, type = "l", col = "red")
lines(dateTime, subMeter3, type = "l", col = "blue")

legend("topright", c("Sub_Meter_1", "Sub_Meter_2", "Sub_Meter_3"),lty = 1,lwd = 1, col = c("black", "red", "blue"))
dev.off()
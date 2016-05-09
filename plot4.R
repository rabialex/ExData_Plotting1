##Plot 4; Four graphs one File
##Read in data and SubsetData for specified Dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,dec = ".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Variable for Plot 4.1 and 4.2
dateTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##Variable for Plot 4.1
GlobalActivePower <- as.numeric(subdata$Global_active_power)

##Variable for Plot 4.2
subMeter1 <- as.numeric(subdata$Sub_metering_1)
subMeter2 <- as.numeric(subdata$Sub_metering_2)
subMeter3 <- as.numeric(subdata$Sub_metering_3)

##Variable for Plot 4.3
voltage <- as.numeric(subdata$Voltage)

##Variable for Plot 4.4
GlobalReactivePower <- as.numeric(subdata$Global_reactive_power)

## Four Plots
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

##Plot 4.1
plot(dateTime,GlobalActivePower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##Plot 4.2
plot(dateTime,subMeter1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dateTime, subMeter2, type = "l", col = "red")
lines(dateTime, subMeter3, type = "l", col = "blue")

legend("topright", c("Sub_Meter_1", "Sub_Meter_2", "Sub_Meter_3"), lty = 1,lwd = 1, col = c("black","red","blue"), bty = "n")

##Plot 4.3
plot(dateTime,voltage, type = "l", ylab = "Voltage", xlab = "datetime")

##Plot 4.4
plot(dateTime,GlobalActivePower, type = "l", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()
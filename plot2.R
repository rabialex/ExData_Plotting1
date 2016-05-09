##Plot 2 DateTime vs Global Active Power
##Read in data and subset data for specified Dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,dec = ".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##create dateTime Variable from subset data
dateTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##Global active power variable from subset data 
GlobalActivePower <- as.numeric(subdata$Global_active_power)

##plot for DateTime vs Global Active Power
png("plot2.png", width = 480, height = 480)
plot(dateTime,GlobalActivePower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
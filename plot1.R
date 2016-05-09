##Plot 1 Global Active Power Histogram
##Read in data and SubsetData for specified Dates
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,dec = ".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Extract variable of interest
GlobalActivePower <- as.numeric(subdata$Global_active_power)

#Plot historgram for Globale Active Power
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()
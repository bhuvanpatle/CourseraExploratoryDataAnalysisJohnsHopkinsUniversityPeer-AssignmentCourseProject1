# Composite Plot with Four Panels

# Read in the dataset
powerData <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";", 
                        stringsAsFactors = FALSE, 
                        dec = ".")

# Filter the data for the dates 1/2/2007 and 2/2/2007
filteredData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Build a datetime object from the Date and Time columns
dateTimeObj <- strptime(paste(filteredData$Date, filteredData$Time), 
                        format = "%d/%m/%Y %H:%M:%S")

# Convert variables to numeric as needed
globalActPower <- as.numeric(filteredData$Global_active_power)
voltageData   <- as.numeric(filteredData$Voltage)
globalReactPower <- as.numeric(filteredData$Global_reactive_power)
subMeter1     <- as.numeric(filteredData$Sub_metering_1)
subMeter2     <- as.numeric(filteredData$Sub_metering_2)
subMeter3     <- as.numeric(filteredData$Sub_metering_3)

# Open PNG device and set up a 2x2 plotting area
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left: Global Active Power
plot(dateTimeObj, globalActPower, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

# Top-right: Voltage
plot(dateTimeObj, voltageData, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# Bottom-left: Energy Sub-Metering
plot(dateTimeObj, subMeter1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy Submetering")
lines(dateTimeObj, subMeter2, col = "red")
lines(dateTimeObj, subMeter3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1, 
       lwd = 2, 
       bty = "n")

# Bottom-right: Global Reactive Power
plot(dateTimeObj, globalReactPower, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global Reactive Power")
dev.off()
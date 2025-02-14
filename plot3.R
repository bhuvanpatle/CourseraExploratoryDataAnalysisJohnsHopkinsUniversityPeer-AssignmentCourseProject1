# Energy Sub-Metering Time Series
# Read in the dataset
powerData <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";", 
                        stringsAsFactors = FALSE, 
                        dec = ".")

# Filter the data for the two days of interest
filteredData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Build a datetime object from Date and Time
dateTimeObj <- strptime(paste(filteredData$Date, filteredData$Time), 
                        format = "%d/%m/%Y %H:%M:%S")

# Convert sub-metering columns to numeric
subMeter1 <- as.numeric(filteredData$Sub_metering_1)
subMeter2 <- as.numeric(filteredData$Sub_metering_2)
subMeter3 <- as.numeric(filteredData$Sub_metering_3)

# Create the plot with three sub-metering time series
png("plot3.png", width = 480, height = 480)
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
       lwd = 2)
dev.off()

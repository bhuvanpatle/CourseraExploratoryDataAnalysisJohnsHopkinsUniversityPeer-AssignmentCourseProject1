# Time Series of Global Active Power
# Read in the dataset
powerData <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";", 
                        stringsAsFactors = FALSE, 
                        dec = ".")

# Filter for the required dates
filteredData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create a POSIXlt datetime object by combining Date and Time
dateTimeObj <- strptime(paste(filteredData$Date, filteredData$Time), 
                        format = "%d/%m/%Y %H:%M:%S")

# Convert Global_active_power to numeric
globalActPower <- as.numeric(filteredData$Global_active_power)

# Plot the time series and save as plot2.png
png("plot2.png", width = 480, height = 480)
plot(dateTimeObj, globalActPower, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
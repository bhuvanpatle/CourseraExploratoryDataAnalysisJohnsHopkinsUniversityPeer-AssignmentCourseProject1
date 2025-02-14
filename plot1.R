# Histogram of Global Active Power
# Read in the power consumption dataset
powerData <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";", 
                        stringsAsFactors = FALSE, 
                        dec = ".")

# Subset data for the dates 1/2/2007 and 2/2/2007
filteredData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert the Global_active_power column to numeric
globalActPower <- as.numeric(filteredData$Global_active_power)

# Open PNG device, create the histogram, and then close the device
png("plot1.png", width = 480, height = 480)
hist(globalActPower, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
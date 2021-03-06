#Author: Minhazul Islam Sk
#plot2.R - Plotting the time series representation of Global Active Power

# Read the data in R
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
#Convert the Date and Time variables to Date/Time classes in R 
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%Y %H:%M:%S")
#Subset the data from the dates 2007-02-01 and 2007-02-02 from the whole dataset
data <- subset(data, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

# Initializing the plot2.png
png("plot2.png", height=480, width=480)

# Plotting the time series representation of Global Active Power
plot(data$DateTime, 
     data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# Close the "plot2.png" file
dev.off()
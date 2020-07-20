library("data.table")

setwd("C:/Users/52558/Documents/R/data")

#Read the data

power<- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date 

power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates in the period 2007-02-01 to 2007-02-02
power<- power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

# Plot2
plot(x = power[, dateTime]
     , y = power[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

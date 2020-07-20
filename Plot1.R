library("data.table")

setwd("C:/Users/52558/Documents/R/data")

#Read the data

power<- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
                             
power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to dd/mm/yyyy

power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates in the period 2007-02-01 to 2007-02-02

power <- power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

# Plot1

hist(power[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

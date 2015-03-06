Sys.setlocale("LC_TIME", "C")
# Getting dataset
filename <- "~/data/household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", 
                   colClasses = c("character", "character", rep("numeric",7)), na = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# take subset of data
datasub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
# dates and time formatting
newdatetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$DateTime <- as.POSIXct(newdatetime)
# creating graphics device as png
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
# make Plots 4
par(mfrow = c(2, 2))
plot(datasub$DateTime, datasub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
plot(datasub$DateTime, datasub$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(datasub$DateTime, datasub$Sub_metering_1, type = "l",  col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(datasub$DateTime, datasub$Sub_metering_2, col = "red")
lines(datasub$DateTime, datasub$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datasub$DateTime, datasub$Global_reactive_power, type = "l", col = "black",
     xlab = "datetime", ylab = "Global_rective_power")
# shut down graphics device
dev.off()
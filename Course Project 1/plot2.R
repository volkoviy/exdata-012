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
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
# make Plot 2
plot(datasub$DateTime, datasub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
# shut down graphics device
dev.off()
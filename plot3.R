# set working directory
setwd("~/MOOC - Data Science/Part 4/Week 1")

# read data
data <- read.table("household_power_consumption.txt", skip = 66637 , 
                   nrows = 2880, sep = ";", na.strings = "?")

# read and assign cloumn names
colnames(data) <- unlist(read.table("household_power_consumption.txt",
                                    nrows = 1, sep = ";"))

# create a new date and time as a date/time format
data$DateTime <- strptime(paste(as.Date(data$Date, "%d/%m/%Y"),
                                data$Time), "%Y-%m-%d %H:%M:%S")

# draw to file
png(filename = "plot3.png", width = 480, height = 480)

with(data, {
        plot(DateTime, Sub_metering_1, "l", xlab = "",
                ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
        }
     )
legend("topright", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 1)

dev.off()

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

# draw the histogram
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = 'red')

# create png file of the histogram
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
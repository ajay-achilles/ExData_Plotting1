# Plot2
# Reading data into table
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("character","character",rep("numeric",7)))
plot2data <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
head(plot2data)
# Convert time into R type
combine <- with(plot2data,paste(Date,Time))
day <- strptime(combine, "%d/%m/%Y %H:%M:%S")
# Plotting histogram into png device machine.
png("plot2.png", width = 480, height = 480, units = "px")
plot(day,plot2data$Global_active_power, type="l",xlab = "", 
     ylab="Global Active Power (killowatts)")
dev.off()
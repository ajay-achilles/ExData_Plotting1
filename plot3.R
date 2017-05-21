# Plot3
# Reading data into table
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("character","character",rep("numeric",7)))
plot3data <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
head(plot3data)
# Convert time into R type
combine <- with(subdata,paste(Date,Time))
day <- strptime(combine, "%d/%m/%Y %H:%M:%S")
# Plotting histogram into png device machine.
png("plot3.png", width = 480, height = 480, units = "px")
attach(plot3data)
plot(day, Sub_metering_1, type="l",xlab = "", ylab="Energy sub metering")
lines(day, Sub_metering_2, col="red")
lines(day, Sub_metering_3, col="blue")
legend("topright",lwd=1,col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
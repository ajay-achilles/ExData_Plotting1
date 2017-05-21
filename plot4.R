# Plot4
# Reading data into table
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("character","character",rep("numeric",7)))
plot4data <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
head(plot4data)
# Converting time into R type
combine <- with(plot4data,paste(Date,Time))
day <- strptime(combine, "%d/%m/%Y %H:%M:%S")
# Plotting histogram into png device machine.
png("plot4.png", width = 480, height = 480, units = "px")

# Separating the graph
par(mfrow=c(2,2))
attach(plot4data)
plot(day,plot4data$Global_active_power, type="l",xlab = "", 
     ylab="Global Active Power")
plot(day,plot4data$Voltage, type="l", ylab="Voltage",
     xlab="datetime")
plot(day, Sub_metering_1, type="l", xlab = "",ylab="Energy sub metering")
lines(day, Sub_metering_2, col="red")
lines(day, Sub_metering_3, col="blue")
legend("topright",lwd=1,col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")
plot(day, Global_reactive_power, type="l", xlab="datatime")
dev.off()
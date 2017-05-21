# Plot1
# Reading data into a table
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("character","character",rep("numeric",7)))
plot1data <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
head(plot1data)
# Plotting histogram into png device machine.
png("plot1.png", width = 480, height = 480, units = "px")
hist(plot1data$Global_active_power,col="red", 
     main="Global Active Power",xlab="Global Active Power (killowatts)",
     breaks=12, ylim=c(0,1200))
dev.off()

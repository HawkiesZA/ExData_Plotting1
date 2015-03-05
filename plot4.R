# Read in the file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
# Subset the data to between 1 and 2 Feb 2007
sub <- power_consumption_sub <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")

# Grab the date and time and get it into something that a plot can use
dt <- paste(power_consumption_sub$Date, power_consumption_sub$Time)
dt <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

# Open up a file to plot to
png("plot4.png")
# Create the graphs
par(mfrow=c(2,2))
# Graph 1 - top left
plot(dt, power_consumption_sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Graph 2 - top right
plot(dt, power_consumption_sub$Voltage, type="l", ylab="Voltage", xlab="datetime")

# Graph 3 - bottom left
plot(dt, power_consumption_sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dt, power_consumption_sub$Sub_metering_2, col="red")
lines(dt, power_consumption_sub$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), xjust=1, seg.len=1.5, bty="n")

# Graph 4 - bottom right
plot(dt, power_consumption_sub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
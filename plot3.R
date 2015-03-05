# Read in the file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
# Subset the data to between 1 and 2 Feb 2007
sub <- power_consumption_sub <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")

# Grab the date and time and get it into something that a plot can use
dt <- paste(power_consumption_sub$Date, power_consumption_sub$Time)
dt <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

# Open up a file to plot to
png("plot3.png")
# Create the graph
plot(dt, power_consumption_sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dt, power_consumption_sub$Sub_metering_2, col="red")
lines(dt, power_consumption_sub$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), xjust=1, seg.len=1.5)
dev.off()
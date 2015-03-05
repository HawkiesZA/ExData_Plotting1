# Read in the file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
# Subset the data to between 1 and 2 Feb 2007
sub <- power_consumption_sub <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")

# Grab the date and time and get it into something that a plot can use
dt <- paste(power_consumption_sub$Date, power_consumption_sub$Time)
dt <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

# Open up a file to plot to
png("plot2.png")
# Create the graph
plot(dt, power_consumption_sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
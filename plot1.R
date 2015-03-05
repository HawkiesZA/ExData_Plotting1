# Read in the file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
# Subset the data to between 1 and 2 Feb 2007
sub <- power_consumption_sub <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")
# Open up a file to plot to
png("plot1.png")
# Create the graph
with(power_consumption_sub, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power" ))
dev.off()
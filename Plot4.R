##read the data and select the right dates
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
plotdata <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]

##combine the date and time into one variable
x <- paste(plotdata$Date, plotdata$Time)
longtime <- strptime(x, "%d/%m/%Y %H:%M:%S")

##create a 2 x 2 area for charts
par(mfrow=c(2,2))

##create each of the 4 plots
plot(longtime,plotdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(longtime,plotdata$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(longtime,plotdata$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
points(longtime,plotdata$Sub_metering_1, type="l")
points(longtime,plotdata$Sub_metering_2, type="l", col="red")
points(longtime,plotdata$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.8, ncol=1.1, bty="n")
plot(longtime,plotdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

##save a copy of the charts
dev.copy(png,file="plot4.png")
dev.off()

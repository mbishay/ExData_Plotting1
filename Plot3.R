##read the data and select the correct date
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")[,c(1:2,7,8,9)]
plotdata <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]

##combin the date and time into one variable
x <- paste(plotdata$Date, plotdata$Time)
longtime <- strptime(x, "%d/%m/%Y %H:%M:%S")

##set the margin to make chart more readable
par(mar=c(6,6,4,2))

##setup the plot, chart the three lines, and then the legend
plot(longtime,plotdata$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
points(longtime,plotdata$Sub_metering_1, type="l")
points(longtime,plotdata$Sub_metering_2, type="l", col="red")
points(longtime,plotdata$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.8, ncol=1.1)

##save a copy of the chart
dev.copy(png,file="plot3.png")
dev.off()

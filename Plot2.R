##read the data into a table and select the right dates
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")[,1:3]
plotdata <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]

##combine the date and time into one variable
x <- paste(plotdata$Date, plotdata$Time)
longtime <- strptime(x, "%d/%m/%Y %H:%M:%S")

## set the margin to make chart more readable
par(mar=c(5,5,4,2))

##plot the line graph
plot(longtime,plotdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##save a copy of the chart
dev.copy(png,file="plot2.png")
dev.off()

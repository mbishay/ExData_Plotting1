## read data into a table and select the correct dates
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")[,c(1,3)]
plotdata <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]

##set the margins to make the chart more readable
par(mar=c(5,5,4,2))

##generate the histogram
hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", mar=c(4,5,4,2))

##save a copy of the plot
dev.copy(png,file="plot1.png")
dev.off()

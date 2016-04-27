#download and uzip data set
if(!file.exists("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")){
	url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(url, "PowerConsumption.zip")
	unzip("PowerConsumption.zip", exdir="PowerConsumption")
}

#Read data
power <- read.table("./PowerConsumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#subset dates to 2007-Feb
power2 <- power[(power$Date=="1/2/2007")|(power$Date=="2/2/2007"),]

#create new variable (column) of combine Date and Time
power2$DateTime <- strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width=480, height=480)  #open PNG device
plot3 <- with(power2, {
		plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
		lines(DateTime, Sub_metering_2, type="l", col="red")
		lines(DateTime, Sub_metering_3, type="l", col="blue")      #create plot3
		legend("topright", lty=1, col=c("black", "red", "blue"), 
			c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))    #add legend
	})
dev.off()      #close PNG device

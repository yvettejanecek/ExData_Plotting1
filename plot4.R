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

#combine Date and Time
DateTime <- strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width=480, height=480)  #open PNG device
plot4 <- par(mfrow=c(2,2))
	#create plot 4-1
	plot(power2$DateTime, power2$Global_active_power, type="l", xlab="", ylab="Global Active Power")      	
	#create plot 4-2
	plot(power2$DateTime, power2$Voltage, type="l", xlab="datetime", ylab="Voltage")
	#create plot 4-3
	with(power2, {
		plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
		lines(DateTime, Sub_metering_2, type="l", col="red")
		lines(DateTime, Sub_metering_3, type="l", col="blue")      
		legend("topright", lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))    
	})
	#create plot 4-4
	plot(power2$DateTime, power2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()      #close PNG device

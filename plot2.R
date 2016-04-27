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

png(file = "plot2.png", width=480, height=480)  #open PNG device
plot2 <- plot(power2$DateTime, power2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")      #create plot2
dev.off()      #close PNG device

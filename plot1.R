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

png(file = "plot1.png", width=480, height=480)  #open PNG device
plot1 <- hist(power2$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", breaks=12, xlim=c(0,6), ylim=c(0,1200))      #create plot1
dev.off()      #close PNG device

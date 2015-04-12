setwd("c:/R-Neto/data")
getwd()
download.file ( "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip","c:/R-Neto/data/hhh.zip")
unzip("hhh.zip")
dataE <- read.csv("c:/R-Neto/data/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataE$Date <- as.Date(dataE$Date, format="%d/%m/%Y")
data <- subset(dataE, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataE)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
     plot(Global_active_power~Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="")
     plot(Voltage~Datetime, type="l", 
          ylab="Voltage (volt)", xlab="")
     plot(Sub_metering_1~Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="")
     lines(Sub_metering_2~Datetime,col='Red')
     lines(Sub_metering_3~Datetime,col='Blue')
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power~Datetime, type="l", 
          ylab="Global Rective Power (kilowatts)",xlab="")
 })
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
 
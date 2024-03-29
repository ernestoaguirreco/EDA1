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
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
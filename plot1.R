## *********************************************************
## plot 1
setwd("c:/R-Neto/data/datos")
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","c:/R-Neto/data/datos/hhh.zip")
unzip("hhh.zip")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
Totales <- aggregate(Emissions ~ year,NEI, sum)
png("plot1.png",width=480,height=480,units="px",bg="transparent")
barplot(
(Totales$Emissions)/10^6,
names.arg=Totales$year,
xlab="year",
ylab="Emissions PM2.5 (10^6 Tons)",
main=" Total emissions from PM2.5 decreased in the USA from 1999 to 2008")
dev.off()
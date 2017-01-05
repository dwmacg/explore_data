library(downloader)
library(rio)
elecdata<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(elecdata, dest="electricuse.zip", mode="wb")
unzip ("electricuse.zip", exdir = "./")


convert("household_power_consumption.txt","householdconsumption.csv")
elec <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"), dec=".")

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec<-subset(elec, Date<="2007-02-02")
elec<-subset(elec, Date>="2007-02-01")
elec$Time<-paste(elec$Date, elec$Time)
elec$Time<-strptime(elec$Time, "%Y-%m-%d %H:%M:%S")


hist(elec$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.print(device=png, file="plot1.png", width=480, height=480)
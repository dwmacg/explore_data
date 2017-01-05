elec <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"), dec=".")

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec<-subset(elec, Date<="2007-02-02")
elec<-subset(elec, Date>="2007-02-01")
elec$Time<-paste(elec$Date, elec$Time)
elec$Time<-strptime(elec$Time, "%Y-%m-%d %H:%M:%S")


with(elec, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.print(device=png, file="plot2.png", width=480, height=480)
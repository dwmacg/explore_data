elec <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"), dec=".")

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec<-subset(elec, Date<="2007-02-02")
elec<-subset(elec, Date>="2007-02-01")
elec$Time<-paste(elec$Date, elec$Time)
elec$Time<-strptime(elec$Time, "%Y-%m-%d %H:%M:%S")
elec$Global_active_power<-as.numeric(elec$Global_active_power)

par(mfrow=c(2,2))
with(elec, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts"))
with(elec, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(elec, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(elec, points(Time, Sub_metering_2, type = "l", col="red"))
with(elec, points(Time, Sub_metering_3, type = "l", col="blue"))
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(elec, plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))


dev.print(device=png, file="plot4.png", width=480, height=480)
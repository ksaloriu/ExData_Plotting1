library(dplyr)

if (!("d2" %in% ls())) {
    f <- unz('exdata_data_household_power_consumption.zip',
         filename='household_power_consumption.txt')
    d <- read.table(f, header=T, sep=";", stringsAsFactors=F, na.strings="?")
    d2 <- filter(d, Date == "1/2/2007" | Date == "2/2/2007")
}

dt <- paste(d2$Date, d2$Time, sep=" ")
dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
opar <- par(no.readonly=T)
par(mfrow=c(2,2))

plot(dt, d2$Global_active_power, type='l',
     ylab="Global Active Power",
     xlab="")

plot(dt, d2$Voltage, type='l',
     ylab="Voltage",
     xlab="")

plot(dt, d2$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(dt, d2$Sub_metering_2, type='l', col="red")
lines(dt, d2$Sub_metering_3, type='l', col="blue")
legend("topright",
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
       lty=1,
       col=c("black", "red", "blue"))

plot(dt, d2$Global_reactive_power, type='l',
     ylab="Global Reactive Power",
     xlab="")
par(opar)
dev.off()

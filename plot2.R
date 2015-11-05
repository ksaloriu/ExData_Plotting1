library(dplyr)

if (!("d2" %in% ls())) {
    f <- unz('exdata_data_household_power_consumption.zip',
         filename='household_power_consumption.txt')
    d <- read.table(f, header=T, sep=";", stringsAsFactors=F, na.strings="?")
    d2 <- filter(d, Date == "1/2/2007" | Date == "2/2/2007")
}

dt <- paste(d2$Date, d2$Time, sep=" ")
dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(dt, d2$Global_active_power, type='l',
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()

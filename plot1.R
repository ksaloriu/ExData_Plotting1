library(dplyr)

if (!("d2" %in% ls())) {
    f <- unz('exdata_data_household_power_consumption.zip',
         filename='household_power_consumption.txt')
    d <- read.table(f, header=T, sep=";", stringsAsFactors=F, na.strings="?")
    d2 <- filter(d, Date == "1/2/2007" | Date == "2/2/2007")
}

png("plot1.png", width=480, height=480)
hist(d2$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")
dev.off()

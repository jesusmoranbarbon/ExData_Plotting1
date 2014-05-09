data <- read.table("household_power_consumption.txt", header=FALSE, nrows=2880, skip=66637, sep=";", na.strings="?")
names(data) <- read.table("household_power_consumption.txt", nrows=1, header=FALSE, colClasses="character", sep=";")[1, ]
hist(data$ Global_active_power, col="red", main="Golbal Active Power", xlab="Global Active Power (kilowatts)", ylab="Frecuency")
dev.copy(png, file="plot1.png")
dev.off()
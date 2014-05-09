data <- read.table("household_power_consumption.txt", header=FALSE, nrows=2880, skip=66637, sep=";", na.strings="?")
names(data) <- read.table("household_power_consumption.txt", nrows=1, header=FALSE, colClasses="character", sep=";")[1, ]

#Add the days to the table
data$WeekDay <- weekdays(as.Date(as.character(data$Date), format="%d/%m/%Y"))

#Calculate the next two days and translate to english
first_day_spain <- levels(as.factor(data$WeekDay[1]))
dates_spain <- c("lunes", "martes", "miercoles", "jueves", "viernes", "sabado", "domingo")
dates_english <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
pos_first_day <- which(dates_spain==first_day_spain)
days <- dates_english[pos_first_day]
pos_second_day <- pos_first_day + 1
if (pos_second_day>length(dates_english))
  pos_second_day <- 1
days <- c(days, dates_english[pos_second_day])
pos_third_day <- pos_second_day + 1
if (pos_third_day>length(dates_english))
  pos_third_day <- 1
days <- c(days, dates_english[pos_third_day])

#Plot
plot(data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")
axis(1, at=c(1, round(nrow(data)/2), nrow(data)), labels=days)


dev.copy(png, file="plot2.png")
dev.off()

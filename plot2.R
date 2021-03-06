function () 
{
    library(dplyr)
    data <- read.table(file = "household_power_consumption.txt", 
        sep = ";")
    data <- data[-1, ]
    data$V1 <- as.Date(data$V1, "%d/%m/%Y")
    data <- filter(data, V1 >= "2007-02-01" & V1 <= "2007-02-02")
    globalActPwr <- as.numeric(as.character(data$V3))
    calendar <- data$V1
    time <- data$V2
    calendarTime <- paste(calendar, time)
    calendarTime <- as.POSIXct(calendarTime, format = "%Y-%m-%d %H:%M:%S")
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    plot(calendarTime, globalActPwr, type = "n", xlab = "", ylab = "Global Active Power (kilwatts)")
    lines(calendarTime, globalActPwr)
    dev.off()
}

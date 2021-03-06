function () 
{
    library(dplyr)
    data <- read.table(file = "household_power_consumption.txt", 
        sep = ";")
    data <- data[-1, ]
    data$V1 <- as.Date(data$V1, "%d/%m/%Y")
    data <- filter(data, V1 >= "2007-02-01" & V1 <= "2007-02-02")
    png(filename = "plot4.png", width = 480, height = 480, units = "px")
    par(mfcol = c(2, 2))
    globalActPwr <- as.numeric(as.character(data$V3))
    calendar <- data$V1
    time <- data$V2
    calendarTime <- paste(calendar, time)
    calendarTime <- as.POSIXct(calendarTime, format = "%Y-%m-%d %H:%M:%S")
    plot(calendarTime, globalActPwr, type = "n", xlab = "", ylab = "Global Active Power")
    lines(calendarTime, globalActPwr)
    sm1 <- as.numeric(as.character(data$V7))
    sm2 <- as.numeric(as.character(data$V8))
    sm3 <- as.numeric(as.character(data$V9))
    plot(calendarTime, sm1, col = "black", type = "n", xlab = "", 
        ylab = "Energy sub metering")
    lines(calendarTime, sm1, col = "black")
    lines(calendarTime, sm2, col = "red")
    lines(calendarTime, sm3, col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", 
        "red", "blue"))
    voltage <- as.numeric(as.character(data$V5))
    plot(calendarTime, voltage, col = "black", type = "n", xlab = "datetime", 
        ylab = "Voltage")
    lines(calendarTime, voltage, col = "black")
    reactive <- as.numeric(as.character(data$V4))
    plot(calendarTime, reactive, col = "black", type = "n", xlab = "datetime", 
        ylab = "Global_reactive_power")
    lines(calendarTime, reactive, col = "black")
    dev.off()
}

function () 
{
    library(dplyr)
    data <- read.table(file = "household_power_consumption.txt", 
        sep = ";")
    data <- data[-1, ]
    data$V1 <- as.Date(data$V1, "%d/%m/%Y")
    data <- filter(data, V1 >= "2007-02-01" & V1 <= "2007-02-02")
    sm1 <- as.numeric(as.character(data$V7))
    sm2 <- as.numeric(as.character(data$V8))
    sm3 <- as.numeric(as.character(data$V9))
    calendar <- data$V1
    time <- data$V2
    calendarTime <- paste(calendar, time)
    calendarTime <- as.POSIXct(calendarTime, format = "%Y-%m-%d %H:%M:%S")
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    plot(calendarTime, sm1, col = "black", type = "n", xlab = "", 
        ylab = "Energy sub metering")
    lines(calendarTime, sm1, col = "black")
    lines(calendarTime, sm2, col = "red")
    lines(calendarTime, sm3, col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", 
        "red", "blue"))
    dev.off()
}

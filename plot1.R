function () 
{
    library(dplyr)
    data <- read.table(file = "household_power_consumption.txt", 
        sep = ";")
    data <- data[-1, ]
    data$V1 <- as.Date(data$V1, "%d/%m/%Y")
    data <- filter(data, V1 >= "2007-02-01" & V1 <= "2007-02-02")
    globalActPwr <- as.numeric(as.character(data$V3))
    png(filename = "plot1.png", width = 480, height = 480, units = "px")
    hist(globalActPwr, xlim = c(0, 6), ylim = c(0, 1200), col = "red", 
        xlab = "Global Active Power (kilowatts)", main = "Global Active Power", 
        breaks = seq(0, 8, by = 0.5), xaxt = "n", yaxt = "n")
    axis(side = 1, at = seq(0, 6, by = 2))
    axis(side = 2, at = seq(0, 1200, by = 200))
    dev.off()
}

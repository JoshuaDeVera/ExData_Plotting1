
library(dplyr)
household <- read.table("./household_power_consumption.txt", header = T, sep = ";")

household$Date <- as.Date(household$Date, format = "%d/%m/%Y") %>% format("%d/%m/%Y")


householdSubset <- household[household$Date == "01/02/2007" | household$Date ==  "02/02/2007",]
householdSubset[is.na(householdSubset)] <- "?"

householdSubset$Date <- as.Date(householdSubset$Date, format = "%d/%m/%Y") %>% format("%Y-%m-%d")
householdSubset$Time <- paste(householdSubset$Date, householdSubset$Time, sep = " ")
householdSubset$Time <- strptime(householdSubset$Time, format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480,
    units = "px")
plot(householdSubset$Time, as.numeric(as.character(householdSubset$Sub_metering_1)), type = "n", xlab = "", ylab = "Energy Sub Metering")
with(householdSubset, lines(householdSubset$Time, as.numeric(as.character(householdSubset$Sub_metering_1))))
with(householdSubset, lines(householdSubset$Time, as.numeric(as.character(householdSubset$Sub_metering_2)),col = "red"))
with(householdSubset, lines(householdSubset$Time, as.numeric(as.character(householdSubset$Sub_metering_3)), col = "blue"))
legend("topright", lty = 1, col = c("black", "red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()





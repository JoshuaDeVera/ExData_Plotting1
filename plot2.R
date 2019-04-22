
library(dplyr)
household <- read.table("./household_power_consumption.txt", header = T, sep = ";")

household$Date <- as.Date(household$Date, format = "%d/%m/%Y") %>% format("%d/%m/%Y")


householdSubset <- household[household$Date == "01/02/2007" | household$Date ==  "02/02/2007",]
householdSubset[is.na(householdSubset)] <- "?"

householdSubset$Date <- as.Date(householdSubset$Date, format = "%d/%m/%Y") %>% format("%Y-%m-%d")
householdSubset$Time <- paste(householdSubset$Date, householdSubset$Time, sep = " ")
householdSubset$Time <- strptime(householdSubset$Time, format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480,
    units = "px")
plot(householdSubset$Time, as.numeric(as.character(householdSubset$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()





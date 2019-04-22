
library(dplyr)
household <- read.table("./household_power_consumption.txt", header = T, sep = ";")

household$Date <- as.Date(household$Date, format = "%d/%m/%Y") %>% format("%d/%m/%Y")


householdSubset <- household[household$Date == "01/02/2007" | household$Date ==  "02/02/2007",]
householdSubset[is.na(householdSubset)] <- "?"

png("plot1.png", width = 480, height = 480,
    units = "px")
hist(as.numeric(as.character(householdSubset$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

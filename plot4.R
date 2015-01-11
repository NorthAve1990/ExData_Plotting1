## Plot 4
getwd()
setwd("C:/Users/ssomasundharam/Documents/Data Science/Coursera R/Exploratory Data Analysis")

## Read file and format the date
game_statistics <- read.csv("household_power_consumption.txt", header=T, sep=";")
game_statistics$Date <- as.Date(game_statistics$Date, format="%d/%m/%Y")

## Load dplyr package and filter required dates
library(dplyr)
gsdate <- filter(game_statistics, Date >= as.Date("2007-02-01"), Date <= as.Date("2007-02-02"))

## Free some memeory
rm(list = c("game_statistics"))

## Combine Date and Time
datetime <- paste(as.Date(gsdate$Date), gsdate$Time)
gsdate$Datetime <- as.POSIXct(datetime)

## Convert to numeric
# gap <- as.numeric(gsdate$Global_active_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(gsdate, {
    plot(Global_active_power~Datetime, type="l", 
    ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
    ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
    ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
    ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

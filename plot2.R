## Plot 2
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
gsdate$datetime <- as.POSIXct(datetime)

## Convert to numeric
gap <- as.numeric(gsdate$Global_active_power)

plot(gap~gsdate$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

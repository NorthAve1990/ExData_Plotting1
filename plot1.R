## Plot 1

getwd()
setwd("C:/Users/ssomasundharam/Documents/Data Science/Coursera R/Exploratory Data Analysis")

fname = file.choose()
game_statistics <- read.table(fname, header=T, sep=";")
game_statistics$Date <- as.Date(game_statistics$Date, format="%d/%m/%Y")

library(dplyr)
gsdate <- filter(game_statistics, Date >= as.Date("2007-02-01"), Date <= as.Date("2007-02-02"))

gsdt <- paste(gsdate$Date, gsdate$Time)
gsdt$datetime <- as.POSIXct(gsdt)

## Free some memeory
rm(list = c("game_statistics"))

gap <- as.numeric(gsdate$Global_active_power)
hist(gap, main = "Global Active Power", xlab = "Global Active Power", ylab = "Frequency", col = "red", breaks = 100)

dev.copy(png, file = "plot1.png")
dev.off()
getwd()

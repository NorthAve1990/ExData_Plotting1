## Plot 3

getwd()
setwd("C:/Users/ssomasundharam/Documents/Data Science/Coursera R/Exploratory Data Analysis")

fname = file.choose()
game_statistics <- read.table(fname, header=T, sep=";")
game_statistics$Date <- as.Date(game_statistics$Date, format="%d/%m/%Y")

# library(dplyr)
# gsdate <- filter(game_statistics, Date >= as.Date("2007-02-01"), Date <= as.Date("2007-02-02"))
gsdate <- subset(game_statistics, Date >= "2007-02-01" & Date <= "2007-02-02")
gsdt <- paste(as.Date(gsdate$Date), gsdate$Time)
gsdate$Datetime <- as.POSIXct(gsdt)

## Free some memeory
rm(list = c("game_statistics"))
gap <- as.numeric(gsdate$Global_active_power)

with(gsdate, {plot(Sub_metering_1~Datetime, type="l",
    ylab="Global Active Power (Kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=c(1, 1), lwd=c(2.5, 2.5), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# legend(2000,9.5, # places a legend at the appropriate place c("Health","Defense"), # puts text in the legend
#        lty=c(1,1), # gives the legend appropriate symbols (lines)
#        lwd=c(2.5,2.5),col=c("blue","red"))
       
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

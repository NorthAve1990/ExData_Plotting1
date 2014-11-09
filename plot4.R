## Plot 4

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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(gap, {plot(Global_active_power~Datetime, type="l", 
    ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
    ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
    ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~gsdt, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

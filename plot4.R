# Read all the data set

# For this code to work, data must be in the upper directory

energydata_full <- read.csv('./../household_power_consumption.txt', header=T, sep=';', na.string='?')

# Subset the data

energydata_full$Date <- as.Date(energydata_full$Date, format="%d/%m/%Y")
energydata <- subset(energydata_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert to Date and Time type formats

datetime <- paste(as.Date(energydata$Date), energydata$Time)
energydata$Datetime <- as.POSIXct(datetime)

# Plot 4

par(mfrow=c(2,2))

plot(energydata$Global_active_power~energydata$Datetime, type="l", ylab="Global Active Power", xlab="")

plot(energydata$Voltage~energydata$Datetime, type="l", ylab="Voltage", xlab="datetime")

plot(energydata$Sub_metering_1~energydata$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(energydata$Sub_metering_2~energydata$Datetime, col = "red")
lines(energydata$Sub_metering_3~energydata$Datetime, col = "blue")
legend("topright", lty = 1, lwd=2, bty="n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

plot(energydata$Global_reactive_power~energydata$Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")

# Save to a file

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

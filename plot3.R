# Read all the data set

# For this code to work, data must be in the upper directory

energydata_full <- read.csv('./../household_power_consumption.txt', header=T, sep=';', na.string='?')

# Subset the data

energydata_full$Date <- as.Date(energydata_full$Date, format="%d/%m/%Y")
energydata <- subset(energydata_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert to Date and Time type formats

datetime <- paste(as.Date(energydata$Date), energydata$Time)
energydata$Datetime <- as.POSIXct(datetime)

# Plot 3

plot(energydata$Sub_metering_1~energydata$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(energydata$Sub_metering_2~energydata$Datetime, col = "red")
lines(energydata$Sub_metering_3~energydata$Datetime, col = "blue")
legend("topright", lty = 1, lwd = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

# Save to a file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

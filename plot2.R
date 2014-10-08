# Read all the data set

# For this code to work, data must be in the upper directory

energydata_full <- read.csv('./../household_power_consumption.txt', header=T, sep=';', na.string='?')

# Subset the data

energydata_full$Date <- as.Date(energydata_full$Date, format="%d/%m/%Y")
energydata <- subset(energydata_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert to Date and Time type formats

datetime <- paste(as.Date(energydata$Date), energydata$Time)
energydata$Datetime <- as.POSIXct(datetime)

# Plot 2

plot(energydata$Global_active_power~energydata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save to a file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

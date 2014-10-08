# Read all the data set

energydata_full <- read.csv('./../household_power_consumption.txt', header=T, sep=';', na.string='?')

# Convert to Date and Time type formats

energydata_full$Date <- as.Date(energydata_full$Date, format="%d/%m/%Y")
energydata_full$Time <- strptime(energydata_full$Time, format="%H:%M:%S")

# Subset the data

energydata <- subset(energydata_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot the histogram

hist(energydata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to a file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

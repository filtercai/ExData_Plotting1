##################
# Prepare the data
# use egrep(linux or Mac) command to read data just required dates
# it will require long time if read all the data 
#
tdata <- read.table(
  pipe("egrep -e \"Date|^[1,2]/2/2007\" data/household_power_consumption.txt"),
  sep = ";",header = TRUE, na.string = "?",
  colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

tdata$datetime <- strptime(paste(tdata$Date,tdata$Time),format="%d/%m/%Y %H:%M:%S")

################
# plot
#
hist(tdata$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
)

# save the png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
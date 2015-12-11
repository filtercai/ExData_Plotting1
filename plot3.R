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
Sys.setlocale("LC_TIME", "C")

with(tdata,{
  plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_1, type = "l", col = "black")
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")})

# add the legend
legend("topright",lty = 1,
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# save the png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
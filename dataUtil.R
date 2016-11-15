

# Get Data filtered by grep -----------------------------------------------

courseData <- function() {
  #Store the name of the file
  dataname <- file("household_power_consumption.txt")
  #Filter the data through reading lines with grep
  
  
  data1 <- read.table(text = grep("^[1,2]/2/2007", readLines(dataname), value = TRUE), 
                     header = TRUE, as.is = TRUE, sep = ";",
                     colClasses=c("character", "character", rep("numeric",7)),
                     col.names = c("Date", "Time", "Global_active_power", 
                                   "Global_reactive_power", "Voltage", "Global_intensity", 
                                   "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
 close(dataname) 
 
 #Put date and time Together
  data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
  
 
return(data1)
}


# First Plot --------------------------------------------------------------

makePlot1 <- function(x) {
  png("plot1.png", width=480, height=480)
  
  hist(x$Global_active_power,
       main = paste("Global Active Power"), 
       xlab = "Global Active Power (kilowatts)",
       col="red")
  
  dev.off()
}


# Second Plot -------------------------------------------------------------

makePlot2 <- function(x) {
  png("plot2.png", width=480, height=480)
  
  plot(x$Time, x$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  
  dev.off()
}


# Third Plot --------------------------------------------------------------

makePlot3 <- function(x) {
  
  png("plot3.png", width=480, height=480)


plot(x$Time, x$Sub_metering_1, col="black", ylab="Energy sub metering", type = "line", xlab = "")
lines(x$Time, x$Sub_metering_2, col="red")
lines(x$Time, x$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2)

dev.off()
}


# Fourth Plot -------------------------------------------------------------

makePlot4 <- function(x) {
  
  png("plot4.png", width=480, height=480)
  
  par(mfcol=c(2,2))
  #Plot the first one
  plot(x$Time, x$Global_active_power, type = "line", ylab = "Global Active Power", xlab = "")
  #Plot the second one
  plot(x$Time, x$Sub_metering_1, col="black", ylab="Energy sub metering", type = "line", xlab = "")
  lines(x$Time, x$Sub_metering_2, col="red")
  lines(x$Time, x$Sub_metering_3, col="blue")
  legend("topright",col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2)
  #Plot the third one
  plot(x$Time, x$Voltage, type = "line", ylab = "Voltage", xlab = "datetime")
  #Plot the fourth one
  plot(x$Time, x$Global_reactive_power, type = "line", ylab = "Global_rective_power", xlab = "datetime")

  dev.off()
}

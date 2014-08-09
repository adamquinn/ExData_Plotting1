plot4 <- function() {
  
  myData <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  slimFrame <- sqldf("select * from myData where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  slimFrame$NewDate <- as.Date(slimFrame$Date,format="%d/%m/%Y")
  slimFrame$DateTime <- strptime(paste(slimFrame$Date,slimFrame$Time), "%d/%m/%Y %H:%M:%S")
  
  png(filename = "Plot4.png", bg="white", width=480, height=480)
  par(mfrow=c(2,2))
  plot(slimFrame$DateTime,as.numeric(slimFrame$Global_active_power),type="l",cex.axis=1.1,cex.lab=1.1,ylab = "Global Active Power",xlab="")
  plot(slimFrame$DateTime,as.numeric(slimFrame$Voltage),type="l",cex.axis=1.1,cex.lab=1.1,ylab = "Voltage",xlab="datetime")
  plot(slimFrame$DateTime,as.numeric(slimFrame$Sub_metering_1),type="l",cex.axis=1.1,cex.lab=1.1,ylab = "Energy sub metering",xlab="",col="black")
    lines(slimFrame$DateTime,as.numeric(slimFrame$Sub_metering_2),type="l",col="red")
    lines(slimFrame$DateTime,as.numeric(slimFrame$Sub_metering_3),type="l", col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), col=c("black","red","blue"), bty="n") 
  plot(slimFrame$DateTime,as.numeric(slimFrame$Global_reactive_power),type="l",cex.axis=1.1,cex.lab=1.1,ylab = "Global_reactive_power",xlab="datetime")
  dev.off() 
  
}
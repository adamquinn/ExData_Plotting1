plot2 <- function(){
  myData <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  slimFrame <- sqldf("select * from myData where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  slimFrame$NewDate <- as.Date(slimFrame$Date,format="%d/%m/%Y")
  slimFrame$DateTime <- strptime(paste(slimFrame$Date,slimFrame$Time), "%d/%m/%Y %H:%M:%S")
  
  ###2###
  png(filename = "Plot2.png", bg="white", width=480, height=480)
  plot(slimFrame$DateTime,as.numeric(slimFrame$Global_active_power),type="l",cex.axis=1,cex.lab=1,ylab = "Global Active Power (kilowatts)",xlab="")
  dev.off()
  
  
  
}
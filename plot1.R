 plot1 <- function() {
    
   myData <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
   slimFrame <- sqldf("select * from myData where Date = '1/2/2007' OR Date = '2/2/2007'")
   

   png(filename = "Plot1.png", bg="white", width=480, height=480)
   hist(as.numeric(slimFrame$Global_active_power),cex.axis=1,cex.lab=1,cex.main=1.2,font.main=2,col="red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
   dev.off()  
 }
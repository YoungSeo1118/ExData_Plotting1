setwd("/Users/macintosh/Downloads")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

dev.copy(png, file="plot4.png", height=480, width=480)

par(mfrow=c(2,2))
with(data1,{plot(Global_active_power~Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime,type="l",ylab="Voltage",xlab="datetime")
  plot(Sub_metering_1~Datetime,type="l",xlab="",ylab="Energy sub metering"); lines(Sub_metering_2~Datetime,col="red");lines(Sub_metering_3~Datetime,col="blue"); legend("topright",col=c("black","red","blue"),lty=c(1,1),lwd=2,bty="n",cex=0.75,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Datetime,type="l",ylab="Global_reactive_power",xlab="datetime")})

dev.off()

#set up directory
setwd("B:/DATABASE")
#read data
ehpc<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors =FALSE)
subehpc<-subset(epconsumption,Date=="1/2/2007" | Date=="2/2/2007")
#remove NA data
subehpc<-na.omit(subehpc)
library(lubridate)
daytime<-paste(as.Date(subehpc$Date,"%d/%m/%Y"),subehpc$Time)
subehpc$DateTime<-as.POSIXct(daytime)
par(mar=c(4,4,2,2))
par(mfrow=c(2,2))
with(subehpc,plot(Global_active_power~DateTime,type="l",ylab="Global Active Power",xlab=" "))
with(subehpc,plot(Voltage~DateTime,type="l",xlab="datetime"))
with(subehpc,plot(Sub_metering_1~DateTime,type="l",xlab=" ",ylab="Energy sub metering"))
with(subehpc,lines(Sub_metering_2~DateTime,col="red"))
with(subehpc,lines(Sub_metering_3~DateTime,col="blue"))
with(subehpc,legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,cex=0.5,col=c("black","red","blue")))
with(subehpc,plot(Global_reactive_power~DateTime,type="l",xlab="datetime",yaxt="n"))
axis(2, seq(0,0.5,0.1),las=2)
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

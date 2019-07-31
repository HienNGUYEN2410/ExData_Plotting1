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
with(subehpc,plot(Sub_metering_1~DateTime, type="l",xlab=" ",ylab="Energy sub metering"))
with(subehpc,lines(Sub_metering_2~DateTime, col="red"))
with(subehpc,lines(Sub_metering_3~DateTime,col="blue"))
with(subehpc,legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue")))
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

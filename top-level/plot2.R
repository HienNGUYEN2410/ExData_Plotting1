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
with(subehpc,plot(Global_active_power~DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab=" "))
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()

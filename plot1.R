#set up directory
setwd("B:/DATABASE")
#read data
ehpc<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors =FALSE)
subehpc<-subset(epconsumption,Date=="1/2/2007" | Date=="2/2/2007")
#remove NA data
subehpc<-na.omit(subehpc)
##PLot 1
hist(as.numeric(subehpc$Global_active_power),col="red",main="Global Active Power",yaxt="n",xlab="Global Active Power (kilowatts)")
axis(2, seq(0,1200,200),las=2)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

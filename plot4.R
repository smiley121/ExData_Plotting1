## R script to create set of time series for Coursera Exploratory Data Analysis course
library(dplyr, lubridate)

## read the data file

hpc<-read.table("household_power_consumption.txt", header=T, sep=";")

#cast the dates as such

hpc<-mutate(hpc,Date=dmy(Date))

##filter for the days we're interested in

hpc<-filter(hpc,Date=="2007-02-01"|Date=="2007-02-02")

##create compound timestamps

hpc<-mutate(hpc,datetime=Date+hms(Time))

##cast the various time series as numeric

hpc<-mutate(hpc,Global_active_power=as.numeric(as.character(Global_active_power)))
hpc<-mutate(hpc,Global_reactive_power=as.numeric(as.character(Global_reactive_power)))
hpc<-mutate(hpc,Voltage=as.numeric(as.character(Voltage)))
hpc<-mutate(hpc,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
hpc<-mutate(hpc,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
hpc<-mutate(hpc,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))

##Set up the multiple plots

par(mfrow=c(2,2))

png("plot4.png")

##Global active power

plot(hpc$datetime,hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##Voltage

plot(hpc$datetime,hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

##The three submeterings

plot(hpc$datetime,hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$datetime,hpc$Sub_metering_2,col="red")
lines(hpc$datetime,hpc$Sub_metering_3,col="blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "),lty=1,bty="n",cex=0.5)

##Global reactive power

plot(hpc$datetime,hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
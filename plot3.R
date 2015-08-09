## R script to create three submetering time series for Coursera Exploratory Data Analysis course
library(dplyr, lubridate)

## read the data file

hpc<-read.table("household_power_consumption.txt", header=T, sep=";")

#cast the dates as such

hpc<-mutate(hpc,Date=dmy(Date))

##filter for the days we're interested in

hpc<-filter(hpc,Date=="2007-02-01"|Date=="2007-02-02")

##create compound timestamps

hpc<-mutate(hpc,datetime=Date+hms(Time))

##cast the various sub-meterings as numeric

hpc<-mutate(hpc,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
hpc<-mutate(hpc,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
hpc<-mutate(hpc,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))

##plot the three timeseries

png("plot3.png")

plot(hpc$datetime,hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$datetime,hpc$Sub_metering_2,col="red")
lines(hpc$datetime,hpc$Sub_metering_3,col="blue")

##add legend

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

dev.off()
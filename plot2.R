## R script to create Global Active Power time series for Coursera Exploratory Data Analysis course
library(dplyr, lubridate)

## read the data file

hpc<-read.table("household_power_consumption.txt", header=T, sep=";")

#cast the dates as such

hpc<-mutate(hpc,Date=dmy(Date))

##filter for the days we're interested in

hpc<-filter(hpc,Date=="2007-02-01"|Date=="2007-02-02")

##create compound timestamps

hpc<-mutate(hpc,datetime=Date+hms(Time))

##cast Global active power as numeric

hpc<-mutate(hpc,Global_active_power=as.numeric(as.character(Global_active_power)))

##plot the timeseries

png("plot2.png")
plot(hpc$datetime,hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
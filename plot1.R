## R script to create Global Active Power histogram for Coursera Exploratory Data Analysis course
library(dplyr, lubridate)

## read the data file

hpc<-read.table("household_power_consumption.txt", header=T, sep=";")

##cast the dates as such

hpc<-mutate(hpc,Date=dmy(Date))

##filter for the days we're interested in

hpc<-filter(hpc,Date=="2007-02-01"|Date=="2007-02-02")

##cast Global active power as numeric

hpc<-mutate(hpc,Global_active_power=as.numeric(as.character(Global_active_power)))

##plot the histogram

png("plot1.png")
hist(hpc$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()



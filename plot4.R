# Course Project 1
# Exploratory Data Analysis
# agosto 2015

# Francisco Zambrano Bigiarini (frzambra@gmail.com)

#Plot 4

setwd("~/coursera/Exploratory_Data_Analysis/course_project_1")
list.files('data')
data <- read.csv2('data/household_power_consumption.txt',dec='.',na.strings="?",colClasses=c('character','character',rep("numeric",7)))
head(data)

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
dataSub <- subset(data,Date%in%c(as.Date("2007-02-01"),as.Date("2007-02-02")))

png('plot4.png')
par(mfcol=c(2,2))
plot(dataSub$Time,dataSub$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab="")
plot(dataSub$Time,dataSub$Sub_metering_1,col="black",type='l',xlab="", ylab="Energy sub metering")
lines(dataSub$Time,dataSub$Sub_metering_2,col="red",type='l')
lines(dataSub$Time,dataSub$Sub_metering_3,col="blue",type='l')
legend("topright",names(dataSub)[7:9],lty=c(1,1,1),col=c("black","red","blue"),box.lwd=0)

plot(dataSub$Time,dataSub$Voltage,type='l',xlab='dateTime',ylab='Voltage')
plot(dataSub$Time,dataSub[,4],type='l',xlab='dateTime',ylab='Global_reactive_power')
dev.off()
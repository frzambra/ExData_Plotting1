# Course Project 1
# Exploratory Data Analysis
# agosto 2015

# Francisco Zambrano Bigiarini (frzambra@gmail.com)

#Plot 3

setwd("~/coursera/Exploratory_Data_Analysis/course_project_1")
list.files('data')
data <- read.csv2('data/household_power_consumption.txt',dec='.',na.strings="?",colClasses=c('character','character',rep("numeric",7)))
head(data)

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
dataSub <- subset(data,Date%in%c(as.Date("2007-02-01"),as.Date("2007-02-02")))

png('plot3.png')
plot(dataSub$Time,dataSub$Sub_metering_1,col="black",type='l',xlab="", ylab="Energy sub metering")
lines(dataSub$Time,dataSub$Sub_metering_2,col="red",type='l')
lines(dataSub$Time,dataSub$Sub_metering_3,col="blue",type='l')
legend("topright",names(dataSub)[7:9],lty=c(1,1,1),col=c("black","red","blue"),box.lwd=0)
dev.off()
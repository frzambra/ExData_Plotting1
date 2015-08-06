# Course Project 1
# Exploratory Data Analysis
# agosto 2015

# Francisco Zambrano Bigiarini (frzambra@gmail.com)

#Plot 2

setwd("~/coursera/Exploratory_Data_Analysis/course_project_1")
list.files('data')
data <- read.csv2('data/household_power_consumption.txt',dec='.',na.strings="?",colClasses=c('character','character',rep("numeric",7)))
head(data)

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
dataSub <- subset(data,Date%in%c(as.Date("2007-02-01"),as.Date("2007-02-02")))

dataSub$Time <- as.POSIXlt(paste0(dataSub$Date," ",dataSub$Time),format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME","en_GB.UTF-8")
png(filename='plot2.png')
plot(dataSub$Time,dataSub$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab="")
dev.off()
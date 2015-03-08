
# set working directory (individual, you may specify it yourself)
setwd('~/R/Coursera_Exploratory_Data_Analysis')

# loading packages we'll use later
library(data.table)
library(lubridate)

# check if folder for source data exists, otherwise create it
if (!file.exists('data')) {
  dir.create('data')
}
  
# download the zip file and unzip it
url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, destfile='exdata-data-household_power_consumption.zip')
unzip('exdata-data-household_power_consumption.zip', exdir='data', overwrite=TRUE)

# reading the whole file
# seting the classes for data by columns to make reading faster
column_classes <- c(rep('character',2),rep('numeric',7))

# seting column names
column_names <- 

# reading source data into the data table
power <- read.table('data/exdata-data-household_power_consumption.txt', header=TRUE, sep = ';', na.strings = '?', colClasses = column_classes)

# subsetting the required dates and rewriting the data teble
power <- power[power$Date=='1/2/2007' | power$Date=='2/2/2007',]

# putting date and time together and making it the first column
power$DateTime <-  dmy(power2$Date, tz = "UTC") + hms(power2$Time)
power <- power[,c(10,3:9)]

# building plots
# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# naming the plot file
filename <- 'plot1.png'

# buiding plot
setwd('~/R/Coursera_Exploratory_Data_Analysis/plots')
png(filename,  width = 480, height = 480, units = "px")
hist(power$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
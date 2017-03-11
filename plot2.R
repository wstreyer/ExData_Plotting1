## Coursera - Data Science Specialization
## Exploratory Data Analysis - Week 1 Project
## Will Streyer
## Script 2 of 4

## Load libraries
library(lubridate)
library(readr)

## Download data, unzip data
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
my_path <- file.path(getwd(), "hpc.zip")
download.file(url1, my_path)
unzip(my_path)

## Read data and select dates
hpc <- read_delim(dir()[grep("power",dir())], 
                  delim=";", na = "?",
                  col_types = "ccddddddd")
my_dates <- hpc[,1] == "1/2/2007" | hpc[,1] == "2/2/2007"
hpc <- hpc[my_dates,]

## Convert date and time to datetime
hpc[,"datetime"] <- dmy_hms(paste(unlist(hpc[,1]), unlist(hpc[,2])))

## Send plot to png file
## Note that default height, width = (480,480)
png("plot2.png")

## Plot2: Global active Power line plot
plot(hpc$datetime , hpc$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="l")

##Close graphics device
dev.off()

## Coursera - Data Science Specialization
## Exploratory Data Analysis - Week 1 Project
## Will Streyer
## Script 3 of 4

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
png("plot3.png")

## Plot3: Sub-metering
with(hpc, {
plot(datetime , Sub_metering_1, #Initialize plot with first series
     col="black",
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime , Sub_metering_2, col="red") #add second series
lines(datetime , Sub_metering_3, col="blue") #add thrid series
legend("topright", 
       legend = names(hpc)[7:9], 
       col = c("black", "red", "blue"),
       lty = "solid")
})

##Close graphics device
dev.off()

###Question 1
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission 
##from all sources for each of the years 1999, 2002, 2005, and 2008.

library(downloader)

setwd("C:/Users/toppa/Dropbox/01 ACEDEMIC/00 Data Science/Course 4 EDA/Project")

###Download Data
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip")
pm <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
data <- with(NEI, aggregate(Emissions, by = list(year), sum))
#head(data,3)

###Ploting 
png("Plot 1 PM2.5 Emission.png")
plot(data, type = "o",xlab = "Year", ylab = "PM2.5", col = "Red", main = "PM2.5 Emissions", pch = 19)
dev.off()
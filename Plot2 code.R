###Question 2
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.

###require package 
library(downloader)
###Setting directory
setwd("C:/Users/toppa/Dropbox/01 ACEDEMIC/00 Data Science/Course 4 EDA/Project")


###Download Data
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip")
pm <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
data <- with(NEI, aggregate(Emissions, by = list(year), sum))
#head(data,3)

###Extract pm2.5 data from Baltimore, MD based on source code
bat <- subset(pm, fips == "24510")
###tabulate data by pm2.5 emission and year 
bat2 <- tapply(bat$Emissions, bat$year, sum)
###Plotting 
png("Plot 2 PM 2.5 Emission from Baltimore MD.png")
plot(bat2, type = "o", xlab = "Year", ylab = "PM2.5", pch = 19, col = "blue",, main = "PM2.5 Emissions in Baltimore, MD")
dev.off()
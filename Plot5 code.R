###Question 5
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
###require package 
library(downloader)
library(ggplot2)
###Setting directory
setwd("C:/Users/toppa/Dropbox/01 ACEDEMIC/00 Data Science/Course 4 EDA/Project")


###Download Data
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip")
pm <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
data <- with(NEI, aggregate(Emissions, by = list(year), sum))

##Exact data 
batmoto <- subset(pm, fips == "24510" & type=="ON-ROAD")
##Aggregate data
batagg2 <- aggregate(batmoto[c("Emissions")], list(type = batmoto$type, year = batmoto$year, zip = batmoto$fips), sum)

##Plottting
png("Plot 5 Emission by motocycle in Baltimore MD.png")
qplot(year, Emissions, data = batagg2, geom= "line") + theme_gray()  + xlab("Year") + ylab("Emission Levels")+ ggtitle("Emissions in Baltimore MD (moto)")
dev.off()





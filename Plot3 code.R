###Question 3
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##Which have seen increases in emissions from 1999-2008? 
##Use the ggplot2 plotting system to make a plot answer this question.



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
#head(data,3)

##extract pm data for Bat MD
bat <- subset(pm, fips == "24510")
##aggregate data by type (point, onroad,etc.) and year 
batagg <- aggregate(bat[c("Emissions")], list(type = bat$type, year = bat$year), sum)
##ggplot 
png("Plot 3 PM 2.5 by Source Types.png")
qplot(year, Emissions, data = batagg, color = type, geom= "line")
+xlab("Year")+ylab("PM2.5")+ggtitle("PM2.5 Emissions in Baltimore,MD by Source Types") 
dev.off()
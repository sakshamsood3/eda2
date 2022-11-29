###Question 6
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
##Which city has seen greater changes over time in motor vehicle emissions?


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
##BAT
batmoto <- subset(pm, fips == "24510" & type=="ON-ROAD")
##LA
logs <- subset(pm, fips == "06037" & type=="ON-ROAD")
##Aggregate data BAT
batagg2 <- aggregate(batmoto[c("Emissions")], list(type = batmoto$type, year = batmoto$year, zip = batmoto$fips), sum)
##Aggregate data LA
logagg <- aggregate(logs[c("Emissions")], list(type = logs$type, year = logs$year, zip = logs$fips), sum)
##combine data between LA and Baltimore 
aggcomp<- rbind(batagg2, logagg)

png("Plot6 Emission Comparison between Baltimore and LA")
qplot(year, Emissions, data = aggcomp, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Emissions Comparison Between Baltimore and LA") + xlab("Year") + ylab("Emission Levels")  
dev.off()
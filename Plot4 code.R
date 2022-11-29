###Question 4
##Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
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

coal <- cc[grepl("Coal" , cc$Short.Name),]
#head(coal)
pm2 <- pm[pm$SCC %in% coal$SCC,]
#head(pm2)
#dim(pm2)

###Plotting
png("Plot4 PM2.5 by Coal.png")
ggplot(pm2, aes(x = factor(pm2$year), y = pm2$Emissions, fill =pm2$type)) + geom_bar(stat= "identity") + xlab("year") +ylab("PM2.5 by Coal") + ggtitle("PM2.5 Emissions (Coal)")
dev.off()
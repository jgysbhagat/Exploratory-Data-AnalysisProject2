setwd("/Users/jigyasabhagat/Desktop/coursera/Exploratory Data Analysis")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")


baltimore_emission=subset(NEI,NEI$fips=="24510")
total_emissions_baltimore=tapply(baltimore_emission$Emissions,baltimore_emission$year,sum)
png("plot2_Project2.png",width = 480, height = 480)
barplot(height = total_emissions_baltimore,names.arg = unique(baltimore_emission$year),main="Total PM2.5 Emissions for different years in Baltimore",xlab="Years")
dev.off()
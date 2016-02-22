
```{r}
setwd("/Users/jigyasabhagat/Desktop/coursera/Exploratory Data Analysis")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
```

```{r}
class(NEI$year)
NEI$year=as.factor(NEI$year)
total_emissions_peryear=tapply(NEI$Emissions,NEI$year,sum)
yrange=c(3000000,8000000)
png("plot1.png",width = 480, height = 480)
barplot(height = total_emissions_peryear,names.arg = unique(NEI$year),ylim=yrange,main="Total PM2.5 Emissions for different years")
dev.off()

```




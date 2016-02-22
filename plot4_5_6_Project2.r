NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
SCC_coal=SCC[grep("coal",SCC$Short.Name,ignore.case = T),]%>%
    select(.,SCC,Short.Name)
join_data=merge(NEI,SCC_coal,by ="SCC")

total_emissions=tapply(join_data$Emissions,join_data$year,sum)
png("plot4_Project2.png",width = 480, height = 480)
barplot(height = total_emissions,names.arg = unique(join_data$year),main="Total PM2.5 Emissions for different years related to coal",xlab="Years")
dev.off()

#Plot 5
baltimore_emission_vehicles=subset(NEI,NEI$fips=="24510"&NEI$type=="ON-ROAD")
total_emissions_ba_veh=tapply(baltimore_emission_vehicles$Emissions,baltimore_emission_vehicles$year,sum)
png("plot5_Project2.png",width = 480, height = 480)
barplot(height = total_emissions_ba_veh,names.arg = unique(baltimore_emission_vehicles$year),main="Total PM2.5 Emissions for different years from Motor Vehicles in Baltimore",xlab="Years")
dev.off()


#Plot 6
la_emission_vehicles=subset(NEI,NEI$fips=="06037" & NEI$type=="ON-ROAD")
total_emissions_la_veh=tapply(la_emission_vehicles$Emissions,la_emission_vehicles$year,sum)
png("plot6_Project2.png",width = 480, height = 480)
par(mfrow=c(1,2))
barplot(height = total_emissions_ba_veh,names.arg = unique(baltimore_emission_vehicles$year),main="Baltimore",xlab="Years",ylim = c(300,4500),ylab="Total PM2.5 emissions from Motor Vehicles")
barplot(height = total_emissions_la_veh,names.arg = unique(la_emission_vehicles$year),main="los Angeles",xlab="Years",ylim = c(300,4500))
dev.off()
#OR
veh_subset=subset(NEI,NEI$type=="ON-ROAD" & (NEI$fips=="24510"|NEI$fips=="06037"))
tabe=tapply(veh_subset$Emissions,list(veh_subset$fips,veh_subset$year),sum)
tabe_df=as.data.frame(tabe)
tabe_df$fips=c("la","ba")
ong_tabe=gather(tabe_df,"year","tota",1:4)
ggplot(data = ong_tabe,aes(year,tota))+geom_bar(stat="identity")+facet_wrap(~fips,ncol = 2)+theme_bw()



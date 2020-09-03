library(data.table)
library(dplyr)
library(lubridate)
workdirectory<-"D:/workspace/R/ExData_Plotting1/exdata_data_household_power_consumption"
setwd(workdirectory)
filetoread<-"household_power_consumption.txt"
housepower<-fread(filetoread)
workdirectory<-"D:/workspace/R/ExData_Plotting1"
setwd(workdirectory)
workdata<-mutate(housepower,Date=dmy(Date),Time=hms(Time))
workdataf<-subset(workdata,(workdata$Date>="2007-02-01")&(workdata$Date<="2007-02-02"))
#Ploi 1
hist(as.numeric(workdataf$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts")

#Plot 2
a<-as.numeric(workdataf$Global_active_power)
b<-weekdays(workdataf$Date)

with(workdataf,plot(as.numeric(Global_active_power),type="l"))

with(workdataf,plot(y=as.numeric(Global_active_power),x=Date,type="l"))

with(workdataf,plot(as.numeric(Global_active_power)~Time,type="l"))